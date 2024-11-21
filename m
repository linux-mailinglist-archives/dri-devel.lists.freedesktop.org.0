Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EFC9D52A7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 19:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937FF10E150;
	Thu, 21 Nov 2024 18:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kieN113h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F75510E150;
 Thu, 21 Nov 2024 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732214485; x=1763750485;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sW5D4Hv1xrSqhH9dzhbrYChIaWNHfQQYE7KHHcNjtow=;
 b=kieN113hzlpf8SXLrwR5SLNP0TakaZ8C1EchPaxhsBghbaGD9KdB5O7L
 L6nRZYpLeZM4kwUFaD1ua9zYDMdqr7kLr9j+zb6qMUNZ5EtjlTQUmxaWs
 HF18VJ2tPCVykhQj2GOLC4AQHCtYZsXW7HOVUClSHF79m/ZJDNEGqxl/n
 O3IDvettxW2JPLzQ8fooQSmfb6UIaxfKWsLM9HJg09/lOOsC6uKvRsJtu
 WwgVKVygsZxm/+8b8ve38w0ZEotmqHDay8mKeyLVrePGs8YCWfsowK38Z
 LaG2nR/wh6IKmYARsLRVDmFnBNK2ETKt/XAClIkaZZpEKQVdkDcrj4fw6 A==;
X-CSE-ConnectionGUID: +bc8HlwhSQ+e/7/HHALjmg==
X-CSE-MsgGUID: NwEUV6AvRyeflMgfNqn5nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54856084"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="54856084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 10:41:24 -0800
X-CSE-ConnectionGUID: OMCDNxx/Sqqw4AmpW99BNA==
X-CSE-MsgGUID: GqgrRU9zS+WOUVgDZ5gFiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90720017"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 10:41:24 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 10:41:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 10:41:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 10:41:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGVgkN88M69Q2Wya98IWodTFEPmEGp3ItWZ3J+8enY4QYtaG3tEcFJ51kNGR0AD6BZhjzKlJWRfT1iRdQu8FMHzgiuN5gX4sIVwdHutaJv/sQZDxXyNuQOiFrC3WR0v9EQ4lrqiHKqp2n8WBWR6Eriuodz2E0SfvjIGUXD3gOV3dtokHDbQw4+FQnnBpRlG3281UvE0gqDHr9956y0iq/4uH6N5Ur0LAKmjKppcscQgJi3edBmUvw6Ggep9diqeBNzZcelS/5XUg/Zf8w9n9uW2DptXQBNA331+dC7lHv1e6NoxO54raYjo5nLmKEmUvigCtLPRl0L9gVjFLjrL7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wyR+cxXBHNogAkIdN8r1hNJ+tnU2EbRV5ZmmxhSjnw=;
 b=nh5lTs0clAj23ODcXIHe7nwmturIJjrvG1PpScoclfQHKqnRtcc8l3tSoPXqwID+6V690HJ3/V7LT6crDFlsNcpRpzavpRW/9wkayxwPoCwHhfQqyC3ELQMoqQS4NgHa+0F2726BWYBelAGHKE2enN2H8RR7pS5XTfoIBNRGfcVIbnLh+vYu/PdDMMpWNqxd7tyseHoEQhA9by7rY0yTa0Hy/yEoUv5sJCWhWtqWrBKAOHXS4jiSN+/McPh4YOT1ZCCHVyvafuZVvAo3G1ucq7EGd+Vt/WDAsvqag4Kryl48EAL5hjOsHzu3NifPQ7yBDb/uyrJO/EOgdSqX7shoWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6804.namprd11.prod.outlook.com (2603:10b6:510:1bc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Thu, 21 Nov
 2024 18:41:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 18:41:20 +0000
Date: Thu, 21 Nov 2024 10:41:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kenneth.w.graunke@intel.com>, <lionel.g.landwerlin@intel.com>,
 <jose.souza@intel.com>, <simona.vetter@ffwll.ch>,
 <thomas.hellstrom@linux.intel.com>, <boris.brezillon@collabora.com>,
 <airlied@gmail.com>, <mihail.atanassov@arm.com>, <steven.price@arm.com>,
 <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 01/29] dma-fence: Add dma_fence_preempt base class
