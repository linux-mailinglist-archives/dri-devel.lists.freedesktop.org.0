Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DAD2F2109
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 21:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9F189D2F;
	Mon, 11 Jan 2021 20:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96F589CF6;
 Mon, 11 Jan 2021 20:45:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DylGmCi4evCfZWBvZdBkFFZcxiQTuL39m+liB0rYgJxcQXtHx8yk2ZLcCGJxV2NZ5FsGPD4H7V1HOGNZDVEUyoU70Gxp5CXbr29XGpyl8fd0EHJ0+7vponkH2H9OLudMOfBDx3HYo9pse/W/jLU26O/nw/pGlyM8G74REgw4OmWKzURsvyH8+/kU393bEsWWMdF4K8h4KDIVXSvT2d3jT1JtjCi1QTM0Idq+J9hw/vqMtxpC9GcFf5EwBcLBYopiIT5hnohSL9AKE+IGJhBR6iXIKdB40LvB6f3+9fjhX9pAaOr1cY+Ji/HjmJhzyhBPBorq9aSgN75JupSI9X8WpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFg1JbvIqdj4rWAeFuKeVe9a7EYqRti2NclALypBuOo=;
 b=Tt+mHqHq+QbkPbdsqkbUmXLIg7sI9B0RTCGyMsz/FGCAigID9gheggxQvS3iTg4LA5Cdx/hclnttqZcM3GMQDFWti5+PaeD5TyHHeVOjBi7MVgoSR68BtP6+c+suHnJHYS/7PfZ6SWaIhI8zXpGq58uNm6HDmJks0QZKNMEiuGiYMtsRe20u4vPJXD7wZtEvJTo+R4rvKOIilr10Ek0QeQRFBBeWNGGz5lJYB7q9F5ynEXHuaUwpvRCAJRG/cL450M7/CaKQ4P21laLxW6aLqhLp0c3LPt5DU4VriKKikcE7LFO4H+xqBGkE/L2ZLJ87xf+fHhDbUhbjmE908t9o2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFg1JbvIqdj4rWAeFuKeVe9a7EYqRti2NclALypBuOo=;
 b=EUzgSPQDE+Wt1E74V5ILL/7853GKhHwj672Z+if77BN80j+aAa2Z9TXU11eLJHH7ppC/iVPiH50mW7CEAiYefY/NEGrl+4cjmNdAYqhOqaS3Mfu9xAZ5fefPlgTTSt6O/EFW3CjYqGys2mpjftI1jPuwPopg1tC3vtjYNh7YUmI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 20:45:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 20:45:53 +0000
