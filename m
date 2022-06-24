Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4347C55B33A
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 19:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D6810EAEE;
	Sun, 26 Jun 2022 17:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE19610EEDE;
 Fri, 24 Jun 2022 23:41:55 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u12so7628342eja.8;
 Fri, 24 Jun 2022 16:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=06o00CsCfts/CWKq7jk4zQo0BE9ITos2XHznZI1fCF4=;
 b=SBBa6cs6PibPqogEpTeNmIyhgDn3785EM9iyEGOAD2zPTRu3qiWMAgLk5qUUBF7SrP
 2j5hhYN7/GXmBab4WKcDvFcDTFb66XFI2DbkfGOQmEitc0IR5vbHSfRk8qVjBq1BsuuB
 IlSrE30YcxLSBdTbPShLR2fapnjvjTVVpL5RoJC74SkVZH9li7O/ZLjl6mGEx/pHzw8U
 eUxmqzNujs3Soxzv1WZ0niZ4bQDwvX/mVWebfFP87GNsiLiJWNcWh1f6mtBMTnTR4GG+
 u3dUi1g/ZKGaGogOqsgFDzWdCRJGZ31nVhB0+uiQI05SIfcbw3rAO/ykC0c0FoEvU7xk
 Lt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06o00CsCfts/CWKq7jk4zQo0BE9ITos2XHznZI1fCF4=;
 b=b9GZLLHLNL+rdOIBp9OS/XCiDJtT+BvC2tuJKHl+5e6xUJiRf+iulYj7XEmfyYGJSL
 FSajg6uhAABTdIBG6HQ+7rPfi0YKBku9HyasXP+GNU7xcsLePGE3FgTHrt26QIq1o5km
 n8xoWDTDZf5H/q52zBa1JjbbIghHx8ESDS5AOGIAjCBfjoWzZH1/DtIBTItSwBAG6o9A
 59tCjEfWOuOISuI0uSPdovrVoEEwe51CFRKfV74TgFrcQ4LmrVXSr02ZtfhwjALxAlkd
 dV+tvIWEb3RhgPXFuva1PnLgH5exnLOvW9VZybMMXWal4HBi7Vy6lbXaTUzFBCk9JR/G
 ZLlA==
X-Gm-Message-State: AJIora9QtxiVj7VXjEbBMw8nnKeDOoKoWxd0xT16oYw7Ct38eHcLgrVh
 vDPnz+DlfLMDGINQKptZGiFZC86OqH6O1zAfMJbVPWkvK1U=
X-Google-Smtp-Source: AGRyM1vWAtOVLbVYpft4M526yeXtAYu/wsBQ5olqsDtgwD1QLTKsk9OIIHaoaaACb321po4ZjcRe28AzEiBVWVr0pi4=
X-Received: by 2002:a17:907:969f:b0:722:d37b:c82d with SMTP id
 hd31-20020a170907969f00b00722d37bc82dmr1396554ejc.770.1656114114297; Fri, 24
 Jun 2022 16:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220624210328.308630-1-matthew.d.roper@intel.com>
 <20220624210328.308630-2-matthew.d.roper@intel.com>
In-Reply-To: <20220624210328.308630-2-matthew.d.roper@intel.com>
From: Caz Yokoyama <cazyokoyama@gmail.com>
Date: Fri, 24 Jun 2022 16:41:43 -0700
Message-ID: <CABhNg0hEsrYp0c65m0sDpjcgQrDA3RK4OvKg8Of3TcJW6M1=Fg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Prefer "XEHP_" prefix for
 registers
To: Matt Roper <matthew.d.roper@intel.com>
Content-Type: multipart/alternative; boundary="0000000000007d81cb05e23a1db6"
X-Mailman-Approved-At: Sun, 26 Jun 2022 17:47:58 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007d81cb05e23a1db6
Content-Type: text/plain; charset="UTF-8"

Reviewed-by:  Caz Yokoyama <caz@caztech.com>
-caz


