Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27771F524
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 23:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BDB10E5DF;
	Thu,  1 Jun 2023 21:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2449 seconds by postgrey-1.36 at gabe;
 Thu, 01 Jun 2023 21:56:47 UTC
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com
 [205.220.165.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1AB10E5DE;
 Thu,  1 Jun 2023 21:56:47 +0000 (UTC)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
 by mx0a-000eb902.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351APNXA001198; Thu, 1 Jun 2023 16:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps1;
 bh=4Lc9BhD/M+N3kiqcm9vL0AMejM50ZkkD87Q8fRAD5LA=;
 b=LhpjO+uJXyxLGKn5RuwHRRXOiYA/hJ0xLTV0ir9BJLrq8Y7GVeSTNNk+5liShI8XY3Cz
 emUy/XFh3uogrtUJYE6lpoov2P6kxoOcYIQESvJtsJGyHoDULTDp/sC9oFwcGQzwTXL9
 BR9/IuEQ3L8mfOXP+beTvQlvrGqT5OMVC410eunZnNy47osxIY/E5JzOSg4QjUETAuGJ
 C//LB/GHm7J1TE0AZ3WzWpz0kaBXApEixE2Eah6UEHMGkDgqKKsF4WtXdVI8UZ2iBjYG
 2pjYX6kG7i0+TxqKjTpK2T9j4iHcgSjTEvXhoIL4WG69WVozOLVvy4FPnZTg/4bNlFBZ dA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3qxsjj95qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 16:15:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iz0sVxd2LLdetr5Yw9Xl2T0O0AOquN+inPoBIlFZOBg7wTYRjTjq7u+68+imM6nme+N8mLbJTni7cVl3JnIRBc+cMAVS89OncuQGhH5bCcx2eo9d5u9jIO2FDHeYTU7IB5VbKAtKxA7vWLHBCi1fg9NwoJKiRgJSMgo/jABydqJvXzxWBhqsNsHzWGn+wJp9/DCLeVGsor1d11+VfMMebUh5fowKF+26U7L7UbH9+ixs6LMA5kHddvXu6BClZmrxDO27IoyVWjz0Hl/kgkFR8cFwle91+3tGpMiUZiBCSNOLU/m4ewuoes76rOxZ8GsULhH3UJ/4x4FX9onDgRiABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Lc9BhD/M+N3kiqcm9vL0AMejM50ZkkD87Q8fRAD5LA=;
 b=MYO02vv30lR7c0A43f2yPKnwurF/kX08sVBcjKrTTnyLwNbHJXsx1n/5bYobNNvfELZJJovZFxc0UMncqLA1wSCLD7LYeWnmzxAHKHUDp9jDnmlA3B5nEYomMA56O/lhxV4fjnSDEOkC1AyUCOAO+krcPxQMSkO2P8gy0/seimAyU0dGqdqy/QUCRsUqqMB71mcmCUcJOgk2xPr+TIDFzkIA5SGXIcEa9pK5e1dvoMvqVwc1JccSAXQ+OwTll8qPOjKPrIo1lpmjUsAUiDMsbY/6u1UDdujdBB3sEU9TjDfR+2iLl2jSUlOQoxVIkH7/BsRnx6sFf19n9n93GfTblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garmin.com; dmarc=pass action=none header.from=garmin.com;
 dkim=pass header.d=garmin.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Lc9BhD/M+N3kiqcm9vL0AMejM50ZkkD87Q8fRAD5LA=;
 b=B2IKrMV/jgVlQGfYv5MiqA4SRu44hQmrNVBzKP9mDblQt142f3BxJldDfXDuLFzqeqnKhTs8if0CeE2Urky8nv8l2Oj87LMgX1sL0BcwERqo8YJKmCqEc7btKMIqOHrRHPL/m3/z+1nR4i5urBy6zwdZWDIxtTY3bed0gFuCWWEKN8XcQ++In8+MbIJEWsgxrJYnRpbaybUR3ys3PPBJQRQ+MMAwvv5Qj54FuH6deFaO1oei9u7WWN6lPGpqH1kcYR/O3K8efjYEx3vqyjEcZaca4VSjeKyb/v1UeNc0y0XRT0rcRPY7LfBSJhgMBV0r97YqhHDGqyGS95dHQJ9dRA==
Received: from SN6PR04MB5184.namprd04.prod.outlook.com (2603:10b6:805:f4::23)
 by SJ0PR04MB7567.namprd04.prod.outlook.com (2603:10b6:a03:32d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 21:15:52 +0000
Received: from SN6PR04MB5184.namprd04.prod.outlook.com
 ([fe80::8502:12a:ce81:8b28]) by SN6PR04MB5184.namprd04.prod.outlook.com
 ([fe80::8502:12a:ce81:8b28%7]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 21:15:52 +0000
From: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "'wayland-devel@lists.freedesktop.org'" <wayland-devel@lists.freedesktop.org>
Subject: How to fetch the implicit sync fence for a GPU buffer?
Thread-Topic: How to fetch the implicit sync fence for a GPU buffer?
Thread-Index: AdmUzXk739C8Hvo5Tiu46EQcCaWflg==
Date: Thu, 1 Jun 2023 21:15:52 +0000
Message-ID: <SN6PR04MB5184576F8660D04D62AEE5C8EC49A@SN6PR04MB5184.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ActionId=e5dcaf93-c83f-4333-b243-9a6aeeafa19e;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=0;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=true;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=f3ff6d80-3782-4df6-bf6c-659f84558040;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2023-06-01T21:09:39Z;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR04MB5184:EE_|SJ0PR04MB7567:EE_
x-ms-office365-filtering-correlation-id: a72ac4ee-7ce1-4e2a-49a2-08db62e56130
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VjTMcsTpfF3boDfWKlW6337PdvU/1Amf7by+IDyQ55GbNNQWOJ9J4Uk/kBtzYe2dx4e/DrxbaT4xR5MQzqqQIyArVr1XNrta2BulTdYt/RtmzcZ0SGqTnpI+3YSt1i8vJD2JArk4n5LvtZmU7WAAyQ+730Nf42bqGJHYrFyyz+oJGIsD7y0KLQCOG7j20EO2LG23PbLEIGz3LQ60FZfDS3BrhhskCL05+Pfmu6LShEcQ0QUMf6hTpOxgypBe9XJVLqtcQt1b0m0fh6cWteYp28ylGwbcLbyRfdaSW8Ula3s7bysQrS4cydbK8PbRKbTznP/k0If0CnIF7btKJR9WyJg05mnmv5I+p71u2esJ7+7FSbjhZMQxIE0zkfq6T+E7j70ftRTcOqaw3J+EHawZTsA5ulcRZM+le382gfnGjLAwghpiKlSNl5LTl1mEUpsRg9K4A7jNQqdnK3NqqKvBKktcWbhvMo1CLGA18Lsmq35+6OsISI016LWKi43Vc39Q33w5q667SamSTBPN1gnTbzeqLgIfSwbk6clQUXwFRPm+oeG54w4ZtRwLxQvrnvP0yuZx3kwVEhw0fzxUBgp1S7TpkSp2AfJjP5RmMual5DBkEXI/KNjCekih1XbZsQUM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR04MB5184.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(7696005)(38070700005)(71200400001)(86362001)(166002)(316002)(5660300002)(9326002)(55016003)(8936002)(41300700001)(966005)(8676002)(33656002)(478600001)(99936003)(38100700002)(186003)(6506007)(26005)(66446008)(9686003)(122000001)(110136005)(450100002)(76116006)(52536014)(4744005)(66946007)(66476007)(64756008)(66556008)(2906002)(491001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vGWzQgxCRqNQAJNgWWY/E4+XVgFTkOs9tYzyWqvdvHMsTqutggL1/IZ8LhqX?=
 =?us-ascii?Q?H9N0CxBoSXy1PSveQmQ2FkPBC3kcVI1Vsa8UTHIRlCzBdYTGcEuX02/tPCq+?=
 =?us-ascii?Q?wFEqwb87dm7/n4/qPoftFutDVzqWnEcKf7c8CZrJOT6yifYLKSGalkohOOLl?=
 =?us-ascii?Q?ATbvUjlW+ldmM/0Ix6rxFdrDtY8e6U0yBXSvGGoseR53JmeY0omDk3MLlDD1?=
 =?us-ascii?Q?8Yc9il3uOFwXocDMwlGaSLhzHBKOyluEEBHdb/iYpecVv/82yBnhCxF01L5D?=
 =?us-ascii?Q?MyMc+dzPz8AraBw5QtbGmdW7ZB080SBV7tP5kn/sVj2GXtgVSkbGvo2yDZ7C?=
 =?us-ascii?Q?adjCBYjS20gWFIXWXkYOJVHhBn11kONj7y42AuSoS3PFGC8cAFOWK3gVyqDY?=
 =?us-ascii?Q?6clrv/cMwkjGh8DWVe2Hhk6IJuxGydSk73u1bThCkbjdFbeFCLcx2J5UgbEK?=
 =?us-ascii?Q?3N+6ADeeQLG+6irtl3DZhvFzcQJTF8qsyqGZhiuILd490WZqxCEw753PgEwM?=
 =?us-ascii?Q?tABuKYxn857WZ/vfYaq1GOp+G/O7gonljYJC76LQ3NAgFm159cjgdOfmTCH2?=
 =?us-ascii?Q?Zd3bwRIb8LNTNieSkXDAdk1lwTudKl1cbVbSQuMB0eZZHJO9SWVgVN39Xu6i?=
 =?us-ascii?Q?wZF1asErqgMIuXX5xh0oEegph7WaWbsvIWVM77WCQQkp00sjFFf3IHfeXg/T?=
 =?us-ascii?Q?8hFAuJl0xYQwb0HDKSM9Pd1Or+qEhYdO9VhtT6OtrRMO9xXUJ35VuqIlAESJ?=
 =?us-ascii?Q?WsflENFooJSBZI1bJgfLxa1r8Y7z4vxQEWhLLXDXKlELo0HyNzJdILQQ28aZ?=
 =?us-ascii?Q?l3glm/Cim/ibycshOqLjTtPQ2MbcrO6/PGtrEXk0ju6GZN6GlmLQ84BsnCOZ?=
 =?us-ascii?Q?C8wphaohOeq8rMO2ogHW8ZX68K7O+O2gn4xTSPwfpYgGXKGIAzrlKglgkyX/?=
 =?us-ascii?Q?OaAUuBHchmtP4MBQL3VznVIwW4v/zJDGIsH0pwpYUyQB2IFEO+GTL4LJmPgu?=
 =?us-ascii?Q?Nk17Kmn+k6w7q3unpMCoHjjkiHwJdgEFcOyvYqhUpV1PCLzj8JDkOGauGkr6?=
 =?us-ascii?Q?S77gO9tQAg5zVN0DCryg/EfXsM69O01Q7DBGletOqBShJvzdt9UUwKNcR4vV?=
 =?us-ascii?Q?jaofNEgiE/DsacP9+SjF6mIxpPHONQY2PVnUl9VNKucjJmQmnh2Dd2TCHD/G?=
 =?us-ascii?Q?WQme7aOkCHN2MhV0xvUDeuZcneFDxMxopqmZHzy43K6uEpcr2ZtXYAZ2Bf5D?=
 =?us-ascii?Q?2LgDf3oJTYrZaPeJ2HROYBfprWABvFeLIqburl5Wcl31gZwrS/gjoVjQ4MgC?=
 =?us-ascii?Q?Y14C7YFWc5fp0TZDA0eIqzCrCQZuBXx1Ll0GtNjlLLAsAnhjoBOr0izuAF+K?=
 =?us-ascii?Q?CeBQRHo5VazZS7bJQO2BomFXcPQFLtjcQ6hpnptbRBjuglzDfNqTlWUdU56h?=
 =?us-ascii?Q?O+kA782otWaIjpHIGJ8g58SmFxV29Yt8Khho/2TgUxh5NOQuNNCdBbgZJBO7?=
 =?us-ascii?Q?xEqHp50mod2k8LyOyjNQID9TVdK5qAXRisEz8Jzf+AW4RMNz2DU4YEpLY3By?=
 =?us-ascii?Q?HY0m70lzKZ0bOgkaCWPeQS/8ygr+/1ZMQ20KLVlA?=
Content-Type: multipart/related;
 boundary="_004_SN6PR04MB5184576F8660D04D62AEE5C8EC49ASN6PR04MB5184namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5184.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72ac4ee-7ce1-4e2a-49a2-08db62e56130
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 21:15:52.0406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+9Ll3W4NS9kZyE80OC8DMhY4YhlGvvA0ZIpXB+TGEa8wHQZeMrrjrDe3zxgKFrpXTeO6ZD7G2Fjft0Cwh/goQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7567
X-Proofpoint-GUID: KriaeeujD0-2F3wdmnN6__Azd4Mt2Wi2
X-Proofpoint-ORIG-GUID: KriaeeujD0-2F3wdmnN6__Azd4Mt2Wi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=828 priorityscore=1501 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306010182
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

--_004_SN6PR04MB5184576F8660D04D62AEE5C8EC49ASN6PR04MB5184namp_
Content-Type: multipart/alternative;
	boundary="_000_SN6PR04MB5184576F8660D04D62AEE5C8EC49ASN6PR04MB5184namp_"

--_000_SN6PR04MB5184576F8660D04D62AEE5C8EC49ASN6PR04MB5184namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

In the past there has been writing about Wayland's model using implicit syn=
chronization of GPU renderbuffers and KMS commits [1] [2].

It would sometimes be nice to do that waiting explicitly in a compositor be=
fore enqueueing a KMS pageflip that references a buffer who may go on rende=
ring for some time still. This stalls the pipeline.

I'm wondering whether there's an API -- maybe something analogous to drmPri=
meHandleToFD() - that allows userspace to fetch a waitable fence fd for a d=
mabuf?

-Matt

[1] https://www.collabora.com/news-and-blog/blog/2022/06/09/bridging-the-sy=
nchronization-gap-on-linux/
[2] https://lwn.net/Articles/814587/

Matt Hoosier
Staff Software Engineer
[auto_oem_sig_96dpi_solid]


--_000_SN6PR04MB5184576F8660D04D62AEE5C8EC49ASN6PR04MB5184namp_
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
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the past there has been writing about Wayland&#82=
17;s model using implicit synchronization of GPU renderbuffers and KMS comm=
its [1] [2].<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It would sometimes be nice to do that waiting explic=
itly in a compositor before enqueueing a KMS pageflip that references a buf=
fer who may go on rendering for some time still. This stalls the pipeline.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m wondering whether there&#8217;s an API -- =
maybe something analogous to drmPrimeHandleToFD() &#8211; that allows users=
pace to fetch a waitable fence fd for a dmabuf?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Matt<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[1] <a href=3D"https://www.collabora.com/news-and-bl=
og/blog/2022/06/09/bridging-the-synchronization-gap-on-linux/">
https://www.collabora.com/news-and-blog/blog/2022/06/09/bridging-the-synchr=
onization-gap-on-linux/</a><o:p></o:p></p>
<p class=3D"MsoNormal">[2] <a href=3D"https://lwn.net/Articles/814587/">htt=
ps://lwn.net/Articles/814587/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:13.0pt;mso-ligatures:non=
e">Matt Hoosier<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;mso-ligatures:none">=
Staff Software Engineer<o:p></o:p></span></p>
<p class=3D"MsoNormal"><img border=3D"0" width=3D"244" height=3D"40" style=
=3D"width:2.5416in;height:.4166in" id=3D"Picture_x0020_1" src=3D"cid:image0=
01.png@01D994A4.4E9AB750" alt=3D"auto_oem_sig_96dpi_solid"><span style=3D"m=
so-ligatures:none"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SN6PR04MB5184576F8660D04D62AEE5C8EC49ASN6PR04MB5184namp_--

--_004_SN6PR04MB5184576F8660D04D62AEE5C8EC49ASN6PR04MB5184namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=8930;
	creation-date="Thu, 01 Jun 2023 21:15:51 GMT";
	modification-date="Thu, 01 Jun 2023 21:15:51 GMT"
Content-ID: <image001.png@01D994A4.4E9AB750>
Content-Transfer-Encoding: base64

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

--_004_SN6PR04MB5184576F8660D04D62AEE5C8EC49ASN6PR04MB5184namp_--
