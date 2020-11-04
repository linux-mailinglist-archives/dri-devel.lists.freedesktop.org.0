Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEF22A6964
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 17:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBDE6E0D1;
	Wed,  4 Nov 2020 16:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E866E0AF;
 Wed,  4 Nov 2020 16:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJKbZDnMvR11Ja+f7E0bpw4sxEtpdZRtQwpUjL4ctQ3jjfXpYa/HWprYFbZlVDxaZJWz7h1EdxBc0JjSFzEczf0bAAJfPFPT1AYhCnuXs4FUXwravw+oD7bExyF23+mebMDcOE7J6jcLe+0xSRVu7yt2obzPWZxgky5g4TbEzZ44hoKJ3V+43erRGMyWUi8S0dqhJzPpXbIdFtLM4X/0F1ALmNXGZbDTTubLHYprqCGJcxlvVHSaIdDdaNfBM4Y1V57Ky7yNOzEA5/5hazj1QKqFt1M8GczYjAMowXnb8AfeUtavUsfpKMHbZxNdXjGxauu0QCoLXl+NGTp+zPx9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnMDpJ1C8a2IMb5Pr9qcVULlXi9nfO8zTO/5nI3dHsY=;
 b=geA7HUhDhBiBYpXxRNKLxfPWxo4Yp2pV/V+9GjgrsgjSqqaEXRageX9j4Y2XOd8CcWWhr4miFyVze5rOld8wTbVzZ3vBlRb1JzFo1UKD8WNBWgYIFU4CStIvmrl/2wSj0kgY/HtX/0QrIDz+zBFw724oHowIZUU0hRl4EPE5Bm8Ls5B8SVjyHsKE2iTRejxbNAVlstbdyubJtsMs4gXMNCF8sRE/9oEOHN5BfDxJt5zmsBwaB2ga48XJ9/wAuMd9at1uVW/At3YmfM4rnu+ia2dlg+QnvtkZKrYKXVYrezrPe3Z07d3XI2UOQUwWEtOjArc4zXKKZp2fWaaf5SYyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnMDpJ1C8a2IMb5Pr9qcVULlXi9nfO8zTO/5nI3dHsY=;
 b=nHYrLR+OvMJso6VM8EVG5rEJtx5SQY/VgwvYouzmxCSSqQwjl1mPIaKX3qJnUC03k6BfdddCK8K5sSkdBGrVHmLXFaUv13Sa1/G0KoW7GXgac2H027H652ENAztyGtz/QGKHPuOZaInRbtlzW+X7gbVF4hCsnbMkJ9/MPdqIlFM=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3084.namprd12.prod.outlook.com (2603:10b6:5:117::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 16:24:03 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 16:24:03 +0000
Subject: Re: [PATCH 0/2] amdgpu's drm_driver becomes const
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201104031129.361178-1-luben.tuikov@amd.com>
 <20201104094314.GM401619@phenom.ffwll.local>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <6a43eb32-d3fb-eb5d-aa9a-4846cb643b60@amd.com>
Date: Wed, 4 Nov 2020 11:24:03 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201104094314.GM401619@phenom.ffwll.local>
Content-Language: en-CA
X-Originating-IP: [108.162.131.176]
X-ClientProxiedBy: YTOPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::33) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.5] (108.162.131.176) by
 YTOPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 4 Nov 2020 16:24:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69cd9ae3-df81-4197-e0de-08d880de0abd
