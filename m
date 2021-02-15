Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3288A31B780
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 11:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1710C89FAD;
	Mon, 15 Feb 2021 10:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680063.outbound.protection.outlook.com [40.107.68.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983D389FA0;
 Mon, 15 Feb 2021 10:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlVLC+b3+Kzy4RbxCwBNVt8eWW728+dQSC9YgpacCmPGMcikPfG6OFL0Q7uUvLjnsHJj1fMR9HFT6A4SksYaagjIg/NfjWd/tg1demI4xAJpj93tl2Jf/I61kdAzXEJ7ByQZOB03SXFl+eUhDKLZygO/woRB0SBwScHrlAI4BTuBxBye9PKkQrfb29XCTOIpOVnH3ezWMGQr8LQoK41/PSve2GcKQwCLGSCBLN8XT+xrkkeGCbXIWQ5BrjhAiPy0YKJyvWTTpF4QkIxoNuLGNqPS2L1+/mLlcyQ5gg/8N9+RDlhyH3FWwsApOvrXR4PtvEJTM63/EFOTYgeW0wgjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86sp+52zSvbD7jDG3vteE7BLVNH+Mrd8kK6ooB82VI4=;
 b=dvk3aKnpz+IcCs6He+jjJrDnxwh4QykA7wfJ3+ow6vDCcm7uUV/3f+kzvgAI0r6Ze7IGiFa9ENKFG3ckj8f8RuzQVCtGGmwWsqXaeuKehdyzFx8fSySiefvrEzdRN7GyqhG54kHexNSXu2b2M9E5Czm0wKMNj5xrgh5oHfYUSXHTXIOSK6q1CiXuArMy79D+/8AUDwUdJAttxgFwtc7pkOLqMGukqLsqJ65/tZInJCAhajFjxVXyYYVfy4YFqzxHGg1k7urP0RzRkkb2Js4ptDInLBSmE81dSywAwY6uHCHM0oAenao2+Pkkypo9XVm1D9YUlgP2MW1vnCU2j5eHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86sp+52zSvbD7jDG3vteE7BLVNH+Mrd8kK6ooB82VI4=;
 b=oJcNHu9qX0M+ksDCq9Sit+HTuLcis8+y8c3dHii/+AepbybeuILF25DZ0eNVjFTBLnxRgt9cg7tQ64NNgv7t4L5/ZYrLuh+UYJG0+psWJVjKjSJNk1LoKNvXjRRGXJw1ygeHmvBDDE9yFUmT3Q4TS8zrERkTEjwRID0ayf1jOjs=
Authentication-Results: zte.com.cn; dkim=none (message not signed)
 header.d=none;zte.com.cn; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 15 Feb
 2021 10:43:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 10:43:47 +0000
Subject: Re: [PATCH] drm/radeon: Remove unused function pointer typedef
 radeon_packet3_check_t
To: Chen Lin <chen45464546@163.com>, airlied@linux.ie, daniel@ffwll.ch
References: <1613384489-3102-1-git-send-email-chen45464546@163.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e045d7ad-c9a5-e956-7efc-b0b1a7db1247@amd.com>
Date: Mon, 15 Feb 2021 11:43:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1613384489-3102-1-git-send-email-chen45464546@163.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e074:3b37:7224:b69f]
X-ClientProxiedBy: AM3PR05CA0116.eurprd05.prod.outlook.com
 (2603:10a6:207:2::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e074:3b37:7224:b69f]
 (2a02:908:1252:fb60:e074:3b37:7224:b69f) by
 AM3PR05CA0116.eurprd05.prod.outlook.com (2603:10a6:207:2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.35 via Frontend Transport; Mon, 15 Feb 2021 10:43:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52ca4302-eb54-41f6-7190-08d8d19e9326
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4111473852E831E37C4CC80B83889@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRqYp6th6fsHiqT6LUPtxrjGCY2klsxlbEfn49SUNzD3pnu2CRO3ro/pVMwXgivXpNDnsShY6rRmCFN+Kb6f2oL9rXa1Wca8KF3wxKVi4qREbHt5FgqtujDmkWmbTj+pPFnYcYghABc42BiW6ixjTMq82kpgyoTtx82/gi898zhvpkrZog5i7Tn4os98bR5ug+G9AKChtcWh8HSrs5/XlLs9R8j1zfcup7u7ZZX3Zq+pSg82FkOZayA+L/clyttTFmm2gYUZ9f/0LhMd+GVeNbdB6v3NX6lBXCkCsl5OJoqzXVSGjx5KDoaMn8lSMUoEN6jM/2Yk1WG5knvu9dbzVJocPZ1KnA3xHro5UqrU5a8NLyDprG2aOixiMkG7QEgL2Ggs6GlmQ1bQWIOu9Q37dLFwic4wY4i6gex0XZKjuqFxu22IJo1Z1FDRhgfbHuEBRHKZb5f0ig5UOYSyy7QmjSN+FWjB6YS9HKSwWzHri5VRDci3J+bHZSqqv3h0NigbxRZXNetUvlN5T3CJgQ5AAHbMPzG+7z4yYtn8fAg5Gf2oLQF9FDK3t5pTznG8esiyw/hT2RwIosWNl3872dAhUTADxovvhoPRnprDRyF2PdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(4744005)(52116002)(478600001)(4326008)(86362001)(316002)(2616005)(5660300002)(2906002)(8936002)(31696002)(6486002)(8676002)(6666004)(36756003)(66556008)(66476007)(31686004)(66946007)(83380400001)(186003)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c1p2dnprbXdHdGFpRzNoVjZKUHVjV3h3WW4ySTZ2Zit2WE85ZisyM2pYOWVn?=
 =?utf-8?B?QkFPRWlpTFJ5ZmJYQVl6OVlJU21RQjNQU2tzbk4rRjBBSEVLVW9mN1VqdDli?=
 =?utf-8?B?bGVCUVFvN2IzaWdaZjhxOE1qOWhDbW8wWkNBVG1CNzFHL28rYUkwNTF2a3Z2?=
 =?utf-8?B?M2JHVTBiRTNBRUdnSThRK0tyeDVoSzd4UHRrZDUzbVZQL3dXNCtZeEI5aWM3?=
 =?utf-8?B?WHEzL09mUllBK3NuTDFKUStReWI5Mys4eWVBV0xkWlJZZnBGWGpNa2JrSnpv?=
 =?utf-8?B?azc4V2I2K1dWZXNQRHJNOFVsUmtUdG5YbGp3Yk1hZnM4bmQ0RGE4bmd6YnIz?=
 =?utf-8?B?OGZTdUtnd0ZLS3hhTmY5K0xodS9oeXRzRjk5MjdMbVpWNjM4SmQ0SWJWTjdY?=
 =?utf-8?B?cnhqTVJpSWlUbUJIZksxUzdtbk94cnJrWnhiSlFCSy9tblFyZ3doa1UvTUpV?=
 =?utf-8?B?VGhXTXJRYXhBT2src2pBYU9TT3E1RGZzR3N4MVhzcHJwalhKNVlPaEJya2Rt?=
 =?utf-8?B?RitBVUIrZ1lMckNESUQzZHpVMXVkZmZoZ1E1dlk5ejVpYkFqc1NwSFBBa2FE?=
 =?utf-8?B?bmlQTFp6QStsTHk4OFJmT29MUE04RWVza2xEYnR3dWozdG82UXZtbTIyVnQ5?=
 =?utf-8?B?dnlHbjBYV0c5TTk4Rmg3Tm01NzAyc0FEcEFycEtRQkhNanlOZlNtV1dqMmJJ?=
 =?utf-8?B?ZzlCc2RCMStoNkdWa3BzSGdjMkhFbGlvdFBCRHR4WDRUa2dHaHN1UittMy9L?=
 =?utf-8?B?K3ZZZVBDSEhneUhhbmhJZFF0NzNkVkNXa3BEblBMT0wrQ0UxSU1JVXpEUmRZ?=
 =?utf-8?B?T0JZWjlSMXNjMTVwdkZpTldlQ09xTEJrQXJ5c2ErV01NWWdtb2RZTDZkVzRr?=
 =?utf-8?B?cnJxV21oUW1JdGdUWkxUR25PTHVJYlIvc3cvTEZVaEIyTDl6V2c2MlgyMUh4?=
 =?utf-8?B?U3ZNTTVSa1RuaDhsTFBFOVBvcmJxTjZDV1pQNTQ3QVBFeTJsR0tJL001Mi8z?=
 =?utf-8?B?M3BmT0JGNVZxSE10eWErN1FoM0dUNjFlYmxUOVQwSGhha2JMWDFZQU85WXpM?=
 =?utf-8?B?WHUyT3F1R0xtRmJOQUxwM1dCU3ZQaEtXRCtMNWVvSDVVUlphclo2RXlDZUxo?=
 =?utf-8?B?VTZFcG9EcjkwOWdCeGQxajlBV1I1VnVOdU9vYUJxL25CeDZqaWx3djZrODZT?=
 =?utf-8?B?dkpyc2NSVXQ5RU5iMGpremRKM0NsczczSFVXRGpTUDFkVlg4TWFlOERaTmxD?=
 =?utf-8?B?RjczVk5GcjBqS0hjazNCSElmWUo1bmdjVWE2NmkyZUJ4S1JVM2JscjRrdEIw?=
 =?utf-8?B?Rnc5WHlOYlg2bDZ4Yjg3SEJ4WGdIbEc3TlhmTTlMRDBUYm9XbytrMlR4dXY1?=
 =?utf-8?B?SUJzNjdoUTZYSGdxVmZUNzBJc2NlMUdtUGI0bTdLT244a0tJU3d4N0hGNnU3?=
 =?utf-8?B?YjBxdDVLYUgvWXNtVTI5NEM0bGxIZ1ppbVFvV1NBcWhzbVNBL256UHNmYnp2?=
 =?utf-8?B?NUZKaTZSZkRhbUR3bHdXOCtLR2lNMlFaM1NCSFJtUW53RVg0MVhtRWRqSk9r?=
 =?utf-8?B?Z0lpUXhoYmxLdGZhbGgzcVVjdGE2bll6aTRvUUxVNk5MT21md1d0TjlFWGI1?=
 =?utf-8?B?b0p1ejBKVlN4blBWdGg1ZWkzNXAxTDVFdVZBZW52SnBWdTRQSFM2MWo5R0hw?=
 =?utf-8?B?akUwMGNmZlp2dnlXMGlwYWpwZit5YU1OZVVHeVpXRmdLTURZU1p2czdvcEdR?=
 =?utf-8?B?V294K0svOGY4WkNBT3IwNFR4RDRCNjJ5VTBENmxWanBpU2J4a2F2aHFyZ2oz?=
 =?utf-8?B?MkZKalYvTUQrU0ZrNXl6T1VOSXVkTXVJRGE3RXpodzdwcFFRTElIVThBUWhz?=
 =?utf-8?Q?RaD8CB/nRtfxu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ca4302-eb54-41f6-7190-08d8d19e9326
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 10:43:47.8392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJQRKnpx6kIOcAX/TzXKf5uXrAt1ni+vivbI0Q+UoeCuzOzose4yw0AwqHCw1WGn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
Cc: alexander.deucher@amd.com, Chen Lin <chen.lin5@zte.com.cn>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxNS4wMi4yMSB1bSAxMToyMSBzY2hyaWViIENoZW4gTGluOgo+IEZyb206IENoZW4gTGlu
IDxjaGVuLmxpbjVAenRlLmNvbS5jbj4KPgo+IFJlbW92ZSB0aGUgJ3JhZGVvbl9wYWNrZXQzX2No
ZWNrX3QnIHR5cGVkZWYgYXMgaXQgaXMgbm90IHVzZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGVu
IExpbiA8Y2hlbi5saW41QHp0ZS5jb20uY24+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uLmggfCAgICAzIC0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgKPiBpbmRleCA1ZjNhZGJhLi5hMWMzOGI1IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCj4gQEAgLTExMTEsOSArMTExMSw2IEBAIHN0cnVj
dCByYWRlb25fY3NfcGFja2V0IHsKPiAgIHR5cGVkZWYgaW50ICgqcmFkZW9uX3BhY2tldDBfY2hl
Y2tfdCkoc3RydWN0IHJhZGVvbl9jc19wYXJzZXIgKnAsCj4gICAJCQkJICAgICAgc3RydWN0IHJh
ZGVvbl9jc19wYWNrZXQgKnBrdCwKPiAgIAkJCQkgICAgICB1bnNpZ25lZCBpZHgsIHVuc2lnbmVk
IHJlZyk7Cj4gLXR5cGVkZWYgaW50ICgqcmFkZW9uX3BhY2tldDNfY2hlY2tfdCkoc3RydWN0IHJh
ZGVvbl9jc19wYXJzZXIgKnAsCj4gLQkJCQkgICAgICBzdHJ1Y3QgcmFkZW9uX2NzX3BhY2tldCAq
cGt0KTsKPiAtCj4gICAKPiAgIC8qCj4gICAgKiBBR1AKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
