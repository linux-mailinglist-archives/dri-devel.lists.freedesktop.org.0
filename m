Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1887010DDC3
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5436E127;
	Sat, 30 Nov 2019 13:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E486E84B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 16:02:48 +0000 (UTC)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xASFwWJe013476; Thu, 28 Nov 2019 11:02:25 -0500
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2059.outbound.protection.outlook.com [104.47.45.59])
 by mx0b-00128a01.pphosted.com with ESMTP id 2whux8b603-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2019 11:02:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3Wykp640PkzmZPQR7TnwUsM9H+NrX6KOO2/QYLfUVXDDWD8cgqtgh5L/+pS1A92AiC1uUbPK8bmp7prCQWMAEEIJH2xiDAZyIbThV/vdVadF/PXtn0mePZacDGHg8FC/3WDhBhZhsQKnIwhU43/Ka5kITP9IqZxv7NWy0yRQ5W4oTNfm6eSS8okSdazAqpaGUgj2DX+ogmwMQrYIwWZcolJiehgOLmH8SHD1QP9STTynT7fuKL45V6gaMHMnANoiDMdnMx+/ePijpDuzQhLJBSf9UgV9xklNqF4dqgRj3AFo7YmxLb1UgTt2JOq6u9owZnj2br+JUT6OIE6UOo3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTS5MjprULROAWlenvx7VJkfS5XKGVLfzC5afYK0ChY=;
 b=ICoByxiiMVWKPC6vw4X4gGpVshTiE2wdvZCyBZZzwPNVIpOynPAudBExo4D5qmAzHjb/18/gSqV4v7fOdQnqhudSdSUI3K2rnrwuahyNP1mS+exfuEZBk5SBPRUgdxVKsYXjgl9tAE3yzFrEPNFSGQG2FZIoOPrm6JxcLfnIbfGWGn9eEvbMXShf9a24xejXQkwA+2XNQoYejUVS3YBnTBS590DiHrWCYOUragoIDj1O9kO0EE0FytIfAAsNqNZiePn0aw8Pvhh+v6VA8HnuhWo0WltHmZCVtLmsycQHc5wT0zS5ocN8+bh/gg35RU1q0AlhSDGARHJ8n2hNLnxucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=baylibre.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
