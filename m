Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481E9263F8D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 10:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6912189F38;
	Thu, 10 Sep 2020 08:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6322C89F38
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:19:22 +0000 (UTC)
IronPort-SDR: Toap4AbUHSvZWYOmzB0jHAu77katddI+XmJ9GG1lPpkDKM8PEdvdorwik8p3e9BJnrlgaX4y9S
 Ket7bKaUepoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="146210364"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
 d="scan'208,217";a="146210364"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 01:19:21 -0700
IronPort-SDR: GTo3cxgkAkWWQTFSQSChp3C9rqq1DMjAe8sLbbGjp5GNvSfbJff3uRzAPgQJK2xXevl2e9YXfF
 lRkTwTC5aSFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
 d="scan'208,217";a="300467794"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 10 Sep 2020 01:19:21 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Sep 2020 01:19:20 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Sep 2020 01:19:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 10 Sep 2020 01:19:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 10 Sep 2020 01:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCTBl07yN1isa5GPHU8iIQElGOtyC4rqSjM9qe/Sj3PDaX8ftfe81M+MsS3SpouWOL2x/1dgNaKzQsVRvOLlGrYMXvSCpYxEhfPXWE/p/esUcP5FTiJRxP4bp3vV8UibAfkOEs3bCOPKi6LE+DyPRfpYZsTM7XSks9fjQD4L9YfkxFXh05p8h1NjvBeHGPmrIMkmRXTh3gXZntYJb4kdqNVSIVap4TZfAVCsz704jChEVejzEXKlrsWJbDE6wDLH8U8ZOOU+GwyncASdV5opU6dQgaW/LnKFDokCm/AqjJuYw5xBy3ty0dCCUZkDI6JVBB8jyv00GmRvRQJAEyN/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6Zd7QVwPYLIhuDakh7RsxCzw5/+riO8TSRRV/d/uBU=;
 b=nzQeYKMoiUJgsE6j2tJB+o44Ty74vlAdITJ4xC99V/9Vm/BvN7q7ziWkBsSJ5rY6lH7PWW12P7DJPoWrvigy6REQXxbSe3gPfVBJx//NAfZ4BHcirabkyiEvajkJOD7sBg2E8rVgY+QmJ7Sx2CF7OPcZOeMHH+E4Y6jFM+7q5GaMoD6mC/8UXtWm5H6OTd8AtfW0Fr3IE1E6xwpvbfFPKeUyEKNpAsTTucRilJ/FnJ583WDK0R6dgLNbQ3xhLinKS+0qTfAxfn+WesuuSMVR4KEdXwr/oQxX+rUiq0+EujIxNZ9jczewkTfVY7wgJidiTCZtDT0npXotOqN1v+YW3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6Zd7QVwPYLIhuDakh7RsxCzw5/+riO8TSRRV/d/uBU=;
 b=sThg6teaZ/P7bNdoczEP+R9Ai+hyMiYfXOiquTzwghVNab/6mPoeBinw/F2GFB3dIajIMthoX03OVcRarr4oe4EICe3mjOmbnHzGgVyj92NnE8Ow7rN6MUQae+jPuZCcIXkQ2+AoWgChIHdZBgEaeVsx2sY5Hk3oWGCOE8EF04M=
