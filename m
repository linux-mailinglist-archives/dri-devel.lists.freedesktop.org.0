Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E924318798
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 11:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3864B89D89;
	Thu, 11 Feb 2021 10:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81AD6EDF4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 10:01:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWkUQMvGDWI7tPMrvFan+OhfWSJW5RD0dedpBqb/IdfTJ+IGbqCjnvlPTkFpcy7u4IdJn51XXxcpQLaqR2PEs8pA+8O/J6u7a0Cp4pdjxCD95TWbEUatrrkn/JdHbLABShqAqIR+7SfN5n1X8bnMvn18NMgzvJFW7g33EeZ78ttzsk+UTB0bcFqJVCXxaCjg/mLCW+cyUK3WSa5gX+Mnm6JM45mZsEDkdRkyo/fDp30HCoxO6vMwRglXO1Co+LigwQGCUYi8AotjvHhMqsNMYr0RKJdlW/KZQrhs5RzlwRMdesQpmB175SRf7gRtms1F/zx//YLHwUYLrHxWdEzacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtZOP6bB8hmTez/hR2RBafqkUlZViOh8OubPWpZqGK0=;
 b=JmQmL1OEKOoi5VySGLfVL2wpg2r80PvCEYcnncXQz0y8nCzULg8eNAj3OqN380TkjRrtFglm0u24f2GMCl0M4DqKZrlAn9r5QnexOhW+hG4py64kOls3gI6S4sIM7jRxWR636L2Folma8PfnBESC7UAQ9eW0ck60+JuzmLByo7es2v5PbRNE5IAAqEjdmspyAjpRfyP0rqVbs41vsO/Y3+Nw0gODRWMofCMUmw3bS/gPGe3juYzxatudeK+oRUMruVSj1XRucVMWmZ3sO7FZWeGHg09SWoK1o29YLcNZ6bxIX+yedBdU5SoopAZH8FgJ+GL9R67q418BHxBgEybCIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtZOP6bB8hmTez/hR2RBafqkUlZViOh8OubPWpZqGK0=;
 b=NQcKsClhPWreGWrr/lDfeT9i/PB/L0e5tUUsRIsir0sVlXs1/0rUOgR+KUKbOIIFnNG9kgd1uV7/5q+QzfbqKm4wILupukB1qm5KKvoAZNMEL1gxzVEkGRthC1PrHpYqPjMFV0Dpzp1+FJbrG8UbLyuM/2pePHk6THEWCUQklNs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Thu, 11 Feb
 2021 10:01:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 10:01:50 +0000
