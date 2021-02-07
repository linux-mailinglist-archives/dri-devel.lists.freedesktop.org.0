Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497053122EA
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 09:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99DF6E59F;
	Sun,  7 Feb 2021 08:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770088.outbound.protection.outlook.com [40.107.77.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F336E59D;
 Sun,  7 Feb 2021 08:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edeE+3wEyRnjBkxMLtDQtWEPBJ83zLW7xh+mtlOMHSa3R5Ffi/tfjC3dnrwZQNbLbpyyGuZIOeg7McJc7MQBFCIwNPpMakslHSBqgKIfrZuJeO17GWWQ3vTnp1JGWgD0E+OO1DJlm0anW8SsxrQo3gI1uxp4hKZxTNxXODIM+lz7IbiFzdcL1jcrm/Lq3dk9z1s/Q0yZIky+xGBp0Fm7IHSfF2YgccWzKLnAUbqKaAXjLASyKdsTyNTBM++akBPCsTokOS/cBebRpdI4m8E/GyCuJf0uQSh3zKYn6r5BOpyb9NjNoke67qjGIcJTI8Y5QDINH/+TFScmMPqs/miEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74/hbVwgPRZ3C8gu3VD7+hMf181DPj8N48t+6Bj1M+M=;
 b=XMnbX9LUdcl4AD15e+yFXy5iuPopCZGSWof1G3V2SK7FwOdJt/5reUbula9BcF5cdM88HNnntYRVcXKZycOwfgeUTApoObDGjHPVXPsb3+EutDpfejgt73l7GUT9jle3SVyd6wACF3mPCkNBFnso2ylC109zAdcoy39FXIgBicK6AHgGhARjS6fq2Lop11oV6BpAZe1ALguI1D4RSLl48dTi64XgwltAJiRKIujfEULtD7rNAU03xUpjg9bO40cMnrB9C6sErg7o61sY4tK4KQfBMqZPz5ISRbJqRoT3x4ziREdOg5uj9NkPax+aY5x8d64SQl3huxHFg8QopvY0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74/hbVwgPRZ3C8gu3VD7+hMf181DPj8N48t+6Bj1M+M=;
 b=h/Djf686T58nqgYnRJJ4RsjOmBaibyZLhzjTo9BWK/1s3w+hQush7FPJYq7brPQ2AZAYdOS7VO6o7qXA758/JmhxFvLP0M08rzJRU4XQEHWMQNZCIee7uh5y6yCOXclYUN52Xn+qpIkrKkXLt1vvEm7+7lBUsOXhjRbF2p0WjFE=
Received: from MN2PR12MB3022.namprd12.prod.outlook.com (2603:10b6:208:ce::32)
 by MN2PR12MB3600.namprd12.prod.outlook.com (2603:10b6:208:c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Sun, 7 Feb
 2021 08:55:15 +0000
Received: from MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::49f7:4979:3a0a:4554]) by MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::49f7:4979:3a0a:4554%6]) with mapi id 15.20.3825.030; Sun, 7 Feb 2021
 08:55:15 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amd/pm: Remove unnecessary conversion to bool
Thread-Topic: [PATCH] drm/amd/pm: Remove unnecessary conversion to bool
Thread-Index: AQHW/S5PA4CqM8tTm0KGqM1fGG0Ya6pMYsHu
Date: Sun, 7 Feb 2021 08:55:14 +0000
Message-ID: <MN2PR12MB302293A04AF17EA077E84B1FA2B09@MN2PR12MB3022.namprd12.prod.outlook.com>
References: <1612687765-43874-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1612687765-43874-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-02-07T08:55:14.202Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: linux.alibaba.com; dkim=none (message not signed)
 header.d=none;linux.alibaba.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b6e22466-424b-44fe-1cda-08d8cb461604
