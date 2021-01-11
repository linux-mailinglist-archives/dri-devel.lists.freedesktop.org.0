Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA52F1715
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 15:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A85289C09;
	Mon, 11 Jan 2021 14:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2F289BF8;
 Mon, 11 Jan 2021 14:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tcnu/gp4Lrj+Iu1y4GeHP5mxNvV21o7DwJILuNxAtFbict2kEpN4bkZ49dpl3LlILB88kF2xprYU3xu4iB9H0Xosv2awYKkXX71Z/zVuLCrSYoLC5YJuxb/sw/0Pace7inufx6K3TOmYZVGCWHcz0BywWZWiaLr0PMVUvkG7CnrfQe9Oo6Es2pwYrWeZPnLuw9COOLDFmb5XW3zYy9pqmfkliHI9n7OEzrjno7yIJgyqGjO26WpEFwIa0l99Z5iHg0reMGKLMMuzYMi1rgA0mZpPPNs5D+PCL3mr8JjVoMMgMIGfglvgrmBNTY/+iJIuBJOsTPPwaiShk4//jQKvCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A5vNpBGJGRAbhxpb+rrSQ75zinBIluPWSCIBw7dzLI=;
 b=Ap9s1N/MVyfbwdiCB9Pp3Zdzde/lzz3js64fIMJQSMVDV/zPJcawlfHWuNzomeZ7bkcDkajGNn+JiKK3d7GMRf/orWvIk+ecBxEGSbdkGeuknvO/Vlqe6tHyQ39U1lK4RYsNNofJOocd3Q952Sb9w6UYD6/zPPr4gcoHS6NFHts0Kk/MLs0Omk8ZkPcXsMXohFi2QTvMGoVzf0t30g8ZG58ilAFavR161naFk7RZpG9/NXLSnUbGJDZINaKl+nSXVtWTcEAj+Wsit13NnlEHHgBcVptmTtgtfSuRs/7xyUsYW7BQaQ9FwpeaasZ8LVQJs/SJGTauDF3lcuBqksy20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A5vNpBGJGRAbhxpb+rrSQ75zinBIluPWSCIBw7dzLI=;
 b=g6HLtJIM+660/KiBshIq15zZtzm8ileqYO7jD0hfMhpKr3lWxFKOu4whGlU02Cu74L9RIgbCSpi79GZDEUjb6xcAgHQ0E11VWVBb0gCHKuByQflhrqNYzLQ3zBWuKENUcjHORfGD4SaJA4mcSDuzrYpfbV5obKpBz/+1oSvJlV0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3966.namprd12.prod.outlook.com (2603:10b6:208:165::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 14:01:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 14:01:37 +0000
Subject: Re: [drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin
 framebuffer with error -12
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Harry Wentland <harry.wentland@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
References: <CABXGCsPSYh-Nvfig4j4N8073vA6WDdhdg13meAcUgCr_pd5mYw@mail.gmail.com>
 <816e944c-72bc-d94d-449f-bfb915382290@amd.com>
Message-ID: <6e55d84c-7b9a-167c-34cf-9e980f8e2354@amd.com>
Date: Mon, 11 Jan 2021 15:01:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <816e944c-72bc-d94d-449f-bfb915382290@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P193CA0021.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P193CA0021.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 14:01:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2a78bfb6-e0b1-49a3-fe47-08d8b63969ce
X-MS-TrafficTypeDiagnostic: MN2PR12MB3966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3966182F87ADD4B7E44840FB83AB0@MN2PR12MB3966.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AE1qJsTMdgiMDvUZiwCd8xAsM9ArTtF/gw8AsIQr2DS2XADAUvD2UiUN6wEj8tM7QLsmz0X2nNnAE/98Xq7GZvvt4Gh2R4GIEdv6EI2hnzI/nDYDMheylr6bebpTJv6IxowVDn/IoGw7+UUhhG0oqbZ/spbdQcqTKLBskf2kkangEXgy4aPimeOl1ZfqSmMGGUFPICHuztbRh21NJKKIUwez6CdqleXfZxF8t+JKWTJQ/ZPeRoWy+AN85IMRz767i52offCgU6XWb8sjdbLUNNXzXEoCtdwQFBZO64vHcH+aA8QaaE79J29Cb8rmviPHySPwRK1/hd92Yyv1k07NvlyOfZ9VXcOExdFFMCEa/jjoS+ZCGFXkqX/ehU0LfiVtq8LitxgZxUbIIL9W6Xn394MbaH3x6xMfFVdL/Oy1y0dPk5fgWQ4G4ElX+XbOSsqUyel7AnWg3QhiFJd89jrCpglFdkBdLA5WbAmfQabQjlnEZkO3Wj91WDNOcelfXuX1oxB6soRTpSDzfiP2syKjAJFXFQ0uJvcskB7bQhqxQjoYtOIgzUGpD90wQkCpohDg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(8676002)(316002)(66476007)(52116002)(86362001)(83380400001)(186003)(2616005)(110136005)(31696002)(66574015)(36756003)(45080400002)(478600001)(6636002)(6666004)(31686004)(2906002)(6486002)(66556008)(5660300002)(16526019)(8936002)(966005)(4001150100001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0tFeFhOdGNMdUFUOGpPNmN4aW9aM2tuMm5uNGM0azFaeVFtVFdnMURZc2ZI?=
 =?utf-8?B?SVFFK29SWWZzZ0VkLzI3eng5NUhrRnllZWVRVWppTHVWR3Flb245QVJqMFFi?=
 =?utf-8?B?MkpqOW8zTG92MUxxTGdjdWhwSG5CbTVVdkY5YnVSTEFtUEkrUTBiMkd0cEEy?=
 =?utf-8?B?dHZDRW5FUTUvVUY2MGpvcEJsZC90YVlrL0U5djJPU2tidVN1TEF1bVZBblBn?=
 =?utf-8?B?L092UDZXRmFENGdML3JqT1BRL080Wml6dGNsWFp0aEpxbGpWdXVaV1N4Q0NH?=
 =?utf-8?B?QndJSE5vaGNQaitPUE5TSFF6U1BQR0NKRi9GMWI5emRpbXpmK3ZkdzRFcGpM?=
 =?utf-8?B?RG9MdUxBRGtBdHRwV2V6M3d0TEJ0L2d3M29hWW1uUU5CNktsZ1EwRURYeTAr?=
 =?utf-8?B?YldYYzB5d0gvTmZpb0tMWWxITlh5bnU0VkhnL3J0UTZvZHhvZnBrb3pMYloz?=
 =?utf-8?B?dnNGbGJPTzlvMXNIK1YzNHNmcXY4eElRaU40TlNxTUpyKzZhRU9xWWhtTzBC?=
 =?utf-8?B?R0hxeWtZbzErUDQ1T21acC9tdHR2U1BnUXcrOW5tTS9Xbyt4VTNoQ3ZuNmZE?=
 =?utf-8?B?SkZCaC9jOEQ3ZmxxOTJPaVlMeGNvUkIza2h5SjU0eklSTzhnMWJ6a0ViNFMv?=
 =?utf-8?B?VGVjd2xWOE1sWERRalVJSTJvTFlrMDBLcXZ3UGZWMS85Y2NwdEhiSWJxMVp5?=
 =?utf-8?B?ejVKS1ZKaTJLT0VnL2o2V1JJTUJzUXFkS1U1TVhaR1lhV1lPc0h0VnJxQ0pP?=
 =?utf-8?B?eC9BVWh2eStnUU5EN0t4WkZqK1ZFUEJvMlFiUTBaenRKTWNjZU1wVkRadHpW?=
 =?utf-8?B?S0c1N1hPa1BrUU5kb1daUldHZWRkdVlaR2I4NjhBWkFmVmdhY2NyM0dmVDFZ?=
 =?utf-8?B?L2VzQ2ttenUrKzJ6bkZ6dDVOTzcyYytYSE5jSU5DUGd3SFl2QWZPdjFUTWxI?=
 =?utf-8?B?N2h5M3B2UU5BK0E5S3RjcHRyNTFVSXZYdVhwUG9Bdk02M2d1YzNIOEpjSVl5?=
 =?utf-8?B?UFR1VEl5R01nbllKWlVsWEtuNGlCZkVxQ1VVT3NMNWtDWUd2UG5rV2RFa1J5?=
 =?utf-8?B?Z1B3T0ZFWStNM0R1UUo3UXpTUnU1ZHdpNExXS3MrL0pveFRoazRLM3QvRHhP?=
 =?utf-8?B?ZXM0TkJrRStDS05PWTlZRTlHb09KMzdzeGUvZW13ME5lNVk4R3hGTWNhNFJJ?=
 =?utf-8?B?WmlTMWZkMTgvLyt6Y2dhQlRNeVM1OWd1azcwMDdVdzlEc242aXRjQXZUUGp5?=
 =?utf-8?B?ZzFyUWpJVEhHeEk0c3puWkgzcEVWQTYxZWZ6d0RrOFlMK05MMjZ6Yk1rLzI5?=
 =?utf-8?B?NFVNcG4zcTJTVFdtbUl6RFphd0NnMW5hWWNFTUN2VEszRUpKUkp0c2hOU3pB?=
 =?utf-8?B?RWJUdGphOGdtanFvVFBIVk1ZTUdueUE4MWVEVVRiT1BrUkpyTkxzMldodmF1?=
 =?utf-8?Q?YgkDE3RZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 14:01:37.6260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a78bfb6-e0b1-49a3-fe47-08d8b63969ce
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cb/zm6oClO3XnzHkj7hRiZNcNIp3YzSgK95zAE6Q/dS/WO5CT+2WrMND/pZZgrR9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3966
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDEuMjEgdW0gMTA6MDMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEhpIE1pa2hh
aWwKPgo+IEFtIDEwLjAxLjIxIHVtIDIzOjI2IHNjaHJpZWIgTWlraGFpbCBHYXZyaWxvdjoKPj4g
SGkgZm9sa3MsCj4+IHRvZGF5IEkgam9pbmVkIHRvIHRlc3RpbmcgS2VybmVsIDUuMTEgYW5kIHNh
dyB0aGF0IHRoZSBrZXJuZWwgbG9nIHdhcwo+PiBmbG9vZGVkIHdpdGggQlVHIG1lc3NhZ2VzOgo+
PiBCVUc6IHNsZWVwaW5nIGZ1bmN0aW9uIGNhbGxlZCBmcm9tIGludmFsaWQgY29udGV4dCBhdCBt
bS92bWFsbG9jLmM6MTc1Ngo+PiBpbl9hdG9taWMoKTogMSwgaXJxc19kaXNhYmxlZCgpOiAwLCBu
b25fYmxvY2s6IDAsIHBpZDogMjY2LCBuYW1lOiAKPj4ga3N3YXBkMAo+PiBJTkZPOiBsb2NrZGVw
IGlzIHR1cm5lZCBvZmYuCj4+IENQVTogMTUgUElEOiAyNjYgQ29tbToga3N3YXBkMCBUYWludGVk
OiBHwqDCoMKgwqDCoMKgwqAgVyAtLS0tLS0tLS0KPj4gLS0twqAgNS4xMS4wLTAucmMyLjIwMjEw
MTA4Z2l0ZjVlNmMzMzAyNTRhLjExOS5mYzM0Lng4Nl82NCAjMQo+PiBIYXJkd2FyZSBuYW1lOiBT
eXN0ZW0gbWFudWZhY3R1cmVyIFN5c3RlbSBQcm9kdWN0IE5hbWUvUk9HIFNUUklYCj4+IFg1NzAt
SSBHQU1JTkcsIEJJT1MgMjgwMiAxMC8yMS8yMDIwCj4+IENhbGwgVHJhY2U6Cj4+IMKgIGR1bXBf
c3RhY2srMHg4Yi8weGIwCj4+IMKgIF9fX21pZ2h0X3NsZWVwLmNvbGQrMHhiNi8weGM2Cj4+IMKg
IHZtX3VubWFwX2FsaWFzZXMrMHgyMS8weDQwCj4+IMKgIGNoYW5nZV9wYWdlX2F0dHJfc2V0X2Ns
cisweDllLzB4MTkwCj4+IMKgIHNldF9tZW1vcnlfd2IrMHgyZi8weDgwCj4+IMKgIHR0bV9wb29s
X2ZyZWVfcGFnZSsweDI4LzB4OTAgW3R0bV0KPj4gwqAgdHRtX3Bvb2xfc2hyaW5rKzB4NDUvMHhi
MCBbdHRtXQo+PiDCoCB0dG1fcG9vbF9zaHJpbmtlcl9zY2FuKzB4YS8weDIwIFt0dG1dCj4+IMKg
IGRvX3Nocmlua19zbGFiKzB4MTc3LzB4M2EwCj4+IMKgIHNocmlua19zbGFiKzB4OWMvMHgyOTAK
Pj4gwqAgc2hyaW5rX25vZGUrMHgyZTYvMHg3MDAKPj4gwqAgYmFsYW5jZV9wZ2RhdCsweDJmNS8w
eDY1MAo+PiDCoCBrc3dhcGQrMHgyMWQvMHg0ZDAKPj4gwqAgPyBkb193YWl0X2ludHJfaXJxKzB4
ZDAvMHhkMAo+PiDCoCA/IGJhbGFuY2VfcGdkYXQrMHg2NTAvMHg2NTAKPj4gwqAga3RocmVhZCsw
eDEzYS8weDE1MAo+PiDCoCA/IF9fa3RocmVhZF9iaW5kX21hc2srMHg2MC8weDYwCj4+IMKgIHJl
dF9mcm9tX2ZvcmsrMHgyMi8weDMwCj4KPiBJJ20gcHJvYmFibHkgcmVzcG9uc2libGUgZm9yIHRo
aXMuIE5lZWQgdG8gZG91YmxlIGNoZWNrIHdoeSB3ZSB0cnkgdG8gCj4gYWxsb2NhdGUgbWVtb3J5
IHdoaWxlIGZyZWVpbmcgc29tZS4KCkNoYW5naW5nIHRoZSBwYWdlIHRhYmxlIGF0dHJpYnV0ZXMg
d2hpbGUgcmVsZWFzaW5nIG1lbW9yeSBtaWdodCBzbGVlcC4gClNvIHdlIGNhbid0IHVzZSBhIHNw
aW5sb2NrIGhlcmUuCgpUaGFua3MgZm9yIHRoZSByZXBvcnQsIGEgcGF0Y2ggdG8gZml4IHRoaXMg
aXMgb24gdGhlIG1haWxpbmcgbGlzdCBub3cuCgo+PiBCdXQgdGhlIG1vc3QgdW5wbGVhc2FudCB0
aGluZyBpcyB0aGF0IGFmdGVyIGEgd2hpbGUgdGhlIG1vbml0b3IgdHVybnMKPj4gb2ZmIGFuZCBk
b2VzIG5vdCBnbyBvbiBhZ2FpbiB1bnRpbCB0aGUgcmVzdGFydC4KPj4gVGhpcyBpcyBhY2NvbXBh
bmllZCBieSBhbiBlbnRyeSBpbiB0aGUga2VybmVsIGxvZzoKPj4KPj4gYW1kZ3B1IDAwMDA6MGI6
MDAuMDogYW1kZ3B1OiAwMDAwMDAwMGZmN2Q4Yjk0IHBpbiBmYWlsZWQKPj4gW2RybTpkbV9wbGFu
ZV9oZWxwZXJfcHJlcGFyZV9mYiBbYW1kZ3B1XV0gKkVSUk9SKiBGYWlsZWQgdG8gcGluCj4+IGZy
YW1lYnVmZmVyIHdpdGggZXJyb3IgLTEyCj4KPiAtMTIgaXMganVzdCAtRU5PTUVNLiBMb29rcyBs
aWtlIGEgbWVtb3J5IGxlYWsgdG8gbWUsIG1heWJlIGNhdXNlZCBieSAKPiB0aGUgcHJvYmxlbSBh
Ym92ZSwgbWF5YmUgc29tZXRoaW5nIGNvbXBsZXRlbHkgdW5yZWxhdGVkLgo+Cj4gSSB3aWxsIHRh
a2UgYSBsb29rLgoKVGhlIGxvb2tzIGxpa2UgYSBjb21wbGV0ZWx5IHVucmVsYXRlZCBtZW1vcnkg
bGVhayB0byBtZS4KClByb2JhYmx5IGJlc3QgaWYgeW91IG9wZW4gdXAgYSBidWcgcmVwb3J0IGZv
ciB0aGlzLgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4gVGhhbmtzLAo+IENocmlzdGlhbi4KPgo+
Pgo+PiAkIGdyZXAgIkZhaWxlZCB0byBwaW4gZnJhbWVidWZmZXIgd2l0aCBlcnJvciIgLVJuIC4K
Pj4gLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jOjU4
MTY6Cj4+IERSTV9FUlJPUigiRmFpbGVkIHRvIHBpbiBmcmFtZWJ1ZmZlciB3aXRoIGVycm9yICVk
XG4iLCByKTsKPj4KPj4gJCBnaXQgYmxhbWUgLUwgNTgxMSw1ODIxIAo+PiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4+IEJsYW1pbmcgbGluZXM6wqDC
oCAwJSAoMTEvOTE2NyksIGRvbmUuCj4+IDVkNDNiZTBjY2JjMmYgKENocmlzdGlhbiBLw7ZuaWcg
MjAxNy0xMC0yNiAxODowNjoyMyArMDIwMCA1ODExKQo+PiDCoCBkb21haW4gPSBBTURHUFVfR0VN
X0RPTUFJTl9WUkFNOwo+PiBlN2IwN2NlZWYyYTY1IChIYXJyeSBXZW50bGFuZMKgIDIwMTctMDgt
MTAgMTM6Mjk6MDcgLTA0MDAgNTgxMikKPj4gN2I3YzZjODFiM2EzNyAoSnVud2VpIFpoYW5nwqDC
oMKgIDIwMTgtMDYtMjUgMTI6NTE6MTQgKzA4MDAgNTgxMykgciA9Cj4+IGFtZGdwdV9ib19waW4o
cmJvLCBkb21haW4pOwo+PiBlN2IwN2NlZWYyYTY1IChIYXJyeSBXZW50bGFuZMKgIDIwMTctMDgt
MTAgMTM6Mjk6MDcgLTA0MDAgNTgxNCkgaWYKPj4gKHVubGlrZWx5KHIgIT0gMCkpIHsKPj4gMzBi
N2M2MTQ3ZDE4ZCAoSGFycnkgV2VudGxhbmTCoCAyMDE3LTEwLTI2IDE1OjM1OjE0IC0wNDAwIDU4
MTUpCj4+IMKgIGlmIChyICE9IC1FUkVTVEFSVFNZUykKPj4gMzBiN2M2MTQ3ZDE4ZCAoSGFycnkg
V2VudGxhbmTCoCAyMDE3LTEwLTI2IDE1OjM1OjE0IC0wNDAwIDU4MTYpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBEUk1fRVJST1IoIkZhaWxlZCB0byBwaW4gZnJhbWVidWZmZXIgd2l0aCBlcnJvciAl
ZFxuIiwgcik7Cj4+IDBmMjU3YjA5NTMxYjQgKENodW5taW5nIFpob3XCoMKgIDIwMTktMDUtMDcg
MTk6NDU6MzEgKzA4MDAgNTgxNykKPj4gwqAgdHRtX2V1X2JhY2tvZmZfcmVzZXJ2YXRpb24oJnRp
Y2tldCwgJmxpc3QpOwo+PiBlN2IwN2NlZWYyYTY1IChIYXJyeSBXZW50bGFuZMKgIDIwMTctMDgt
MTAgMTM6Mjk6MDcgLTA0MDAgNTgxOCkKPj4gwqAgcmV0dXJuIHI7Cj4+IGU3YjA3Y2VlZjJhNjUg
KEhhcnJ5IFdlbnRsYW5kwqAgMjAxNy0wOC0xMCAxMzoyOTowNyAtMDQwMCA1ODE5KSB9Cj4+IGU3
YjA3Y2VlZjJhNjUgKEhhcnJ5IFdlbnRsYW5kwqAgMjAxNy0wOC0xMCAxMzoyOTowNyAtMDQwMCA1
ODIwKQo+PiBiYjgxMmYxZWE4N2RkIChKdW53ZWkgWmhhbmfCoMKgwqAgMjAxOC0wNi0yNSAxMzoz
MjoyNCArMDgwMCA1ODIxKSByID0KPj4gYW1kZ3B1X3R0bV9hbGxvY19nYXJ0KCZyYm8tPnRibyk7
Cj4+Cj4+IFdobyBrbm93cyBob3cgdG8gZml4IGl0Pwo+Pgo+PiBGdWxsIGtlcm5lbCBsb2dzIGlz
IGhlcmU6Cj4+IFsxXSAKPj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRs
b29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGcGFzdGViaW4uY29tJTJGZkxhc2pESFgmYW1wO2Rh
dGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMTVlZjgzZTQ2MmUwNDk0
MjliZTIwOGQ4YjViNmM2YmIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAl
N0MwJTdDNjM3NDU5MTQzOTQyOTgxOTA4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9p
TUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUz
RCU3QzEwMDAmYW1wO3NkYXRhPVVqOU9iM2xVQ0FzSDhOcnhDNzE1elNmbDVZcWM0NHlTVm8lMkZa
a2R5VHBDTSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+PiBbMl0gCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnBhc3RlYmluLmNv
bSUyRmczd1IycjllJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNv
bSU3QzE1ZWY4M2U0NjJlMDQ5NDI5YmUyMDhkOGI1YjZjNmJiJTdDM2RkODk2MWZlNDg4NGU2MDhl
MTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ1OTE0Mzk0Mjk4MTkwOCU3Q1Vua25vd24lN0NU
V0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklr
MWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT11OGlyTVUzaThjMzdXNVNreWlh
QWklMkZ0d01vUG9yZXptM05JMUVZSTNjc0UlM0QmYW1wO3Jlc2VydmVkPTAKPj4KPj4gLS0gCj4+
IEJlc3QgUmVnYXJkcywKPj4gTWlrZSBHYXZyaWxvdi4KPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
