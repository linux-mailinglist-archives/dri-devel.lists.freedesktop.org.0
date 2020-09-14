Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16802699CE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 01:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05796E81E;
	Mon, 14 Sep 2020 23:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FF16E81E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:39:56 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y4so1150543ljk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 16:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=iq422JY4uXJI3ddO2/rEZUzdunw1b8RJzw17mLMMpFc=;
 b=E3lwUFpmLnVDqti9CxmJQDDCry662TtuueWZGgz3u9+NV28aZo6H0g5qmmvkahBSIS
 6uoj8pK6tNKa4gRmErAJ4evwtDux+VKq0gZZxErhMZ1NSLFaUInx9vOMvPIU5MfhSaXy
 KRlkXyiUlbaeA7iZqVAWdcvhf9odUEeEMOrMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=iq422JY4uXJI3ddO2/rEZUzdunw1b8RJzw17mLMMpFc=;
 b=KLp/6odlrYHsYjJJnUSVQKhPxgiJWtJLzSJiHjBYJ42SPZtzyUHV7Vb5d9Dp514/c/
 7JdMeBTfJu8cVQiS3MIAF4TNqoPuM7lUPIxjj7szK5mw+w55PEls0IZNkUhKIlPYySDj
 08d/Dg3/cxwhyr4miR5AGF+T4AtobJU6FY8Ohq+CUE1bA0legXBbHCF8lEInS6KxYNHT
 FIhMvSfRgR8m2NL/334nhzuXeEWHxsl0Okq5B9YtdImSexCXYjjz9QBrhWhbBY6eayhp
 YgzG/Ep9trkyH04UroZ5iuEoIk5P8MVq4MbrXqEYHraW6S8Fb4DkAcIHCfZrswhRwBF+
 kPUA==
X-Gm-Message-State: AOAM532bJ+3QJsyO65wOBJ3KGV2ilOnSyw2qFEdg/owUbmD+JEirqDK6
 gRnWlnUwgYNuTMs1s4VqtAK2UMCvWb3eBg==
X-Google-Smtp-Source: ABdhPJzCNiWtujKuV81+iCrIMEBuEnGV4pfPi9T1Uc6JkJWWeJwhVI8JyLa1iDe5orutyuAq1gcW9g==
X-Received: by 2002:a2e:920f:: with SMTP id k15mr5940757ljg.353.1600126794225; 
 Mon, 14 Sep 2020 16:39:54 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id l14sm4303772lji.99.2020.09.14.16.39.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 16:39:53 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id m5so1110524lfp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 16:39:53 -0700 (PDT)
X-Received: by 2002:ac2:4c11:: with SMTP id t17mr5007553lfq.281.1600126793141; 
 Mon, 14 Sep 2020 16:39:53 -0700 (PDT)
MIME-Version: 1.0
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 14 Sep 2020 16:39:41 -0700
X-Gmail-Original-Message-ID: <CAAfnVBn2BzXWFY3hhjDxd5q0P2_JWn-HdkVxgS94x9keAUZiow@mail.gmail.com>
Message-ID: <CAAfnVBn2BzXWFY3hhjDxd5q0P2_JWn-HdkVxgS94x9keAUZiow@mail.gmail.com>
Subject: [git pull] virtio-shm region
To: ML dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Miklos Szeredi <miklos@szeredi.hu>
Content-Type: multipart/mixed; boundary="===============0195764824=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0195764824==
Content-Type: multipart/alternative; boundary="0000000000001a5d6e05af4e8d46"

--0000000000001a5d6e05af4e8d46
Content-Type: text/plain; charset="UTF-8"

Hi,

This set of changes are required for zero-copy virtio-gpu.

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git virtio-shm

for you to fetch changes up to 38e895487afc2ed42c11045853cbb3fa20b52b6e:

  virtio: Implement get_shm_region for MMIO transport (2020-09-10 10:05:58
+0200)

----------------------------------------------------------------
Sebastien Boeuf (3):
      virtio: Add get_shm_region method
      virtio: Implement get_shm_region for PCI transport
      virtio: Implement get_shm_region for MMIO transport

 drivers/virtio/virtio_mmio.c       | 31 +++++++++++++
 drivers/virtio/virtio_pci_modern.c | 95
++++++++++++++++++++++++++++++++++++++
 include/linux/virtio_config.h      | 17 +++++++
 include/uapi/linux/virtio_mmio.h   | 11 +++++
 include/uapi/linux/virtio_pci.h    | 11 ++++-
 5 files changed, 164 insertions(+), 1 deletion(-)

--0000000000001a5d6e05af4e8d46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>This=C2=A0set of changes=
 are required for zero-copy virtio-gpu.=C2=A0=C2=A0</div><div><br></div>The=
 following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:<b=
r><br>=C2=A0 Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)<br><br>are available=
 in the Git repository at: <br><br>=C2=A0 git://<a href=3D"http://git.kerne=
l.org/pub/scm/linux/kernel/git/mszeredi/fuse.git">git.kernel.org/pub/scm/li=
nux/kernel/git/mszeredi/fuse.git</a> virtio-shm<br><br>for you to fetch cha=
nges up to 38e895487afc2ed42c11045853cbb3fa20b52b6e:<br><br>=C2=A0 virtio: =
Implement get_shm_region for MMIO transport (2020-09-10 10:05:58 +0200)<br>=
<br>----------------------------------------------------------------<br>Seb=
astien Boeuf (3):<br>=C2=A0 =C2=A0 =C2=A0 virtio: Add get_shm_region method=
<br>=C2=A0 =C2=A0 =C2=A0 virtio: Implement get_shm_region for PCI transport=
<br>=C2=A0 =C2=A0 =C2=A0 virtio: Implement get_shm_region for MMIO transpor=
t<br><br>=C2=A0drivers/virtio/virtio_mmio.c =C2=A0 =C2=A0 =C2=A0 | 31 +++++=
++++++++<br>=C2=A0drivers/virtio/virtio_pci_modern.c | 95 +++++++++++++++++=
+++++++++++++++++++++<br>=C2=A0include/linux/virtio_config.h =C2=A0 =C2=A0 =
=C2=A0| 17 +++++++<br>=C2=A0include/uapi/linux/virtio_mmio.h =C2=A0 | 11 ++=
+++<br>=C2=A0include/uapi/linux/virtio_pci.h =C2=A0 =C2=A0| 11 ++++-<br>=C2=
=A05 files changed, 164 insertions(+), 1 deletion(-)<br></div>

--0000000000001a5d6e05af4e8d46--

--===============0195764824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0195764824==--
