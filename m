Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17A636B953
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 20:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC3B6E1D6;
	Mon, 26 Apr 2021 18:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5246E1C0;
 Mon, 26 Apr 2021 18:46:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZkHuWGsQ+Gra+f2RERpNEg2rxOYzYEuzIlPfUBrZqd1bo4QHBQ7cVbAr3ggm3Hw10cWU+D2v9Jlf0GQgJatAOymKzU4l3IoMGrmNvB+lF6iK/AWG7/JtHXjDhP2fRFedJ7ezUVMtuHBzlQofbTdOKXg1u2a1pq+WaBTBgw83xIvwyxqJk1oanEo2LWnuaiC3eW2zWfspaAvxnL9q4RlrWVEFZ3gLDYUkRcR6jUsG5iW9/2Fj+LDVzLC5puOQyfk58OiCiEIYTRE4nOiAe9QahxIkwCfVIaxeu7kR4w3EJuuRli4AJhgYtcKXOUBgTaQjwiDg1tXUNr4vqd8XVweug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDHsPuE0I8oQJ5vr8gtCgZumZDTKIxt6Pzm+C5KXCHA=;
 b=AOthzeWe2rXBs6DpMYAG8TUNiUAP4eXmVxSHa6LGuZO5FgTg7O4+0oeaV3f4eh2jPsjAU9LcXJAOBBRsJdLc+5pbEs7ndSBA1ijQvuOGBDHJ9dBVVguPXuM7hLFB5H5uESPWOKKNEjXaQskqsmv7PR1OLhpRgy68XCq/JD333I/nHNHorWLUYgBA5SvOMgAtjjKft3TdBs/iZmnF72/HA73m5wUbuTtfzFjPykyVh8xJjBc6mRQHc1G4pdGccB4FICSoVQjLtaVZXqARBdK0kLsjHeGKyu7QVcZEzuc06SJ7xEt15B55kKgzQ5j4/9dtNcMLIYnrouG9gZGI8+3Wdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDHsPuE0I8oQJ5vr8gtCgZumZDTKIxt6Pzm+C5KXCHA=;
 b=g4EnkI+Jlf6YWpQB1aw+qOV94BDC+Ru7lEr/jV2cYKljUEd1BnJRxsX4lVx9G1DiN9gtPPdBD4kZ+Cg4+zvJMUrS1AS0rXkUaUXmUzO5cFRJCUAzJom+soQLYIT/wgK/OXU0lWz/O2EHOCZxj4fPhw4vUYCMwYCOEf5fkjaNFdg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Mon, 26 Apr
 2021 18:46:48 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Mon, 26 Apr 2021
 18:46:48 +0000
From: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH][next] drm/amdkfd: Fix spelling mistake "unregisterd" ->
 "unregistered"
To: Nirmoy <nirmodas@amd.com>, Colin King <colin.king@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210426121304.83256-1-colin.king@canonical.com>
 <196cd921-6078-fb64-682c-5962310947f4@amd.com>
