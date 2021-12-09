Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4415246EFC4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945E510E2C5;
	Thu,  9 Dec 2021 16:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535A410E116;
 Thu,  9 Dec 2021 16:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBsYvKuQCC4a5YgoyMwmQ5iDsgzNBctmfpC1AMZUJvCHiacPp/1agUepuQ7zk4hk/NNyQJLj2DKgPy3fPCBuWxgoNNtQqGp5yreHfoTiuXb7N8D89c3DT1/9xWqXmHjJJQpKVa70QZyZb9seSW+Q6bDeltGmgq88eXasEx8KngVBNK0z9aXQQ92kGyeu7hcKth+HkOI87YxFt0arY0Z7/WWWewiEOWe1Qh08X5s8YAnoR4xgim6J3bpG8cb3IfS4RUgJ6Wrim/m0qRAqIbQVDvZ7nz4O+QaDNLFejrhOdTyPiGlGaQ5FWj1/QFCEgrbOwyOcRv37h0jIHjxnpnsXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYjAih8zvEbQCGqpOr3kEyyK709rYbJjGPiq6NBUwJs=;
 b=UsR2f4+E4O6Q6L7fIh5da+0sRxJ56KxZcnCGlIojJ+39b1ftO9naeAS7ceRtydfA6p1+RskZJJG+yyKsCIegHoknF7iS+LXAG32Ml9TQSc1sx391UADgGgVngGueLz/bHGmxekRRxEFnizBCPfIUQ3W4tvaZk4bxmzWv/2WBC4E4sKnOiN/o1Rhoea0l5BoHES0h7UcRyDVEV6ODFy/usNZgEAVAx8ieBuuBrf6xDurIXm9SnFJskU69NC76P1ruVbv3HLilZMfHhZ8eIi78s2BsZH3AoksnyJGJzM4WOkb7Yhn+lRITbj4iSngfXhT1vcoWB1EZ9b6AuG7hOjdGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYjAih8zvEbQCGqpOr3kEyyK709rYbJjGPiq6NBUwJs=;
 b=Th0X3BCLE0bbkyTip1mXL2lf9onKntEpOBO0TiGIPkWx5ca1GVNXZ4uYXbF/sKskAo+lWows98Gw2+Ja4LpkBdyMRJ+DOpCEeyzEBaxcqA6I9MIgmf4ReF6IytZquj3JbtPOr2+MauFnNUqHlyjzyO268nHzQ3qNs2OI8d71GDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5475.namprd12.prod.outlook.com (2603:10b6:5:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 16:27:04 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%6]) with mapi id 15.20.4755.021; Thu, 9 Dec 2021
 16:27:04 +0000
