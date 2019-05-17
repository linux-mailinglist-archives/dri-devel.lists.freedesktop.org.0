Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D9219A4
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 16:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BD089885;
	Fri, 17 May 2019 14:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680067.outbound.protection.outlook.com [40.107.68.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EA989885
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 14:12:47 +0000 (UTC)
Received: from DM3PR12CA0120.namprd12.prod.outlook.com (2603:10b6:0:51::16) by
 DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 14:12:45 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM3PR12CA0120.outlook.office365.com
 (2603:10b6:0:51::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Fri, 17 May 2019 14:12:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Fri, 17 May 2019 14:12:43 +0000
Received: from hwentlanhp.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 17 May 2019
 09:12:41 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/connector: Add doc for content_protection tri-state
Date: Fri, 17 May 2019 10:12:14 -0400
Message-ID: <20190517141214.32627-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(50466002)(68736007)(186003)(2616005)(2906002)(70206006)(70586007)(44832011)(486006)(26005)(476003)(2351001)(77096007)(72206003)(14444005)(6916009)(5024004)(478600001)(48376002)(126002)(81166006)(53416004)(50226002)(47776003)(356004)(6666004)(86362001)(54906003)(53936002)(7696005)(305945005)(4326008)(8936002)(5660300002)(36756003)(336012)(81156014)(426003)(1076003)(8676002)(316002)(51416003)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e7805f8-7ec8-4c5b-3c81-08d6dad1bb24
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12762A5684D6EBF0CB2BE30F8C0B0@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0040126723
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4ckkg0kcehakiGghT3mPub8hjSNG0slL6DsbGWATGn1pyeQIOn9UM2fihP0NRV02oW33I1WCrHDclC7jEG6DisLt3ZbfUf3zXEZ8IKPIPvVvh19TcfR9r3yLULBh1pIf5Q1Df3nM6oMpF0ILjmqf+RtOqsYOxQmd1aY67qZBnzXTho3zcquOWS0jrZVSIpyeCxu9+GbbgNN1rJKU/dWd62WR2316+uRdUj64KV1f2bXP9e3YwWZRZETwXElmN0T01sg4W9i8nQbQegpm0/9oce97ujyaFNgSxMGQ013zsiuG9zeGz+63sGy749V/vXIFdBf8Rf31mHP95t3TkjYj+dFeUQNiUTTU3ZOMkGcXWCGxOcB704lgGRGB/krFmBz2Zu2+ZDjP67t/1GSlzq2iYqAohz7hT3O4/grFwn2HEhY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2019 14:12:43.0749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7805f8-7ec8-4c5b-3c81-08d6dad1bb24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AxbF7YsJ5k4OehccJI+FS1+r2orHOcp4fPyr4EiBfI=;
 b=zTt4XQYFnI90lDoT3+8P5dk36dcAMahykh9n1b+uo2td+wzpWZ98681EWbAwyiEL83nfPh5Z0FvAb7o9YCq0pfnrdILYQ10t/58VhTgff612FYPKXxvaYrIzKZoLegkH0UdwP7smt5KWTeDYCuOnmxnYfJamsP9dyybeIyB2y9E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; poorly.run; dkim=none (message not signed)
 header.d=none;poorly.run; dmarc=permerror action=none header.from=amd.com;
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgd2FzIHRoZXJlIGFsbCBhbG9uZyBpbiB0aGUgcGF0Y2ggZGVzY3JpcHRpb24gd2hlbiB0aGlz
IGNoYW5nZSB3YXMKaW50cm9kdWNlZCBidXQgaXQgd291bGQgYmUgaGVscGZ1bCB0byBoYXZlIHRo
ZSBzYW1lIGRvY3VtZW50ZWQgaW4gdGhlCmNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBIYXJyeSBXZW50
bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hy
b21pdW0ub3JnPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBCaGF3YW5wcmVl
dCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2Nvbm5lY3Rvci5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwppbmRleCBiMzRjM2QzOGJmMTUuLmM1M2U1MWFk
M2I1OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCkBAIC0xNTE5LDYgKzE1MTksMTUgQEAgRVhQ
T1JUX1NZTUJPTChkcm1fY29ubmVjdG9yX2F0dGFjaF9zY2FsaW5nX21vZGVfcHJvcGVydHkpOwog
ICogQ29udGVudCBQcm90ZWN0aW9uIGlzIGludGVudGlvbmFsbHkgdmFndWUgdG8gYWxsb3cgZm9y
IGRpZmZlcmVudCB1bmRlcmx5aW5nCiAgKiB0ZWNobm9sb2dpZXMsIGhvd2V2ZXIgaXQgaXMgbW9z
dCBpbXBsZW1lbnRlZCBieSBIRENQLgogICoKKyAqIFRoZSBwcm9wZXJ0eSBpcyBhIHRyaS1zdGF0
ZSB3aXRoIHRoZSBmb2xsb3dpbmcgdmFsdWVzOgorICogLSBPRkY6IFNlbGYgZXhwbGFuYXRvcnks
IG5vIGNvbnRlbnQgcHJvdGVjdGlvbgorICogLSBERVNJUkVEOiBVc2Vyc3BhY2UgcmVxdWVzdHMg
dGhhdCB0aGUgZHJpdmVyIGVuYWJsZSBwcm90ZWN0aW9uCisgKiAtIEVOQUJMRUQ6IE9uY2UgdGhl
IGRyaXZlciBoYXMgYXV0aGVudGljYXRlZCB0aGUgbGluaywgaXQgc2V0cyB0aGlzIHZhbHVlCisg
KgorICogVGhlIGRyaXZlciBpcyByZXNwb25zaWJsZSBmb3IgZG93bmdyYWRpbmcgRU5BQkxFRCB0
byBERVNJUkVEIGlmIHRoZSBsaW5rIGJlY29tZXMKKyAqIHVucHJvdGVjdGVkLiBUaGUgZHJpdmVy
IHNob3VsZCBhbHNvIG1haW50YWluIHRoZSBkZXNpcmVkbmVzcyBvZiBwcm90ZWN0aW9uCisgKiBh
Y3Jvc3MgaG90cGx1Zy9kcG1zL3N1c3BlbmQuCisgKgogICogVGhlIGNvbnRlbnQgcHJvdGVjdGlv
biB3aWxsIGJlIHNldCB0byAmZHJtX2Nvbm5lY3Rvcl9zdGF0ZS5jb250ZW50X3Byb3RlY3Rpb24K
ICAqCiAgKiBSZXR1cm5zOgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