Message-ID: <Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-2-matthew.brost@intel.com>
 <431e53fd-ab98-427c-a6ed-6c2907438952@amd.com>
 <Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com>
 <12cc3711-c097-46b8-9602-191d5c676e17@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12cc3711-c097-46b8-9602-191d5c676e17@amd.com>
X-ClientProxiedBy: MW4PR04CA0097.namprd04.prod.outlook.com
 (2603:10b6:303:83::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 8284c094-e23e-46ce-7d82-08dd0a5c175b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ncLfcDDHpQdu5NXbQFBz+9K0KJkKItKNG7OpepiAAje+VHffCzwu6e8XTr?=
 =?iso-8859-1?Q?sdYW1W/z1m99oQ7EzzRjD3tlS+fK5YM4Bp3Of7ZOQS8kdU457osaSefSFY?=
 =?iso-8859-1?Q?t2LHG2mcdyAP2yfjpcXZvUz6g4j1jbqPbAnaQvDx7Zj+gU2A/wKB7DvocB?=
 =?iso-8859-1?Q?ncP7iHJ8HnnufS8i6mxzT4dZgnp10tZ3X2TUWlqRHEDyoDsMxfxxl3jNtv?=
 =?iso-8859-1?Q?If4uy8FLjlbTogVtHlR/DJxAwYkSyYI6uxAytUb9w+S8ziicVEStR/Bx6Q?=
 =?iso-8859-1?Q?YFslFHmX3G8iTe/Y/Tb6VBgSZma/gE0V3g9orHLmWKHySxcOB0vwyRQcQI?=
 =?iso-8859-1?Q?4RlIW8k+WLm9eaXHT8BOXLDGvPtVHu9sDnkLjUmxtXZM7YpkMi1LBrts6u?=
 =?iso-8859-1?Q?+EEVm/mMDmTTW+x6uTz1+iWw4yTqeHPHjnNW3s95KjhuQqSwNaMrXOqm+N?=
 =?iso-8859-1?Q?Jw6F75rRZGAm14QmkAWFVAqpIDeeuRIZHGU4PD1gPGQh/ZLppcfrkyMekL?=
 =?iso-8859-1?Q?Js6AUnMdCATo8uRFYmDlVWw/drmkSk14I1OGGojAhwhBkC9p1/Jmd4Bj1t?=
 =?iso-8859-1?Q?tZ4WpAZ7mQYbaoHOq3euk9autL7aTfwgdgXfPfrIeSicwaKNW1FA4ddTJk?=
 =?iso-8859-1?Q?gVwaPsWsRlnnhIoAKLDIpQunKJG7D6GL1R8Yp1CHcX+IOKyxvDkCEZ9a1m?=
 =?iso-8859-1?Q?ezD/WkZ98MdB1qLH11j661mcRFCm8Z9PI/pohd6SYHPbRy7+uY0nDin+qq?=
 =?iso-8859-1?Q?RYwebEClnBgb1/rZLMKSJddvBz7an8TCm/nT4/0BuKPIN1MfTiKhxu0xZX?=
 =?iso-8859-1?Q?CBJicuv3pLS+E/0eAqKqHIoBQhCz6gyAo79EqBJgJSOt/Vjg6MKFofVrpu?=
 =?iso-8859-1?Q?4kJyov7qQlMFBOLKL6VHYIVPOcs7CtJMYsbVJWZ+XIkL1eRj9nswyIlGKc?=
 =?iso-8859-1?Q?DAbnoyfsx5D19F0zmfiKDj7Vorxrsc1tUCGEt0DaN0EL0/nZHBEx0/UlLl?=
 =?iso-8859-1?Q?qN/nYMpba+fCPzIzE6RrwTdHcRa8hAqF5lr/HVaq2QVoZLiDlGzGA/gKaS?=
 =?iso-8859-1?Q?dCb3y82n2EEYS/Bv0ZQCFgqKtd96XkHPbXAfXchyehfYjeFOQYSu5pCQhV?=
 =?iso-8859-1?Q?6n/1ozyaT3Q6JyDuP6lgJ7sfS7se60v4yEKnMqHZtGdURnzIV3BTpvfaxp?=
 =?iso-8859-1?Q?kJVj5DxD8JJHuWrEfheWbDVhXkAHkmkUufMwH7JnEavMFtFK/DfR8ST02M?=
 =?iso-8859-1?Q?Ghps5hFdz14DRiGSQ2k9/a4WlmkEHnCRyHf9Df9wOw8DfCKWaiYc1ovccG?=
 =?iso-8859-1?Q?6I06aA5xyekrjeAvplo+ViBFwhVyImfx7m2ez95w05x7YR2MVbxT1BLqYL?=
 =?iso-8859-1?Q?crJJHidZnp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CrXT5QJu6o/BWm3gwFPUNVSpcp8Ics4207vdxGwSAiRYU2ut2JhR431fZb?=
 =?iso-8859-1?Q?1sB1RAeqhmDVouveoIRBcqvhzuXdWBnnpR4ovZgcXGExYtua4bBxlM/vC7?=
 =?iso-8859-1?Q?a7BQgK9uV40q+4JFjIQlNgpoM918gSN4WyFCSdjOIWoKYNhJk+ahOhft/G?=
 =?iso-8859-1?Q?BYW0CP/o5uQqHd3LVZkryCorIOtSvglYAwxfZGL7Ufz7VUUjKTsl7lTYZI?=
 =?iso-8859-1?Q?mZtKdRQHkzph1abH/jBQc0OVxrIgyiZmdJdXSryXFTPDJL1Wmn65Vnff8M?=
 =?iso-8859-1?Q?Eyfqq9RXtuwdYHhhDMkrdzCQEtemerTDfx+1zjoRTYBiHRw18sUq6OrIik?=
 =?iso-8859-1?Q?y07u4bVhWpFHC/4EYBXwHPF9UtWZkpSd8Bp1QvOSP+NqJI1H5VTuIz8y5h?=
 =?iso-8859-1?Q?upXmpauzKPh1racmbi4B6R4i2i25M1JuJPu+uPD38wZA79pwlz45PBnuY6?=
 =?iso-8859-1?Q?baNGkYioHrxI7CH+uWeD0J5o3ohHjSAaSe2sLzt/MstaWdPfJP3pRsWpos?=
 =?iso-8859-1?Q?YcoznPh2nUDVP4PWEfPkJI2hHjluQyINCiuDsdH4aVyud6rzGXeqewt0RO?=
 =?iso-8859-1?Q?supEWAupvjHow5wrwrkjsvYAmMFTfuSVBnc+Nx80o5shcwt+G0iWDo+uP6?=
 =?iso-8859-1?Q?Fe++McwvwKjHSi0RZNb5LR0FLZMEdaiELoSorP4YDiSFo3g5//qqVlzkKA?=
 =?iso-8859-1?Q?VPwyfGP+Jd6tqMd3at5TCA3GtEf4c9+wA4K4L9ssaIIwqzGexb4/wfcj0w?=
 =?iso-8859-1?Q?ApZDFr47d4if/Q2meFIKtgDZcyzmeM12C04jwDjcFqM3v0IXQgKjIjq2oV?=
 =?iso-8859-1?Q?U8TUuW+dp5GUH8nQDAgN1K+MP5xSKQ5UDE69whts+N/oFKabQ1lLtBfiMZ?=
 =?iso-8859-1?Q?AIODoJr4s7JreWdUSjAtjwLqCFxKCN49CAw5BeB7MCFMX5ByBuB+HWTazt?=
 =?iso-8859-1?Q?qy3uku0w3uuD+RO4a297Pv6YmcpzKj1I9G7XYF/HT2qtHqpHna7UqAO8ej?=
 =?iso-8859-1?Q?hDS9Gk1xk31L0HEDJWTu70gwZwPkU19OE2xLGBYAIK9X0wXDZO5TwTIQnz?=
 =?iso-8859-1?Q?SukY0egiaN9ov+MpsorWf87mU8lobAGZglLZH3smvVuzjIeISElkX5XkqU?=
 =?iso-8859-1?Q?sDdlrfbwSprsEPoaStVgyYRLsW9XnexST8hNNobDdUaop5L5SklPz/nEsc?=
 =?iso-8859-1?Q?dXyyzWWlBENfKVqsh7T9CX8Y3z7vuIZSd4LwaUVHq7Hlbovrktn1wKiaj/?=
 =?iso-8859-1?Q?vr8NBOlzGxPx/y4YZhqG0oKySCFW6xJ8zgCM8OkZ+Qo1UrWzRmK7o+xyep?=
 =?iso-8859-1?Q?32VoQMaJ6D/6q1Aihl3bGAvqTdfgJrP3Ku49lqc3kCthQl9O3jerwZESAG?=
 =?iso-8859-1?Q?+KNrBUT1v3TazRmEVdd+/XTAOlPRM5NtI/wN+qJ8o78x9x9MtK7azxMjWa?=
 =?iso-8859-1?Q?lwnfd0X/DeZVt+Hd/urd5GG91wmveEJnWJfjgYNFUcRzLF2GMtlwGs3Ngu?=
 =?iso-8859-1?Q?zA0l1bkGhradYOccm3b9MuNwaCMzo8iZXkit55r33CqcNxfKVJVgXov+hB?=
 =?iso-8859-1?Q?Iq6nc4jagc/h1v2Ixn2K/VWhql4YNaWq9k4dWdtovULLCIlQBEET/246fo?=
 =?iso-8859-1?Q?A0YpDH2EA+sBreSDodQKlhVQsg3WASmEPKK5a78gYMzf6pIFBZxJLvzg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8284c094-e23e-46ce-7d82-08dd0a5c175b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:41:20.4129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqaCxqvX8GP18jziYibYstKL26GkVCQ2bZ4RSZQ6bZnAFXPlyaJNQbxJwL0q/IX5ROh3+HjPwFvrrWs//M+WLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6804
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 21, 2024 at 11:04:47AM +0100, Christian König wrote:
> Am 20.11.24 um 18:36 schrieb Matthew Brost:
> > On Wed, Nov 20, 2024 at 02:31:50PM +0100, Christian König wrote:
> > > Am 19.11.24 um 00:37 schrieb Matthew Brost:
> > > > Add a dma_fence_preempt base class with driver ops to implement
> > > > preemption, based on the existing Xe preemptive fence implementation.
> > > > 
> > > > Annotated to ensure correct driver usage.
> > > > 
> > > > Cc: Dave Airlie<airlied@redhat.com>
> > > > Cc: Simona Vetter<simona.vetter@ffwll.ch>
> > > > Cc: Christian Koenig<christian.koenig@amd.com>
> > > > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > > > ---
> > > >    drivers/dma-buf/Makefile            |   2 +-
> > > >    drivers/dma-buf/dma-fence-preempt.c | 133 ++++++++++++++++++++++++++++
> > > >    include/linux/dma-fence-preempt.h   |  56 ++++++++++++
> > > >    3 files changed, 190 insertions(+), 1 deletion(-)
> > > >    create mode 100644 drivers/dma-buf/dma-fence-preempt.c
> > > >    create mode 100644 include/linux/dma-fence-preempt.h
> > > > 
> > > > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > > > index 70ec901edf2c..c25500bb38b5 100644
> > > > --- a/drivers/dma-buf/Makefile
> > > > +++ b/drivers/dma-buf/Makefile
> > > > @@ -1,6 +1,6 @@
> > > >    # SPDX-License-Identifier: GPL-2.0-only
> > > >    obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> > > > -	 dma-fence-unwrap.o dma-resv.o
> > > > +	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
> > > >    obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
> > > >    obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
> > > >    obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> > > > diff --git a/drivers/dma-buf/dma-fence-preempt.c b/drivers/dma-buf/dma-fence-preempt.c
> > > > new file mode 100644
> > > > index 000000000000..6e6ce7ea7421
> > > > --- /dev/null
> > > > +++ b/drivers/dma-buf/dma-fence-preempt.c
> > > > @@ -0,0 +1,133 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <linux/dma-fence-preempt.h>
> > > > +#include <linux/dma-resv.h>
> > > > +
> > > > +static void dma_fence_preempt_work_func(struct work_struct *w)
> > > > +{
> > > > +	bool cookie = dma_fence_begin_signalling();
> > > > +	struct dma_fence_preempt *pfence =
> > > > +		container_of(w, typeof(*pfence), work);
> > > > +	const struct dma_fence_preempt_ops *ops = pfence->ops;
> > > > +	int err = pfence->base.error;
> > > > +
> > > > +	if (!err) {
> > > > +		err = ops->preempt_wait(pfence);
> > > > +		if (err)
> > > > +			dma_fence_set_error(&pfence->base, err);
> > > > +	}
> > > > +
> > > > +	dma_fence_signal(&pfence->base);
> > > > +	ops->preempt_finished(pfence);
> > > Why is that callback useful?
> > > 
> > In Xe, this is where we kick the resume worker and drop a ref to the
> > preemption object, which in Xe is an individual queue, and in AMD it is
> > a VM, right?
> 
> Correct. The whole VM is preempted since we don't know which queue is using
> which BO.
> 

Right. In Xe we don't know which queue is using a BO either - we trigger
all queues preempt fences attached to the VM effectively preempting the
entire VM. Per VM preempt fence or per queue preempt fence is a driver
choice (I can see arguments for both cases) is the point here and any
base class shouldn't dictate what a driver wants to do.

> > wrt preemption object, I've reasoned this should work for
> > an either per queue or VM driver design of preempt fences.
> > 
> > This part likely could be moved into the preempt_wait callback though
> > but would get a little goofy in the error case if preempt_wait is not
> > called as the driver side would still need to cleanup a ref. Maybe I
> > don't even need a ref though - have to think that through - but for
> > general safety we typically like to take refs whenever a fence
> > references a different object.
> 
> The tricky part is that at least for us we need to do this *before* the
> fence is signaled.

Hmm, I'm a little confused by this. Do you think the code as is missing
somehthing or opposed to keeping the preempt_finished vfunc?

> 
> This way we can do something like:
> 
> retry:
>     mutex_lock(&lock);
>     if (dma_fence_is_signaled(preemept_fence)) {
>         mutex_unlock(&lock);
>         flush_work(resume_work);
>         gotot retry;
>     }
>

This snippet is from your convert user fence to dma fence IOCTL? I think
this makes sense given your design of the conver user to dma fence IOCTL
not actually doing a resume - I landed making that IOCTL basically
another version of the resume worker for simplicity but that may change
if we find locking the entire VM is too costly.

> 
> To make sure that we have a valid and working VM before we publish the user
> fence anywhere and preempting the VM will wait for this user fence to
> complete.
> 

Agree the VM needs be in valid state befor publish a user fence as a dma
fence given a resume requires memory allocations thus breaking dma
fencing rules.

> > 
> > > > +
> > > > +	dma_fence_end_signalling(cookie);
> > > > +}
> > > > +
> > > > +static const char *
> > > > +dma_fence_preempt_get_driver_name(struct dma_fence *fence)
> > > > +{
> > > > +	return "dma_fence_preempt";
> > > > +}
> > > > +
> > > > +static const char *
> > > > +dma_fence_preempt_get_timeline_name(struct dma_fence *fence)
> > > > +{
> > > > +	return "ordered";
> > > > +}
> > > > +
> > > > +static void dma_fence_preempt_issue(struct dma_fence_preempt *pfence)
> > > > +{
> > > > +	int err;
> > > > +
> > > > +	err = pfence->ops->preempt(pfence);
> > > > +	if (err)
> > > > +		dma_fence_set_error(&pfence->base, err);
> > > > +
> > > > +	queue_work(pfence->wq, &pfence->work);
> > > > +}
> > > > +
> > > > +static void dma_fence_preempt_cb(struct dma_fence *fence,
> > > > +				 struct dma_fence_cb *cb)
> > > > +{
> > > > +	struct dma_fence_preempt *pfence =
> > > > +		container_of(cb, typeof(*pfence), cb);
> > > > +
> > > > +	dma_fence_preempt_issue(pfence);
> > > > +}
> > > > +
> > > > +static void dma_fence_preempt_delay(struct dma_fence_preempt *pfence)
> > > > +{
> > > > +	struct dma_fence *fence;
> > > > +	int err;
> > > > +
> > > > +	fence = pfence->ops->preempt_delay(pfence);
> > > Mhm, why is that useful?
> > > 
> > This for attaching the preempt object's last exported fence which needs
> > to be signaled before the preemption is issued. So for purely long
> > running VM's, this function could be NULL. For VM's with user queues +
> > dma fences, the driver returns the last fence from the convert user
> > fence to dma-fence IOCTL.
> > 
> > I realized my kernel doc doesn't explain this as well as it should, I
> > have already made this more verbose locally and hopefully it clearly
> > explains all of this.
> 
> That part was actually obvious. But I would expected that to be push
> interface instead of a pull interface.
> 
> E.g. the preemption fence would also provide something like a manager object
> which has a mutex, the last exported user fence and the necessary
> functionality to update this user fence.
> 

Hmm, I rather like the pull interface. In Xe this is dma-fence chain
attached to the VM. It safe pull given our covert IOCTL takes the VM's
dma-resv locks / notifier locks before publishing the user fence.

In your design couldn't you use spin lock in the last step of publishing
a user fence which checks for sw signaling on the preempt fence, if it
enabled restart the IOCTL waiting the resume worker? Then in this vfunc
pull the fence under the spin lock?

Not opposed to a push interface though if you really think this the way
to go. Quite certain I could make that work for Xe too.

> The tricky part is really to get this dance right between signaling the
> preemption fence and not allowing installing a new user fence before the
> resume worker has re-created the VM.
> 

Yes, indeed this is tricky.

> > > > +	if (WARN_ON_ONCE(!fence || IS_ERR(fence)))
> > > > +		return;
> > > > +
> > > > +	err = dma_fence_add_callback(fence, &pfence->cb, dma_fence_preempt_cb);
> > > You are running into the exactly same bug we had :)
> > > 
> > > The problem here is that you can't call dma_fence_add_callback() from the
> > > enable_signaling callback. Background is that the
> > > fence_ops->enable_signaling callback is called with the spinlock of the
> > > preemption fence held.
> > > 
> > > This spinlock can be the same as the one of the user fence, but it could
> > > also be a different one. Either way calling dma_fence_add_callback() would
> > > let lockdep print a nice warning.
> > > 
> > Hmm, I see the problem if you share a lock between the preempt fence and
> > last exported fence but as long as these locks are seperate I don't see
> > the issue.
> > 
> > The locking order then is:
> > 
> > preempt fence lock -> last exported fence lock.
> 
> You would need to annotate that as nested lock for lockdep and the dma_fence
> framework currently doesn't allow that.
> 

This definitely works as is - I've tested this. If dma-fence's lock was
embedded within the dma-fence, then ofc lockdep would complain without
nesting. It isn't though - the spin lock is passed in as argument so
lockdep can identify the locks for 'preempt fence lock' and 'last
exported fence' as independent locks.

> > Lockdep does not explode in Xe but maybe can buy this is a little
> > unsafe. We could always move preempt_delay to the worker, attach a CB,
> > and rekick the worker upon the last fence signaling if you think that is
> > safer. Of course we could always just directly wait on the returned last
> > fence in the worker too.
> 
> Yeah I that is basically what we do at the moment since you also need to
> make sure that no new user fence is installed while you wait for the latest
> to signal.
> 

After I typed this realized waiting on 'last fence' in the worker is a no
go given we want to pipeline preemptions in Xe (e.g. issue all queues
preemption commands to firmware in parallel as these are async
operations which may be fast in cases and slow in others). I think
having preempt vfunc done directly in a dma-fence CB is a must.

Matt

> Regards,
> Christian.
> 
> > 
> > > I tried to solve this by changing the dma_fence code to not call
> > > enable_signaling with the lock held, we wanted to do that anyway to prevent
> > > a bunch of issues with driver unload. But I realized that getting this
> > > upstream would take to long.
> > > 
> > > Long story short we moved handling the user fence into the work item.
> > > 
> > I did run into an issue when trying to make preempt_wait after return a
> > fence + attach a CB, and signal this preempt fence from the CB. I got
> > locking inversions almost worked through them but eventually gave up and
> > stuck with the worker.
> > 
> > Matt
> > 
> > > Apart from that looks rather solid to me.
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > +	if (err == -ENOENT)
> > > > +		dma_fence_preempt_issue(pfence);
> > > > +}
> > > > +
> > > > +static bool dma_fence_preempt_enable_signaling(struct dma_fence *fence)
> > > > +{
> > > > +	struct dma_fence_preempt *pfence =
> > > > +		container_of(fence, typeof(*pfence), base);
> > > > +
> > > > +	if (pfence->ops->preempt_delay)
> > > > +		dma_fence_preempt_delay(pfence);
> > > > +	else
> > > > +		dma_fence_preempt_issue(pfence);
> > > > +
> > > > +	return true;
> > > > +}
> > > > +
> > > > +static const struct dma_fence_ops preempt_fence_ops = {
> > > > +	.get_driver_name = dma_fence_preempt_get_driver_name,
> > > > +	.get_timeline_name = dma_fence_preempt_get_timeline_name,
> > > > +	.enable_signaling = dma_fence_preempt_enable_signaling,
> > > > +};
> > > > +
> > > > +/**
> > > > + * dma_fence_is_preempt() - Is preempt fence
> > > > + *
> > > > + * @fence: Preempt fence
> > > > + *
> > > > + * Return: True if preempt fence, False otherwise
> > > > + */
> > > > +bool dma_fence_is_preempt(const struct dma_fence *fence)
> > > > +{
> > > > +	return fence->ops == &preempt_fence_ops;
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_is_preempt);
> > > > +
> > > > +/**
> > > > + * dma_fence_preempt_init() - Initial preempt fence
> > > > + *
> > > > + * @fence: Preempt fence
> > > > + * @ops: Preempt fence operations
> > > > + * @wq: Work queue for preempt wait, should have WQ_MEM_RECLAIM set
> > > > + * @context: Fence context
> > > > + * @seqno: Fence seqence number
> > > > + */
> > > > +void dma_fence_preempt_init(struct dma_fence_preempt *fence,
> > > > +			    const struct dma_fence_preempt_ops *ops,
> > > > +			    struct workqueue_struct *wq,
> > > > +			    u64 context, u64 seqno)
> > > > +{
> > > > +	/*
> > > > +	 * XXX: We really want to check wq for WQ_MEM_RECLAIM here but
> > > > +	 * workqueue_struct is private.
> > > > +	 */
> > > > +
> > > > +	fence->ops = ops;
> > > > +	fence->wq = wq;
> > > > +	INIT_WORK(&fence->work, dma_fence_preempt_work_func);
> > > > +	spin_lock_init(&fence->lock);
> > > > +	dma_fence_init(&fence->base, &preempt_fence_ops,
> > > > +		       &fence->lock, context, seqno);
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_preempt_init);
> > > > diff --git a/include/linux/dma-fence-preempt.h b/include/linux/dma-fence-preempt.h
> > > > new file mode 100644
> > > > index 000000000000..28d803f89527
> > > > --- /dev/null
> > > > +++ b/include/linux/dma-fence-preempt.h
> > > > @@ -0,0 +1,56 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef __LINUX_DMA_FENCE_PREEMPT_H
> > > > +#define __LINUX_DMA_FENCE_PREEMPT_H
> > > > +
> > > > +#include <linux/dma-fence.h>
> > > > +#include <linux/workqueue.h>
> > > > +
> > > > +struct dma_fence_preempt;
> > > > +struct dma_resv;
> > > > +
> > > > +/**
> > > > + * struct dma_fence_preempt_ops - Preempt fence operations
> > > > + *
> > > > + * These functions should be implemented in the driver side.
> > > > + */
> > > > +struct dma_fence_preempt_ops {
> > > > +	/** @preempt_delay: Preempt execution with a delay */
> > > > +	struct dma_fence *(*preempt_delay)(struct dma_fence_preempt *fence);
> > > > +	/** @preempt: Preempt execution */
> > > > +	int (*preempt)(struct dma_fence_preempt *fence);
> > > > +	/** @preempt_wait: Wait for preempt of execution to complete */
> > > > +	int (*preempt_wait)(struct dma_fence_preempt *fence);
> > > > +	/** @preempt_finished: Signal that the preempt has finished */
> > > > +	void (*preempt_finished)(struct dma_fence_preempt *fence);
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct dma_fence_preempt - Embedded preempt fence base class
> > > > + */
> > > > +struct dma_fence_preempt {
> > > > +	/** @base: Fence base class */
> > > > +	struct dma_fence base;
> > > > +	/** @lock: Spinlock for fence handling */
> > > > +	spinlock_t lock;
> > > > +	/** @cb: Callback preempt delay */
> > > > +	struct dma_fence_cb cb;
> > > > +	/** @ops: Preempt fence operation */
> > > > +	const struct dma_fence_preempt_ops *ops;
> > > > +	/** @wq: Work queue for preempt wait */
> > > > +	struct workqueue_struct *wq;
> > > > +	/** @work: Work struct for preempt wait */
> > > > +	struct work_struct work;
> > > > +};
> > > > +
> > > > +bool dma_fence_is_preempt(const struct dma_fence *fence);
> > > > +
> > > > +void dma_fence_preempt_init(struct dma_fence_preempt *fence,
> > > > +			    const struct dma_fence_preempt_ops *ops,
> > > > +			    struct workqueue_struct *wq,
> > > > +			    u64 context, u64 seqno);
> > > > +
> > > > +#endif
