Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC22500624
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 08:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1382C10FDD8;
	Thu, 14 Apr 2022 06:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E708810FDCF;
 Thu, 14 Apr 2022 06:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBz/8VNqj0byb7sd8AWPHDlYQCVL5s2/hWeKHEltpohlMrwt/k+Fimuw4RKXmiSzbYZU5GctZvKedTSocBinnie+9PzVtTSsklJuVfz4CqkH6SSWSUlYSMwEr27tfEOPj47zG2kv80YO3DLl73G3n4rUx0WpRPssY6TICRjDJMEX9hFhIHXJABboc80+fSQAyXJ+FfwDuU4ZPt92yj4wYWz3j8mSREGDwmKVJLvttMCK+1zeVhr/6r6FAeow5WJ+Nx0kv+LtArRO7Nqobqpzf3XdhNdKzIXv3EvJ34LIHdLi4QtuPF1RTXRp/9Jcfr6OH2huiIWHVW6RWwtuGXGMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oerahSDkHAyFei+c5PI8LNRSirxieIGKghQezCCL/aY=;
 b=Pblt6zbIscMiz8eREASiIOUa5Mo+/O+NRBa5SJIxUaCz8OfOPxTY8123h/2PwxTkdZ8DKmE+ZtFAjR6zenD1T7CFb//wWNo3TMDPS0f+TtPwNlB4u1bYM1kqceqKv4mAA3RNrCxYeLkxOx7T860/Yae+5GZb/bVDnmcDOsL03TYx3yInDsCIOjyFKEp+W7QTTPO9Jdv2DBycl3Uoivrgod7D1CmMb1vP2k6b0xrzRshlKsXHDG7qxRTeMjf6L4TZwUcCLRQPeP1eUds9Wp4fgGFjOpYwMvld7Ep28ne3o2YGqUKjFH7L0a8toOguOACcQPApx4vEqJkvrYdEVfJjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oerahSDkHAyFei+c5PI8LNRSirxieIGKghQezCCL/aY=;
 b=FVqj6ylbByXHxKQEULG6zYznHbhV4tobRjjQYEQ6xjjYLNABBtjbv/iLdAvnxHRw7PgN998lx5k/fakl6gHaZKep5TjOT0EjnxsqDCtfLTfhnqSvwp5IitYHvau6YgnToI87riVQIejRdGNAWpu1XLXwDuMFZK5HfMHQNSPwtWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4646.namprd12.prod.outlook.com (2603:10b6:610:11::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 06:33:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 06:33:09 +0000
Message-ID: <5520db7e-ea29-b610-17e3-de596911d26c@amd.com>
Date: Thu, 14 Apr 2022 08:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20220414094715.4c2e0127@canb.auug.org.au>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220414094715.4c2e0127@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0260.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::25) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c151383-c049-4608-e6a9-08da1de0a46b
X-MS-TrafficTypeDiagnostic: CH2PR12MB4646:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4646C88BD2CDFA170618FCF383EF9@CH2PR12MB4646.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JFYHStO69YMjQXR+cMvRX9zHIigvpXb3d6EQB2TWVQimlGsCh56hUZTaz2D4BApoDsir671j4JdMeGqye2gT4/IaphWRdUAoxnktgFcvicLwHeFEsQL+15Ao6YjcF8fCMBHTuxyYp9rJV9cJFShtcpv+dx/iai3IsF67xg8qoQPY1oNXREdqf8MlWfA/HaCtoShb5iNqfaAtxx9GDVvjeVien+tBxeFMvQPHv30DozXklR1/wBnyLwhnYXEXudNZjvfnzcmGTE2ni5WjMILMniZkRUtoE7dgHIX6oCZQbo+AWlN+YhIZMps70+6IZ/RRsOO4NixXjEAhsA7Px3LO+T6yhFcv+kaqXkRopnpSPI+b7cFB3WKLiSsYoeIFCQnCd0gXhAR0lWftDvpwzuSDtpZ5xvEkRy70gs0o5rnhAWfSktQTsgGLrPEt/HWrUEyRGgv5bdHpA02guo9/VKQ8/10DRGaDMYuj2yiBZWNEPuciQlVadMxYE9qGVqLrLqW+yJCoZ30kt4FTb9K7Ab9F4aaJoKbpKfImbWWgscdqMg5Mm7A/5d54wOCXi6i0kK7ckJf+9zTShcr95yKkyVI2KbIbSh0nHGPtslm86vk1xx/2jlADTjDexiAa9+lSwkhELwAVGaEM9+ous7nXpz6VHTX9FmQYaM2L8scEi1EBeE6J2c86fGkwsSSVIJXug48A3PJ1iLso3ii8xgL5sTp5awlj2kSEtA73QNW0tqoJnIoOhoavuuNlcoIzGQ8Qolik
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38100700002)(5660300002)(31686004)(6486002)(66556008)(66476007)(31696002)(6666004)(8936002)(6506007)(2906002)(508600001)(186003)(54906003)(316002)(110136005)(8676002)(4326008)(6512007)(66946007)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUMxZTk1TXhsdVdXSGJwajdlaU5lbjJ0am11L3pva2doeWtFdkwzWGFudUlo?=
 =?utf-8?B?U3Jnc1RYWjJrd3BwaWVmWnJjL3pSRWZ1bWdJVGtYTHZzYStKNU80d1FScGtu?=
 =?utf-8?B?SlZFQ3ppNnVwV2JtUnNkSStRS0FaZUllNkVRZlo3ZG1XYUdNYVl0OFZXSDdV?=
 =?utf-8?B?N3FVTHpVRVkxczJZZktZZUtPRk1NM1VlUHA4L0lUQ0FsbUkyT2E1N2xwQ2pG?=
 =?utf-8?B?QVk3NHdKQ05kOHRGUXdYOWhxbUtTVlhaZXU3K0MzUUUrbytucGR5YSt2ME0y?=
 =?utf-8?B?a0pKZE1ocXlyNHR3aFFxMXVmNTdCMnRPMEQ5cWRkYlBRcS9BS29CaFZpMmVX?=
 =?utf-8?B?ekVNNk5jNC9kazBwbUVkV3FNajdQUlRiN1RleVJtNUVTcmtCWnpoQjZrd0pt?=
 =?utf-8?B?eE9wekw5L1A2NkJBenlSOG5CQ21yTnhSYWJlc2M5ZUVuY3VydzRVNnczU2Fw?=
 =?utf-8?B?UmhRVDh0Tzd0aUhIMlRJWEtKbWlHc1pPRmlISDljOXRseGs3UEhOM0g4bDIx?=
 =?utf-8?B?ZUtxSVhYdUQ0c0N6Sy9MUkQ0NTBONU5BV0VRSlp6b3ZzN1NyYURhY25EMDVI?=
 =?utf-8?B?RWlvTll3VHQzTGdYeDY2WGwvc200Ym9OcXpYVUc1SWc2aWVLMmpSNkNtRjRF?=
 =?utf-8?B?M1F2dWdwTitvUU5Oa3ZQUlZ1OHZNYlRjeDlUNTN0cjJmYTFwZXdXY3R5VlBH?=
 =?utf-8?B?TXJKNGJZbU9VbjNIUm5wbTJDUllLdGJzWEVxOHdtVm5OVktocW44OVgwclZT?=
 =?utf-8?B?MzlnTlM0ZnFJVjNjQ2FuUzg4cFplb3VhZGRDSTIrNEtjeVpsbElQZ0ttWlFx?=
 =?utf-8?B?bkoyTGpZS1VHQnpJMWk5M041RVcyV3d4MlBHT0JDU2srczYxNGVPVFB6T216?=
 =?utf-8?B?QXg2R3NMdHZ4ZkYrNXdFazNMRnliUy80QitlTis1QUpHaGZqejNEdWFnM1FJ?=
 =?utf-8?B?RTAwcUtkZGNsK09NQ2U5WlQra0x5bmdmSHhXK3REd1gyS1hvUkJnS0dBcFVY?=
 =?utf-8?B?T0o1MG1TOUVydGpHYVpyMmlHK2Zlc283Znh6aWdmSHhTaW1nRmZTN1pFOXFM?=
 =?utf-8?B?T21FYVhhbjlBWGJHZ2hXTnVaTkFZMWZEYUpyTEZweTl1SmJQWlR6ODRoc1lq?=
 =?utf-8?B?aTBtdlFVNHM3bXpxeFZIZExrb1g3eWVmOVBXRnRxMzMvNlhaV2YvV011RU5I?=
 =?utf-8?B?MDMzVnBFd000WlpTODczVUJvY3N2b0VBNi8xckZybnRYQWdxS1dUM0V4Qk15?=
 =?utf-8?B?YVBjbFNDL25VcUVIQjA2Y1E3V1RMMWtLREF5YXBFS0x1SFZxL3lWYk95UmY5?=
 =?utf-8?B?ZThJa01neElkaGluZzdsT3JtTFdpMVc5ZDgwK1dOY1dSYmhWM0cwL1VRRVZ3?=
 =?utf-8?B?QkFKdWhpRWwvZFo3V01icjV4Q1cxKzNxOVhwYlpoeGpBckJCYUZKcXYyTWh6?=
 =?utf-8?B?M3J1dWdONUdRSzBzVVJocEdjMXpnanVnY1dxazJjVk1DdHErUGpSeU5XV0Js?=
 =?utf-8?B?YU1JaXZneEkvVDN5MlhnS1dBVHRUNlEwQXREK3MvMVBUL2llMmtLNlEraURV?=
 =?utf-8?B?UFpsR3JlNjRkQmhkbi9yd0NXbUFYY3ZneHByUnBQajk5eW93QWtzOGNzdFd3?=
 =?utf-8?B?cXZVdG5RQnIzRjZIN2VreG53S3FTeGhsdGJwdEJ2ZElsc3UzTkJ4UTU1bWYr?=
 =?utf-8?B?Zi9ZSXphZ0c3SVBjNXlSYjBkNWozMnVtN2IrN0FoRGlUS0JoTVpjZ01IR3ow?=
 =?utf-8?B?Z2Z3d1AzSEQzaGd1WGY2N3lVVm5BMFU5S2ord2FIR2V6K2FGWkZTK2VmN0Ru?=
 =?utf-8?B?cms5aHhPL0x2VTRFVVJ2SjVXalo3SENIWjVHNVAzeXFvNzg1Mmk0R1ZNenhH?=
 =?utf-8?B?OFdlZitBR0NVUmNDaldhL0lBVHpPZ2FLSndBYjR4RURac1VmeC9Lc1NWSEhH?=
 =?utf-8?B?eE43NnZ4Q1dicWUzZEIxcFZtSURMS0ZXcXdXaEl3blZTUUxpRFRsZ3gyMXVD?=
 =?utf-8?B?WXpnYmIyRU91b0Y5Z01FUjd0c1RKc2hkVENzam1aekZ1cTNoWWRRdGM5NkMw?=
 =?utf-8?B?SFNCWnpiVVJaL21Nc3dQTVFIT08rMUFDV3N3Vm1ZWkRXYjJiOUVJdEN5djdw?=
 =?utf-8?B?RmlCaDNJRnVwd3lUUVB0cnpyYkx1QWFqWFFXNTJzRkdGUXZQbTd0cnR5M1BU?=
 =?utf-8?B?Tk1vdmU3WGdhenExZE1nKzBFNkdxdDhBZzluNTRMbmEwNFVXamdzNmNWMEJm?=
 =?utf-8?B?NmZ1aUpFT3FkOGI4bU0weU1XVnlxalhDeHphS2d2ZFE3ck9Pa1lqR2dXR3pR?=
 =?utf-8?B?WWszWlhhb2hXQm43UnVPcmdOUkI4UU95NUxSSTJpUE5ramhhZWJJV1NCY3k3?=
 =?utf-8?Q?aMwos2ORv/BRb9fGFTNi5XGM6iFOuOW/F3jTLGT/f2ZMO?=
X-MS-Exchange-AntiSpam-MessageData-1: 1R36PYTj7kYuAQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c151383-c049-4608-e6a9-08da1de0a46b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 06:33:09.6948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELOoVSBBTIG3QIPIqdAa6XLE3tgX7Dn7Yzc1Hhalz/P2Df1L7+Fd8tOPNS4mxFw5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4646
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.04.22 um 01:47 schrieb Stephen Rothwell:
> Hi all,
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>
>    drivers/gpu/drm/radeon/radeon_sync.c
>
> between commit:
>
>    022074918042 ("drm/radeon: fix logic inversion in radeon_sync_resv")
>
> from the drm-misc-fixes tree and commit:
>
>    7bc80a5462c3 ("dma-buf: add enum dma_resv_usage v4")
>
> from the drm-misc tree.
>
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary.

I still need to double check the result in linux-next, but that doesn't 
sounds right.

The missing "!" needs to be carried into the new function call.

drm-tip should have the right solution to this merge conflict.

Thanks,
Christian.

> This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>

