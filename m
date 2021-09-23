Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FDA416514
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 20:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F486E103;
	Thu, 23 Sep 2021 18:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1773 seconds by postgrey-1.36 at gabe;
 Thu, 23 Sep 2021 15:19:07 UTC
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com
 [205.220.165.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295266E0F3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 15:19:07 +0000 (UTC)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
 by mx0a-000eb902.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NBSJqK027575; 
 Thu, 23 Sep 2021 09:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps1;
 bh=17HyfxFRUccVC8rbmJR5g08c/184fWwCexJLp9hxz8o=;
 b=xL3gnO70j8kwa6VVSppImzez6QJyP4oGQ8YV1BTmTqvqpLSptxHGuWTwuEGSCRVHp0ky
 FghLoh9E3/+1Hn6ZnLEG/i1rsYU9cxcmJKAQP3u48fJL9tek/QGSqowQgZUbbHAiXtDJ
 n0JzNLA9WA33YkgbE1JGuXdXrWdqDt96Qsd+s6E7eaV6quLeCQXqRduDsWv0GO+M1Qli
 N+V+NEcayb1ieX7rHAzq3n/eTN+D66x3wUC6Lc64VqGuQwYkiDvS27Hq1r07TNz9AEXd
 V6NMZVUHhxgvg6rLI3XKAZOVp+0Ih2Y85Neu23nzE23K6F5yGS2Hlm2lOhRUQV8bXNkf Ug== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0a-000eb902.pphosted.com with ESMTP id 3b8j1j17hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 09:49:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fqzim+BKQrf9v7Q7mckbs9oR1Pm2ubnLRFsoLQFtaRNFAUktqWZWNa6Vn/esmr1b4+1ydpBHMKNHTIfzR/GPusCKKnja1iIIsQJcnymZ/Bwi3DWlIthwpVjweJXemHu0EZ/0ZdOmrf9mAC7uKQxNHJK8s1yoG7Pnq4olKyS0wZZUnr1TZIGMBpfRjahl2UjxkqXwjlWZDtcQEre8QNyujYyayCvO+0uVi4pVGDjgzWdw/EJ7/OJTRSOipKjhrFCses93wf21Xx0SLmhw12KGP5I0EEUQuWy7S3vN2sHZX5y9nvI8OFt4X0jQ8E1tf4krC4MWTnZ+vfSJGDQ/TUTRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=17HyfxFRUccVC8rbmJR5g08c/184fWwCexJLp9hxz8o=;
 b=Q+Sbcp4RlJcKaOIsc6pVpu1y3OLLBP0aUMICKXlwIsoAUklMvD01Gx19rPAMHWa84Lfp0gnOLK7ccbZlmz4v6wOSS7nFlzTmJ88PJxnJMvZcvUKdNE4iq15LctxAYHeTY9WOX13GLeH2S6uwMH/1CtpcEkALif4TWh2A3kKY2KXDRROvN1Ez5JZWZyjSwsTGSo5mfE7TPyQ53C6F7lGWaXBZhtJa76ecCm1sgwyyUKJ3Rj8fzsBlKWu2Go0l/gRkTopa92CTWFdUCei1QTH06BB39Sf1+lqFn/dMY+eEAZ+bCHZMWRssbxZb0W66QP227Ny4g1k7JKMwktq3FEJINg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=garmin.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17HyfxFRUccVC8rbmJR5g08c/184fWwCexJLp9hxz8o=;
 b=GBkRAHTdCmuD6iCEbtNapzi28CJAUFpGEv6PmW55lRBLRuh27xH3t7Oy7nujyzRRvwBGN8urJO7o785du+6j6N4tXgIovYCLEJWnC4lWszskU+3cMqbWeS4e7H5ItqLeKICNfSB0/Sj7GoWuFB7fsUrR6/fnTBF8TRi4OETeGg7SVzGkrg7K3ePr3y9eUOAND6tziPoL4m20ttVx08sGHiuseWMhZ/wgC0syY/mlBGAW6fMViuauSUu/DdD75DZvhGpaBoTdpv3fzMBLXq6vVa0jPeE18taDg/YzoXFga24A6XYzcXye6JFOUzG8rn1GR2jE6pTaKZXCEKhbluEB6w==
Received: from BN8PR16CA0030.namprd16.prod.outlook.com (2603:10b6:408:4c::43)
 by SN6PR04MB5037.namprd04.prod.outlook.com (2603:10b6:805:92::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 14:49:22 +0000
Received: from BN7NAM10FT059.eop-nam10.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::a4) by BN8PR16CA0030.outlook.office365.com
 (2603:10b6:408:4c::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 14:49:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=olawpa-edge5.garmin.com;
Received: from olawpa-edge5.garmin.com (204.77.163.244) by
 BN7NAM10FT059.mail.protection.outlook.com (10.13.157.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 14:49:21 +0000
Received: from OLAWPA-EXMB6.ad.garmin.com (10.5.144.22) by
 olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Thu, 23 Sep 2021 09:49:19 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB6.ad.garmin.com (10.5.144.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 23 Sep 2021 09:49:20 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2308.014; Thu, 23 Sep 2021 09:49:20 -0500
From: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
CC: Simon Ser <contact@emersion.fr>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: Multiple DRI card detection in compositor systemd units
Thread-Topic: Multiple DRI card detection in compositor systemd units
Thread-Index: AQHXr8WIDvY7bwnIlUuREATw+jQZP6uwgZUA//+5W4CAAborAP//v7qA
Date: Thu, 23 Sep 2021 14:49:20 +0000
Message-ID: <8AA7BAAC-9160-4499-BB32-E230E83CB23D@garmin.com>
References: <19277F1C-6CF5-4C19-9492-4A03F951764B@garmin.com>
 <xiT2GOL-X7GZiZUihjkIOFEbbS3vuVQrvogRKQjVdONfi07OwXydRhIUWU_elgmh0Ug9mAUONLEDC-bQe69fsOcd7Iq31R8T_Ai5KGhOnzE=@emersion.fr>
 <8983CFBC-2D55-4AA8-ACFD-10EE410FFAEA@garmin.com>
 <20210923163922.1537fb36@eldfell>
In-Reply-To: <20210923163922.1537fb36@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.52.21080801
msip_labels: MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=true;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2021-09-23T14:47:28Z;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=0;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ActionId=5cf69030-8a6b-4ede-b3a0-538928476aa3;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=true;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=Confidential;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard; 
x-originating-ip: [10.5.209.13]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B86A37207F0D444CADA0BC9E54DB9AD0@garmin.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 597dcbd3-096f-4e69-c5a1-08d97ea1544b
X-MS-TrafficTypeDiagnostic: SN6PR04MB5037:
X-Microsoft-Antispam-PRVS: <SN6PR04MB5037FD6EEB69718C8FE400D6ECA39@SN6PR04MB5037.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tKYQ4NOOgBIEz+NSJHmbE3cOP2UjJHCqNQfnEv1FkMRmoiJx/QDJIn7nQ5ev+aF80pgabpbmO9hDX4I4wtdzJfFUzlPzrvME/kKWDAjuXtXjR+TvN/qJavzG1oDPjdqMGIMJgrCbg6776HfLVFfKtcYXrIhxf1vjYqmz2OGEiniCz6U6nyrEo0vyDi/u7B7UHMFHuSXuCULHU0W/jsYRQ9NFPHhKUvhQp84lzDTSgD+ZoEGRndhb4p+NdifUHw+rCgU8sbVii8vKSk7BcTqGYtJ6Zyo+kFatNU9ztaNQd7rI9FxQ4mt+OvqYIBnDMjelf08pljcYfK74v3NdqEflp9k8oaDTsxBBGNoungwRn+ZnULSGr6g5zsBphFHOTLP2KgsbXGeR+K2+YdQU8dZG6oEq4db5+M6qX77fH9D5OyAGMz++L3qugE1p34FneYx28b0sbmQA4vjGOtV4BldsA7J3x23TWj/jnu/mIht4U2dI30z8idOz9JpQ+GREkgdo1Lzdx4KwnbILCw8Jwd48DfFGlvsxLxE2EhbLbW0aYpuOOuC85AYJv7zqMethhwM3chMS/J23JgG8pNDFkgwQsNj8ZpwbAsBQ+I44enIdcO/qVeSL1PTdiqDKEq/YQRi4ivi9nnQPq3mNpXgtVeco/+eeakinAfCbzz8Ooe+TirE+p1XMRHO4wbWKA9Qc99LefnPmealfDS0YsnP//PRx0A==
X-Forefront-Antispam-Report: CIP:204.77.163.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:olawpa-edge5.garmin.com; PTR:extedge.garmin.com; CAT:NONE;
 SFS:(36840700001)(46966006)(54906003)(6916009)(426003)(33656002)(36860700001)(336012)(26005)(70586007)(2616005)(82310400003)(70206006)(316002)(83380400001)(508600001)(86362001)(5660300002)(7696005)(47076005)(186003)(8936002)(36756003)(4326008)(8676002)(7636003)(356005)(2906002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:49:21.7622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 597dcbd3-096f-4e69-c5a1-08d97ea1544b
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d; Ip=[204.77.163.244];
 Helo=[olawpa-edge5.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT059.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5037
X-Proofpoint-GUID: H4hWu5TQ-hfuE20UTPNdLSpmJ7nDq6X6
X-Proofpoint-ORIG-GUID: H4hWu5TQ-hfuE20UTPNdLSpmJ7nDq6X6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_04,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109200000
 definitions=main-2109230093
X-Mailman-Approved-At: Thu, 23 Sep 2021 18:15:28 +0000
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

SGkgUGVra2EsDQoNClRob3NlIGFyZSBmYWlyIGFuc3dlcnMuIEluIG15IGNhc2UsIGl0IGRvZXMg
aGFwcGVuIHRoYXQgdGhlIGNvbmZpZ3VyYXRpb24gYXZhaWxhYmxlIG9uIHRoZSB2aXJ0dWFsIGNh
cmRzIGluY2x1ZGVzIGEgd2F5IHRvIHNldCBkaXN0aW5jdCBuYW1lcyByZXBvcnRlZCBieSBkcm1H
ZXRWZXJzaW9uKCktPm5hbWUuDQoNCkl0IGxvb2tzIGxpa2UgdGhlIGNvbnNlbnN1cyBpcyB0aGF0
IFVEZXYgcnVsZXMgcHJvYmFibHkgc2hvdWxkbid0IGJlIGNvbnN1bHRpbmcgdGhlIG5hbWUgYXMg
YSBkaXN0aW5ndWlzaGluZy9kdXJhYmxlIGlkZW50aWZpZXIgb2YgY2FyZHMsIGFuZCB0aGF0IHRo
ZSBwaHlzaWNhbCBwYXRoIGlzIHRoZSBzdGFuZGFyZCB0aGluZyB1c2VkIHRvIGRpc2FtYmlndWF0
ZS4gVGhhbmtzLg0KDQotTWF0dA0KDQrvu79PbiA5LzIzLzIxLCA4OjM5IEFNLCAiUGVra2EgUGFh
bGFuZW4iIDxwcGFhbGFuZW5AZ21haWwuY29tPiB3cm90ZToNCg0KICAgIE9uIFdlZCwgMjIgU2Vw
IDIwMjEgMTY6MTY6NDggKzAwMDANCiAgICAiSG9vc2llciwgTWF0dCIgPE1hdHQuSG9vc2llckBn
YXJtaW4uY29tPiB3cm90ZToNCg0KICAgID4NCiAgICA+IFRoZSAvZGV2L2RyaS9ieS1wYXRoIGlk
ZWEgd29ya3MsIEkgc3VwcG9zZSwgaWYgeW91IGhhdmUgZGlmZmVyZW50DQogICAgPiBwaHlzaWNh
bCBncmFwaGljcyBjYXJkcy4gSW4gbXkgY2FzZSwgdGhhdCdzIG5vdCB0cnVlLiBUaGVzZSBhcmUN
CiAgICA+IHZpcnR1YWxpemVkIGNhcmRzIHRoYXQgdGhlIHNpbGljb24gdmVuZG9yJ3MgRFJNIGRy
aXZlcnMgdXNlIHRvIGV4cG9zZQ0KICAgID4gZGlmZmVyZW50IHN1YnNldHMgb2YgRFJNIHJlc291
cmNlcyBhcyBkaWZmZXJlbnQgY2FyZHMuIFNvIHRoZXJlJ3MNCiAgICA+IG9ubHkgb25lIC9kZXYv
ZHJpL2J5LXBhdGggY2FyZCBoZXJlLiBUaGluazogRFJNIGxlYXNlcywgYnV0IHdpdGggdGhlDQog
ICAgPiBsZXNzZWVzIHBvcHBpbmcgb3V0IGFzIGNhcmQgbm9kZXMgcmF0aGVyIHRoYW4gYXJyYW5n
ZWQgZHluYW1pY2FsbHkNCiAgICA+IHVzaW5nIHRoZSBkcm0gaW9jdGwoKSdzIHRvIG1hbnVmYXR1
cmUgbGVhc2VzLg0KDQogICAgVGhhdCdzIHRoZSBzdGFuZGFyZCBzb2x1dGlvbiB0aG91Z2gsIEkg
YmVsaWV2ZTogdXNlIGRldnBhdGggZm9yDQogICAgbWF0Y2hpbmcgdGhlIGRldmljZSwgYmVjYXVz
ZSB0aGUgZGV2aWNlIGRvZXNuJ3QgcmFuZG9tbHkganVtcCBmcm9tIGENCiAgICBwaHlzaWNhbCBj
b25uZWN0b3IgKGUuZy4gUENJZSBzbG90KSB0byBhbm90aGVyLg0KDQogICAgQnV0IHNpbmNlIHlv
dSBoYXZlIHZpcnR1YWwgY2FyZHMsIHRoYXQgb2J2aW91c2x5IGRvZXNuJ3Qgd29yay4gSSdtDQog
ICAgYWZyYWlkIHlvdSBuZWVkIHRvIHNvbHZlIHRoaXMgd2l0aCB5b3VyIHZpcnR1YWwgY2FyZCBw
cm92aWRlci4gTWF5YmUNCiAgICB0aGVyZSBjb3VsZCBiZSBzb21lIHNvcnQgb2YgdmlydHVhbCBi
dXMgd2l0aCBwZXJzaXN0ZW50IGFkZHJlc3NlcyB3aGljaA0KICAgIHdvdWxkIG1ha2UgZGV2cGF0
aCByZWxpYWJsZT8NCg0KICAgIEkgd291bGRuJ3QgZXhwZWN0IGRybUdldFZlcnNpb24oKS0+bmFt
ZSB0byBkaWZmZXIgYmV0d2VlbiB0aGUgKHZpcnR1YWwpDQogICAgZGV2aWNlcyBzaW5jZSB0aGV5
IGFyZSBhbGwgdXNpbmcgdGhlIHNhbWUgZHJpdmVyLCByaWdodD8NCg0KDQogICAgU29ycnksDQog
ICAgcHENCg0KDQogICAgPiBUaGUgdXNlLWNhc2UgaGVyZSBpcyB0byBhbGxvdyBzZXBhcmF0ZSBE
Uk0gZG9tYWlucyBmb3IgZWFjaCBvZg0KICAgID4gc2V2ZXJhbCBjb250YWluZXJzLiBJdCdzIG5v
dCByZWFsbHkgZGVzaXJhYmxlIHRvIHRyeSB0byBmdW5uZWwNCiAgICA+IGV2ZXJ5Ym9keSdzIGdy
YXBoaWNzIHRocm91Z2ggYSBjb21tb24gY29tcG9zaXRvciB0aGF0IHJ1bnMgYWxsIHRoZQ0KICAg
ID4gY29ubmVjdG9ycy4NCiAgICA+DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCg0KQ09ORklERU5USUFMSVRZIE5PVElDRTogVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1l
bnRzIGFyZSBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgYW5k
IGNvbnRhaW4gaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgR2FybWluIGNvbmZpZGVudGlhbCBhbmQv
b3IgR2FybWluIGxlZ2FsbHkgcHJpdmlsZWdlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBl
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGVtYWlsIGFu
ZCBkZWxldGUgdGhlIG1lc3NhZ2UuIEFueSBkaXNjbG9zdXJlLCBjb3B5aW5nLCBkaXN0cmlidXRp
b24gb3IgdXNlIG9mIHRoaXMgY29tbXVuaWNhdGlvbiAoaW5jbHVkaW5nIGF0dGFjaG1lbnRzKSBi
eSBzb21lb25lIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudCBpcyBwcm9oaWJpdGVk
LiBUaGFuayB5b3UuDQo=
