Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F8E362485
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 17:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D544C6EC5D;
	Fri, 16 Apr 2021 15:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760054.outbound.protection.outlook.com [40.107.76.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1980C6EC5B;
 Fri, 16 Apr 2021 15:54:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rj2syLTSmA2B/5Dlv0DxgYh3fLkLx5b96ApvD/xWLppg/TJqKYl1eR5WO/bXk/AFfphCA6v/9TL+vugVW4dYIgXZ6t1oejnYXS8ogQuyFCJeHbXlYqnkhOArJVvMzOaMxVPdP/h9yF0D1QeL1EjDkxBKcxgtE0T0XLoFwiyiKJQwx94/Rp5p+sFANwZCzolia0fHgY8ZAsKpDskIIobjyDmKy0Bg+eieuseUqgrnsd6/oG3ICxy526QsH/joI9StavSJtoh/ILT9PQfIAjDmB8e8Kk34jRwvmKG/cEYdFJr0vjHGtb1fVG0B1B9NlNHNDkHDiJfBYz719sWPwCFcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeTyYgDsRHam85sy8LLI25y8/t2GnLjOuFQ49B2dPfY=;
 b=gwRynA2Snortg7gLOvWc0IciqbR8NTTEbkMCokgamKSVrCnIGCpipiGReuSb3bXvRA0nnTT4Kfj1oPQ8txp8iafmf7AtA4OXDo+bPN0EAse1RUDUY7KmA6whcLfsCFueHLJIdy34Nhf5x206y4BxGHteXVhds1i7CDOJf2Mn+DeFvNJKgHVsRvHk+OArUNlB7+zCvp4vitQNxfwMbzo+Mc2l7Rvwp9aQy62tg+b7cF34Ce1LMCa14MZIq9IhrOugawW/gmKBOr18pefGOWPdKIJm4JSD7ZEvBgVfkBxXUgLVhZkgox9uEJN0VCwat3VTcbnlLMPchNe9mO8iKk0w/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeTyYgDsRHam85sy8LLI25y8/t2GnLjOuFQ49B2dPfY=;
 b=ZKH+yS6WPa6zyQkgPs2vNVfqRFFjeTFNolF3eiuzGjfu6Hbj8lTQgKDorR6WckHH9D3SImJRjfM+lNNDq2DP9u71LLVVg1l01uOT6wETC7dMRBYfUokacqEmS+1kjOkssXdRIUbG9eQj0vOcd7vao7cY16GCH8hDl4mYsk/b+C0=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 15:54:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 15:54:12 +0000
Subject: Re: [PATCH 33/40] drm/amd/amdgpu/amdgpu_ring: Provide description for
 'sched_score'
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-34-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d44d2325-4cba-2927-d5e9-1d8e0ab1649c@amd.com>
Date: Fri, 16 Apr 2021 17:54:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416143725.2769053-34-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
X-ClientProxiedBy: AM3PR03CA0067.eurprd03.prod.outlook.com
 (2603:10a6:207:5::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
 (2a02:908:1252:fb60:5d8d:1198:63ca:8fe4) by
 AM3PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:207:5::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.17 via Frontend Transport; Fri, 16 Apr 2021 15:54:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dcf1860-9c4b-4fa1-31b9-08d900efe0f0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3696:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3696524479D26C0A9F43FFF0834C9@MN2PR12MB3696.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: py2A7gfvmXIQMYlKkt0Y9LjRPlXOR+UZFGtNsvdrAVDXZJPWIcWYdeEUHC2u6ga3bhcgyt43pIRapzn/Ebkv7kH2/9Q1Kv4T+7bOy5OmgrHsomGv/LJXBGG9ukw0ws2PUTwSLUNZs3gnMJH/8TiEieeYlk/wY/U+ttEQMaPT7jZ8aS16srkTPEOuUbbi4ezJVCPmkozxuUSD0YpT6uFrfqy4+YJ/d3aZAoUR6XYIA2ZzzxgWL24wahk5wPY4PJh3zqXWSlNZLMGx3Md2/YKJejgE9hne9/tFsQBp0md7FlX5qfkwnwqB1kb2nqSuO3ccL9gGJpRelvDWK0Hkeb3iciXOjLqorBP+IzfYhGXgXNK86TybyWK/8dEua01wtUUMJAigLiAefMp2s3pEaHit8e4lsw523D+e338q+AccSSv1mxzLnMFURApoa+nVGA8342hZzn4MrZkTje2v5Jwgmp+TwWDPtmFdfW7WnsSFYD2iTxftkQReTA6SXr4xFGdKXhvbqpTWWQr9V0T+F5lBO1uEL7btg4bw6Ec50tponpSLwAUxaWnsm5E7s/qd3uiHildQrzAtGao+y+qUcKWzByH62APlgGRukeWq+2H/RRqQK0f6egziBn9YIlrzxwwWoPeBr3j011KOxaBE3PajES2jyJadAxYjp2i0D/N+35uRJ5lCgP5jg/fLOW3qW+o4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(5660300002)(31696002)(478600001)(4326008)(8936002)(86362001)(66476007)(66574015)(66946007)(66556008)(6666004)(31686004)(2616005)(6486002)(2906002)(54906003)(186003)(16526019)(316002)(8676002)(6916009)(52116002)(36756003)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NTFjaDNPVjF5SFo5MTVuUitpbkdVMjJvQUxSRHZScGduTG9Oakh6MWtYamVY?=
 =?utf-8?B?VE93cUdSUmhjaGs0UTZQVDNGSEpuSm9oaVl6T09ycHQ5WVAyVERSOEt0ZzNo?=
 =?utf-8?B?UHNiZWhYQ1FoUzhSRy8rQVN4YVh5R1J0c0N0RW1TTWxiU2p4ZXhqNWgxdlRI?=
 =?utf-8?B?L1JpUm5UVjduajRDM1d5THNOWVJZRTk1eUxXamhoNVhaSmNoeU1XTEZtSjNJ?=
 =?utf-8?B?QjRVazQ3SWdaVE0zejZZV3hmU3pIZ0hkdzkveFI5NU5IaVhJN3Nad1BvWEh6?=
 =?utf-8?B?eUwrV3hBT21YRVdJcnM5VUhLaEJIaUpLZktXUjY3a3VZQ3NjcDJRU2NhWWpv?=
 =?utf-8?B?a1BrQlJHTVRTR0ZCTHIwN1lPY05ESmZYbUlWTlhwelhsdVVZTGZIYm4ranBN?=
 =?utf-8?B?enlzTVg3amFsVkFRNTBzL095TWZVRDdkbncwZGZncXBUZnJHKy9YaG5JdEkw?=
 =?utf-8?B?WXdNZndCb1piQ2E4UTJtOUY1RHVIb3RWbE1qL0RZWWxic3NuZVBpaEx6MGVa?=
 =?utf-8?B?NnZFV0F6SzJqc3d1QjRuMENTYkJ1c2RjVjJzTWV4eXR5U1BQNzBRb1gvdFhn?=
 =?utf-8?B?dFY2di9NMDBjS0VRandzT1J1bExvS3RuZ00vVjk0aDlUME0yN0dldHJWdjVY?=
 =?utf-8?B?L2tIcGM0ME1JVlhqNUJZdjlxendJUTh4M3lRZzJWdk5jMmlraE5EbTF6dU5C?=
 =?utf-8?B?U1FRYUFobm56VEpKWDZ0aHJqT0tQTnpaUFQwRXg3YWZSVWJPOHJrbzlTVGtZ?=
 =?utf-8?B?WjJZWElJZk1sRnc4YzdJcnVHV0pYc1ZKYUMwUSs5NVh2WjJNcmUzMHFuRFRC?=
 =?utf-8?B?QzFGZ01WYU02RDNyN3VuT0dJMkpKbGtjTFk2L2JONjhva2FLM2oycEw0NmpC?=
 =?utf-8?B?STZhN1BMMW1Hbi9UN0xPcTN0cnc5ekRwc1ZSaTI4SnI1b0FiWEtrRGhDZm1H?=
 =?utf-8?B?R2ZPSGVaOGdrVW5jb1c3WXpBYTk0elZGeDNGUWt2YmFGTUFVVXp2VlhOR2dN?=
 =?utf-8?B?eDBuazAyQmtYNGlUdmptUE9ITHh4MlZKS1VVN3dHRWl5bWZJanFERDNuemZt?=
 =?utf-8?B?NGY3N3ZOY0YyK09kQ1RzVWFwOTN4WGhWSUlHbjhQKzI5T21jWWVlbHorc0p4?=
 =?utf-8?B?Wk1jRmU2OVdwOFRsZGtPZ2srNEFPQTBnOWM4Qk50bUR6dmdZT21hcFdnZjRs?=
 =?utf-8?B?aEozTDRTZUV5S0hKSW1HMlV5TDdLSGpxemQrT0RaZFdlRThXU3IxSG1WV29G?=
 =?utf-8?B?bXRIMzdEbFRtVFhjZGl4WjdEWW1DY0IvNitIdXlBR1hGamUvWTRaWVRtSmhP?=
 =?utf-8?B?a0hkeURjN3M2ZGN4MFAxQnNpZXVZQjRSQkkzT2JVWUN1RkcvbEdLK2EyeHlQ?=
 =?utf-8?B?K2NXUTAxZ2kwQVNZN2R0dzZaSFVDMWJYWmwzd3djK3ZTL0RQU1hyS05ickta?=
 =?utf-8?B?aEJIdHdud1pwWHNQS2FscXNIVFBHbjljWDN0RHdmUWZkQk40U0tkbGRqSm9v?=
 =?utf-8?B?ejVsR0NlVDNXV2NpTDBpUmxqa0hoRE4vN2tOc0xKS2VMc2FiYXd1cGZuallR?=
 =?utf-8?B?N0NoRW5ieEZOVFgxM2pNemdUUTRjVVgxT251TnhVTm9LT0ZkUlJNbEFqbFRk?=
 =?utf-8?B?Y1NQUXovRlZyQWJrY250Mi9pc2xnd3U2MzhqVVpmajQrc0RxK0M4MThScGor?=
 =?utf-8?B?VVp0N1N2M1ppMzh3UnQ0RzNZSENMelNidG9xa214OGZRaExzb2pJMWJPdVNV?=
 =?utf-8?B?NUQzdmh4ZEIvaGNlVnZveklqMEtidHFzTE9BRDkxOElHUnQySVVLRjNpUERk?=
 =?utf-8?B?UkxwOFNBYjVqeXByRm91WHcrMWJUUFhjUDhveVl2ZHRXT3g0NWVZZVJmeHlN?=
 =?utf-8?Q?qkCf3sVipUkZq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcf1860-9c4b-4fa1-31b9-08d900efe0f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:54:12.2406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0kkWAIbk8vtPpR1e361eyCLxEE70HKIIVQlsJISUX0tkbOv26YjEjT3v46twN6U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDQuMjEgdW0gMTY6Mzcgc2NocmllYiBMZWUgSm9uZXM6Cj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmM6MTY5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdzY2hlZF9zY29yZScgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3JpbmdfaW5p
dCcKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGlu
YXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3JpbmcuYyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jpbmcu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMKPiBpbmRleCA2ODg2
MjRlYmU0MjExLi43YjYzNGExNTE3ZjljIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmluZy5jCj4gQEAgLTE1OCw2ICsxNTgsNyBAQCB2b2lkIGFtZGdwdV9yaW5nX3Vu
ZG8oc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQo+ICAgICogQGlycV9zcmM6IGludGVycnVwdCBz
b3VyY2UgdG8gdXNlIGZvciB0aGlzIHJpbmcKPiAgICAqIEBpcnFfdHlwZTogaW50ZXJydXB0IHR5
cGUgdG8gdXNlIGZvciB0aGlzIHJpbmcKPiAgICAqIEBod19wcmlvOiByaW5nIHByaW9yaXR5IChO
T1JNQUwvSElHSCkKPiArICogQHNjaGVkX3Njb3JlOiBvcHRpb25hbCBzY29yZSBhdG9taWMgc2hh
cmVkIHdpdGggb3RoZXIgc2NoZWR1bGVycwo+ICAgICoKPiAgICAqIEluaXRpYWxpemUgdGhlIGRy
aXZlciBpbmZvcm1hdGlvbiBmb3IgdGhlIHNlbGVjdGVkIHJpbmcgKGFsbCBhc2ljcykuCj4gICAg
KiBSZXR1cm5zIDAgb24gc3VjY2VzcywgZXJyb3Igb24gZmFpbHVyZS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
