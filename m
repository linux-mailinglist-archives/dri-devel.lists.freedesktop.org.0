Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27BC9A6DF6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 17:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF0910E0AE;
	Mon, 21 Oct 2024 15:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=criticallink.com header.i=@criticallink.com header.b="LWDEdEuY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC83610E0AE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 15:19:21 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539f53973fdso3631556e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google; t=1729523960; x=1730128760;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lx2yXhNWH+lHq3d26rliNT8stEJw+n5oQ5u7NM1Qkas=;
 b=LWDEdEuY746qhzvOOuVh4cE/leZuAu+MGMWbcHm+L4xj6RixJqwt6Pkkvi2aUQZMxb
 M0N5B8zUqkExJDIX6WKt42xmunt2zH8SIqaJo+RVFf2BOrO8uiMs+J9FjC34TIT3OguR
 JfQ5L9rap90cG4jK5SBW/06neDT70yeEk+NWp+Vgh84lHiw1OyYFU+IjITCtMHK8vr1/
 vhbp+s0JlEM/iaiN7bZ9gWrBi952iY7hjwi8VnG2q8No/0GxM7A/m9Zar62TtzgxfTGD
 1iPOkiKA2Btr6fqIF7uR1VlZ/EiN6VlT3ZCiRSOlsC/kEBNPdGPxM7FAxuE04+3Bfsuc
 4vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729523960; x=1730128760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lx2yXhNWH+lHq3d26rliNT8stEJw+n5oQ5u7NM1Qkas=;
 b=c5hY+0Sz3TWJlutnrtepSXgjDzNTiEsy+WSRtdtQUUEZNp/W1TsdsG3jJ3ijsYhuUg
 F7ozE0AsNJ4fVPzvQ5d1zW/DjmSUnVgsEAxji3m36/MWZ4MGhCmdfeo4Ho4EKRaBH9KQ
 LQiNfb74p+P5WxJk3NtN66Nrm32R8MWvTpShHcY2ru+aJkEaQmA15gEMkQjpf5PG6ONe
 KmqRvRLDI9kugiK3vlNqQIigOknRZdvITTy9+WBuKQMX7/aE8/wJ+tE1Kq4xvbIGHXgw
 vyVuU2H60DoaRHCS+3dNiqgNFYPXnoaw7AnM5DxVVIgae93AC5vREaWERbjS3z0A4iZj
 WbBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOGm6LOviU7mplt7Bq+m4X3m7KQ3TFBLchRmCwoeJXliG75MqkggWA6Ij5mHIKC10JP7w931AoSng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvEN9v6GOxOKGtw1G6+VxDGr82GTYR9OENmf4YqkW/PPglSWjE
 Ngp/RWCH/7RLbzCR8Y5ar0UnBJNluSU7vpZ3Y+BVz8d30blhBd5tXGfKCdn5dv8gSbcPTpZEPuX
 qpYYyaHaQ/DyvghYn1qvycwWFsu7PPnc7ZAQs
X-Google-Smtp-Source: AGHT+IEWd6zfPZ2twGl9NgpzsPX6juIFgUiVoYWMuqNfBJSk1XsSmcqG2I2jkZcmlve9obUA+kiXEZfLUacsJeewkEg=
X-Received: by 2002:a05:6512:3d20:b0:539:ffb5:8d36 with SMTP id
 2adb3069b0e04-53a0c72eed8mr5116251e87.23.1729523959720; Mon, 21 Oct 2024
 08:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
 <20241021-tidss-irq-fix-v1-1-82ddaec94e4a@ideasonboard.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-1-82ddaec94e4a@ideasonboard.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 21 Oct 2024 11:19:08 -0400
Message-ID: <CADL8D3Zgs_kFo_joiY2Bop=_fLoD_xL45jG6=qkF2iUogRDK3w@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/tidss: Fix issue in irq handling causing
 irq-flood issue
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bin Liu <b-liu@ti.com>, stable@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000400b110624fe2d67"
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

--000000000000400b110624fe2d67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 10:08=E2=80=AFAM Tomi Valkeinen <
tomi.valkeinen@ideasonboard.com> wrote:

