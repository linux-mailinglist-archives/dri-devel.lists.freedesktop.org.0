Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E5264C8B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 20:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EEA6E968;
	Thu, 10 Sep 2020 18:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B0D6E968
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 18:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6oBzjH+ltOGFYRajrtU1Tmlk+jVEm/P6si+t0v7qj9T3wYCtcDjISMpmnFOcne4/UsWtVsDqXE83ViOLp7jSUHY2y18K5Vv7+hurcypnZ6S57eJMtapRLqto3JOzsZ1E3BXMUGEIyJOs6fitbbPngQFWZFTwvFPVTsnndnjqCtlfUuYixkczs8kClT7nqnt66/jK6hJWSyPIXyZZo9VNEkAkT9z0ZaF4Kbfe1vCBX3WQTLHOa7EsHHlW7mDNeLd5d7DG0S+z/V0fT2moxIL7RLyt4ERnKC6zTCuSN/fuBpEZTcj1uwsNBeFLbfbnSSXAS3KGWEIW2OxULeBMWDyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHjB2unu+9Et4mo9cnxLh3GBS2bINldpk93zFl43Gzk=;
 b=gKa/Amvm7RvLB0dhff7ewfzXOXyVbTcVOdZ5RrRkwyLliG1byH6vERq62RS4P160fj3eMaLxFpP7FZA7lOFdhv/vEgBFFVkN90zCwcBRbT4z/8xPqjFOPzFVtPV/pYdx5FMeieXhNoWn711ZUWzrSu+TLGf1/hzsbCabfjF7vRg482c35SEWkvGkXxOsVs1JocFo01OSdMKYCY4dVLeqgHE9Dj4e+GN1lSHd/+BeGq0VfL0+FW9yQ+Ca47J8YKHhqgDknQmaV/IcyRec/B7bAd+oaSudBkLNh7jFP0s9IqR+t6ITDRrfWFsEkImKcK1PeucZOSU5v1zO0QSdVXSMzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 149.199.60.83) smtp.rcpttodomain=ffwll.ch
 smtp.mailfrom=xilinx.com; 
 dmarc=none action=none header.from=xilinx.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHjB2unu+9Et4mo9cnxLh3GBS2bINldpk93zFl43Gzk=;
 b=IVEuEPA7u40Gyu9wJ0tOyAgecrHHOlosMKJxUAUBCruBoPK+BoHpOg5ZJGxLsAb0ppjpnJihIHgU8V2Fxl/asSHVHoFz8tI5CLRs9ThXy3NvMm5VKlkhHVP+FoIkSGhyogjSjxbAhgCWAxGsFi3PATmr8F9QNbLqkgWis8xFFLc=
Received: from BL0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:207:3c::36)
 by DM6PR02MB7003.namprd02.prod.outlook.com (2603:10b6:5:255::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 18:14:26 +0000
Received: from BL2NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:207:3c:cafe::ea) by BL0PR02CA0023.outlook.office365.com
 (2603:10b6:207:3c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 18:14:26 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 149.199.60.83) smtp.mailfrom=xilinx.com; ffwll.ch; dkim=none (message not
 signed) header.d=none;ffwll.ch; dmarc=none action=none
 header.from=xilinx.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of xilinx.com: DNS Timeout)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT010.mail.protection.outlook.com (10.152.77.53) with Microsoft SMTP
 Server id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 18:14:25
 +0000
