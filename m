Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15409826784
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 05:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB84210E160;
	Mon,  8 Jan 2024 04:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6601110E152;
 Mon,  8 Jan 2024 04:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ns2K3O/Bsps+RS9JoQGql4w7P8peYSRgkH15g9NOpYTKZoPJjK1ZgZHOxQPxN90up1q+zv4SeHbA6B/ZyPv7QCi90nhJUugpVAnuNAUQy9YF4HkacMbc2wfFOB8xivl5bkLu7Zqv/a3pfvx3CrIAReH4jqL0zauR6mo74hrXR4T+pVhIXS2m1Skj5AWaqsKqLUfK/7JAzeubwZq/WUry3EMsKiyiaIE7tr8xGkMlI6OwL4htc4yUkDF4SHqExC/CJXA1l1d0A2SPW+T6Jcf26GrfL6KJe8n/ck25p5vJoUXRehJox75lHkSLmyJPceZ2D6LGT18M6aQFAbbFSFt0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndrQPsI+q/43dmMgbvo3B1BXQ2DKXMmselXrjDKcTmQ=;
 b=YkMtPDd071EYM3t0OSObeipuN2uXsCVS8IJXkSVNbci2kCM9xJ/s3swHPIlXySfiUFdu6iDY8SgDc0QMWd5iiMBY/s7zSODJrt5cUAJr3RTi3Mzv+SfLpfuSXpRQdPt8g/zrjKz7MXjFLVToRNZs/V1+vffat38shjZllwTQP1Zq3WzAdumy1yBTWHC/XSf+LY67LxGPxwlXOfLhNOeFinhOJCttPKTRF044GvIzSLw0cQy+RDSPaWVJwPPvrnjIDV2qX8436fRoi6kr6rKny5/baZwNC/ZGphuWg/gG+ArXAuBlIsEx+LkdveWXHe9T3fScZTnkP1ye2J5AHd4yTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndrQPsI+q/43dmMgbvo3B1BXQ2DKXMmselXrjDKcTmQ=;
 b=jehJp3aBtuPowfiROVqrtNaxEJqgfFi6IHVMtNTLq1sjpgLZdNjr6eW5ah3TS/OB37LZhSVmuoCZYur0A4KGFJA1sxswZ1xzDrgVWhdRqIuvfoFPtQg4EtITKNNZkW2+ZyC3MrBcXlXC8le3ocfIh71EFbrKVXvCJsCnrlhWM/8=
