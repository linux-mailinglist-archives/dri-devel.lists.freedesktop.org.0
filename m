Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6109D30D2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 00:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7D310E0D3;
	Tue, 19 Nov 2024 23:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnpBoVhJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1C010E0D3;
 Tue, 19 Nov 2024 23:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732057680; x=1763593680;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FsfBD3ORJZez2C4SE7nn/yqsgG5GYn49aKqJ3Oxi4fc=;
 b=hnpBoVhJQ++fHJXzI60sR4IfqcV+aPUVC+Utl88kgqX9WMKgjcc2OE0F
 CYJ29Sesn2F3LmTpSSqNhiMbIWSp+R3nt/KY606u/qgDkJmJUFxIB7qPf
 3QGsn5keHe4EDHPnb7vhmzbheYlaIzHYUmo4E/d6rgcdv1a6SEbuulPeL
 LeuNbfjTYWJdfqvBcsgeW1HzvxD0bk593+LIIYq2E+/Avb6eF0+QzJjut
 qnOq0Frd9DTJeR0+m3a6s5IY/LbjqrzWGZX/NNZfo9qUxzFBVRmS3Ykeq
 lZAxPjD9oGYPIhpoDo0B5nJXRKwynfp5thsgsZ2Qz7R5oeGcgp1Ed7PB7 w==;
X-CSE-ConnectionGUID: M8+XJ6tpROundISRcOUhxw==
X-CSE-MsgGUID: kV67IXfiSJ2j7kgUU/KlUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32338155"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="32338155"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 15:07:59 -0800
X-CSE-ConnectionGUID: RKiSqIhCSMqY9H2B9297yg==
X-CSE-MsgGUID: ZugQL1GjRzGjhCkH2mYBuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89883382"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 15:07:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 15:07:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 15:07:58 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 15:07:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qA0cVQoX1aRk+aiyhcBkkHWcjVaapvfuqsmcCpapGB/fMxzYhq0EiZU/LqEbH+iuubAZjC8mIRC3ysE69OoPh43RBGI4d/CZFvGyUcIFP+IYr2wwZwht84y6zTYyuEgPrnB2Us3GG6NKnP1OCWyShTtR95g9QZwCXP09flnoPIOUh+1ed+2BIM4XEzd1v+cTd40KLJeONN3T6djXguIvxrCOBslaX9eRo3038D7dRJ0vrttrAeRxkWrXR0Mv+Xc67YYZZEOz5DVjF7bjz1j4MzKtpwifISVesl6VGzAReq7sbVOmseZLnKyzqBv6hpuJpIBsCVIKIdY20zbrX4mgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xs27AFE5kFe3KP5EpACOA492ixGmi+RFyGooGveL1/c=;
 b=tFVpdx4KeEjhV1hJuALJMCJ5501BpNc5qwzDW8V5eJSrUU7Sm6yWy/CqtPMVRA36tzUg8EFaEu5w/BiIWHkH6s2G6R5LbzGEVPvnbKS+OE4mjrBINE8JA9NtGnpDctrafcf06jRTlturgl042SawgSmrAWEx2OmSu6nmng4juhNb4u+CspFCEefS/SxvqF2eG8UC1bKuuq5KKYxqkUb29k7SGWTPP9k6L7+awb5wXb2XbTf801SEGtEUqbguuwm3sxN2SP8ipaA6r4tR8ciADqgTaHE/fg/QHAexOYIMvM/k0V43xlAjyiHYCSV2BvNn4cAGGrbdm12h5YNhDssyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6353.namprd11.prod.outlook.com (2603:10b6:510:1ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 23:07:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 23:07:56 +0000
Date: Tue, 19 Nov 2024 15:08:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 16/29] drm/xe: Add migrate layer functions for SVM
 support
