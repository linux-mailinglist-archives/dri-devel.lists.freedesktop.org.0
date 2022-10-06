Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71945F65EB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 14:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB27B10E366;
	Thu,  6 Oct 2022 12:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1250 seconds by postgrey-1.36 at gabe;
 Thu, 06 Oct 2022 12:24:54 UTC
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com
 [205.220.165.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E8410E3CE;
 Thu,  6 Oct 2022 12:24:54 +0000 (UTC)
Received: from pps.filterd (m0220296.ppops.net [127.0.0.1])
 by mx0a-000eb902.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296BNLZ8005460;
 Thu, 6 Oct 2022 07:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps1;
 bh=3et9rEEMzrImUiX/dTAcsft8CKxYcPBcC3pKWDiRtF8=;
 b=ZGmhev/p0a5332bdCofSlvitVIwH8tLHWBhyfj9FwwQB7NkxuEjlHu/DHuPKsd//F8vQ
 WWdoveoyyvaVpkAR2UftuGUNRF2ZwZ9dQob0KEF5QGrPNGPu+EO4rCLmXp9x6t1qzQI+
 mpfNcH6rvBPLgmHEX5cCCDsdmAT1sxpxwkaoYVw20iQcJ315E95uzPHxgzxhVC+A6hPA
 X052Rd2ulEokJhWIQD1DGsJntETc5R4kvnrzqmMk1zCKdY9JxX1tR4a4jFq7P4wc9Juq
 9jVdfJTPOOqqVrjRlKC1ShNFAUgvS7L4Ayd6N+NH/VplU9c2TxMp7X+BfOVeDXdWeJp7 pw== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
 by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3k1vwfg4gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Oct 2022 07:04:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTQlbY1gqdjQRZ7371WqNUf+c/vovtvYn8SwFMpx4z/8fipRGH4V54T9fnwRKEp3CRLlR8qTUPi0o1qIifDqgo6Fi5b3UftmmeqkiKujOtIWepXfZr90+UZXOLOP3kJaFD+tTIPByreAOBViw1i5c34MbWIsgtaBO9lZ8fiDx8CV+atcFlULej/5E+H8IMKRiZLrqgM1eGLyleKU9U7g4sdQ6oh+MZZA7kxLLTkBJM4gOvs+UomX2gpLkEkag1euZx0SCX/T7rFkPKJWevFjIJh4bN/y8hTlfwASPCDUKTWfeUoGSTZOkekPbvmfNeUhxBgYN+42sjkVvs0urfF5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3et9rEEMzrImUiX/dTAcsft8CKxYcPBcC3pKWDiRtF8=;
 b=YrT2cRzSEOxf0h8u8ISNfTybEL7k5z1pHhUbs6aQ2Ug00iZ+aT9gGcCQv6h8pc0RQKqg5DMMQCMBeMsUV1tKODlnjX44HPtuE9B7NODxtkdI0VzoaanXRbV9CtL3uz+J6EIhdkE5Fnc8Q3Od/5m65vNUqWMz9n/VKdyX5voM2ixY86IJcMeQRVCNVQfzuR1PxyM8beSJrJZ4dwa/PaB5v5kLZfxuzn+XmMW70ZaVLkLrPa1Gg1QGZ82OeZlEbY6RlLVrPTSqNcX08/fygm0RXfAHyx4lfkT0GulIKi4xYmVITme3K82pmV2rE/JJKdBR32wKw3O2cd6aTgoHSdkwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3et9rEEMzrImUiX/dTAcsft8CKxYcPBcC3pKWDiRtF8=;
 b=XAaBCtKEQp5lP4pyv8eYWWcP0bSRwDrTO0c1WM28gxPXlkFqBGkR+//VxViqdcGuISNrdc0WwfZccKpYUyKyasjYXRIYlhscmEagMpXeIjkY6QR/j6ckgiHSoFLH9FsazT9dH2INfCcbWu4tLEY1OtGZE6IIgsbUkAJuK13/b/uaM/H5dw98wRmyIYLmLH6+XLtaV16ybUh7r7linuUMZoouORFIpvYc72VKn1D2krDqeHSDYknR2ADcsydi/PFROO/yIfa7bICTnsb/5p9tUj9vEYu65xcL6yiLhXzHQP2a5k8qpdd4YzS1yIw1yb51WJPFwZSXOs7zc3EyL+K1Lw==
Received: from DS7PR03CA0075.namprd03.prod.outlook.com (2603:10b6:5:3bb::20)
 by SN4PR04MB8414.namprd04.prod.outlook.com (2603:10b6:806:201::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 6 Oct
 2022 12:03:57 +0000
Received: from DM6NAM10FT081.eop-nam10.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::6d) by DS7PR03CA0075.outlook.office365.com
 (2603:10b6:5:3bb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.22 via Frontend
 Transport; Thu, 6 Oct 2022 12:03:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 DM6NAM10FT081.mail.protection.outlook.com (10.13.152.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.12 via Frontend Transport; Thu, 6 Oct 2022 12:03:57 +0000
Received: from OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) by
 olawpa-edge2.garmin.com (10.60.4.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Thu, 6 Oct 2022 07:03:54 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Thu, 6 Oct 2022 07:03:56 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2375.031; Thu, 6 Oct 2022 07:03:56 -0500
From: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Subject: Internal DRI subsystem locking and contention between connector
 commits
Thread-Topic: Internal DRI subsystem locking and contention between connector
 commits
Thread-Index: AdjZd6/JXMTDpSG4RtuOdjfEIjzamw==
Date: Thu, 6 Oct 2022 12:03:56 +0000
Message-ID: <0607ee97b0af4b9fa8f17cb99388e214@garmin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ActionId=58f8c138-1322-454b-a654-aef73fb2bbbe;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=0;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=true;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=f3ff6d80-3782-4df6-bf6c-659f84558040;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2022-10-06T11:34:04Z;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
x-originating-ip: [10.5.209.13]
Content-Type: multipart/alternative;
 boundary="_000_0607ee97b0af4b9fa8f17cb99388e214garmincom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM10FT081:EE_|SN4PR04MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 849ec4b7-3fc0-4918-af06-08daa792d915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Tu0CSNhN/bghl12CkqLnbO0oYLbDdUhAt8T7fDZb7mjTYGB2almpLSbTVp84qi4Tt0dMpPYEwWaKTDy24C/fJsYTOzylQoGocvB6Pc+zfiBnVpx4AsPo2ckdcAV8VlMXfUPWF3egLOQIpxEql7bGNkIkgL1bG08BhJ5aFL3QTiMtwcQt7WVzdMHhwWve9Mxen4K2y+6Glm1Qp8d2i+gDXzXXsAlzBrLFvo6GostBi9Mt49mR2ReXH/CEPv0A8/mfd6yZBKh+EhjyklmoEDZOV4aubEaZrMdj6y7rczJnXRGZmQGSn3aOA33zq5k2ugZO9h0DH23R4oZY9prJ8fs4w1ZSWph3pjxKbZWmuGhv7bIUX6+5K4dvUYJFR70yxLL83R2VcHyDOun8xqKmb2axGI4WS1jfUmvIP6ZpOLDLJjdBj35yArLf/18+9RyNvsJqCwQxQj9nF9IQgArIsXypSi2Ii9JVZwMhipzdE7NuaxaSqzWUN5IKpasBCjaZH775o6c4D5nm2IeUCyMDE1KFPS+LwZmYW9IXWxYB7bq2cvfManhlIs4velStlP2iM6You18aG9g6p0dcTra/edVYQULP2wEa1T2AtoM0hqVMKKoA1TRKGKeMVD4ahBF99VVhyXHdEhSqJnUQ2n0aB7vHLNo8QvYOnhiectaiw10RiMGuAcv9D+r1m87IpsZmQ8YKRZ6nCOM+lbFIS6vYI5kD+sIRQGklcCJS+PqzFXlafwvolIoIrbpJ2+IQv6dAnxKGhlS7bDRL1VL6/ubyiKrBg==
X-Forefront-Antispam-Report: CIP:204.77.163.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:edgetransport.garmin.com; PTR:extedge.garmin.com;
 CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(396003)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(26005)(108616005)(316002)(356005)(82740400003)(7636003)(110136005)(450100002)(36860700001)(40460700003)(36756003)(86362001)(40480700001)(83380400001)(2616005)(7696005)(24736004)(478600001)(8676002)(70206006)(70586007)(8936002)(5660300002)(82310400005)(336012)(426003)(47076005)(186003)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 12:03:57.4393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 849ec4b7-3fc0-4918-af06-08daa792d915
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d; Ip=[204.77.163.244];
 Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT081.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR04MB8414
X-Proofpoint-GUID: V2csjSuNC0mlJVuFbVjaSYccZpD2IGPp
X-Proofpoint-ORIG-GUID: V2csjSuNC0mlJVuFbVjaSYccZpD2IGPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_01,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210060073
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

--_000_0607ee97b0af4b9fa8f17cb99388e214garmincom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a DRM master implementing a purpose-built compositor for a dedicated=
 use-case. It drives several different connectors, each on its own vsync ca=
dence (there's no clone mode happening here).

The goal is to have commits to each connector occur completely without resp=
ect to whatever is happening on the other connectors. There's a different t=
hread issuing the DRI ioctl's for each connector.

In the compositor, each connector is treated like its own little universe; =
a disjoint set of CRTCs and planes is earmarked for use by each of the conn=
ectors. One intention for this is to avoid sharing resources in a way that =
would introduce implicit synchronization points between the two connector's=
 event loops. So, atomic commits made to one connector never attempt to use=
 a resource that's ever been used in a commit to a different connector. Thi=
s may be relevant to a question I'll ask a bit later below about resource l=
ocking contention.

For some time, I've been noticing that even test-only atomic commits done o=
n connector A will sometimes block for many frame-times. Analysis with the =
DRI driver implementor has shown that the atomic commits to A--whether DRM_=
MODE_ATOMIC_TEST_ONLY or DRM_MODE_ATOMIC_NONBLOCK--are getting stuck in the=
 ioctl entry code waiting for a DRI mutex.

It turns out that during these unexpected delays, the DRI driver's commit t=
hread holds that mutex while servicing a commit to connector B. It does thi=
s while it waits for the fences to fire for all framebuffer IDs referred to=
 by the pending connector B scene. So the commit to connector A can't be te=
sted or enqueued until the commit to B is completely finished. The driver a=
uthor reckons that this is unavoidable because every DRM_IOCTL_MODE_ATOMIC =
ioctl  needs to acquire the same global singleton DRM connection_mutex in o=
rder to query or manipulate the connector.

The result is that it's quite difficult to guarantee a framerate on connect=
or A, because unrelated activity performed on connector B can hold global l=
ocks for an unpredictable amount of time.

The first question would be: does this story sound consistent? If so, then =
a couple more questions follow.

Is this kind of implicit interlocking expected? Is there any way to avoid t=
he pending commits getting serialized like that on the kernel side?

Thanks
-Matt


--_000_0607ee97b0af4b9fa8f17cb99388e214garmincom_
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
<p class=3D"MsoNormal">I have a DRM master implementing a purpose-built com=
positor for a dedicated use-case. It drives several different connectors, e=
ach on its own vsync cadence (there&#8217;s no clone mode happening here).<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The goal is to have commits to each connector occur =
completely without respect to whatever is happening on the other connectors=
. There&#8217;s a different thread issuing the DRI ioctl&#8217;s for each c=
onnector.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the compositor, each connector is treated like it=
s own little universe; a disjoint set of CRTCs and planes is earmarked for =
use by each of the connectors. One intention for this is to avoid sharing r=
esources in a way that would introduce
 implicit synchronization points between the two connector&#8217;s event lo=
ops. So, atomic commits made to one connector never attempt to use a resour=
ce that&#8217;s ever been used in a commit to a different connector. This m=
ay be relevant to a question I&#8217;ll ask a bit
 later below about resource locking contention.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For some time, I&#8217;ve been noticing that even te=
st-only atomic commits done on connector A will sometimes block for many fr=
ame-times. Analysis with the DRI driver implementor has shown that the atom=
ic commits to A--whether DRM_MODE_ATOMIC_TEST_ONLY
 or DRM_MODE_ATOMIC_NONBLOCK--are getting stuck in the ioctl entry code wai=
ting for a DRI mutex.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It turns out that during these unexpected delays, th=
e DRI driver&#8217;s commit thread holds that mutex while servicing a commi=
t to connector B. It does this while it waits for the fences to fire for al=
l framebuffer IDs referred to by the pending
 connector B scene. So the commit to connector A can&#8217;t be tested or e=
nqueued until the commit to B is completely finished. The driver author rec=
kons that this is unavoidable because every DRM_IOCTL_MODE_ATOMIC ioctl&nbs=
p; needs to acquire the same global singleton
 DRM connection_mutex in order to query or manipulate the connector.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The result is that it&#8217;s quite difficult to gua=
rantee a framerate on connector A, because unrelated activity performed on =
connector B can hold global locks for an unpredictable amount of time.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The first question would be: does this story sound c=
onsistent? If so, then a couple more questions follow.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is this kind of implicit interlocking expected? Is t=
here any way to avoid the pending commits getting serialized like that on t=
he kernel side?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">-Matt<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_0607ee97b0af4b9fa8f17cb99388e214garmincom_--
