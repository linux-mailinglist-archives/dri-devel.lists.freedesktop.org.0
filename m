Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC3D5BA228
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 23:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85510E2B6;
	Thu, 15 Sep 2022 21:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC5810EBE8;
 Thu, 15 Sep 2022 21:03:25 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id y3so44968589ejc.1;
 Thu, 15 Sep 2022 14:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=77A34pTomv3N+R3ainVC963jCf2d+yap4Tk/aBJ4xTk=;
 b=cwdJgZoq8ml4m7F9ATyjSvJ132/b9ZkkE7+2m95CXwZv6GYudF0G9gHK1mBXhti6/I
 lgBt4aJZ0jqxXxwqIrBLcrBde5pz+naB71JvDswPxRTA/p3uYX22jN6QOXUc3unI8Kro
 ueYgPVSpd1bW2HdEkH3FGzr3Cw7IHrCW7YgveizrF9jkP6741tiUEs5DRB0ZNxbg3TXt
 KFuuJusrAFFmOo20GUGIj3ZfGURdZsqICnj3TVi/Mq5iT0LXNLkyhzQH+1l6deayBDMV
 gjzgiez8XxoAZKgLGO5hQFwmKGTd8IlUd4+HYU8VQb9U7Y7b7lpaPSUfBV7ZSIdkRRGu
 31hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=77A34pTomv3N+R3ainVC963jCf2d+yap4Tk/aBJ4xTk=;
 b=LUZ2UryasJTU5vRqSYonNqWVzEK3gtnu6dE1ma7TDasG8fVPuzASjW6dxk25xjTC+4
 SrDoRjB9ZCsXa3ro+97o22kZiR8KsK42LxyPPN1xpiaVg1JXMoWlz1TBppYxd2GyYt+v
 EycgPF3PpoV4/vFn/2kMGQVBZPBxeKb+Dg3A6Y8Lpcpvb9qewa5CSn2sg9AlmD62Lq/k
 5NlYdR7WHw7AE1EAO0jqOMrjfsTHzMF76IRUPiRMDnFiBRaPYEOKKPEzzm3YWbEUpcnq
 nhBIutITGzMynZXcSDMSEqCz7yTDQZj4E60vli42OYdYTkdcBlqD8foR5459NHUY1R0J
 I94g==
X-Gm-Message-State: ACrzQf1XsCxiixIt5H9XoW7SwhAPugDaIcTDTSFRwqwDX0gWAoVtmRVE
 5yMfyxM+HuJ4ndTUn8DlW63S4GXQ4COZKhTs9alFzsLYfbs=
X-Google-Smtp-Source: AMsMyM4iXHwAM8Fq7UErqr9WXoXyBH6IkYmbfrgGd5tKYM9Wp4o1B9Ws5QoDYbOr0ZJJpJ1flwUg3l/FIemyBywjqto=
X-Received: by 2002:a17:906:65c6:b0:73c:8897:65b0 with SMTP id
 z6-20020a17090665c600b0073c889765b0mr1272662ejn.322.1663275803384; Thu, 15
 Sep 2022 14:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
 <20220915-stolen-v1-2-117c5f295bb2@intel.com>
In-Reply-To: <20220915-stolen-v1-2-117c5f295bb2@intel.com>
From: Caz Yokoyama <cazyokoyama@gmail.com>
Date: Thu, 15 Sep 2022 14:03:21 -0700
Message-ID: <CABhNg0jsonUT=o2v5suVw-voR6AcKUH=DafyXKdxaqo9G3eXpg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v1 2/4] drm/i915: Add missing mask when
 reading GEN12_DSMBASE
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: multipart/alternative; boundary="0000000000006c9f0f05e8bd9323"
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
Cc: intel-gfx@lists.freedesktop.org, tejas.upadhyay@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006c9f0f05e8bd9323
Content-Type: text/plain; charset="UTF-8"

Reviewed-by:  Caz Yokoyama <caz@caztech.com>
Better to be safe.


On Thu, Sep 15, 2022 at 1:40 PM Lucas De Marchi <lucas.demarchi@intel.com>
wrote:

