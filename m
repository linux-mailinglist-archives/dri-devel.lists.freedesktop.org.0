Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D32F0EAC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 10:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2205889F03;
	Mon, 11 Jan 2021 09:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8031389DED;
 Mon, 11 Jan 2021 09:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUgpfCiYxFnDs8Ow6gyCuMbSgPdg+l+Vl8a99i1156+qnq8zCo4LHBgZfD0tfzNBngTjDxuhXx1ZCAcrg3rGK8eAMWij3x8WkzhzRfGoZaIrM12ew1/AeTklEXzZ2yolQLlSVlFh79gz5y+wYZinkF7LKFp+E8C5U2UdOoExXRNeZuFMJdUV+MIRGEYkRufWvhG+CmCPyYnUNFC5kFPZ9c3T13L1HrgfuxaS+HIw0ZpMtxr6BL/XRFeQ1R3VEhXdm7+DwXNJyo2IoCbFGseGor8go8eEDyPQ6w2iu1gDC4F2WGlHhDHcLZOfNa51Yc0EO3LuihUKMz7TjAWnviOnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XCu3es52Y/7YSHRCZbmkUw0n2AMubqrozmIRuKjJm4=;
 b=dx4Cp8V0q/d6g6gSqw9fXvocH2q2fXqDjVfXfwHEDysqyy3SmTQgbZ0j/9/CG6WTsjzPx/gfJVWZSyoaM6VskCzJJpaIfYMbJckq8oPJPdbwAc2iPbvaWSs202laWKtpDwc3xLbUlaPjaXS0LM9DWnqnJP1WR8VPZkTlOiAeCYGsZG1XbIjPMozyt9NtWl3+dAZtjb4FLLyycuc8LXJh1Bn6NgiC8MRfNCZlM/OVb3pwBiukKRMWO6EmISB4oZSOPrfAHCaJEXXXcS0KP483VGQVIfQl6g5+JIP5RgX69eRD3hQufCKMnwpLhQ9vQSYxPq8G/jm8I8EF4VwXyUAlww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XCu3es52Y/7YSHRCZbmkUw0n2AMubqrozmIRuKjJm4=;
 b=PvTGMmu5DQmXi7V6zh19FULgADxYw2/DBHifuTmM4X7WQ7khmpOB2ksPQOkjtGgrgQvCmtfXyO2C3IF6faFu1nbLs992Z8QFx3/cU+R9FsdZQjoryjEp/JG+nROozE2nje6n3CyioLRA8LVK4gpHBqNDYkfqk4aqYDXIhJO1bpA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4847.namprd12.prod.outlook.com (2603:10b6:208:1ba::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Mon, 11 Jan
 2021 09:03:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 09:03:39 +0000
Subject: Re: [drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin
 framebuffer with error -12
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Harry Wentland <harry.wentland@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
References: <CABXGCsPSYh-Nvfig4j4N8073vA6WDdhdg13meAcUgCr_pd5mYw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <816e944c-72bc-d94d-449f-bfb915382290@amd.com>
Date: Mon, 11 Jan 2021 10:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CABXGCsPSYh-Nvfig4j4N8073vA6WDdhdg13meAcUgCr_pd5mYw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P189CA0026.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P189CA0026.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 09:03:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 91f37ace-2e0a-4e6d-74c5-08d8b60fc941
X-MS-TrafficTypeDiagnostic: MN2PR12MB4847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB484781EC1E63787861C22B0983AB0@MN2PR12MB4847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzxY+Tc2piS8dcDJ/3WowiEy7I9BAQmCzvULjQQT/WY2/gM4xnYPcSgRIOoiCAH2qJqSFW/pALOEI0vOzAwYh8abKSJzreOsBELC1Y2/S/0Zhn1PkR89X5tDqfgDcKKe36nRZRJKHaCFxOt/fxUs6qYZKhl5ZiCXlxx1aAiliol7kKskh6SxoQo1DLX0Bx5wBQ9mWcNFJfu4o/pIkZ4OAQLXi2bHJj34baYkyM3OTfH2HvQVRPSxoPuRdnRleKhNC8caAGPLm0i0luJpepWNwIqkCU/DEXG88at2Lg5r1BXaFW8TTEN+hADXMuvWDSfYY8nR+iDdvbBXhv+K2ZSzY35tZCRPi2DMQxjt07eRrFVsUPqzPtqRpfSlySRVkMtaxxj8OVyYdZOrvuh3QMgjSWxeAezMucpnkyxp8DJqrp0b61BoUouS2kXce70skEBp59H8ArWwdiMazsXGXyBX4p7kvMxJRXR4sRkTld/F4oPfiKzXB1zRf3KsKmMqYRrETkVjhB44FpDEGiP5hIXKndzlZniQLJ7r9lLoWwNKTA91z/yj4ewRSIWU2EdR/FXY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(52116002)(36756003)(83380400001)(966005)(16526019)(2616005)(6666004)(186003)(66574015)(66556008)(6486002)(66476007)(4001150100001)(316002)(2906002)(5660300002)(6636002)(31696002)(31686004)(8936002)(86362001)(110136005)(8676002)(45080400002)(478600001)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWd3dWZOaDVuRTRXUXVtRmpjc2t2ZEVsQk1nZHZvSFl6N09DQjh3d1RlNXoy?=
 =?utf-8?B?bWhTNWtFRWxvWWxHVUFSTFljSlU0cVBtTjRkMEdlS2ZWaGdLcWNpVVB2eDZL?=
 =?utf-8?B?eGw0UkJCeVYyKytqNzRRWlVNZUdEbkJmRTRIZG1udjQvMXdqdi81czlZNFBM?=
 =?utf-8?B?OHpVTEVaZS83UXVJcUZ0VHF0WjkreklBWUxnRDcyQU40ZERvVGVIMVgwT0Uy?=
 =?utf-8?B?U1JZNkJya2ZoS1FpWkVDb1JmT2s5b1JzL1F2cGIzaDBzUzlsa0I5Z3JzbEZm?=
 =?utf-8?B?ejN0Z0QyZ0t0UjZtVWMzVmFjRWc3NDZLR25MK2pBcXFNYTV1SnZKSXJXZDN4?=
 =?utf-8?B?OHVOUmFENkNIU21GNGhzVFhHRGVrTE1KU2EwYUZQc3poQkxQejgwejJzQy9W?=
 =?utf-8?B?VCtHZ2tLcGJDZDBDSEpWaUVXRkk5dyt1RG9QdFVSTnJBOWVTOHhvY085eUow?=
 =?utf-8?B?SFVsTVV5ZTdMU2NkVmllaEkwZmVHOC9NV1FPL3oyUFJHd1FaZFRzYkdrWTUy?=
 =?utf-8?B?Umd3Q0g5QTlTSnF4RFgvU3dJMDUvaFNXeTQvaFhSTW5JUXgvNFNoODFWNW9H?=
 =?utf-8?B?KzZaMUxDUDdVQmxhOWJjUDM2LzhnUlBXTTAwZ24wL1M4KzcwdVduSHMvWi90?=
 =?utf-8?B?ZmFVVU9pMFBNOXhPUEZ5ZjhVdHVQUlU1YnZVem1lV1BEY1JJNHlDdExRUVVh?=
 =?utf-8?B?SXZMUDJub1cxOVRXNURVWStCcmNhNU9uNWF5cWpITEpsYXVjRFZNNUU2cm1R?=
 =?utf-8?B?MnJ2N2lyY3ZBZlFscmJkYytUa0ZrNE1vUC9xejBsRVBzN1hYT2NLNXNmM0x4?=
 =?utf-8?B?NU5ZUDd5dmd3NzRMTytQaDZYYytMbXh1Q3ZQc2N0dmorSkJsbWYvaUw4M3BI?=
 =?utf-8?B?dk5rTHhPZzF3NkxFTHlrMWphR3Z0cWVYWHduSGhBT1ZwUHVocmxzSFFIM1Rx?=
 =?utf-8?B?WExkcGsrdHhjWGcyaTBraE5hcHZBTVQ4OUwweWZ3V3c2TW5PVzRQZG1ZV0tH?=
 =?utf-8?B?clB4cUprN01qKzB5aTczVW5Zc01DKzhhWFdaaGhhU2hzMWRSMzdkNC8vMGFn?=
 =?utf-8?B?Wmg2a0pnblo3OVAwalh0TjBLRStCRnNOQ1NQaEloVkFtcEVoMjVCbjJicVc3?=
 =?utf-8?B?alFYM3J5TzYwMTF6cVpMaTYwNE9IQmErS3JPM1VPanJiSk5BaDRZWHlWWFFp?=
 =?utf-8?B?TWlWTWIzaHJXb0hqN1lRQlRhWU1QbEVDaU5hK2d1UVJHZEZic1FuWVFnZnA0?=
 =?utf-8?B?Qkx0OVltd3hzM0RZSnZDemk3UFV3bzRxL1psYmlOSi9WZVM1R1dqMVBjRmpJ?=
 =?utf-8?B?Q21uUW9EaXpKb1pYSGRwREdrbmJxdnBqaS9SZWFSMlR5SHZ3cHM1RW5LMTh5?=
 =?utf-8?B?Y1pPVEZSWWROVSthMXNtN2hmaFF2WWRNVVdRVVZTNUN1c05EcFptZzNtVWRE?=
 =?utf-8?Q?tLaCL7gp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 09:03:38.8930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f37ace-2e0a-4e6d-74c5-08d8b60fc941
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vBaBblwC6aAXM0Js90Fid9gQhNANHwtCbgLKNB8kycbMnPhxTb2Qb7qHzqpj867
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4847
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

SGkgTWlraGFpbAoKQW0gMTAuMDEuMjEgdW0gMjM6MjYgc2NocmllYiBNaWtoYWlsIEdhdnJpbG92
Ogo+IEhpIGZvbGtzLAo+IHRvZGF5IEkgam9pbmVkIHRvIHRlc3RpbmcgS2VybmVsIDUuMTEgYW5k
IHNhdyB0aGF0IHRoZSBrZXJuZWwgbG9nIHdhcwo+IGZsb29kZWQgd2l0aCBCVUcgbWVzc2FnZXM6
Cj4gQlVHOiBzbGVlcGluZyBmdW5jdGlvbiBjYWxsZWQgZnJvbSBpbnZhbGlkIGNvbnRleHQgYXQg
bW0vdm1hbGxvYy5jOjE3NTYKPiBpbl9hdG9taWMoKTogMSwgaXJxc19kaXNhYmxlZCgpOiAwLCBu
b25fYmxvY2s6IDAsIHBpZDogMjY2LCBuYW1lOiBrc3dhcGQwCj4gSU5GTzogbG9ja2RlcCBpcyB0
dXJuZWQgb2ZmLgo+IENQVTogMTUgUElEOiAyNjYgQ29tbToga3N3YXBkMCBUYWludGVkOiBHICAg
ICAgICBXICAgICAgICAtLS0tLS0tLS0KPiAtLS0gIDUuMTEuMC0wLnJjMi4yMDIxMDEwOGdpdGY1
ZTZjMzMwMjU0YS4xMTkuZmMzNC54ODZfNjQgIzEKPiBIYXJkd2FyZSBuYW1lOiBTeXN0ZW0gbWFu
dWZhY3R1cmVyIFN5c3RlbSBQcm9kdWN0IE5hbWUvUk9HIFNUUklYCj4gWDU3MC1JIEdBTUlORywg
QklPUyAyODAyIDEwLzIxLzIwMjAKPiBDYWxsIFRyYWNlOgo+ICAgZHVtcF9zdGFjaysweDhiLzB4
YjAKPiAgIF9fX21pZ2h0X3NsZWVwLmNvbGQrMHhiNi8weGM2Cj4gICB2bV91bm1hcF9hbGlhc2Vz
KzB4MjEvMHg0MAo+ICAgY2hhbmdlX3BhZ2VfYXR0cl9zZXRfY2xyKzB4OWUvMHgxOTAKPiAgIHNl
dF9tZW1vcnlfd2IrMHgyZi8weDgwCj4gICB0dG1fcG9vbF9mcmVlX3BhZ2UrMHgyOC8weDkwIFt0
dG1dCj4gICB0dG1fcG9vbF9zaHJpbmsrMHg0NS8weGIwIFt0dG1dCj4gICB0dG1fcG9vbF9zaHJp
bmtlcl9zY2FuKzB4YS8weDIwIFt0dG1dCj4gICBkb19zaHJpbmtfc2xhYisweDE3Ny8weDNhMAo+
ICAgc2hyaW5rX3NsYWIrMHg5Yy8weDI5MAo+ICAgc2hyaW5rX25vZGUrMHgyZTYvMHg3MDAKPiAg
IGJhbGFuY2VfcGdkYXQrMHgyZjUvMHg2NTAKPiAgIGtzd2FwZCsweDIxZC8weDRkMAo+ICAgPyBk
b193YWl0X2ludHJfaXJxKzB4ZDAvMHhkMAo+ICAgPyBiYWxhbmNlX3BnZGF0KzB4NjUwLzB4NjUw
Cj4gICBrdGhyZWFkKzB4MTNhLzB4MTUwCj4gICA/IF9fa3RocmVhZF9iaW5kX21hc2srMHg2MC8w
eDYwCj4gICByZXRfZnJvbV9mb3JrKzB4MjIvMHgzMAoKSSdtIHByb2JhYmx5IHJlc3BvbnNpYmxl
IGZvciB0aGlzLiBOZWVkIHRvIGRvdWJsZSBjaGVjayB3aHkgd2UgdHJ5IHRvIAphbGxvY2F0ZSBt
ZW1vcnkgd2hpbGUgZnJlZWluZyBzb21lLgoKPiBCdXQgdGhlIG1vc3QgdW5wbGVhc2FudCB0aGlu
ZyBpcyB0aGF0IGFmdGVyIGEgd2hpbGUgdGhlIG1vbml0b3IgdHVybnMKPiBvZmYgYW5kIGRvZXMg
bm90IGdvIG9uIGFnYWluIHVudGlsIHRoZSByZXN0YXJ0Lgo+IFRoaXMgaXMgYWNjb21wYW5pZWQg
YnkgYW4gZW50cnkgaW4gdGhlIGtlcm5lbCBsb2c6Cj4KPiBhbWRncHUgMDAwMDowYjowMC4wOiBh
bWRncHU6IDAwMDAwMDAwZmY3ZDhiOTQgcGluIGZhaWxlZAo+IFtkcm06ZG1fcGxhbmVfaGVscGVy
X3ByZXBhcmVfZmIgW2FtZGdwdV1dICpFUlJPUiogRmFpbGVkIHRvIHBpbgo+IGZyYW1lYnVmZmVy
IHdpdGggZXJyb3IgLTEyCgotMTIgaXMganVzdCAtRU5PTUVNLiBMb29rcyBsaWtlIGEgbWVtb3J5
IGxlYWsgdG8gbWUsIG1heWJlIGNhdXNlZCBieSB0aGUgCnByb2JsZW0gYWJvdmUsIG1heWJlIHNv
bWV0aGluZyBjb21wbGV0ZWx5IHVucmVsYXRlZC4KCkkgd2lsbCB0YWtlIGEgbG9vay4KClRoYW5r
cywKQ2hyaXN0aWFuLgoKPgo+ICQgZ3JlcCAiRmFpbGVkIHRvIHBpbiBmcmFtZWJ1ZmZlciB3aXRo
IGVycm9yIiAtUm4gLgo+IC4vZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYzo1ODE2Ogo+IERSTV9FUlJPUigiRmFpbGVkIHRvIHBpbiBmcmFtZWJ1ZmZlciB3
aXRoIGVycm9yICVkXG4iLCByKTsKPgo+ICQgZ2l0IGJsYW1lIC1MIDU4MTEsNTgyMSBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQmxhbWluZyBsaW5l
czogICAwJSAoMTEvOTE2NyksIGRvbmUuCj4gNWQ0M2JlMGNjYmMyZiAoQ2hyaXN0aWFuIEvDtm5p
ZyAyMDE3LTEwLTI2IDE4OjA2OjIzICswMjAwIDU4MTEpCj4gICBkb21haW4gPSBBTURHUFVfR0VN
X0RPTUFJTl9WUkFNOwo+IGU3YjA3Y2VlZjJhNjUgKEhhcnJ5IFdlbnRsYW5kICAyMDE3LTA4LTEw
IDEzOjI5OjA3IC0wNDAwIDU4MTIpCj4gN2I3YzZjODFiM2EzNyAoSnVud2VpIFpoYW5nICAgIDIw
MTgtMDYtMjUgMTI6NTE6MTQgKzA4MDAgNTgxMykgIHIgPQo+IGFtZGdwdV9ib19waW4ocmJvLCBk
b21haW4pOwo+IGU3YjA3Y2VlZjJhNjUgKEhhcnJ5IFdlbnRsYW5kICAyMDE3LTA4LTEwIDEzOjI5
OjA3IC0wNDAwIDU4MTQpICBpZgo+ICh1bmxpa2VseShyICE9IDApKSB7Cj4gMzBiN2M2MTQ3ZDE4
ZCAoSGFycnkgV2VudGxhbmQgIDIwMTctMTAtMjYgMTU6MzU6MTQgLTA0MDAgNTgxNSkKPiAgIGlm
IChyICE9IC1FUkVTVEFSVFNZUykKPiAzMGI3YzYxNDdkMThkIChIYXJyeSBXZW50bGFuZCAgMjAx
Ny0xMC0yNiAxNTozNToxNCAtMDQwMCA1ODE2KQo+ICAgICAgICAgICBEUk1fRVJST1IoIkZhaWxl
ZCB0byBwaW4gZnJhbWVidWZmZXIgd2l0aCBlcnJvciAlZFxuIiwgcik7Cj4gMGYyNTdiMDk1MzFi
NCAoQ2h1bm1pbmcgWmhvdSAgIDIwMTktMDUtMDcgMTk6NDU6MzEgKzA4MDAgNTgxNykKPiAgIHR0
bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCZ0aWNrZXQsICZsaXN0KTsKPiBlN2IwN2NlZWYyYTY1
IChIYXJyeSBXZW50bGFuZCAgMjAxNy0wOC0xMCAxMzoyOTowNyAtMDQwMCA1ODE4KQo+ICAgcmV0
dXJuIHI7Cj4gZTdiMDdjZWVmMmE2NSAoSGFycnkgV2VudGxhbmQgIDIwMTctMDgtMTAgMTM6Mjk6
MDcgLTA0MDAgNTgxOSkgIH0KPiBlN2IwN2NlZWYyYTY1IChIYXJyeSBXZW50bGFuZCAgMjAxNy0w
OC0xMCAxMzoyOTowNyAtMDQwMCA1ODIwKQo+IGJiODEyZjFlYTg3ZGQgKEp1bndlaSBaaGFuZyAg
ICAyMDE4LTA2LTI1IDEzOjMyOjI0ICswODAwIDU4MjEpICByID0KPiBhbWRncHVfdHRtX2FsbG9j
X2dhcnQoJnJiby0+dGJvKTsKPgo+IFdobyBrbm93cyBob3cgdG8gZml4IGl0Pwo+Cj4gRnVsbCBr
ZXJuZWwgbG9ncyBpcyBoZXJlOgo+IFsxXSBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZwYXN0ZWJpbi5jb20lMkZmTGFzakRI
WCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0MxNWVmODNl
NDYyZTA0OTQyOWJlMjA4ZDhiNWI2YzZiYiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUx
ODNkJTdDMCU3QzAlN0M2Mzc0NTkxNDM5NDI5ODE5MDglN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4
ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhW
Q0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9VWo5T2IzbFVDQXNIOE5yeEM3MTV6U2ZsNVlxYzQ0
eVNWbyUyRlprZHlUcENNJTNEJmFtcDtyZXNlcnZlZD0wCj4gWzJdIGh0dHBzOi8vbmFtMTEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnBhc3RlYmlu
LmNvbSUyRmczd1IycjllJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1k
LmNvbSU3QzE1ZWY4M2U0NjJlMDQ5NDI5YmUyMDhkOGI1YjZjNmJiJTdDM2RkODk2MWZlNDg4NGU2
MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ1OTE0Mzk0Mjk4MTkwOCU3Q1Vua25vd24l
N0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJ
NklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT11OGlyTVUzaThjMzdXNVNr
eWlhQWklMkZ0d01vUG9yZXptM05JMUVZSTNjc0UlM0QmYW1wO3Jlc2VydmVkPTAKPgo+IC0tCj4g
QmVzdCBSZWdhcmRzLAo+IE1pa2UgR2F2cmlsb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