Received: from [149.199.38.66] (port=37327 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kGR5D-0003IK-S1; Thu, 10 Sep 2020 11:14:07 -0700
Received: from [127.0.0.1] (helo=localhost)
 by smtp.xilinx.com with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kGR5V-0002dy-Bn; Thu, 10 Sep 2020 11:14:25 -0700
Received: from [172.19.75.82] (helo=xsjsycl40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kGR5O-0002cu-98; Thu, 10 Sep 2020 11:14:18 -0700
Received: by xsjsycl40.xilinx.com (Postfix, from userid 13638)
 id 4003F352C02; Thu, 10 Sep 2020 11:14:18 -0700 (PDT)
Date: Thu, 10 Sep 2020 11:14:18 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] drm: xlnx: remove defined but not used
 'scaling_factors_666'
Message-ID: <20200910181418.GA3187626@xilinx.com>
References: <20200910140630.1191782-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910140630.1191782-1-yanaijie@huawei.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f78f61b6-73a3-402f-b8ee-08d855b559d9
X-MS-TrafficTypeDiagnostic: DM6PR02MB7003:
X-Microsoft-Antispam-PRVS: <DM6PR02MB7003EEBD33BA17B8D8BF7B06D6270@DM6PR02MB7003.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQwHXJqIyAnEQ9dQ2qu+IwQKxbYxX7EbC04QDo8smL6uCD+5e00xAVMwFPmG8Iw5XpRQotE3Ji5Aa/ofwKbpowlq8lGB3ZG2gMuWDc82YiBoy+jDYMnlP9rWsIo2gMCFKNIwYXHLp8g2ltY3kh37uXtirtwc994Iuizuk4j2kG50jd0p70zb8fCpwRHCq1hJjL1Uux80AdG/JUkkzqs0wey6dgQYi212Pma3xYVS7d1qEn/EGXP19t3QtptHYO23mz8G2yAR7I2wa4W14piTQtvYFp3GA3+sT2+sdQvI6oeSvcfBlJzhnV4q3+pDexb48kioi2HYQJL6QVIwK/hC7bphGEyA+ltbCOPwhrj1oEmpk+jdaaBYyorYovYMvs6JyeHTQtEPxvUs87enXc7Mpw==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:ErrorRetry; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(346002)(376002)(46966005)(44832011)(81166007)(316002)(83380400001)(82740400003)(336012)(54906003)(33656002)(70206006)(2906002)(6266002)(426003)(2616005)(356005)(1076003)(26005)(8676002)(5660300002)(82310400003)(8936002)(186003)(42186006)(6916009)(478600001)(70586007)(36756003)(47076004)(63350400001)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 18:14:25.7702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f78f61b6-73a3-402f-b8ee-08d855b559d9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7003
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hulk Robot <hulkci@huawei.com>, Michal Simek <michals@xilinx.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFzb24sCgpPbiBUaHUsIFNlcCAxMCwgMjAyMCBhdCAwNzowNjozMEFNIC0wNzAwLCBKYXNv
biBZYW4gd3JvdGU6Cj4gVGhpcyBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZyBnY2Mgd2FybmluZyB3
aXRoICJtYWtlIFc9MSI6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYzoy
NDU6MTg6IHdhcm5pbmc6Cj4g4oCYc2NhbGluZ19mYWN0b3JzXzY2NuKAmSBkZWZpbmVkIGJ1dCBu
b3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICAgMjQ1IHwgc3RhdGljIGNvbnN0
IHUzMiBzY2FsaW5nX2ZhY3RvcnNfNjY2W10gPSB7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2Np
QGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWku
Y29tPgoKUmV2aWV3ZWQtYnk6IEh5dW4gS3dvbiA8aHl1bi5rd29uQHhpbGlueC5jb20+CgpUaGFu
a3MhCgotaHl1bgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYyB8
IDYgLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJt
L3hsbngvenlucW1wX2Rpc3AuYwo+IGluZGV4IGE0NTVjZmMxYmVlNS4uOThiZDQ4ZjEzZmQxIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jCj4gQEAgLTI0MiwxMiArMjQyLDYgQEAg
c3RhdGljIGNvbnN0IHUzMiBzY2FsaW5nX2ZhY3RvcnNfNTY1W10gPSB7Cj4gIAlaWU5RTVBfRElT
UF9BVl9CVUZfNUJJVF9TRiwKPiAgfTsKPiAgCj4gLXN0YXRpYyBjb25zdCB1MzIgc2NhbGluZ19m
YWN0b3JzXzY2NltdID0gewo+IC0JWllOUU1QX0RJU1BfQVZfQlVGXzZCSVRfU0YsCj4gLQlaWU5R
TVBfRElTUF9BVl9CVUZfNkJJVF9TRiwKPiAtCVpZTlFNUF9ESVNQX0FWX0JVRl82QklUX1NGLAo+
IC19Owo+IC0KPiAgc3RhdGljIGNvbnN0IHUzMiBzY2FsaW5nX2ZhY3RvcnNfODg4W10gPSB7Cj4g
IAlaWU5RTVBfRElTUF9BVl9CVUZfOEJJVF9TRiwKPiAgCVpZTlFNUF9ESVNQX0FWX0JVRl84QklU
X1NGLAo+IC0tIAo+IDIuMjUuNAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
