Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1AD2C7F79
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529A46E40A;
	Mon, 30 Nov 2020 08:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7524C6E409;
 Mon, 30 Nov 2020 08:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7uxUGi9LXG9dzEOBd6HocWdI/TGlF5faNOctynci1QlbRRKiW9YyrsbBMk5CVBOPlgZCelHtD6gImwdew/PEH8BgqXoGZis+8FdxtjP+UNwkSYJLaM3ZMijLbMTR8cIkN/MGBs0DiO96/sgffvFZHw2Nlizb/f+BO7TkC1/StA/co0lE8HRCxidxCPqIpBty9BNB3iLdiYcokfsEHIfowQwLLQW/cjIhVcedgazGoWaMMQ39HddDj31oJpvLJMd4SgPsdH+7y+JqG30EDQLa0ZW1oD7Do1n50u9fu8UyyQoNw8PK34+CFzDEJFTHK58QT/7Ad2yAyDG/J8rgtFlAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfT098x6O37EqXhhFT76Up+MyHdvzkyDgWcTTtSfE60=;
 b=FbWOHpRk7fNahIQOBrBkb0G3eV8y7JHNXjFoGoAmzZp5a+xz1fpyP5KBd/X+Vz6Yaq1Yjctsm2qAT09jl7K5hGtU5c1GnE6ib/NrBvpwVOeA8tPbsbShVUm4zYgOZEvMHWw04Rfn6mcDuFQoZlnev2ALMxZVAwB4+rqVdjaeN2weNGJNGkYKbgMSbzlbezpJWwh5BN8mC6vo68j5k+4FiFdCZGrHJCJlBiczVQOyvru3dBlAMZgkMpO5AF0bKiSD0IA9rJqY/eic68+tW2bPPnBX2suErGnK7OhztImP8T31JoDOFXe0VJMFCIh0Ie8UW57Pd9vvWko7qgI0IG9q7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfT098x6O37EqXhhFT76Up+MyHdvzkyDgWcTTtSfE60=;
 b=V5UzsppR/V1fWiL6/tFkX1gpG92WQkq5MCbJIyyQRbwJHxaedV8bJ4MGemSEL4TTXeqZ6MafZoBPpwu9hs/sM8/a3shuA9NxDGLdnQu9vwqD+RT5Ljey7rLWvrnqzqTcZ/hsNdDZ+whPTirptql6XbFti/83NehZYkpgdrzWTi8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4755.namprd12.prod.outlook.com (2603:10b6:208:82::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 08:00:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 08:00:56 +0000
Subject: Re: [PATCH] drm/amdgpu/display: remove trailing semicolon in macro
 definition
To: trix@redhat.com, alexander.deucher@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, evan.quan@amd.com,
 Felix.Kuehling@amd.com, luben.tuikov@amd.com, Dennis.Li@amd.com,
 andrey.grodzovsky@amd.com, Joseph.Greathouse@amd.com, jonathan.kim@amd.com
References: <20201127162607.2656353-1-trix@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <01583ef8-4d70-82b2-a643-754d95d47a0a@amd.com>
Date: Mon, 30 Nov 2020 09:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201127162607.2656353-1-trix@redhat.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:208:1::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0062.eurprd04.prod.outlook.com (2603:10a6:208:1::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 08:00:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca18d484-b665-48e2-d41b-08d8950610d7
X-MS-TrafficTypeDiagnostic: BL0PR12MB4755:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4755650B209323F158BB7D8683F50@BL0PR12MB4755.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xcd7qts3TEJ44tPQD1rQXLTfHykQ7E6k0Pz52K6e5xHmcTHZOQUmbJkx+AeZ4xZOc23/672pOlUmUHQyWY3JDIotQwbU7Ox5RuvjfOR7ZVHHUPCvm0cY/jrdwjasA/SOpDG4rOuLG3Y3SEPOP/kCgJJpg5OLkfwMbPdn5jcmtV9VyAVj47aCIptscbRdZ/qS3PaQ5wfMq+c4gATj+44jfCba5G6MRnyWTVBLRxlHsYkGgHncvkJftCdP4BJgPkqOeDuXMxTy2AGbhSkCLUvaIFjMVylVZFote8Fda0vXrnY5y9FvaEh5Q9Scqm2APztmGrZ2s0oXJvnsquFaaaTJH81ABNUR4QEBTxAwGxrFi91svv3X5qp7l67Hh+JkvJlw6F0p0aAWh6MxHb118gpHOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(8676002)(2616005)(316002)(66574015)(66556008)(6666004)(478600001)(6636002)(66946007)(36756003)(83380400001)(31696002)(186003)(2906002)(8936002)(66476007)(921005)(5660300002)(52116002)(16526019)(31686004)(4326008)(6486002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K05kWmx5WlBHa01OZU5xRU9VRHQyc0JvZWFJb0l6TnJ6Y1l6a09MNkdIZXRS?=
 =?utf-8?B?YzhiRUo5WGVMQ1J2OHc4VGx5NjRTQzlZTG0yQnFrbUd4SkRKVVlIWDlJOWpz?=
 =?utf-8?B?R1B5eHlqM1JVVUFhQXVnRlJob2FEb0xpRTc5Y0VqeEZUVE0xV1pKRVJ6eTM1?=
 =?utf-8?B?d0xONEN5YXRkK2FtVVVqa2xHaTVmVno1KzR5QzBRaUhVYkc0UFJaYU5WSlJ6?=
 =?utf-8?B?WFN4aGpoVzJuY3Y4cjVNWk5Lb0psc2Fnc3Jtcm1GUHRFUS9DeFNhekwyQ3Y2?=
 =?utf-8?B?OXErMHcrb21NMTFRUURWeUxpVEx1dmQ4d3Vaak1zVXFkc3hRM3lmUGJVRS8r?=
 =?utf-8?B?c1JyT25SZFZxeElYV3I3b2N3SmJBTWlTUnBhcFJVRm5SYk45anRRZCtxeUg2?=
 =?utf-8?B?cERMbUhmR21hRnJrNkg3K1BJZ0lFbHYwSTMvc0JLNUJZQ3pEN25qMWh1NDY1?=
 =?utf-8?B?akhzcUdNK3BkT1YzRjlxRTQzaktlWnE2YzlmRStqNlpPNXkzSjFFTng3WjFD?=
 =?utf-8?B?YUhHVmI5bWoxZ3RTNHU0eHJ4ZlprbG9HVnd3RDZkdGhMRCt5cGEzNmRFcWhl?=
 =?utf-8?B?eERIL04yenZiaVZuWFNubDl4YlU4dWxIZzI3UzJmNE9neEJvWWFUM3pieEda?=
 =?utf-8?B?enE3M2lPNHlXNUlBb1l3RVNXckxIYy9uQTFvNFRjU0NndHEydHRBcUtyODlw?=
 =?utf-8?B?VHkxSXdtS3VqOTAzcUVUVGlMbHJ2cVVnZ29ucmZENnhBRkpVN0ZiYnN0dnRM?=
 =?utf-8?B?Zlg1U2NXaXhXcXkvTTVoODI1enBhdFkvSzRQR09VbmtMdzQwNzdSandVZTFj?=
 =?utf-8?B?WUJSWm1Tamt4R3ZSRjlyeVhvV3hxd2FIVXdBZC9oZE15OWNCbkdzL2laTEQv?=
 =?utf-8?B?NVdua3ZzU2xQTTBtejBlUTQzbUoxTW9YajB1Rnlxa2dMSmdCTndaa0t4RWRi?=
 =?utf-8?B?N0pjVzR5UURxZlBpYWszTi9NUFVNNjFRNTlaSlBjdXFLdWRHWWFVZWFidjd1?=
 =?utf-8?B?MFpiT0lsVEpydWVZd3pod2phVUdwK2NEcDlQZGxUREh5K1RlTzNvL2FlTDM3?=
 =?utf-8?B?Rzg4a2lUaEN6ZUN1NTY3ZjQ5blpUd2pIcE01THgrcTJPcE9rekN0SzFnQklY?=
 =?utf-8?B?L3puQ2FOODhMRi83WCtTSW1BbHJrWUlsRW1JL3V5L1lBa0JmeWNINWpEWHB5?=
 =?utf-8?B?Ulh3M3JVZlV1M1ZFemZjMklDL2JjdjA5eS9JSnZ0UVVaeVY0L2c0dytLYkU2?=
 =?utf-8?B?dEpuaVNPdEpXb1hnYTRCMk5qZ1pXTSsxNkViUW1tZlVjVTk4V2c0djlrZHlG?=
 =?utf-8?B?Q0VpTHZOSGUzQTBML0JYam9ZMTBIM0hLTUF3RVB1OS9GNWNhQ0NQdTJjeVVF?=
 =?utf-8?B?ZEpiMWJMNUJrQUdYcFdhZWZCQ0k3QU50cFRjaHhWSDR4STR2c0k1L2U5UXhX?=
 =?utf-8?Q?sD1MxzJB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca18d484-b665-48e2-d41b-08d8950610d7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 08:00:56.3804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TguXV0qTTwX7Hs1+JPWK0ZATnH7k7Tp0SXp5B9RtnDEy5qHWWf+fbJqwkB+bAu9f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4755
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMTEuMjAgdW0gMTc6MjYgc2NocmllYiB0cml4QHJlZGhhdC5jb206Cj4gRnJvbTogVG9t
IFJpeCA8dHJpeEByZWRoYXQuY29tPgo+Cj4gVGhlIG1hY3JvIHVzZSB3aWxsIGFscmVhZHkgaGF2
ZSBhIHNlbWljb2xvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNv
bT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggfCAyICst
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4gaW5kZXggZjljODFiYzIxYmE0Li4zMDFlOTNj
OWU3MmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+IEBAIC0xMjEzLDcg
KzEyMTMsNyBAQCBpbnQgZW11X3NvY19hc2ljX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpOwo+ICAgI2RlZmluZSBhbWRncHVfYXNpY191cGRhdGVfdW1kX3N0YWJsZV9wc3RhdGUoYWRl
diwgZW50ZXIpIFwKPiAgIAkoKGFkZXYpLT5hc2ljX2Z1bmNzLT51cGRhdGVfdW1kX3N0YWJsZV9w
c3RhdGUgPyAoYWRldiktPmFzaWNfZnVuY3MtPnVwZGF0ZV91bWRfc3RhYmxlX3BzdGF0ZSgoYWRl
diksIChlbnRlcikpIDogMCkKPiAgIAo+IC0jZGVmaW5lIGFtZGdwdV9pbmNfdnJhbV9sb3N0KGFk
ZXYpIGF0b21pY19pbmMoJigoYWRldiktPnZyYW1fbG9zdF9jb3VudGVyKSk7Cj4gKyNkZWZpbmUg
YW1kZ3B1X2luY192cmFtX2xvc3QoYWRldikgYXRvbWljX2luYygmKChhZGV2KS0+dnJhbV9sb3N0
X2NvdW50ZXIpKQo+ICAgCj4gICAvKiBDb21tb24gZnVuY3Rpb25zICovCj4gICBib29sIGFtZGdw
dV9kZXZpY2VfaGFzX2pvYl9ydW5uaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
