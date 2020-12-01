Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7B2CAB33
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 19:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2C56E896;
	Tue,  1 Dec 2020 18:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253BE6E893;
 Tue,  1 Dec 2020 18:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2xzAiHnK/Y7RP10n2pd5TZC0FOQmaCdMzxW3gBBVQDGdXF2E9K/aDYQbdDQ1jNtDYUu9MT+jaid/h6IiiDfVR2kc717G2O4w5yA7A6a3cFDzovq5ocCxuKl2KqhDd8HdPjs7864wgScmNWbD0Cd/i0az8CaV/gGDqiUC1ezgRch/8n6Kg9qEd07Q7XLFxBQwbAIlJTczNepPF6M5w4/VKJSSJq9yYyZEMEf3RsctCf5rPN03rzMZcTBNXAXuSi6YD8xs4tE4dEtlYBUx88N4OTiKOFDOkwo7lMOLFKiPVMCSpTmg7Sh2xVyTc0mcuNk2RrKB++u+XW1c2S6bLbvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAjhx+2q31NurzMqe0SCva3xZYBRRm+VllP4k9fo/tA=;
 b=LXrQs/LUNBHdjS5gmihEjpR8qRHfLXV0+9I/dE6iiseER1PEGAT25nWIIkIFrjaUPP6Cl4XWcIn8t7v5hUkNNRu3DBcogPBOTCdxyE9EZNOIbJaSMiRy/KB0zKHdShC0JUWa9HII4Dtdoy67cHH1nIsrSufXvLj2vdaGakcWQWpNgENOsBBdl+DH1b9wbyGzr0wGrKwKiABQP1gq+11lBVhknK5KbgF15gORiBWGcvMt+MdOrcUQVHCM9P1AXIICoEggACi7hGvBxYJZO4EUeHKz3I8NP7fEgQU8Ft+7vwtYDrgIQxCF3U+b55O0mqxrPQBcXO7og6xRV2uyZWTaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAjhx+2q31NurzMqe0SCva3xZYBRRm+VllP4k9fo/tA=;
 b=xsb3Er3OvaaOA0vGLB5Q0aIeSY26k1iRXY/6Eewp4eMm3Rm397CmsTJPCX+mlg9WgJqJ5UMBg6K3E8yRJ8YTywrjhqovMlXyoH2FhcCZSdfcQzOXKu9lABsfK4blbr2btCVTk8jA1IyGW3IlkBx5fc5smDIe7stW8+/oW6C6zhM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4867.namprd12.prod.outlook.com (2603:10b6:208:17e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 18:59:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 18:59:25 +0000
Subject: Re: [PATCH 34/40] drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Use
 'gnu_printf' format notation
To: Alex Deucher <alexdeucher@gmail.com>, Lee Jones <lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-35-lee.jones@linaro.org>
 <CADnq5_On90z1w=_usmjA7kHFVig3uHg4VJRecDraYZv8cmRAUQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b5050f44-9542-2ae3-c019-c9821f978cc8@amd.com>
Date: Tue, 1 Dec 2020 19:59:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADnq5_On90z1w=_usmjA7kHFVig3uHg4VJRecDraYZv8cmRAUQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.16 via Frontend Transport; Tue, 1 Dec 2020 18:59:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7b8fe07f-4558-47e4-b7b7-08d8962b38a1
X-MS-TrafficTypeDiagnostic: BL0PR12MB4867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4867C8FB10C08A493BFFE10283F40@BL0PR12MB4867.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:28;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g8pcbjvreavuGwJG/+1GrdKgNUfaHx/DsnB5G2O+97+/7Iuuz4nx6kFcCK8tcIebjOcKR1wnNyy7vQ7mapd5q6oxXPFb+ObBStEA9omEG5LIAQleUuacN0xb0TvheNMSovu2/l8LJiMC5mZyudMFXfngOJJrYJGfaPs5ThYdKm2VHxNiBMaQYTBKvef8yHf2kg8Qc5LJIZrvduktmBFIKlGrOiTLdt49tXqYdy2Gtx3YCtufygVafhW4wcCgKL8MN6qg5uAC1OGIrlizztBqm5JXC44KKFsAlxhmbTg4Ldqjkcm3lSLNPNZQyXwLl52Puy3Dof+R3PITaP7FzJ3qDgWCnV9E7wrNQTjwMzSrTJDa7YnoV59a41/Hg9g5qMR78TdaXluKKkp3KQlLBSXblgPwxreDmtodLfLmlZMqnbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(186003)(66556008)(66476007)(66946007)(31686004)(16526019)(498600001)(966005)(54906003)(4326008)(110136005)(45080400002)(83380400001)(2906002)(53546011)(6486002)(36756003)(5660300002)(8676002)(2616005)(31696002)(6666004)(86362001)(66574015)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzEwZk0zUkZENnZGeVRFTVNFMGF4RDd4b1VKdjFtRW9POTJPRDBzSHhpNG1P?=
 =?utf-8?B?ZW1NTVRmdis3NzROeFhsNnowenVPTDV5OURYWUNjbEI1WWdLQlNPTWM2T2w0?=
 =?utf-8?B?cHZKaEp2RGc4TlI1VnVZRzNnSkoxNWFTSWRmSU1INnJGdis1aHZlWnlWait6?=
 =?utf-8?B?VHFPeVZ2S0o5Z25DKzdxdXZhSE5yaDJqKzZDVG1iS3FnRi83TWppZktOdjZy?=
 =?utf-8?B?RzJ4NklMV2Q3YWM3a29QV0lwWUdMU3FjOCtzdHlxMUtwQThSMWxmMjZ4V2l4?=
 =?utf-8?B?VlN0SUZodlBJbHVLQWdHdS9RS2lHc3RjY2U4OHhPRXk0bG9TM3oxcG1aazh0?=
 =?utf-8?B?MVMreURza0RmejF6S1ZKNjIvZkpKU1NrZHNhZ2NBdnN2dzk1MEtRYm9vamRB?=
 =?utf-8?B?SVQ1clUzMGkrbHd6aUNndFFFSHFXTWhmd0JwWWZwS2NGcEgxcGdLdWlIMFJl?=
 =?utf-8?B?WlYrNThqWWF1c081ZW1zSThrYzVLcFY3QU1XZXUwNXJ3Y1NCVjBleHZMbUZa?=
 =?utf-8?B?M0U2TFdRTFppU2NRRDh5T1ZxRm5lL29xd1A0Wlg4a1FQMTBSelhBMEUzL3hZ?=
 =?utf-8?B?VjU4aWRtQnVINmVFS3FobXB4L0xqQ0xRMnZORkwvYWdIbFZsd2NtWjlaamto?=
 =?utf-8?B?ekx2YWZzcS9DUnB1MU1TcFpwRyt4WGJrS0tTVm53aW55RVIyZGJBT1FBSFkv?=
 =?utf-8?B?cDdQSzJPNUpTZ3pmOGRGOGdra0Zub1RIa1ZNM0FEdE9ydmFnRU9mZklwM2R0?=
 =?utf-8?B?RzdkNTZFMXRnYW1OYkdhZlFkUDM0M2x4MUo3QmU2Z2pqVkVLOUQ1S1VJZnN3?=
 =?utf-8?B?eDBtNlBpc2tKc2ZRS2h5WkVxb0g3Y3pvbnlJbUZMNGc4ZnZETk94UDRxQnhx?=
 =?utf-8?B?bDdTRHJoVFNJRlppMnIrTjRLZ3NkMTBFb1gxMUtmT1psdnlGWk0ydGRaa00y?=
 =?utf-8?B?UzhBYjVyMzV0V3BqQlRJTlBuaWI0QmFYNm1ydFY2UTdJRDV3ZHFQVFhObG5v?=
 =?utf-8?B?MTU4aHFEUW1rU0VsMmwyMkJvWVRlRVFJRXgxNHREWWFoc1JLWjV4eFVLUjBt?=
 =?utf-8?B?RGVHOXFkQXR0QXdPSTFUWTdZL2VrZDIrNkwwTFMvdW5tZHdSK0h5TThCaWJs?=
 =?utf-8?B?MmdnWFE0ekJ1RUZSQUhNMUdhU1lYOWNoMkFjZTR3alFqUEdBL0J4cVNoQzBo?=
 =?utf-8?B?K082NHI1RXViZkExS05Wa0dGRkhLWnMzdTU0enFaYVZpem9ad2V4RGlhZ0Zv?=
 =?utf-8?B?MmJZYTJXYlFMUVdIMzRrTFd1eHYzOHBidFFOVHhoNlJRN1FXUk1iTSt0ajhQ?=
 =?utf-8?B?ZzN5M09IUWRCVDhIZVNETUVsRGVzMUtwWnV2NlE2ZHNldmJ4azlIN1hhVDJu?=
 =?utf-8?B?eDZtYXdvVVNOczdFNnFnUDVxQU9ZR0ltQU9mVnZGWElFK3FJTzJHb2l1Uzd5?=
 =?utf-8?Q?gaRoZqDW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8fe07f-4558-47e4-b7b7-08d8962b38a1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 18:59:25.2536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JE1RmYeNLLcNsCR6qJpQOovQURaRStJLRZyEe6C8r6S6u8V85DKrzPQAqANjwJl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4867
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDEuMTIuMjAgdW0gMTk6NDIgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gVGh1LCBOb3Yg
MjYsIDIwMjAgYXQgODo0NCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90
ZToKPj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4+
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX2hlbHBlcnMuYzogSW4gZnVuY3Rpb24g4oCYZG1fZHRuX2xvZ19hcHBlbmRfduKAmToK
Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1faGVscGVycy5jOjM0NToyOiB3YXJuaW5nOiBmdW5jdGlvbiDigJhkbV9kdG5fbG9nX2Fw
cGVuZF924oCZIG1pZ2h0IGJlIGEgY2FuZGlkYXRlIGZvciDigJhnbnVfcHJpbnRm4oCZIGZvcm1h
dCBhdHRyaWJ1dGUgWy1Xc3VnZ2VzdC1hdHRyaWJ1dGU9Zm9ybWF0XQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmM6
Mzc1OjM6IHdhcm5pbmc6IGZ1bmN0aW9uIOKAmGRtX2R0bl9sb2dfYXBwZW5kX3bigJkgbWlnaHQg
YmUgYSBjYW5kaWRhdGUgZm9yIOKAmGdudV9wcmludGbigJkgZm9ybWF0IGF0dHJpYnV0ZSBbLVdz
dWdnZXN0LWF0dHJpYnV0ZT1mb3JtYXRdCj4+Cj4+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnku
d2VudGxhbmRAYW1kLmNvbT4KPj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+PiBD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+PiBDYzogIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgfCAxICsKPj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwo+PiBpbmRleCBiN2Q3ZWMzYmEw
MGQ3Li4yNGE4MTY0MmJhYTI2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCj4+IEBAIC0zMTgs
NiArMzE4LDcgQEAgdm9pZCBkbV9kdG5fbG9nX2JlZ2luKHN0cnVjdCBkY19jb250ZXh0ICpjdHgs
Cj4+ICAgICAgICAgIGRtX2R0bl9sb2dfYXBwZW5kX3YoY3R4LCBsb2dfY3R4LCAiJXMiLCBtc2cp
Owo+PiAgIH0KPj4KPj4gK19fcHJpbnRmKDMsIDQpCj4gQ2FuIHlvdSBleHBhbmQgYSBiaXQgb24g
d2hhdCB0aGlzIGRvZXM/CgpCZWVuIGEgd2hpbGUgc2luY2UgSSBsb29rZWQgaW50byBzb21ldGhp
bmcgbGlrZSB0aGlzLCBidXQgSUlSQyB0aGlzIAptZWFucyB0aGF0IHBhcmFtZXRlciAzIChtc2cp
IGlzIGNvbnNpZGVyZWQgYSBwcmludGYgZm9ybWF0IHN0cmluZyBhbmQgCnRoZSB0eXBlcyBvZiBw
YXJhbWV0ZXIgNCBhbmQgZm9sbG93aW5nIGNoZWNrZWQgYWdhaW5zdCB0aGF0LgoKTG9va3MgY29y
cmVjdCB0byBtZS4KCkNocmlzdGlhbi4KCj4KPiBBbGV4Cj4KPj4gICB2b2lkIGRtX2R0bl9sb2df
YXBwZW5kX3Yoc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKPj4gICAgICAgICAgc3RydWN0IGRjX2xv
Z19idWZmZXJfY3R4ICpsb2dfY3R4LAo+PiAgICAgICAgICBjb25zdCBjaGFyICptc2csIC4uLikK
Pj4gLS0KPj4gMi4yNS4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91
dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWls
bWFuJTJGbGlzdGluZm8lMkZkcmktZGV2ZWwmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5r
b2VuaWclNDBhbWQuY29tJTdDNTBiZGJkMmZiN2E1NDAwZTkxYzAwOGQ4OTYyOGQxMWMlN0MzZGQ4
OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MxJTdDNjM3NDI0NDUwMDUzMTgxNzgz
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1
TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPWFmelNT
dSUyRmJhMCUyRlFpd09hbWVKUk81U2dzNWpvUlBvbmRXUXglMkJ5UVpabFUlM0QmYW1wO3Jlc2Vy
dmVkPTAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