Message-ID: <995b3180-2fa7-5fd1-8013-bd8ae3486f10@amd.com>
Date: Mon, 26 Apr 2021 14:46:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <196cd921-6078-fb64-682c-5962310947f4@amd.com>
Content-Language: en-US
X-Originating-IP: [142.182.183.69]
X-ClientProxiedBy: YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.183.69) by
 YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Mon, 26 Apr 2021 18:46:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca473c24-9a8a-416d-76ed-08d908e3a5a9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4095:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4095DFDE535D793BC1B2FE5592429@MN2PR12MB4095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gr0GpsdCZGKury5d/i8zewckUeHp/O/mjqrKlJ+E8ROuz9FLkaqzsfjs8ko62P5CE9SAX3QDpZvvzkCyB45FRwpNUsCHYjiNjwtv0pKucEYh/iqC7hdgHn0oj3tXAYMqG1ieRIVTSNfqc+02FFAewsrp338CKt97YKhxZZDaGZXWCm+2ueMqYkUj0rHt/60TRXwSFpDmGOLgbnt4L58jiI5VeG8AVnmO5V22THWBRkkKYUXTuRGkLdoWaUtc9bfaVB9a4sUuSB7Ivei9OVQ8lll0lFoVwUYr/ZusTkRKuG6y6zVLf94YGFAYHUIb+vAAf0sPOgZxiGOFBdxHQ5uYJ2zdora6GUHVvciNEJK/UEO3W/EEW/XQrwLFAg04b4FTGAFpCTpmHIKjTyRgdxQgeTFmZobUsF33cc8oRSSNw4oBfMORF7qFFjIwq2fEPZAgpyhAk7wcLETA7MhA9dvPUVyJZMOYYfSg5/KR7TFMjH2kpSIRX2QJns2EVIHbPNRDZybYxFRYjKPPuIEq67gGJJ5QSV9HJmewbULarxpHlBaKv9h1cbrNoxlxKqeVpPxcP5cuTY3yV2Vr4cIVpA8YnkRrkDhN6zwJBpNUOr0/xODzjaPIq7hI9fTWJN3zPmXQy8rNJBLONVyr09aEKxFG417MDUhnlSLJOfpJM/JVaryY4593JHv88MhRJTD974m3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(26005)(53546011)(8936002)(2616005)(44832011)(8676002)(66556008)(16526019)(956004)(186003)(6486002)(83380400001)(36756003)(478600001)(5660300002)(16576012)(31696002)(4326008)(86362001)(316002)(2906002)(66946007)(110136005)(38100700002)(66476007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eVFhSENLMVphb0V3ampYZlNOOWlwOEhXL0F0bHdwTFVGRU5vVE9pODVDZTFt?=
 =?utf-8?B?Z3ZDNlpaYjFZQjV4TW1jS3hvTHlCR3RxR0wwbjVhUGgyRDF3ejVEMDZHQXhZ?=
 =?utf-8?B?VHovU1FYSWU3RzQ1dUZ5YWpCVVJqbTNZMHFxOUJJUUxzL1dWSC9JdEdkb3hs?=
 =?utf-8?B?UEZsb3Y5R0xHbkZUT0VxVVdtOU45QWpHRzVQOU1UM0J0KzZnTVRXcFJlMG4y?=
 =?utf-8?B?akJLWUt1QWRPU1Fua3YxelJDTHYxUmxsbDFXd3Nxc280Zzh5UU96eVZacTYy?=
 =?utf-8?B?SUhVZjRHaytsYkozdzhFODdJS05UcWhyeXJLN2R0RjV0a3NKUlpIdlZ6Nk0r?=
 =?utf-8?B?Qnpvbm9YaU9zbGZzK3A5bzFiTmRMM21DakJacXc5cUxHbEk4c0tPUUlGOWNw?=
 =?utf-8?B?RWpNT0RBM2thOGVNbWtEd01oVzFKYVVGS0hlamo3M3ZhWGFpY04vQmtmc0ti?=
 =?utf-8?B?TjkzZHZRb1U4M2pGKzNaYUpZVEZUK0IyZWcydWNjMTFTSFVXYmxEeG8zRzRt?=
 =?utf-8?B?aDdMVEhtYWJOMzBJK2NuZkMrUTVnRUhXYjR3WnJueWt6S0hIM0prREo1TFNU?=
 =?utf-8?B?WHhtdVM1V25NYmlmU3NMaWpKcEVlTzNTT3NVaG1qb0FHdmxDdVpBKzZOdFYx?=
 =?utf-8?B?d0pHamRHT3BDNlVvbjYzdTRxSkEvaEhxWFc1ak9zRGxteHJIWVo1d3doSFpX?=
 =?utf-8?B?SW1ybGMweUJjbzlObER6dVNQL29yUG9mbXFrck9ibTBDZVFpRWJjeVBTTFpF?=
 =?utf-8?B?VytWR09SR0lxQWdzb2ZhQ1M1ZzEwSzhwb1pWTEUxT3VJU1NKU0tEKzErNVl2?=
 =?utf-8?B?d0NSanBjMVl5WGlaZHZCeXlQbE9ySy9wT09waCtjN0hFREs1R28wT0pVL2Vz?=
 =?utf-8?B?Mk9PeXJmdzBPd0dUT2tiTDRnTVZoajZsSnhlaTZNek80NlJpNnlsd0h6ZWRm?=
 =?utf-8?B?aDZIa25XcGJTbGhTZmdDdU1xVmJpdkUyR0hBaGE0U3hWY3E5UWhEN2JuMDRw?=
 =?utf-8?B?bFgzSDNtbStzWDUwUWNZTXZuLzdLT2dURVlURVhmaUNkaWxXK2JqMVRhNUdi?=
 =?utf-8?B?K3k1am0ydUZQT3JWc01VcGJPZE1CL3VZNC9tMWdlV2c3MlNqeDh1N1BXbGJh?=
 =?utf-8?B?cUJ5V3JScEtTZW1uR2ZVMVZKZDZ3ZzBLMGpNcERxakxNQjkzbEVvZ21hQlpO?=
 =?utf-8?B?Y0FWRTg3TVkvOWxEbGNDNVU3NU5YckF4eWZxRTUyR2VjRFdhVXdQQzRudGdv?=
 =?utf-8?B?QXJCQWtDb0VwS0M0WWxmT2ZHVXFoRWR6ZFJ4S2RXZkh1NjB6cnB3ODFmd3VG?=
 =?utf-8?B?aUh3WENnbytxcG51ZEN6Q2l6elZ0WGNjZWcrK0NTbkRzSThKU3g2MURZaER6?=
 =?utf-8?B?YU1CZkNhbEtHMytxUitORjY5cXB1Qzc4ZHZRN1hqajVKenZqam81Z2lBUito?=
 =?utf-8?B?SisvNW1WWWIvd25Kd0E3L2lyMlgrN0tQWG1RWTZVYUUyMlB5dWRLZzhMaW5C?=
 =?utf-8?B?MlhLK0hLaTlxRXF0SzZ0a3B1RnFCWGV2UGw5akdHTThhUmJOVlpRTHQxSWF0?=
 =?utf-8?B?cEtYcVE1L1o3L3VlSFhRUkx6MUtRR3gyNHNaMmZGYU5SSitkUHh5WS8wRjBy?=
 =?utf-8?B?N2ZhbSt4RVp4WExQZjFMWlUzVXV4RTFEdUMydFRzek44QmRVQ3g3VFV0SUdR?=
 =?utf-8?B?R0NqZk12WVc4TzQvSEdkSjlwZkFsNGFSUDh5b0VLaElDaUNiRDB1VFc0QnI1?=
 =?utf-8?Q?EAs8CI3HuWghECZn/ISqgp5axBctTs6oKXG1B3A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca473c24-9a8a-416d-76ed-08d908e3a5a9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 18:46:48.1432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNrD5VAiVJNpgg1yoqK4jA8cTaRnGFUHD49XyM7twG5M8bdsS2wh2lBMMwmlRNIYw8LqmJpY68pmzom0PCZPlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0yNiA4OjE1LCBOaXJtb3kgd3JvdGU6Cj4gUmV2aWV3ZWQtYnk6IE5pcm1veSBE
YXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPgo+IE9uIDQvMjYvMjEgMjoxMyBQTSwgQ29saW4gS2lu
ZyB3cm90ZToKPj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNv
bT4KPj4KPj4gVGhlcmUgaXMgYSBzcGVsbGluZyBtaXN0YWtlIGluIGEgcHJfZGVidWcgbWVzc2Fn
ZS4gRml4IGl0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPgoKQXBwbGllZCB0byBhbWQtc3RhZ2luZy1kcm0tbmV4dC4KClRoYW5r
cywKwqAgRmVsaXgKCgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3N2bS5jIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9zdm0uYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uYwo+PiBpbmRl
eCA0Y2MyNTM5YmVkNWIuLmU0Y2U5N2FiNmUyNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3N2bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9zdm0uYwo+PiBAQCAtMjI4Niw3ICsyMjg2LDcgQEAgc3ZtX3JhbmdlX3Jlc3RvcmVf
cGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UKPj4gKmFkZXYsIHVuc2lnbmVkIGludCBwYXNpZCwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHByYW5nZSA9IHN2
bV9yYW5nZV9jcmVhdGVfdW5yZWdpc3RlcmVkX3JhbmdlKGFkZXYsIHAsIG1tLAo+PiBhZGRyKTsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcHJhbmdlKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHByX2RlYnVnKCJmYWlsZWQgdG8gY3JlYXRlIHVucmVnaXN0ZXJkIHJhbmdlIHN2bXMg
MHglcAo+PiBhZGRyZXNzIFsweCVsbHhdXG4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBw
cl9kZWJ1ZygiZmFpbGVkIHRvIGNyZWF0ZSB1bnJlZ2lzdGVyZWQgcmFuZ2Ugc3ZtcyAweCVwCj4+
IGFkZHJlc3MgWzB4JWxseF1cbiIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdm1zLCBhZGRyKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW1hcF93cml0
ZV9kb3duZ3JhZGUobW0pOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByID0gLUVGQVVM
VDsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
