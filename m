Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A710526B525
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 01:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E74C6E1DE;
	Tue, 15 Sep 2020 23:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB136E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 23:38:21 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k25so4295953ljg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 16:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YH2TBXUb4OSZ+zmBWU7R2AMUGz9hqJWd29zRBX9z+2g=;
 b=lncrCawzdvWVcZr33OVZoqNZcXXvRDZDPKJJQ4LWzTxpBFN23yKnTuKsU0TS+wDADX
 +l806uFy9kh3Zzr0b55pfQ1SQLqtst8OSCcT+q+JawS5go4TN1NtzzXYCXMjQP9mDYj1
 JYxkt8gS8s+Grl1JDOMX+Y0paTF8RDhIsKni4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YH2TBXUb4OSZ+zmBWU7R2AMUGz9hqJWd29zRBX9z+2g=;
 b=YR8pwnpCj/P8RGRjiP4FdFGRyE6+L5qOq7cDR2ulL70nw3UTvQmXnJ+YjqA7LBNCfD
 LtQtDeLRj8fa8bc/7BjmLTjWd3LDjzsBVyyMQje4qG+Phdb6fltZjAOBY6BJvH/+5p6A
 KJ//Fb9OJ0Xn1Q48MhJiK9TbsHkvNiS7zj0vJUDXzxUb+u45r/uy0zcM9e0PGq4CxNi+
 OtYKTSUbDlwwZpounK6dL6ugTqJwDjrZtgz4Zyt6oA8j2fIAAk2jUPhVsw66waQIeGJ/
 EiVLtlB2/wX2WZbjMtIEf3KG1MPVrWz3K3eHPUNMElJ2bmush/oLWOp3qAOON7PThcA8
 eySA==
X-Gm-Message-State: AOAM531nTSalDvKaczkOAqa+XPYXOH/2j8zlDjo0CPgmHRAzuvDlxdcZ
 7Jm6Hz0dsDeqS5x3/aFJhPbT48ySdE5vQA==
X-Google-Smtp-Source: ABdhPJzG4sIyqMOz8jGSZhiysL9nwXeio6nH7+LqQlVWCB31wq3FfMHVbdmG/uWPDqes/hibZtBINQ==
X-Received: by 2002:a2e:1444:: with SMTP id 4mr7045311lju.218.1600213099114;
 Tue, 15 Sep 2020 16:38:19 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id p22sm168537lji.100.2020.09.15.16.38.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 16:38:18 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id m5so4943389lfp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 16:38:18 -0700 (PDT)
X-Received: by 2002:ac2:4148:: with SMTP id c8mr6417176lfi.278.1600213097759; 
 Tue, 15 Sep 2020 16:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfnVBn2BzXWFY3hhjDxd5q0P2_JWn-HdkVxgS94x9keAUZiow@mail.gmail.com>
 <20200915152657.oyz52c4q5qb5q7rw@gilmour.lan>
In-Reply-To: <20200915152657.oyz52c4q5qb5q7rw@gilmour.lan>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 15 Sep 2020 16:38:04 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=BPD+MDnpjTzbXat-_k0E=G4tc5OfGfSpBc1MU6RtkaA@mail.gmail.com>
Message-ID: <CAAfnVB=BPD+MDnpjTzbXat-_k0E=G4tc5OfGfSpBc1MU6RtkaA@mail.gmail.com>
Subject: Re: [git pull] virtio-shm region
To: Maxime Ripard <maxime@cerno.tech>
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
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Content-Type: multipart/mixed; boundary="===============0017991914=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0017991914==
Content-Type: multipart/alternative; boundary="000000000000422a3f05af62a508"

--000000000000422a3f05af62a508
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 8:27 AM Maxime Ripard <maxime@cerno.tech> wrote:

