Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C1F60D4EC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 21:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EC2892E0;
	Tue, 25 Oct 2022 19:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2074.outbound.protection.outlook.com [40.107.101.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBDC88EBA;
 Tue, 25 Oct 2022 19:48:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=li9D0SuCV7zGXZxOTVntQSSBVB1GfQtZ76JxxwXkCgDWBIs4g/ov8Xrg7XMR4Kku0RNrGGAYHXpe7D3rLS40MoeXu5Mgc7Od5Ge0giQcwXkm3goqvB930a4BIX66SLucrvRd0lva1zcIZU29dX3fiu1w87EOk/llbir+Yxqm1d2YdLtczRAxfR7rXhir9Q24fbct5WGKVvFpI+a+i8Q31XALp8DoN23d6ivse2d8xxRDvNAwgmcz3lafpMvtkmWrlq2jE3224gQAuPdEqwIYP1RKI+9vSMOS79FglE/t5j5famX60xAv+GmuOXRja8XkT/rhX6ajd0zt6uRtS6IEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7qvt/qm7mL/1fwAvKs5PmhGam1jTTa8uIajS4NyMG4=;
 b=nrISjIhim/M4AwYqFShFXIVVSqEQtuBbPSEmX8AN9X1IdNmrZRoirifhWkTZxvdHcuQNjwbxdHg5CHTKHSIrVwe/roXVoeeT2dh/Z33lQknuwxVLr86dVMteooIJZRFNtSeGUIWTtidg/p6+Qe/TPzPt8LB0PqN871U4Y4+wHbaIU4XDZa1ecs9iYRDg/KVGj/U5IPMV0IWOBr96aAghYTs5+/JfjTp0mzJQYcKGuZKgjNp27bBr988JQl+QSBieJ3y9Ym95No/em0CWaFDWW3C3l0ACdrtaDnAJYElU8ctt6qWfnSUI91iMbmy62qKc5S3IN2SG6f85dfdnW2i57g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7qvt/qm7mL/1fwAvKs5PmhGam1jTTa8uIajS4NyMG4=;
 b=5YHOG6HZaJqlqJ6wS2HFR/rd1bZesxfJzfGhu88UANn/0yz2fFGngxE998fNLFENaoGmkqQzwzE/SHUmbUrZjzE/+lgn7fZxT6SJrXLdhvkZk8yDs0bq4dHP+Fon77Mxts0yqn00+Y6Eh4m2ITg68DLU4QVY4O5gNIa5M7qO4Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL1PR12MB5192.namprd12.prod.outlook.com (2603:10b6:208:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 19:48:34 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be%6]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 19:48:34 +0000
Message-ID: <f2b6f0e1-1ae0-21ec-372e-6e90827ccea6@amd.com>
Date: Tue, 25 Oct 2022 15:48:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] [next] amdkfd: remove unused kfd_pm4_headers_diq header
 file
