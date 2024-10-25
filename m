Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D9D9AF633
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 02:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF90210E9C0;
	Fri, 25 Oct 2024 00:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aa8qRIeK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6689110E370;
 Fri, 25 Oct 2024 00:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729816332; x=1761352332;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aFhyryxCwPhLpjpy/sy7aq31fC01av7PsWp0KY/gpGU=;
 b=aa8qRIeKUe069JLPuiTS5noiK1ZlIXj64AhPD7DbywLACziy2lVGL8aJ
 MKaf4oUG6yctgLh4+7eWfyOnyYWqI2paGf7Wpi0GUUzaMw6ZAfDFp+Y93
 EzluiXiN15gBIHj3FgiAzU32wyJs4m+wkOi+2wxyekMB4UETh5mk1tc5d
 lj4/jQ9Chkp52fq/aZsRtwa5b0LJ+4wmXxYTzoO/Fj/qdAcVrwdU0TBOT
 /Glv4CrIvY0FaOiwob1MKgHJbTlUdBFj02LXNT0sbbFOn7MCxMO8InzoF
 75Rnl8CcBgEgC1qAuggpU3+G4/vP0/qZBMspX8dRVBJP8m1wwFNdiItPh g==;
X-CSE-ConnectionGUID: 265OljEgQpmRx0zkmvtQpQ==
X-CSE-MsgGUID: XIHeti5DTdur4endjyNxCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29376732"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="29376732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 17:32:12 -0700
X-CSE-ConnectionGUID: lSO+lqGCRQO14Bh+ZscBHA==
X-CSE-MsgGUID: GOGtfHcwTf67rJoslFxTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="85860070"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 17:32:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 17:32:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 17:32:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 17:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLreLcCqfeHvopauQYDKb6pc3h5Pfc0+U8CmQM9LxGNc7Hz8uBHUbQz7Ma5y+th8VAxcMiEtpK0l/ZFoOywkhG+zYVdEOIvh01Ze+K2deoB4SC9s+fp/TkszodCmCUsQjeWn4OY2nz+BmW3+vKstVwJdO1t4CQsO33I1xxBT0B2zY9YGMV+f4p0Hd4oFAnYa9Yh1yTn8eu8fCG22dDEH2xQXib0RpuM39BVYnyDQHQHFfdBWO/FKtcKRkQfEH7qssv0Ba0XX1/N/ljPCVYyBkdZ4QiNS7DkEgBndbE5XSE3dibRa7kBXgqGQLyIb2Jomfy4P5R9Re8JFyE3Dr9+abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKu+owqTxlq2jK1u45oWeaW4I0QYV35U89oicy3OrCs=;
 b=eSy1mLTbBZAtWqjWQKbUrmbPKb9JO350C8DrMBWmrNnGcjwO+PBgMbLooNm8esS3DAfCNi2sMfq51mo5ucj4oQ4EAIXknCDc7hDsOl75GLXqlv/+TqM9tNnb/zklczIe0s0ovD18zarycFi503Qc0P0VocWiJTYVxPlbhFatBw87VcxjKS0l+KBHzBC6iRcKD7v+3R+ONd3+UIDG1IscX60+ypmm31XdTODAx59+ctHKjF8FW5ZFpBPVQ14DaEnTrLNGwOQef4rwEjJ/0j9aVMZfCuSB/pTLgHge4Z4FHRsKNdy0zPUOptAlj5mbhYHe56hcUJrG3paGX7N+Z6getA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 00:32:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 00:32:09 +0000