> DSMBASE register is defined so BDSM bitfield contains the bits 63 to 20
> of the base address of stolen. For the supported platforms bits 0-19 are
> zero but that may not be true in future. Add the missing mask.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 42f4769bb4ac..c34065fe2ecc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -814,7 +814,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private
> *i915, u16 type,
>                 return ERR_PTR(-ENXIO);
>
>         /* Use DSM base address instead for stolen memory */
> -       dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
> +       dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) &
> GEN12_BDSM_MASK;
>         if (IS_DG1(uncore->i915)) {
>                 lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>                 if (WARN_ON(lmem_size < dsm_base))
> diff --git a/drivers/gpu/drm/i915/i915_reg.h
> b/drivers/gpu/drm/i915/i915_reg.h
> index 1a9bd829fc7e..0301874c76ba 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7953,6 +7953,7 @@ enum skl_power_gate {
>
>  #define GEN12_GSMBASE                  _MMIO(0x108100)
>  #define GEN12_DSMBASE                  _MMIO(0x1080C0)
> +#define   GEN12_BDSM_MASK              GENMASK(63, 20)
>
>  #define XEHP_CLOCK_GATE_DIS            _MMIO(0x101014)
>  #define   SGSI_SIDECLK_DIS             REG_BIT(17)
>
> --
> b4 0.10.0-dev-bbe61
>


-- 
-caz, caz at caztech dot com, 503-six one zero - five six nine nine(m)

--0000000000006c9f0f05e8bd9323
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-il">Reviewed</span>-<span class=3D"gm=
ail-il">by</span>:=C2=A0=C2=A0<span name=3D"Caz Yokoyama" class=3D"gmail-gD=
" style=3D"font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica=
,Arial,sans-serif;white-space:nowrap;color:rgb(31,31,31);font-size:0.875rem=
;font-weight:bold;display:inline;vertical-align:top;line-height:20px"><span=
 style=3D"vertical-align:top">Caz Yokoyama</span></span><span style=3D"colo=
r:rgb(95,99,104);font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Hel=
vetica,Arial,sans-serif;font-size:0.75rem;font-weight:inherit;white-space:n=
owrap">=C2=A0</span><span class=3D"gmail-go" style=3D"font-family:&quot;Goo=
gle Sans&quot;,Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:0.75=
rem;font-weight:inherit;white-space:nowrap;vertical-align:top;color:rgb(94,=
94,94)"><span aria-hidden=3D"true">&lt;</span><a href=3D"mailto:caz@caztech=
.com">caz@caztech.com</a><span aria-hidden=3D"true">&gt;</span></span><div>=
<span class=3D"gmail-go" style=3D"font-family:&quot;Google Sans&quot;,Robot=
o,RobotoDraft,Helvetica,Arial,sans-serif;font-size:0.75rem;font-weight:inhe=
rit;white-space:nowrap;vertical-align:top;color:rgb(94,94,94)"><span aria-h=
idden=3D"true">Better to be safe.</span></span></div><div><span class=3D"gm=
ail-go" style=3D"font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Hel=
vetica,Arial,sans-serif;font-size:0.75rem;font-weight:inherit;white-space:n=
owrap;vertical-align:top;color:rgb(94,94,94)"><span aria-hidden=3D"true"><b=
r></span></span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, Sep 15, 2022 at 1:40 PM Lucas De Marchi &lt;<=
a href=3D"mailto:lucas.demarchi@intel.com">lucas.demarchi@intel.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">DSMBASE =
register is defined so BDSM bitfield contains the bits 63 to 20<br>
of the base address of stolen. For the supported platforms bits 0-19 are<br=
>
zero but that may not be true in future. Add the missing mask.<br>
<br>
Signed-off-by: Lucas De Marchi &lt;<a href=3D"mailto:lucas.demarchi@intel.c=
om" target=3D"_blank">lucas.demarchi@intel.com</a>&gt;<br>
<br>
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i=
915/gem/i915_gem_stolen.c<br>
index 42f4769bb4ac..c34065fe2ecc 100644<br>
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c<br>
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c<br>
@@ -814,7 +814,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i91=
5, u16 type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(-ENX=
IO);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Use DSM base address instead for stolen memo=
ry */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsm_base =3D intel_uncore_read64(uncore, GEN12_=
DSMBASE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsm_base =3D intel_uncore_read64(uncore, GEN12_=
DSMBASE) &amp; GEN12_BDSM_MASK;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_DG1(uncore-&gt;i915)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lmem_size =3D pci_r=
esource_len(pdev, GEN12_LMEM_BAR);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (WARN_ON(lmem_si=
ze &lt; dsm_base))<br>
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_re=
g.h<br>
index 1a9bd829fc7e..0301874c76ba 100644<br>
--- a/drivers/gpu/drm/i915/i915_reg.h<br>
+++ b/drivers/gpu/drm/i915/i915_reg.h<br>
@@ -7953,6 +7953,7 @@ enum skl_power_gate {<br>
<br>
=C2=A0#define GEN12_GSMBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 _MMIO(0x108100)<br>
=C2=A0#define GEN12_DSMBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 _MMIO(0x1080C0)<br>
+#define=C2=A0 =C2=A0GEN12_BDSM_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 GENMASK(63, 20)<br>
<br>
=C2=A0#define XEHP_CLOCK_GATE_DIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
_MMIO(0x101014)<br>
=C2=A0#define=C2=A0 =C2=A0SGSI_SIDECLK_DIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0REG_BIT(17)<br>
<br>
-- <br>
b4 0.10.0-dev-bbe61<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>-caz, caz at =
caztech dot com, 503-six one zero - five six nine nine(m)<br></div></div></=
div></div></div></div></div></div></div></div></div>

--0000000000006c9f0f05e8bd9323--
