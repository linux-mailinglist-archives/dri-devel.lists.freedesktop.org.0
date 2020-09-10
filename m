Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC2E263EB3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E716E29B;
	Thu, 10 Sep 2020 07:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB0E6E29B;
 Thu, 10 Sep 2020 07:26:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE45ANClbzGFVItJKvgZOiUCSeWefmf+fRUyGI0MxNgkANLN7r/vWHEYFIfepfP85Pdy5TMiClhOYdSUWnB9XcViJezcVpfab8SIZQllcTa6gun4C/wm3db24+dvvuuYFp5IjA9rRFLU/E2BGCalsPTofjaB3oiZUgrdsAOCllKNNUwxWTfVdK2JH+x9ED2rZyKZqIHo3bvGPGisfWeYzo3YdgR3ngWjqCzv4kbM2+Qk3We48oNeRwdcV3aifZ7IdmGeWx3QIJQODUlllyFAydpOgUzH+vPRAyBWHD8kOLvp8NqMAE7YL+SCsr/pjADhn9vej3HDtMqtwJy8LivI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1ZE0SK0D0IE7s2Zd07MnnbCBNFnEK75DaijWItx25M=;
 b=M6iz0pkYkkFxrydc3NDg+SfsVlfR7ZYmyR5PtwNAwfBTKJmsQNBNeas8EnY07rurAWgy69k1KGe6fIQtxinjvaW4ACajEe5P+3mqj7LOyQd0jDebXjGKZAi1lj93wY/pjla09neyDYeIemhsJka7ERszaE2ICSyRRxjUQuQcwN0wtVOpygZ+csWX8d56gncxr0o+hnJo6hoL1lIwbitPU1IHY7BE2Y9L+QGher3QGfs1pT1sSSaOqMeqv9J0VwtrKf0o8m7VmQlAkC5wZc/KQq1v+SzSwlchNlWLqaalwPBLPAgKSj4VnZ0IHEFGbzsEnhCJhV2GWGC0qyihtTKFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1ZE0SK0D0IE7s2Zd07MnnbCBNFnEK75DaijWItx25M=;
 b=Kqi1+lXrg0zDoyfeQ1e57pBCIH0xKq+xWvU7w8W8QRzH+wQR3dfJQ5UWiNDVgwTbYSB2UHYB4DmRnmPKWy3Yz88JMLj0HkVIfujBxJcsOCSjMnKQy5SwzmbatoAC3B8l+3AWBMBDxl76730MFnUlECtUu1WoNUlky8/59UzmqzY=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1597.namprd12.prod.outlook.com (2603:10b6:301:e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.19; Thu, 10 Sep
 2020 07:26:44 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::e881:6ca2:c1d7:48e6]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::e881:6ca2:c1d7:48e6%7]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 07:26:44 +0000
