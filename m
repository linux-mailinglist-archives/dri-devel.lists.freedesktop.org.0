Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D754D26C42B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708136EA32;
	Wed, 16 Sep 2020 15:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FF96EA2E;
 Wed, 16 Sep 2020 15:27:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlR6fpnPFi8H6yUMfhNIUcrg702QsKk4Y+6uMf8HgJ+if7rBsMOqpyZOxWYDQK3aMYdfMXK+6+4kJQB7afvUloQko+O19I4ME4rLbpO/ZRw/PKA6Cv8XlK9ll4n5i0kWRacRhpmUrCRYdATuj40xpAZBvUfeA+HW50g1fjvBsbjcZAKTvOlRBT9PVOlynnJZMlS1sQDuBsOhLC/lqEEvGEQzzP/rfklebkp5slu5UlDhLz4aqn3ApD36PdvYKjelroaaPkSrgtPHKxsvUJ/lGy3CaXEEvIR0Z5hte8o3DxuMuj4zQ3ncRpYD9GbQLqgyV56MjUHxOtvJu5pP1EVi7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8dPMQVXEUGM/K6CgXk7YTQBx+ON17zOfyNdYs2clqw=;
 b=RlBJ/2b2cL6zQCcNu7B5nNTlSV0OLi87PqdHlb0/IAHmamVRPeXTelsIka6hQuom1i1psbDb1BHov8NV2IaixBBnclUmNj+k8qmu05vO0IDg8Jr/KVqMJpFyVQxklxcQ63TbgUAIXTrITsa0E/HhGpJ9nS2sTBTLEExLJzPz4rYkXCK/sqax8zO3fw8GBfNyHUEL6bQrDIRd4yN4DFe+HNeS/KoNErNgZjz6IeNUfxXo9Gr2mv7Sn6hmpRFZcIR5YZfFUeyG0a1wNQX8JhIZyhLTvu1cYI+DLQWRklYOkfXRGlLEkJhN1+qq8V7yb5N2dsUUb/8In2SiihxZ1ZVWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8dPMQVXEUGM/K6CgXk7YTQBx+ON17zOfyNdYs2clqw=;
 b=c6S3yWwG+xELN3s5258EITyr6oAtbZwwNn+I/GxqsRB+BZWcIZ+06HfKdNx6BA+c+dU6t9qUbeSUapSCpGO10E/dSX3E9pJikseyiI5+Ji5mxniUeuLNXXHS9DVqFoGKT8jB8mOxAlHqkbaIPkEtfks3TBpKnArTRA9RAUTSPZ4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3189.namprd12.prod.outlook.com (2603:10b6:a03:134::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 15:27:32 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::754e:8f27:157a:9101]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::754e:8f27:157a:9101%6]) with mapi id 15.20.3326.030; Wed, 16 Sep 2020
 15:27:32 +0000
Subject: Re: [PATCH v2 0/4] Enlarge tracepoints in the display component
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, hersenxs.wu@amd.com
References: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
 <20200916091214.GY438822@phenom.ffwll.local>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <e05be8ec-e73b-7fd6-efca-4a360e9ebb57@amd.com>
