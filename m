Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2171B1D5E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 06:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A98E6E296;
	Tue, 21 Apr 2020 04:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC486E296;
 Tue, 21 Apr 2020 04:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGbGp+uYwaGicVM4nsaF0yoUO7keluSj0BUukqAOz7z3Lo+Hl5L35bBaOAifUumUYzkEByIhZv34a6mt5u+tYQovZZquLBIrMmp948R1KGyku3qpQEh7Nr6Zjt3BqtEUdw94Up1YteSkiVRsvkIsJoAOZEaesWXeLa4PQQeWKyZj2/1Z69vdHgR9KBSfpFTokqEeDHeI3Fchrh9osQ124fJ1iHOyEBaPSA76OKYNoipNUvXtxEFmTg1SXexeyC+xFsuhFr1cLxVi5FjLLpCtOTF8iY57VdMLgg2MXKJQh3FDIWnH4bDa5dB/N8Cvik6mJsu5tYNcIMcnJy4fZZO/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aD5NizHRGj0I9gxECMqK3hkrXrT+bz07WHXVMFTolVk=;
 b=b5re075T6maFL7KlyAU34QW7w/DbBsQtRPjbFR8hV2ekJGlBmz4TiaXPqA9bFihpET8gmqgDS6HQQOIWhviZOfwYe71SbTSQWao5AX/1GudtHgoNPY3EB9TdLiLIYMduN0lcMZjKAmSFFFiPg8qipxZpSLq/IWuOaa721O6Pto5P5LITc1JDaVGSUEqGGg0xHudlhkpXJeP0PgBhlLxqaSw5X6MtAosT5zmgDrZFBQLPj5+HQzzynStvwpqHK90duNtEb7rIRC1cIjGii472XuSC8cmj6irT92ajtagaADnKfab2jwjKdH4DrtPvcvR70lgw8ciBMRDDLUz4nrqG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aD5NizHRGj0I9gxECMqK3hkrXrT+bz07WHXVMFTolVk=;
 b=oEFuCFGOOzxx9GJY9IrJGLf/lXh2NTOZ4/y+4aspbtI26izgSimeFhwUzXYHz4S1RWk1JrbOhE0GkciB21MtdTyHKnXbQr3T22Rcti+1Y19gnzRx/rzpw78BSx56pAqHzlnAgqBQjlVb7a0F4lpUsAcMLGRdm5LwGXnhYL0RENU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
