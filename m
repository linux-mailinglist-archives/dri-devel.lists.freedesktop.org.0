Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D66E4E5C29
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 01:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699A110E358;
	Thu, 24 Mar 2022 00:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63E710E358;
 Thu, 24 Mar 2022 00:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648080483; x=1679616483;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ScW1KifLvIg/rGF7pWVloW5MzZ/vex/fcHB4I2H74jk=;
 b=EQnt78YyV39GVUglTjrxya/tzt8fwKxKm8NCNnYLpr0HDyN1vWp0UhGM
 uIO8XwF6UP7X6B3wYXnNpEdQoWpQqhtHku2BH4JTl7r5gdtN6K0mOKAB7
 GG/o/TUtcqxm5O5KnlsT8aVt33DYyH4/MgQSYz1Twn1xKDsznKtkf5jt7
 d5ToW02CY+A0u+WFo4igCoNQt2KYn4vOTsQiydAwB77osIZ29ZXg//6R6
 opfA5abGktAa6PLUr9rXLabd7KacbckxWj9WZa6+Wq+nvkjJdTGhG0W7P
 CI+zUZC4AbN0OX5ANRmk6L34KUGhR2c2VGQffaRxymgtPCI/iMVEOLb9f g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="257965366"
X-IronPort-AV: E=Sophos;i="5.90,205,1643702400"; 
 d="scan'208,217";a="257965366"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 17:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,205,1643702400"; 
 d="scan'208,217";a="785978024"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga006.fm.intel.com with ESMTP; 23 Mar 2022 17:08:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Mar 2022 00:07:59 +0000
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2308.021;
 Wed, 23 Mar 2022 17:07:58 -0700
From: "Chery, Nanley G" <nanley.g.chery@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "C, Ramalingam"
 <ramalingam.c@intel.com>
Subject: RE: [Intel-gfx] [PATCH v5 13/19] drm/i915: Introduce new Tile 4 format
Thread-Topic: RE: [Intel-gfx] [PATCH v5 13/19] drm/i915: Introduce new Tile 4
 format
Thread-Index: Adg/EpoKBUHSMXe8SgOFLlDUEvgGMw==
Date: Thu, 24 Mar 2022 00:07:58 +0000
Message-ID: <d3bcbbb51ff346219fabe4f17fba70d3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
x-originating-ip: [10.22.254.132]
Content-Type: multipart/alternative;
 boundary="_000_d3bcbbb51ff346219fabe4f17fba70d3intelcom_"
MIME-Version: 1.0
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_d3bcbbb51ff346219fabe4f17fba70d3intelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Found an error in this description..

> From: Stanislav Lisovskiy stanislav.lisovskiy@intel.com<mailto:stanislav.=
lisovskiy@intel.com>
>
> This tiling layout uses 4KB tiles in a row-major layout. It has the same
> shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). =
It
> only differs from Tile Y at the 256B granularity in between. At this
> granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has a s=
hape
> of 64B x 8 rows.
>

256B should be 512B (same feedback for the modifier description).

Regards,
Nanley

> Reviewed-by: Imre Deak imre.deak@intel.com<mailto:imre.deak@intel.com>
> Acked-by: Nanley Chery nanley.g.chery@intel.com<mailto:nanley.g.chery@int=
el.com>
> Signed-off-by: Stanislav Lisovskiy stanislav.lisovskiy@intel.com<mailto:s=
tanislav.lisovskiy@intel.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index fc0c1454d275..b73fe6797fc3 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -572,6 +572,17 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8=
)
>
> +/*
> + * Intel Tile 4 layout
> + *
> + * This is a tiled layout using 4KB tiles in a row-major layout. It has =
the same
> + * shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x =
4). It
> + * only differs from Tile Y at the 256B granularity in between. At this
> + * granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has=
 a shape
> + * of 64B x 8 rows.
> + */
> +#define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
>

--_000_d3bcbbb51ff346219fabe4f17fba70d3intelcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Found an error in this description..<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; From: Stanislav Lisovskiy <a href=3D"mailto:sta=
nislav.lisovskiy@intel.com">
stanislav.lisovskiy@intel.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt; This tiling layout uses 4KB tiles in a row-majo=
r layout. It has the same<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; shape as Tile Y at two granularities: 4KB (128B=
 x 32) and 64B (16B x 4). It<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; only differs from Tile Y at the 256B granularit=
y in between. At this<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; granularity, Tile Y has a shape of 16B x 32 row=
s, but this tiling has a shape<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; of 64B x 8 rows.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">256B should be 512B (same feedback for the modifier =
description).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Nanley<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Reviewed-by: Imre Deak <a href=3D"mailto:imre.d=
eak@intel.com">
imre.deak@intel.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Acked-by: Nanley Chery <a href=3D"mailto:nanley=
.g.chery@intel.com">
nanley.g.chery@intel.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Signed-off-by: Stanislav Lisovskiy <a href=3D"m=
ailto:stanislav.lisovskiy@intel.com">
stanislav.lisovskiy@intel.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt; ---<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp; include/uapi/drm/drm_fourcc.h | 11 &#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp; 1 file changed, 11 insertions(&#43;)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt; diff --git a/include/uapi/drm/drm_fourcc.h b/in=
clude/uapi/drm/drm_fourcc.h<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; index fc0c1454d275..b73fe6797fc3 100644<o:p></o=
:p></p>
<p class=3D"MsoNormal">&gt; --- a/include/uapi/drm/drm_fourcc.h<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&gt; &#43;&#43;&#43; b/include/uapi/drm/drm_fourcc.h=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; @@ -572,6 &#43;572,17 @@ extern &quot;C&quot; {=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp; */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp; #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_=
CCS_CC fourcc_mod_code(INTEL, 8)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &#43;/*<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &#43; * Intel Tile 4 layout<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &#43; *<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &#43; * This is a tiled layout using 4KB tiles =
in a row-major layout. It has the same<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &#43; * shape as Tile Y at two granularities: 4=
KB (128B x 32) and 64B (16B x 4). It<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &#43; * only differs from Tile Y at the 256B gr=
anularity in between. At this<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &#43; * granularity, Tile Y has a shape of 16B =
x 32 rows, but this tiling has a shape<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &#43; * of 64B x 8 rows.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &#43; */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &#43;#define I915_FORMAT_MOD_4_TILED&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourcc_mod_code(INTEL, 9)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp; /*<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp; * Tiled, NV12MT, grouped in 64 (pix=
els) x 32 (lines) -sized macroblocks<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp; *<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_d3bcbbb51ff346219fabe4f17fba70d3intelcom_--
