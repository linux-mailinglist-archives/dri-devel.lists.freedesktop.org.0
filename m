Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A8F3D0E0B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 13:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3886E8A0;
	Wed, 21 Jul 2021 11:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4920C6E85D;
 Wed, 21 Jul 2021 11:45:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFfbFtXYjqLUC20sEZsW0YzHofIXvLtIwPQKgbNnuPZMfUv/MF8uvHP0vXMuQCJSeYyOAwJ8X0edBKc4MWDEDgiorByuv6zi9AYK1dH+vlVOomc+e37dx21mol1p0ZXBnteeQDvEfxnI5PXFjgMYnHrtmUAAwr+41tdvGTIzX/WORjdrwz0mMdcWL4aizoGdnt80OvHR0u9QF03yc6zO6hTcDc3Z4KGWFqLRCptn1S82Tx+rrnMUd6HxWJnAk4Rem6zjDZTr5cu6iGgI5BLdraxIz5Ie2aD1q8GkiUoIUKXdumw5eaNWRxaEUmQw8n8gl0b1hOpsihYr4P1QvY84SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XWhFyw93QKX1y4EM5i+DnVz/9xOTPKgouU3HNXWPKE=;
 b=Ta0nyWxiTL875BsA1XqVP2ko7seXbB5Vo1wbn0j7s74oUHkO6e1hMf2EP5j/q8tV10dw7rg6DgxUjNERpg5MoF1tDiT6FmIYdyVhZ94pWyrfsx/fvukjEqAZUaQ3+3xhFniIs2zpxO6BGJ/JomUdRXKdpcPbkPfpNG9nkE6LFMbRUb335K2flQxTocxAA5QujH0jkWEvaJV96SF9gSuqX4X6SQs+21OGfK2KvJbcJ8zCaSZePb3taG9+hQad1p28uVhXUUFdeWPTIBNBpZr9I0z8/sA8Rv1lmWmFfi4DUeaH8dBcgM89M9mtywUXJuYYchHvfeIGo2c1eAYgDwhQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XWhFyw93QKX1y4EM5i+DnVz/9xOTPKgouU3HNXWPKE=;
 b=FqN8o6p/sZefJnRbAsekPi2KESnEoj619eTLXIw14BxC3Un/NULp2pB8rEuEOuOKBtS9inApMn0Xl6q3wN4mVoVwydt5dPdIyki5gsc5+mV3up4gGbnBAvfhVpIm+GzTURF6OrrGvGqEHwwHPxOstdVRaWfLh7O0N8Pop5jCFKU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB5564.namprd12.prod.outlook.com (2603:10b6:610:65::24)
 by CH2PR12MB5516.namprd12.prod.outlook.com (2603:10b6:610:6b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 11:45:00 +0000
Received: from CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::a1f2:ad80:7e9f:db24]) by CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::a1f2:ad80:7e9f:db24%4]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 11:45:00 +0000
Date: Wed, 21 Jul 2021 07:44:57 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v3 2/4] drm/amd/display: Add FPU event trace
Message-ID: <20210721114457.jhponmsgeliwalkc@outlook.office365.com>
References: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
 <20210720004914.3060879-3-Rodrigo.Siqueira@amd.com>
 <88027c93-b254-875d-c640-8aeb6dbdd0ac@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88027c93-b254-875d-c640-8aeb6dbdd0ac@amd.com>
X-ClientProxiedBy: YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26)
 To CH2PR12MB5564.namprd12.prod.outlook.com
 (2603:10b6:610:65::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:97a3:bc2c:353f:aaca)
 by YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 11:44:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5b79c63-d69a-47ca-509d-08d94c3cf883
