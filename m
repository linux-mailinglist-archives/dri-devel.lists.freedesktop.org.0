Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4DFAE2119
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 19:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7851D10EBA7;
	Fri, 20 Jun 2025 17:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WC3YSTNe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1E410E0E3;
 Thu, 19 Jun 2025 17:48:16 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-32b855b468bso9819981fa.3; 
 Thu, 19 Jun 2025 10:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750355295; x=1750960095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YvO5fzYLvhWnXwDLeu0osljtoe46Ll4TNlde5gM445I=;
 b=WC3YSTNebnWwWyz1FFGNKzaJ1xtUYoOeFJzgvQXOPpj1gxbqDx69uBTzL7nQkLkPQd
 +p7/LfKfRXP2CDOlHU5t60FqxLEzjOPhcn8Nm/4RudeSk1ew/dEQRYdm7GD4TcSTaJ3Z
 kDVeF2Z3HHbJ4KFCh8uJ6+vta2wBBNtIXjR2EmVJVl/EJEp+ivwK0/l9Pz0h/y60rmzf
 FZTdni2fxXslQIe15co0U/pJWXuS0KbMO8OhFkTh3xJ+nSt5TO4exU6S+XhGWI7Y8enN
 Js2AHsfRc6DGwkhSUIYKHdjasI6xco2Grbcdjw+esI+JuOA8lm2odpbFNq0EMV/IEhno
 N3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750355295; x=1750960095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YvO5fzYLvhWnXwDLeu0osljtoe46Ll4TNlde5gM445I=;
 b=gsTWIUgrNhRZ0WKcNxljaLC2sbApEpKn8AjQ5kMeKRObwLkGhqvAjFAGIPT/W+3QFE
 sJbWiXSIhyFX2ApY3Y2RFq6Hm4e6X5l+unrmzehhHx+TiRvAKGnABFHOipa7uI3wX7ku
 vEArTQfZh/GCw+JyB4XKjCTTxSFkj5fv69fPNwruKqOYWzqAjuQplkO8LzB4h8QBqmiC
 0uqRuio1nM/4urYTq+mG6aARR9kUJc4yffrAftNXvllo9XOwi7gGTzX+BnQrQ0v2d1yp
 LqlYZFYJp3BMiGbn975L/prH17bQ4DWwd1IumwLWZ0rKUitvRm6wQqcoK6fs7GtSY2Xy
 1owQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz9kow0Hszf4mwtbIBEgoC04cr3sycHwqPhZ28JxvTgfiAG8j/mgpCLPK+Pqc9N0TR3UhFYHRoVJ8=@lists.freedesktop.org,
 AJvYcCXjK3l5bluFDaWN20JnZiasE7apuF/BCTZybvxY2h1Go85EAk1f27CN+MXsHhdr/EQg0aEDs2gnr4v1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCHDNyqTkKVdFi1v8pIQ/to+gYqj9H2/E9FqtaKsczBEUp0BnG
 E7vNHsFvk1L8QNnRgB6NxLzYN2vStEF8NoY78ZWL0wxc9azT+xpVz1ovAKbCKCEfbbomXi+n9N3
 dTJwRkBVuGYBqQL/leJTS6NalbFCqHDk=
X-Gm-Gg: ASbGncuhWdZx9pZZ1ifBZLq0EQijTdi8WVQ+AYg5/1SSneLavnf7JJsjB2ET5ENEwNC
 iX2Wnr3XOyBGMoQGq8Im7YCeXA5nQN5Dm46vD3fO/OCrh8wnuViTWM1C7jpMNdqP1AM7ovxbDHM
 qXuGCMmgOcyKqHLCmVaTycbGbD9664Qo3dm15gHiyD30G1GBAQxMBKXt5RxEwGdeg1Io4HoGtn5
 x3tIg==
X-Google-Smtp-Source: AGHT+IGL41V3DbmFvBsWr3jGwFHfcX0duW69mbczpCAOINsa85ECUigYdfUlpWqgF++enxibRnhFFvr8Kxdp2WtP+R0=
X-Received: by 2002:a05:651c:2203:b0:32a:8297:54c9 with SMTP id
 38308e7fff4ca-32b4a3088bbmr63065741fa.8.1750355294494; Thu, 19 Jun 2025
 10:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 20 Jun 2025 02:47:58 +0900
X-Gm-Features: AX0GCFsRgomy43xV-Lv7Stfld1a1yqIyJ3-ysZ2OVO90S8cEE5UAjZMSvGqxZQ8
Message-ID: <CAKFNMom4NJ91Ov7twQ3AGT7PSqt5vN9ROrNHzfV53GHf=bK6oQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] fs: replace mmap hook with .mmap_prepare for simple
 mappings
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Jens Axboe <axboe@kernel.dk>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>, 
 Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Benjamin LaHaise <bcrl@kvack.org>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Kent Overstreet <kent.overstreet@linux.dev>, 
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>, Kees Cook <kees@kernel.org>,
 Chris Mason <clm@fb.com>, 
 Josef Bacik <josef@toxicpanda.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 coda@cs.cmu.edu, 
 Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, 
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Yuezhang Mo <yuezhang.mo@sony.com>, "Theodore Ts'o" <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Yangtao Li <frank.li@vivo.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Woodhouse <dwmw2@infradead.org>, 
 Dave Kleikamp <shaggy@kernel.org>, Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, 
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Bob Copeland <me@bobcopeland.com>, Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Bharath SM <bharathsm@microsoft.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
 Hans de Goede <hdegoede@redhat.com>, Carlos Maiolino <cem@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <jth@kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
 Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, v9fs@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org, 
 linux-aio@kvack.org, linux-unionfs@vger.kernel.org, 
 linux-bcachefs@vger.kernel.org, linux-mm@kvack.org, 
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-um@lists.infradead.org, 
 linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, 
 linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, linux-karma-devel@lists.sourceforge.net, 
 devel@lists.orangefs.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org, 
 nvdimm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 20 Jun 2025 17:39:34 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 17, 2025 at 4:48=E2=80=AFAM Lorenzo Stoakes wrote:
>
> Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> callback"), the f_op->mmap() hook has been deprecated in favour of
> f_op->mmap_prepare().
>
> This callback is invoked in the mmap() logic far earlier, so error handli=
ng
> can be performed more safely without complicated and bug-prone state
> unwinding required should an error arise.
>
> This hook also avoids passing a pointer to a not-yet-correctly-establishe=
d
> VMA avoiding any issues with referencing this data structure.
>
> It rather provides a pointer to the new struct vm_area_desc descriptor ty=
pe
> which contains all required state and allows easy setting of required
> parameters without any consideration needing to be paid to locking or
> reference counts.
>
> Note that nested filesystems like overlayfs are compatible with an
> .mmap_prepare() callback since commit bb666b7c2707 ("mm: add mmap_prepare=
()
> compatibility layer for nested file systems").
>
> In this patch we apply this change to file systems with relatively simple
> mmap() hook logic - exfat, ceph, f2fs, bcachefs, zonefs, btrfs, ocfs2,
> orangefs, nilfs2, romfs, ramfs and aio.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

For nilfs2,

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi
