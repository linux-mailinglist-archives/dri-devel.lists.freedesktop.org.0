Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA5C52425
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB9B10E0BB;
	Wed, 12 Nov 2025 12:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hBEJr5Kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616E010E0BB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:31:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9X7Cd1001850
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-type:date:from:message-id:mime-version:subject:to; s=
 qcppdkim1; bh=+4bUAt1CMikXthfl1C/J0gVBT7uywjILz/MvHhBx7HQ=; b=hB
 EJr5KnZr3ATEEO5gCBsqRDmfamPKNwHquahPpMbSz9Ri1LSPlTYIIwwYFI3AuPuR
 sqx87RTnRiQvx8UDFxuubrx1c0K6cze9vDIph4nKnfZdCNdECJAuquMkmfYMANCf
 wb6uS8g9BEcVKfiw9IXqUVdix0kcSINXncet+pxFk88r8SfoD/gSSAVEBUE0cHGN
 CtekHNGaSUXVwugt4XBxjtRsUIcvGZm1FxfAP5CeGbo9vOGdLo+HNvgy55/5behN
 ihCFyQbaW4+bO43JyYYH7qqHSd3zDNA6HNW/2hP9qJrRWxnrRnv0J4/Q4IukhSMn
 4o0W51MTC9C0AAFyYtQA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqq20j73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:31:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5ACCVipc017739
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:31:44 GMT
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 12 Nov 2025 04:31:44 -0800
Received: from nalasex01b.na.qualcomm.com ([fe80::c836:8dbf:dfb4:e65]) by
 nalasex01b.na.qualcomm.com ([fe80::c836:8dbf:dfb4:e65%12]) with mapi id
 15.02.1748.024; Wed, 12 Nov 2025 04:31:43 -0800
From: "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Questions regarding DRM Scheduler Priority Levels
Thread-Topic: Questions regarding DRM Scheduler Priority Levels
Thread-Index: AdxT0CDZnLbeOr87QRCXKXSHgiWdlA==
Date: Wed, 12 Nov 2025 12:31:43 +0000
Message-ID: <4ac498dfbfeb4d4d837646f9e9492f28@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.204.79.16]
Content-Type: multipart/alternative;
 boundary="_000_4ac498dfbfeb4d4d837646f9e9492f28quicinccom_"
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=EbHFgfmC c=1 sm=1 tr=0 ts=69147e31 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=xqWC_Br6kY4A:10 a=NLXER-EnJvcA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VzwAoTRWOTBjjDw7xpMA:9 a=CjuIK1q_8ugA:10
 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=nMwCmy1Owc974DdezdsA:9
 a=o-Srxm9XTVx-1mwb:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-ORIG-GUID: m3u3KcBY3Z898S5V2oj_gui-mVBYmEUr
X-Proofpoint-GUID: m3u3KcBY3Z898S5V2oj_gui-mVBYmEUr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEwMSBTYWx0ZWRfXyGeEiYtjs9Fl
 l/RVmTDVQZFCbEf7wwsZfgigw0gZjuTwaxkI5f3gVZG4eH2GjF+K597ixa3JNvF1E5hf6VyuAD7
 hH+A3ITCMntVwuqmQYH2ukQlbxxd+jBIAdx4+1uLD418WK6jXbxjW17byfXmbQxE+K9pd1zvaNi
 tK8JVlqUMYWgpT4LRlU2SW6bKaNNSsWUcyqiVqr9z2Lh/EpShAsrVaMQ485bUi+8BlJRsE+b8o9
 dTzo8Q7NQUIc9QV9wJBnlNtz6LoXOVnDAQWhwDg4WHkO6cfn/rllAwt6hZ4DbsOrVwe8VOUJGn0
 ialyHrkLTe+CcskjtCwbDmAiaiQ1yJmHWCu3s2wqT4tjxAOwSbpcUfWbd6t7qjhGWZgC5bCrkvq
 xLdrHT3p0UUom48w2PaWyM2UGAm89Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120101
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

--_000_4ac498dfbfeb4d4d837646f9e9492f28quicinccom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We are currently developing a driver using the Accel framework to enable ap=
plications to offload their tasks to the NPU.
As part of this effort, we are considering the use of the DRM scheduler for=
 job management. These applications may have their own priority levels to m=
anage task execution efficiently on the NPU. However, since the DRM schedul=
er currently supports only a limited set of job priority levels (DRM_SCHED_=
PRIORITY_KERNEL, DRM_SCHED_PRIORITY_HIGH, DRM_SCHED_PRIORITY_NORMAL, and DR=
M_SCHED_PRIORITY_LOW), we have a couple of questions:


  *   Are there any plans to increase the number of supported priority leve=
ls?
  *   Is there any flexibility or scope for customizing priority levels whe=
n using the DRM scheduler?

Thanks,
Chenna

--_000_4ac498dfbfeb4d4d837646f9e9492f28quicinccom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:959141479;
	mso-list-type:hybrid;
	mso-list-template-ids:-965727660 67698689 67698691 67698693 67698689 67698=
691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are currently developing a driver using the Accel=
 framework to enable applications to offload their tasks to the NPU.<o:p></=
o:p></p>
<p class=3D"MsoNormal">As part of this effort, we are considering the use o=
f the DRM scheduler for job management. These applications may have their o=
wn priority levels to manage task execution efficiently on the NPU. However=
, since the DRM scheduler currently
 supports only a limited set of job priority levels (DRM_SCHED_PRIORITY_KER=
NEL, DRM_SCHED_PRIORITY_HIGH, DRM_SCHED_PRIORITY_NORMAL, and DRM_SCHED_PRIO=
RITY_LOW), we have a couple of questions:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Are there any plans to increase the number of supported priority leve=
ls?<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;=
mso-list:l0 level1 lfo1">Is there any flexibility or scope for customizing =
priority levels when using the DRM scheduler?<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks, <o:p></o:p></p>
<p class=3D"MsoNormal">Chenna <o:p></o:p></p>
</div>
</body>
</html>

--_000_4ac498dfbfeb4d4d837646f9e9492f28quicinccom_--