On Fri, Jun 24, 2022 at 2:04 PM Matt Roper <matthew.d.roper@intel.com>
wrote:

> We've been introducing new registers with a mix of "XEHP_"
> (architecture) and "XEHPSDV_" (platform) prefixes.  For consistency,
> let's settle on "XEHP_" as the preferred form.
>
> XEHPSDV_RP_STATE_CAP stays with its current name since that's truly a
> platform-specific register and not something that applies to the Xe_HP
> architecture as a whole.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c  | 4 ++--
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 8 ++++----
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 4 ++--
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c | 8 ++++----
>  drivers/gpu/drm/i915/i915_reg.h             | 6 +++---
>  5 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index e63de9c06596..166d0a4b9e8c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -836,8 +836,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private
> *i915, u16 type,
>         } else {
>                 resource_size_t lmem_range;
>
> -               lmem_range = intel_gt_mcr_read_any(&i915->gt0,
> XEHPSDV_TILE0_ADDR_RANGE) & 0xFFFF;
> -               lmem_size = lmem_range >> XEHPSDV_TILE_LMEM_RANGE_SHIFT;
> +               lmem_range = intel_gt_mcr_read_any(&i915->gt0,
> XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
> +               lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
>                 lmem_size *= SZ_1G;
>         }
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 61815b6e87de..37c1095d8603 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -324,11 +324,11 @@
>
>  #define GEN12_PAT_INDEX(index)                 _MMIO(0x4800 + (index) * 4)
>
> -#define XEHPSDV_TILE0_ADDR_RANGE               _MMIO(0x4900)
> -#define   XEHPSDV_TILE_LMEM_RANGE_SHIFT                8
> +#define XEHP_TILE0_ADDR_RANGE                  _MMIO(0x4900)
> +#define   XEHP_TILE_LMEM_RANGE_SHIFT           8
>
> -#define XEHPSDV_FLAT_CCS_BASE_ADDR             _MMIO(0x4910)
> -#define   XEHPSDV_CCS_BASE_SHIFT               8
> +#define XEHP_FLAT_CCS_BASE_ADDR                        _MMIO(0x4910)
> +#define   XEHP_CCS_BASE_SHIFT                  8
>
>  #define GAMTARBMODE                            _MMIO(0x4a08)
>  #define   ARB_MODE_BWGTLB_DISABLE              (1 << 9)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index ae8a8f725f01..73a8b46e0234 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -679,7 +679,7 @@ static ssize_t media_RP0_freq_mhz_show(struct device
> *dev,
>         u32 val;
>         int err;
>
> -       err = snb_pcode_read_p(gt->uncore, XEHPSDV_PCODE_FREQUENCY_CONFIG,
> +       err = snb_pcode_read_p(gt->uncore, XEHP_PCODE_FREQUENCY_CONFIG,
>                                PCODE_MBOX_FC_SC_READ_FUSED_P0,
>                                PCODE_MBOX_DOMAIN_MEDIAFF, &val);
>
> @@ -700,7 +700,7 @@ static ssize_t media_RPn_freq_mhz_show(struct device
> *dev,
>         u32 val;
>         int err;
>
> -       err = snb_pcode_read_p(gt->uncore, XEHPSDV_PCODE_FREQUENCY_CONFIG,
> +       err = snb_pcode_read_p(gt->uncore, XEHP_PCODE_FREQUENCY_CONFIG,
>                                PCODE_MBOX_FC_SC_READ_FUSED_PN,
>                                PCODE_MBOX_DOMAIN_MEDIAFF, &val);
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index 2ff448047020..d09b996a9759 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -105,12 +105,12 @@ static struct intel_memory_region *setup_lmem(struct
> intel_gt *gt)
>                 resource_size_t lmem_range;
>                 u64 tile_stolen, flat_ccs_base;
>
> -               lmem_range = intel_gt_mcr_read_any(&i915->gt0,
> XEHPSDV_TILE0_ADDR_RANGE) & 0xFFFF;
> -               lmem_size = lmem_range >> XEHPSDV_TILE_LMEM_RANGE_SHIFT;
> +               lmem_range = intel_gt_mcr_read_any(&i915->gt0,
> XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
> +               lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
>                 lmem_size *= SZ_1G;
>
> -               flat_ccs_base = intel_gt_mcr_read_any(gt,
> XEHPSDV_FLAT_CCS_BASE_ADDR);
> -               flat_ccs_base = (flat_ccs_base >> XEHPSDV_CCS_BASE_SHIFT)
> * SZ_64K;
> +               flat_ccs_base = intel_gt_mcr_read_any(gt,
> XEHP_FLAT_CCS_BASE_ADDR);
> +               flat_ccs_base = (flat_ccs_base >> XEHP_CCS_BASE_SHIFT) *
> SZ_64K;
>
>                 /* FIXME: Remove this when we have small-bar enabled */
>                 if (pci_resource_len(pdev, 2) < lmem_size) {
> diff --git a/drivers/gpu/drm/i915/i915_reg.h
> b/drivers/gpu/drm/i915/i915_reg.h
> index cf5e16abf6c7..643d7f020a4a 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6767,12 +6767,12 @@
>  #define     DG1_UNCORE_GET_INIT_STATUS         0x0
>  #define     DG1_UNCORE_INIT_STATUS_COMPLETE    0x1
>  #define GEN12_PCODE_READ_SAGV_BLOCK_TIME_US    0x23
> -#define   XEHPSDV_PCODE_FREQUENCY_CONFIG               0x6e    /*
> xehpsdv, pvc */
> -/* XEHPSDV_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define   XEHP_PCODE_FREQUENCY_CONFIG          0x6e    /* xehpsdv, pvc */
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>  #define     PCODE_MBOX_FC_SC_READ_FUSED_P0     0x0
>  #define     PCODE_MBOX_FC_SC_READ_FUSED_PN     0x1
>  /* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> -/*   XEHPSDV_PCODE_FREQUENCY_CONFIG param2 */
> +/*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
>  #define     PCODE_MBOX_DOMAIN_NONE             0x0
>  #define     PCODE_MBOX_DOMAIN_MEDIAFF          0x3
>  #define GEN6_PCODE_DATA                                _MMIO(0x138128)
> --
> 2.36.1
>
>

-- 
-caz, caz at caztech dot com, 503-six one zero - five six nine nine(m)

--0000000000007d81cb05e23a1db6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by:=C2=A0=C2=A0Caz Yokoyama &lt;<a href=3D"mailto=
:caz@caztech.com">caz@caztech.com</a>&gt;<br><div>-caz</div><div><br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, Jun 24, 2022 at 2:04 PM Matt Roper &lt;<a href=3D"mailto:matthew.d.=
roper@intel.com" target=3D"_blank">matthew.d.roper@intel.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We&#39;ve been =
introducing new registers with a mix of &quot;XEHP_&quot;<br>
(architecture) and &quot;XEHPSDV_&quot; (platform) prefixes.=C2=A0 For cons=
istency,<br>
let&#39;s settle on &quot;XEHP_&quot; as the preferred form.<br>
<br>
XEHPSDV_RP_STATE_CAP stays with its current name since that&#39;s truly a<b=
r>
platform-specific register and not something that applies to the Xe_HP<br>
architecture as a whole.<br>
<br>
Signed-off-by: Matt Roper &lt;<a href=3D"mailto:matthew.d.roper@intel.com" =
target=3D"_blank">matthew.d.roper@intel.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/i915/gem/i915_gem_stolen.c=C2=A0 | 4 ++--<br>
=C2=A0drivers/gpu/drm/i915/gt/intel_gt_regs.h=C2=A0 =C2=A0 =C2=A0| 8 ++++--=
--<br>
=C2=A0drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 4 ++--<br>
=C2=A0drivers/gpu/drm/i915/gt/intel_region_lmem.c | 8 ++++----<br>
=C2=A0drivers/gpu/drm/i915/i915_reg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 6 +++---<br>
=C2=A05 files changed, 15 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i=
915/gem/i915_gem_stolen.c<br>
index e63de9c06596..166d0a4b9e8c 100644<br>
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c<br>
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c<br>
@@ -836,8 +836,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i91=
5, u16 type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resource_size_t lme=
m_range;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmem_range =3D inte=
l_gt_mcr_read_any(&amp;i915-&gt;gt0, XEHPSDV_TILE0_ADDR_RANGE) &amp; 0xFFFF=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmem_size =3D lmem_=
range &gt;&gt; XEHPSDV_TILE_LMEM_RANGE_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmem_range =3D inte=
l_gt_mcr_read_any(&amp;i915-&gt;gt0, XEHP_TILE0_ADDR_RANGE) &amp; 0xFFFF;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmem_size =3D lmem_=
range &gt;&gt; XEHP_TILE_LMEM_RANGE_SHIFT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lmem_size *=3D SZ_1=
G;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915=
/gt/intel_gt_regs.h<br>
index 61815b6e87de..37c1095d8603 100644<br>
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h<br>
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h<br>
@@ -324,11 +324,11 @@<br>
<br>
=C2=A0#define GEN12_PAT_INDEX(index)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0_MMIO(0x4800 + (index) * 4)<br>
<br>
-#define XEHPSDV_TILE0_ADDR_RANGE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0_MMIO(0x4900)<br>
-#define=C2=A0 =C2=A0XEHPSDV_TILE_LMEM_RANGE_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
+#define XEHP_TILE0_ADDR_RANGE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 _MMIO(0x4900)<br>
+#define=C2=A0 =C2=A0XEHP_TILE_LMEM_RANGE_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A08<br>
<br>
-#define XEHPSDV_FLAT_CCS_BASE_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0_MMIO(0x4910)<br>
-#define=C2=A0 =C2=A0XEHPSDV_CCS_BASE_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A08<br>
+#define XEHP_FLAT_CCS_BASE_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _MMIO(0x4910)<br>
+#define=C2=A0 =C2=A0XEHP_CCS_BASE_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
<br>
=C2=A0#define GAMTARBMODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _MMIO(0x4a08)<br>
=C2=A0#define=C2=A0 =C2=A0ARB_MODE_BWGTLB_DISABLE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 9)<br>
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/=
i915/gt/intel_gt_sysfs_pm.c<br>
index ae8a8f725f01..73a8b46e0234 100644<br>
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c<br>
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c<br>
@@ -679,7 +679,7 @@ static ssize_t media_RP0_freq_mhz_show(struct device *d=
ev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D snb_pcode_read_p(gt-&gt;uncore, XEHPSDV=
_PCODE_FREQUENCY_CONFIG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D snb_pcode_read_p(gt-&gt;uncore, XEHP_PC=
ODE_FREQUENCY_CONFIG,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCODE_MBOX_FC_SC_READ_FUSED_P0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCODE_MBOX_DOMAIN_MEDIAFF, &amp;val);=
<br>
<br>
@@ -700,7 +700,7 @@ static ssize_t media_RPn_freq_mhz_show(struct device *d=
ev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D snb_pcode_read_p(gt-&gt;uncore, XEHPSDV=
_PCODE_FREQUENCY_CONFIG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D snb_pcode_read_p(gt-&gt;uncore, XEHP_PC=
ODE_FREQUENCY_CONFIG,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCODE_MBOX_FC_SC_READ_FUSED_PN,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCODE_MBOX_DOMAIN_MEDIAFF, &amp;val);=
<br>
<br>
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/=
i915/gt/intel_region_lmem.c<br>
index 2ff448047020..d09b996a9759 100644<br>
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c<br>
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c<br>
@@ -105,12 +105,12 @@ static struct intel_memory_region *setup_lmem(struct =
intel_gt *gt)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resource_size_t lme=
m_range;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 tile_stolen, fl=
at_ccs_base;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmem_range =3D inte=
l_gt_mcr_read_any(&amp;i915-&gt;gt0, XEHPSDV_TILE0_ADDR_RANGE) &amp; 0xFFFF=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmem_size =3D lmem_=
range &gt;&gt; XEHPSDV_TILE_LMEM_RANGE_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmem_range =3D inte=
l_gt_mcr_read_any(&amp;i915-&gt;gt0, XEHP_TILE0_ADDR_RANGE) &amp; 0xFFFF;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmem_size =3D lmem_=
range &gt;&gt; XEHP_TILE_LMEM_RANGE_SHIFT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lmem_size *=3D SZ_1=
G;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flat_ccs_base =3D i=
ntel_gt_mcr_read_any(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flat_ccs_base =3D (=
flat_ccs_base &gt;&gt; XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flat_ccs_base =3D i=
ntel_gt_mcr_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flat_ccs_base =3D (=
flat_ccs_base &gt;&gt; XEHP_CCS_BASE_SHIFT) * SZ_64K;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: Remove th=
is when we have small-bar enabled */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pci_resource_le=
n(pdev, 2) &lt; lmem_size) {<br>
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_re=
g.h<br>
index cf5e16abf6c7..643d7f020a4a 100644<br>
--- a/drivers/gpu/drm/i915/i915_reg.h<br>
+++ b/drivers/gpu/drm/i915/i915_reg.h<br>
@@ -6767,12 +6767,12 @@<br>
=C2=A0#define=C2=A0 =C2=A0 =C2=A0DG1_UNCORE_GET_INIT_STATUS=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x0<br>
=C2=A0#define=C2=A0 =C2=A0 =C2=A0DG1_UNCORE_INIT_STATUS_COMPLETE=C2=A0 =C2=
=A0 0x1<br>
=C2=A0#define GEN12_PCODE_READ_SAGV_BLOCK_TIME_US=C2=A0 =C2=A0 0x23<br>
-#define=C2=A0 =C2=A0XEHPSDV_PCODE_FREQUENCY_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x6e=C2=A0 =C2=A0 /* xehpsdv, pvc */<br>
-/* XEHPSDV_PCODE_FREQUENCY_CONFIG sub-commands (param1) */<br>
+#define=C2=A0 =C2=A0XEHP_PCODE_FREQUENCY_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x6e=C2=A0 =C2=A0 /* xehpsdv, pvc */<br>
+/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */<br>
=C2=A0#define=C2=A0 =C2=A0 =C2=A0PCODE_MBOX_FC_SC_READ_FUSED_P0=C2=A0 =C2=
=A0 =C2=A00x0<br>
=C2=A0#define=C2=A0 =C2=A0 =C2=A0PCODE_MBOX_FC_SC_READ_FUSED_PN=C2=A0 =C2=
=A0 =C2=A00x1<br>
=C2=A0/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */<br>
-/*=C2=A0 =C2=A0XEHPSDV_PCODE_FREQUENCY_CONFIG param2 */<br>
+/*=C2=A0 =C2=A0XEHP_PCODE_FREQUENCY_CONFIG param2 */<br>
=C2=A0#define=C2=A0 =C2=A0 =C2=A0PCODE_MBOX_DOMAIN_NONE=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0<br>
=C2=A0#define=C2=A0 =C2=A0 =C2=A0PCODE_MBOX_DOMAIN_MEDIAFF=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x3<br>
=C2=A0#define GEN6_PCODE_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _MMIO(0x=
138128)<br>
-- <br>
2.36.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div>-caz, caz at caztech dot com, 503-six o=
ne zero - five six nine nine(m)<br></div></div></div></div></div></div></di=
v></div></div></div></div>

--0000000000007d81cb05e23a1db6--
