Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A367630EF2B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 10:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915496ECFD;
	Thu,  4 Feb 2021 09:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698986ECB0;
 Thu,  4 Feb 2021 09:04:28 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id b145so1718218pfb.4;
 Thu, 04 Feb 2021 01:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fb7Na2mDAdoI7ikxHJOuVVIIfiMji+kqDnChvBTcsBE=;
 b=veD6phmh2yAd7KOj2kuV6kSNKYbBFCoGAUXy9BPe0fGbJR/pqWNkEhUBEbVnhITeJL
 MmGEOzlVJVVer59/GaotRAl2yIpXwzEyWVx/PDpg3h/risfb1zArEbit5FCYExtrxHP6
 xSQMjDqzcbDGGPcJdCr7QLnpbmfmv0xux1Zn893Pey7S6yjZSOVy2fsK92edDqapUK5H
 k7gYERW79PsRAePcdXyAg7ZWgk78r/4GKxN9O15YTanUw/JD0+g7Z5Sl4t+UQjPVKwgR
 FhRB7kmy8nrOD4JUEtGbGZ1mb1MdArl2fRvngqk8j8nMPvI7eA5+wq4Iz2IjFzW+BIVA
 G79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fb7Na2mDAdoI7ikxHJOuVVIIfiMji+kqDnChvBTcsBE=;
 b=UE/r7DgPH7YXZhW4WLIXLhG4+5krTWM7Xv68Bc8Pt+gStPW1uiaCx0AaT5PkL4O0Zk
 dz5M85Bqh76C9aewbkmwRcGUcmjcF7Qwddf0uYReDXhtzBFbQNrAvpnN3qJjikaSRLxW
 qJ+Q3Rz6RtrGjweDMc6MozmPCl8SV76I68seiLM+TsbAca/UnOjxHpQMLBH6VfNlYAZH
 kmcRFOar60RPyTWFsPSORQ//vOSPwSTySr1kwYngsatDiVcRyFmrd14VuFDbkYPdk5eI
 Kj7QS51T7JaohJpm3HxPUa3ThUyFkL6E7Bv9HGC+ON6gRqQpD46aStHmHtawJtZnMG96
 0Y6A==
X-Gm-Message-State: AOAM533sNDVdWr3LHKyfiCc1aPL/ZdRdTV3gACYYtWXmemCS7dIRqsU0
 G7CBwRI8Pefo68lYqA3Gu4O5ATcwkie+ZdfhsaE=
X-Google-Smtp-Source: ABdhPJxBt8qptdPshwW2hXCrQZdR+CXnjCPVjcsVKlQ4X7ZrZMECcRm9I8//iWam4Wxdb5wESs17sxLF5vlXEAyL+b4=
X-Received: by 2002:a62:5a86:0:b029:1ae:6b45:b6a9 with SMTP id
 o128-20020a625a860000b02901ae6b45b6a9mr7142539pfb.7.1612429467980; Thu, 04
 Feb 2021 01:04:27 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:90a:7106:0:0:0:0 with HTTP; Thu, 4 Feb 2021 01:04:27
 -0800 (PST)
In-Reply-To: <20210204155846.5aef94a8@canb.auug.org.au>
References: <20210204155846.5aef94a8@canb.auug.org.au>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 4 Feb 2021 11:04:27 +0200
Message-ID: <CAHp75Vct=jSQxu187hwz4Wrc_xRKiTmKFt_bgT-m-z=iW31drg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Mark Gross <mark.gross@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============1758556889=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1758556889==
Content-Type: multipart/alternative; boundary="000000000000aa166b05ba7efd28"

--000000000000aa166b05ba7efd28
Content-Type: text/plain; charset="UTF-8"

On Thursday, February 4, 2021, Stephen Rothwell <sfr@canb.auug.org.au>
wrote:

> Hi all,
>
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
>
>

Thanks. I already asked Patrick yesterday day if DRM missed to pull an
immutable tag I provided. I think they can pull and resolve conflicts
themselves. Alternatively it would be easy to resolve by Linus by removing
Kconfig lines along with mentioned files,


>   drivers/gpu/drm/gma500/Kconfig
>   drivers/gpu/drm/gma500/mdfld_device.c
>   drivers/gpu/drm/gma500/mdfld_dsi_output.c
>   drivers/gpu/drm/gma500/mdfld_output.c
>   drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
>
> between commits:
>
>   b51035c200bd ("drm/gma500: Remove Medfield support")
>   837f23bb4b60 ("drm/gma500: Drop DRM_GMA3600 config option")
>
> from the drm-misc tree and commit:
>
>   bfc838f8598e ("drm/gma500: Convert to use new SCU IPC API")
>   25ded39ad064 ("drm/gma500: Get rid of duplicate NULL checks")
>
> from the drivers-x86 tree.
>
> I fixed it up (the former removed the text that was updated by the
> latter and removed the last 4 files) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>


-- 
With Best Regards,
Andy Shevchenko

--000000000000aa166b05ba7efd28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, February 4, 2021, Stephen Rothwell &lt;<a href=3D"mail=
to:sfr@canb.auug.org.au">sfr@canb.auug.org.au</a>&gt; wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hi all,<br>
<br>
Today&#39;s linux-next merge of the drivers-x86 tree got a conflict in:<br>
<br></blockquote><div><br></div><div><br></div><div>Thanks. I already asked=
 Patrick yesterday day if DRM missed to pull an immutable tag I provided. I=
 think they can pull and resolve conflicts themselves. Alternatively it wou=
ld be easy to resolve by Linus by removing Kconfig lines along with mention=
ed files,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 drivers/gpu/drm/gma500/Kconfig<br>
=C2=A0 drivers/gpu/drm/gma500/mdfld_<wbr>device.c<br>
=C2=A0 drivers/gpu/drm/gma500/mdfld_<wbr>dsi_output.c<br>
=C2=A0 drivers/gpu/drm/gma500/mdfld_<wbr>output.c<br>
=C2=A0 drivers/gpu/drm/gma500/<wbr>tc35876x-dsi-lvds.c<br>
<br>
between commits:<br>
<br>
=C2=A0 b51035c200bd (&quot;drm/gma500: Remove Medfield support&quot;)<br>
=C2=A0 837f23bb4b60 (&quot;drm/gma500: Drop DRM_GMA3600 config option&quot;=
)<br>
<br>
from the drm-misc tree and commit:<br>
<br>
=C2=A0 bfc838f8598e (&quot;drm/gma500: Convert to use new SCU IPC API&quot;=
)<br>
=C2=A0 25ded39ad064 (&quot;drm/gma500: Get rid of duplicate NULL checks&quo=
t;)<br>
<br>
from the drivers-x86 tree.<br>
<br>
I fixed it up (the former removed the text that was updated by the<br>
latter and removed the last 4 files) and can carry the fix as<br>
necessary. This is now fixed as far as linux-next is concerned, but any<br>
non trivial conflicts should be mentioned to your upstream maintainer<br>
when your tree is submitted for merging.=C2=A0 You may also want to conside=
r<br>
cooperating with the maintainer of the conflicting tree to minimise any<br>
particularly complex conflicts.<br>
<br>
-- <br>
Cheers,<br>
Stephen Rothwell<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--000000000000aa166b05ba7efd28--

--===============1758556889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1758556889==--
