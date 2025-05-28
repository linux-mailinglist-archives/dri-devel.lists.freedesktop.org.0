Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DEBAC6E02
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFCE10E0A6;
	Wed, 28 May 2025 16:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qsc.com header.i=@qsc.com header.b="iG9VWN3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Wed, 28 May 2025 16:30:14 UTC
Received: from us-smtp-delivery-160.mimecast.com
 (us-smtp-delivery-160.mimecast.com [170.10.129.160])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C103910E5F7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qsc.com;
 s=mimecast20190503; t=1748449813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=SDGjtLHFivyju2S3ua35TSWYVrvlO0arUAwmyyCb9uM=;
 b=iG9VWN3KrvG2HypB0ebS/Qxv67WRbNYP2hVZsVMawORZWXuxDfiDeY9Ar/aSu22CXmtnOp
 pDZnIcgHw9y6CuGkerM8XAiCuATitMrZM2eeN2sJAaXUV/vbc3pGznTFaLAiQapKyLYiKv
 YTNrmDefhF92hcNPMbt4bk4boVl5798=
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2129.outbound.protection.outlook.com [40.107.96.129]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610--vH24aAtO3WKMwH4yHlvKw-2; Wed, 28 May 2025 12:23:58 -0400
X-MC-Unique: -vH24aAtO3WKMwH4yHlvKw-2
X-Mimecast-MFC-AGG-ID: -vH24aAtO3WKMwH4yHlvKw_1748449438
Received: from SJ2PR16MB5525.namprd16.prod.outlook.com (2603:10b6:a03:539::5)
 by BY1PR16MB6368.namprd16.prod.outlook.com (2603:10b6:a03:4a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 16:23:55 +0000
Received: from SJ2PR16MB5525.namprd16.prod.outlook.com
 ([fe80::82ea:a206:81c1:314d]) by SJ2PR16MB5525.namprd16.prod.outlook.com
 ([fe80::82ea:a206:81c1:314d%6]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 16:23:55 +0000
From: Sean Summers <Sean.Summers@qsc.com>
To: "andri@yngvason.is" <andri@yngvason.is>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/4] New DRM properties for output color format
Thread-Topic: [PATCH v2 0/4] New DRM properties for output color format
Thread-Index: AQHbz+u74I6v2bZ2N0Os+Ly4+ExtiQ==
Date: Wed, 28 May 2025 16:23:55 +0000
Message-ID: <SJ2PR16MB5525F636C5B7620CA5D400848167A@SJ2PR16MB5525.namprd16.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR16MB5525:EE_|BY1PR16MB6368:EE_
x-ms-office365-filtering-correlation-id: 71866686-b81f-4226-f1a3-08dd9e040a8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|38070700018
x-microsoft-antispam-message-info: =?iso-8859-1?Q?HG2Kavh0B/l8dylYfQfeYK0zjg4zJXMFSeCd17NC74jwddGBDGxK/M7eFI?=
 =?iso-8859-1?Q?pimNXtNsx2mLdk88YI0qP2cc50pSH7RfjRRhLNrlXbQVadlrJXnaxfBHjX?=
 =?iso-8859-1?Q?0i0xL8NRaKqn6GdOjqjqFpTejdkC/ONnN87pPXeozDhOxYrRRNiUnzg752?=
 =?iso-8859-1?Q?kPqRbrFqgxNsjSx2n16hOGXFVmjOXroEpx8CokBzRNeHTlDJ3KXt133ZhY?=
 =?iso-8859-1?Q?t+H6koFbmwWfBrocnMnWFwMUwg8lGWx6CgbO3Iu2a19vO/mRYZk4Jl6iQW?=
 =?iso-8859-1?Q?U7qAgXTdktFAVlxR+Dl+7VMpYCmIEy5MndARL5uSPDIfiyaYbhbGa/Z5V7?=
 =?iso-8859-1?Q?gM3sOgzzW5Y/kFPoj5hMpQEge2ITJXfYYmBBNUbsKeG9lwZ6X4ByjvZgt+?=
 =?iso-8859-1?Q?AkoH1LOblva6RevW+rXtl+lKKRZ/B6KE4qGDaFsMeMs6EZh2SndbkArQxO?=
 =?iso-8859-1?Q?qARbK/HglRwMf/Hcy3KO3sfyRCYo50ZrQryP2Pyu79cK74jwKpqagyE7T1?=
 =?iso-8859-1?Q?BjPNaRuXEYYVZVehWfpxOLkH2Lfj8A6FnmSC6wx8U1sgGhzzxjwp/0D9Gi?=
 =?iso-8859-1?Q?Dy6iCLUljNwnNJ0JuhuQ92AhR5iIYGgZpcsOmxmlupmUmhEUWHI+EaXCkt?=
 =?iso-8859-1?Q?rtGRHC3x53R5zEXo7f6+t22aLFW+4GIb5ZcNxoY7u+dAxZDi71PF6D+S+k?=
 =?iso-8859-1?Q?27Yb1UvxvqZFXYebq3qBUvr0Vn7LJEKEFJYrR9WFzcl50Y+VgnPLEJ13tZ?=
 =?iso-8859-1?Q?DnV1aGhHbzDjqZJqOvWP4xbBhU0I1M3norZYyTKP2/RKlCRtpCd6K6zVRw?=
 =?iso-8859-1?Q?Cw7iuv0GCWomeegdRLTxTQMVkt7lthC3mL5pnsHHkkzGFFxp7bESqBgmvA?=
 =?iso-8859-1?Q?uFjkWArQwJNNAQ/LkFIMkydGAAaaUhyIdrqMf6jKguJC7At+lwFI9d975A?=
 =?iso-8859-1?Q?Q/neEvWM4ZVim4AwakXSFe62ZIbDK86zi06+W1GnrdSkvocv6fwVH4Jl66?=
 =?iso-8859-1?Q?mR5saHmIjfakGKZfHjqExMewlj/7iS4IeEL6/VjzRxRbig/zEBBTLksoeU?=
 =?iso-8859-1?Q?dOxhnxqb97eU3xheLq3wnYhxrWZyIjuTEVlBnM2ztAo13OYfBlyo/2865d?=
 =?iso-8859-1?Q?nXntv0nkGTWBgYkxnANj55tqWqEzIviOX6CCTArHdl2UxarG2mXCHsNgWN?=
 =?iso-8859-1?Q?rdoT4pzksA+qdk2nuMZIFfNI0+ulhpyJXgag6lmmUeFEl9YZzGMz8UY0oo?=
 =?iso-8859-1?Q?aBftp7/QvUSaqpT9CyaKb7xdjSjqZ3FzNoPFYo4jDVSZYFoag9ZfVG6ei9?=
 =?iso-8859-1?Q?vJExDc9oDEX1yM3zSxtUC9N4I+bMqoHilnPpyRw2gQbGgVgQddchLGsqsK?=
 =?iso-8859-1?Q?RV64jgsbmXCcbx6elNcf123L4Ah3uH4y2v2hXE2QknaahLO4Nj9MJsqirt?=
 =?iso-8859-1?Q?vSbh9rYb4yBUrEs05AG1NT00t3O5PlcJgokH4KufrEgh9ssHCG4BbNm/Zo?=
 =?iso-8859-1?Q?q3aoc3WHsQTZ1iyl/eWPcNwdxU8uo+43YINXPsrh8IaNZgaZgvHpB+z4Mp?=
 =?iso-8859-1?Q?F91QqI0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR16MB5525.namprd16.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018); DIR:OUT;
 SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UixMlC15KTNyh10+ggS3RpwP+IM5RGSeN6DrHIVb3oGq3qaz0QztcGIUZv?=
 =?iso-8859-1?Q?XlKRtSxFjfnSSPjLcNDKcdW3CzKI3qPYqTvFofF18FTRay4icN1sFAngaQ?=
 =?iso-8859-1?Q?z/7alNr6CrBNFmS182+iXH0MDzY2kJykMdh2IHdBITgeDRtIhgz+oLDoqt?=
 =?iso-8859-1?Q?j0pD44OgxLnjTRsgPhPNfjvA9jS07bUY6u2tcc/+H6dzD+yIVEQ0DwtJAY?=
 =?iso-8859-1?Q?PmsjssP7AakTHFfFDGk2JO221MsIT9pMOtaq3GDemkXXEWuqxo3dC5xf8u?=
 =?iso-8859-1?Q?nWMTWvyHPuqPM4rIL8OQ7zZ4GkII77wDRW7ehaZJEai+6imV0TUOY33tls?=
 =?iso-8859-1?Q?wiEaSf1Gnf5luvRi8OwUpwe7CeqJHi8TcWmPsI5MtS8nDirDhxm1guuTUz?=
 =?iso-8859-1?Q?QwaOFrwtOzd6aiIJM45pJj8mtLsDEL2UQYXhMx/0ujASjOAo7L0VjXFNCX?=
 =?iso-8859-1?Q?jQuPhvXzFTPy1EaVOGdVCNcw08Qbo55PfGoyHa5eWGjdwcivv3cvEn16H2?=
 =?iso-8859-1?Q?Se8IY7Q+7L3LNzumRhvB4Zx4jSzcAv6FLUJCntBJlgvYQc5Fbyxgh6d6FB?=
 =?iso-8859-1?Q?8wiNd5a2hBGwPMn5O45un2W7r9vz4M272WnsH138lNmVeLTVBC1OoxIJa4?=
 =?iso-8859-1?Q?3KSNadsVI59oH0lJTJHxjBbuKKbpvGvQF3NMIBOjSMRGo3uXbOvpii1n7i?=
 =?iso-8859-1?Q?gB9EypyaQwiCuIRR85SBQGKhNDCNJiFEBJ5VjDzzaoG7p/G2Se+YLlA8D/?=
 =?iso-8859-1?Q?XO0h+oPloA+Lg9KdT0CjAQvLGpo0PFwcq/GoaRLlrOcmG54NGKgkSUi/jZ?=
 =?iso-8859-1?Q?YIfHa0OZOD4sd6UypNtRarHPD/oxNnp3nqsFza0ruNZMY4pJyhzLhavDA4?=
 =?iso-8859-1?Q?8naQPexBNaZ1VIzMKzQ7J4YCt5CuC7peUFIpWxE4qrRL9D2R2obtslq2pv?=
 =?iso-8859-1?Q?XqpKn8jRfCVl2hYjn/Bo5MtS2nZ5453fvpqjNWnTGH0Hb8N80lnopVT51g?=
 =?iso-8859-1?Q?JzXgIeSsyW2pak1gO7wlm/IxV83CVbmkZCisq7pyvquBq6+enxyvOnns26?=
 =?iso-8859-1?Q?XS6Wi8NHxkBxvp9ejDhwgxuReqXBzBWqJuEAQSbhLPBBCHfckbVbhZLN1g?=
 =?iso-8859-1?Q?spnatgDUE/hO9NeSH3/5aHpyh6xvR/rCW8FsR+YzfQIUh3bKSq0Z2X3Ch2?=
 =?iso-8859-1?Q?d6WH0LF0AkdcaoIdwpu3t4VHncPBgVKYwZQLyCtQLETxL4ZBlLXyI+PgDn?=
 =?iso-8859-1?Q?wMSS8CrpI7BxKM3xaT4gVjXi28GDHzyBFdZ9/M43OyxYKjKL13gcEJ/qRg?=
 =?iso-8859-1?Q?WEdTyN1DJTnMPycG+TxQ6GEcl8Aj2b17KzKd21IfIw2hXdmxMTGCcZGeR7?=
 =?iso-8859-1?Q?+WNCwVHLmS8HI6PhF+MQa+9gKIrE3gAuCio0z5jjVIt5vcgrlKirQd+utG?=
 =?iso-8859-1?Q?EygmklpgA/igFtjoB7OuLjPdvwTul9qEkoY8wG8guCW80HQFug+nwM4xbj?=
 =?iso-8859-1?Q?simX/hc50KumB3G6fBy7O/JB7nn9Kya7D8DYp0syK7WY3diTXitQjuNjx+?=
 =?iso-8859-1?Q?DPqTXgFMOPTY80otTLCOMApBjtvDtwhS+4a1ngKWdVUs0CCkfMy8Nkk2DX?=
 =?iso-8859-1?Q?AAbM4IxnuHqN4ZS9++Q4qE4GRuy/aSKxIM?=