Date: Fri, 25 Oct 2024 00:31:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 03/29] mm/migrate: Trylock device page in do_swap_page
Message-ID: <Zxrm8vcszpit/ZNK@DUT025-TGLU.fm.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-4-matthew.brost@intel.com>
 <87sesw8ziu.fsf@nvdebian.thelocal>
 <Zw9EBRHCZkLvXmZs@DUT025-TGLU.fm.intel.com>
 <87cyjzo5pt.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyjzo5pt.fsf@nvdebian.thelocal>
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd84b58-2294-417a-c135-08dcf48c7609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+LOUBDT5LjMDtTHoHGJTfyNQ7trSIrNnH1HRru39Hj2wxdBApp2hoGQIGB?=
 =?iso-8859-1?Q?U4ILJElWJyH5ix/+wKYjUABTM08gh9qAnla5ZGGKZnUTX/s1g810HOh7hF?=
 =?iso-8859-1?Q?ggAXnlZDaVE9vyyp9L0gQVs2SCi6brfjIEwBxLtR/7PvSCmEOhjCv4oOyA?=
 =?iso-8859-1?Q?Z3Am1XUMj/o2FBCW/XsrVkdc6m/MIbA4lJJGKsmml2Sv1OUADa0ycyXj+a?=
 =?iso-8859-1?Q?I/1YF7DaQie7ot2R6kZYqdDpTZ4HhPsBpQ+6fpe8is4Uft2XlSKuGH78P5?=
 =?iso-8859-1?Q?ZB7po4m0e/rCXhRGBndiKDLb9DaJgswOdvCRyrnyI1Ch5stWIPUvfnfvQa?=
 =?iso-8859-1?Q?3pS27KMcX2N21/phJaZwb97mNhlN5KoyjTzhB/ZDw1EXKh7Dcoy+VtPYor?=
 =?iso-8859-1?Q?0uMSDc2FptPHZXri02BNbKE5sJ5UYFig9RNYCVJDpf7fWg9mTlUjEVUYKG?=
 =?iso-8859-1?Q?/QHm7aPOkR4fJO2Pv4qEWFU7Qvlpwi5Elvsi5O5jJcHdJ77Xwzm0/HGgzF?=
 =?iso-8859-1?Q?gSuy0YZU4x0QiedOwvKPmtm6So7Q2mn7j5wNheNY0Tm41EXzMMt96Ge9mn?=
 =?iso-8859-1?Q?AuhczzuzQKOuj3Y/okSIl9y+1cwRZGy89DGqoDAqVPyzkdZPj+bAfjXkCd?=
 =?iso-8859-1?Q?mQRdg8qOt4whneOpRyS1eZ4xIUloKWtC84+ILJhZK81atYYzYFsdrj24WE?=
 =?iso-8859-1?Q?2wPA7KA6ARo02UYwCqbbmW4ym0FjdRJbaST0/H0KRyhG5a/qIesClqUjPo?=
 =?iso-8859-1?Q?AgdqPo6QaLf71tO+Uoridjb5C0wgRsBswwWl0kjgGvJoEwDry8uOXv54mk?=
 =?iso-8859-1?Q?WOw96FGHy0qejLLdPWwP4sITL82CdH1lExjHLfdz2C6nEMamqcj7Se7OXE?=
 =?iso-8859-1?Q?5E6nlyshdOgx4s+v77Tt3aurxTfRGfiFUkV6u+GH/6lh9MEoYEU8u6GCRV?=
 =?iso-8859-1?Q?OnY0cPpGoi/OX1i5YFfDEnBJ/rRIyLRMpY0d04ZQ16kO23qwOaQgxJWVF0?=
 =?iso-8859-1?Q?N8n2AJhAVlfZwbDsAo+XB0W64DrWIrnBznBGzrO6rZrleuZX3oTQoljDoD?=
 =?iso-8859-1?Q?6r97R9dWG9N6Sdylvm9juT4U8goeHqf6/l51qu/J5LTQmpOx0K/H9sQNUr?=
 =?iso-8859-1?Q?1v+71Ar/Tr1+HfF8ZxUrlz7CWyz3wIfwi6be1Rlgvo0/WUVmIkkAgybhbV?=
 =?iso-8859-1?Q?6YKvEEHUJWtVzP03m/tX9rX/FzfvER1tlLZ7QGy01VJLgfgYSeOFy7Wpy1?=
 =?iso-8859-1?Q?NO7TZI5Fleco9OSfqd7w/Ejfe6sh4NCk6dA9xzqk0rSl2q5hConvIOJdTb?=
 =?iso-8859-1?Q?ib+h77IoQqoB+K3FHxZP8KtzmDHlUdS9x9ZXbXPHK9oRy8jUVfHOfmhVoZ?=
 =?iso-8859-1?Q?sPVn/yzmIR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nX/EjyAbv1nWBER0XMqgpV3AwfNFHFHbuWbpcO4jSdyqA7pN/ILZkhRIa1?=
 =?iso-8859-1?Q?63ze8xvl3uZnQLRCJLV5M/ynNrvqxurZ8Q7t2slgZJ/KzFreR5AtPuno26?=
 =?iso-8859-1?Q?VGuiPXs+gMlpHkRGnWosr8+BRLgCXHBpNCu0ggwm8sYmw1jliJHjUG7PLi?=
 =?iso-8859-1?Q?lJWkaaDIXtnCeEAbq5rUfcUsikpS/5gvh6OV5ocpiYQlLeznh7xvhz3aR+?=
 =?iso-8859-1?Q?tjI8gJr/otZeeNoZUGk+7k7UnAJdIH7o5HHOEWKiA/4qxQ0A4KCUEP7lVX?=
 =?iso-8859-1?Q?HM5r5NvU5SPPUTEnGgsarGhKaLwazHWKHEhk8LlS6gRSVTp2WEtPXphVuW?=
 =?iso-8859-1?Q?10t62UtfWOqQT0KoUzTF+dCoM2ExX2r4Vt0zOsUH08TJ/R6l9vtkjhbMDD?=
 =?iso-8859-1?Q?1JNbUOCwNqUe4qFDfNqrjW80P7s9KjFA4ReFulq683DkrpLTGuH3Zxnm3k?=
 =?iso-8859-1?Q?YCF341Jr/Wh31B2aWu3zoJbJeL7+Fk9NZ7y8eDha7moweT1hxrKGW/pq1I?=
 =?iso-8859-1?Q?KTDs2oXC4mVdkYag0ObWcbBDpI4yZwmAx5Mgqy9cIkISBcV2aGfpjfWAHO?=
 =?iso-8859-1?Q?jYx85krOKMdPt8Ny1hTj0E8G7u4iAiHQ/S//NVC08Jk9yuVug721V2H/3J?=
 =?iso-8859-1?Q?mXlHicFjX5wvktlvh3Wm53b5m1eFv2xaPxEbViMJ+tj0K9RXALtjZVqjEk?=
 =?iso-8859-1?Q?tCnBuGrkJuZKGxDfSnOUfjv4h/frSfjgass0nyz7pl4bAEIUQhGq0z9jHg?=
 =?iso-8859-1?Q?dzK9SkWzXjct8XJzGvvfLhcPCSvGKIaTv6zZ2Iwz0AtE8iD4vnRl1K/gcW?=
 =?iso-8859-1?Q?aHF2a/sAQt7730m1J8k6C4ugBcqQnJ+1LhwW233/yCi6Rt3YO5uZ8/otVd?=
 =?iso-8859-1?Q?JUo+5xLgWtubR6A6COG9aOyZCGE/rl3UD5n9dq3Q/ZhC+e45IzmuILzUU8?=
 =?iso-8859-1?Q?JtYnIKuW6VXEySqZv54VFsovr0/S9eHIfo76v8iBeKvXNJARlWqVrraX9m?=
 =?iso-8859-1?Q?EXg4vzlvv2DkaImnytr0rV5AHTiEdR4siwKPKjxUnupbl2zZmkOueEDTnd?=
 =?iso-8859-1?Q?jEH12pTYdCqRr9EZMbLKakz9x+9UzAkXJSgAg/Iu5tG5owyOZCdT0ANKGd?=
 =?iso-8859-1?Q?u3Ef3gdMRwqxFl/hxlDk8EJSAVaRCYpgvvJ4ro0DMeTT+jnapjDN8o/rXV?=
 =?iso-8859-1?Q?aY+fXnJMAwIe9Pb3KXCJiQ7efHYYhWCH6naosQHZvJ+2HWfOUw1gQaxwZ2?=
 =?iso-8859-1?Q?CVQrZ8jrWPYtxAHflMP7eqSlZqFLwTZXX5CqNLP2RUbmbVHv8jYpQZGufv?=
 =?iso-8859-1?Q?cGBrOfTWp6d2f3nLxk8P+U7Sq1GCDNf0TTZkAJpOjXwNdA4EsIAqSiwpjN?=
 =?iso-8859-1?Q?spVPDnQl5hLhumOectiFJ3IYPfptlbhE3cQidlN0Ys15MNpLNrKMq6XWys?=
 =?iso-8859-1?Q?4EoE79hxskwllqW5lrdsGXT1m9FcHBJUIvhBireiVaIASbGjlmup3JktpB?=
 =?iso-8859-1?Q?P+rWPU5DsoHK4gdVW+GuqCBp6ax4xiB8rMUymWkVpviOAEmwo4ylwLSUiM?=
 =?iso-8859-1?Q?rvO01h5Wj82/5c4ynPBLfulGJClZEWmQKJ/Qok58u1v22UYNNejlWCViCL?=
 =?iso-8859-1?Q?pAWetZERKbaDHqP3zKAEjSpixjW75YJiuP57SK/FuQQzkfLcN+5Gnirw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd84b58-2294-417a-c135-08dcf48c7609
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 00:32:09.4340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3eWILhPRMuI5873GjYF7aS3/A/C7W7WnnpH+K1lSNje88r7GyzaK4tH698YbisXqtHZpLJzdo/kJd3XY+EyhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
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