X-MS-TrafficTypeDiagnostic: DM6PR12MB3084:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB30841C2C45ED14A6F2EA41E099EF0@DM6PR12MB3084.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56n2JE5al9DNe5yHd8ezF3/xRAE8icvm7UntWXR4PZTuuhcJoPRkw/n5rYG3feZNToST2SnT3npKOtRT9szym1FzA+KneWE1wz92NyYc9Kr9UnDojDFKDoqAggA4kUBo1P4CzAqEuf4Jx/d5iXWRjXuHHvSzD3Md0F/QKyKxt6CiPerPLS0R+IAkCQPKSutL66MmqLQRH3xun0Jm6FH/TbUgGJ1Qeyrojvz3mbQbezQOpcwu/bZh9mrH9k5TSeXY0907wn7rlNl6+Y3GWMk4x9buDMRWxxryv6faqWbKEkGXU7x57iBo1hA9YA4+PKsbQwQ7e7tZYKv+m1cWCEdDTNwHHA2+l37HMtdcXW7fG9Oe6yqjXPBrhmnBmk/9MXzu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(8936002)(66946007)(5660300002)(31686004)(31696002)(66476007)(4326008)(16576012)(26005)(83380400001)(186003)(52116002)(66556008)(16526019)(53546011)(6916009)(2616005)(6486002)(478600001)(8676002)(956004)(316002)(36756003)(86362001)(55236004)(44832011)(54906003)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: m9qY+9vc4fEVie7KnjpQ+ZE+WjGxGyRxWOiUZd7qQQkZWBYTxzp6g7ahw113dYS3/F+jovzJVlwwVThQMo+ed49yf3Y8GDxFirzTMrOi+9yZPMOyeQOExjDvU2H3T8mPKNbLoOmYq7ckUs6UpaqjNLwt+9r01CBFgEKQCE/XbTfDlTpIZUoRpHM8kCMT+noaZlcaBXMvdx7LA7akkNfn2JPt01zY0kuLwGA6iXhnXMJtj+JwCcgLPjQAB/DR3qu+gN64sqPN38pa6kAOFaL+6k7uiRUdm/k7+eaVOzMyCaBFRzHV2SzVDe1trFYVYllieaOSxycls7ZfRLNv7kOzuBReDhAItMg+agVRuMLCXSMYEQfggWd12xfO58bljwTCTHHg5CXzfuB6vRRlm8bzA7swUCkHfdrG9e4B17R/3Ukc+wKHxDi7bVpTWd7qB4Rsj7B2fe47tbfMzKOtlGAt/nMNNriGBjalqBfuMnT6kZWc3tno1TW+9k7lcb6C9WxPNgzYZ1oqA8DeLfx5+wIvflivzcAbjaw1FJXZBuURkABPNJkm3waf/HwaS1TERL/GJjek5WjrfQrqEZDyk1OwpyCHgvJicEF7H8nN27a4hb+jwNIN8oEBUju5b3j2O/8aSZSA2VhjTwX83OEeoKQpfQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69cd9ae3-df81-4197-e0de-08d880de0abd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 16:24:02.9233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4vpr8Ek4WFsB2Y1trpcm6SGpF2hkHIM3e0rQnRfHzixNacNNG7u1W9PgdV9KMdM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3084
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-04 04:43, Daniel Vetter wrote:
> On Tue, Nov 03, 2020 at 10:11:27PM -0500, Luben Tuikov wrote:
>> Hi Daniel,
>>
>> These two patches follow up your latest
>> DRM work to make definitions of struct drm_driver
>> in DRM low-level drivers, constant, in amdgpu.
>>
>> This set doesn't descend from my previous patch
>> "drm/amdgpu: Convert to using devm_drm_dev_alloc() (v2)",
>> since our branch doesn't have it, and I can see
>> that your const patches aren't in drm-next yet,
>> but they are based on my conversion patch.
>> Perhaps you can graft these two patches locally
>> and dispatch them via drm-next. (There'll be
>> a one-line conflict, namely the devm_drm_dev_alloc().)
> 
> Ah cool, thanks for doing this. I'll take your series here and include it
> in mine and resend the entire pile.
> -Daniel

Yeah, no problem, my pleasure.
Thanks for picking this up.

Regards,
Luben

>>
>> Thanks and Regards,
>> Luben
>>
>> Alex Deucher (1):
>>   drm/amdgpu/virt: fix handling of the atomic flag
>>
>> Luben Tuikov (1):
>>   drm/amdgpu: Make struct drm_driver const
>>
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 32 +++++++++++++++++++++---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c  | 25 +-----------------
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c |  4 ++-
>>  3 files changed, 32 insertions(+), 29 deletions(-)
>>
>> -- 
>> 2.29.2.154.g7f7ebe054a
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
