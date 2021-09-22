Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AFA4158DB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 09:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63F26ECEE;
	Thu, 23 Sep 2021 07:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com
 [205.220.177.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071186EC37;
 Wed, 22 Sep 2021 16:17:02 +0000 (UTC)
Received: from pps.filterd (m0220298.ppops.net [127.0.0.1])
 by mx0a-000eb902.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18M1oBgl001431; 
 Wed, 22 Sep 2021 11:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps1;
 bh=wYmMCITmhzTwNvD7jgpPG68OACvRA/V8H4otj0VdCVg=;
 b=DRepVtQhofZzXo5PxrT8SRLAUALzs0aIPGkwtOGNER1N5OHq6kPE6AvYMnS+zGVNVrni
 8JiXZRtCepsvtLlhgWixFLnHYGS+o1/rR1QSG94hKqQZt8+qH0WPPqNgRXhjsUozckcv
 JRqyEoy76CrrwHwBYujey2OY1gDAcxjsz2wHtMpd7b+tuz7yBTFxtgWD1MWNPmMsiNrr
 hbm7SQnaGViWNr+YC/1L1zczpOwxgNuhhCGd/9IBN/YTGgkm8lYf0UV1SDaPv+xSovJk
 ILBeUVesVBQZdKiAyKxAbg29cJBXOjTkLHsX34oHmcDGPVlHzAfe6IsKIdkO158FI9Eo lw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by mx0a-000eb902.pphosted.com with ESMTP id 3b7q3y1vwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 11:16:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLWtcEdBK+K6jgJtgY7LvRHcpIEvhCYIW2TIVrNRmeo6pDpucX5XIAuEJtJLnAezNPaiiQCFCtjhyKKrSxV1jiwZbyI26ThQlP4ucWEsAEcnzNVEjpm3bujItpUdfSlIpCCv9/gF1dhfk73P7cYSoHSBH2SiJV/zRXCz7dXcKOkNFRqit3TpywNanl+gBOp8qEO/V/zhph4E7ERR7hAMwElMYvIKvYrs7wtBmg4nwxOtPyXvu471iRKbQ0taRtuvha+cL5qa+Bo0RFvZdSyxUUk1O9tm3KBVbdvwfHlRCKHfhd0zShOxfBCY6VrelIDiya25EMEp0Uqpus9ItoUYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=wYmMCITmhzTwNvD7jgpPG68OACvRA/V8H4otj0VdCVg=;
 b=cx3aDCcFmEHs8zhOtjd7weCo8Jg1o5lXNeBR58RDY3Aeb5Lll+GDlSeKPv0x/Qk6GMjtYjdHnESDKK41w86fdnlhAASVeZYVE9+nAP8YJhCCXDq4i2rU0qzyPuuNRRBDgiE/E0n66kBtkg6THtF/V6PCfVet6+iUciHc35XCKVsHABoPg0bvBz7COyFExoP/VuaXP00yKV4GYyAKiMbM8PdR0uYpawlT/Gj7Zj6gT0AyuvwUlveIGbfeVpOF6ITvxjh0qELQjuiFkYQAcTE+5O1fEJ2TyXuHJkDf1Ch7MtnFTM0o9Y3amGuiZfjYJ1KydwhIIbNITO21BLdI3IKXzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=emersion.fr smtp.mailfrom=garmin.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYmMCITmhzTwNvD7jgpPG68OACvRA/V8H4otj0VdCVg=;
 b=1GW1otkZERuhJCz1bzPtNuhOmFtw+v0r4DJ40xthi81RQQ3x02lkFi4+HayOhkJU7WVeIEVn6A2uBeq9b2vB0kF6NIZrP6XsLXyCA32xqpAWwQ255WgCfEmZjQevZXxBgh4rIZjiPGpVmPJQAqge/0SB/Jzx9Llg23PNNqO70alpxFBoktlgodXZWZ9J49zT8V91dPxKM3Bm1hK3/LHpID0hrLqHeAv9Xl50LFLLMily1JGyqzqYd3iC5R/QwAc8ICcyQQVF2b0dfwnz8Je35LCs4LEQ/TZmVdTnc5dhh+IqbWrsCiRbhPJPVfr+zDQ1xsFureQX3Y5W/eYv3/R+QQ==
Received: from DM3PR12CA0083.namprd12.prod.outlook.com (2603:10b6:0:57::27) by
 BYAPR04MB4407.namprd04.prod.outlook.com (2603:10b6:a02:fa::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16; Wed, 22 Sep 2021 16:16:50 +0000
Received: from DM6NAM10FT065.eop-nam10.prod.protection.outlook.com
 (2603:10b6:0:57:cafe::ff) by DM3PR12CA0083.outlook.office365.com
 (2603:10b6:0:57::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 16:16:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=olawpa-edge1.garmin.com;
Received: from olawpa-edge1.garmin.com (204.77.163.244) by
 DM6NAM10FT065.mail.protection.outlook.com (10.13.152.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 16:16:49 +0000
Received: from OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) by
 olawpa-edge1.garmin.com (10.60.4.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Wed, 22 Sep 2021 11:15:07 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 22 Sep 2021 11:16:48 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2308.014; Wed, 22 Sep 2021 11:16:48 -0500
From: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
To: Simon Ser <contact@emersion.fr>
CC: "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: Multiple DRI card detection in compositor systemd units
Thread-Topic: Multiple DRI card detection in compositor systemd units
Thread-Index: AQHXr8WIDvY7bwnIlUuREATw+jQZP6uwgZUA//+5W4A=
Date: Wed, 22 Sep 2021 16:16:48 +0000
Message-ID: <8983CFBC-2D55-4AA8-ACFD-10EE410FFAEA@garmin.com>
References: <19277F1C-6CF5-4C19-9492-4A03F951764B@garmin.com>
 <xiT2GOL-X7GZiZUihjkIOFEbbS3vuVQrvogRKQjVdONfi07OwXydRhIUWU_elgmh0Ug9mAUONLEDC-bQe69fsOcd7Iq31R8T_Ai5KGhOnzE=@emersion.fr>
In-Reply-To: <xiT2GOL-X7GZiZUihjkIOFEbbS3vuVQrvogRKQjVdONfi07OwXydRhIUWU_elgmh0Ug9mAUONLEDC-bQe69fsOcd7Iq31R8T_Ai5KGhOnzE=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.52.21080801
msip_labels: MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=true;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2021-09-22T16:10:35Z;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=0;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ActionId=8569d543-2cec-4261-b04d-4a543404e90e;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=true;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=Confidential;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard; 
x-originating-ip: [10.5.209.13]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EDE11CA779352459FCB7A687311F57D@garmin.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdcfcd14-9c03-4566-83aa-08d97de4620f
X-MS-TrafficTypeDiagnostic: BYAPR04MB4407:
X-Microsoft-Antispam-PRVS: <BYAPR04MB44075520268EC251BE69A25DECA29@BYAPR04MB4407.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lwCSgk5hgviQcZj2NWunhJjTHASj8m2QYjjr6NwRZkCXei3sligMO5y5CDraFrlUflEbWJbB3p9pFsd4/yUk/gltek/phBWQMgrqOQN+Z8ecVqScx60a+Sx6e29bKbl7cxW6GtaljXTw8peUOoNDEiz0RYqsBJ8SKHBAEckxD9wJZQCqcQN47r+jhgb3S12LbZaUlsBBfgtTZ3KxTrjz8Zsje9uUxTo47Jkgb/MlwKbaQMrFMTsvMD52cZ+ZReq1xR/XeJgizbEMjOJ4jmWupmUVh6z+VX4dnq/cXjSDI4auNoh09GaqSUMUKz7EfLUd4gdB5l5XTEeNGUHRJIp685LcpbMkYFDFyLC6oc0VcQqrqb8d6QcqE5VI4lrEuyIZoZdPhKn6n4aE7wUMEhPJYDBk4J/PMDOfK9aX+sq3Ut7vVUivV9OYdLvJfTkytVMjXPDkaT6huFhZQaGQmBbh+yrPSEYa0NJcGiNBjDPy5Z6C+WlHcqLavJ+hHDM94rv4r87c5uqVgVdFMCMr5jl/MZC0LK27ISVtMxDV57lOccLYx/MI5PuDruaTQJVs7cAmhLwIG7j9PVvWwLeg5TGkKe5m40sp9P4WZgBypZVukxZe/S0ZYU8kLCEIcrae4vZdhUKlsvlHoXW5zt9gj1oWsTDexOQ9a5DOPWSy5netV8akYEsTvSQYglUI1zt/eXL6N8zLkFaZXGxQ2siDG2Fx1w==
X-Forefront-Antispam-Report: CIP:204.77.163.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:olawpa-edge1.garmin.com; PTR:extedge.garmin.com; CAT:NONE;
 SFS:(46966006)(36840700001)(8676002)(356005)(82310400003)(36860700001)(54906003)(5660300002)(186003)(86362001)(2906002)(47076005)(6916009)(33656002)(8936002)(316002)(7696005)(336012)(7636003)(26005)(4326008)(70586007)(2616005)(508600001)(36756003)(83380400001)(426003)(70206006);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 16:16:49.9775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcfcd14-9c03-4566-83aa-08d97de4620f
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d; Ip=[204.77.163.244];
 Helo=[olawpa-edge1.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT065.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4407
X-Proofpoint-ORIG-GUID: ttxcZxeM0r1KAY7IMBzTQmV8sYAcdaCF
X-Proofpoint-GUID: ttxcZxeM0r1KAY7IMBzTQmV8sYAcdaCF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_06,2021-09-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220111
X-Mailman-Approved-At: Thu, 23 Sep 2021 07:08:58 +0000
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

SSBnZXQgdGhlIGludHVpdGlvbiBiZWhpbmQgdGhlIHN1Z2dlc3Rpb24gdG8gYWdncmVnYXRlIHVz
aW5nIGxvZ2luZCBzZWF0cywgYXMgZmFyIGFzIGl0IGdvZXMuIEJ1dCBpdCBzdGlsbCBzZWVtcyB0
byBtZSB0aGF0IHRoaXMganVzdCBwdXNoZXMgdGhlIHF1ZXN0aW9uIGJhY2s6IGhvdyBkbyB5b3Ug
aWRlbnRpZnkgd2hpY2ggY2FyZCBpcyB3aGljaCBpbiBvcmRlciB0byBhc3NpZ24gaXQgdG8gYSBz
ZWF0PyBOb3JtYWxseSB0aGlzIGlzIGRvbmUgdXNpbmcgdWRldiBydWxlcywgcmlnaHQ/IEFkZGl0
aW9uYWxseSwgSSdtIHdvcmtpbmcgd2l0aCBzb21lIGNvbnN0cmFpbnRzIHRoYXQgbm90IGFsbCBv
ZiB0aGUgY29tcG9zaXRvcnMgYXJlIGxvZ2luZC1hd2FyZS4gSSByZWFsaXplIHRoYXQncyBub3Qg
cmVhbGx5IHlvdXIgcHJvYmxlbSwgYW5kIGl0IGRvZXNuJ3QgcmVhbGx5IGluZmx1ZW5jZSB0aGUg
bWVyaXRzIG9mIHlvdXIgc3VnZ2VzdGlvbi4NCg0KVGhlIC9kZXYvZHJpL2J5LXBhdGggaWRlYSB3
b3JrcywgSSBzdXBwb3NlLCBpZiB5b3UgaGF2ZSBkaWZmZXJlbnQgcGh5c2ljYWwgZ3JhcGhpY3Mg
Y2FyZHMuIEluIG15IGNhc2UsIHRoYXQncyBub3QgdHJ1ZS4gVGhlc2UgYXJlIHZpcnR1YWxpemVk
IGNhcmRzIHRoYXQgdGhlIHNpbGljb24gdmVuZG9yJ3MgRFJNIGRyaXZlcnMgdXNlIHRvIGV4cG9z
ZSBkaWZmZXJlbnQgc3Vic2V0cyBvZiBEUk0gcmVzb3VyY2VzIGFzIGRpZmZlcmVudCBjYXJkcy4g
U28gdGhlcmUncyBvbmx5IG9uZSAvZGV2L2RyaS9ieS1wYXRoIGNhcmQgaGVyZS4gVGhpbms6IERS
TSBsZWFzZXMsIGJ1dCB3aXRoIHRoZSBsZXNzZWVzIHBvcHBpbmcgb3V0IGFzIGNhcmQgbm9kZXMg
cmF0aGVyIHRoYW4gYXJyYW5nZWQgZHluYW1pY2FsbHkgdXNpbmcgdGhlIGRybSBpb2N0bCgpJ3Mg
dG8gbWFudWZhdHVyZSBsZWFzZXMuDQoNClRoZSB1c2UtY2FzZSBoZXJlIGlzIHRvIGFsbG93IHNl
cGFyYXRlIERSTSBkb21haW5zIGZvciBlYWNoIG9mIHNldmVyYWwgY29udGFpbmVycy4gSXQncyBu
b3QgcmVhbGx5IGRlc2lyYWJsZSB0byB0cnkgdG8gZnVubmVsIGV2ZXJ5Ym9keSdzIGdyYXBoaWNz
IHRocm91Z2ggYSBjb21tb24gY29tcG9zaXRvciB0aGF0IHJ1bnMgYWxsIHRoZSBjb25uZWN0b3Jz
Lg0KDQpUaGFua3MgZm9yIHRoZSB0aG91Z2h0cy4NCg0KLU1hdHQNCg0K77u/T24gOS8yMi8yMSwg
MTA6MjkgQU0sICJTaW1vbiBTZXIiIDxjb250YWN0QGVtZXJzaW9uLmZyPiB3cm90ZToNCg0KICAg
IENBVVRJT04gLSBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGFueSBsaW5rcyBvciBvcGVu
IGFueSBhdHRhY2htZW50cyB1bmxlc3MgeW91IHRydXN0IHRoZSBzZW5kZXIgYW5kIGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZS4NCg0KDQogICAgTWF5YmUgdHJ5IGNyZWF0aW5nIG11bHRpcGxlIHBo
eXNpY2FsIHNlYXRzIHdpdGggbG9naW5kLCBhbmQgc3RhcnQgZWFjaA0KICAgIGNvbXBvc2l0b3Ig
b24gaXRzIG93biBzZWF0PyBBIHBoeXNpY2FsIHNlYXQgaXMgYSBjb2xsZWN0aW9uIG9mIGRldmlj
ZXMgbGlrZQ0KICAgIERSTSBub2RlcyBhbmQgZXZkZXYgZGV2aWNlIGZpbGVzLg0KDQogICAgQWxz
byB1ZGV2IGNyZWF0ZXMgZmlsZXMgaW4gL2Rldi9kcmkvYnktcGF0aC8sIHRoZXNlIHNob3VsZCBi
ZSBzdGFibGUgYWNyb3NzDQogICAgcmVib290cy4gYHVkZXZhZG0gc2V0dGxlYCBiZWZvcmUgYSBj
b21wb3NpdG9yIHN0YXJ0LXVwIGNhbiB3YWl0IGZvciB1ZGV2IHRvDQogICAgZmluaXNoIGl0cyBq
b2IuDQoNCiAgICBPdXQgb2YgY3VyaW9zaXR5LCBjYW4geW91IGV4cGxhaW4geW91ciB1c2UtY2Fz
ZT8gV2h5IGRvIHlvdSBuZWVkIHRvIHN0YXJ0DQogICAgbXVsdGlwbGUgY29tcG9zaXRvcnMsIGVh
Y2ggb24gaXRzIG93biBHUFU/DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cg0KQ09ORklERU5USUFMSVRZIE5PVElDRTogVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRz
IGFyZSBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgYW5kIGNv
bnRhaW4gaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgR2FybWluIGNvbmZpZGVudGlhbCBhbmQvb3Ig
R2FybWluIGxlZ2FsbHkgcHJpdmlsZWdlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFp
bCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGVtYWlsIGFuZCBk
ZWxldGUgdGhlIG1lc3NhZ2UuIEFueSBkaXNjbG9zdXJlLCBjb3B5aW5nLCBkaXN0cmlidXRpb24g
b3IgdXNlIG9mIHRoaXMgY29tbXVuaWNhdGlvbiAoaW5jbHVkaW5nIGF0dGFjaG1lbnRzKSBieSBz
b21lb25lIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudCBpcyBwcm9oaWJpdGVkLiBU
aGFuayB5b3UuDQo=