X-MS-TrafficTypeDiagnostic: CH2PR12MB5516:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB551699D396F1A4817817A5D398E39@CH2PR12MB5516.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6pnZV9XoJHKF4sSECo2QaYOmBhyyRUlnsr7adr45gJXLxsLMoE4i0+44pTEg3diJR6yD4ZkJv6e2ND1FPc4DUM4tyT/Twcn/TPXwoQDxM3VaG36ymOQKcfAHW5lhlIzPjAH5jdnthgndB4MpwP85hN/dss9D3d2RhA8y1IqNTpl/IhgsGnu65O+78r5MTmq9iR3lkXaX3hhv8aHhx8S8HtrjOxPDDIi15VE0BX1Dx4D1R+IKgFMY6mQ4QoCCshW9F1fXjpEs4OpnwIH2i6+xKOyUNncWWHc5tX3PIas65FgpAWzqorBSvbxV0gN4bHy+s6TCtsliYPGM7NwBSVoCKoGIIHo++fs9hV736JcLijuytD6aut1gPc4JUlDsybnM5Oki5cwybO6MTIfKggRf4vG0dhcZmNnOQPdgePns97xf3en4+9LNP54wLPLNAbeLizmFj/etLhkwBwN05bBs9ZjY2FN1J+Sc2OhZbN9OhJn+hFtbnDcqX0nIUtNDL5R9N1UV+KRQlQY5gtdlL89o1hA21HVwX3osbyMosYjI/VDDIOvTPvLzsl/cfpD5P6xYVl0VPfHS1SXA0lnuFVQUB7IU4RZ+MreGozJMXDBUBMMiIY+H6bmdrY32iOqFGDxPO0JjjktkLnofDgomgdzwaCfN8wRDgPhMqYVeFYdlm9TW/WWY3AQbjBb2M2ekhIBn0aQ6McZj9Ln0bAjkgBa//ZODEEnPu6chi89kGbi+QPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5564.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(3716004)(5660300002)(6636002)(83380400001)(2906002)(52116002)(38100700002)(8936002)(54906003)(1076003)(316002)(86362001)(9686003)(8676002)(478600001)(966005)(66574015)(55016002)(4326008)(66946007)(6862004)(66476007)(186003)(66556008)(7696005)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1S8t5BwXtIBwAu5H6BNCizhm/iLBABji0l98gj3xl4HmCm2mTKgzJLPFAa?=
 =?iso-8859-1?Q?9CRXf3STaCcxQVAX61BX4uIkhCkDqULOtwO+wJGMmHJBwkcCG1j7QeeJWw?=
 =?iso-8859-1?Q?4aG4swoXxqnYQqgMEKnbSxq9NPOYEtpsc2lSFYptZ3W0VLyyE3qafeVpbf?=
 =?iso-8859-1?Q?OemKb9GpnCWM/Wbs7RUPjmxAYDjn/k0oaaGd+Uz8Omz1fFBaVBNy44sVVM?=
 =?iso-8859-1?Q?WoFqsJeht3dKDdfRpgCfH2k8yB806BYCYtFHeAqOA+HFjszxKW/658e5R/?=
 =?iso-8859-1?Q?j1nURrS/bc4Xqzu7F7YGyfECcQHArHbESMxy5tkaRQcb+0ganZyDsUqeJx?=
 =?iso-8859-1?Q?4W+uZLQYcXbsQH1BecX3bl0wdG3S01nP2b5ZD0Hkg1k3vVvhWqrNYQiByk?=
 =?iso-8859-1?Q?onlJiCG0Wgtsy/XRrvFNHOWiXLKcKRM3QdFaWp6A+yloAsF+XcPXbQiisj?=
 =?iso-8859-1?Q?E+x8hLVDh3GCSFqlQaDp3u285PmA+97C1Opg7D1L3RYZUTxnUNPqDpUnIt?=
 =?iso-8859-1?Q?HW4oJZMxnTLZ1gs1Dth5sKwjC4KR7f7n/HNFkgTgt+xwLAJeJfZNDdpR6j?=
 =?iso-8859-1?Q?q78HuverbKpK6woGXNnxSfCap7HkjaBgz2MwlVuFIk3sDZKIJ46+84Ekkg?=
 =?iso-8859-1?Q?Nek1RlEsRWtQCkYclwhhBI+A8i0J64bbA7aUseKXiTOr5I6TCWyIz08sSI?=
 =?iso-8859-1?Q?fGNfN11FaSjEDZ3HYY1WmHKX8yAUS6S60+UM4PHbGDfT1QkaFq5bFABelO?=
 =?iso-8859-1?Q?8rC6SBHAS0228q4LdkxsJJkh4vUhoscCwMAY9VAiL3ejMCwpC4lfrM2SFw?=
 =?iso-8859-1?Q?A5g7nMMqjyrwejkuQSWpuEEnTPp2KLEsBb1HkjtC1fxmeSafr1qN4cExDg?=
 =?iso-8859-1?Q?aMXtihQjgM03vrOQV60Kz+x8Q+vkoXAqnFVIvFod9gRF/CFK/kcHFqek/R?=
 =?iso-8859-1?Q?NxcKcb74G809mlq7VasK4gZviNlUnK1slkYGkkP/RpzAmhaS1sY5tgMAXV?=
 =?iso-8859-1?Q?YcW2/2iSssM9iutmt1M3g8/P9KHwtkFBjxnfNwqox1SzrY1OE3r0jcjesR?=
 =?iso-8859-1?Q?hqzlbFWcR7Tg+PvRsFwR8cYDUc1kyhWVc9FEP0yTWlTA6kUmuzszbKvOqB?=
 =?iso-8859-1?Q?iUGsInstROAMorMiHAjgusSjQcTpdklwkRWL8LU3oqWgOtx/BJyYPWpHF4?=
 =?iso-8859-1?Q?2/crAWssbV6iUlZLtk+l2vHaz8usW+xx0z0sQ1sMUf6AWdc7IHaanUzXaC?=
 =?iso-8859-1?Q?P2AcMXAr3GDedKgfJgCG0TVAlxxfasQCNIZvgfKhnqmtQYb+/S07m220dX?=
 =?iso-8859-1?Q?UgP9soQve5pmV3lnr4J/Wkpv338T5ATf1YSZvTxEQON5OKORjH3Tp4Ia4x?=
 =?iso-8859-1?Q?KSLuHXG6Bdlu0Yjl4u+zK5DLFcCIQfixwI3lgBg0ojDDohj+ibrXRNygyS?=
 =?iso-8859-1?Q?lbh2K2iHcWwf/x0u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b79c63-d69a-47ca-509d-08d94c3cf883
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 11:45:00.2950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4D3Z0qiHPdUUQD8/6R99lkmTBtBvr6LDXK/9WuuW+/QvW53cjSNqrbGcu3+IXWLjyGCVoNkpPTX6+BgOcgk4zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5516
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Peter Zijlstra <peterz@infradead.org>,
 roman.li@amd.com, dri-devel@lists.freedesktop.org, sunpeng.li@amd.com,
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/20, Christian König wrote:
> 
> 
> Am 20.07.21 um 02:49 schrieb Rodrigo Siqueira:
> > We don't have any mechanism for tracing FPU operations inside the
> > display core, making the debug work a little bit tricky. This commit
> > introduces a trace mechanism inside our DC_FP_START/END macros for
> > trying to alleviate this problem.
> > 
> > Changes since V2:
> > - Make sure that we compile FPU operation only in the context that DCN
> >    is enabled.
> > 
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Anson Jacob <Anson.Jacob@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Hersen Wu <hersenxs.wu@amd.com>
> > Cc: Aric Cyr <aric.cyr@amd.com>
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > ---
> >   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  4 ++
> >   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 21 ++++++
> >   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 64 +++++++++++++++++++
> >   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    | 33 ++++++++++
> >   drivers/gpu/drm/amd/display/dc/dc_trace.h     |  3 +
> >   drivers/gpu/drm/amd/display/dc/os_types.h     |  6 +-
> >   6 files changed, 128 insertions(+), 3 deletions(-)
> >   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> >   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> > index 91fb72c96545..718e123a3230 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> > @@ -27,6 +27,10 @@
> >   AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o
> > +ifdef CONFIG_DRM_AMD_DC_DCN
> > +AMDGPUDM += dc_fpu.o
> > +endif
> > +
> >   ifneq ($(CONFIG_DRM_AMD_DC),)
> >   AMDGPUDM += amdgpu_dm_services.o amdgpu_dm_helpers.o amdgpu_dm_pp_smu.o amdgpu_dm_psr.o
> >   endif
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> > index 46a33f64cf8e..230bb12c405e 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> > @@ -637,6 +637,27 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
> >   		  __entry->refresh_rate_ns)
> >   );
> > +TRACE_EVENT(dcn_fpu,
> > +	    TP_PROTO(bool begin, const char *function, const int line),
> > +	    TP_ARGS(begin, function, line),
> > +
> > +	    TP_STRUCT__entry(
> > +			     __field(bool, begin)
> > +			     __field(const char *, function)
> > +			     __field(int, line)
> > +	    ),
> > +	    TP_fast_assign(
> > +			   __entry->begin = begin;
> > +			   __entry->function = function;
> > +			   __entry->line = line;
> > +	    ),
> > +	    TP_printk("%s()+%d: %s",
> > +		      __entry->function,
> > +		      __entry->line,
> > +		      __entry->begin ? "begin" : "end"
> > +	    )
> > +);
> > +
> >   #endif /* _AMDGPU_DM_TRACE_H_ */
> >   #undef TRACE_INCLUDE_PATH
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> > new file mode 100644
> > index 000000000000..d5d156a4517e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> > @@ -0,0 +1,64 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright 2021 Advanced Micro Devices, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + *
> > + * Authors: AMD
> > + *
> > + */
> > +
> > +#include "dc_trace.h"
> > +
> > +#include <asm/fpu/api.h>
> > +
> > +/**
> > + * dc_fpu_begin - Enables FPU protection
> > + * @function_name: A string containing the function name for debug purposes
> > + *   (usually __func__)
> > + *
> > + * @line: A line number where DC_FP_START was invoked for debug purpose
> > + *   (usually __LINE__)
> > + *
> > + * This function is responsible for managing the use of kernel_fpu_begin() with
> > + * the advantage of providing an event trace for debugging.
> > + *
> > + * Note: Do not call this function directly; always use DC_FP_START().
> > + */
> > +void dc_fpu_begin(const char *function_name, const int line)
> > +{
> > +	TRACE_DCN_FPU(true, function_name, line);
> > +	kernel_fpu_begin();
> > +}
> > +
> > +/**
> > + * dc_fpu_end - Disable FPU protection
> > + * @function_name: A string containing the function name for debug purposes
> > + * @line: A-line number where DC_FP_END was invoked for debug purpose
> > + *
> > + * This function is responsible for managing the use of kernel_fpu_end() with
> > + * the advantage of providing an event trace for debugging.
> > + *
> > + * Note: Do not call this function directly; always use DC_FP_END().
> > + */
> > +void dc_fpu_end(const char *function_name, const int line)
> > +{
> > +	TRACE_DCN_FPU(false, function_name, line);
> > +	kernel_fpu_end();
> > +}
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> > new file mode 100644
> > index 000000000000..fb54983c5c60
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright 2021 Advanced Micro Devices, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + *
> > + * Authors: AMD
> > + *
> > + */
> > +
> > +#ifndef __DC_FPU_H__
> > +#define __DC_FPU_H__
> > +
> > +void dc_fpu_begin(const char *function_name, const int line);
> > +void dc_fpu_end(const char *function_name, const int line);
> > +
> > +#endif /* __DC_FPU_H__ */
> > diff --git a/drivers/gpu/drm/amd/display/dc/dc_trace.h b/drivers/gpu/drm/amd/display/dc/dc_trace.h
> > index d2615357269b..d598ba697e45 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dc_trace.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dc_trace.h
> > @@ -37,3 +37,6 @@
> >   #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
> >   	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
> > +
> > +#define TRACE_DCN_FPU(begin, function, line) \
> > +	trace_dcn_fpu(begin, function, line)
> > diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
> > index 126c2f3a4dd3..2ba49aef370d 100644
> > --- a/drivers/gpu/drm/amd/display/dc/os_types.h
> > +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
> > @@ -52,9 +52,9 @@
> >   #if defined(CONFIG_DRM_AMD_DC_DCN)
> >   #if defined(CONFIG_X86)
> > -#include <asm/fpu/api.h>
> > -#define DC_FP_START() kernel_fpu_begin()
> > -#define DC_FP_END() kernel_fpu_end()
> > +#include "amdgpu_dm/dc_fpu.h"
> > +#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
> > +#define DC_FP_END() dc_fpu_end(__func__, __LINE__)
> 
> This still has the issue that you don't correctly handle other architectures
> than x86.
> 
> I'm pretty sure the kernel bots will complain about that.

Hi Christian,

Kernel bots will not break because we are using CONFIG_DRM_AMD_DC_DCN to
isolate DCN architecture. Currently, we support DCN on x86 and PPC (idk
the details for ppc); in this series, I'm trying to enable us to start
to isolate FPU code to a single place. When we start to move the FPU
functions to a single place, we can take the opportunity to refactor the
FPU code. After we isolate the FPU source, we can safely start to enable
other architectures such as ARM.

This is why I did not try to enable it for other architecture yet. I
think this is the second step.

Thanks
Siqueira
 
> Regards,
> Christian.
> 
> >   #elif defined(CONFIG_PPC64)
> >   #include <asm/switch_to.h>
> >   #include <asm/cputable.h>
> 

-- 
Rodrigo Siqueira
https://siqueira.tech
