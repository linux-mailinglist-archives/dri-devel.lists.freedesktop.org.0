Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFBB1A7B09
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B346E075;
	Tue, 14 Apr 2020 12:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EA36E075
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/POKEOLp9vZEVM8oe9bfw+hku4DjEqFg+cEEJO5a6SA=;
 b=LwitRFAFFlR74gfPd73DxycdvFXay5jMKwrMvyMY50osO/WaIg1ABFklrCKyfQTu5z0HQb
 YKKHPgoT4kVStMDd/b7L1XMdSrX3HS3dibV1Q3OAoT8jJZnfQwZS7YhyVWJRb+3ahWfC23
 TRSEwRC+i1vxtbM+L1tdkGXnDLfsdro=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-GLgZxyWGO8uzvH0muglTxQ-1; Tue, 14 Apr 2020 08:43:31 -0400
X-MC-Unique: GLgZxyWGO8uzvH0muglTxQ-1
Received: by mail-wr1-f72.google.com with SMTP id h14so8598199wrr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fP9JfUaepQl9AEXacvfinBkYRVU9dDq3rlCP1SQpCoc=;
 b=q5EUqs+fv24AcNwaFjSqZDdIyNwtD/3l2GL1qvuDEjFJusWeBEOxfIIPgYzwuEEV+Q
 35Sg6SnBF9TOGlPHvmKBFG/XxNY5So7QlxKtf6RHkU9shfWswfn7XnhM1uRPJhkKQTkg
 qtHJxkM+yc2uows4g7QwOQB56fryPVMv/8uBsFbO115qfpMGxN5bxzPX5U496RosF9fj
 U266mBxb4k2nNXDZYNXUpy551uEDyjwTVk4rHKuSmkUAUj56JHEO5hx4MANc7TnRfj9I
 6iFCgTQPX2t0SnOs0DudmAUtPNo62ayn1cdGtl4SYaXOqCZm6ig4UQZE0zbdJs0G5Tzz
 qzhA==
X-Gm-Message-State: AGi0Pubzap5tl+ShP12H9YukwbZOfSRj1QQYC/Ce4cSdV87EBMp4bxYj
 TgebNTd6MebHQMGNYz2/KzMyes9jRDRIbsZXjAMJoFMNWU8ISczQM1SJnRAStUqevgmlYMz9alu
 5RYUNpN4+qTz+xNqQ7T3SurNfz/Ay
X-Received: by 2002:adf:97cc:: with SMTP id t12mr22402289wrb.261.1586868209900; 
 Tue, 14 Apr 2020 05:43:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ2dTzegIg0xIyb6oIhZwO+Fw/tjfTAynP0eIvP7y2y/+ilzA1Tw1zlCJEMAy5qMTHNiP27og==
X-Received: by 2002:adf:97cc:: with SMTP id t12mr22402243wrb.261.1586868209612; 
 Tue, 14 Apr 2020 05:43:29 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:43:28 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 0/8] Simplefs: group and simplify linux fs code
Date: Tue, 14 Apr 2020 14:42:54 +0200
Message-Id: <20200414124304.4470-1-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 linux-s390@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Mark Fasheh <mark@fasheh.com>,
 Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>,
 James Morris <jmorris@namei.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 oprofile-list@lists.sf.net, Yonghong Song <yhs@fb.com>,
 Ian Kent <raven@themaw.net>, Andrii Nakryiko <andriin@fb.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 netdev@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Uma Krishnan <ukrishn@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Iurii Zaikin <yzaikin@google.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Colin Cross <ccross@android.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, ocfs2-devel@oss.oracle.com,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series of patches introduce wrappers for functions,
arguments simplification in functions calls and most importantly
groups duplicated code in a single header, simplefs, to avoid redundancy
in the linux fs, especially debugfs and tracefs.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Emanuele Giuseppe Esposito (8):
  apparmor: just use vfs_kern_mount to make .null
  fs: extract simple_pin/release_fs to separate files
  fs: wrap simple_pin_fs/simple_release_fs arguments in a struct
  fs: introduce simple_new_inode
  simplefs: add alloc_anon_inode wrapper
  simplefs: add file creation functions
  debugfs: switch to simplefs inode creation API
  tracefs: switch to simplefs inode creation API

 arch/powerpc/platforms/cell/spufs/inode.c |   4 +-
 arch/s390/hypfs/inode.c                   |   4 +-
 drivers/gpu/drm/Kconfig                   |   1 +
 drivers/gpu/drm/drm_drv.c                 |  13 +-
 drivers/infiniband/hw/qib/qib_fs.c        |   6 +-
 drivers/misc/cxl/Kconfig                  |   1 +
 drivers/misc/cxl/api.c                    |  14 +-
 drivers/misc/ibmasm/ibmasmfs.c            |   8 +-
 drivers/misc/ocxl/Kconfig                 |   1 +
 drivers/oprofile/oprofilefs.c             |   8 +-
 drivers/scsi/cxlflash/ocxl_hw.c           |  15 +-
 drivers/usb/gadget/function/f_fs.c        |   8 +-
 fs/Kconfig                                |   3 +
 fs/Kconfig.binfmt                         |   1 +
 fs/Makefile                               |   1 +
 fs/autofs/inode.c                         |   4 +-
 fs/binfmt_misc.c                          |  27 +--
 fs/configfs/Kconfig                       |   1 +
 fs/configfs/mount.c                       |  12 +-
 fs/debugfs/inode.c                        | 171 +++----------------
 fs/efivarfs/inode.c                       |   4 +-
 fs/fuse/control.c                         |   4 +-
 fs/hugetlbfs/inode.c                      |   8 +-
 fs/libfs.c                                |  48 ++----
 fs/ocfs2/dlmfs/dlmfs.c                    |   8 +-
 fs/proc/base.c                            |   4 +-
 fs/proc/proc_sysctl.c                     |   5 +-
 fs/pstore/inode.c                         |  14 +-
 fs/ramfs/inode.c                          |   4 +-
 fs/simplefs.c                             | 194 ++++++++++++++++++++++
 fs/tracefs/inode.c                        | 108 ++----------
 include/linux/fs.h                        |   3 +-
 include/linux/simplefs.h                  |  36 ++++
 ipc/mqueue.c                              |   4 +-
 kernel/bpf/inode.c                        |   7 +-
 lib/Kconfig.debug                         |  16 +-
 mm/shmem.c                                |   4 +-
 net/sunrpc/rpc_pipe.c                     |   4 +-
 security/Kconfig                          |   1 +
 security/apparmor/apparmorfs.c            |  48 +++---
 security/inode.c                          |  17 +-
 41 files changed, 385 insertions(+), 459 deletions(-)
 create mode 100644 fs/simplefs.c
 create mode 100644 include/linux/simplefs.h

-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