On Thu, Oct 17, 2024 at 12:51:08PM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Wed, Oct 16, 2024 at 03:00:08PM +1100, Alistair Popple wrote:
> >> 
> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> 
> >> > Avoid multiple CPU page faults to the same device page racing by trying
> >> > to lock the page in do_swap_page before taking an extra reference to the
> >> > page. This prevents scenarios where multiple CPU page faults each take
> >> > an extra reference to a device page, which could abort migration in
> >> > folio_migrate_mapping. With the device page being locked in
> >> > do_swap_page, the migrate_vma_* functions need to be updated to avoid
> >> > locking the fault_page argument.
> >> >
> >> > Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> >> > DRM driver) SVM implementation if enough threads faulted the same device
> >> > page.
> >> >
> >> > Cc: Philip Yang <Philip.Yang@amd.com>
> >> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> >> > Cc: Christian König <christian.koenig@amd.com>
> >> > Cc: Andrew Morton <akpm@linux-foundation.org>
> >> > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> >> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> > ---
> >> >  mm/memory.c         | 13 ++++++---
> >> >  mm/migrate_device.c | 69 ++++++++++++++++++++++++++++++---------------
> >> >  2 files changed, 56 insertions(+), 26 deletions(-)
> >> >
> >> > diff --git a/mm/memory.c b/mm/memory.c
> >> > index 2366578015ad..b72bde782611 100644
> >> > --- a/mm/memory.c
> >> > +++ b/mm/memory.c
> >> > @@ -4252,10 +4252,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >> >  			 * Get a page reference while we know the page can't be
> >> >  			 * freed.
> >> >  			 */
> >> > -			get_page(vmf->page);
> >> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> >> > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> >> > -			put_page(vmf->page);
> >> > +			if (trylock_page(vmf->page)) {
> >> > +				get_page(vmf->page);
> >> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> >> > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> >> > +				put_page(vmf->page);
> >> > +				unlock_page(vmf->page);
> >> 
> >> I don't think my previous review of this change has really been
> >> addressed. Why don't we just install the migration entry here? Seems
> >> like it would be a much simpler way of solving this.
> >> 
> >
> > I should have mentioned this in the cover-letter, I haven't got around
> > to trying that out yet. Included this existing version for correctness
> > but I also think this is not strickly required to merge this series as
> > our locking in migrate_to_ram only relies on the core MM locks so
> > some thread would eventually win the race and make forward progress.
> >
> > So I guess just ignore this patch and will send an updated version
> > individually with installing a migration entry in do_swap_page. If for
> > some reason that doesn't work, I'll respond here explaining why.
> 
> That would be great. I have a fairly strong preference for doing that
> instead of adding more special cases for the fault page in the migration
> code. And if we can't do that it would be good to understand
> why. Thanks.
> 

I've looked into this and actually prefer the approach in this patch.

Consider the scenario where we install a migration entry, but
migrate_to_ram fails. How do we handle this?

We don't know where migrate_to_ram failed. Was migrate_device_finalize
called, removing the migration PTE? Do we need to special-case failures
in migrate_to_ram to prevent migrate_device_finalize from removing the
faulting page's migration entry? Should we check for a migration entry
after migrate_to_ram and remove it if it exists?

Now, if migrate_to_ram succeeds, it seems the migration entry should be
removed in migrate_device_finalize since the new page is only available
there. We could return the new page in migrate_to_ram, but that feels
messy.

Additionally, the page lock needs to be held across migrate_to_ram, as
this patch does, so we'll require some special handling in
migrate_device_finalize to avoid unlocking the faulting page.

Finally, installing a migration entry is non-trivial, while taking a
page reference under a lock is straightforward.

Given all this, I prefer to keep this patch as it is.

Matt

>  - Alistair
> 
> > Matt
> >
> >> > +			} else {
> >> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> >> > +			}
> >> >  		} else if (is_hwpoison_entry(entry)) {
> >> >  			ret = VM_FAULT_HWPOISON;
> >> >  		} else if (is_pte_marker_entry(entry)) {
> >> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> >> > index f163c2131022..2477d39f57be 100644
> >> > --- a/mm/migrate_device.c
> >> > +++ b/mm/migrate_device.c
> >> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >  				   struct mm_walk *walk)
> >> >  {
> >> >  	struct migrate_vma *migrate = walk->private;
> >> > +	struct folio *fault_folio = migrate->fault_page ?
> >> > +		page_folio(migrate->fault_page) : NULL;
> >> >  	struct vm_area_struct *vma = walk->vma;
> >> >  	struct mm_struct *mm = vma->vm_mm;
> >> >  	unsigned long addr = start, unmapped = 0;
> >> > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >  
> >> >  			folio_get(folio);
> >> >  			spin_unlock(ptl);
> >> > -			if (unlikely(!folio_trylock(folio)))
> >> > +			if (unlikely(fault_folio != folio &&
> >> > +				     !folio_trylock(folio)))
> >> >  				return migrate_vma_collect_skip(start, end,
> >> >  								walk);
> >> >  			ret = split_folio(folio);
> >> > -			folio_unlock(folio);
> >> > +			if (fault_folio != folio)
> >> > +				folio_unlock(folio);
> >> >  			folio_put(folio);
> >> >  			if (ret)
> >> >  				return migrate_vma_collect_skip(start, end,
> >> > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >  		 * optimisation to avoid walking the rmap later with
> >> >  		 * try_to_migrate().
> >> >  		 */
> >> > -		if (folio_trylock(folio)) {
> >> > +		if (fault_folio == folio || folio_trylock(folio)) {
> >> >  			bool anon_exclusive;
> >> >  			pte_t swp_pte;
> >> >  
> >> > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >  
> >> >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
> >> >  					set_pte_at(mm, addr, ptep, pte);
> >> > -					folio_unlock(folio);
> >> > +					if (fault_folio != folio)
> >> > +						folio_unlock(folio);
> >> >  					folio_put(folio);
> >> >  					mpfn = 0;
> >> >  					goto next;
> >> > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >> >  					  unsigned long npages,
> >> >  					  struct page *fault_page)
> >> >  {
> >> > +	struct folio *fault_folio = fault_page ?
> >> > +		page_folio(fault_page) : NULL;
> >> >  	unsigned long i, restore = 0;
> >> >  	bool allow_drain = true;
> >> >  	unsigned long unmapped = 0;
> >> > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >> >  		remove_migration_ptes(folio, folio, 0);
> >> >  
> >> >  		src_pfns[i] = 0;
> >> > -		folio_unlock(folio);
> >> > +		if (fault_folio != folio)
> >> > +			folio_unlock(folio);
> >> >  		folio_put(folio);
> >> >  		restore--;
> >> >  	}
> >> > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> >> >  		return -EINVAL;
> >> >  	if (args->fault_page && !is_device_private_page(args->fault_page))
> >> >  		return -EINVAL;
> >> > +	if (args->fault_page && !PageLocked(args->fault_page))
> >> > +		return -EINVAL;
> >> >  
> >> >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> >> >  	args->cpages = 0;
> >> > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> >> >  }
> >> >  EXPORT_SYMBOL(migrate_vma_pages);
> >> >  
> >> > -/*
> >> > - * migrate_device_finalize() - complete page migration
> >> > - * @src_pfns: src_pfns returned from migrate_device_range()
> >> > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> >> > - * @npages: number of pages in the range
> >> > - *
> >> > - * Completes migration of the page by removing special migration entries.
> >> > - * Drivers must ensure copying of page data is complete and visible to the CPU
> >> > - * before calling this.
> >> > - */
> >> > -void migrate_device_finalize(unsigned long *src_pfns,
> >> > -			unsigned long *dst_pfns, unsigned long npages)
> >> > +static void __migrate_device_finalize(unsigned long *src_pfns,
> >> > +				      unsigned long *dst_pfns,
> >> > +				      unsigned long npages,
> >> > +				      struct page *fault_page)
> >> >  {
> >> > +	struct folio *fault_folio = fault_page ?
> >> > +		page_folio(fault_page) : NULL;
> >> >  	unsigned long i;
> >> >  
> >> >  	for (i = 0; i < npages; i++) {
> >> > @@ -824,7 +828,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >> >  
> >> >  		if (!page) {
> >> >  			if (dst) {
> >> > -				folio_unlock(dst);
> >> > +				if (fault_folio != dst)
> >> > +					folio_unlock(dst);
> >> >  				folio_put(dst);
> >> >  			}
> >> >  			continue;
> >> > @@ -834,14 +839,16 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >> >  
> >> >  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
> >> >  			if (dst) {
> >> > -				folio_unlock(dst);
> >> > +				if (fault_folio != dst)
> >> > +					folio_unlock(dst);
> >> >  				folio_put(dst);
> >> >  			}
> >> >  			dst = src;
> >> >  		}
> >> >  
> >> >  		remove_migration_ptes(src, dst, 0);
> >> > -		folio_unlock(src);
> >> > +		if (fault_folio != src)
> >> > +			folio_unlock(src);
> >> >  
> >> >  		if (folio_is_zone_device(src))
> >> >  			folio_put(src);
> >> > @@ -849,7 +856,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >> >  			folio_putback_lru(src);
> >> >  
> >> >  		if (dst != src) {
> >> > -			folio_unlock(dst);
> >> > +			if (fault_folio != dst)
> >> > +				folio_unlock(dst);
> >> >  			if (folio_is_zone_device(dst))
> >> >  				folio_put(dst);
> >> >  			else
> >> > @@ -857,6 +865,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >> >  		}
> >> >  	}
> >> >  }
> >> > +
> >> > +/*
> >> > + * migrate_device_finalize() - complete page migration
> >> > + * @src_pfns: src_pfns returned from migrate_device_range()
> >> > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> >> > + * @npages: number of pages in the range
> >> > + *
> >> > + * Completes migration of the page by removing special migration entries.
> >> > + * Drivers must ensure copying of page data is complete and visible to the CPU
> >> > + * before calling this.
> >> > + */
> >> > +void migrate_device_finalize(unsigned long *src_pfns,
> >> > +			unsigned long *dst_pfns, unsigned long npages)
> >> > +{
> >> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> >> > +}
> >> >  EXPORT_SYMBOL(migrate_device_finalize);
> >> >  
> >> >  /**
> >> > @@ -872,7 +896,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> >> >   */
> >> >  void migrate_vma_finalize(struct migrate_vma *migrate)
> >> >  {
> >> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> >> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> >> > +				  migrate->fault_page);
> >> >  }
> >> >  EXPORT_SYMBOL(migrate_vma_finalize);
> >> 
> 
