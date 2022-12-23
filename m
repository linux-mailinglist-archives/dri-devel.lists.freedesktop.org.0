Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070E65528B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 17:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253A010E671;
	Fri, 23 Dec 2022 16:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736C110E671;
 Fri, 23 Dec 2022 16:08:15 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-43ea87d0797so71761957b3.5; 
 Fri, 23 Dec 2022 08:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9UAcPdW9askffgWg7nB0TdowabMrlczkBK4XsauIi0o=;
 b=lHUPGc3BS6gt5d7qO/YbTJdNoEX6P0Fs0AHuvpRN79Trjv2vtEtFfDNFnNCsSG8YdN
 aPonoPyWwIlqZ4M0rDnWlOflVSjQCghw5Jhakah47pmQWXDynSJnh0DCyy1GioFoI9lZ
 h0ikDZy6cUNUstmSP8Nyk2Mw7SDE+oP94vK+9LBNnAYpqrcyhmv1TmetF6XqLi97JAVv
 bXZHWlRhAqMWQzJwVsrgT4R7AlUuuSDPvI5Tyj/svY5oP0mOQkGo1dwtHnhEFyOw1Cen
 stlcWGdo1McO/iq98TxdgDwUfczrG7ucMudiAHCS21tebNc3qnQJAThIitqAJqgBzuQ6
 /PGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9UAcPdW9askffgWg7nB0TdowabMrlczkBK4XsauIi0o=;
 b=SDtyZiXoqzHno6NQOcEn1pQQS8pEogaOq4OioFGwx1b7cIkqtcHQjuvlTIVsDfHu9w
 K45HIsXCGnWyXZCYoeWY8dLyfZjvBqDdS8khOVv47NanBWjjd8aJbVNWeeyd3gkCfL5d
 W/rmC7VmO5kv0hQrxVs6rrYW75PeteWUR86CjRfe1+SCvx+R7yUp8ZXNPUwcpGwnmBM4
 u0cIIMPFpfLEeBEue+H8WJ27Ro22GWlQHf2mMvSA359lcNGuDYZlaPIWA5USNnTj6xx2
 mv17RItX78HJ8r44vp1dMXKP13Ta6SCBhMS2gDrHlaToML3/arv/7jJBjaZ9dn73gqn5
 lREQ==
X-Gm-Message-State: AFqh2kqwmFFC84CU4b+bICmS8+vlD5nPC3QbUOksq7kxb+kQFWMNhx4m
 Sm4gLDRkRKTvrBe+GQMJJRc/y8s0n8Us6bbZ6mI=
X-Google-Smtp-Source: AMrXdXsMofnBIr+Q3eyQugwtVImEVuShTXqXaJ1ANM/Kv4N0dXm7Ipg6K5SnP/JdXOIW4UV0oVu7P2jL5AMMKo3aF/Q=
X-Received: by 2002:a05:690c:79f:b0:3c4:1f67:a2a2 with SMTP id
 bw31-20020a05690c079f00b003c41f67a2a2mr1110400ywb.234.1671811694507; Fri, 23
 Dec 2022 08:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20221222183012.1046-1-mario.limonciello@amd.com>
 <20221222183012.1046-3-mario.limonciello@amd.com>
In-Reply-To: <20221222183012.1046-3-mario.limonciello@amd.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Fri, 23 Dec 2022 17:08:03 +0100
Message-ID: <CAD=4a=UVaz7uoe7Tj_k3dmn704enN4z3skXFymaPorhDNUEu0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd: Re-create firmware framebuffer on failure to
 probe
To: Mario Limonciello <mario.limonciello@amd.com>
Content-Type: multipart/alternative; boundary="0000000000002ebda505f080fea6"
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002ebda505f080fea6
Content-Type: text/plain; charset="UTF-8"

What about a system with multiple GPUs?
Hybrid graphics?
Headless systems?

Regards
//Ernst

Den tors 22 dec. 2022 kl 19:30 skrev Mario Limonciello <
mario.limonciello@amd.com>:

> If the probe sequence fails then the user is stuck with a frozen
> screen and can only really recover via SSH or by rebooting and
> applying nomodeset to the kernel command line.
>
> This is particularly problematic as newer GPUs are introduced because
> distributions may take some time to land newer GPU firmware.
>
> So when probe fails, re-create the system framebuffer so that the
> user at least has basic graphics support.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index bf2d50c8c92a..8961c62ab29b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -40,6 +40,7 @@
>  #include <linux/cc_platform.h>
>  #include <linux/fb.h>
>  #include <linux/dynamic_debug.h>
> +#include <linux/sysfb.h>
>
>  #include "amdgpu.h"
>  #include "amdgpu_irq.h"
> @@ -2187,6 +2188,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>
>  err_pci:
>         pci_disable_device(pdev);
> +       sysfb_enable();
>         return ret;
>  }
>
> --
> 2.34.1
>
>

--0000000000002ebda505f080fea6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">What about a system with multiple GPUs?</div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Hybrid =
graphics?</div><div class=3D"gmail_default" style=3D"font-family:arial,helv=
etica,sans-serif">Headless systems?</div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif">Regards</div><div =
class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">//=
Ernst<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Den tors 22 dec. 2022 kl 19:30 skrev Mario Limonciello &lt;=
<a href=3D"mailto:mario.limonciello@amd.com">mario.limonciello@amd.com</a>&=
gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If the prob=
e sequence fails then the user is stuck with a frozen<br>
screen and can only really recover via SSH or by rebooting and<br>
applying nomodeset to the kernel command line.<br>
<br>
This is particularly problematic as newer GPUs are introduced because<br>
distributions may take some time to land newer GPU firmware.<br>
<br>
So when probe fails, re-create the system framebuffer so that the<br>
user at least has basic graphics support.<br>
<br>
Signed-off-by: Mario Limonciello &lt;<a href=3D"mailto:mario.limonciello@am=
d.com" target=3D"_blank">mario.limonciello@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index bf2d50c8c92a..8961c62ab29b 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -40,6 +40,7 @@<br>
=C2=A0#include &lt;linux/cc_platform.h&gt;<br>
=C2=A0#include &lt;linux/fb.h&gt;<br>
=C2=A0#include &lt;linux/dynamic_debug.h&gt;<br>
+#include &lt;linux/sysfb.h&gt;<br>
<br>
=C2=A0#include &quot;amdgpu.h&quot;<br>
=C2=A0#include &quot;amdgpu_irq.h&quot;<br>
@@ -2187,6 +2188,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,<br>
<br>
=C2=A0err_pci:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_disable_device(pdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sysfb_enable();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--0000000000002ebda505f080fea6--