Date: Thu, 10 Sep 2020 15:26:33 +0800
From: Huang Rui <ray.huang@amd.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/amdkfd: Fix -Wunused-const-variable warning
Message-ID: <20200910072633.GE2472906@hr-amd>
References: <20200910025532.19616-1-yuehaibing@huawei.com>
Content-Disposition: inline
In-Reply-To: <20200910025532.19616-1-yuehaibing@huawei.com>
X-ClientProxiedBy: HKAPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:203:c8::15) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HKAPR03CA0010.apcprd03.prod.outlook.com (2603:1096:203:c8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.5 via Frontend Transport; Thu, 10 Sep 2020 07:26:41 +0000
X-Originating-IP: [58.247.170.245]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29ddcedd-1c1d-4794-c9d0-08d8555ade6a
X-MS-TrafficTypeDiagnostic: MWHPR12MB1597:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1597CC173EBC270DD068778DEC270@MWHPR12MB1597.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LI1+KT1d/Lttd81YouMhEl74UDaK22K3ucgxIIfRP/i5hnSby/xBhTg2CwzGk1aSmR1hDKUwrZjN+FRArGw17oongDJXXePo+e5o5IX+aV7i/HJ4dmY1PmKbM9I+fEq6qGKuurtSks90Sh2djFQiDQIHSqBkKj/ipg5EmVLGcPzZd5sHzeNLgBwh7UiQemhpzgr5fbRvmYZqWbzGY2PCS+zdOQxzkN9UQl/27cGaJKUI4+eFpjA2hFvvGm4kG41nUVKYsZz9cCiS/vjYaCrshkXLAbHBTg41V4+pA5HLiJBg98v1iQLzzx+NDh/fCIQ48Zn+RnlYY0Yl76GAt4obojQEHM9PE9+RjJBC8FOuYG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(66556008)(83380400001)(33716001)(26005)(66946007)(33656002)(66476007)(6666004)(1076003)(45080400002)(8936002)(6916009)(8676002)(5660300002)(9686003)(6496006)(86362001)(2906002)(966005)(316002)(478600001)(16526019)(956004)(4326008)(55016002)(186003)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qyMfUbc7dy0jDfnq91jUiTR+2++bXL4PteBrrvVEu5dWsiDfDq3qI3aep6D7rmSsnZr1ChVSmVWzkmeR0mkrbKhf6XdJ5IBqWxsjaWoLorrLuvNmNMXEOnweVsGj0kY/TQQ80Yr1PgVUI9sMlK88NVpWCVuQyb0K9JIVjPBElbn7SJ3UEJpFkkWDZK4mPG2d5BtBfO1zVLLBC3y2bY62fkf5fEzw0zew+bbRlzp2jMXHSgF9j/ne4rD+ktcSWYeRAX3v9ZkelXFtYJiCP3H1/dRlaUlmJJeCq7Kyd3wYHKhxC0xortslXKBgy5Syf4zfQKEAiaNox364+REsIX3gdixFumQ7CzYPb9Qy2YX8PPRT3kfKTyyHUKh60M9CBPU1x3WGL5TfPYm2RxfMp8HVapiPvO6OYlEEFbx9m4boOqz2oNyzziFaeYipI49xvVM9/w4Vfa4VBKu7oIKh+VePdP3bOrEUXLezuPCncYhErCTeaS9Z2Vquy/rGoIHsC01TtdgbLp7bK9DJSJMAV9A5TqgPCawQSc4o8nvyJviBFtGx2YBiA7ftWIZ355CkfSpHdBXNocUKk5XluKWltiBAjI0OXCH7jeZGCxKWtWkayFHKuy5wF8G+QrdViFOGrV/NOGxemJtQzIQxs8TOsJw3Qw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ddcedd-1c1d-4794-c9d0-08d8555ade6a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 07:26:44.3511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqUsnpoO7MR02CBlGxH2WAZ7u2JLD6+0JorKY+MReln7fi075n1lbveKn3UmoUI0WQi+KfWXmmlBXccwx4OQow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1597
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
Cc: Yong.Zhao@amd.com, airlied@linux.ie, Felix.Kuehling@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTAsIDIwMjAgYXQgMTA6NTU6MzJBTSArMDgwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBJZiBLRkRfU1VQUE9SVF9JT01NVV9WMiBpcyBub3Qgc2V0LCBnY2Mgd2FybnM6Cj4gCj4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9kZXZpY2UuYzoxMjE6Mzc6
IHdhcm5pbmc6IKGucmF2ZW5fZGV2aWNlX2luZm+hryBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2Vf
aW5mbyByYXZlbl9kZXZpY2VfaW5mbyA9IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBNb3ZlIGl0IHRvIGlmZGVmIGJsb2NrLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiAt
LS0KClJhdmVuIGFscmVhZHkgaGFzIHRoZSBmYWxsYmFjayBwYXRoLCBzbyBpdCBzaG91bGQgYmUg
b3V0IG9mIElPTU1VIHYyIGZsYWcuCgpZb3UgbWF5IHdhbnQgdG8gbW92ZSByYXZlbl9kZXZpY2Vf
aW5mbyBvdXQgb2YgSU9NTVUgdjIgZmxhZyBpbiBrZmRfc3VwcG9ydGVkX2RldmljZXNbXVsyXSBh
cyB3ZWxsLgoKVGhhbmtzLApSYXkKCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwo+IGluZGV4
IDBlNzFhMDU0M2Y5OC4uY2FlNGRmMjU5ZTI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2UuYwo+IEBAIC0xMTYsNyArMTE2LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBrZmRfZGV2aWNlX2luZm8gY2Fycml6b19kZXZpY2VfaW5mbyA9IHsKPiAgCS5udW1feGdtaV9z
ZG1hX2VuZ2luZXMgPSAwLAo+ICAJLm51bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lID0gMiwKPiAg
fTsKPiAtI2VuZGlmCj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyBy
YXZlbl9kZXZpY2VfaW5mbyA9IHsKPiAgCS5hc2ljX2ZhbWlseSA9IENISVBfUkFWRU4sCj4gQEAg
LTEzNSw2ICsxMzQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyByYXZl
bl9kZXZpY2VfaW5mbyA9IHsKPiAgCS5udW1feGdtaV9zZG1hX2VuZ2luZXMgPSAwLAo+ICAJLm51
bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lID0gMiwKPiAgfTsKPiArI2VuZGlmCj4gIAo+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyBoYXdhaWlfZGV2aWNlX2luZm8gPSB7Cj4g
IAkuYXNpY19mYW1pbHkgPSBDSElQX0hBV0FJSSwKPiAtLSAKPiAyLjE3LjEKPiAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9u
YW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJG
bGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFt
cDtkYXRhPTAyJTdDMDElN0NyYXkuaHVhbmclNDBhbWQuY29tJTdDZTg4MDVmZDQzZTlhNGFkMzNj
ZDAwOGQ4NTU1YTU2N2ElN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0Mw
JTdDNjM3MzUzMTkzNzk1MDM0MDUyJmFtcDtzZGF0YT1IcVVHalVwUXRmQ2taM3dBMSUyRjZIVENa
cm4lMkY0JTJCdVFPUlRvYnphSVlhJTJCTnMlM0QmYW1wO3Jlc2VydmVkPTAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