x-ms-traffictypediagnostic: MN2PR12MB3600:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3600D6DE7DD3DE87CF39D644A2B09@MN2PR12MB3600.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jGEF19hr6NDrGD/x133ngalTJbbStcBOFztg1q3FNX/5OvDaIPXfV9U0FhAHtcSeQDqpkJP0E4eCN2qLpxEDDYD5/HzA/SWrlzfxVzcIQ9v7ntlFb5u3pkKcU1N75iyaETN7zP2QQXILnzljvNKDlgpcps9fPOzO2JBk1uj+HreyJYEtYfccAN2opO7I2aVSmTgLXmsGRvQA84YNw4xWqlwzcPt69cCoOCOqDsoi6xfWWkhvrje+OaR8a3arvgPr7pbj07IAPihcDbzBmgJEeY8c5ye3a1uVkQoJ/F5V3Dq7phcyoOaxh0qeO5oA+ZMSR3XbLO5WdZuO/KFA2j1BPk4ObnskrMhBAx/7dI83kEc63SF8KdztKEDcGAVyebCPfMD1NnN4cUOQTS0/JrVxxUg9W3TXADEYDIdU5nBF3A055GS6q1c9sVzoGq9nzFm9wmsk+8TP7ho3nwLVQ6i5mL35q8to1wXv7HlfuHm94jQgdPwGIVDwajsCCr4UkCD6xFYH02SR7LzQ81KzHxyB6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3022.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(6636002)(8676002)(86362001)(5660300002)(83380400001)(478600001)(64756008)(66476007)(66446008)(66556008)(186003)(66946007)(7696005)(52536014)(6506007)(53546011)(33656002)(76116006)(316002)(4326008)(110136005)(26005)(2906002)(91956017)(71200400001)(19627405001)(9686003)(55016002)(8936002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?3TqV3y+0n3BIBfWxZyJ6wwMRDtTaO5JanXpYpVAje5YcS1Cv0CTCgF1fPT?=
 =?iso-8859-1?Q?OkKAJF3eGu5b6W4nBwEi1B+0dKk0gKnQ44/ARajU15c2zBni3uJaoV33tb?=
 =?iso-8859-1?Q?PNkqoomMRFLdBSL6qzeFjNN/qI6Olqdzd1qL5TpPWTPOJ6sDn7dO2rRKxC?=
 =?iso-8859-1?Q?kNzb6JcHsgR1gLR8ekJWmeptTOryvXuHtlfNFh+XRk12GH6aH/3vzsIjl7?=
 =?iso-8859-1?Q?rlRBBgdYb/zNPbHQw9kIL5QUOCvDTfzDIE4WWIKlJRDuv0Xt5r+msN6Uka?=
 =?iso-8859-1?Q?VFxhoQyyq2HvyU4n41fUlAYvRefhWMVdDSDQ8KD4LjHyZTKxOLl+LPUP2B?=
 =?iso-8859-1?Q?Gue85BxNPTlb6WnMheJAqZCvHTyDf/AVu00I1T/Ek7chCC3GRvp208WIJ7?=
 =?iso-8859-1?Q?eWaZ5+hHN7k1lTlQcDyF3EkrdM7V+7EdA4torZU21HCKT+PL9oL1ZIVDMC?=
 =?iso-8859-1?Q?J59I4JKUDGHOsQMATMTYKohb+HFFaYScbLWyCUc129vezUueI+wlZ+dE1s?=
 =?iso-8859-1?Q?bBsianJUOS7vUSQ8Xpj5i//zLDZbxwKAMBLEmvdIHmoOENKniyAkevNRFp?=
 =?iso-8859-1?Q?L0F/ON58hRZFhnVLqANHBlSOyaRNCtYZQvWda5nWcG9FOvdKK20bxF+5gM?=
 =?iso-8859-1?Q?7I3yIWa+PIsQxRvCXaOIuf1Wrv2rHMYueUa2ZIbjboBHiUwY68Vp/00W4K?=
 =?iso-8859-1?Q?PKCZVU6V2epAo/mX4skB/G2+zLvWHOin+G2IrdckNVGddqcV7ncKxO5Rfh?=
 =?iso-8859-1?Q?Mt6bvNQ+9TB40HAktNY9cv68zWu8xZpfBBNQcHXB8oDpN6jJDTfls6Lk3e?=
 =?iso-8859-1?Q?YyljfqJgbkY/snYwWzYsukrRzGkTNXPVtR/m+Ahjxafm6AIN3oq6q+Q7s2?=
 =?iso-8859-1?Q?c27d9M81N8EuFMNCccTE+c9S+B5fBsxtfhul6ZsL1m2in7TwVSk9FNQE8L?=
 =?iso-8859-1?Q?vFSz2N1E3K7rHCknmd8yUs/gf8jKPjzIphEhMDeyaTvd43kvCR7qHuepiC?=
 =?iso-8859-1?Q?tTLxByv/nOEBc3/Q7CRC3NA38jsN1ybst8LtAz7TEMcQIEbGt8nr0sPQX4?=
 =?iso-8859-1?Q?Nmp+rInraW5B46p4sKEX6rpSWD1+io4sOGs+l/Hhw5+UxgOCo27xaTccW5?=
 =?iso-8859-1?Q?b96+GRp924RZgOM2+br9+OZcA/l9Cp0BswGRq8BAm4S4UM1ls/siC7rQ0r?=
 =?iso-8859-1?Q?sbkD3ElDwtjNoQ+JT690/5j/2XjUxZABJvGfTXdIPZ0Xhq8UMRXJcv9iZY?=
 =?iso-8859-1?Q?nOboqMGILdyBVya5FTCt40QN71I14zM0tybEHYh47Na8PEELif/lWZ+Y8u?=
 =?iso-8859-1?Q?13jlAuEbKSV9iOGvT6FvlGeos2RW4iK29Y2vELkrSP8290ttkmOHZhXUbu?=
 =?iso-8859-1?Q?l7DdpHLQ9K?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3022.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e22466-424b-44fe-1cda-08d8cb461604
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2021 08:55:14.8923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t4RJOnQQOe+p9rZl3YJd/aElB2EzPuOQvm01xnrYj1OZImj/dVSHPrlC94AmCmGG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3600
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1724862489=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1724862489==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB302293A04AF17EA077E84B1FA2B09MN2PR12MB3022namp_"

--_000_MN2PR12MB302293A04AF17EA077E84B1FA2B09MN2PR12MB3022namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

if possible, please correct the same issue in navi10_ppt.c

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Sent: Sunday, February 7, 2021 4:49 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: Koenig, Christian <Christian.Koenig@amd.com>; airlied@linux.ie <airlied=
@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>; amd-gfx@lists.freedesktop.or=
g <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-dev=
el@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.=
kernel.org>; Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] drm/amd/pm: Remove unnecessary conversion to bool