To: Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Not 100% sure if I correctly fixed drm-tip
Message-ID: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
Date: Thu, 11 Feb 2021 11:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:f390:5f07:f58d:f83a]
X-ClientProxiedBy: AM4PR0202CA0014.eurprd02.prod.outlook.com
 (2603:10a6:200:89::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:f390:5f07:f58d:f83a]
 (2a02:908:1252:fb60:f390:5f07:f58d:f83a) by
 AM4PR0202CA0014.eurprd02.prod.outlook.com (2603:10a6:200:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 10:01:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e711a9be-fb1a-44de-fec2-08d8ce740ce1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-Microsoft-Antispam-PRVS: <MN2PR12MB37739529670C2852F44C6F87838C9@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IvtbWCNKbesUKa48WpZj44mVbvzA0hpTTBju1Q/8VAPnWEYfrLgJkQsECG52/QloOaiTUobZAKSvTyWyzZMv3D6iE6uwG3Gd255+Wlq/vWPuRvgleRYFd432/tM/bK4Rp6dy1+V34w/ZDjE+VQ/zDBODW/7aiEgJ8hyt3vdUOQBHXduV3Xdo/sNbhfO9tFYtJuwW6QWoG8kLsyH8AsI7RrUqxc3o0aPDHtbdedU1ZQZVh+dniJMy2ys0hT5PN3l+IbYAIp3j/FAQ7eDeUH8A13uu+BQgzODHNu9nwO5UnD8HfV/Qv1Ojx4T6r49sYaVw6CCLGL+G2wCivdVXHVfU4QaJm9vW7X7VwXM4WmJTElwRBZz0YMS2JJfvNmKP+zOqppfIv1Abj5LJGw0TDDByOq1KEweyJUjg5MJAcrP759xwK9CKhlP1isRDdbq/LMFDP7vH5E1Mi1zYDFytpYTJ1LXzGG1nRqTG1KfJRaIntwmdyT8wEEQ5uMvB3LKIT1snDFlylJwpdBrX/+HpC75+oMmbXHEAYQMuAzo5VW5RsKZw6RcWk/kLwbVS/J0Rg6tjVNOfXiXaJ5lRzMr3FiKFTeNtdmAYOQTcahU/xkP6fy8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(8936002)(316002)(52116002)(478600001)(6666004)(5660300002)(6486002)(2906002)(8676002)(110136005)(86362001)(558084003)(31696002)(31686004)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TXpTMHp0QVF4NWtvd1FPNlVTYUY5a0FrSTkrNUpUU1B6MmFTNVZ4MmN1MHVH?=
 =?utf-8?B?UVk2SVJmVDhXckhmcDRjL1lzajFVUWNNR0pBekJCUGlBZnpuV1RDWkwxS2ZM?=
 =?utf-8?B?ZGEzV2VDU2JBeFhYV204TkxFWFYwMFBtSFBBZ0R2NTJ0RWZZQkhUWnc0VUNM?=
 =?utf-8?B?Zzl5WHZjNmZEaDQrc09MdkM3cUZZNERXc0xzV0szMFpVUUFIbHZPWlpsYlhs?=
 =?utf-8?B?ZmhRREtZc3NRM0NNOE0ybURkcXFEUUN0bmpQb2tWSmV2SWdnOHpJSUdROTVK?=
 =?utf-8?B?OHBiMlpOZzRKd2dVNjN5bTI2Q1l3a2paVDhGeEtxZ3VhVE5GQUJTb1ltRGpl?=
 =?utf-8?B?eEU3bkJaZ3NEQWY1ckVBT0tqQ0U5c3FicnN0KzE3Y1ltMGNvRVZ1aExqb2s0?=
 =?utf-8?B?TzBySUltdWpUSEljZ3RIUWhET3FRQUtNY090cVlobC94WDJuTnExRitiU0lX?=
 =?utf-8?B?QURsOEYvTHZ0WTlQeGtUWkRsUjlzdUdzNW5YbC9PWjNhVGtUS1p0dVNzUkNV?=
 =?utf-8?B?T1NkQSs4U3pXb0R5c2s2UTNURGR3TTNpN3JEMHE4WXAwN1d2Y3VCVHNnOHBY?=
 =?utf-8?B?OW9vUHRzcnpaS295UzRQTTVJL3oxdllXMWk5NWZnMlFRMG9xQlFUTkpGQ2Fr?=
 =?utf-8?B?T0FDYWREL01KSnJyRGV3YWJPS0E2M1NldGZCZ2hnUldOQU9hMUllS2k3Rkpr?=
 =?utf-8?B?UXZQeVRzZmcxcXZ6VFJyY1FvMFo4M3BJV2dFTk5PZzMxbWlrTWNGRnNiN1dn?=
 =?utf-8?B?ZnYxbjE3SzhZaGN6NUthaVp5bDREbkFscUpyeXFKUXRLVWtsRmNRQzVveHdi?=
 =?utf-8?B?Q1hQWkxsZnVJbFFDNHNtUnRrYlZCNUlVNm1wWW8wTVlGb1ZTT3NzblY4RjVJ?=
 =?utf-8?B?UTB5c09NOFhDLzdaVUExeWpCNGtqeU1UU3FFMEU0ZzF6dEpYeG15dFlTdWFS?=
 =?utf-8?B?L1ljRmlJdURFOWlaamVSWGd4aUYxVk1xU3Q5ZGFua1NocmFaVzJuRzlrQk9n?=
 =?utf-8?B?ZlluWnRqdkpudk0wSnMrbXA5aVNIUTlXVHBGQVdBYVkxV1hGSXEwQ0h5Z3ZD?=
 =?utf-8?B?R1NsNjRjR0Nzd3BPcS93dDJ1bW1kZzZINFdzK1J2eCtoMEJPNjh3dkFmZ3ZE?=
 =?utf-8?B?VEUxSGhiMW5yM2lRTHQ0VVB1RDNobmVRWStwKzcya3lid1JTUVdLZDVZZERI?=
 =?utf-8?B?UXc3TEFiN0tzNTVzN1JVSDZVMVNFaDd4L0VjaTlXSmxRRDd4UU04WkdaeklM?=
 =?utf-8?B?TzlNdXEzbjUyeFV3UHZWTDhLTWRpbDlmdkxqdUo2ZFR2OVZ1Z0c1ekI1NjJk?=
 =?utf-8?B?L0p5TURMZkVmY200eGNpQnNvVnJLelZqZ25rVXNmRzBtaElHbUVnSEIrOVpv?=
 =?utf-8?B?L2czR29ycTNacFZZSkNWY1lEbkpFalFEWjBCeW9TYXREdmQwb0Ztemwvd1JO?=
 =?utf-8?B?dUtJMXNVMEJvZWJOQUs2YTVJS1dOcFFDWUl4WnVHTlQzRkJubW0wOWw0L2lo?=
 =?utf-8?B?NTczZTVzaWJlS1NUV29IWGc5RnhxQ0lETlk4NkVFTlA4aWtlTGVGSlBEK2ky?=
 =?utf-8?B?NEozZElodFA4bEFha3RYSXZoNEw5UU15VGdGTy8rN1NnWlBLTnpnQWJPWVJP?=
 =?utf-8?B?M3I2WjAzOFpuenJEUkRSQlhJUGFJYXpoNW9Hb1hCZWVudTd1b2w2akZic1Bn?=
 =?utf-8?B?VExSQkVCNjJ0Z1Y1UWhCOGpWbHV3SkxYSWNkZmJnZVJPQjJGM0w0YlhhRERS?=
 =?utf-8?B?NTc1MEhYRnhBTWpDUWhDdVZZOUhHaC8yN0V1Z1owUGtJMUs2aVNBV0gwTE91?=
 =?utf-8?B?TlZBUGZ3L1ZXVEZtdHhBTXNOdjZrVWcvMU14UnBtd2ZlKy9mZ1NiblJMelhO?=
 =?utf-8?Q?WG5B7KNBzp7pI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e711a9be-fb1a-44de-fec2-08d8ce740ce1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 10:01:50.2669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46hHScQnjI87GLrUjq47/gOsNo7RLsgid6zLDvRwe5leneDOuY37LVZaQBz7GmkE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

I had a conflict this morning in the ttm pool while pushing an important 
fix to drm-misc-fixes.

I'm not 100% sure if I correctly fixed up drm-tip. How can this be 
double checked? And how can it be fixed if the merge has gone bad?

Thanks,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
