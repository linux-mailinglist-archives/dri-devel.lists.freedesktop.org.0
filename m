Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BCBEEAC5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 22:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E116E880;
	Mon,  4 Nov 2019 21:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730087.outbound.protection.outlook.com [40.107.73.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E806E880;
 Mon,  4 Nov 2019 21:11:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkQ5JpBz/oK9K1sZ6/DuBROhTnsuIAxZCTJ1UZPRZXxGRvN9vocHdqG4WjwdeU7kW8bq2zrN+WtxftG6dFG/PFr/2Hpecg/CTTJnV7vVZzE4ZYRbkmCZerD+xj2NKC3qjc/xUhf1Y0Q4FT+p9NhseLPxpEmGOmVT9RZTXOolFEKO5NpC62qv5FB7e9pnWzl0PyngSzgk3uKJjr+LEBcJ+WEhWQJ1lH6wY9bvKZ0vRJG60WcDsFYbW6RpDas6M+Xk6hLr7ZM/zJLWogXg3jQnKhyHludvezsCHbwnAtpSEFwR5yFK4wztRHQj8sGswWmylHP4IW5VI8Yp2EM4y1lGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsCmJ8btibpeYfaBd/ErnzyTbs8PDsP56TK1DMWcySA=;
 b=cLlmx55a8r+vvEf3sgJwTis2VEgFePk2RnQ56b9zcMkAdg50kLnK6U/zUCzilKnY3lUxvB02AKgOi0oTfZCqw2FRF/i8nJPhfnwTYS9ZVgfAOMi/kO04/tD5etgpqnCenWKDHJ8uCYoLiz5kcYDlPgSS7yeORbPXb98H6J705qf/QZdhWsOTB71y/sK0lF1DpYPqItpDYKyNVc0zUKNtko+T/jWebiMS9LEaJnc7B74VwuskxE6c/0LCE7SJ9f4VBnXzw/uj+NLJ/Uf0Yy+XoGwd/XOmoL8Px2ocQcxNg4cKbict26jicKpNnhMQmSbo2gvVWWC9G5g81EOFiR7AHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0064.namprd12.prod.outlook.com (2603:10b6:3:103::26)
 by CY4PR12MB1430.namprd12.prod.outlook.com (2603:10b6:903:3e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Mon, 4 Nov
 2019 21:11:50 +0000
Received: from DM3NAM03FT065.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by DM5PR12CA0064.outlook.office365.com
 (2603:10b6:3:103::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24 via Frontend
 Transport; Mon, 4 Nov 2019 21:11:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT065.mail.protection.outlook.com (10.152.82.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2387.20 via Frontend Transport; Mon, 4 Nov 2019 21:11:50 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 4 Nov 2019
 15:11:49 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 4 Nov 2019 15:11:49 -0600
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3] drm: Add support for DP 1.4 Compliance edid corruption
 test 4.2.2.6
Date: Mon, 4 Nov 2019 16:11:45 -0500
Message-ID: <20191104211145.30553-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191101193839.25582-1-Jerry.Zuo@amd.com>
References: <20191101193839.25582-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(428003)(189003)(199004)(478600001)(76176011)(51416003)(8936002)(356004)(6666004)(70206006)(476003)(70586007)(2616005)(50466002)(86362001)(2906002)(14444005)(7696005)(305945005)(5660300002)(36756003)(336012)(26005)(186003)(54906003)(110136005)(16586007)(316002)(426003)(126002)(53416004)(446003)(4326008)(81166006)(81156014)(48376002)(486006)(47776003)(50226002)(11346002)(8676002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1430; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9161d580-bd46-4c9e-bc50-08d7616b9c2c
X-MS-TrafficTypeDiagnostic: CY4PR12MB1430:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1430B85C731D5E2CF175961EE57F0@CY4PR12MB1430.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0211965D06
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oIL90bNie7blsDp0stXqLXfCy0c7oOesNPvX0QTwbYPyWBs9XEZ/+5Yyp++Q+fmnB6jIPCIMs0W1olQuFigIyiwz1GH5/7/erJhHoY9b5DRXbDQPl/SAwRUd2fu6yHWlHlHslF5kLSF2AUUeoI7piZMbe9lD9oDWinKbTDD7mBEFedD21nrz9mgJIhFxURomlJuuCd2PxtHdQyhDL9ddKlT+mCb4zJx6iGQQSOwA7arklvDnpnlIx67w+ck3CVsfhR2QwlFlBY+bW4XdCmWLsvX7Q5D8HJhj1qn2Mrds7DpwIFDjpOtZ+yPPRbk/8T/itiLKUuwzJmLJPFRFgHoMfgAQc09TpUsA1mLwe7F7RUorIAO2eSevnZAQu8ps2GSBJJvY80TQl7Ovirb8gNKITtIC4Z9da3AGD0buDqnDr8MT/Hu6l3C6/ifR7rPGG5tU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2019 21:11:50.4946 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9161d580-bd46-4c9e-bc50-08d7616b9c2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1430
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsCmJ8btibpeYfaBd/ErnzyTbs8PDsP56TK1DMWcySA=;
 b=iF6GOby74uE/UBduW6fGqpeXmamqZYO4QqupAuK30b5zwRHMsIy66GSamhRws4tIgkVof+pr0f9m+6FPyjEMeaiFdkVAKeoQKSbHsm81zaQH+cuTsC/AXYGV2ZFLIvJk/uJekqDPOEbgYNyDdFDJJxlf5mNGAZ+vY4+ZWvuLBF0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: manasi.d.navare@intel.com, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFAgMS40IGVkaWQgY29ycnVwdGlvbiB0ZXN0IHJlcXVpcmVzIHNvdXJjZSBEVVQgdG8gd3JpdGUg
Y2FsY3VsYXRlZApDUkMsIG5vdCB0aGUgY29ycnVwdGVkIENSQyBmcm9tIHJlZmVyZW5jZSBzaW5r
LgoKUmV0dXJuIHRoZSBjYWxjdWxhdGVkIENSQyBiYWNrLCBhbmQgaW5pdGlhdGUgdGhlIHJlcXVp
cmVkIHNlcXVlbmNlLgoKLXYyOiBIYXZlIHNlcGFyYXRlIHJvdXRpbmUgZm9yIHJldHVybmluZyBy
ZWFsIENSQwoKLXYzOiBSZXdyaXRlIGNoZWNrc3VtIGNvbXB1dGF0aW9uIHJvdXRpbmUgdG8gYXZv
aWQgZHVwbGljYXRlZCBjb2RlLgogICAgIFJlbmFtZSB0byBhdm9pZCBjb25mdXNpb24KClNpZ25l
ZC1vZmYtYnk6IEplcnJ5IChGYW5nemhpKSBadW8gPEplcnJ5Llp1b0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jICAgICAgfCAxOCArKysr
KysrKysrKysrKystLS0KIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgfCAgNyArKysr
KysrCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAgIHwgIDMgKysrCiA0IGZpbGVzIGNo
YW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVs
cGVyLmMKaW5kZXggZmZjNjhkMzA1YWZlLi43NWJkZmZkODQwYzYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYwpAQCAtMzM2LDYgKzMzNiw0MiBAQCBpbnQgZHJtX2RwX2RwY2RfcmVhZF9saW5rX3N0
YXR1cyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogfQogRVhQT1JUX1NZTUJPTChkcm1fZHBfZHBj
ZF9yZWFkX2xpbmtfc3RhdHVzKTsKIAorLyoqCisgICogZHJtX2RwX3NlbmRfcmVhbF9lZGlkX2No
ZWNrc3VtKCkgLSBzZW5kIGJhY2sgcmVhbCBlZGlkIGNoZWNrc3VtIHZhbHVlCisgICogQGF1eDog
RGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKKyAgKiBAYmFkX2VkaWRfY2hlY2tzdW06IHJlYWwgZWRp
ZCBjaGVja3N1bSBmb3IgdGhlIGxhc3QgYmxvY2sKKyAgKgorICAqIFJldHVybnMgdHJ1ZSBvbiBz
dWNjZXNzCisgICovCitib29sIGRybV9kcF9zZW5kX3JlYWxfZWRpZF9jaGVja3N1bShzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqYXV4LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1OCByZWFs
X2VkaWRfY2hlY2tzdW0pCit7CisgICAgICAgIHU4IGxpbmtfZWRpZF9yZWFkID0gMCwgYXV0b190
ZXN0X3JlcSA9IDA7CisgICAgICAgIHU4IHRlc3RfcmVzcCA9IDA7CisKKyAgICAgICAgZHJtX2Rw
X2RwY2RfcmVhZChhdXgsIERQX0RFVklDRV9TRVJWSUNFX0lSUV9WRUNUT1IsICZhdXRvX3Rlc3Rf
cmVxLCAxKTsKKyAgICAgICAgYXV0b190ZXN0X3JlcSAmPSBEUF9BVVRPTUFURURfVEVTVF9SRVFV
RVNUOworCisgICAgICAgIGRybV9kcF9kcGNkX3JlYWQoYXV4LCBEUF9URVNUX1JFUVVFU1QsICZs
aW5rX2VkaWRfcmVhZCwgMSk7CisgICAgICAgIGxpbmtfZWRpZF9yZWFkICY9IERQX1RFU1RfTElO
S19FRElEX1JFQUQ7CisKKyAgICAgICAgaWYgKCFhdXRvX3Rlc3RfcmVxIHx8ICFsaW5rX2VkaWRf
cmVhZCkgeworICAgICAgICAgICAgICAgIERSTV9ERUJVR19LTVMoIlNvdXJjZSBEVVQgZG9lcyBu
b3Qgc3VwcG9ydCBURVNUX0VESURfUkVBRFxuIik7CisgICAgICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOworICAgICAgICB9CisKKyAgICAgICAgZHJtX2RwX2RwY2Rfd3JpdGUoYXV4LCBEUF9ERVZJ
Q0VfU0VSVklDRV9JUlFfVkVDVE9SLCAmYXV0b190ZXN0X3JlcSwgMSk7CisKKyAgICAgICAgLyog
c2VuZCBiYWNrIGNoZWNrc3VtIGZvciB0aGUgbGFzdCBlZGlkIGV4dGVuc2lvbiBibG9jayBkYXRh
ICovCisgICAgICAgIGRybV9kcF9kcGNkX3dyaXRlKGF1eCwgRFBfVEVTVF9FRElEX0NIRUNLU1VN
LCAmcmVhbF9lZGlkX2NoZWNrc3VtLCAxKTsKKworICAgICAgICB0ZXN0X3Jlc3AgfD0gRFBfVEVT
VF9FRElEX0NIRUNLU1VNX1dSSVRFOworICAgICAgICBkcm1fZHBfZHBjZF93cml0ZShhdXgsIERQ
X1RFU1RfUkVTUE9OU0UsICZ0ZXN0X3Jlc3AsIDEpOworCisgICAgICAgIHJldHVybiB0cnVlOwor
fQorRVhQT1JUX1NZTUJPTChkcm1fZHBfc2VuZF9yZWFsX2VkaWRfY2hlY2tzdW0pOworCiAvKioK
ICAqIGRybV9kcF9saW5rX3Byb2JlKCkgLSBwcm9iZSBhIERpc3BsYXlQb3J0IGxpbmsgZm9yIGNh
cGFiaWxpdGllcwogICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMK
aW5kZXggODJhNGNlZWQzZmNmLi5mZjY0ZTVmMWZlYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC0xMzQ4
LDEwICsxMzQ4LDE5IEBAIHN0YXRpYyBpbnQgZHJtX2VkaWRfYmxvY2tfY2hlY2tzdW0oY29uc3Qg
dTggKnJhd19lZGlkKQogewogCWludCBpOwogCXU4IGNzdW0gPSAwOwotCWZvciAoaSA9IDA7IGkg
PCBFRElEX0xFTkdUSDsgaSsrKQorCisJZm9yIChpID0gMDsgaSA8IEVESURfTEVOR1RIIC0gMTsg
aSsrKQogCQljc3VtICs9IHJhd19lZGlkW2ldOwogCi0JcmV0dXJuIGNzdW07CisJcmV0dXJuICgw
eDEwMCAtIGNzdW0pOworfQorCitzdGF0aWMgYm9vbCBkcm1fZWRpZF9ibG9ja19jaGVja3N1bV9k
aWZmKGNvbnN0IHU4ICpyYXdfZWRpZCwgdTggcmVhbF9jaGVja3N1bSkKK3sKKwlpZiAocmF3X2Vk
aWRbRURJRF9MRU5HVEggLSAxXSAhPSByZWFsX2NoZWNrc3VtKQorCQlyZXR1cm4gdHJ1ZTsKKwll
bHNlCisJCXJldHVybiBmYWxzZTsKIH0KIAogc3RhdGljIGJvb2wgZHJtX2VkaWRfaXNfemVybyhj
b25zdCB1OCAqaW5fZWRpZCwgaW50IGxlbmd0aCkKQEAgLTE0MDksNyArMTQxOCw3IEBAIGJvb2wg
ZHJtX2VkaWRfYmxvY2tfdmFsaWQodTggKnJhd19lZGlkLCBpbnQgYmxvY2ssIGJvb2wgcHJpbnRf
YmFkX2VkaWQsCiAJfQogCiAJY3N1bSA9IGRybV9lZGlkX2Jsb2NrX2NoZWNrc3VtKHJhd19lZGlk
KTsKLQlpZiAoY3N1bSkgeworCWlmIChkcm1fZWRpZF9ibG9ja19jaGVja3N1bV9kaWZmKHJhd19l
ZGlkLCBjc3VtKSkgewogCQlpZiAoZWRpZF9jb3JydXB0KQogCQkJKmVkaWRfY29ycnVwdCA9IHRy
dWU7CiAKQEAgLTE1NzIsNiArMTU4MSw5IEBAIHN0YXRpYyB2b2lkIGNvbm5lY3Rvcl9iYWRfZWRp
ZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCQkJICAgICAgIHByZWZpeCwgRFVN
UF9QUkVGSVhfTk9ORSwgMTYsIDEsCiAJCQkgICAgICAgYmxvY2ssIEVESURfTEVOR1RILCBmYWxz
ZSk7CiAJfQorCisJLyogQ2FsY3VsYXRlIHJlYWwgY2hlY2tzdW0gZm9yIHRoZSBsYXN0IGVkaWQg
ZXh0ZW5zaW9uIGJsb2NrIGRhdGEgKi8KKwljb25uZWN0b3ItPnJlYWxfZWRpZF9jaGVja3N1bSA9
IGRybV9lZGlkX2Jsb2NrX2NoZWNrc3VtKGVkaWQgKyBlZGlkWzB4N2VdICogRURJRF9MRU5HVEgp
OwogfQogCiAvKiBHZXQgb3ZlcnJpZGUgb3IgZmlybXdhcmUgRURJRCAqLwpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5o
CmluZGV4IDY4MWNiNTkwZjk1Mi4uZWIwZDhjN2IzNWZkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fY29ubmVjdG9yLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCkBAIC0x
MzQ1LDYgKzEzNDUsMTMgQEAgc3RydWN0IGRybV9jb25uZWN0b3IgewogCSAqIHJldjEuMSA0LjIu
Mi42CiAJICovCiAJYm9vbCBlZGlkX2NvcnJ1cHQ7CisJLyoqCisgICAgICAgICAqIEByZWFsX2Vk
aWRfY2hlY2tzdW06IHJlYWwgZWRpZCBjaGVja3N1bSB2YWx1ZSBmb3IgY29ycnVwdGVkIGVkaWQg
YmxvY2suCisgICAgICAgICAqIFJlcXVpcmVkIGluIERpc3BsYXlwb3J0IDEuNCBjb21wbGlhbmNl
IHRlc3RpbmcKKyAgICAgICAgICogcmV2MS4xIDQuMi4yLjYKKyAgICAgICAgICovCisgICAgICAg
IHVpbnQ4X3QgcmVhbF9lZGlkX2NoZWNrc3VtOworCiAKIAkvKiogQGRlYnVnZnNfZW50cnk6IGRl
YnVnZnMgZGlyZWN0b3J5IGZvciB0aGlzIGNvbm5lY3RvciAqLwogCXN0cnVjdCBkZW50cnkgKmRl
YnVnZnNfZW50cnk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9p
bmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5kZXggNWE3OTUwNzVkNWRhLi44NDcwOWQ3ODEw
ZjggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTEzODMsNiArMTM4Myw5IEBAIHN0YXRpYyBpbmxpbmUg
c3NpemVfdCBkcm1fZHBfZHBjZF93cml0ZWIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKIGludCBk
cm1fZHBfZHBjZF9yZWFkX2xpbmtfc3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAJCQkJ
IHU4IHN0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSk7CiAKK2Jvb2wgZHJtX2RwX3NlbmRfcmVh
bF9lZGlkX2NoZWNrc3VtKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCisJCQkJICAgIHU4IHJlYWxf
ZWRpZF9jaGVja3N1bSk7CisKIC8qCiAgKiBEaXNwbGF5UG9ydCBsaW5rCiAgKi8KLS0gCjIuMTQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
