Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1858B810
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 21:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786EF18A605;
	Sat,  6 Aug 2022 19:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com
 [205.220.165.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CC18D4F8;
 Sat,  6 Aug 2022 19:56:24 +0000 (UTC)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
 by mx0a-000eb902.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 276Jrlfn005577;
 Sat, 6 Aug 2022 14:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pps1; bh=oPY9EsL5Ybv2T2yw5CTpK3zxhn04A6ExZVeglFbJYyc=;
 b=o7eq8JU8HBIUHZ5+zsi5tNnOXHGXTqF6zrPjcDpOe6zdvfmqO+BgZmREkuwRQDazEuEH
 /8wqlzbhgZJiui128y8AMeGedRqQ/Az4nf6PahB5RX7xWznw5VB6O5I3+gan5iVf/JMw
 S3sPsJPPcasoE/OtWf6nLZIwV1ZZOXL+2cZRqHT5361XjRgZHDfuAhWu17EIFCDzNCRy
 X/o9Uwj7pGGzGdHOoXyFxM1CbU2ASYeK1+xvjxR8UOmwYUnFsqLv4uL12ttSoGa7Uibp
 VJPXVz+0tpKalCEsYCrpaCRE1pdAfJwHSXYh5vw47TkdgrBqXO+Tibf274xbiDhVjLbg 2Q== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3hsjrvrp6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Aug 2022 14:56:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIMUk9hflSAXXPNSyrO8wqGxw+hOUbra+SgnL3wMisYWVb8msoUF0v1ODaF7t3F7ov5EpWtPCOL0UwgIMLSoEmxmnXNFYWhwbQIrlqgIgObMPGXS3I59Ou3l2/cSM4WuDu1rwyUdM6uvHB5RmOG4DIbbuiq1J+xNUHELRJElzaK9QReFJ35VrV+SV4I7QREZ+56GgCoEGcN/XvlbRAA6p90uJZvX2HlYNChGk8iuXfFieKqcdHnHP0J6Te5FwJZAX6qzMJxMbQ9CNTfct9O1ERMlrc/fjDZ/wUPnAM8R745MQuhUeTvT9gsg5CGcqr8ZdJoqaz+dGBLajsWUnO8h4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPY9EsL5Ybv2T2yw5CTpK3zxhn04A6ExZVeglFbJYyc=;
 b=dqUVmjUrExmCndFF+Arl0x7uUvVMhQBrqHRqaP5ytaSzSYVdU9CNAEYWfBFKmwJJFCvco9blmnYn7T5T4hX31pHzTod6ARH8AA910EjpxXCxiLCjH8vJxw+rpFlLKCbj/+G8niUbYgJS2ZYqTHHP7hg88w1UhNzd1z1vVwCs+2KKzCZ6pBdWkxQZOnFEibfCxdVWgNhfL90AYok/B0lLHq9QeHB+HXJfbXz8pToY/XFRlRBZ3mh6XHIDnfvQQj0yrw3ABQyu4EV6fQZ+iSFVON+HfPcWEUjC2toFFfAf2HS5Xy8QN6ywZGQdOpYKNKkAQjhrDOJ/T8eSyVOonsC2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=garmin.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPY9EsL5Ybv2T2yw5CTpK3zxhn04A6ExZVeglFbJYyc=;
 b=saTBQvL4wR7NhRnMaWKdp9Unq7X786mkEQKITPf2XoWqrGNc66QCBHvcTqnwycjh+xV341B+hfr0Z1xBlj2RE3VWih4N1VWSEb6Re1UbljZWyC+/76/uLwpnfolFSec0Kh7/qsXF3XnyGrFssatnFPOo4FPiiigv7T7qQwZLS9ec/SQXC3wRpL1GbQS12GHfekziuu5XGVxtrHcoW+Gx0tUkKZKg0Rm9TPl1Mk64TfGLl6JbocOdz7lqniVZ3rTG3OpMMfGM4AUEtGOpi/cfxgwgwv1A4cA6LJ2hg7vwnpcsSJ6dO4WHiT87fpDe2AAdLxtzpYqOiKh1u85IA+HAjA==
Received: from BN9PR03CA0652.namprd03.prod.outlook.com (2603:10b6:408:13b::27)
 by BY5PR04MB7057.namprd04.prod.outlook.com (2603:10b6:a03:227::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Sat, 6 Aug
 2022 19:56:18 +0000
Received: from BN7NAM10FT003.eop-nam10.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::23) by BN9PR03CA0652.outlook.office365.com
 (2603:10b6:408:13b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Sat, 6 Aug 2022 19:56:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BN7NAM10FT003.mail.protection.outlook.com (10.13.157.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14 via Frontend Transport; Sat, 6 Aug 2022 19:56:17 +0000
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 olawpa-edge1.garmin.com (10.60.4.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2106.2; Sat, 6 Aug 2022 14:56:15 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id
 15.1.2375.28; Sat, 6 Aug 2022 14:56:16 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2375.028; Sat, 6 Aug 2022 14:56:16 -0500
From: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: How to test whether a buffer is in linear format
Thread-Topic: How to test whether a buffer is in linear format
Thread-Index: Adiox0fTIlpnOYJLQwGkp50B7EPq4AA7N3sAAAZBIMo=
Date: Sat, 6 Aug 2022 19:56:16 +0000
Message-ID: <2beb027f324d4d60a1d1bf10fafb65ee@garmin.com>
References: <491b09b4dd40404c8559513713bdb17a@garmin.com>,
 <20220806144700.0519b70c@ferris.localdomain>
In-Reply-To: <20220806144700.0519b70c@ferris.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.5.209.13]
Content-Type: multipart/alternative;
 boundary="_000_2beb027f324d4d60a1d1bf10fafb65eegarmincom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 655a0241-8928-4bec-04a2-08da77e5b9bf
X-MS-TrafficTypeDiagnostic: BY5PR04MB7057:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gd/Cq+zM/NV7DcYenyqwe7B2sZSOOgVOYcu5AOlUAQaiADG1bwPyvkUFi5kLfTCIvN3Ts9V2OJkh664fn/kd5iAfvKIrNWtfPP332u6ld4TYQBhcbrojbTEwx79J5UfJvkX8t8ac5pFH6/LWKXKxQO6K2FHvBVrfMLl2y4CnVWcNlvDCa3prx1AgnpANZAMrmJtPh2B2V35xZzuJRYCrlOeRE38Hq6YWzB7ycw9707+lkph21YkbmdVw9cmTlLVVI0W4rG+GEK/JdmbYedqyntCbkkVzeb0UrjmCk5OR9dDUUYFP1A7913HKA03OP1TMp+TOvwryNSUCGUkd7bfvrt78q/kyt82wu/zL4WRDMoiXVFLlRqqYXfOeihQHVwXWAI7F6MbD99wN6762Unv+9vl/BhBaYvH41H0kWnACHWZoNEcfjstSLQ9Ra5xdmuGb+4j0ido5JeSpLanpgKJhThfhR2InEEw55xBoxa1GKsKadVIlghZAafGvf3Ewpmlel/eTN/sVeO7uTeHyKFJyn8GLexaIFV0kVFyNb3c8JIJcgT4SROlMRHqylEPYGi2/vZix2DQvq713ATzrMSlz1JGLHFt3dHB5yUKkSDnM4XReBOrnLJqdn5vhyPVAI/fu51aZBcT5RZX+5wtafqtdugP54PTw0qwc/6a7buKMwjuk/fydhEezsHs435HSD5Kq/bd4nIzATTV94+nfSeGO4mOO5X/QROL47hM9m40bpZFWjwyHoCD5rAVf7C94PjJ4gHSA7kxS6Rwh7DOdz0uBuOgfFNxRY9RpcvoXc1fC6nduqL68OYn1jrrw403W5EuzE0M9J7GTcj3AaEdbPH8jhqWPu6KXqn35W8EO2dp61j0=
X-Forefront-Antispam-Report: CIP:204.77.163.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:edgetransport.garmin.com; PTR:extedge.garmin.com;
 CAT:NONE;
 SFS:(13230016)(396003)(376002)(39860400002)(346002)(136003)(40470700004)(46966006)(36840700001)(966005)(2616005)(36756003)(186003)(478600001)(47076005)(426003)(336012)(82310400005)(40460700003)(8936002)(2906002)(7696005)(26005)(41300700001)(108616005)(53546011)(24736004)(356005)(83380400001)(40480700001)(34020700004)(70586007)(36860700001)(70206006)(54906003)(316002)(7636003)(86362001)(5660300002)(6916009)(82740400003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2022 19:56:17.2772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 655a0241-8928-4bec-04a2-08da77e5b9bf
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d; Ip=[204.77.163.244];
 Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT003.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7057
X-Proofpoint-GUID: idtqoT_ToNKq4BFV81jsZwAlxL1MZ1JW
X-Proofpoint-ORIG-GUID: idtqoT_ToNKq4BFV81jsZwAlxL1MZ1JW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-06_10,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208060103
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_2beb027f324d4d60a1d1bf10fafb65eegarmincom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

Thanks. If I paraphrase, I think you=92re telling me that gbm_bo_get_modifi=
ers() =3D=3D 0 is not strong enough then.

That fits with the notes on the drm_fourcc.h declaration of the linear form=
at flag:

https://elixir.bootlin.com/linux/latest/source/include/uapi/drm/drm_fourcc.=
h#L448

Any idea what=92s up with some compositors adding code to infer DRM_FORMAT_=
MOD_LINEAR semantics when the buffer=92s modifiers are set to 0? Wlroots, f=
or example, added this as a =93safety net for drm drivers not announcing mo=
difiers=94.

https://source.puri.sm/Librem5/wlroots/-/merge_requests/63

-Matt
________________________________
From: Pekka Paalanen <ppaalanen@gmail.com>
Sent: Saturday, August 6, 2022 6:47:00 AM
To: Hoosier, Matt
Cc: wayland-devel@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Subject: Re: How to test whether a buffer is in linear format

On Fri, 5 Aug 2022 12:32:01 +0000
"Hoosier, Matt" <Matt.Hoosier@garmin.com> wrote:

> Suppose that I want to map a GPU buffer to the CPU and do image
> analysis on it. I know all the usual cautions about this being a
> poor performance option, etc. But suppose for the moment that the
> use-case requires it.
>
> What's the right set of preconditions to conclude that the buffer
> is in vanilla linear representation? In other words: no
> compression, tiling, or any other proprietary GPU tricks that
> would prevent accessing the pixel data in the same way you would
> for a dumb buffer.
>

Hi Matt,

whoever produced the buffer must *explicitly* tell you that the
buffer is using the DRM format modifier DRM_FORMAT_MOD_LINEAR.

> I think that requiring the modifiers to be 0x0 would suffice. But
> is that overkill? Maybe there are situations when some modifiers
> are set, but they don't affect the interpretation of the pixel
> data.

It is not overkill, it is strictly necessary. It is not sufficient
though, you must know things like stride and offset for each plane
as well in addition to width, height and pixel format. All those
together should be enough. Note, that DRM_FORMAT_MOD_LINEAR must be
explicit. If you lack a modifier, you cannot assume it is linear.

No modifier can ever be ignored. If there is no modifier, or it is
invalid, then you must use some originating-driver specific means
to figure out what the "real modifier" is.


Thanks,
pq

________________________________

CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient(s) and contain information that may be Garmin co=
nfidential and/or Garmin legally privileged. If you have received this emai=
l in error, please notify the sender by reply email and delete the message.=
 Any disclosure, copying, distribution or use of this communication (includ=
ing attachments) by someone other than the intended recipient is prohibited=
. Thank you.

--_000_2beb027f324d4d60a1d1bf10fafb65eegarmincom_
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
<div>Hi Pekka,<br>
<br>
Thanks. If I paraphrase, I think you=92re telling me that gbm_bo_get_modifi=
ers() =3D=3D 0 is not strong enough then.<br>
<br>
That fits with the notes on the drm_fourcc.h declaration of the linear form=
at flag:<br>
<br>
https://elixir.bootlin.com/linux/latest/source/include/uapi/drm/drm_fourcc.=
h#L448<br>
<br>
Any idea what=92s up with some compositors adding code to infer DRM_FORMAT_=
MOD_LINEAR semantics when the buffer=92s modifiers are set to 0? Wlroots, f=
or example, added this as a =93safety net for drm drivers not announcing mo=
difiers=94.<br>
<br>
https://source.puri.sm/Librem5/wlroots/-/merge_requests/63<br>
<br>
-Matt
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Pekka Paalanen &lt;=
ppaalanen@gmail.com&gt;<br>
<b>Sent:</b> Saturday, August 6, 2022 6:47:00 AM<br>
<b>To:</b> Hoosier, Matt<br>
<b>Cc:</b> wayland-devel@lists.freedesktop.org; dri-devel@lists.freedesktop=
.org<br>
<b>Subject:</b> Re: How to test whether a buffer is in linear format</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Fri, 5 Aug 2022 12:32:01 &#43;0000<br>
&quot;Hoosier, Matt&quot; &lt;Matt.Hoosier@garmin.com&gt; wrote:<br>
<br>
&gt; Suppose that I want to map a GPU buffer to the CPU and do image<br>
&gt; analysis on it. I know all the usual cautions about this being a<br>
&gt; poor performance option, etc. But suppose for the moment that the<br>
&gt; use-case requires it.<br>
&gt; <br>
&gt; What's the right set of preconditions to conclude that the buffer<br>
&gt; is in vanilla linear representation? In other words: no<br>
&gt; compression, tiling, or any other proprietary GPU tricks that<br>
&gt; would prevent accessing the pixel data in the same way you would<br>
&gt; for a dumb buffer.<br>
&gt; <br>
<br>
Hi Matt,<br>
<br>
whoever produced the buffer must *explicitly* tell you that the<br>
buffer is using the DRM format modifier DRM_FORMAT_MOD_LINEAR.<br>
<br>
&gt; I think that requiring the modifiers to be 0x0 would suffice. But<br>
&gt; is that overkill? Maybe there are situations when some modifiers<br>
&gt; are set, but they don't affect the interpretation of the pixel<br>
&gt; data.<br>
<br>
It is not overkill, it is strictly necessary. It is not sufficient<br>
though, you must know things like stride and offset for each plane<br>
as well in addition to width, height and pixel format. All those<br>
together should be enough. Note, that DRM_FORMAT_MOD_LINEAR must be<br>
explicit. If you lack a modifier, you cannot assume it is linear.<br>
<br>
No modifier can ever be ignored. If there is no modifier, or it is<br>
invalid, then you must use some originating-driver specific means<br>
to figure out what the &quot;real modifier&quot; is.<br>
<br>
<br>
Thanks,<br>
pq<br>
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

--_000_2beb027f324d4d60a1d1bf10fafb65eegarmincom_--