> Hi,
>
> On Mon, Sep 14, 2020 at 04:39:41PM -0700, Gurchetan Singh wrote:
> > Hi,
> >
> > This set of changes are required for zero-copy virtio-gpu.
> >
> > The following changes since commit
> 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
> >
> >   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
> virtio-shm
> >
> > for you to fetch changes up to 38e895487afc2ed42c11045853cbb3fa20b52b6e:
> >
> >   virtio: Implement get_shm_region for MMIO transport (2020-09-10
> 10:05:58
> > +0200)
> >
> > ----------------------------------------------------------------
> > Sebastien Boeuf (3):
> >       virtio: Add get_shm_region method
> >       virtio: Implement get_shm_region for PCI transport
> >       virtio: Implement get_shm_region for MMIO transport
> >
> >  drivers/virtio/virtio_mmio.c       | 31 +++++++++++++
> >  drivers/virtio/virtio_pci_modern.c | 95
> > ++++++++++++++++++++++++++++++++++++++
> >  include/linux/virtio_config.h      | 17 +++++++
> >  include/uapi/linux/virtio_mmio.h   | 11 +++++
> >  include/uapi/linux/virtio_pci.h    | 11 ++++-
> >  5 files changed, 164 insertions(+), 1 deletion(-)
>
> It's not really clear who you expect to pull that PR?
>

Hmm, Daniel recommended "send[ing] the topic pull request to drm-misc
maintainers (Maarten, Maxime, Thomas)" in the other thread, but I'm not
really sure which one.  Maybe whomever is in charge of drm-misc-next pull
requests?


>
> Maxime
>

--000000000000422a3f05af62a508
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15, 2020 at 8:27 AM Maxime Ri=
pard &lt;maxime@cerno.tech&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi,<br>
<br>
On Mon, Sep 14, 2020 at 04:39:41PM -0700, Gurchetan Singh wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; This set of changes are required for zero-copy virtio-gpu.<br>
&gt; <br>
&gt; The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f8=
0bbf5:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)<br>
&gt; <br>
&gt; are available in the Git repository at:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.kernel.org/pub/scm/linux/kerne=
l/git/mszeredi/fuse.git" rel=3D"noreferrer" target=3D"_blank">git.kernel.or=
g/pub/scm/linux/kernel/git/mszeredi/fuse.git</a> virtio-shm<br>
&gt; <br>
&gt; for you to fetch changes up to 38e895487afc2ed42c11045853cbb3fa20b52b6=
e:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0virtio: Implement get_shm_region for MMIO transport (2020-=
09-10 10:05:58<br>
&gt; +0200)<br>
&gt; <br>
&gt; ----------------------------------------------------------------<br>
&gt; Sebastien Boeuf (3):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio: Add get_shm_region method<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio: Implement get_shm_region for PCI tra=
nsport<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio: Implement get_shm_region for MMIO tr=
ansport<br>
&gt; <br>
&gt;=C2=A0 drivers/virtio/virtio_mmio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 ++++=
+++++++++<br>
&gt;=C2=A0 drivers/virtio/virtio_pci_modern.c | 95<br>
&gt; ++++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 include/linux/virtio_config.h=C2=A0 =C2=A0 =C2=A0 | 17 +++++++<b=
r>
&gt;=C2=A0 include/uapi/linux/virtio_mmio.h=C2=A0 =C2=A0| 11 +++++<br>
&gt;=C2=A0 include/uapi/linux/virtio_pci.h=C2=A0 =C2=A0 | 11 ++++-<br>
&gt;=C2=A0 5 files changed, 164 insertions(+), 1 deletion(-)<br>
<br>
It&#39;s not really clear who you expect to pull that PR?<br></blockquote><=
div><br></div><div>Hmm, Daniel recommended &quot;send[ing] the topic pull r=
equest to drm-misc maintainers (Maarten, Maxime, Thomas)&quot; in the other=
 thread, but I&#39;m not really sure which one.=C2=A0 Maybe whomever is in =
charge of drm-misc-next pull requests?</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Maxime<br>
</blockquote></div></div>

--000000000000422a3f05af62a508--

--===============0017991914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0017991914==--