Subject: Re: [drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin
 framebuffer with error -12
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsPSYh-Nvfig4j4N8073vA6WDdhdg13meAcUgCr_pd5mYw@mail.gmail.com>
 <816e944c-72bc-d94d-449f-bfb915382290@amd.com>
 <6e55d84c-7b9a-167c-34cf-9e980f8e2354@amd.com>
 <CABXGCsM8yYNz7gQW26a4hHwBR+MunXoopHEiyDJdC-muNrRxkQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <77b696b9-3248-d329-4f7d-5e27a21eabff@amd.com>
Date: Mon, 11 Jan 2021 21:45:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CABXGCsM8yYNz7gQW26a4hHwBR+MunXoopHEiyDJdC-muNrRxkQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:207::19)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:207::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 20:45:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26cb8de0-3974-42fb-554d-08d8b671e357
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44381A6DA6D4A1EBE83C969583AB0@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3jZ3TzIHfzjlSGrDm/tyFyMqYOqZLU/jzc01zG8/SAS0ClBvDPVeY0OZmzxltHvxLvMt4fKaTOEzKyu5ORfS4NbvmJJm0MoP9qwdG2xHATmj7uyIyA6DLhAQunNDTe4xjtdAJ++wCXAJ7geqP2xKXLxda2GgH7JA0MPnZamoyzf6NfpjMz6TeV2YwM08mNPUY7dATAluY1gg8ulKf/98qDik0sCtK2EMkX8x+Nkq7z1qGbM3Vqc64lxH8HTZWv3ZKVwgua01S0I/x7RMc99t+RQF1EutlylVXSv50c+LxRkQdhWpA5rtmiwwnzDyNH2zC6fE43DBsiLjI0i4ZQke1eyWYHsYR++t7te68KBRTCFtCu3wSOeEaeEEPIMnmXNnVJryN8oF9KXzt+3LazWkSm4+YHNRO+TDjOgqF2ibSO6GZxHrU12xUqgGkxkoMbKpH68+a2twiskZjDUXGBjPFSh6uCDAIui4WuHGKmvB/zHKZKjayhH/zNyUCgIs2GZO/He2SKhY+rKo54kE7DBPF/O3nzsR8fqhVjMEKrKRAaxgRuZeif4dKZqj25zeB9zj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(5660300002)(66476007)(6486002)(31696002)(83380400001)(45080400002)(2616005)(66946007)(966005)(186003)(66556008)(86362001)(8936002)(6916009)(36756003)(31686004)(52116002)(54906003)(4326008)(6666004)(316002)(2906002)(478600001)(16526019)(66574015)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ni9uczJrcWJxYTYyMVpPeGJ0RTd6TFQ3R2JiRjg0Z2dua0ROSWk1U1ZSNENP?=
 =?utf-8?B?TmlWcmxMMFBmYkJ1bHhDYjZWMWxFZ0xBTU9FSmU5TkRldDlJYTE4dzREN1Nz?=
 =?utf-8?B?enVINndRYm5NaU9CandNcjBqdVByY21JKzkyaVNnMSs3UHF3YkU0SWhvRUQr?=
 =?utf-8?B?M2RXNnltdEhWOVZ3WENvV2tndDBmeEVzWnpXWkJ0ZXZmd29rZjM2WG5QKzcx?=
 =?utf-8?B?ZVBYSjVvUnUwWFZxaUxBb3lHdzNIVzZ1VjU3NXI5dWpjeE9jYW03b0hwS0JU?=
 =?utf-8?B?cGRDdVFHemtpQzV4UERacjk5YnQrWjFTZkNIWjlVd0x3eWsrZHFZNXBMMGtK?=
 =?utf-8?B?WHpJSlEwa1diRHphbi9aQUEvdlJLQzhKYkI5cU9hUGhEZm5Rc2VhVWhQK05Q?=
 =?utf-8?B?eHpvTTBCYys4OW1aclprQTE5WGRYTmRmb3YvQVBYRG5IL0U1MzZXcnRQL0xK?=
 =?utf-8?B?MHBSdGYzM2dpaHRWcjVzYXl6MHo1RTk4STlYMXgwU21RSjhoOG16QjkxV1Ur?=
 =?utf-8?B?OUZBWkVIcmtpR3RzQlRDOVJCaU4rWlZaQWxsMTRURmV4dUZwS0h2a01oVXVT?=
 =?utf-8?B?QWpyb1JnbGtyb1o0TVFsSWRBaDQ5K3NyK0IyUEx4eFI4UDFsTjVoSGpqcGU0?=
 =?utf-8?B?cWtNc2QvNlNPNW1yeDRURlNDeUJveWNmcmRhdGdVM0JqWGwrWmliMmYydjYz?=
 =?utf-8?B?RU1SSmlIZ2ZuaXA4Wm94a1N5ZE1rV3hNR1VYS2pLc1dEQ0RDTC90eDlFMnhm?=
 =?utf-8?B?ZHVBcFpYM2hLclc5RGdsdVBDMHJqYzI0NWo3RURvRE5JeVZqZ29lYnNlZEFP?=
 =?utf-8?B?KzMzVHE0ZWREa2Zob3VxWjJSVVVteWpwaXl3bDlVL2ZMM1lBUkRac0lUc0hn?=
 =?utf-8?B?WU9LSWIwQS9YSUlvZFUyRSs4MS81cGVjdWNXTTFJdkU1a1ZDTjd3S2d0L2FP?=
 =?utf-8?B?blEvWjdBVXZnUVVkbk5JYTU3WXVENGJYKzNrdnllOTRtUFkxbmJFOTREK1Aw?=
 =?utf-8?B?L3NLa1pIT0lOMDhVaGRXbUdJb2lFWlo4NkhKd2xVZEpkR0c4am8vY1RycXhk?=
 =?utf-8?B?bEVoT3BkemNJWFJ3WEF3YmFQQ2tjeXlWck1HOXVsMDhPNnZQUmoyU0lMTTdP?=
 =?utf-8?B?M3U4b0t3aU1EV3VVSzlvSW9scklmMThDZDFHK1pYc1V2aVhsWW9zTmh1MEt4?=
 =?utf-8?B?UC9Fc29GZFUyWEw4WHBmYUZCQTBPZkt5NUJLYkZ4b1R6MzFtdHlnN2s0QzVG?=
 =?utf-8?B?VVAzbko2bFZhRGRwa1htNWtXQXR6d1hndnd0K2V3Y0JCTXNodnFGMm02Z0Ns?=
 =?utf-8?B?VGlIR1hhRzhqMTZhMWVmTHNZalp3SEpncUNSV005bmNYMHB0MlRXL1ZqZVJQ?=
 =?utf-8?B?dk8yRDZDcVZqNC9UTk01Q05BSTh5dng2ZjBMYzVGR0xiaklCZ3dBbGhsQ09z?=
 =?utf-8?Q?zpejP8jB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 20:45:53.3616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cb8de0-3974-42fb-554d-08d8b671e357
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwIQfjv8AGSF8cbf0Xx5i4sbo77OEWJeOGtZqqjPsbHRubYE2F2ARcx9WPwhqvMb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWlrZSwKCkFtIDExLjAxLjIxIHVtIDIwOjIzIHNjaHJpZWIgTWlraGFpbCBHYXZyaWxvdjoK
PiBPbiBNb24sIDExIEphbiAyMDIxIGF0IDE5OjAxLCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4+IENoYW5naW5nIHRoZSBwYWdlIHRhYmxlIGF0
dHJpYnV0ZXMgd2hpbGUgcmVsZWFzaW5nIG1lbW9yeSBtaWdodCBzbGVlcC4KPj4gU28gd2UgY2Fu
J3QgdXNlIGEgc3BpbmxvY2sgaGVyZS4KPj4KPj4gVGhhbmtzIGZvciB0aGUgcmVwb3J0LCBhIHBh
dGNoIHRvIGZpeCB0aGlzIGlzIG9uIHRoZSBtYWlsaW5nIGxpc3Qgbm93Lgo+IENhbiB5b3UgbG9v
ayBhbHNvIHRoZSBmaXJzdCB0cmFjZT8KClVuZm9ydHVuYXRlbHkgbm90LCB0aGF0J3MgREMgc3R1
ZmYuIEVhc2llc3QgaXMgdG8gYXNzaWduIHRoaXMgYXMgYSBidWcgCnRyYWNrZXIgdG8gb3VyIERD
IHRlYW0uCgo+IEhlcmUgYSBzYW1lIGVycm9yIG1lc3NhZ2UgInNsZWVwaW5nIGZ1bmN0aW9uIGNh
bGxlZCBmcm9tIGludmFsaWQKPiBjb250ZXh0IiBhbmQgYSBsb3Qgb2YgW2FtZGdwdV0gY29kZS4K
CltTTklQXQoKPj4+IC0xMiBpcyBqdXN0IC1FTk9NRU0uIExvb2tzIGxpa2UgYSBtZW1vcnkgbGVh
ayB0byBtZSwgbWF5YmUgY2F1c2VkIGJ5Cj4+PiB0aGUgcHJvYmxlbSBhYm92ZSwgbWF5YmUgc29t
ZXRoaW5nIGNvbXBsZXRlbHkgdW5yZWxhdGVkLgo+Pj4KPj4+IEkgd2lsbCB0YWtlIGEgbG9vay4K
Pj4gVGhlIGxvb2tzIGxpa2UgYSBjb21wbGV0ZWx5IHVucmVsYXRlZCBtZW1vcnkgbGVhayB0byBt
ZS4KPj4KPj4gUHJvYmFibHkgYmVzdCBpZiB5b3Ugb3BlbiB1cCBhIGJ1ZyByZXBvcnQgZm9yIHRo
aXMuCj4gWWVzLCB0aGUgbW9uaXRvciBzdGlsbCB0dXJucyBvZmYgYWZ0ZXIgYXBwbHlpbmcgcGF0
Y2ggIm1ha2UgdGhlIHBvb2wKPiBzaHJpbmtlciBsb2NrIGEgbXV0ZXgiLgo+IEFueXdheSBwYXRj
aCBmaXhlZCB0aGUgaXNzdWUgd2l0aCBmbG9vZCBvZiBtZXNzYWdlICJCVUc6IHNsZWVwaW5nCj4g
ZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250ZXh0IGF0IG1tL3ZtYWxsb2MuYzoxNzU2
IiBzbyBrZXJuZWwKPiBsb2cgYmVjYW1lIGNsZWFuZXIuCgpBdCBsZWFzdCBzb21lIHByb2dyZXNz
LiBBbnkgb2JqZWN0aW9ucyB0aGF0IEkgYWRkIHlvdXIgZS1tYWlsIGFkZHJlc3MgYXMgCnRlc3Rl
ZC1ieSB0YWc/Cgo+IE5vdyB0aGUgaXNzdWUgd2l0aCB0dXJucyBvZmYgbW9uaXRvciBsb29rcyBp
biBsb2dzIHNvOgo+Cj4gRE1BLUFQSTogY2FjaGVsaW5lIHRyYWNraW5nIEVOT01FTSwgZG1hLWRl
YnVnIGRpc2FibGVkCj4gYW1kZ3B1IDAwMDA6MGI6MDAuMDogYW1kZ3B1OiAwMDAwMDAwMDZiNzkx
NTIzIHBpbiBmYWlsZWQKPiBbZHJtOmRtX3BsYW5lX2hlbHBlcl9wcmVwYXJlX2ZiIFthbWRncHVd
XSAqRVJST1IqIEZhaWxlZCB0byBwaW4KPiBmcmFtZWJ1ZmZlciB3aXRoIGVycm9yIC0xMgo+IEJV
Rzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAw
MDA2MAo+ICNQRjogc3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQo+ICNQRjog
ZXJyb3JfY29kZSgweDAwMDApIC0gbm90LXByZXNlbnQgcGFnZQo+IFBHRCAwIFA0RCAwCj4gT29w
czogMDAwMCBbIzFdIFNNUCBOT1BUSQo+IENQVTogMjAgUElEOiAzNzgwIENvbW06IGJyYXZlOmNz
MCBUYWludGVkOiBHICAgICAgICBXICAgICAgICAtLS0tLS0tLS0KPiAtLS0gIDUuMTEuMC0wLnJj
Mi4yMDIxMDEwOGdpdGY1ZTZjMzMwMjU0YS4xMjAuZmMzNC54ODZfNjQgIzEKPiBIYXJkd2FyZSBu
YW1lOiBTeXN0ZW0gbWFudWZhY3R1cmVyIFN5c3RlbSBQcm9kdWN0IE5hbWUvUk9HIFNUUklYCj4g
WDU3MC1JIEdBTUlORywgQklPUyAyODAyIDEwLzIxLzIwMjAKPiBSSVA6IDAwMTA6dHRtX3R0X3N3
YXBpbisweDM0LzB4MWIwIFt0dG1dCj4gQ29kZTogNTUgNDEgNTQgNTUgNTMgNDggODMgZWMgMTAg
NDggOGIgNDcgMjAgNDggODkgNDQgMjQgMDggNDggODUgYzAKPiAwZiA4NCA4NiAwMSAwMCAwMCA0
OCA4YiA0NCAyNCAwOCA0OSA4OSBmYyA0YyA4YiBhOCBlMCAwMSAwMCAwMCA8NDE+IDhiCj4gNDUg
NjAgODkgNDQgMjQgMDQgOGIgNDcgMGMgODUgYzAgMGYgODQgZGYgMDAgMDAgMDAgMzEgZGIgNjUK
PiBSU1A6IDAwMTg6ZmZmZmE3NDAwNTMyYjljMCBFRkxBR1M6IDAwMDEwMjg2Cj4gUkFYOiBmZmZm
OTc4ZTJhZTI1ODAwIFJCWDogZmZmZjk3OTEwZWMxMjA1OCBSQ1g6IGZmZmY5NzhlMTJjYWFjNzAK
PiBSRFg6IDAwMDAwMDAwODAwMDAwMTAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogZmZmZjk3
OTEyYzNkOTljMAo+IFJCUDogZmZmZjk3OTEyYzNkOTljMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAg
UjA5OiAwMDAwMDAwMDcwYjNhMDAwCj4gUjEwOiAwMDAwMDAwMDAwMDAwMDAyIFIxMTogMDAwMDAw
MDAwMDAwMDAwMCBSMTI6IGZmZmY5NzkxMmMzZDk5YzAKPiBSMTM6IDAwMDAwMDAwMDAwMDAwMDAg
UjE0OiBmZmZmYTc0MDA1MzJiYTkwIFIxNTogZmZmZjk3OGUxODJjNjM1MAo+IEZTOiAgMDAwMDdm
MDcwYmIxYjY0MCgwMDAwKSBHUzpmZmZmOTc5NTA5MjAwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAw
MDAwMDAwMDAKPiBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUw
MDMzCj4gQ1IyOiAwMDAwMDAwMDAwMDAwMDYwIENSMzogMDAwMDAwMDFmMGNkMjAwMCBDUjQ6IDAw
MDAwMDAwMDAzNTBlZTAKPiBDYWxsIFRyYWNlOgo+ICAgdHRtX3R0X3BvcHVsYXRlKzB4YTkvMHhl
MCBbdHRtXQo+ICAgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbSsweDE0Mi8weDE4MCBbdHRtXQo+ICAg
dHRtX2JvX3ZhbGlkYXRlKzB4MTJlLzB4MWMwIFt0dG1dCgpJIGNhbiB0YWtlIGEgbG9vayBhdCB0
aGlzIG9uZSBoZXJlLiBMb29rcyBsaWtlIHNvbWUgbWlzc2luZyBlcnJvciAKaGFuZGxpbmcgd2hl
biBhbGxvY2F0aW5nIG1lbW9yeS4KCkNhbiB5b3UgZGVjb2RlIHRvIHdoaWNoIGxpbmUgbnVtYmVy
IHR0bV90dF9zd2FwaW4rMHgzNCBwb2ludHMgdG8/CgpbU05JUF0KCj4gWW91IHNhaWQgdGhhdCBJ
IG5lZWQgb3BlbiB1cCBhIGJ1ZyByZXBvcnQgeW91IG1lYW5zIHNpdGUKPiBodHRwczovL25hbTEx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZidWd6
aWxsYS5rZXJuZWwub3JnJTJGJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQw
YW1kLmNvbSU3Qzc1MDQwZjUwNTM0MDRiMGYzMDJiMDhkOGI2NjY3NjliJTdDM2RkODk2MWZlNDg4
NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ1OTg5ODQ5MTU4MTg4MCU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1JYmtTZkhLJTJCRDEz
T0NjWU1nJTJCbE5zWml4aTlnREVRRWZTN014eWY3dkdkTSUzRCZhbXA7cmVzZXJ2ZWQ9MCA/Cj4g
SSB0aG91Z2h0IG1haWxpbmcgbGlzdHMgaXMgYmV0dGVyIGJlY2F1c2UgYnVnIHJlcG9ydCBvbgo+
IGJ1Z3ppbGxhLmtlcm5lbC5vcmcgdXN1YWxseSBsZWF2ZSBvcGVuZWQgZm9yIHNldmVyYWwgeWVh
cnMgd2l0aG91dAo+IGF0dGVudGlvbi4KClBsZWFzZSB1c2UgdGhpcyBvbmUgaGVyZTogCmh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzL25ldwoKSWYgeW91IGNh
bid0IGZpbmQgdGhlIERDIGd1eXMgb2YgaGFuZCBpbiB0aGUgYXNzaWduZWUgbGlzdCBqdXN0IGFz
c2lnbiAKdG8gbWUgYW5kIEkgd2lsbCBmb3J3YXJkLgoKQnV0IHdoYXQgeW91IGhhdmUgaW4geW91
ciBsb2dzIHNvIGZhciBhcmUgb25seSB1bnJlbGF0ZWQgc3ltcHRvbXMsIHRoZSAKcm9vdCBvZiB0
aGUgcHJvYmxlbSBpcyB0aGF0IHNvbWVib2R5IGlzIGxlYWtpbmcgbWVtb3J5LgoKV2hhdCB5b3Ug
Y291bGQgZG8gYXMgd2VsbCBpcyB0byB0cnkgdG8gZW5hYmxlIGttZW1sZWFrIGFuZCBtYXliZSB0
cnkgCnNvbWUgYmxlZWRpbmcgZWRnZSBicmFuY2ggbGlrZSBkcm0tbWlzYy1maXhlcyBvciBBbGV4
IAphbWQtc3RhZ2luZy1kcm0tbmV4dCBicmFuY2guCgpUaGFua3MgZm9yIHRoZSBoZWxwLApDaHJp
c3RpYW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