Content-Language: en-US
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <Y1eoYDDZWdyLNlBc@mail.google.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <Y1eoYDDZWdyLNlBc@mail.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::22) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BL1PR12MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d666c36-22c0-4f07-629f-08dab6c1e706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: alHpmXimOCgu9VYeSK20RKpbR9j4SO0gg0zTIETOekSNHhgEBDUROaiS5GSFmbjvRmTLmb5ZoJaP0EUqwDxAqem67gItRPZ5EsWTRzUGZIGtsU/eS1vmNJhlr+vxQTuRiki9eMRRhK2NEHjEri9F7L/RICaJDu3VSLlfBupvENclIjESQ8y75gfSOV/wE3GNEuQYZfhDnWawD0rvcnNNxO74F/Agn3vDa3ey7ARXbtMC7LIBiDLnH7k3Iz6Ah8Pb+jqJu2hHf8MhTLOVzumtClUui9uxJINiJkBPMr9fiMLXI66m5PtD4ZqAbMeNk+54ikTJQuXZRjM8qai6SsEDTBWzuBHf+cuSehfNZzl2g/4bbwA7ELDbD3Jz/r6WYj4AyguL+qezRXgFRLSHSUc/RQRtMNJTK9wFHkt3Em7AX7kjruAvkKU1IO97mjz95pYhq1FHA21FzSHnXsJ7/GfnsHltWvUXxV1r7YMtU2D5MTyXqxHaJg4JifptB5BLDf9A3Hej81X33hsZfGjwPFh5Du1lOxCnasYlccOzv4V0L+DwpCAZ8Gj34NcOv+R3pTWuiK8tdlM1mLXwgXP+7u7MpZ8ntiz4PBFf+TmaJV3YSuHZJEnH+/p6DEUSkA856CLcMY6Amwyn0r7bWvQvYM+UMhlQFYcWIcvUVQDNS18lQ4MkrhJ0rUz3+GJoz4JERAYcaOSEHvlNqKXqt1b5If+/7HHIDxVL3y+gP+/caC69FYbek9RY2rBQLvO2szedNTd07L6tMSVWUY8bDGtawMfysAyOTd6ngrnD8w1SAfA/rbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199015)(36756003)(66556008)(4001150100001)(44832011)(41300700001)(66946007)(66476007)(8676002)(5660300002)(478600001)(6486002)(8936002)(110136005)(2906002)(83380400001)(4326008)(38100700002)(316002)(6512007)(31696002)(6506007)(86362001)(26005)(186003)(31686004)(2616005)(66899015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkxsaWNmNzdlR2FITk1tZE1Benk1T3J1b2tOblBhbkwxd25TYVdUQWFxeG5O?=
 =?utf-8?B?U1lZNnV3TWtPOWZLdTV4dVJya0ltVUhWQ2s4cit1SHBxQUNXZ3hmR0pZTGd4?=
 =?utf-8?B?RjBVWkJmMWJ6TDVUVkRlcjBmYWJWbk9iZUF4MDNSY1JOWk04SXA0MGJZdkFi?=
 =?utf-8?B?dmg4cU9YemNWa2lFV295WnhzdWtpV1Q3Ri9wWVhiVlhIL0dIVmo2Y01zcG5v?=
 =?utf-8?B?TjYwRWMweEFCNVhTaWd6SWp2am9ybTV2RmhEbzFhVVFNL2UwbU9Ud1FXRlp5?=
 =?utf-8?B?MEs4NXREdjBzTzUrRFAwbHhqUkF3dXEveU1TODFmNU5TdVg1OWtMQmhSTHBq?=
 =?utf-8?B?NTVLUWNpZGlNOWlkUGtOZUdVYmpZQVRKc2kwWTJkQUtRVlRWNTNhZVlINHdm?=
 =?utf-8?B?ampaUy92aDdCaGMvb3JIREpLU1dKRTJ1MjdkZ3diZ2pvTmFQTjRWZTdSTEtI?=
 =?utf-8?B?WGEwbEJZdTkybGxoVnhxOEJ2a1QvZmlLWHZaQUdWcnJidk1YUTQyclBYbmlD?=
 =?utf-8?B?Mm5aVDk1a0k4MXBuY21JbVVGdUhtdzNzZmJUQURYTVJyNld3VEF5OXhaR1VG?=
 =?utf-8?B?RFpXeFZ6V3FLc2lKL3BDUUpMZE85dTJzOXlONmV2R2lOTWFKZEo0UUdOMmJR?=
 =?utf-8?B?MmowSHVMZ1ZJSTlhSGR1bkp3OEl2R2ZYRWxYYkFwcjJWV3FvUXZvdjBMaFdr?=
 =?utf-8?B?SVFicUlpa3VKeGZFWExJUHRsSXlaT2lkUVp4TUVaNlVidkx4ZnRaQWlJeGNF?=
 =?utf-8?B?TDVPOU5kaWxscXZyYmM5amVtajhsYXY1VTEvc3NSanB2RXFkNlc5R1d5ZWhw?=
 =?utf-8?B?NU4zVEZyZnpNZlhocHBucWhVTlRVWmFTZ0phTHk0MmRaRzNBa1E4eGkvMGJ0?=
 =?utf-8?B?UXJobEd3S0o4ZTYxU2F3WWQ0NGNUUFVOVVBVT1BicVI4VEZERFRCNmQvWEQ3?=
 =?utf-8?B?YlA4UTdoNTFOMmtVTTd2QVJUTUlnVnBNQzlqQWF3UlNvU1ZtSk1lVU8vY2dG?=
 =?utf-8?B?WnZTaURrZzZKMjBtMXQ4NHNmaXAwMkhKZTZvM2p2RzlzVHFqbXNQZTl4SUNa?=
 =?utf-8?B?VWRSaU5CRUJrL1VDRVRNUEZsOU1uSzd0RFdCQ2oxQVlKS0tqK2lId2s4MTZp?=
 =?utf-8?B?elc4cG1oZm9STEZRK29VbjcydlFWeWJZWVY1aG5mMCtwYlhiSzB0R2ZwWTls?=
 =?utf-8?B?SVRWQ0pxejNWVzBsUTRQa2ZEaGxSenpnTnBDZE1FRW1URGkxWFFkT2kxNUN5?=
 =?utf-8?B?SkhsQTRXRjkzUkJ2RGVLMXBJVy91Y0RTMXhvdlY3N3dGVFVWdC9JZ1NHUkhJ?=
 =?utf-8?B?b2RyZ2huNmxhY2FHTllwUkdxU0QwejFhUklZMmg1ZWUxRnhTRlVKZmhuSTJZ?=
 =?utf-8?B?dlNZbitzaG9YZVB0eXYvQjgvWnFjbE56cjk3U1crcWxQUWlhajR4bG1iTE9J?=
 =?utf-8?B?QW9ZWVFZaURUcjF6cHpYQi9nekIwaGxLaTluLzRlNEloYkNpYVUzNEZ1NWp2?=
 =?utf-8?B?M2tocDErR004Z2JRVmVnSXUrT0tzRGJFVDBMbW11bEtCeHpWQlY1V1VoUzc0?=
 =?utf-8?B?emVmZk1PcHkrQ1h3bjRDZDhZcmh2WWRrRGx6eTlsempaeUMwOTdCaWxXME5Q?=
 =?utf-8?B?YXZNeFovN0ZqaVJsbUx1bjJ6T25IcVVOMGd4alpFcWIrTnBQT01sVzQwSXE2?=
 =?utf-8?B?bWJBZWhoVmVIWlh4bTFpTkpjNmQ5NzRjNzJhVlNHY05qekhPM1gwRk14ZUl0?=
 =?utf-8?B?cmNLVXdvTU1MQy95ekJydWpNcWdSSmlCT24rMmpiY2FWLzF1SnF2clJXTXRq?=
 =?utf-8?B?elh2ODM3R2s3T2dXMjNMRWw3UTd4SDBOY0xMR3NLSHppQVVQRE0raGhBcEda?=
 =?utf-8?B?c1dGR1lmU1BPNFo3NXlYMHpicFdIZndxVHdiWlErMVVmeXhwVDR4SFoxRmxv?=
 =?utf-8?B?bUU0TkQ1WkZhLzJPekFLalJna21sY3kxbUpENWd2MFFrM1BvTmhlYWUwR1g2?=
 =?utf-8?B?UzRnRWxnck10M3VBbnJ4c0VhdUtzdjdpemUvc2VDbmZtcVFNN2pTOVhpQ3Iv?=
 =?utf-8?B?Z09ralR1UkZBR3RzWnY3eFlLQzJCakhnT2xmQmk5ZlNYTG1MSmhLbjAwSGZS?=
 =?utf-8?Q?lWlcwlpir2T2TVgg4bwmbBUrn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d666c36-22c0-4f07-629f-08dab6c1e706
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 19:48:34.8182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrR5foe5KVMzFhG5qwKj2s/jEQkIyl8t90zy/bq6WB3SKTsGIRz4gl3gqbP2q+h4HT03dqtWNU/Cuyo+GX70TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5192
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-10-25 um 05:12 schrieb Paulo Miguel Almeida:
> kfd_pm4_headers_diq.h header is a leftover from the old H/W debugger
> module support added on commit <fbeb661bfa895dc>. That implementation
> was removed after a while and the last file that included that header
> was removed on commit <5bdd3eb253544b1>.
>
> This patch removes the unused header file kfd_pm4_headers_diq.h
>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>

Thank you for this patch and the one that removes struct cdit_header. I 
am applying both to our amd-staging-drm-next branch. I'm also fixing up 
the prefix of the commit headline to match our usual convention: 
drm/amdkfd: ...

Both patches are

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   .../gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h  | 291 ------------------
>   1 file changed, 291 deletions(-)
>   delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h
> deleted file mode 100644
> index f9cd28690151..000000000000
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h
> +++ /dev/null
> @@ -1,291 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> -/*
> - * Copyright 2014-2022 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#ifndef KFD_PM4_HEADERS_DIQ_H_
> -#define KFD_PM4_HEADERS_DIQ_H_
> -
> -/*--------------------_INDIRECT_BUFFER-------------------- */
> -
> -#ifndef _PM4__INDIRECT_BUFFER_DEFINED
> -#define _PM4__INDIRECT_BUFFER_DEFINED
> -enum _INDIRECT_BUFFER_cache_policy_enum {
> -	cache_policy___indirect_buffer__lru = 0,
> -	cache_policy___indirect_buffer__stream = 1,
> -	cache_policy___indirect_buffer__bypass = 2
> -};
> -
> -enum {
> -	IT_INDIRECT_BUFFER_PASID = 0x5C
> -};
> -
> -struct pm4__indirect_buffer_pasid {
> -	union {
> -		union PM4_MES_TYPE_3_HEADER header;	/* header */
> -		unsigned int ordinal1;
> -	};
> -
> -	union {
> -		struct {
> -			unsigned int reserved1:2;
> -			unsigned int ib_base_lo:30;
> -		} bitfields2;
> -		unsigned int ordinal2;
> -	};
> -
> -	union {
> -		struct {
> -			unsigned int ib_base_hi:16;
> -			unsigned int reserved2:16;
> -		} bitfields3;
> -		unsigned int ordinal3;
> -	};
> -
> -	union {
> -		unsigned int control;
> -		unsigned int ordinal4;
> -	};
> -
> -	union {
> -		struct {
> -			unsigned int pasid:10;
> -			unsigned int reserved4:22;
> -		} bitfields5;
> -		unsigned int ordinal5;
> -	};
> -
> -};
> -
> -#endif
> -
> -/*--------------------_RELEASE_MEM-------------------- */
> -
> -#ifndef _PM4__RELEASE_MEM_DEFINED
> -#define _PM4__RELEASE_MEM_DEFINED
> -enum _RELEASE_MEM_event_index_enum {
> -	event_index___release_mem__end_of_pipe = 5,
> -	event_index___release_mem__shader_done = 6
> -};
> -
> -enum _RELEASE_MEM_cache_policy_enum {
> -	cache_policy___release_mem__lru = 0,
> -	cache_policy___release_mem__stream = 1,
> -	cache_policy___release_mem__bypass = 2
> -};
> -
> -enum _RELEASE_MEM_dst_sel_enum {
> -	dst_sel___release_mem__memory_controller = 0,
> -	dst_sel___release_mem__tc_l2 = 1,
> -	dst_sel___release_mem__queue_write_pointer_register = 2,
> -	dst_sel___release_mem__queue_write_pointer_poll_mask_bit = 3
> -};
> -
> -enum _RELEASE_MEM_int_sel_enum {
> -	int_sel___release_mem__none = 0,
> -	int_sel___release_mem__send_interrupt_only = 1,
> -	int_sel___release_mem__send_interrupt_after_write_confirm = 2,
> -	int_sel___release_mem__send_data_after_write_confirm = 3
> -};
> -
> -enum _RELEASE_MEM_data_sel_enum {
> -	data_sel___release_mem__none = 0,
> -	data_sel___release_mem__send_32_bit_low = 1,
> -	data_sel___release_mem__send_64_bit_data = 2,
> -	data_sel___release_mem__send_gpu_clock_counter = 3,
> -	data_sel___release_mem__send_cp_perfcounter_hi_lo = 4,
> -	data_sel___release_mem__store_gds_data_to_memory = 5
> -};
> -
> -struct pm4__release_mem {
> -	union {
> -		union PM4_MES_TYPE_3_HEADER header;	/*header */
> -		unsigned int ordinal1;
> -	};
> -
> -	union {
> -		struct {
> -			unsigned int event_type:6;
> -			unsigned int reserved1:2;
> -			enum _RELEASE_MEM_event_index_enum event_index:4;
> -			unsigned int tcl1_vol_action_ena:1;
> -			unsigned int tc_vol_action_ena:1;
> -			unsigned int reserved2:1;
> -			unsigned int tc_wb_action_ena:1;
> -			unsigned int tcl1_action_ena:1;
> -			unsigned int tc_action_ena:1;
> -			unsigned int reserved3:6;
> -			unsigned int atc:1;
> -			enum _RELEASE_MEM_cache_policy_enum cache_policy:2;
> -			unsigned int reserved4:5;
> -		} bitfields2;
> -		unsigned int ordinal2;
> -	};
> -
> -	union {
> -		struct {
> -			unsigned int reserved5:16;
> -			enum _RELEASE_MEM_dst_sel_enum dst_sel:2;
> -			unsigned int reserved6:6;
> -			enum _RELEASE_MEM_int_sel_enum int_sel:3;
> -			unsigned int reserved7:2;
> -			enum _RELEASE_MEM_data_sel_enum data_sel:3;
> -		} bitfields3;
> -		unsigned int ordinal3;
> -	};
> -
> -	union {
> -		struct {
> -			unsigned int reserved8:2;
> -			unsigned int address_lo_32b:30;
> -		} bitfields4;
> -		struct {
> -			unsigned int reserved9:3;
> -			unsigned int address_lo_64b:29;
> -		} bitfields5;
> -		unsigned int ordinal4;
> -	};
> -
> -	unsigned int address_hi;
> -
> -	unsigned int data_lo;
> -
> -	unsigned int data_hi;
> -
> -};
> -#endif
> -
> -
> -/*--------------------_SET_CONFIG_REG-------------------- */
> -
> -#ifndef _PM4__SET_CONFIG_REG_DEFINED
> -#define _PM4__SET_CONFIG_REG_DEFINED
> -
> -struct pm4__set_config_reg {
> -	union {
> -		union PM4_MES_TYPE_3_HEADER header;	/*header */
> -		unsigned int ordinal1;
> -	};
> -
> -	union {
> -		struct {
> -			unsigned int reg_offset:16;
> -			unsigned int reserved1:7;
> -			unsigned int vmid_shift:5;
> -			unsigned int insert_vmid:1;
> -			unsigned int reserved2:3;
> -		} bitfields2;
> -		unsigned int ordinal2;
> -	};
> -
> -	unsigned int reg_data[1];	/*1..N of these fields */
> -
> -};
> -#endif
> -
> -/*--------------------_WAIT_REG_MEM-------------------- */
> -
> -#ifndef _PM4__WAIT_REG_MEM_DEFINED
> -#define _PM4__WAIT_REG_MEM_DEFINED
> -enum _WAIT_REG_MEM_function_enum {
> -	function___wait_reg_mem__always_pass = 0,
> -	function___wait_reg_mem__less_than_ref_value = 1,
> -	function___wait_reg_mem__less_than_equal_to_the_ref_value = 2,
> -	function___wait_reg_mem__equal_to_the_reference_value = 3,
> -	function___wait_reg_mem__not_equal_reference_value = 4,
> -	function___wait_reg_mem__greater_than_or_equal_reference_value = 5,
> -	function___wait_reg_mem__greater_than_reference_value = 6,
> -	function___wait_reg_mem__reserved = 7
> -};
> -
> -enum _WAIT_REG_MEM_mem_space_enum {
> -	mem_space___wait_reg_mem__register_space = 0,
> -	mem_space___wait_reg_mem__memory_space = 1
> -};
> -
> -enum _WAIT_REG_MEM_operation_enum {
> -	operation___wait_reg_mem__wait_reg_mem = 0,
> -	operation___wait_reg_mem__wr_wait_wr_reg = 1
> -};
> -
> -struct pm4__wait_reg_mem {
> -	union {
> -		union PM4_MES_TYPE_3_HEADER header;	/*header */
> -		unsigned int ordinal1;
> -	};
> -
> -	union {
> -		struct {
> -			enum _WAIT_REG_MEM_function_enum function:3;
> -			unsigned int reserved1:1;
> -			enum _WAIT_REG_MEM_mem_space_enum mem_space:2;
> -			enum _WAIT_REG_MEM_operation_enum operation:2;
> -			unsigned int reserved2:24;
> -		} bitfields2;
> -		unsigned int ordinal2;
> -	};
> -
> -	union {
> -		struct {
> -			unsigned int reserved3:2;
> -			unsigned int memory_poll_addr_lo:30;
> -		} bitfields3;
> -		struct {
> -			unsigned int register_poll_addr:16;
> -			unsigned int reserved4:16;
> -		} bitfields4;
> -		struct {
> -			unsigned int register_write_addr:16;
> -			unsigned int reserved5:16;
> -		} bitfields5;
> -		unsigned int ordinal3;
> -	};
> -
> -	union {
> -		struct {
> -			unsigned int poll_address_hi:16;
> -			unsigned int reserved6:16;
> -		} bitfields6;
> -		struct {
> -			unsigned int register_write_addr:16;
> -			unsigned int reserved7:16;
> -		} bitfields7;
> -		unsigned int ordinal4;
> -	};
> -
> -	unsigned int reference;
> -
> -	unsigned int mask;
> -
> -	union {
> -		struct {
> -			unsigned int poll_interval:16;
> -			unsigned int reserved8:16;
> -		} bitfields8;
> -		unsigned int ordinal7;
> -	};
> -
> -};
> -#endif
> -
> -
> -#endif /* KFD_PM4_HEADERS_DIQ_H_ */
