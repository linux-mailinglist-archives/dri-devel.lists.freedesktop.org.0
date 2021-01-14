Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053FF2F6284
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 14:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C99F6E3C6;
	Thu, 14 Jan 2021 13:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE056E3C6;
 Thu, 14 Jan 2021 13:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LS0QztITjC8WWvZBBx3BAfC0J84uzGjnba5RN/iUPE398mx4LSgusb2JaTvxAcE3BrkiyLATbzpHeKvAUeuVMjU5KxBwuuXpzJ5XxsfpfOOdYXSdpfH9Tb2aVbYK97eqNvuXJac0viRcgTd6pzMeOkPNkoe2GiG3V5eSVVr1va/OUzrl5DOmkkiLejuICnm956HvToybOTdBDCQkwUmdMqlxDHktOb4Ech2Xcv/OrHl4k58yFEl7XIEBjX2eUenCH1M1TI3RkHl3FgWcKt/FJbPuaAH7qrRs9z1Em3I/aXcVAMse0WD97KEwVIMo1/dE6Jro2gQYH/V68mQ4Cpj6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWUcuF2UEIKBuGkn+6MheWDLAhJQeHWdv+OVrZNW5Y8=;
 b=Xc58/pUdWatbTJz77Lbks7IS0hn9O+o7GTgSi92VzZuwjJFxoyo9UtpH1QalwwSS0JpwY8VlR78y/mkoCWhk3qzr0dKEUXBAabSgI2RctyaYVdJ96lnH0Teg819mO+kYGM6zRFoJQjJa8qbC8Lq4ubeYKen4nu6c3Q0JDt73w2f7cz7LNvd3DFA+JSRn4LHgGGFbn7A3RwZMi1HaGcGA9M/zmMlUgFkmV5fQDivDFi37mwUVdTbu4La6rbGHNeil89hw3mcHp5v+8jMvxwisaBaKOu92GyLIJnBoRYPM5ijQiL+HF+9vFbT0T7tydYx64abKVKPsTMfwr4Q35Qvrcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWUcuF2UEIKBuGkn+6MheWDLAhJQeHWdv+OVrZNW5Y8=;
 b=jmgrCtIh91vb5iws4RfpI5egeQe9E27smuXX9hAVn+9qdHT/slUkx0tLjLLBU2sDOn3b6kcvwtQXOod+9RdS1ZGMydiV2Wv52qZiejOtieVGwfe1SsERQ+HBWPBwfLkforc0LnTTQvwXR90HmujAkr/Z9oWPcoD6DzQmibycqGE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2452.namprd12.prod.outlook.com (2603:10b6:207:3f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 13:56:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 13:56:42 +0000
Subject: Re: [drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin
 framebuffer with error -12
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <CABXGCsPSYh-Nvfig4j4N8073vA6WDdhdg13meAcUgCr_pd5mYw@mail.gmail.com>
 <816e944c-72bc-d94d-449f-bfb915382290@amd.com>
 <6e55d84c-7b9a-167c-34cf-9e980f8e2354@amd.com>
 <CABXGCsM8yYNz7gQW26a4hHwBR+MunXoopHEiyDJdC-muNrRxkQ@mail.gmail.com>
 <77b696b9-3248-d329-4f7d-5e27a21eabff@amd.com>
 <CABXGCsOcBMT4rL-bb4K_TzK70YmQsgNX37sHEHiqp_1kK1_UEQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5f9e7752-68e8-aa5f-80ff-bb1196ea458d@amd.com>
Date: Thu, 14 Jan 2021 14:56:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CABXGCsOcBMT4rL-bb4K_TzK70YmQsgNX37sHEHiqp_1kK1_UEQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 13:56:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e1b2fd33-1e93-432e-8e67-08d8b89438f3
X-MS-TrafficTypeDiagnostic: BL0PR12MB2452:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2452ED4B36A7CB96DE92034B83A80@BL0PR12MB2452.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tXvLHKYHRlAh6iH1oNFp9dfTeFy+LWcNpFAx5/+PfLEe5OZVlPiCr5dqswFBuvt2RI4DGzceyhaOwq1yh037vmH/tWYJSAmev9NLksAx5LnUKR2+5fEn97BNHhP7kjprGnM2PmG/Ed594jUfJrEXSVCevsdicynqUF25db3uwVn52C9JhpZ7R/Z5HGWUDIna3lIKnykX0XwXWf9acFRXzSloC1kglL81JXTfHySKRCYwwS/tCqCz9EGq9vIUpUsU86a4hEdkGLWnuvy7KLNW+joTHdR4uGDcGOMvrWN6NfJGnytBDAWvSBDptH48AxMhGmtG9gGVAf2smDPCCAdNSViVPO0KKOIrMaIv+ctalJmiEdChBTI0u2Mpl/Rf/t8LnHWozhjn8o+Uhc6HSY3l440axdlzkriI9+4UWJwsJaj3yRRnuaf/CkiBDxd+SpnwiEeQH7YLoS90J52HFkXEDZ7WS5AB3hvKodOeH/wy5z3GJqThO+cEtZWFyqmuGuAeTOJ4kkc1QTHg0quI1FK0e/pZitckug4OJLNDarClcITrCbPPQf4UlPxJ8vOrxuqJte+D95VDQ5rMGbfmv72XSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(6666004)(2906002)(86362001)(4744005)(31696002)(66476007)(8936002)(31686004)(966005)(66556008)(52116002)(478600001)(6486002)(110136005)(2616005)(36756003)(186003)(83380400001)(54906003)(316002)(16526019)(5660300002)(4326008)(8676002)(66946007)(10126625002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eEUrKzNCZDRoRTNRYXVpbmFCQU5LUFM1MmdRd3VLVWc1VVB6UUJ4eGp3b0pJ?=
 =?utf-8?B?QTlzNzZaeThEbUdZT2dFbnJXREwvaFZ4bUhsVC81bzJzMUhXSG13WmE3UnMv?=
 =?utf-8?B?aE5HSDFTV2lBYzQybXpORGQwUkh1cXNkaUR6QzRRMTllVENvQnlubEptNTEy?=
 =?utf-8?B?dEpicXFsUkZLemgzTFRadnQwSG5jUExVbWQ0cVFTUFlWZ2NQNjkrWDhlUysz?=
 =?utf-8?B?RnYwU1AwWjM5cThUSSttQThxTlYvZTcwL1NVcTQ3azdPUTZWSEpqc0gvc281?=
 =?utf-8?B?STdQVFIvOFdrRlN5clB2WnBSK3lSVXVNZ2FER2V5YS9GV3NtWi9oYW9nYWly?=
 =?utf-8?B?YXpmOXpwN3lkdEFDRlNtd0ZYRnpydFVEMVl4T3pPVnpVY25VNzVHbjY5Q2J5?=
 =?utf-8?B?bStPLzlGTjZJdHhGZXcxditjeDhReUJkNHJxWUNuaHljTmxxc28rV2g1MEQr?=
 =?utf-8?B?OFBWMDRXMGZiOWs2cTViY1M5SmlPL1pkRjFDVFA5TXRncDRnOHZSeUYyMys1?=
 =?utf-8?B?UnRoVWJlenRHbjlDUlFzUzNvZHk3ekRKQmg3Z3NySERnTk1vYVprV3JsL1VJ?=
 =?utf-8?B?ZkFIOWtCT2J6WnozMmFVNDdvc2pVcTU3WkhmRG4zMzVFd2cwcDd0V1VvOU8x?=
 =?utf-8?B?T0pUb3p4dklteWZYSitZY3RRaVNVUWxSVUcxTVNWYXpDKzJFS0F1Vm1tSHJl?=
 =?utf-8?B?ZjVXb0k1cm9xSmVJbnRjbFc4RGpRczUwQXFOOUczcXQzSEJuU1dqamZlZGY2?=
 =?utf-8?B?cThFbnV0UUxSS1BJVTlnQjFqUW9XRnlEeFRFSmtETnpHNzVPMGhtcytwbFJJ?=
 =?utf-8?B?Z3o0QVMvUnlRdGFyVXgvRmlLS2VaZTVpK0MyYmNIZVJQTWdLbVpiL2JIcERN?=
 =?utf-8?B?aEhwS2pTQ2lnRVpPNlowN1Q2VlRaUjRHL2hZdUc2c0hKZXRLTU1IZ09ETHZO?=
 =?utf-8?B?SnYxb01sdEJGY09yQjFERFVZNHBBODhFb0hGbGZnMFMyQklISVNhbXZ4Q3Nj?=
 =?utf-8?B?OEF2dGlmN0RESUJma3dFWGpVTzNTYUJRbjE0Y1JFb0tva1A5WFhEUDJ1bWdw?=
 =?utf-8?B?bllObjQrMk1INS9QR0lSSFRWTlpHNzBIa29hUlN5dU5BWnF6eG5sdkdSOW1R?=
 =?utf-8?B?QkV4UjFNS01VamVKb3FFcE51enBoRDk5VWdOVEJJLy9ob29PMHRRWTUvYUIx?=
 =?utf-8?B?dytkNmVDTkg2MnRaOTRxam5vREIyZkhYQzRZcnN5RWZUL2gzS0dpUStpNEVR?=
 =?utf-8?B?aWIraTZXc3RjekZYY0VOTFhhaGt2K3IrajNuMUFMTXBxVTRLVUtCVnEvRmxh?=
 =?utf-8?B?UjlGLzc4alJsT01hTjlKRENBSkxpV3RrWjVidWxSWkdBZTJtTjMwRHRWQUZl?=
 =?utf-8?B?dVZRaE53UEt5Tk1PSDZSaUgvL2RHRml4WkF5dnRtZm5LVXJGYnh4cG1GRGFB?=
 =?utf-8?Q?kIsKt9D5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 13:56:42.1642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b2fd33-1e93-432e-8e67-08d8b89438f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVUi34LwgHwn0dCL3WYRTYZN/tbIBjyk1xSOIFbH0IkBacIftNvH0iAeoioQVw2Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2452
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDEuMjEgdW0gMDE6MjIgc2NocmllYiBNaWtoYWlsIEdhdnJpbG92Ogo+IE9uIFR1ZSwg
MTIgSmFuIDIwMjEgYXQgMDE6NDUsIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4gd3JvdGU6Cj4+IEJ1dCB3aGF0IHlvdSBoYXZlIGluIHlvdXIgbG9ncyBzbyBmYXIg
YXJlIG9ubHkgdW5yZWxhdGVkIHN5bXB0b21zLCB0aGUKPj4gcm9vdCBvZiB0aGUgcHJvYmxlbSBp
cyB0aGF0IHNvbWVib2R5IGlzIGxlYWtpbmcgbWVtb3J5Lgo+Pgo+PiBXaGF0IHlvdSBjb3VsZCBk
byBhcyB3ZWxsIGlzIHRvIHRyeSB0byBlbmFibGUga21lbWxlYWsKPiBJIGNhcHR1cmVkIHNvbWUg
bWVtbGVha3MuCj4gRG8gdGhleSBjb250YWluIGFueSB1c2VmdWwgaW5mb3JtYXRpb24/CgpVbmZv
cnR1bmF0ZWx5IG5vdCBvZiBoYW5kLgoKSSBhbHNvIGRvbid0IHNlZSBhbnkgYnVnIHJlcG9ydHMg
ZnJvbSBvdGhlciBwZW9wbGUgYW5kIGNhbid0IHJlcHJvZHVjZSAKdGhlIGxhc3QgYmFja3RyYWNl
IHlvdSBzZW5kIG91dCBUVE0gaGVyZS4KCkRvIHlvdSBoYXZlIGFueSBsb2NhbCBtb2RpZmljYXRp
b25zIG9yIHNwZWNpYWwgc2V0dXAgaW4geW91ciBzeXN0ZW0/IApMaWtlIGJwZiBzY3JpcHRzIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQ/CgpDaHJpc3RpYW4uCgo+Cj4gWzFdIGh0dHBzOi8vcGFzdGVi
aW4uY29tL24wRkU3SHN1Cj4gWzJdIGh0dHBzOi8vcGFzdGViaW4uY29tL01VWDU1TDFrCj4gWzNd
IGh0dHBzOi8vcGFzdGViaW4uY29tL2EzRlQ3RFZHCj4gWzRdIGh0dHBzOi8vcGFzdGViaW4uY29t
LzFBTHZKS3o3Cj4KPiAtLQo+IEJlc3QgUmVnYXJkcywKPiBNaWtlIEdhdnJpbG92Lgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