Message-ID: <e4ca7200-24bb-163d-7e7b-0664e56f7766@amd.com>
Date: Thu, 9 Dec 2021 11:26:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v4 0/6] Expand display core documentation
Content-Language: en-US
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Marek Olsak <marek.olsak@amd.com>, Roman Gilg <subdiff@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0239.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0239.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:66::22) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 16:27:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 728d22b8-b3c8-44a3-f495-08d9bb30bc32
X-MS-TrafficTypeDiagnostic: CO6PR12MB5475:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB54752939EF42CC56E18D82E58C709@CO6PR12MB5475.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lhcx/SbS48ZrJQ+D00o684FmtYdyN83965RVKfN7NRtit9EX1SDILSzX1Wo3W2e/tfN9u5RkqSzDO5t1yRbXRXrRIuqGxar88KRsaxihH+99Cb9fC+nSKraf8rUKsie82+/siEmaBNGT1uZuNlfggpKMWgyr1aRHMgSGOZANknmLko4z3H9GPI51HdoXW3GBmhXUZzJhfd58W2qLQjqv64K+GdPT2u2KM4Zqkuzn938HpyDwUoMYYPuYZhXK5jv9Uqqa9kqCCglEI8jw3bI0YEdQSngW82F6vYUzKqbSJt8/bQBVGZkmOJME6o2E2DHurjnN3A11GiyUr+jccYPE/Bq5ziceMruPJ0UH/hJeGvYIRNeuRKqDqczO5H/vbMWu+bHeUA4yR9lSHtTL4UCToPjquQ6Hz5VU45re8UGKgk7vIY7rZocxETUIS402FYEpHBPWqiXQkxMVeEicBZoUwGiiZsAfNy5NTdExzNvfJOBKRFx8jglUpG1WjQF9n4G3Fit9H0vPRxxQfZdEcMq32eAOKm1CdVoU7Vhrss6uiDE/0gCBsZVm2slQ6k7lJczAGUy2+zdTOinSVmgrEAFXRixlj/qhP0jqbCirZAEftxKhpnUqgdcW1aMBOedpxvGi//ScR7rjmj/ELshir2FI5RZwTaof+b8FS0ITd0OjhWSSmpXbCkJ8WI00Hc8reBo+eilibhwwPHoVkVjISnq2AbRnL/+dQtFKasNb8hfKclHTDPIET5CcHzTktERJxRLn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(921005)(110136005)(316002)(2616005)(54906003)(31686004)(66476007)(66946007)(956004)(16576012)(86362001)(83380400001)(8676002)(8936002)(31696002)(44832011)(66556008)(2906002)(7416002)(6486002)(6666004)(508600001)(26005)(186003)(36756003)(4326008)(5660300002)(53546011)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0duVW1CVk53Q3ppYjJhTmhkK3dQYS95ekJKWDY3L3E1RUV4d3JDTitnQkU4?=
 =?utf-8?B?eUpNaE4vNTAxZVhCSkgyVzRqL3lrU215TSthR05jWXl0L0JyOFFHbTVKdHRl?=
 =?utf-8?B?SVJIVktwS003bC9oTlc3MTNoVFVnRmd2WmRueGdsRy9ZWWFuQnM2Z2piUlQ4?=
 =?utf-8?B?QUpDM1YxK0o1WTd6TTRqMTduTUtENFZzY3VpUG1BNVQ2bjh2dmdrRncrM09o?=
 =?utf-8?B?T0JFMG9ybWdid2tYbDRtbFlaN1o3MWdDZEIwaHRqYjdvKzVVNmdiYVkxVlRr?=
 =?utf-8?B?UEk1Q3dFNG5XcllkMzdySEFjMFNaMDY4cnlydlVTcHNJcGhMOFd0UjI2RHVq?=
 =?utf-8?B?QnR2REtEVytlaGVTZlprQWtJaEw3TDlpZ0NzNEVXcHNwaFFEU25ueXNMYURO?=
 =?utf-8?B?d3JmOTUwa0xsblp6R1VxWU1GeGlDSk8vWEJFSXFWcGxyQVM1eDM5VU1OQlVF?=
 =?utf-8?B?Zy9vLzYwS252YVNGRUo2TEN2SVR2VkVRQ0ZzU0cyOUhaODdMbU1nQXRqVmVp?=
 =?utf-8?B?S1VTNExtc0hUdnlhUXQrMHJJV1BTaVR5OGxOY3pGUThnaXRLL2pZYVR0aGNO?=
 =?utf-8?B?VEFwMnJIazU0eWZ3NU5JV0l6WnU1aDdGN1hKZXREdzFHeHo4UEdhR0JKRHBz?=
 =?utf-8?B?UmVBak1pM3ZqTGV2ZnBIZkczRFpOV25Oa1A4MW1WYmUvTUJGK2JteVplT2g5?=
 =?utf-8?B?YTQrZkFNUGhVcFB2VVBkWXVHcTJEMk1IdWNWL3QySHJyakZjcXB5WFZERy9C?=
 =?utf-8?B?SGFKd0o3VG95V1B4L0J0VzFFYnRMVTB4ZHpkSVBVd1hjNndyVlhKNnptcmph?=
 =?utf-8?B?TzJnM0pRbkRDTXBWQ3h0OVh4Qk52NjVMMHh2VU5sSjVYenhkSHB6TTV3c0Jt?=
 =?utf-8?B?bjNXakpmMDIvM2FUOExPRWI5SW9qbEN6OFBLRi9FLytqMkI1TnozbWpJMTMw?=
 =?utf-8?B?dkU4MEVmMHdxL1g0OXc0dldoWmVRUlBwSzEvT2o4Z1RIQ0FtNjN2TUxuRi8z?=
 =?utf-8?B?cnJjTVQ0WUxYdDQ0ZlVWb2gwdEpZWnE1MkROOGw3aUQxVlFSUEg0bzRzVFc0?=
 =?utf-8?B?eStEenI1MUphRVNWM3VjMnBmOUUwZlVlRUI1SVdVZVdWSmlhZjB3Z2sxblhh?=
 =?utf-8?B?MExBY05kVzNGQmJtMFRqS2dOL3QwempIZ2lSSkVGZ1owZ0RuMXVqRDc5azU2?=
 =?utf-8?B?c0Z6Y0hTWHF2SXcrTjJoM0RXOWFpd2xDNFBnekxTYTd1RGJZa1E2YXZWekxz?=
 =?utf-8?B?MlhSV1FwbkI2ZWVjdDZTaWlXdFhEVk1xMEYrRGFUQXNtemdJM2s0U0RZUGJB?=
 =?utf-8?B?T1pnZzhoRi92S3VDd2hnOUJOalJldHJRRzYwNG4zYXlxb3BKVk85RkZkWkc5?=
 =?utf-8?B?N1dhbUhnTmRoOEJaMjVLODNwSFBsSXVHN0RmSmFGMjhHT0Z5cnB5RkdKWmxy?=
 =?utf-8?B?bG1DVm9kd0ErcDdCL1VMaUhSUHFsMWZsQy8vME11UitaOS9xVTYrUWlFMjl5?=
 =?utf-8?B?aDloaWlvRGh1a0E3MG9BcW14Yk5vRU44NU5BTHRtcW41SHBKRHlZVU5WT2dU?=
 =?utf-8?B?NnNvaTZXWDZmeGxuY25rY0VkTjRPbUFaVU9ucDIycU9wYWg0L3gybSswUytV?=
 =?utf-8?B?aVRJWHJNR3R6K3FoN0ROZFplMnJWUzVlYlVEcm0xUCtOTFgzNGVBWVF1ZFlx?=
 =?utf-8?B?ZFNJQ0xCakhzbjNEcmNLM2s4NFFTOE1leUNWMUF0UmlQT0hFYUsvMTBObUhl?=
 =?utf-8?B?bytaMlJVZkxhbWp3N1k1ZFJPNkt5d0dVVGdxU3JLZzY2ZkExOUlpd2ZiRlR0?=
 =?utf-8?B?VVlPbjlvK05iUUNON21BaWZFWUhMSWNIK2p1YWlSM0hjLzFNS0tiWE03ZmU3?=
 =?utf-8?B?Q0pGaWMzd3Fsdzh2MHJqVnlzSFE5Z3Vva2h2YmZPdVc1eTJMYXU3RTZaSGpx?=
 =?utf-8?B?V0hHekI4MGVvM3c5aDdKRzQ1eWoybDNzczlSS21iVm1WblgxR1NBVG9tYVBh?=
 =?utf-8?B?bkdBMkpIZzk5Y2xEc3JOMDRkVDlZRlVyd0daNy92dUpzOU9UTjZtbkdsUjF3?=
 =?utf-8?B?emtSLys2UlErT0lCSzR0bFEvakZVTFhvSmVkaHU5a0MzQkU1cWtzamg0M0s1?=
 =?utf-8?B?eHRvZE8zVGhPL09QNVEwVUlrSjBtZ2lxcy9iM2syK1ZaOVVmaUJLMWRSMzFZ?=
 =?utf-8?Q?CFXpQS+rPOiScl+/ssOpwbk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 728d22b8-b3c8-44a3-f495-08d9bb30bc32
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 16:27:04.5342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftSkteR8f4+pLNlO77JNBzqRa3Zn0ZS8Kbal9cfL8dw5K9ehPyWI64B35qCoUymS5pn9+Cxaa3SQU0N/lq2t2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5475
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for this. It's really good to see this.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