Received: from DM5PR12MB2407.namprd12.prod.outlook.com (2603:10b6:4:b4::24) by
 DM5PR12MB1548.namprd12.prod.outlook.com (2603:10b6:4:a::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.29; Tue, 21 Apr 2020 04:24:21 +0000
Received: from DM5PR12MB2407.namprd12.prod.outlook.com
 ([fe80::7d36:4eac:2088:637f]) by DM5PR12MB2407.namprd12.prod.outlook.com
 ([fe80::7d36:4eac:2088:637f%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 04:24:21 +0000
Subject: Re: [PATCH V2] amdgpu: remove unnecessary condition check
To: 1587180037-113840-1-git-send-email-bernard@vivo.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200421024159.126753-1-bernard@vivo.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <7fe6eeef-3129-3e54-67a2-46eccca9f529@amd.com>
Date: Tue, 21 Apr 2020 00:24:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200421024159.126753-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::26) To DM5PR12MB2407.namprd12.prod.outlook.com
 (2603:10b6:4:b4::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YT1PR01CA0117.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 04:24:20 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 990e234a-2325-47d3-5e4b-08d7e5abdd32
X-MS-TrafficTypeDiagnostic: DM5PR12MB1548:|DM5PR12MB1548:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB154840A2A45FBB18FED246AD92D50@DM5PR12MB1548.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2407.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(16526019)(956004)(2906002)(5660300002)(44832011)(31696002)(478600001)(186003)(26005)(36756003)(86362001)(31686004)(2616005)(966005)(81156014)(66556008)(8936002)(16576012)(6486002)(52116002)(110136005)(66946007)(66476007)(4326008)(8676002)(316002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2IZ0OOX7LFD3OjvGaQvxPsGlz55U4rgOTMHlkvro4soabEEdDFX1ArFv7OPxE91JCQhQQIZfwGO4OlMzUW5vgnxLlGyb/viEeZliu7msDTsskAwSxT/oS93MLCaUBlDnqtABfgU8tVwsfRZIzju1pR2rwD1Wke42N/OJwIjr4ZOjZZ7I+CjariLXGb0p0S4ANQIMm34w0h+PQ5d5bdm2tWYJSnNCh3qSynq9/XQ9kwqIfXvL1m4aL4pK21edrUrotULKsAQChICfxLSOnnW182S2SVuJ9MF8Unq974AYd9iZsE5wz11N5Hme+58NmmnzmUJ/tcFz2oRD7YDr9xIsboh/n+CJTr38pFpDTMtbHYLfb2JtYJesGtmAPg0CBKnslWOvKB7UggTOGqD+dMMlokzixkBIYsPUvApQpBEFWh8GciMRrPjA9IuDRVLM8ce8bY2dc0Pj/Sf649YpZhzXrT0W5qMOSC7KLJxEGRSOCyft0V2BDt+k4tNhdThno+viz0OZDCgZTcuq70A0mrf+bw==
X-MS-Exchange-AntiSpam-MessageData: o5dYl1/jTuWpYb5bkSYLXyKY/0uwsKtZ5nVvuNvmcIrsgFvekYp/5qRrsXFUPw+cbw7WztMxxtdC3LGz7SpWckIuRiHRX2XPFDrGzxOnMnCYIkcSA7iwkIIRVMUoe3UNpf1q9Yh65KadQkmrsBFckw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990e234a-2325-47d3-5e4b-08d7e5abdd32
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 04:24:21.0947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVrIoCOqNiQObYKJ46RRGAbL6osF/U7U7F93dzY+AGJZ/xlup7kINFTJMdK9BHWYmvhjoifABLGbl1Sh24X0pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1548
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmVybmFyZCwKClBsZWFzZSBzZWUgY29tbWVudHMgaW5saW5lLgoKQW0gMjAyMC0wNC0yMCB1
bSAxMDo0MSBwLm0uIHNjaHJpZWIgQmVybmFyZCBaaGFvOgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8g
aWYgY2hlY2sgYWdhaW4sIG1heWJlIHdlIGNvdWxkIG1lcmdlCj4gaW50byB0aGUgYWJvdmUgZWxz
ZSBicmFuY2guCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5j
b20+Cj4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIFYxOgo+ICpjb21taXQgbWVzc2FnZSBpbXByb3Zl
Cj4gKmNvZGUgc3R5bGUgcmVmYWN0b3JpbmcKPgo+IExpbmsgZm9yIFYxOgo+ICogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEyMjY1ODcvCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8IDE2ICsrKysrKysrKy0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMKPiBpbmRleCA5ZGZmNzkyYzkyOTAuLmE2NGVlYjA3YmVjNCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiBAQCAtNjYwLDEz
ICs2NjAsMTUgQEAgc3RhdGljIGludCByZXNlcnZlX2JvX2FuZF92bShzdHJ1Y3Qga2dkX21lbSAq
bWVtLAo+ICAKPiAgCXJldCA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJmN0eC0+dGlja2V0LCAm
Y3R4LT5saXN0LAo+ICAJCQkJICAgICBmYWxzZSwgJmN0eC0+ZHVwbGljYXRlcyk7Cj4gLQlpZiAo
IXJldCkKPiAtCQljdHgtPnJlc2VydmVkID0gdHJ1ZTsKPiAtCWVsc2Ugewo+ICsKPiArCWlmIChy
ZXQpIHsKPiAgCQlwcl9lcnIoIkZhaWxlZCB0byByZXNlcnZlIGJ1ZmZlcnMgaW4gdHRtXG4iKTsK
PiAgCQlrZnJlZShjdHgtPnZtX3BkKTsKPiAgCQljdHgtPnZtX3BkID0gTlVMTDsKPiAgCX0KPiAr
CWVsc2Ugewo+ICsJCWN0eC0+cmVzZXJ2ZWQgPSB0cnVlOwo+ICsJfQoKSGVyZSB5b3UncmUganVz
dCByZXZlcnNpbmcgdGhlIGlmIGFuZCBlbHNlIGJyYW5jaGVzLiBUaGlzIGNoYW5nZSBsb29rcwpj
b21wbGV0ZWx5IHN1cGVyZmx1b3VzIHRvIG1lLgoKWW91J3JlIGFsc28gYnJlYWtpbmcgY29kaW5n
IHN0eWxlIGNvbnZlbnRpb25zLiBUaGUgImVsc2UiIHNob3VsZCBiZSBvbgp0aGUgc2FtZSBsaW5l
IGFzIHRoZSBjbG9zaW5nIGJyYWNlICJ9Ii4gSSdtIHByZXR0eSBzdXJlIGNoZWNrcGF0Y2gucGwK
d2lsbCBjb21wbGFpbiBhYm91dCB0aGlzLgoKCj4gIAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+IEBA
IC03MzMsMTUgKzczNSwxNSBAQCBzdGF0aWMgaW50IHJlc2VydmVfYm9fYW5kX2NvbmRfdm1zKHN0
cnVjdCBrZ2RfbWVtICptZW0sCj4gIAo+ICAJcmV0ID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygm
Y3R4LT50aWNrZXQsICZjdHgtPmxpc3QsCj4gIAkJCQkgICAgIGZhbHNlLCAmY3R4LT5kdXBsaWNh
dGVzKTsKPiAtCWlmICghcmV0KQo+IC0JCWN0eC0+cmVzZXJ2ZWQgPSB0cnVlOwo+IC0JZWxzZQo+
IC0JCXByX2VycigiRmFpbGVkIHRvIHJlc2VydmUgYnVmZmVycyBpbiB0dG0uXG4iKTsKPiAgCj4g
IAlpZiAocmV0KSB7Cj4gKwkJcHJfZXJyKCJGYWlsZWQgdG8gcmVzZXJ2ZSBidWZmZXJzIGluIHR0
bS5cbiIpOwo+ICAJCWtmcmVlKGN0eC0+dm1fcGQpOwo+ICAJCWN0eC0+dm1fcGQgPSBOVUxMOwo+
ICAJfQo+ICsJZWxzZSB7Cj4gKwkJY3R4LT5yZXNlcnZlZCA9IHRydWU7Cj4gKwl9CgpTYW1lIGFz
IGFib3ZlIHJlZ2FyZGluZyBjb2Rpbmcgc3R5bGUuCgpUbyBtaW5pbWl6ZSB1bm5lY2Vzc2FyeSBj
b2RlIGNoYW5nZXMsIHlvdSBjYW4gbWVyZ2UgdGhlICJpZiAocmV0KSAuLi4iCmNvZGUgaW50byB0
aGUgZWxzZS1icmFuY2ggb2YgdGhlIHByZXZpb3VzIGlmLgoKUmVnYXJkcywKwqAgRmVsaXgKCgo+
ICAKPiAgCXJldHVybiByZXQ7Cj4gIH0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