Message-ID: <Zz0ab2pm5epu++Z3@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-17-matthew.brost@intel.com>
 <ffaf905b4c8b6c408e036ea69dd7cbb51735619b.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffaf905b4c8b6c408e036ea69dd7cbb51735619b.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0220.namprd04.prod.outlook.com
 (2603:10b6:303:87::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: d1adc805-3b71-4a7c-71c5-08dd08ef00c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LWWbmBl6orKfHyx7fPESI5Nfmh8Rc5BqNS2FJQwGw5sW7n8h7XOPP7nr4C?=
 =?iso-8859-1?Q?rvxa3QgGXcJmCYeFklq11bvFe8qlsT3euxkUFhBOv27MJz7xS+abhNCxJC?=
 =?iso-8859-1?Q?f7kBRGUMiaLHDBVeva2Yy/Ewr5Vpz9NFSgRJ1/zMhRey75aubUyG1Khtaf?=
 =?iso-8859-1?Q?F4Sq1t2wDN//cYrLEwr/AH0Lnpgj5Kh0q7+zui7AMtLUGkmpvhxIQtNuaR?=
 =?iso-8859-1?Q?qIC3Ml6btk2Ole/SYDYP5C6ZZRMUqk+l0My0v/DJUq0S+5JYWWfAvQ0P6Q?=
 =?iso-8859-1?Q?CYTE9LlKopU196ElRM34i2xncrwtkcEfuqJJHppODTkKMo1Mb2iJ/Hc7v9?=
 =?iso-8859-1?Q?hqS+ZwPGTAIZV9GMNn9XnNxGp0A1bHghl8a3zG2VwrMj+5F2mvzyLno5/d?=
 =?iso-8859-1?Q?gNT3v9dSpHJ7z/BDUqd4iW9tIMEpPCZDVhcIK0VmEMbx6EeRD8WEP/+b6g?=
 =?iso-8859-1?Q?8aS02nI8FupNFZUubAb3A5gkbH8hhEHG/gfQQQ6k9AwZha/4UIOjjd0fQE?=
 =?iso-8859-1?Q?R5IsDoqtvH/rphg8kKXBSci+3Dd/+kFFn95g1dkJkw2nSGTjzhxlMBGHmU?=
 =?iso-8859-1?Q?zXPrTJTWypX2pKooQ/7YEGhoBB6SDxUyHOxiXP/zBmnAAUWnQAtFX2LiVB?=
 =?iso-8859-1?Q?hLEY+jd06VLAxeLIgKYMgnDtnQZaxctvFCoIOOk3uSpDgpwzD0qX838EVO?=
 =?iso-8859-1?Q?AN6rBUsTSy8rf+DW8/XdEe5defbv3LQNTDe7bYeafueRDfYoAMtL2Z0rcA?=
 =?iso-8859-1?Q?Uqtb93f8MQBU+1hEYe06vH0TflWGGRPzqvTE2d4nooWIk5vdZNnBs1Kw9x?=
 =?iso-8859-1?Q?8hMx2QWOfrSTuis+KSfVtaeEvLxi2W/UKBwZcmqkr0PS+d0CZ3JG4pdlvO?=
 =?iso-8859-1?Q?RkboYG29eiiBjQxLHRAIPKI8TNfMWNnQs7tevCd4RnzwI/yW2tuP0+jplV?=
 =?iso-8859-1?Q?qIk3d8Pnk4Z36LkCpGsia6+lJNsYE9twxFrBGfO19XJT7hJ2G/+8ZEWh68?=
 =?iso-8859-1?Q?P2njZtwJLQsp9TrfTB3TuBoJqfRz/1L+kSe4QeoE+7Dj0KfQxWZczKzs4c?=
 =?iso-8859-1?Q?CqTHAgisRjX6jVO85+riweeSSF/Pj25z20TyZOnOsKg0j6rXwVaYAhjVN1?=
 =?iso-8859-1?Q?Aol4K/2mhvJGZXz6ku5lYXV+4jTXJvHAZFMv4CUzvLEMe5C9jC6H4Xxlkz?=
 =?iso-8859-1?Q?qlIB0iPUBtdvPOXLjTJPzS7hkYkD4nP2cK43+SozK60/4o8GugdLnsWh/P?=
 =?iso-8859-1?Q?eps7alzYFYXinsaITsQj+zigmWQMi4mFnIvKrhYdG7OX/PjmReH5IFvFNo?=
 =?iso-8859-1?Q?rilJDBeSLhSlm2bDI6vfmlvyxxFMZSQxuD1rhcahmadnSZs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AUO8aiV/l2t9nplDBSCGbU1BO7J/28uAxaUSeRN5+UqyM+foT3/SxUGOkW?=
 =?iso-8859-1?Q?//kig3NW2dnvFoSK44l9WA55QZT79H+iWfaJsPcXkkqRRi3TNoy2EopeOt?=
 =?iso-8859-1?Q?0jdgaKI0E8tqWtVX85SQnqM+y1QZUAXmEQJbXdQTT4qaKPCVAZ9LcNH1S5?=
 =?iso-8859-1?Q?diZv+cxGZLhPi3o/CXRYYsFjVPFhpmRvGkqLEvzyzvB01OpjCQem67lGIB?=
 =?iso-8859-1?Q?UKhzoW/mr0ME/u83EEDvyIETETqkfMs3bLtU0K9rJ1l+S4qOygC1ATW8Se?=
 =?iso-8859-1?Q?uRXXjaedRTdJQQf5N+A+NNr4y42d9JpBXUrmj6NmVX+6pPYTYji/uwAB6o?=
 =?iso-8859-1?Q?YW9xdC5oA3/dcHit8uSjEn0QYFKU+A7eWggAjjtH1gmsiHk2QyJ+A/ILn+?=
 =?iso-8859-1?Q?np1w3/DijQy404gSUizXG52swwv07B+KvjFhgKFKpNNkwLW6UjbexlXTHc?=
 =?iso-8859-1?Q?cAJY5M+mTmO8S9kr7UcekPyUHuJh+mMbioifTGaP/ebYOH4+30KZOT2GQa?=
 =?iso-8859-1?Q?brrJ7pom2Mrb6eiyXJK9br8DmxkeNY61WQKGKhamG0rMbRlv7IykTp0sdG?=
 =?iso-8859-1?Q?pHy1pGWFHjPQ26KCbeCxt8MpW5VJMyLQmlIFRQUP/z9Gp9Bj2i3WNANt6F?=
 =?iso-8859-1?Q?nRXewi5ZNMV/HSiRgiGmF7uDTgb2/vM6cgSr8U/cEF+2fGVoBeQQL/Dw3V?=
 =?iso-8859-1?Q?/9v3YoIgZBNL4XTnE26eHvgBaP9jsSAI3bN7Ci3sggU4GrR4+3VLNgay0D?=
 =?iso-8859-1?Q?yLJHDspDZ8vtkNJkMwi8+kqt2/wQ8jED3sKjQZ4Q+hvtglU19H4l40BQSP?=
 =?iso-8859-1?Q?cHK8VjcfZAB+yDLquZsIfHYxNXZak+O0hEnE5M0YXinshoMm9JMb+A4omq?=
 =?iso-8859-1?Q?maoYTdyFXaX5RxnCCXW4u2ymdZ1XPFIMQPXVCEARIwzxGZLo3HwcpqmSZc?=
 =?iso-8859-1?Q?+kwy3AthmEbj9iod866ohjFW7k/I2vlY6+IM1x7vliT/LLzAUOLoeicp10?=
 =?iso-8859-1?Q?gotd4j/82zB0gqjyRd5WtHNDpBDDuf2Nl2zh3oBIoAX2cOjsHpY1pgyINU?=
 =?iso-8859-1?Q?x2en1/iLZxfxLYtI5dMIFnR7FIvxSRswCZn3n0mtDXmHVq4HjcjNvZzjNf?=
 =?iso-8859-1?Q?oGV9Y1/VuRlTcgRM1R1mQE/2VhNiKIVury+DgFwrw+WlpJ2ZcncNIga2Xb?=
 =?iso-8859-1?Q?NqfB/iZBMBTePY+DvhnEA/m3UKiSmkLh/1e0r4bNoY9P+2ENDn7Rw68vHD?=
 =?iso-8859-1?Q?FSss/hp/Vf7PBNAdXZhCfRzSRewBUA8NG9hSZr0x1RHZzUqD2KozsZVJdu?=
 =?iso-8859-1?Q?pI0hFr0tOqAgUW5OTMZX+dJXWizjsysEOt1coY/9RN2n0nBh1nybYbNBja?=
 =?iso-8859-1?Q?4b9kXxeKZ/MfKw55hCxutKojWNZE77eCDKGI1hIhHGN/8ZLgiKeAx/KS5q?=
 =?iso-8859-1?Q?S/h4I3xZkcGdu/zPrvA4qKTsmqfTMvli6iAV/AjF6csV1lsCLyLaGeYsOL?=
 =?iso-8859-1?Q?LTauHUsLu6Jxdd09pkvUa7Z9cKc6COvzg+EFtlzctJnSAeukKVZU6DLJ1x?=
 =?iso-8859-1?Q?HiduSN7UgQP9YR9Au5kEtMqltY8UxipOMp2fqXUC2iXbv8ZOriGbE9swJ9?=
 =?iso-8859-1?Q?g+ZGTNLdPiTxdSblRdkV8UOHrrsmzMkNFW64gt0asC6lE0f6yg1CaXYw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1adc805-3b71-4a7c-71c5-08dd08ef00c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 23:07:56.0786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjYO11NNx2U7dZosSAzixdgOO8vP4hl9bAH56D1XDH+YpjlorBg5FIWSqS5VeEtX0Iy2kw20AjgIIltjR0xY2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6353
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

On Tue, Nov 19, 2024 at 05:45:27PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Add functions which migrate to / from VRAM accepting a single DPA
> > argument (VRAM) and array of dma addresses (SRAM).
> > 
> > v2:
> >  - Don't unlock job_mutex in error path of xe_migrate_vram
> > 
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 149
> > ++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_migrate.h |  10 +++
> >  2 files changed, 159 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index cfd31ae49cc1..d7b6636286ae 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1542,6 +1542,155 @@ void xe_migrate_wait(struct xe_migrate *m)
> >  		dma_fence_wait(m->fence, false);
> >  }
> >  
> > +static u32 pte_update_cmd_size(u64 size)
> > +{
> > +	u32 dword;
> 
> dwords or num_dword?
> 

num_dword

> > +	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > +
> > +	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> > +	/*
> > +	 * MI_STORE_DATA_IMM command is used to update page table.
> > Each
> > +	 * instruction can update maximumly 0x1ff pte entries. To
> > update
> > +	 * n (n <= 0x1ff) pte entries, we need:
> > +	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode
> > etc)
> > +	 * 2 dword for the page table's physical location
> > +	 * 2*n dword for value of pte to fill (each pte entry is 2
> > dwords)
> > +	 */
> > +	dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> > +	dword += entries * 2;
> > +
> > +	return dword;
> > +}
> > +
> > +static void build_pt_update_batch_sram(struct xe_migrate *m,
> > +				       struct xe_bb *bb, u32
> > pt_offset,
> > +				       dma_addr_t *sram_addr, u32
> > size)
> > +{
> > +	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> > +	u32 ptes;
> > +	int i = 0;
> > +
> > +	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > +	while (ptes) {
> > +		u32 chunk = min(0x1ffU, ptes);
> > +
> > +		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> > MI_SDI_NUM_QW(chunk);
> > +		bb->cs[bb->len++] = pt_offset;
> > +		bb->cs[bb->len++] = 0;
> > +
> > +		pt_offset += chunk * 8;
> > +		ptes -= chunk;
> > +
> > +		while (chunk--) {
> > +			u64 addr = sram_addr[i++] & PAGE_MASK;
> > +
> > +			xe_tile_assert(m->tile, addr);
> > +			addr = m->q->vm->pt_ops->pte_encode_addr(m-
> > >tile->xe,
> > +								
> > addr, pat_index,
> > +								 0,
> > false, 0);
> > +			bb->cs[bb->len++] = lower_32_bits(addr);
> > +			bb->cs[bb->len++] = upper_32_bits(addr);
> > +		}
> > +	}
> > +}
> > +
> > +enum xe_migrate_copy_dir {
> > +	XE_MIGRATE_COPY_TO_VRAM,
> > +	XE_MIGRATE_COPY_TO_SRAM,
> > +};
> > +
> > +static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> > +					 unsigned long npages,
> > +					 dma_addr_t *sram_addr, u64
> > vram_addr,
> > +					 const enum
> > xe_migrate_copy_dir dir)
> > +{
> > +	struct xe_gt *gt = m->tile->primary_gt;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct dma_fence *fence = NULL;
> > +	u32 batch_size = 2;
> > +	u64 src_L0_ofs, dst_L0_ofs;
> > +	u64 round_update_size;
> > +	struct xe_sched_job *job;
> > +	struct xe_bb *bb;
> > +	u32 update_idx, pt_slot = 0;
> > +	int err;
> > +
> > +	round_update_size = min_t(u64, npages * PAGE_SIZE,
> > +				  MAX_PREEMPTDISABLE_TRANSFER);
> 
> Hm. How does the caller know how many pages were actually migrated?
> 

This is an intermediate between migrate_vma_setup and
migrate_vma_pages/finalize. The number of pages here is based on mpfn
returned from migrate_vma_setup. The migration for individual pages may
still be aborted in migrate_vma_pages/finalize. In this case both the
old and new page have the same data, dso migrate_vma_pages/finalize can
pick either page.

> > +	batch_size += pte_update_cmd_size(round_update_size);
> > +	batch_size += EMIT_COPY_DW;
> > +
> > +	bb = xe_bb_new(gt, batch_size, true);
> > +	if (IS_ERR(bb)) {
> > +		err = PTR_ERR(bb);
> > +		return ERR_PTR(err);
> > +	}
> > +
> > +	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> > +				   sram_addr, round_update_size);
> > +
> > +	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> > +		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
> > +		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> > +
> > +	} else {
> > +		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> > +		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
> > +	}
> > +
> > +	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > +	update_idx = bb->len;
> > +
> > +	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, round_update_size,
> > +		  XE_PAGE_SIZE);
> > +
> > +	job = xe_bb_create_migration_job(m->q, bb,
> > +					 xe_migrate_batch_base(m,
> > true),
> > +					 update_idx);
> > +	if (IS_ERR(job)) {
> > +		err = PTR_ERR(job);
> > +		goto err;
> > +	}
> > +
> > +	xe_sched_job_add_migrate_flush(job, 0);
> > +
> > +	mutex_lock(&m->job_mutex);
> > +	xe_sched_job_arm(job);
> > +	fence = dma_fence_get(&job->drm.s_fence->finished);
> > +	xe_sched_job_push(job);
> > +
> > +	dma_fence_put(m->fence);
> > +	m->fence = dma_fence_get(fence);
> > +	mutex_unlock(&m->job_mutex);
> > +
> > +	xe_bb_free(bb, fence);
> > +
> > +	return fence;
> > +
> > +err:
> > +	xe_bb_free(bb, NULL);
> > +
> > +	return ERR_PTR(err);
> > +}
> > +
> > +struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> > +				     unsigned long npages,
> > +				     dma_addr_t *src_addr,
> > +				     u64 dst_addr)
> 
> Kerneldoc.
>

Yep.
 
> > +{
> > +	return xe_migrate_vram(m, npages, src_addr, dst_addr,
> > +			       XE_MIGRATE_COPY_TO_VRAM);
> > +}
> > +
> > +struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
> > +				       unsigned long npages,
> > +				       u64 src_addr,
> > +				       dma_addr_t *dst_addr)
> 
> Kerneldoc.
> 

Yep.

Matt

> > +{
> > +	return xe_migrate_vram(m, npages, dst_addr, src_addr,
> > +			       XE_MIGRATE_COPY_TO_SRAM);
> > +}
> > +
> >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >  #include "tests/xe_migrate.c"
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index 0109866e398a..6ff9a963425c 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -95,6 +95,16 @@ struct xe_migrate_pt_update {
> >  
> >  struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> >  
> > +struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> > +				     unsigned long npages,
> > +				     dma_addr_t *src_addr,
> > +				     u64 dst_addr);
> > +
> > +struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
> > +				       unsigned long npages,
> > +				       u64 src_addr,
> > +				       dma_addr_t *dst_addr);
> > +
> >  struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> >  				  struct xe_bo *src_bo,
> >  				  struct xe_bo *dst_bo,
> 
