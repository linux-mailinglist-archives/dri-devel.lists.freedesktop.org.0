Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAD1263F12
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEB16E2E2;
	Thu, 10 Sep 2020 07:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0E36E2CF;
 Thu, 10 Sep 2020 07:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9XnnkgMvkY6MrbafSD+l9dPY7u6FT1EoVuRYZGBwHznB3mX+kaSteinq31ee5IUJuYbJvZpMjxpKRHn67dsUZdjtwgcXXfO7wmb23axXEsl7eeCJCNYgS/oM8M1GFi4WJXCmcnXC2feWTvRwqQ16PNIHqwrXyITmfkygPzMF1Ql+B26ql2dvwlp/geiKiWzgUDTC2BZiE1ud7rUE3v/UXOIYJN8hczocBfTmIzGYUuElLg+hizgxnzQOGuQ98Lme6OScVCdtnxd09MhdkgkjM3n9LmuVZVvE0oCNfrnspzarNmcXzGwzQB5a69An3fEsfuuq3SMT1zDzquBUferwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIAnN8p/rjyfe+qFlFoTQEWWHuVbh/0CZ9lKFQmruaA=;
 b=LV6CZSNPKD7JTtavem6htTxQN8AihKnOicAik0CKZT/ndyzYxTtvQxiOI+NwZSentv4lmEeQQeFNlUONlzZuNN/OlhLHhqVCOqR6+oqDyJ7O/fWFG0ZQY04BGoe96n4KtglWjbhTqJUH8KmnaVnS4XlXUtmtzgoxauLDYF2EHcPFDIOwktan4PWr03/MTFRSZjUZYSTjKJRhQf8UD2ODKVEmiLGVLQ7HMaMxyFFBCUniFIpZVgEFMD80Wj6FchRoIlalvXMGOKa72Vav2kusWJYNWHC/K2TcbRWcuTS530Glx4+rIyR1F+Gwg5RYKgHISryE0sDkhLYuHjvUTTU4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIAnN8p/rjyfe+qFlFoTQEWWHuVbh/0CZ9lKFQmruaA=;
 b=doGkqwBQfYatxc3P07EwWHzoHYmlNhfTctvAL67BGIk9kjFwRKoaMl54RzvQuLSG4mkUS4fUeiUt2wKmsqTgIHKswVosufXU0iTTB1GhWU67+dkrIo9cPmaTeIaW/WGwREIOfzr5JANg+bWA1JpgXJ8OFOPMD5Z0X1C2GPqrplY=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1309.namprd12.prod.outlook.com (2603:10b6:300:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 10 Sep
 2020 07:53:28 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::e881:6ca2:c1d7:48e6]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::e881:6ca2:c1d7:48e6%7]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 07:53:28 +0000
Date: Thu, 10 Sep 2020 15:53:18 +0800
From: Huang Rui <ray.huang@amd.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v2 -next] drm/amdkfd: Fix -Wunused-const-variable warning
Message-ID: <20200910075318.GA2592322@hr-amd>
References: <20200910025532.19616-1-yuehaibing@huawei.com>
 <20200910075006.41484-1-yuehaibing@huawei.com>