Date: Wed, 16 Sep 2020 11:27:27 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200916091214.GY438822@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::16) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Wed, 16 Sep 2020 15:27:30 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e8be37af-e383-4242-6857-08d85a55078c
X-MS-TrafficTypeDiagnostic: BYAPR12MB3189:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB31892796D473DF42CE461F40EC210@BYAPR12MB3189.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YlX8/kCbzGsN2b/6wZVyp2Ttx6PH9GL0ay37kmXOkqvorwLBfirLlxTc/KrwJqqRZlTTFFDamS7fvgfWfKr2UpxYGNFoRIPQE9nRg/CmnJSn0WkDHem6cQyzMzcCjRN52W1+vSnBrdGds2K5GnCQ7UKkC6NhMgEL3ZX1iuhJxtj09O8W0U2XxHIfqIVnhkwjC+RezJtN/H05qfZbKpR4IgLyMK/UKE/m/uKnl/F9qtWNrc7rTFF5aM9Zjmpvt7T2lYCIF/pdh7OPZt6Nru1nZEwE4k4SNb4MfYBy8NRZebI5m0wLhsJaIopTFBQ8P6iwpvhVTj2hoXxvWJYBgazpan6B3j1iGsaTw+Sn+kUOCLEZS/bxuNlkWC422LeEpdCfC/h1rCe0bJi1GaOqiU0jttHdKi6HH6ZEKO/k69xtV1UoymMPA45cKrcHJMdPGXj0d4Dku0dUJVXHCKi/gQLRMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(186003)(6636002)(956004)(66476007)(36756003)(8936002)(2616005)(31696002)(2906002)(66946007)(6486002)(478600001)(16526019)(110136005)(5660300002)(86362001)(52116002)(26005)(53546011)(6666004)(31686004)(16576012)(8676002)(66556008)(316002)(83380400001)(161623001)(921003)(147533002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4P4gRr+1uOWc2mpZuhEpfw6tTV4A6h60xuOQxO1JTOG8IqIPXzo7RWi7Gf1wbBmnBiMO4b3CMPA3pVEMQI5GU23oUi5PorPkHwZTR6jsUlOid1QiDvlSg6VkdgM7csgLswMtMfrMfW7nrvCbgSoiIMxy4ekJtFp2gdyQOn4kghRmUgngq2jE0MtvAsT1enstxOlxvSNkewGL8ARdr2/0nH4stVu+3YsRPiQSXvq7kemvbfumVIBSnm3CU5dr5tJWz19+hVqoxmdu60fuP/aKAL78E9CQLi3ASwNho64kkb4w+omoO+KlnKC0SoodUFyErELYrvdMI6FlxBGVhc/LXleYuHFWKsL6aUKDBQk9ZPeyUdHGXqW+D27nX0Gk+MS8UfQkx2MOykRS2ex3A6uEAhgIcOHM030bG040etRjVlB7v/CZ7ZGezOACzi+g+0phpGw8XQHOQnTsuNH9ghxggcnX5aIwaufZXQcPQ0U7ssWT3Tf7cSzOTs8R1iqFGaZGVsnuuZ2BCsjyTJTs+367TiTFBveEUspTTLECkmBXGQzqehxDVYR0dmvXV3uHpwXX95L2SNTmia7sCXgIo8fFZjcnRzOsy/YaRIXPZlM7JWDen4lsUXkDua2zdsI/KpgUsikQ3XpKs0efkVyBiSasYw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8be37af-e383-4242-6857-08d85a55078c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 15:27:32.2694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UvmdnHgcQKdqBOSwoqjeoidUWkJ7wsSvHLVLrCoMAkRg48hidWRts3M+tKPea+zvXU9+YSSSENn7+SPXFZXJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3189
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

On 2020-09-16 5:12 a.m., Daniel Vetter wrote:
> On Fri, Sep 11, 2020 at 10:59:23AM -0400, Rodrigo Siqueira wrote:
>> Debug issues related to display can be a challenge due to the complexity
>> around this topic and different source of information might help in this
>> process. We already have support for tracepoints inside the display
>> component, i.e., we have the basic functionalities available and we just
>> need to expand it in order to make it more valuable for debugging. For
>> this reason, this patchset reworks part of the current tracepoint
>> options and add different sets of tracing inside amdgpu_dm, display
>> core, and DCN10. The first patch of this series just rework part of the
>> current tracepoints and the last set of patches introduces new
>> tracepoints.
>>
>> This first patchset version is functional. Please, let me know what I
>> can improve in the current version but also let me know what kind of
>> tracepoint I can add for the next version.
>>
>> Finally, I want to highlight that this work is based on a set of patches
>> originally made by Nicholas Kazlauskas.
>>
>> Change in V2:
>> - I added another patch for capturing the clock state for different display
>>    architecture.
> 
> Hm I'm not super sure tracepoints for state dumping are the right thing
> here. We kinda have the atomic state dumping code with all the various
> callbacks, and you can extend that pretty easily. Gives you full state
> dump in debugfs, plus a few function to dump into dmesg.
> 
> Maybe what we need is a function to dump this also into printk tracepoint
> (otoh with Sean Paul's tracepoint work we'd get that through the dmesg
> stuff already), and then you could do it there?
> 
> Upside is that for customers they'd get a much more consistent way to
> debug display issues across different drivers.
> 
> For low-level hw debug what we do is give the hw guys an mmio trace, and
> they replay it on the fancy boxes :-) So for that I think this here is
> again too high level, but maybe what you have is a bit different.
> -Daniel

We have raw register traces, but what I find most useful is to be able 
to see are the incoming DRM IOCTLs, objects and properties per commit.

Many of the bugs we see in display code is in the conversion from DRM -> 
DM -> DC state. The current HW state is kind of useless in most cases, 
but the sequence helps track down intermittent problems and understand 
state transitions.

Tracepoints provide everything I really need to be able to track down 
these problems without falling back to a full debugger. The existing DRM 
prints (even at high logging levels) aren't enough to understand what's 
going on in most cases in our driver so funneling those into tracepoints 
to improve perf doesn't really help that much.

I think this kind of idea was rejected for DRM core last year with 
Sean's patch series but if we can't get them into core then I'd like to 
get them into our driver at least. These are a cleaned up version of 
Sean's work + my work that I end up applying locally whenever I debug 
something.

Regards,
Nicholas Kazlauskas

> 
>>
>> Rodrigo Siqueira (4):
>>    drm/amd/display: Rework registers tracepoint
>>    drm/amd/display: Add tracepoint for amdgpu_dm
>>    drm/amd/display: Add pipe_state tracepoint
>>    drm/amd/display: Add tracepoint for capturing clocks state
>>
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  17 +
>>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 712 +++++++++++++++++-
>>   .../dc/clk_mgr/dce112/dce112_clk_mgr.c        |   5 +
>>   .../display/dc/clk_mgr/dcn10/rv1_clk_mgr.c    |   4 +
>>   .../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c  |   4 +
>>   .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c |   4 +
>>   .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |   4 +
>>   drivers/gpu/drm/amd/display/dc/core/dc.c      |  11 +
>>   .../gpu/drm/amd/display/dc/dce/dce_clk_mgr.c  |   5 +
>>   .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  17 +-
>>   10 files changed, 747 insertions(+), 36 deletions(-)
>>
>> -- 
>> 2.28.0
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