Received: from SN6PR11MB2558.namprd11.prod.outlook.com (2603:10b6:805:5d::19)
 by SN6PR11MB3264.namprd11.prod.outlook.com (2603:10b6:805:bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 10 Sep
 2020 08:19:18 +0000
Received: from SN6PR11MB2558.namprd11.prod.outlook.com
 ([fe80::8062:d8ec:1e20:2ce8]) by SN6PR11MB2558.namprd11.prod.outlook.com
 ([fe80::8062:d8ec:1e20:2ce8%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 08:19:18 +0000
From: "Tang, Shaofeng" <shaofeng.tang@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video  device
Thread-Topic: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video  device
Thread-Index: AdaHSm9D/BvOekN5QRuShceL+zNmQQ==
Date: Thu, 10 Sep 2020 08:19:18 +0000
Message-ID: <SN6PR11MB2558D831991447B9B5C8E646E2270@SN6PR11MB2558.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6e2cc02-23a9-4bd8-01d9-08d85562367b
x-ms-traffictypediagnostic: SN6PR11MB3264:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB326464DE19E12ECF2D96C99EE2270@SN6PR11MB3264.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9UqP0t5mOViN9yGqpyESKcpaBCRy+6/GWFOC2ju9qwAuIEl6H3wYwSIk3i+uMTf/ucDgOLVvmFB2cz/6niJITJS0WsuF+02uv9fSdxbS5U8qjlyZ+6H+zHuAhGv1ti93JGg3laMl04po40hRScDlCpwiVNCKnmER6mKZJBB780CxkN5VFAuWzAlSflqcAxGVWATwY2EhKF1FAmBP4rOCwdjdLCqZS0uBm9J4zUmCo0f+LFFi+QIrE9IztwkljKmuA5/gQzhyvydwL480jwNqnr3gzOzEbNnFA8DCystzBDq6NG4Ut+IJdCg0QH5yUVK4kTFmH5krFwOTIEUAvB0M3Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2558.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(6506007)(76116006)(7696005)(26005)(110136005)(4326008)(9326002)(66556008)(186003)(66476007)(66446008)(9686003)(2906002)(86362001)(64756008)(71200400001)(52536014)(66946007)(5660300002)(33656002)(558084003)(54906003)(316002)(478600001)(55016002)(8936002)(83380400001)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 4ddC+p2vbRg7F+QPWGk44DQOnnBjtIehp3cdyZB5ZSPKXbCf5+/Ib98Ix5X2W8IPiI+tg99SH1ytTQ150drx5KGFdde4pEnq2if/GJPScvhCRqMsVpaPmd3zJdNtwE2rw9m7uzl7IcHErdDBlalky3ITIMoC9GLqU7mEIzYqFkGzf1Z72DgjDExRCpCwnuTG3E/vadJrmLkxmUp/KaEs/Wjap0oUDKxJQdgvJ1lverHm4dWlOGs1xfLD9Jko2uUxhZoCB2kXMAe809LpyHv1BPzsmPP5i3ax+l/beCVZNfvIg0Hr3cULmx0cH/0zWt43BSCuxvm/mzgrPeWHOnGgJRGuPU9vVKx+r4wAMv7U4bTevEYdjbvAgGB9CyixKg9ce1ru7+dEqQm8L6FuCNM7QpPhXv+PpIErIfe/m975izRtPdvG+Yf22VHIhqnJOH1GQqsvOgHw99QNtq+4Qot4c9QmMlHPFIZzACwn0m4qcpFVI1wJwj732foipldG8iSnCxUHxLdNTZ0zDI1njZcusglKbGPXx19RvLG1a0b6XUM7EcEV1YS7oDGctS0T7TkawdugfO9pd0Irh7H8/loTqjR1GJkdO6am38Q0IsLld+6n3PSN7z8/iWYK4SOmnOcLxfBd+8VRBQ3YkHKGrEPcTA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2558.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e2cc02-23a9-4bd8-01d9-08d85562367b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 08:19:18.0852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQZxr4wJIQ0ea/7P6ESLdrmE2uGI61Zw45iBKnw+nhBKy6DGaHedDF9fiu3nYtJFENDGN+/l7ufkuMBa1E3z0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3264
X-OriginatorOrg: intel.com
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
Cc: "Huang, Yuanjun" <yuanjun.huang@intel.com>, "Jiang,
 Fei" <fei.jiang@intel.com>
Content-Type: multipart/mixed; boundary="===============1345863851=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1345863851==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB2558D831991447B9B5C8E646E2270SN6PR11MB2558namp_"

--_000_SN6PR11MB2558D831991447B9B5C8E646E2270SN6PR11MB2558namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Deepak,

Do you have a new version of this patch now?
I take a try with it. and meet some typo and "incompatible pointer" error.
If you have a new version, could you share it with us?

BR, Shaofeng

--_000_SN6PR11MB2558D831991447B9B5C8E646E2270SN6PR11MB2558namp_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Deepak,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do you have a new version of this patch now?<o:p></o=
:p></p>
<p class=3D"MsoNormal">I take a try with it. and meet some typo and &#8220;=
incompatible pointer&#8221; error.<o:p></o:p></p>
<p class=3D"MsoNormal">If you have a new version, could you share it with u=
s?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BR, Shaofeng<o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR11MB2558D831991447B9B5C8E646E2270SN6PR11MB2558namp_--

--===============1345863851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1345863851==--
