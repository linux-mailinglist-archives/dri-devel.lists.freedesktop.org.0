Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2910AC6E0F
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D6310E64C;
	Wed, 28 May 2025 16:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qsc.com header.i=@qsc.com header.b="ZtBiNOIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Wed, 28 May 2025 16:31:20 UTC
Received: from us-smtp-delivery-160.mimecast.com
 (us-smtp-delivery-160.mimecast.com [170.10.133.160])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B4510E2B8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qsc.com;
 s=mimecast20190503; t=1748449879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mnbc5otDI4kGUoWjlJTYHFtL/ubNnYmoguEcndv5ioY=;
 b=ZtBiNOIb6uA3FaAHau+ql6wRhMn569RVdzk6Pt1577HBMW0kgLH2b69ScpC9xCsmqkjzGM
 VjjFRYc8AiwwrpdJ7QWp1/J3gFn5DAlT1rSeP6eTEwkYQh/bjJYKJf92dnSH5FkzDu8D8c
 ERW8a32NjrvL2UwAuM3zvbPv7ruFHSM=
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2092.outbound.protection.outlook.com [40.107.94.92]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-I88j9JCsMgivR68b07skrg-1; Wed,
 28 May 2025 12:31:17 -0400
X-MC-Unique: I88j9JCsMgivR68b07skrg-1
X-Mimecast-MFC-AGG-ID: I88j9JCsMgivR68b07skrg_1748449876
Received: from SJ2PR16MB5525.namprd16.prod.outlook.com (2603:10b6:a03:539::5)
 by SA1PR16MB6392.namprd16.prod.outlook.com (2603:10b6:806:3ef::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 16:31:14 +0000
Received: from SJ2PR16MB5525.namprd16.prod.outlook.com
 ([fe80::82ea:a206:81c1:314d]) by SJ2PR16MB5525.namprd16.prod.outlook.com
 ([fe80::82ea:a206:81c1:314d%6]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 16:31:14 +0000
From: Sean Summers <Sean.Summers@qsc.com>
To: "andri@yngvason.is" <andri@yngvason.is>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Fw: [PATCH v2 0/4] New DRM properties for output color format
Thread-Topic: [PATCH v2 0/4] New DRM properties for output color format
Thread-Index: AQHbz+u74I6v2bZ2N0Os+Ly4+ExtibPoO8ll
Date: Wed, 28 May 2025 16:31:13 +0000
Message-ID: <SJ2PR16MB55250C6D168AC2BD5B4CE8108167A@SJ2PR16MB5525.namprd16.prod.outlook.com>
References: <SJ2PR16MB5525F636C5B7620CA5D400848167A@SJ2PR16MB5525.namprd16.prod.outlook.com>
In-Reply-To: <SJ2PR16MB5525F636C5B7620CA5D400848167A@SJ2PR16MB5525.namprd16.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR16MB5525:EE_|SA1PR16MB6392:EE_
x-ms-office365-filtering-correlation-id: 06113200-3859-4bf8-efd7-08dd9e05102a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|8096899003|38070700018
x-microsoft-antispam-message-info: =?iso-8859-1?Q?QpNLkA9qLcOAvEFeXHsPBL5AoD4ujwXLpPc/Ac4iHKKWkxRh1rplvycRZV?=
 =?iso-8859-1?Q?XpI/uOhAoVBGSoDYKjOgMEwGxDKWAHobI/RpGnF1svBKzVQYcDxxwLwyEu?=
 =?iso-8859-1?Q?WNuMHYGQcQ7RFO7X3FSlBeC1BfXHJTjVEnaJ13nGoj+dSAWrg4rlKwA62W?=
 =?iso-8859-1?Q?W6aIv5cFPXaNdi+bxQ+q4of5DNk6fJyhEs3eDjT/PMZAI711FkusRnAVka?=
 =?iso-8859-1?Q?ZT79B+gbNNUrummOztbaSpo1jkbCKx7P/tRKFzZtiYKrwAvJWxISd0m9vp?=
 =?iso-8859-1?Q?zsrC3aXDGZbi7qePU2XgN554i6W/6ctBQTdmC9rPzgqfhjGgqmLYnAPt13?=
 =?iso-8859-1?Q?MlE5St1KmSo0elVB0+QYSKVEAa5JaBEdpeEQxYkoC6zpu9vBEcwKuk7Jd+?=
 =?iso-8859-1?Q?8mloai3otftm+JU7EPV8MV9IqShVIfMkGQkkOsXGK3Zqv3MHHqh3rYT7jo?=
 =?iso-8859-1?Q?2okPCwa107EW/InW3GaeTbD/Op+5964YdlSRvHsoLUiRBLlJYFLqahehTe?=
 =?iso-8859-1?Q?csWREiKD/uWi5vm2mRtsxoaHAZaiJqUnqmdlO3G5n9iUZuKDEXf9Os13lX?=
 =?iso-8859-1?Q?4FqwWs4IoBXf7sDVesSyqPDJ0omoVknYIwUVcX5vMg9Utost/X4EILA9+C?=
 =?iso-8859-1?Q?oCErz7+d0eIGTtUIIC+BpVuykE9pbdZggSoE+m3gVmsezHS7SusQIBTqIs?=
 =?iso-8859-1?Q?BAQOHfthxrZemvq/wuQiPFtTeVIz7mojN9y1G9z1/CNJP0BLkpLI0CEqJs?=
 =?iso-8859-1?Q?96i3Bcoi1rOyvV6O83Gz5Nbf027s1qiQ2dogt4u+0jlvWDbQRWUy+g+RcF?=
 =?iso-8859-1?Q?MrON7eROkyaIJnZ84xqIO3KRAHdk7qnpi/Xke3JITojpdeEqwzek3wuCzr?=
 =?iso-8859-1?Q?mVoprwOlRVBsC0t6OGHupvLBqqCJha7vRY/udkFfc8xvSCk0KLyBdspoR3?=
 =?iso-8859-1?Q?+SsOeT5R7ME6DwXf9PukhaX3nfuWrWdFg+fOdChmlPdn1zujn3DrJtCB8P?=
 =?iso-8859-1?Q?GgnWxAf/heqjmMtnVuN2x5hEk8oO5qhEZTPB09tFjhZZIpOO2pO31h935+?=
 =?iso-8859-1?Q?mlATCb0ZCqpI5yYVGkIq7mcMBv0fEG/40IT7IW12yWC2WvSsIbU4imtT9b?=
 =?iso-8859-1?Q?OoaXwjqYUrguKEJ30y38/vNpBy7m81ikmUEnGJ408E6qhYx36K76OGD1Qz?=
 =?iso-8859-1?Q?PF+L2sHc2z2/jEVyjSOu2yY+M8dsZICgdbSEsrcH2XXGTPnhF/zx80ablq?=
 =?iso-8859-1?Q?+RNIG2gC+W560bgKv5ULRnsavpXYbmhHiHx0N6Znn/r83g0ugD8V0PTBA2?=
 =?iso-8859-1?Q?M+1/UWackgq4gYttvGsmRqFQ5UMgU3OTKEtqqd3rUplEm1E1npXZ226GLf?=
 =?iso-8859-1?Q?uWEKdNez8T08DowVa/qAuCD73Pkv6BzLxJ9pY738vc5WjQxQopt5n8Onq2?=
 =?iso-8859-1?Q?nC8xK6t2/SD0SGLZ7y2PQcFEx1J/ccUe/55VPZWq6wWLLaS9BHVqT9y1Kk?=
 =?iso-8859-1?Q?x1kIqMzqftW68QdOkZI0W7A5+4n/R5pd3cwVSgG1XYG2R98VZhoqNI9sfL?=
 =?iso-8859-1?Q?g5PzU/Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR16MB5525.namprd16.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+wdOlgG9Hd162AaAXSgAangUeWQzzs98M9rTPQZhyJM35iX8Tx4PcvNPzx?=
 =?iso-8859-1?Q?rMDSlPiTePUWX5JZpRKPGLXXC8XGjc3DEjooDeqNc9R6uaKW9jB9QzOrHW?=
 =?iso-8859-1?Q?QeZS9zUM+yJlHGZpc/mC0vmSDzxT9qhHoRu9iqAYe7HmGMLrkKkTl2JA+q?=
 =?iso-8859-1?Q?QqroZuhy3f0Ss8KDBy78czQcczyuK4BnKmStXCZnqdBpGig4aTmUY4sSQ6?=
 =?iso-8859-1?Q?iA6KqRvA2vGPe6w++hYiM/xkqsMeoY6nRtW4dB8C4/OLuUqavFZ3wLWM9J?=
 =?iso-8859-1?Q?5kQ4t1ofSRxzsPhfQpHOFw65ClexqRRDU3PyG46oqVD8xzxVTY69QB5hNs?=
 =?iso-8859-1?Q?PUCgy808kp6cKGdSULXDobBJYtxp7aExJUvad91UjSnfBqYjpSIaw3vRhR?=
 =?iso-8859-1?Q?ZB1ESvBrrc7YXPds7A77a48a7wc992qb6XUTXM2MLN8vmQurbnKEvQ1wji?=
 =?iso-8859-1?Q?vq4CGlJXfwk4D10b6cUD/HBMCLARWAS59BLPBsH4KjZ1yjr9CSLMdre7M1?=
 =?iso-8859-1?Q?RCH3EJDAmLYkgIKoSr6hcDuWpN10z/x0FirWGyJlMUFlG7iM09Kve4ZSJO?=
 =?iso-8859-1?Q?cGoOOx1lPg1mKKtIuSbPyhChgvLb0LmzmASuVtGL2NeBhb/OITMvcR4LLj?=
 =?iso-8859-1?Q?36jmZcMG46TY6dOhq9nXQxbS6uwzKid/pTkhV83nGVNnLa13ID8jZrTELz?=
 =?iso-8859-1?Q?A7Gyps1i9WYAjRfkqG4DLtZUpYUJIYK9wVBjLUI19johUlSuD8VdLEGbiK?=
 =?iso-8859-1?Q?tva3IkIuIi+j2FMcKXPETr02dy2q05furSPa5nao7OF7A8/hU1myha0M/J?=
 =?iso-8859-1?Q?8fvqYc3nscw4+VSroe//uxppLwl4Ri9VFrIRAhxng9qFus/yvrU4b6NSeN?=
 =?iso-8859-1?Q?WJ5VdguABSW0gj/1wtfCFWePtOGJEWftbtdzCA5L5h+VQzsJWK0olzZKEF?=
 =?iso-8859-1?Q?qLMqALMSW5iAgDjVgX066R3CKl12Il+7utMpRdJQC9Iw6ReSpt8Mf1l8Go?=
 =?iso-8859-1?Q?pQyJ2Zq379RQ/VPKin6Ewfmvyz07IWs18c+wntC92VmKkOo0B9C/7a1A6u?=
 =?iso-8859-1?Q?HKMv2Qz4HrUVUPUOuhlPvawPao8YBKWSHl8K1hvh/h9inWRJoYGDvMlYdc?=
 =?iso-8859-1?Q?ZkC2+Ayp290v8sdoR5OfD46H9eDBFHe71c/CGltSU5Nv85K95wovVXYur5?=
 =?iso-8859-1?Q?hKg/xjGJz5QjrqHn/isy0NJ0+CQLuUgA8cUbf4ADsnMp28OAkafbdK6xkQ?=
 =?iso-8859-1?Q?uKy0BB8vTkulk2pUDmqfR1ynlrAnFSqtur7DFT83P+xLHCdW5tY1WRcrXH?=
 =?iso-8859-1?Q?Y1LfVVbPnSmeXCPDi1mpVpTiKHjJuL7E8PPZGBtSOWjhoK04yzMW5VcDiH?=
 =?iso-8859-1?Q?lItglFDFK8GiOJT/bMo6nS4RtmxthAVb7VmDJ/IiQuaxqQPAFpgIrvVIbt?=
 =?iso-8859-1?Q?K2VCQB7f9voRQuyd/tMwqhX0bTc0wbn2HtY5nph8xKtc6hxvjjyDcOTZKX?=
 =?iso-8859-1?Q?eDwRDwoxwF+06WnaXemLAq1Y4bA8SjGLd/nwowYngrJE5m0VjwXmxivA+H?=
 =?iso-8859-1?Q?zKdZB2k/Q95LjX6KnAbvyaIJ2U9xRhRAtM0uPukm4kWUYXZ1jspp0aUQY1?=
 =?iso-8859-1?Q?wwQpi/RNaGQRcFV4xO1PU8VOTii1aKEcfe?=
MIME-Version: 1.0
X-OriginatorOrg: qsc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR16MB5525.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06113200-3859-4bf8-efd7-08dd9e05102a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 16:31:13.9658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23298f55-90ba-49c3-9286-576ec76d1e38
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cz17VkXFGUVZxG9ZpVlQNJKMeSjFh/coTGis0mqzgFRkp4+jpSbIfe2OwVQx0WfK4sbd+N216cYFkyYLrt+nbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB6392
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _WlsU9KdZ48Bp4YDX6T1q9gZJN0AvKHd5vUjvPfFsZU_1748449876
X-Mimecast-Originator: qsc.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_SJ2PR16MB55250C6D168AC2BD5B4CE8108167ASJ2PR16MB5525namp_"
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

--_000_SJ2PR16MB55250C6D168AC2BD5B4CE8108167ASJ2PR16MB5525namp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Whoops, wasn't subscribed to the email list. Resending. Sorry about the spa=
m

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



________________________________
From: Sean Summers <Sean.Summers@qsc.com>
Sent: Wednesday, May 28, 2025 10:23 AM
To: andri@yngvason.is <andri@yngvason.is>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; inte=
l-gfx@lists.freedesktop.org <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/4] New DRM properties for output color format

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

--_000_SJ2PR16MB55250C6D168AC2BD5B4CE8108167ASJ2PR16MB5525namp_
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
Whoops, wasn't subscribed to the email list. Resending. Sorry about the spa=
m</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">
Hi Andri,</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">
I've made this patch, but I'm unable to configure the video pipeline for YC=
C 420. I'm using libdrm's modetest to set the output format / colorspace an=
d pass a test pattern through. Modetest can see the new &quot;force output =
format&quot; property, but it's being rejected
 and falls back to RGB. I verified my EDID has support for YCC 420. Can you=
 tell me how you're testing this change?</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">
Here's my modetest command:&nbsp;<br>
modetest -s 185:3840x2160-60@NV12 -w &quot;185:force color format:8&quot;</=
div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">
Thanks,<br>
Sean</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Sean Summers &lt;Sean.Summers@qsc.com&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, May 28, 2025 10:23 AM<br>
<b>To:</b>&nbsp;andri@yngvason.is &lt;andri@yngvason.is&gt;<br>
<b>Cc:</b>&nbsp;dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedes=
ktop.org&gt;; intel-gfx@lists.freedesktop.org &lt;intel-gfx@lists.freedeskt=
op.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH v2 0/4] New DRM properties for output color=
 format </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Hi Andri,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
I've made this patch, but I'm unable to configure the video pipeline for YC=
C 420. I'm using libdrm's modetest to set the output format / colorspace an=
d pass a test pattern through. Modetest can see the new &quot;force output =
format&quot; property, but it's being rejected
 and falls back to RGB. I verified my EDID has support for YCC 420. Can you=
 tell me how you're testing this change?</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Here's my modetest command:&nbsp;<br>
modetest -s 185:3840x2160-60@NV12 -w &quot;185:force color format:8&quot;</=
div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Thanks,<br>
Sean</div>
</body>
</html>

--_000_SJ2PR16MB55250C6D168AC2BD5B4CE8108167ASJ2PR16MB5525namp_--