Content-Disposition: inline
In-Reply-To: <20200910075006.41484-1-yuehaibing@huawei.com>
X-ClientProxiedBy: HK2PR06CA0021.apcprd06.prod.outlook.com
 (2603:1096:202:2e::33) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR06CA0021.apcprd06.prod.outlook.com (2603:1096:202:2e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 07:53:25 +0000
X-Originating-IP: [58.247.170.245]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 763332ca-86f9-4e82-b1e7-08d8555e9a39
X-MS-TrafficTypeDiagnostic: MWHPR12MB1309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB13092289DB48D53D71D05BC9EC270@MWHPR12MB1309.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QBFswSFlQJv6HTazz3KkUdoPkyA4viM4nnUMmN8jvLJms3prVJkXT4sgUTopjEIkgUBt/jP/ocqNWMbW/ucFKniEssZ0doIQnF3Ag7sbCd2Z/KbBfb57bzZ6sNzSQKl3Vy1ka0QJKcprYI0gP9b48T2w2YAD+8CWMp4XICX5dpTnSK768vsnAlC+VEMimxh691lZ/T1SKpQHOqaS8nUtDFV8xkRRN3ubJVILtGJ8h2CK/z24XdUSoCexrw0ZJh5teEGMxP0qCRg72+Mv4JpVkt/NsLJ7iBItpoYj/dY+7ItYf8+iRkNEZAdDl5ci8RY6rXr0S2xU5/z8Baayjgt6oA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(8676002)(33656002)(52116002)(6496006)(55016002)(8936002)(2906002)(186003)(26005)(6666004)(478600001)(86362001)(33716001)(9686003)(316002)(66946007)(16526019)(66476007)(4326008)(54906003)(6916009)(66556008)(956004)(5660300002)(83380400001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: G67beNsrypf7mOVi32M47JFf6a8q7L4898PNExyUcDbR9XTI6mNcXgTYBnnFpkM8MW647hnTD7eZusj5ab2eH6omjMmyBoSDqKE8OyvmPE554bDEG6PYyHWmu3gv/hkPT+Uk6zJLW3Z1G9QSR+YnqBAvdjO2b9h98fZvmwhnPB5Gcper49/uzrFv22wYbtgp5VOFdQzKEKSubWKC37WJjWOCqkUQz50YpNPF6ITx+AynmTFWjHks+d+oe//3fs30IGaL840BdDXV0NR7eL/3tUoLp/CaI30QY8gERXylPBegTur1zKmquCfpcxPWze4j75vXJ5bXicWFo+dmL781eeBy/1avwm6b960RGgMH9mbGy1QqgqtJEphVRnqOVmlDhjo5yhmT8LmKZPHpyOdXXThk8O0b11MACWvwxN3BqyorEbGSvIiOOhK3HQ2PjIatn72O3ohpWFQQeFi/R/iATV5zfbYpoUHQjzvqzJyCAISquSO6odmZt1+MLP6QW+n37y3BinQRAZgvyGcbgKEiqfqPt6Sje4KT2c2dXJuQ9ToZtSLFd3JHLcVPNSQprDtt0YVqRvk9k5Stf8KA0ReejJkAfiLGNObgvGAvSnA4hgT58+vjgqqqxeAwEKyNRm3eLfbjQ1aqPzKCuLBsPAnbMQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763332ca-86f9-4e82-b1e7-08d8555e9a39
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 07:53:27.9612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzsbWQezdUiuBLWbpRGDULjhLdAWT6377JHL4VIKxOgsbrtzOzYXu9NyDrKRvaosgSMyNasO5txgKpFJYe0r1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1309
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
Cc: "Yong.Zhao@amd.com" <Yong.Zhao@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTAsIDIwMjAgYXQgMDM6NTA6MDZQTSArMDgwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBJZiBLRkRfU1VQUE9SVF9JT01NVV9WMiBpcyBub3Qgc2V0LCBnY2Mgd2FybnM6Cj4gCj4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9kZXZpY2UuYzoxMjE6Mzc6
IHdhcm5pbmc6IKGucmF2ZW5fZGV2aWNlX2luZm+hryBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2Vf
aW5mbyByYXZlbl9kZXZpY2VfaW5mbyA9IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBBcyBIdWFuZyBSdWkgc3VnZ2VzdGVkLCBS
YXZlbiBhbHJlYWR5IGhhcyB0aGUgZmFsbGJhY2sgcGF0aCwKPiBzbyBpdCBzaG91bGQgYmUgb3V0
IG9mIElPTU1VIHYyIGZsYWcuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFu
Z0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2Vp
LmNvbT4KCkFja2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gaW5kZXggMGU3MWEwNTQzZjk4Li5lM2ZjNmVkN2I3
OWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gQEAgLTUw
Myw4ICs1MDMsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyAqa2ZkX3N1
cHBvcnRlZF9kZXZpY2VzW11bMl0gPSB7Cj4gICNpZmRlZiBLRkRfU1VQUE9SVF9JT01NVV9WMgo+
ICAJW0NISVBfS0FWRVJJXSA9IHsma2F2ZXJpX2RldmljZV9pbmZvLCBOVUxMfSwKPiAgCVtDSElQ
X0NBUlJJWk9dID0geyZjYXJyaXpvX2RldmljZV9pbmZvLCBOVUxMfSwKPiAtCVtDSElQX1JBVkVO
XSA9IHsmcmF2ZW5fZGV2aWNlX2luZm8sIE5VTEx9LAo+ICAjZW5kaWYKPiArCVtDSElQX1JBVkVO
XSA9IHsmcmF2ZW5fZGV2aWNlX2luZm8sIE5VTEx9LAo+ICAJW0NISVBfSEFXQUlJXSA9IHsmaGF3
YWlpX2RldmljZV9pbmZvLCBOVUxMfSwKPiAgCVtDSElQX1RPTkdBXSA9IHsmdG9uZ2FfZGV2aWNl
X2luZm8sIE5VTEx9LAo+ICAJW0NISVBfRklKSV0gPSB7JmZpamlfZGV2aWNlX2luZm8sICZmaWpp
X3ZmX2RldmljZV9pbmZvfSwKPiAtLSAKPiAyLjE3LjEKPiAKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
