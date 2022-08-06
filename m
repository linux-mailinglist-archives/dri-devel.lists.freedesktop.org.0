Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E832E58B8B1
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 01:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFB68F2C7;
	Sat,  6 Aug 2022 23:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com
 [205.220.165.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BD28FB49;
 Sat,  6 Aug 2022 23:44:58 +0000 (UTC)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
 by mx0a-000eb902.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 276Nfm9t014919;
 Sat, 6 Aug 2022 18:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pps1; bh=5RGo/H8chve67J0d3cPykEFA6JivvZSvm5q8Zg+zq6E=;
 b=BYae7Vvtq9mgrpvHfIJp2x8EcIF9BbHFd2+WNgamgn9BOAuouvsB1rq+JmzH43lEg3T1
 lx+jQZEEdOAyfImij5K5VrnZL+w8AQY/08F5Wc3muoa4VLSqPSD3OMduTjIASag3trWo
 3M5t96yuknw8O+9qzDitOH75EV4jN0832kxn5a3m9uYw4MH3eYFHNyHwufm2MmmzVyun
 76JC9nh5J+ywB1609DFS8CCvMbqs8mg8C+fgsoOLSfEqk4s8SC0QDrLKOOaMWKl6rmJ3
 umv4FmG1wAxwBmsEK2Rmpyz/+UCfkpo+Lqhwger78D//DpY2ATFjgmFBvx+tkAyvH5K9 IA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3hsjrvruj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Aug 2022 18:44:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRVh/f04/ZdwjS1Tmk8RMD74SX0LYhA6dmr0c9LBz/7lzZiJmDhctpZpCXWpsSiDgTfaa0kJltC2Y6ylPEhlT3drMD7v9C7GaYZ81RgChBn2NdDphURR4t/yLACS4+tvlJ8ys3AOwZ6Vi+0QuhzS3TIgMyls50927EIPlgvmhleXUiVf/X4WvrLoGGKRTgG67nu0BZL4w9ux+ZZJHlEc8dLWhESCIqW83dAyLIeH+/AoKF5rZn2aomYHG3L+HSA2rP4c/W4YwXqVu3uFUP26pQBqowLhrOj/lt/DnCc76zE4HpfkMeB9nGpELn5HNFBHBYr06MoJe2yypr//69oSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RGo/H8chve67J0d3cPykEFA6JivvZSvm5q8Zg+zq6E=;
 b=mDKWqXwtld8sPlutXzdmbVDnNoBqdBoYiJjAil4lgHjXR9KCARLpezr6CIM66kqjHOhVlww8rZKadtsS6iKjbOvUjzRcSXfffAFZY7l9ZpI7GxgH9T594Qt5WRJ7D+pPTUGxg5PdrqaBjS0BVM3MvcQFz2wzY8ZwemyV7EA/vOLBC2rTnA1GnKr0CHwIu7ZkvqICptdze7EJahF3Q8uFCq0LWPJ3W1syjDn3JQC/snlNRsrqUrX3JTcJNSZxeYt4S+oOuZpiFXhqa58YUruxXt+ZEmWqf3r1WxRQjWwSYHqIQZQgJiSARISqhLO2iU8Y4qzQvV5xMPXnCgaNrvVE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=emersion.fr smtp.mailfrom=garmin.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RGo/H8chve67J0d3cPykEFA6JivvZSvm5q8Zg+zq6E=;
 b=jDBL4U00pkYD8hUPELAuMNwGyjkLj+8+J0fLt8tx4zxJARrvmsLwUgc/RCvHQvwfuTZQb+CODaGb3M6kWUI5Fd2TOcOoXdjuSunte4zPQDUsgnHr6fZqOFubX9TwgmIBU2n/vjJZWBURxHltVbJfkR7wTKDbt/ALpjTSWS83yRcrcxoq/ovGdR12+MBJyeA6CFDHU78+sJqrdJkjtrQq9zOOr2NEcy2CNmbDSltvw11VC+AJd30FSPYj7zhei1ZsYnMUGmG/I5mvBf4XIhbJGV/GV2FwO1whD5xcJYhFHEehcZs5Oi8V64l010TwvsHV40x+M1PsXHZOBgGV4oVBRg==
Received: from MW4PR04CA0046.namprd04.prod.outlook.com (2603:10b6:303:6a::21)
 by SJ0PR04MB8405.namprd04.prod.outlook.com (2603:10b6:a03:3d2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Sat, 6 Aug
 2022 23:44:45 +0000
Received: from MW2NAM10FT063.eop-nam10.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::7c) by MW4PR04CA0046.outlook.office365.com
 (2603:10b6:303:6a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Sat, 6 Aug 2022 23:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 MW2NAM10FT063.mail.protection.outlook.com (10.13.155.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14 via Frontend Transport; Sat, 6 Aug 2022 23:44:45 +0000
Received: from OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) by
 olawpa-edge1.garmin.com (10.60.4.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Sat, 6 Aug 2022 18:44:42 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.28; Sat, 6 Aug 2022 18:44:44 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2375.028; Sat, 6 Aug 2022 18:44:43 -0500
From: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: How to test whether a buffer is in linear format
Thread-Topic: How to test whether a buffer is in linear format
Thread-Index: Adiox0fTIlpnOYJLQwGkp50B7EPq4AA7N3sAAAZBIMoAC1fxgP//56oS
Date: Sat, 6 Aug 2022 23:44:43 +0000
Message-ID: <c2260d9a339d47dd943603f4dc2ecc68@garmin.com>
References: <491b09b4dd40404c8559513713bdb17a@garmin.com>
 <20220806144700.0519b70c@ferris.localdomain>
 <2beb027f324d4d60a1d1bf10fafb65ee@garmin.com>,
 <fy2nAbatiBdkL1uU_gQDMm_cmINuuox465B4N5RaTdAv5TPpHZdlXn388lhEA3wRJT3ux8uRcQp_N2E4E3Lnpi2ryLfEPOx30RDhVYQkr6w=@emersion.fr>
In-Reply-To: <fy2nAbatiBdkL1uU_gQDMm_cmINuuox465B4N5RaTdAv5TPpHZdlXn388lhEA3wRJT3ux8uRcQp_N2E4E3Lnpi2ryLfEPOx30RDhVYQkr6w=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.5.209.13]
Content-Type: multipart/alternative;
 boundary="_000_c2260d9a339d47dd943603f4dc2ecc68garmincom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7a26626-ac92-4fd6-bd8a-08da7805a475
X-MS-TrafficTypeDiagnostic: SJ0PR04MB8405:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QrV8PVPrkdqrR1Amh0/ldBcVW6GRGtIxW3Uj3c3O2uDbqnv5Y0zRbproUaVNawqcL6cIgDTHUzmW8OU3mjaQlh2Ib6A7eQBzSjZWh6+8TonZd+adc1JOpz4s1aERuP/xts1IDToLCoow2gw/WlpcUzK9mADOKkqpOrYjo2P7I6GBROkw3grb+aUUwO8PIrs2emStWD4ZVRjXuOTRP5+rXgG/hSbjubevKczszdKqxM7/tBUaX8yhDAoCnSOq/nXgIRGOGAGbhbfQe9SPq2wF5EYt/gWA3b/FLF3SvaH4PgT50TE9xuDt8e/IVsrg+th/AHbAKAWxIb/v9rjcM+4lvxXDnA/juj2jY69y/FF37R+72PDKrVijYGhDs0qJoBfRZzSKvtVSnrWtnBfN2Y0MMqEOstSswJS9O0x6TY1seiFdQLdQAt4+C8R4GAtll/ulcHUUv2xUT89cMU/mOSvLL5+YZD4N989fffPk9JSWyykF5DMwVrrhzoERC5n0gAaqCKVEIVc/2ytxEhkz9a4FUqcgbldyZ2xzYe2nENLTKeyXTcfvkBrF5uDaOOKVOhs8dPv/NHojPGnCAmw8pmoJAI4WCjr1mkLQijd/rBdQeTQVyp2beIvfUDR9yvSFs5GaPOOYMqla7X0fy6yY/e6MAvZAUx1f57ZEs5B2ghSukwQJXZlF/qL/a2girhC1qiVxXsl9U9DFGBI/84Wy+h67WAlGRWy4E5aG+a5O87cG+FtAvEj+PxC2qQCKnAdUiRb2Pr0IHrs2vMOcAEwOa4ThLC+JqulVcS4Z47yFI4ZWU8WdqRoKKgjtLHJhE3AM6tvW6AixooD5x2SZ56wnhXNvm5ED3FXifQut0idkwDKmPZU=
X-Forefront-Antispam-Report: CIP:204.77.163.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:edgetransport.garmin.com; PTR:extedge.garmin.com;
 CAT:NONE;
 SFS:(13230016)(396003)(136003)(39860400002)(346002)(376002)(36840700001)(46966006)(40470700004)(6916009)(54906003)(40460700003)(316002)(70206006)(36756003)(70586007)(356005)(8936002)(7636003)(86362001)(166002)(82740400003)(5660300002)(966005)(26005)(34020700004)(36860700001)(2906002)(82310400005)(478600001)(53546011)(108616005)(7696005)(24736004)(4326008)(8676002)(40480700001)(2616005)(47076005)(41300700001)(186003)(426003)(336012)(83380400001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2022 23:44:45.4289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a26626-ac92-4fd6-bd8a-08da7805a475
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d; Ip=[204.77.163.244];
 Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM10FT063.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8405
X-Proofpoint-GUID: 9jYaO_oKRcV7mAZyBO34s3N8bR-rvTqk
X-Proofpoint-ORIG-GUID: 9jYaO_oKRcV7mAZyBO34s3N8bR-rvTqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-06_13,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208060123
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_c2260d9a339d47dd943603f4dc2ecc68garmincom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Oh, facepalm. I didn=92t even think to look at the numeric value. Sorry for=
 the confusion.
________________________________
From: Simon Ser <contact@emersion.fr>
Sent: Saturday, August 6, 2022 3:10:53 PM
To: Hoosier, Matt
Cc: Pekka Paalanen; dri-devel@lists.freedesktop.org; wayland-devel@lists.fr=
eedesktop.org
Subject: Re: How to test whether a buffer is in linear format

CAUTION - EXTERNAL EMAIL: Do not click any links or open any attachments un=
less you trust the sender and know the content is safe.


On Saturday, August 6th, 2022 at 21:56, Hoosier, Matt <Matt.Hoosier@garmin.=
com> wrote:

> Any idea what=92s up with some compositors adding code to infer
> DRM_FORMAT_MOD_LINEAR semantics when the buffer=92s modifiers are set
> to 0?

What does that mean? A buffer only has a single modifier, and LINEAR =3D=3D=
 0.

> Wlroots, for example, added this as a =93safety net for drm drivers not a=
nnouncing modifiers=94.
>
> https://urldefense.com/v3/__https://source.puri.sm/Librem5/wlroots/-/merg=
e_requests/63__;!!EJc4YC3iFmQ!RegnOCvgB8sugB2skP7I220urpYpvjg8fLOw4lDYr0BxH=
49vOvVoFTbpykg8Nvb5Wxn33tnxgLNRAW2eePiR$

This is not upstream wlroots. This change doesn't make sense to me at
all. Either a driver supports modifiers and advertises support for it,
either it doesn't and gbm_surface_create_with_modifiers fails. At any
rate, forcing LINEAR in this code-path doesn't make sense.

________________________________

CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient(s) and contain information that may be Garmin co=
nfidential and/or Garmin legally privileged. If you have received this emai=
l in error, please notify the sender by reply email and delete the message.=
 Any disclosure, copying, distribution or use of this communication (includ=
ing attachments) by someone other than the intended recipient is prohibited=
. Thank you.

--_000_c2260d9a339d47dd943603f4dc2ecc68garmincom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>Oh, facepalm. I didn=92t even think to look at the numeric value. Sorr=
y for the confusion.
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Simon Ser &lt;conta=
ct@emersion.fr&gt;<br>
<b>Sent:</b> Saturday, August 6, 2022 3:10:53 PM<br>
<b>To:</b> Hoosier, Matt<br>
<b>Cc:</b> Pekka Paalanen; dri-devel@lists.freedesktop.org; wayland-devel@l=
ists.freedesktop.org<br>
<b>Subject:</b> Re: How to test whether a buffer is in linear format</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">CAUTION - EXTERNAL EMAIL: Do not click any links o=
r open any attachments unless you trust the sender and know the content is =
safe.<br>
<br>
<br>
On Saturday, August 6th, 2022 at 21:56, Hoosier, Matt &lt;Matt.Hoosier@garm=
in.com&gt; wrote:<br>
<br>
&gt; Any idea what=92s up with some compositors adding code to infer<br>
&gt; DRM_FORMAT_MOD_LINEAR semantics when the buffer=92s modifiers are set<=
br>
&gt; to 0?<br>
<br>
What does that mean? A buffer only has a single modifier, and LINEAR =3D=3D=
 0.<br>
<br>
&gt; Wlroots, for example, added this as a =93safety net for drm drivers no=
t announcing modifiers=94.<br>
&gt;<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://source.puri.sm/Librem5/=
wlroots/-/merge_requests/63__;!!EJc4YC3iFmQ!RegnOCvgB8sugB2skP7I220urpYpvjg=
8fLOw4lDYr0BxH49vOvVoFTbpykg8Nvb5Wxn33tnxgLNRAW2eePiR$">
https://urldefense.com/v3/__https://source.puri.sm/Librem5/wlroots/-/merge_=
requests/63__;!!EJc4YC3iFmQ!RegnOCvgB8sugB2skP7I220urpYpvjg8fLOw4lDYr0BxH49=
vOvVoFTbpykg8Nvb5Wxn33tnxgLNRAW2eePiR$</a><br>
<br>
This is not upstream wlroots. This change doesn't make sense to me at<br>
all. Either a driver supports modifiers and advertises support for it,<br>
either it doesn't and gbm_surface_create_with_modifiers fails. At any<br>
rate, forcing LINEAR in this code-path doesn't make sense.<br>
</div>
</span></font><br>
<hr>
<font face=3D"Arial" color=3D"Gray" size=3D"1"><br>
CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient(s) and contain information that may be Garmin co=
nfidential and/or Garmin legally privileged. If you have received this emai=
l in error, please notify the sender
 by reply email and delete the message. Any disclosure, copying, distributi=
on or use of this communication (including attachments) by someone other th=
an the intended recipient is prohibited. Thank you.<br>
</font>
</body>
</html>

--_000_c2260d9a339d47dd943603f4dc2ecc68garmincom_--