Fix the following coccicheck warning:

./drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:907:47-52:
WARNING: conversion to bool not needed here.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/driv=
ers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index d68d3df..b364862 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -904,7 +904,7 @@ static bool sienna_cichlid_is_support_fine_grained_dpm(=
struct smu_context *smu,
         dpm_desc =3D &pptable->DpmDescriptor[clk_index];

         /* 0 - Fine grained DPM, 1 - Discrete DPM */
-       return dpm_desc->SnapToDiscrete =3D=3D 0 ? true : false;
+       return dpm_desc->SnapToDiscrete !=3D 0;
 }

 static int sienna_cichlid_print_clk_levels(struct smu_context *smu,
--
1.8.3.1


--_000_MN2PR12MB302293A04AF17EA077E84B1FA2B09MN2PR12MB3022namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: calibri, sans-serif; font-size: 11pt; color: rg=
b(0, 0, 0); background-color: rgba(0, 0, 0, 0);">if possible</span><span st=
yle=3D"font-family: calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, =
0); background-color: rgba(0, 0, 0, 0);">,
 please correct the same issue in navi10_ppt.c&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: calibri, sans-serif; font-size: 11pt; color: rg=
b(0, 0, 0); background-color: rgba(0, 0, 0, 0);">Reviewed-by: Kevin Wang &l=
t;kevin1.wang@amd.com&gt;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: calibri, sans-serif; font-size: 11pt; color: rg=
b(0, 0, 0); background-color: rgba(0, 0, 0, 0);">Best Regards,</span><br>
<span style=3D"font-family: calibri, sans-serif; font-size: 11pt; color: rg=
b(0, 0, 0); background-color: rgba(0, 0, 0, 0);">Kevin</span></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Jiapeng Chong &lt;jia=
peng.chong@linux.alibaba.com&gt;<br>
<b>Sent:</b> Sunday, February 7, 2021 4:49 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; airlied@linu=
x.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;; amd=
-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel=
@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;;
 linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; Jiapeng=
 Chong &lt;jiapeng.chong@linux.alibaba.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/pm: Remove unnecessary conversion to bool</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Fix the following coccicheck warning:<br>
<br>
./drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:907:47-52:<br>
WARNING: conversion to bool not needed here.<br>
<br>
Reported-by: Abaci Robot&lt;abaci@linux.alibaba.com&gt;<br>
Signed-off-by: Jiapeng Chong &lt;jiapeng.chong@linux.alibaba.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/driv=
ers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c<br>
index d68d3df..b364862 100644<br>
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c<br>
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c<br>
@@ -904,7 +904,7 @@ static bool sienna_cichlid_is_support_fine_grained_dpm(=
struct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dpm_desc =3D &amp;pptable-=
&gt;DpmDescriptor[clk_index];<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 0 - Fine grained DPM, 1=
 - Discrete DPM */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dpm_desc-&gt;SnapToDiscrete =
=3D=3D 0 ? true : false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dpm_desc-&gt;SnapToDiscrete !=
=3D 0;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int sienna_cichlid_print_clk_levels(struct smu_context *smu,<b=
r>
-- <br>
1.8.3.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB302293A04AF17EA077E84B1FA2B09MN2PR12MB3022namp_--

--===============1724862489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1724862489==--