Received: from MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15)
 by DS7PR12MB8230.namprd12.prod.outlook.com (2603:10b6:8:ed::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.21; Mon, 8 Jan 2024 04:04:06 +0000
Received: from MN2PR12MB4128.namprd12.prod.outlook.com
 ([fe80::3508:1efc:dcab:74bb]) by MN2PR12MB4128.namprd12.prod.outlook.com
 ([fe80::3508:1efc:dcab:74bb%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 04:04:06 +0000
From: "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "Lee, Peyton"
 <Peyton.Lee@amd.com>
Subject: Re: [bug report] drm/amdgpu/vpe: enable vpe dpm
Thread-Topic: [bug report] drm/amdgpu/vpe: enable vpe dpm
Thread-Index: AQHaP985BqqR6akhvUS/7F0QbQOXprDMM79QgACDMpk=
Date: Mon, 8 Jan 2024 04:04:06 +0000
Message-ID: <MN2PR12MB41284F19F9669918F2DC7F25906B2@MN2PR12MB4128.namprd12.prod.outlook.com>
References: <efbcd813-8f22-44ad-a6e1-6bee6d3bb18c@moroto.mountain>
 <MN2PR12MB4128CF05AAA26BA602B8C79090652@MN2PR12MB4128.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB4128CF05AAA26BA602B8C79090652@MN2PR12MB4128.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-01-06T04:35:27.0000000Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR12MB4128:EE_|DS7PR12MB8230:EE_
x-ms-office365-filtering-correlation-id: 54cda35e-5af2-4d7d-c038-08dc0ffedbe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +cMff02+8rBkfs/FsF0Ty0ME43i5Xf9+0ygfQgBkOcWXuyUQYE/LxsVtBg5joF6NcJEB6dBzrgndDVutqRD6NATrclnS2CR67C6e5gyDCWXlXA0GSfFiG+HGVrpyLa7xkPepNitrzl7OBy8MfLwK8QuKvsywrZLg4NVbnWN/nXAoPEhDlhZJePBFd0XFCGrZckG5nYqywAYlpUXf2MZTU+NS16JapbH/jlYWLpYjow6bQbmcc004x9tFo8CF6cWlYx5uSuYfSnXhGE/tc0An+C0oYvPiB4J7UhYOQdtgzGvqhrJ0zoqfyPOKjMUDy/SVV2IqWwPvCe2HqJzMkk8dAMkjA0+J/jtKouqzk7Vz9aXusVRgHek7HfxdFTT851H2WWHqNLyo4R3W5RwAR6YjMxfvf+XjkcoDuL5kdkcR145+6JGC+Ux7BDs+OrRtVA2Ji0D65K+RonXeZ+rdDM6YwACBTjypag3S3sgw2OB/VR8hJU+idjTxbi2NZPoJrpumbtyc1n/A5fvUc7+EMK0s3yp8dDw2+mO1MjTrtV8QZ6XeGr8npiPTzra2nFLSg7G00UCjsm/UFQPBihMzMZj/Uk1OttwRg8CRizTN7oauAUwS5saonm9r1yibxC8WKBP79fdIf8F1EGiQ+Mh1MmjzzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4128.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(52536014)(8936002)(8676002)(4326008)(76116006)(166002)(316002)(66946007)(66556008)(66476007)(66446008)(64756008)(6636002)(110136005)(54906003)(41300700001)(38070700009)(2906002)(5660300002)(33656002)(86362001)(26005)(83380400001)(38100700002)(122000001)(478600001)(966005)(45080400002)(55236004)(53546011)(9686003)(71200400001)(7696005)(6506007)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o97KtlAMc5/O3yXu08TDfzkSIeIuCeGzDtyXzBRLCuJPj4s8Vvq+6+itw6Ln?=
 =?us-ascii?Q?4gKxGt2Z3fhF6i7oBFe9cvkknuR/5KZs4Tg4cZtv7uY/NQ9vwn0njs1yo9Hs?=
 =?us-ascii?Q?LDx810mjpA5NeDnsrS/69rI/sXbwCOekAzcbIRDxJ4ulchnpTHvkyWykfWUJ?=
 =?us-ascii?Q?d+mFF5hnYm+By1NpxPSPsSP6DCkvntETRJw4rP926sB0SlWaSoxSREigy237?=
 =?us-ascii?Q?a7ucfaZqZnMaAx3dpqBdgY42nLIIUJ+K6OPg8GYZDFlM2UDtUGp45UvDcQbf?=
 =?us-ascii?Q?5Qgm5HvloCgJ4jG2FCmlGhCHEeKK7uDCf61ISjY5b6cV1Dd4w321x8acw05E?=
 =?us-ascii?Q?VCcuoU2h2mcIvycF4VembAqH/w+K7myTryWYe90Ca2D7nqzKMq3BjIq+ZcNq?=
 =?us-ascii?Q?cryQH9EgQZLYSX2eMY0P34p8gG+7VVgHrWQI9YpbpwUW151ygRJ0OZ6QfK4M?=
 =?us-ascii?Q?coxHqnN5ehYdDxs5zV9KZ99XGBNWV+15ljW3zVdUk6IecAsdXpU3Jfv84Uoo?=
 =?us-ascii?Q?QveggnCJbkznMuj09EIoiQbGF8cXnbPpM82XL9ryxeHI4G9KlpfXdGhSDPvi?=
 =?us-ascii?Q?NIWN/7z55bp86U1V0BMxYDLG2yduAmYmqhw9nahWhSLn9u+gkeB7VN4K0t13?=
 =?us-ascii?Q?qH9mVMMGoBNMa3HQCfjGkdPpZz+2CPuFh282tyCjW1uFtC/kDM2/WQ/ysmZz?=
 =?us-ascii?Q?FnXwLr0Qq+ky/l/sSxosaCaeE34Xxg+NONoCKmT/m0aCxSuZPBbNAUWIRurX?=
 =?us-ascii?Q?AG/gBprYaNsIodszEx/mZ5Ur/dv4hU/+dMPODT0UxjGkYVB+Yt8HsTUXf6xP?=
 =?us-ascii?Q?qlg6+qw1v0n+oKISkQ9N4ox1+qsAjv+kQVcqZrt0o916XecXgVrOzbZ2JT+x?=
 =?us-ascii?Q?kzT+BucKPD8u6qDrbcsr0hejHOIVBq4pzg90S5kgMew9xMwnw2VKXqfOg9T/?=
 =?us-ascii?Q?g2XImvXlFpQj3u8osEMer1le9JV7vTbzMrqEDmgOLc4hz11HlIgGbWe04vZv?=
 =?us-ascii?Q?wcP4BxzGiV3hHX81HJDElvTLreQ7q3P25jmEHZFHfqErN41yyBB+EzG4qpIS?=
 =?us-ascii?Q?Ds4fN3Id2mFLje1/rg2NV4yG6Abf2FXBuz03U1bsJy/0q3DssxfGNa45b/AP?=
 =?us-ascii?Q?xIiu16CG+Be4pAiI8yl6V7q3WFr+xMtyDBUkpcgFU9wvOOAhZUzSncWqnkGt?=
 =?us-ascii?Q?sn8L1pMBYiXuDtG1PeGEnkaPG2jH4bZFNcShpnXGqy4p5IhslIT4jr82oXB4?=
 =?us-ascii?Q?Llp8EACT44uvzV2BFwvHcwxi2SXGnj0vqaxL/B0zxLlPZSTCpKjBcywGpmpb?=
 =?us-ascii?Q?8qBbTzWKivy4fx+6VB4U5SZLOtDEjJgDIZq9IiEqIb34BtSGUg0I5U0x0SQE?=
 =?us-ascii?Q?lF9luWeBb8DPGBqFmXDu987ify8gr4nfE4Z8PNpVy06S2lhYFV0cFZ3awIsZ?=
 =?us-ascii?Q?KXuUdf7qiF05yv9wrXjYqKbqs9kIziLlE5bjdoTotIpFZRnmU+DzquEUvfju?=
 =?us-ascii?Q?hGLiaKhTcX7azoiClmpMS6poavQR4Tv3lkbsVuDcslmYs1UR2BQLy1Aq3Rbg?=
 =?us-ascii?Q?z0CTUgim1VquODB4m+k=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MN2PR12MB41284F19F9669918F2DC7F25906B2MN2PR12MB4128namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4128.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54cda35e-5af2-4d7d-c038-08dc0ffedbe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 04:04:06.5161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R+mhlyOns+kEvCM3pF/SgG2y2dLiZj0cqITj4SPysGvUodxd44z/5DFEXUxajTD83pVgC9P+FaLM5B5PK46Yzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8230
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
Cc: "Writer, Tim" <Tim.Writer@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Rao, 
 Srinath" <Srinath.rao@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_MN2PR12MB41284F19F9669918F2DC7F25906B2MN2PR12MB4128namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

+ Srinath, Tim

Get Outlook for Android<https://aka.ms/AAb9ysg>
________________________________
From: SHANMUGAM, SRINIVASAN
Sent: Saturday, January 6, 2024 10:06:33 AM
To: Dan Carpenter <dan.carpenter@linaro.org>; Lee, Peyton <Peyton.Lee@amd.c=
om>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Subject: RE: [bug report] drm/amdgpu/vpe: enable vpe dpm

Hi Dan Carpenter,

This was fixed in https://patchwork.freedesktop.org/patch/573477/?series=3D=
128249&rev=3D1

Thank you!

Regards,
Srini

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Dan Carp=
enter
Sent: Friday, January 5, 2024 7:04 PM
To: Lee, Peyton <Peyton.Lee@amd.com>
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Subject: [bug report] drm/amdgpu/vpe: enable vpe dpm

Hello Peyton Lee,

The patch 5f82a0c90cca: "drm/amdgpu/vpe: enable vpe dpm" from Dec 12,
2023 (linux-next), leads to the following Smatch static checker
warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:62 vpe_u1_8_from_fraction() warn: u=
nsigned 'numerator' is never less than zero.
drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:63 vpe_u1_8_from_fraction() warn: u=
nsigned 'denominator' is never less than zero.

drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
    60 static uint16_t vpe_u1_8_from_fraction(uint16_t numerator, uint16_t =
denominator)
    61 {
--> 62         bool arg1_negative =3D numerator < 0;
    63         bool arg2_negative =3D denominator < 0;

uint16_t can't be negative.

    64
    65         uint16_t arg1_value =3D (uint16_t)(arg1_negative ? -numerato=
r : numerator);
    66         uint16_t arg2_value =3D (uint16_t)(arg2_negative ? -denomina=
tor : denominator);
    67
    68         uint16_t remainder;
    69

regards,
dan carpenter

--_000_MN2PR12MB41284F19F9669918F2DC7F25906B2MN2PR12MB4128namp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;font=
-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal">+ Srinath, Tim<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div id=3D"ms-outlook-mobile-signature">
<p class=3D"MsoNormal">Get <a href=3D"https://aka.ms/AAb9ysg">Outlook for A=
ndroid</a><o:p></o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> SHANMUGAM, SRINIVASAN<br>
<b>Sent:</b> Saturday, January 6, 2024 10:06:33 AM<br>
<b>To:</b> Dan Carpenter &lt;dan.carpenter@linaro.org&gt;; Lee, Peyton &lt;=
Peyton.Lee@amd.com&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;<br>
<b>Subject:</b> RE: [bug report] drm/amdgpu/vpe: enable vpe dpm</span> <o:p=
></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">Hi Dan Carpenter,<br>
<br>
This was fixed in <a href=3D"https://patchwork.freedesktop.org/patch/573477=
/?series=3D128249&amp;rev=3D1">
https://patchwork.freedesktop.org/patch/573477/?series=3D128249&amp;rev=3D1=
</a><br>
<br>
Thank you!<br>
<br>
Regards,<br>
Srini<br>
<br>
-----Original Message-----<br>
From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf Of Da=
n Carpenter<br>
Sent: Friday, January 5, 2024 7:04 PM<br>
To: Lee, Peyton &lt;Peyton.Lee@amd.com&gt;<br>
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org<br>
Subject: [bug report] drm/amdgpu/vpe: enable vpe dpm<br>
<br>
Hello Peyton Lee,<br>
<br>
The patch 5f82a0c90cca: &quot;drm/amdgpu/vpe: enable vpe dpm&quot; from Dec=
 12,<br>
2023 (linux-next), leads to the following Smatch static checker<br>
warning:<br>
<br>
drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:62 vpe_u1_8_from_fraction() warn: u=
nsigned 'numerator' is never less than zero.<br>
drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:63 vpe_u1_8_from_fraction() warn: u=
nsigned 'denominator' is never less than zero.<br>
<br>
drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c<br>
&nbsp;&nbsp;&nbsp; 60 static uint16_t vpe_u1_8_from_fraction(uint16_t numer=
ator, uint16_t denominator)<br>
&nbsp;&nbsp;&nbsp; 61 {<br>
--&gt; 62&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool arg1_negativ=
e =3D numerator &lt; 0;<br>
&nbsp;&nbsp;&nbsp; 63&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool =
arg2_negative =3D denominator &lt; 0;<br>
<br>
uint16_t can't be negative.<br>
<br>
&nbsp;&nbsp;&nbsp; 64 <br>
&nbsp;&nbsp;&nbsp; 65&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint1=
6_t arg1_value =3D (uint16_t)(arg1_negative ? -numerator : numerator);<br>
&nbsp;&nbsp;&nbsp; 66&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint1=
6_t arg2_value =3D (uint16_t)(arg2_negative ? -denominator : denominator);<=
br>
&nbsp;&nbsp;&nbsp; 67 <br>
&nbsp;&nbsp;&nbsp; 68&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint1=
6_t remainder;<br>
&nbsp;&nbsp;&nbsp; 69 <br>
<br>
regards,<br>
dan carpenter<o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB41284F19F9669918F2DC7F25906B2MN2PR12MB4128namp_--