MIME-Version: 1.0
X-OriginatorOrg: qsc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR16MB5525.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71866686-b81f-4226-f1a3-08dd9e040a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 16:23:55.0356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23298f55-90ba-49c3-9286-576ec76d1e38
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2qFYx+TpYXC7pahbs1JOVPYY5JyjG0gXaFsUxug4pqT68H+sRWrIVGSvf1SWAFsf1lJVXYD5/ENMmmWZTB8ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR16MB6368
X-Mimecast-Spam-Score: 1
X-Mimecast-MFC-PROC-ID: ejDFdcR1dJkLHjFw1RyZqrozs0SPwmvB0mrM9SmRbaM_1748449438
X-Mimecast-Originator: qsc.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_SJ2PR16MB5525F636C5B7620CA5D400848167ASJ2PR16MB5525namp_"
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

--_000_SJ2PR16MB5525F636C5B7620CA5D400848167ASJ2PR16MB5525namp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Andri,

I've made this patch, but I'm unable to configure the video pipeline for YC=
C 420. I'm using libdrm's modetest to set the output format / colorspace an=
d pass a test pattern through. Modetest can see the new "force output forma=
t" property, but it's being rejected and falls back to RGB. I verified my E=
DID has support for YCC 420. Can you tell me how you're testing this change=
?

Here's my modetest command:
modetest -s 185:3840x2160-60@NV12 -w "185:force color format:8"

Thanks,
Sean

--_000_SJ2PR16MB5525F636C5B7620CA5D400848167ASJ2PR16MB5525namp_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Andri,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I've made this patch, but I'm unable to configure the video pipeline for YC=
C 420. I'm using libdrm's modetest to set the output format / colorspace an=
d pass a test pattern through. Modetest can see the new &quot;force output =
format&quot; property, but it's being rejected
 and falls back to RGB. I verified my EDID has support for YCC 420. Can you=
 tell me how you're testing this change?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Here's my modetest command:&nbsp;<br>
modetest -s 185:3840x2160-60@NV12 -w &quot;185:force color format:8&quot;</=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,<br>
Sean</div>
</body>
</html>

--_000_SJ2PR16MB5525F636C5B7620CA5D400848167ASJ2PR16MB5525namp_--

