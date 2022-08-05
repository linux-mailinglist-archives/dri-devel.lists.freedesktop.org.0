Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A3558AB2E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 14:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECABE8DC57;
	Fri,  5 Aug 2022 12:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1594 seconds by postgrey-1.36 at gabe;
 Fri, 05 Aug 2022 12:58:42 UTC
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com
 [205.220.165.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4AD2B2F3;
 Fri,  5 Aug 2022 12:58:42 +0000 (UTC)
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
 by mx0a-000eb902.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2756lQbq016105;
 Fri, 5 Aug 2022 07:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps1;
 bh=V/SuZ7Xzjmc3gnZL1funI6Da8HSnlB23thdzTznoxh8=;
 b=zFBSFcxuFMCLeJppeexS+avxyY85nOADJgoIRNNMDyM7kIG+gq7OXLiUkFL7gP8tzw2h
 vu3Hi6r5IlIViEFZ1zzeGFsKj59pKJPnGAgdwpxbX2eImldO0BD2xCnn2xaXk9/bokuA
 xYPmZO0UwfWD82eKNZh4X68MjZwAfIvcAbWstKc8PtwV5/xPG2sGZzWVokWTIqhN9TDv
 YyCIDH6AW/+eMAbEEN7KR5BKbp4AlNvtcM2FunHYsux3a7Zm+Q3SVH4N7bVB/M2Ei/0d
 vBVrGtn8GEiCB7VrXYlsxvh7B0WIue406zimZTu8lP085HSCeweiarwWQlkkuZczHqfA VQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3hrtc88uv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 07:32:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2206JUGexnlF9XtsEyCdCOGCZNXZ1niTc1+HWLQJo2PkWXw/5DTYuCOZ/zY4kyaMRKE0bXnf2aWZJ2C+oU+p6myPJSGTWq3Xz6TOHa/PBYC8GztjX61nulP0SaUyMu3eDAI0/2z+wTrcgn6/1O6j/wgQgNzA0rvypRJXTxlFgbwi8kib3K3cPW/MyY6SImyu5Lt22j5g2d0Z/fIrTBnWQc8H2HdkHimfil8JyBPVcYs7m5JGcyFUjQas7nU9vRKnwqsdkE7jgJFEQq3aDWF3otOE+HL0XHkOit8BiMNbKpk1JEOEqrPTL6+PxXMjRZ8iiP5xHHyn3VWtXFyaL0IEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/SuZ7Xzjmc3gnZL1funI6Da8HSnlB23thdzTznoxh8=;
 b=EXB5mFdRUHJLtSdZo6H8D8h7G/ELG9IzMuX512WlTFsS2M4pqC/H7WOfvV25C8xWA8QRmoRE9evRw0n+IFTXkDKBN1Qo9mLD9gmVJFGL2f07feldWZxm6WrYEuqrUlQS4yRQuXIDKNxjeez31hDmt7eVreFop/cRRoxz9jidXB/9Vqm1JCTbE0YjnQQaFMCKlAh1FiEQLWPu+wXIwneV5156zDbuhBMSI7yGNm3GySYclpwBZJaB76EzV42zbSgBqdtX9LOJDBwImQ/xciScRth08pSvanMdIQJ/NEPA50KMeTvtDBNMO9yvmzBpg/+gs4nwQ95eZ3z5txKfetJVWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/SuZ7Xzjmc3gnZL1funI6Da8HSnlB23thdzTznoxh8=;
 b=rqlems9wf//ElJVRsPlVvWe+wtKxtTG3WoKfcy3A7X1vFP6dPKrYPs8jPtrhazdak6hx08IZ1oCeuMAQYQ2YoBQj8lhwTAeOrCIPQJA2ZeGhYGCAA8Ebx6fGArJ9aMxR35dKYI+uRDCoR1mRO7qAYt+9GaJjI7twNmr4oYweZLtfTLm75r2CF8YEzajScFpysHQMEzejn0Co+xw77UmbY32nGbKUKPTfHtgpKV0FnbUT3ztTqscp2OWEoztQzuqegYOvdQEXBUorujZC9geCWxwEc5a+kBfI0RgY1IToNH7pTY1pFbZVggIzh1N2VC5XedR/FGLAog9qmDYwHHSHlw==
Received: from BN9PR03CA0669.namprd03.prod.outlook.com (2603:10b6:408:10e::14)
 by DM6PR04MB4507.namprd04.prod.outlook.com (2603:10b6:5:2e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Fri, 5 Aug
 2022 12:32:03 +0000
Received: from BN7NAM10FT068.eop-nam10.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::34) by BN9PR03CA0669.outlook.office365.com
 (2603:10b6:408:10e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Fri, 5 Aug 2022 12:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BN7NAM10FT068.mail.protection.outlook.com (10.13.156.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14 via Frontend Transport; Fri, 5 Aug 2022 12:32:02 +0000
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
 olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Fri, 5 Aug 2022 07:31:59 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.28; Fri, 5 Aug 2022 07:32:02 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2375.028; Fri, 5 Aug 2022 07:32:02 -0500
From: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
To: "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: How to test whether a buffer is in linear format
Thread-Topic: How to test whether a buffer is in linear format
Thread-Index: Adiox0fTIlpnOYJLQwGkp50B7EPq4A==
Date: Fri, 5 Aug 2022 12:32:01 +0000
Message-ID: <491b09b4dd40404c8559513713bdb17a@garmin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ActionId=94ce99d9-823f-4cfb-8a82-6fdde5f3f2d2;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=0;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=true;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=f3ff6d80-3782-4df6-bf6c-659f84558040;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2022-08-05T12:26:52Z;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
x-originating-ip: [10.5.209.13]
Content-Type: multipart/alternative;
 boundary="_000_491b09b4dd40404c8559513713bdb17agarmincom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c33d446-78ec-4965-eade-08da76de8011
X-MS-TrafficTypeDiagnostic: DM6PR04MB4507:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6sP3E3G4IgKKd+l8vjm19C2E7TN8KWiCRLlmL07QShxDoH7xLl0R/vo7XGrhz1ehZMD1KvAfvmjp45Y++Syh8zk15gxdRgS14KLC3Ii0/fGw3zd0K2K9BIltkSocrqj1jV5dlLh9dfNfLbSEpGq+HDsjfingWV2zba1J/YKa77GkqwSzPxn3hiIvXoh0K4kR8WFDQFKWykTtikDZ9N8dcrAzixac27R4xgszbvwOAebLwC9BaUMAztxN/yG6ltURh051W/wR5BlEBD7t2MZVBWw3KEQ6mTZBomN4oQoJ16WnGzpoAg6tpC3fDNWbfK0JmKBZJXm3pCDNXcPzJW4MLzZ2c2/YWQTx77T8Nx4Vd/Q9vKCx48j0PnxKuHEbauekEX0Gx2Dq0lFxMYQC3RfE7aNP6oQAH/+tl52ooaqJqjkEa2C1eGlL8bic5Yq3j/duST+6TG2eQwLjLV1ktta3saTD+H/rufY/rDsDVVi4iQmPJ3qr9YKE+eCnZQBH9kA/4PFFhgAC+pAX27rewyic8/IyLLjonKZmlPWHSpZTEw3fRMM8RZ0bnr3sD6eElgXLv4oY9rFz7gDNZWzxwj/vRWcoHKvV3O0TX7Ofjyq3iZgpYcI6G4jGmlvM2lmUs3sstBgPlBvzqk+pXHnZS/MDKX7OcQ4Hue9rTgnfhdpym3pyARSmaOCpO0+AiQPQiI2RUJD4FCc3iUlNEuHMkXTIxG1fofUapPB+kPhoEc/r1gddW7eQusSlK1J9p0M1Fx4BCskG8Jrg583YYOMf8CBxtMGuWkSLPFSvZXNNEDbTsjMlWBdPYKni49rRmeXQhIY8jCyjyK7nc2rX+MuOhkTU4g==
X-Forefront-Antispam-Report: CIP:204.77.163.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:edgetransport.garmin.com; PTR:extedge.garmin.com;
 CAT:NONE;
 SFS:(13230016)(396003)(376002)(346002)(136003)(39860400002)(46966006)(40470700004)(36840700001)(2616005)(41300700001)(186003)(8936002)(5660300002)(40460700003)(86362001)(26005)(8676002)(450100002)(70206006)(24736004)(478600001)(7696005)(108616005)(2906002)(70586007)(82310400005)(7636003)(40480700001)(34020700004)(36860700001)(83380400001)(36756003)(110136005)(336012)(426003)(47076005)(316002)(82740400003)(356005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 12:32:02.8884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c33d446-78ec-4965-eade-08da76de8011
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d; Ip=[204.77.163.244];
 Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT068.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4507
X-Proofpoint-GUID: WqintwC68Wl2D2aewUtg9NiFXn0TG6Zn
X-Proofpoint-ORIG-GUID: WqintwC68Wl2D2aewUtg9NiFXn0TG6Zn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_05,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxlogscore=823
 impostorscore=0 clxscore=1011 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208050063
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

--_000_491b09b4dd40404c8559513713bdb17agarmincom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Suppose that I want to map a GPU buffer to the CPU and do image analysis on=
 it. I know all the usual cautions about this being a poor performance opti=
on, etc. But suppose for the moment that the use-case requires it.

What's the right set of preconditions to conclude that the buffer is in van=
illa linear representation? In other words: no compression, tiling, or any =
other proprietary GPU tricks that would prevent accessing the pixel data in=
 the same way you would for a dumb buffer.

I think that requiring the modifiers to be 0x0 would suffice. But is that o=
verkill? Maybe there are situations when some modifiers are set, but they d=
on't affect the interpretation of the pixel data.

Thanks
-Matt

--_000_491b09b4dd40404c8559513713bdb17agarmincom_
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
<p class=3D"MsoNormal">Suppose that I want to map a GPU buffer to the CPU a=
nd do image analysis on it. I know all the usual cautions about this being =
a poor performance option, etc. But suppose for the moment that the use-cas=
e requires it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What&#8217;s the right set of preconditions to concl=
ude that the buffer is in vanilla linear representation? In other words: no=
 compression, tiling, or any other proprietary GPU tricks that would preven=
t accessing the pixel data in the same way
 you would for a dumb buffer.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I think that requiring the modifiers to be 0x0 would=
 suffice. But is that overkill? Maybe there are situations when some modifi=
ers are set, but they don&#8217;t affect the interpretation of the pixel da=
ta.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">-Matt<o:p></o:p></p>
</div>
</body>
</html>

--_000_491b09b4dd40404c8559513713bdb17agarmincom_--