On 2021-12-09 09:20, Rodrigo Siqueira wrote:
> Display Core (DC) is one of the components under amdgpu, and it has
> multiple features directly related to the KMS API. Unfortunately, we
> don't have enough documentation about DC in the upstream, which makes
> the life of some external contributors a little bit more challenging.
> For these reasons, this patchset reworks part of the DC documentation
> and introduces a new set of details on how the display core works on DCN
> IP. Another improvement that this documentation effort tries to bring is
> making explicit some of our hardware-specific details to guide
> user-space developers better.
> 
> In my view, it is easier to review this series if you apply it in your
> local kernel and build the HTML version (make htmldocs). I'm suggesting
> this approach because I added a few SVG diagrams that will be easier to
> see in the HTML version. If you cannot build the documentation, try to
> open the SVG images while reviewing the content. In summary, in this
> series, you will find:
> 
> 1. Patch 1: Re-arrange of display core documentation. This is
>    preparation work for the other patches, but it is also a way to expand
>    this documentation.
> 2. Patch 2 to 4: Document some common debug options related to display.
> 3. Patch 5: This patch provides an overview of how our display core next
>    works and a brief explanation of each component.
> 4. Patch 6: We use a lot of acronyms in our driver; for this reason, we
>    exposed a glossary with common terms used by display core.
> 
> Please let us know what you think we can improve this series and what
> kind of content you want to see for the next series.
> 
> Changes since V3:
>  - Add new acronyms to amdgpu glossary
>  - Add link between dc and amdgpu glossary
> Changes since V2:
>  - Add a comment about MMHUBBUB
> Changes since V1:
>  - Group amdgpu documentation together.
>  - Create index pages.
>  - Mirror display folder in the documentation.
>  - Divide glossary based on driver context.
>  - Make terms more consistent and update CPLIB
>  - Add new acronyms to the glossary
> 
> Thanks
> Siqueira
> 
> Rodrigo Siqueira (6):
>   Documentation/gpu: Reorganize DC documentation
>   Documentation/gpu: Document amdgpu_dm_visual_confirm debugfs entry
>   Documentation/gpu: Document pipe split visual confirmation
>   Documentation/gpu: How to collect DTN log
>   Documentation/gpu: Add basic overview of DC pipeline
>   Documentation/gpu: Add amdgpu and dc glossary
> 
>  Documentation/gpu/amdgpu-dc.rst               |   74 --
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst  |   87 ++
>  .../gpu/amdgpu/display/config_example.svg     |  414 ++++++
>  Documentation/gpu/amdgpu/display/dc-debug.rst |   77 ++
>  .../gpu/amdgpu/display/dc-glossary.rst        |  237 ++++
>  .../amdgpu/display/dc_pipeline_overview.svg   | 1125 +++++++++++++++++
>  .../gpu/amdgpu/display/dcn-overview.rst       |  171 +++
>  .../gpu/amdgpu/display/display-manager.rst    |   42 +
>  .../gpu/amdgpu/display/global_sync_vblank.svg |  485 +++++++
>  Documentation/gpu/amdgpu/display/index.rst    |   29 +
>  .../gpu/{amdgpu.rst => amdgpu/index.rst}      |   25 +-
>  Documentation/gpu/drivers.rst                 |    3 +-
>  12 files changed, 2690 insertions(+), 79 deletions(-)
>  delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>  create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
>  create mode 100644 Documentation/gpu/amdgpu/display/config_example.svg
>  create mode 100644 Documentation/gpu/amdgpu/display/dc-debug.rst
>  create mode 100644 Documentation/gpu/amdgpu/display/dc-glossary.rst
>  create mode 100644 Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
>  create mode 100644 Documentation/gpu/amdgpu/display/dcn-overview.rst
>  create mode 100644 Documentation/gpu/amdgpu/display/display-manager.rst
>  create mode 100644 Documentation/gpu/amdgpu/display/global_sync_vblank.svg
>  create mode 100644 Documentation/gpu/amdgpu/display/index.rst
>  rename Documentation/gpu/{amdgpu.rst => amdgpu/index.rst} (95%)
> 