> It has been observed that sometimes DSS will trigger an interrupt and
> the top level interrupt (DISPC_IRQSTATUS) is not zero, but the VP and
> VID level interrupt-statuses are zero.
>
> As the top level irqstatus is supposed to tell whether we have VP/VID
> interrupts, the thinking of the driver authors was that this particular
> case could never happen. Thus the driver only clears the DISPC_IRQSTATUS
> bits which has corresponding interrupts in VP/VID status. So when this
> issue happens, the driver will not clear DISPC_IRQSTATUS, and we get an
> interrupt flood.
>
> It is unclear why the issue happens. It could be a race issue in the
> driver, but no such race has been found. It could also be an issue with
> the HW. However a similar case can be easily triggered by manually
> writing to DISPC_IRQSTATUS_RAW. This will forcibly set a bit in the
> DISPC_IRQSTATUS and trigger an interrupt, and as the driver never clears
> the bit, we get an interrupt flood.
>
> To fix the issue, always clear DISPC_IRQSTATUS. The concern with this
> solution is that if the top level irqstatus is the one that triggers the
> interrupt, always clearing DISPC_IRQSTATUS might leave some interrupts
> unhandled if VP/VID interrupt statuses have bits set. However, testing
> shows that if any of the irqstatuses is set (i.e. even if
> DISPC_IRQSTATUS =3D=3D 0, but a VID irqstatus has a bit set), we will get=
 an
> interrupt.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Co-developed-by: Bin Liu <b-liu@ti.com>
> Signed-off-by: Bin Liu <b-liu@ti.com>
> Co-developed-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Co-developed-by: Jonathan Cormier <jcormier@criticallink.com>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform
> Display SubSystem")
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>

I assume a reviewed by doesn't make sense since I co-developed this patch
but adding my tested by, hopefully that makes sense.

Tested an equivalent patch for several weeks.
Tested-by: Jonathan Cormier <jcormier@criticallink.com>


>
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c
> b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 1ad711f8d2a8..f81111067578 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -780,24 +780,20 @@ static
>  void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t
> clearmask)
>  {
>         unsigned int i;
> -       u32 top_clear =3D 0;
>
>         for (i =3D 0; i < dispc->feat->num_vps; ++i) {
> -               if (clearmask & DSS_IRQ_VP_MASK(i)) {
> +               if (clearmask & DSS_IRQ_VP_MASK(i))
>                         dispc_k3_vp_write_irqstatus(dispc, i, clearmask);
> -                       top_clear |=3D BIT(i);
> -               }
>         }
>         for (i =3D 0; i < dispc->feat->num_planes; ++i) {
> -               if (clearmask & DSS_IRQ_PLANE_MASK(i)) {
> +               if (clearmask & DSS_IRQ_PLANE_MASK(i))
>                         dispc_k3_vid_write_irqstatus(dispc, i, clearmask)=
;
> -                       top_clear |=3D BIT(4 + i);
> -               }
>         }
>         if (dispc->feat->subrev =3D=3D DISPC_K2G)
>                 return;
>
> -       dispc_write(dispc, DISPC_IRQSTATUS, top_clear);
> +       /* always clear the top level irqstatus */
> +       dispc_write(dispc, DISPC_IRQSTATUS, dispc_read(dispc,
> DISPC_IRQSTATUS));
>
>         /* Flush posted writes */
>         dispc_read(dispc, DISPC_IRQSTATUS);
>
> --
> 2.43.0
>
>

--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

<https://www.linkedin.com/company/critical-link-llc>
<https://twitter.com/Critical_Link>

--000000000000400b110624fe2d67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 21, 2024 at 10:08=E2=80=
=AFAM Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen@ideasonboard.com"=
>tomi.valkeinen@ideasonboard.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">It has been observed that sometimes DSS wi=
ll trigger an interrupt and<br>
the top level interrupt (DISPC_IRQSTATUS) is not zero, but the VP and<br>
VID level interrupt-statuses are zero.<br>
<br>
As the top level irqstatus is supposed to tell whether we have VP/VID<br>
interrupts, the thinking of the driver authors was that this particular<br>
case could never happen. Thus the driver only clears the DISPC_IRQSTATUS<br=
>
bits which has corresponding interrupts in VP/VID status. So when this<br>
issue happens, the driver will not clear DISPC_IRQSTATUS, and we get an<br>
interrupt flood.<br>
<br>
It is unclear why the issue happens. It could be a race issue in the<br>
driver, but no such race has been found. It could also be an issue with<br>
the HW. However a similar case can be easily triggered by manually<br>
writing to DISPC_IRQSTATUS_RAW. This will forcibly set a bit in the<br>
DISPC_IRQSTATUS and trigger an interrupt, and as the driver never clears<br=
>
the bit, we get an interrupt flood.<br>
<br>
To fix the issue, always clear DISPC_IRQSTATUS. The concern with this<br>
solution is that if the top level irqstatus is the one that triggers the<br=
>
interrupt, always clearing DISPC_IRQSTATUS might leave some interrupts<br>
unhandled if VP/VID interrupt statuses have bits set. However, testing<br>
shows that if any of the irqstatuses is set (i.e. even if<br>
DISPC_IRQSTATUS =3D=3D 0, but a VID irqstatus has a bit set), we will get a=
n<br>
interrupt.<br>
<br>
Signed-off-by: Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen@ideasonb=
oard.com" target=3D"_blank">tomi.valkeinen@ideasonboard.com</a>&gt;<br>
Co-developed-by: Bin Liu &lt;<a href=3D"mailto:b-liu@ti.com" target=3D"_bla=
nk">b-liu@ti.com</a>&gt;<br>
Signed-off-by: Bin Liu &lt;<a href=3D"mailto:b-liu@ti.com" target=3D"_blank=
">b-liu@ti.com</a>&gt;<br>
Co-developed-by: Devarsh Thakkar &lt;<a href=3D"mailto:devarsht@ti.com" tar=
get=3D"_blank">devarsht@ti.com</a>&gt;<br>
Signed-off-by: Devarsh Thakkar &lt;<a href=3D"mailto:devarsht@ti.com" targe=
t=3D"_blank">devarsht@ti.com</a>&gt;<br>
Co-developed-by: Jonathan Cormier &lt;<a href=3D"mailto:jcormier@criticalli=
nk.com" target=3D"_blank">jcormier@criticallink.com</a>&gt;<br>
Signed-off-by: Jonathan Cormier &lt;<a href=3D"mailto:jcormier@criticallink=
.com" target=3D"_blank">jcormier@criticallink.com</a>&gt;<br>
Fixes: 32a1795f57ee (&quot;drm/tidss: New driver for TI Keystone platform D=
isplay SubSystem&quot;)<br>
Cc: <a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">stable@vger=
.kernel.org</a><br>
---<br>
=C2=A0drivers/gpu/drm/tidss/tidss_dispc.c | 12 ++++--------<br>
=C2=A01 file changed, 4 insertions(+), 8 deletions(-)<br></blockquote><div>=
<br></div><div>I assume a reviewed by doesn&#39;t make sense since I co-dev=
eloped this patch but adding my tested by, hopefully that makes sense. </di=
v><div><br></div><div>
Tested an equivalent patch for several weeks.<br>
Tested-by: Jonathan Cormier &lt;<a href=3D"mailto:jcormier@criticallink.com=
" target=3D"_blank">jcormier@criticallink.com</a>&gt;</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/ti=
dss_dispc.c<br>
index 1ad711f8d2a8..f81111067578 100644<br>
--- a/drivers/gpu/drm/tidss/tidss_dispc.c<br>
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c<br>
@@ -780,24 +780,20 @@ static<br>
=C2=A0void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t=
 clearmask)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 top_clear =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; dispc-&gt;feat-&gt;num_vps=
; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (clearmask &amp;=
 DSS_IRQ_VP_MASK(i)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (clearmask &amp;=
 DSS_IRQ_VP_MASK(i))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dispc_k3_vp_write_irqstatus(dispc, i, clearmask);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0top_clear |=3D BIT(i);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; dispc-&gt;feat-&gt;num_pla=
nes; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (clearmask &amp;=
 DSS_IRQ_PLANE_MASK(i)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (clearmask &amp;=
 DSS_IRQ_PLANE_MASK(i))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dispc_k3_vid_write_irqstatus(dispc, i, clearmask);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0top_clear |=3D BIT(4 + i);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dispc-&gt;feat-&gt;subrev =3D=3D DISPC_K2G)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dispc_write(dispc, DISPC_IRQSTATUS, top_clear);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* always clear the top level irqstatus */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dispc_write(dispc, DISPC_IRQSTATUS, dispc_read(=
dispc, DISPC_IRQSTATUS));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Flush posted writes */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispc_read(dispc, DISPC_IRQSTATUS);<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div><font color=3D"#000000">Voice:=C2=A0=C2=A0<a value=
=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><div><font color=
=3D"#000000"><br></font></div><div><font color=3D"#000000"><img src=3D"http=
s://ci3.googleusercontent.com/mail-sig/AIorK4xk-E6kTWNd5AJHtEUAEcL6C7vYjIUe=
EExuTc6ecDmTEshpkG53r8T5L4geBRI1997uwEiKrqgnopA3"><br></font></div></div></=
div><div><div><font color=3D"#1155cc"><br></font></div><div><a href=3D"http=
://www.criticallink.com/" target=3D"_blank"><font color=3D"#1155cc">http://=
www.CriticalLink.com</font></a><br></div><div>6712 Brooklawn Parkway,=C2=A0=
Syracuse, NY 13211=C2=A0</div></div></div><div><div><br></div><div><font co=
lor=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://www.linkedin.com=
/company/critical-link-llc" target=3D"_blank"><img src=3D"https://docs.goog=
le.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=
=3D0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>=C2=A0=C2=A0<a =
href=3D"https://twitter.com/Critical_Link" target=3D"_blank"><img alt=3D"" =
src=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6c=
U1yWERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9=
jPQ"></a></font></font></div></div></div></div></div></div></div></div></di=
v></div></div></div></div></div></div>

--000000000000400b110624fe2d67--
