Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B7427708E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 14:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DBF6EAC8;
	Thu, 24 Sep 2020 12:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A0F6EAC8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 12:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUIs/akS9dSf7wjWGixw0SATmFA51cbGpwBYDEU75p+u+PFV+FDQiO/zCrLLxf9x9LWfXl7wnz8GaGPt0FCFbcH50XBOHnCUXBAsAo6kaX3Sa+fERAfxoehSamIwqP0C2MOvcUyZv/IItFkHXUDIXxJ0Wudzobx9GwFvxVpDpIuBZmP6XGYegw8o/vwXXk9wIoB89vrEB8HsAotkJcC8Da9LgTrZdGvQwsw1nnfNfeVd20EmldfdeP+5g2KHDL7F7yg3JkcisPw0Jro3elQSSGEs4s4JOqQ1tcc3vfH18R1b7eARcS5mZ/xA3zs5IpJHyJCTQrGZfYwiI97ByBhC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAnUPP8BS5YEa7migXZWM4t3ajmJpZiXPDvmN/hNU7g=;
 b=J0AGaXBRIrqekIDxlGUo2wLlkRsH55ZEtCOXLvxKMyuuiTGTYeIbLQXL5nP8w8LXDxZ4GoT+dmGUozvvy818w1g4eANFNjB8LPzJX588qNlZe+5DjAQ+LzlB0rKcuFx29DX/kQ/oxvrqQENLtyFO6eBsPzHmPo7ijTkhgLxBIxCykiNPfxCddMUE5Hbpxz2YyR0R52T9tdwzNz7Eni2cqNy0e2R1QDGxIPdOGT6YrxFaqfueTG03j/+YOKJBHpAYNtXv1eHUh/wpBsh22J6M+zb7FBTlUXtkFTCD4QKOvN87CwYqlpxE0hrA34Sh+KzTW9qInzfnJhMD5VICYs1oug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAnUPP8BS5YEa7migXZWM4t3ajmJpZiXPDvmN/hNU7g=;
 b=0XGsd1vOROBrJWOh1t+nnGGSaoPdgcuxnILMuvkJHqemRNKXjxWCHRWbN7dlnYjkqOqScc3xogBJHGgyh7sgTHvY1KRxkHghXr2fbX2XKBXlvm0XejAN0QhpnoWAipMfiLMQLMJzEswF0qsdW0TJc8As/tBrkvJ8BZoenV13E5U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 24 Sep
 2020 12:02:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 12:02:16 +0000