Received: from BYAPR03CA0033.namprd03.prod.outlook.com (2603:10b6:a02:a8::46)
 by DM6PR03MB5116.namprd03.prod.outlook.com (2603:10b6:5:1e4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.19; Thu, 28 Nov
 2019 16:02:23 +0000
Received: from CY1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::208) by BYAPR03CA0033.outlook.office365.com
 (2603:10b6:a02:a8::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Thu, 28 Nov 2019 16:02:23 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 CY1NAM02FT048.mail.protection.outlook.com (10.152.74.227) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
 via Frontend Transport; Thu, 28 Nov 2019 16:02:22 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id xASG2Cdp004608
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 28 Nov 2019 08:02:12 -0800
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Thu, 28 Nov 2019 11:02:21 -0500
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 1/2] dt-bindings: drm: bridge: adv7511: Add ADV7535 support
Date: Thu, 28 Nov 2019 20:00:19 +0200
Message-ID: <20191128180018.12073-2-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128180018.12073-1-bogdan.togorean@analog.com>
References: <20191128180018.12073-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(376002)(136003)(189003)(199004)(70586007)(356004)(1076003)(70206006)(106002)(316002)(2870700001)(50466002)(54906003)(478600001)(2351001)(51416003)(7696005)(47776003)(426003)(446003)(8936002)(36756003)(50226002)(11346002)(44832011)(336012)(7416002)(7636002)(26005)(305945005)(48376002)(4326008)(76176011)(246002)(186003)(86362001)(5660300002)(2616005)(2906002)(6916009)(8676002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR03MB5116; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3d5dfb5-7eaf-4783-7389-08d7741c5ae6
X-MS-TrafficTypeDiagnostic: DM6PR03MB5116:
X-Microsoft-Antispam-PRVS: <DM6PR03MB511679C4A330B052CA9D6A259B470@DM6PR03MB5116.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0235CBE7D0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KCtIPMgMhysQWZnN65fvKJpTNaxJltusksXFTK/IkEg7LthJj+7jJ0PCQbZrgzvfZkaYUtpCk9n/gI/MDzuRZHD3fSNOTLJarOFHZThyrTqJFj5sm6uhbD7q3VbcDP3UjVm2U4fIAm6Op6UKlvCHnN9N6wdl3ZQPxHkzMKSMe9oiYsEY1yxAe9dnU/6p4Hi78s6Bc8zbRL83LFc9hjX91XNY5aRUU1S2dGWZa9HOCQhnlmY5u8QO56ny/4FbAof6Hr/ta+kKf303m15+bmDx9xlKJXuaVFXCB8B45Jm+nqvWjKuSXh62vyD8qcrToQzOKxJZ8IAzKGP5PaJovODz+TgaPEGlYBG/87CCJXWHVaqvmec3/jQyIUoG7C5d1K647Ru2BC0HM1ZPCyP545PyulRcNKTKCVgsCAl3QGSSagv/YauzCg2/56d12tlI/bzs
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2019 16:02:22.7561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d5dfb5-7eaf-4783-7389-08d7741c5ae6
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5116
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_04:2019-11-28,2019-11-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 suspectscore=1 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911280134
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTS5MjprULROAWlenvx7VJkfS5XKGVLfzC5afYK0ChY=;
 b=MaVcDfqyOHLJjXNoH4Hjw/h6RxMglD0wfXPXhB/GoyVao++0fBbIHVWArhqAJvbgTWS9BqOGQ+2MuZ6xqCshwb5gW83cNI5homizIJkIpuixkAUs9AjxJ1jBaJPjK/I8KWc5QjZNCoviKKJzMxMO4tuaFKUEXsn1boRgFlmwiEo=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, wsa+renesas@sang-engineering.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 alexander.deucher@amd.com, tglx@linutronix.de, sam@ravnborg.org,
 matt.redfearn@thinci.com, Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QURWNzUzNSBpcyBhIHBhcnQgY29tcGF0aWJsZSB3aXRoIEFEVjc1MzMgYnV0IGl0IHN1cHBvcnRz
IDEwODBwQDYwaHogYW5kCnYxcDIgc3VwcGx5IGlzIGZpeGVkIHRvIDEuOFYKClNpZ25lZC1vZmYt
Ynk6IEJvZ2RhbiBUb2dvcmVhbiA8Ym9nZGFuLnRvZ29yZWFuQGFuYWxvZy5jb20+ClJldmlld2Vk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FkaSxhZHY3NTExLnR4dCAgIHwgMjMg
KysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9hZGksYWR2NzUxMS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYWRpLGFkdjc1MTEudHh0CmluZGV4IDJjODg3
NTM2MjU4Yy4uZThkZGVjNWQ5ZDkxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYWRpLGFkdjc1MTEudHh0CisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hZGksYWR2NzUxMS50eHQK
QEAgLTEsMTAgKzEsMTAgQEAKLUFuYWxvZyBEZXZpY2UgQURWNzUxMShXKS8xMy8zMyBIRE1JIEVu
Y29kZXJzCitBbmFsb2cgRGV2aWNlIEFEVjc1MTEoVykvMTMvMzMvMzUgSERNSSBFbmNvZGVycwog
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIAotVGhlIEFEVjc1MTEs
IEFEVjc1MTFXLCBBRFY3NTEzIGFuZCBBRFY3NTMzIGFyZSBIRE1JIGF1ZGlvIGFuZCB2aWRlbyB0
cmFuc21pdHRlcnMKLWNvbXBhdGlibGUgd2l0aCBIRE1JIDEuNCBhbmQgRFZJIDEuMC4gVGhleSBz
dXBwb3J0IGNvbG9yIHNwYWNlIGNvbnZlcnNpb24sCi1TL1BESUYsIENFQyBhbmQgSERDUC4gQURW
NzUzMyBzdXBwb3J0cyB0aGUgRFNJIGludGVyZmFjZSBmb3IgaW5wdXQgcGl4ZWxzLCB3aGlsZQot
dGhlIG90aGVycyBzdXBwb3J0IFJHQiBpbnRlcmZhY2UuCitUaGUgQURWNzUxMSwgQURWNzUxMVcs
IEFEVjc1MTMsIEFEVjc1MzMgYW5kIEFEVjc1MzUgYXJlIEhETUkgYXVkaW8gYW5kIHZpZGVvCit0
cmFuc21pdHRlcnMgY29tcGF0aWJsZSB3aXRoIEhETUkgMS40IGFuZCBEVkkgMS4wLiBUaGV5IHN1
cHBvcnQgY29sb3Igc3BhY2UKK2NvbnZlcnNpb24sIFMvUERJRiwgQ0VDIGFuZCBIRENQLiBBRFY3
NTMzLzUgc3VwcG9ydHMgdGhlIERTSSBpbnRlcmZhY2UgZm9yIGlucHV0CitwaXhlbHMsIHdoaWxl
IHRoZSBvdGhlcnMgc3VwcG9ydCBSR0IgaW50ZXJmYWNlLgogCiBSZXF1aXJlZCBwcm9wZXJ0aWVz
OgogCkBAIC0xMyw2ICsxMyw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAJCSJhZGksYWR2NzUx
MXciCiAJCSJhZGksYWR2NzUxMyIKIAkJImFkaSxhZHY3NTMzIgorCQkiYWRpLGFkdjc1MzUiCiAK
IC0gcmVnOiBJMkMgc2xhdmUgYWRkcmVzc2VzCiAgIFRoZSBBRFY3NTExIGludGVybmFsIHJlZ2lz
dGVycyBhcmUgc3BsaXQgaW50byBmb3VyIHBhZ2VzIGV4cG9zZWQgdGhyb3VnaApAQCAtNTIsMTQg
KzUzLDE0IEBAIFRoZSBmb2xsb3dpbmcgaW5wdXQgZm9ybWF0IHByb3BlcnRpZXMgYXJlIHJlcXVp
cmVkIGV4Y2VwdCBpbiAicmdiIDF4IiBhbmQKIC0gYmd2ZGQtc3VwcGx5OiBBIDEuOFYgc3VwcGx5
IHRoYXQgcG93ZXJzIHVwIHRoZSBCR1ZERCBwaW4uIFRoaXMgaXMKICAgbmVlZGVkIG9ubHkgZm9y
IEFEVjc1MTEuCiAKLVRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyBhcmUgcmVxdWlyZWQgZm9yIEFE
Vjc1MzM6CitUaGUgZm9sbG93aW5nIHByb3BlcnRpZXMgYXJlIHJlcXVpcmVkIGZvciBBRFY3NTMz
IGFuZCBBRFY3NTM1OgogCiAtIGFkaSxkc2ktbGFuZXM6IE51bWJlciBvZiBEU0kgZGF0YSBsYW5l
cyBjb25uZWN0ZWQgdG8gdGhlIERTSSBob3N0LiBJdCBzaG91bGQKICAgYmUgb25lIG9mIDEsIDIs
IDMgb3IgNC4KIC0gYTJ2ZGQtc3VwcGx5OiAxLjhWIHN1cHBseSB0aGF0IHBvd2VycyB1cCB0aGUg
QTJWREQgcGluIG9uIHRoZSBjaGlwLgogLSB2M3AzLXN1cHBseTogQSAzLjNWIHN1cHBseSB0aGF0
IHBvd2VycyB1cCB0aGUgVjNQMyBwaW4gb24gdGhlIGNoaXAuCiAtIHYxcDItc3VwcGx5OiBBIHN1
cHBseSB0aGF0IHBvd2VycyB1cCB0aGUgVjFQMiBwaW4gb24gdGhlIGNoaXAuIEl0IGNhbiBiZQot
ICBlaXRoZXIgMS4yViBvciAxLjhWLgorICBlaXRoZXIgMS4yViBvciAxLjhWIGZvciBBRFY3NTMz
IGJ1dCBvbmx5IDEuOFYgZm9yIEFEVjc1MzUuCiAKIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAKQEAg
LTcxLDkgKzcyLDkgQEAgT3B0aW9uYWwgcHJvcGVydGllczoKIC0gYWRpLGVtYmVkZGVkLXN5bmM6
IFRoZSBpbnB1dCB1c2VzIHN5bmNocm9uaXphdGlvbiBzaWduYWxzIGVtYmVkZGVkIGluIHRoZQog
ICBkYXRhIHN0cmVhbSAoc2ltaWxhciB0byBCVC42NTYpLiBEZWZhdWx0cyB0byBzZXBhcmF0ZSBI
L1Ygc3luY2hyb25pemF0aW9uCiAgIHNpZ25hbHMuCi0tIGFkaSxkaXNhYmxlLXRpbWluZy1nZW5l
cmF0b3I6IE9ubHkgZm9yIEFEVjc1MzMuIERpc2FibGVzIHRoZSBpbnRlcm5hbCB0aW1pbmcKLSAg
Z2VuZXJhdG9yLiBUaGUgY2hpcCB3aWxsIHJlbHkgb24gdGhlIHN5bmMgc2lnbmFscyBpbiB0aGUg
RFNJIGRhdGEgbGFuZXMsCi0gIHJhdGhlciB0aGFuIGdlbmVyYXRlIGl0cyBvd24gdGltaW5ncyBm
b3IgSERNSSBvdXRwdXQuCistIGFkaSxkaXNhYmxlLXRpbWluZy1nZW5lcmF0b3I6IE9ubHkgZm9y
IEFEVjc1MzMgYW5kIEFEVjc1MzUuIERpc2FibGVzIHRoZQorICBpbnRlcm5hbCB0aW1pbmcgZ2Vu
ZXJhdG9yLiBUaGUgY2hpcCB3aWxsIHJlbHkgb24gdGhlIHN5bmMgc2lnbmFscyBpbiB0aGUKKyAg
RFNJIGRhdGEgbGFuZXMsIHJhdGhlciB0aGFuIGdlbmVyYXRlIGl0cyBvd24gdGltaW5ncyBmb3Ig
SERNSSBvdXRwdXQuCiAtIGNsb2NrczogZnJvbSBjb21tb24gY2xvY2sgYmluZGluZzogcmVmZXJl
bmNlIHRvIHRoZSBDRUMgY2xvY2suCiAtIGNsb2NrLW5hbWVzOiBmcm9tIGNvbW1vbiBjbG9jayBi
aW5kaW5nOiBtdXN0IGJlICJjZWMiLgogLSByZWctbmFtZXMgOiBOYW1lcyBvZiBtYXBzIHdpdGgg
cHJvZ3JhbW1hYmxlIGFkZHJlc3Nlcy4KQEAgLTg1LDcgKzg2LDcgQEAgUmVxdWlyZWQgbm9kZXM6
CiBUaGUgQURWNzUxMSBoYXMgdHdvIHZpZGVvIHBvcnRzLiBUaGVpciBjb25uZWN0aW9ucyBhcmUg
bW9kZWxsZWQgdXNpbmcgdGhlIE9GCiBncmFwaCBiaW5kaW5ncyBzcGVjaWZpZWQgaW4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dC4KIAotLSBWaWRlbyBwb3J0IDAg
Zm9yIHRoZSBSR0IsIFlVViBvciBEU0kgaW5wdXQuIEluIHRoZSBjYXNlIG9mIEFEVjc1MzMsIHRo
ZQorLSBWaWRlbyBwb3J0IDAgZm9yIHRoZSBSR0IsIFlVViBvciBEU0kgaW5wdXQuIEluIHRoZSBj
YXNlIG9mIEFEVjc1MzMvNSwgdGhlCiAgIHJlbW90ZSBlbmRwb2ludCBwaGFuZGxlIHNob3VsZCBi
ZSBhIHJlZmVyZW5jZSB0byBhIHZhbGlkIG1pcGlfZHNpX2hvc3QgZGV2aWNlCiAgIG5vZGUuCiAt
IFZpZGVvIHBvcnQgMSBmb3IgdGhlIEhETUkgb3V0cHV0Ci0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