Subject: Re: [PATCH 14/45] drm/ttm: add move old to system to drivers.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-15-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <800449e4-b32e-4155-8233-2b249cbfad7d@amd.com>
Date: Thu, 24 Sep 2020 14:02:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-15-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0083.eurprd03.prod.outlook.com
 (2603:10a6:208:69::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0083.eurprd03.prod.outlook.com (2603:10a6:208:69::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 12:02:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: decf80f4-ef62-409f-974e-08d86081ae4b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:
X-Microsoft-Antispam-PRVS: <MN2PR12MB395078AD89AB1FF826AC75E283390@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fNooGyxCqRuqHmec3QdoPSAP3f0UaGSzEdf3YTUWcedUkrGJ9Wls1X/OkNP86qN23ijyHXRgUhy6sFjiEsmQ+ovrmyfxhoIz/jT86Rv/qWgkb6D7DJQSJ+ShqCFl3Yky4wzqkP7/B48A7f7mPLYaM1y4Ih69OxOA4uLm9AR1Eod2ADp8vrvPoJAZHwRg+YqG5iEEEnSv4oSuSoeh70SiB6MRlUlvWOFR+iZGhbPTM2MpaaWcPaf3x3n6BzI2PW1LPdlpc/VRGCpOMo3lExxwF05WszfefG5jc50AtEmPSL1VWNN90yUC/ZF9t/tghiLMtaTCiOloMbmG4LoS4LpdItvJ/wj/zIaWQ+bJijAaLL5A9R4aCkFlsg5UjzniVnYwM6UWZscok/X/VdFr7/OYQUhwkZ6RxVDYfyo+v/ocABXjU/Y3AJaZoeqRfSyg8ujb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(66946007)(83380400001)(6486002)(31686004)(316002)(4326008)(66476007)(86362001)(5660300002)(31696002)(186003)(6666004)(52116002)(16526019)(478600001)(2906002)(66556008)(8676002)(36756003)(8936002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: DL+sD9hU2BhhNV2FUNklpcC/IgcUna4HkMyd/Nr8xEniqchp5+H+vBWqvrLjLeYaoujk4ZcYMlMeCYwkDw5zXIb3/XJyKaR1G2BCJTCD652tawCURoo9Q/XJh/KXNJEAVKzY04ZpIUxzYeHFFUz+pBzLvuTLNFJ/nITA3KTyC0r93KfViHo5h4WvPfFzZXpieX+6lyvXwt2RBTcqi4mX4fT5OJEsrgufMuPTonTb7eWE7yrzxRVBy5aAofL0Yao04CZydme0idMKgjt9XSx50w6TMGhJ4fYAG68JCrQI4atUMpYaEBqHx50+WUekz8D8KT700KP2Korv9ykwU78PeIS3CgMvfV7bXh5ljHVe4iW45LcfbabTZ44tCnNtNhvlwoevGgUFBUCzFOpSb1sEWHFga0G30H3mTfTEfhzypjMnLgmBNSGVdFjXegxwssEBN1EMV9ORuXlT79kon4ns8HsmFBD6aIDqswnQEnOXZK7CBpqyzgb2uIOiml+wKERV3eqaMSQFqSDRZZuwbmLJoTcgiAWGtv96r7+lQqbtRLMADchPQ+3WnBq6tYHjBO0LNpErbiFTGNL+2wN85YwF00+/kFbqyal+XC7TNCr+4og3Z63mOTwqajJ70D7qEEx+17FfKJSwDIh9ah8In1qqizwR4hv3ZpnTagC71Sct+JQhEJFTPI3CEpcqW3GtLYl6FPOZBiPcLDO9c7uFy1sqUw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: decf80f4-ef62-409f-974e-08d86081ae4b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 12:02:16.6601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGCPSyplZ4Zz1125ZjZmNe41uGPsbl/6TDdn7PhrH9Zi/IK9CTiJ5dwomgEMcmXq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDkuMjAgdW0gMDc6MTggc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVW5pbmxpbmUgdHRtX2JvX21vdmVfdHRtLiBF
dmVudHVhbGx5IHdhbnQgdG8gdW5ob29rIHRoZSB1bmJpbmQgb3V0Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgIDkgKysrKysrKystCj4gICBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgICAgfCAgOSArKysrKysrKy0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jICAgICB8IDEwICsrKysrKysrKy0KPiAgIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyAgICAgICB8ICA1ICsrKy0tCj4gICBpbmNs
dWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oICAgICAgICAgfCAgMiArKwo+ICAgNSBmaWxlcyBj
aGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4IDk2MGE5OWQ2NzkzYS4uZTIwY2UzODBm
NjI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IEBAIC01
NjgsNyArNTY4LDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X21vdmVfdnJhbV9yYW0oc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCBldmljdCwKPiAgIAl9Cj4gICAKPiAgIAkvKiBtb3Zl
IEJPIChpbiB0bXBfbWVtKSB0byBuZXdfbWVtICovCj4gLQlyID0gdHRtX2JvX21vdmVfdHRtKGJv
LCBjdHgsIG5ld19tZW0pOwo+ICsJciA9IHR0bV9ib19tb3ZlX29sZF90b19zeXN0ZW0oYm8sIGN0
eCk7Cj4gKwlpZiAodW5saWtlbHkocikpCj4gKwkJZ290byBvdXRfY2xlYW51cDsKPiArCj4gKwly
ID0gdHRtX3R0X3NldF9wbGFjZW1lbnRfY2FjaGluZyhiby0+dHRtLCBuZXdfbWVtLT5wbGFjZW1l
bnQpOwo+ICsJaWYgKHVubGlrZWx5KHIpKQo+ICsJCWdvdG8gb3V0X2NsZWFudXA7Cj4gKwl0dG1f
Ym9fYXNzaWduX21lbShibywgbmV3X21lbSk7Cj4gICBvdXRfY2xlYW51cDoKPiAgIAl0dG1fcmVz
b3VyY2VfZnJlZShibywgJnRtcF9tZW0pOwo+ICAgCXJldHVybiByOwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCAyY2I2MWVlYTk0ODEuLmE5NWQyMDhjNzZhMSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBAQCAtOTE1LDcgKzkxNSwxNCBA
QCBub3V2ZWF1X2JvX21vdmVfZmxpcGQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9v
bCBldmljdCwKPiAgIAlpZiAocmV0KQo+ICAgCQlnb3RvIG91dDsKPiAgIAo+IC0JcmV0ID0gdHRt
X2JvX21vdmVfdHRtKGJvLCBjdHgsIG5ld19yZWcpOwo+ICsJcmV0ID0gdHRtX2JvX21vdmVfb2xk
X3RvX3N5c3RlbShibywgY3R4KTsKPiArCWlmIChyZXQpCj4gKwkJZ290byBvdXQ7Cj4gKwo+ICsJ
cmV0ID0gdHRtX3R0X3NldF9wbGFjZW1lbnRfY2FjaGluZyhiby0+dHRtLCBuZXdfcmVnLT5wbGFj
ZW1lbnQpOwo+ICsJaWYgKHJldCkKPiArCQlnb3RvIG91dDsKPiArCXR0bV9ib19hc3NpZ25fbWVt
KGJvLCBuZXdfcmVnKTsKPiAgIG91dDoKPiAgIAl0dG1fcmVzb3VyY2VfZnJlZShibywgJnRtcF9y
ZWcpOwo+ICAgCXJldHVybiByZXQ7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBp
bmRleCA3Yjc3OGZjNzRmN2IuLjg5NDU1ZjJkM2JiNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3R0bS5jCj4gQEAgLTI0OSw3ICsyNDksMTUgQEAgc3RhdGljIGludCByYWRlb25fbW92
ZV92cmFtX3JhbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCWlmICh1bmxpa2Vs
eShyKSkgewo+ICAgCQlnb3RvIG91dF9jbGVhbnVwOwo+ICAgCX0KPiAtCXIgPSB0dG1fYm9fbW92
ZV90dG0oYm8sIGN0eCwgbmV3X21lbSk7Cj4gKwlyID0gdHRtX2JvX21vdmVfb2xkX3RvX3N5c3Rl
bShibywgY3R4KTsKPiArCWlmICh1bmxpa2VseShyKSkKPiArCQlnb3RvIG91dF9jbGVhbnVwOwo+
ICsKPiArCXIgPSB0dG1fdHRfc2V0X3BsYWNlbWVudF9jYWNoaW5nKGJvLT50dG0sIG5ld19tZW0t
PnBsYWNlbWVudCk7Cj4gKwlpZiAodW5saWtlbHkocikpCj4gKwkJZ290byBvdXRfY2xlYW51cDsK
PiArCXR0bV9ib19hc3NpZ25fbWVtKGJvLCBuZXdfbWVtKTsKPiArCj4gICBvdXRfY2xlYW51cDoK
PiAgIAl0dG1fcmVzb3VyY2VfZnJlZShibywgJnRtcF9tZW0pOwo+ICAgCXJldHVybiByOwo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBpbmRleCBlNzY4ODM4MzZlNmUuLjFlNzAxZGQxOTJk
MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBAQCAtNjksOCArNjksOCBAQCBp
bnQgdHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
LAo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTCh0dG1fYm9fbW92ZV90b19uZXdfdHRfbWVtKTsKPiAg
IAo+IC1zdGF0aWMgaW50IHR0bV9ib19tb3ZlX29sZF90b19zeXN0ZW0oc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywKPiAtCQkJCSAgICAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgp
Cj4gK2ludCB0dG1fYm9fbW92ZV9vbGRfdG9fc3lzdGVtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm8sCj4gKwkJCSAgICAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KQo+ICAgewo+
ICAgCXN0cnVjdCB0dG1fcmVzb3VyY2UgKm9sZF9tZW0gPSAmYm8tPm1lbTsKPiAgIAlpbnQgcmV0
Owo+IEBAIC05MCw2ICs5MCw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX21vdmVfb2xkX3RvX3N5c3Rl
bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCW9sZF9tZW0tPm1lbV90eXBlID0g
VFRNX1BMX1NZU1RFTTsKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiArRVhQT1JUX1NZTUJPTCh0dG1f
Ym9fbW92ZV9vbGRfdG9fc3lzdGVtKTsKPiAgIAo+ICAgaW50IHR0bV9ib19tb3ZlX3R0bShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkgICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9j
dHggKmN0eCwKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBi
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiBpbmRleCA2NjkwZWM1ZDkwZWMuLjY1
Y2Y4NmIzYmEwYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5o
Cj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+IEBAIC02MDUsNiArNjA1
LDggQEAgaW50IHR0bV9ib19tb3ZlX3R0bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
ICAgCQkgICAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgsCj4gICAJCSAgICBzdHJ1Y3Qg
dHRtX3Jlc291cmNlICpuZXdfbWVtKTsKPiAgIAo+ICtpbnQgdHRtX2JvX21vdmVfb2xkX3RvX3N5
c3RlbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICsJCQkgICAgICBzdHJ1Y3QgdHRt
X29wZXJhdGlvbl9jdHggKmN0eCk7Cj4gICBpbnQgdHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkJICAgICAgc3RydWN0IHR0bV9vcGVy
YXRpb25fY3R4ICpjdHgsCj4gICAJCQkgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICpuZXdfbWVt
KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
