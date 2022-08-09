Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A623C58DACC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 17:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B44DA22E;
	Tue,  9 Aug 2022 15:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA1CDA143;
 Tue,  9 Aug 2022 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660057561; x=1691593561;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Cj5l3FzsaO0pOC0TZM10zyXYP4C3LOaOYbcVGS3in3k=;
 b=kpFxlvDLQms13aIE5JVYl9jgCS1jLPFqrB8rqtkrRdlZ/c7KaASrd+u3
 JusN74C4hrtomij1VDdr5VlIqdhdSY2j8QMdu95Ha6ZSuEeC0K0fkfltm
 pCGIPp+9nAmkpjQONbBz6985bzbspsmujWDEevKLVpxp/i/+IC1mllKVX
 qj48KFgUvk29tLYoNOLPf69DNquil95aDF7VC+UYM0dZxMNHOyjRJpQT8
 8xlesM/aX/VA76X/67EjeNRQncrH7d2bHq5XMSNqXGx+h7Z6kJFqlttGS
 jQtNIyB7giM2d2Jiqnr26S678ZrlK8jM/PN3OIdadLKxJusme8MB7hR2m A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="290858015"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="290858015"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 08:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="555370652"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 09 Aug 2022 08:05:55 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 08:05:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 08:05:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 08:05:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJRZ5xYX5i6e7ObOpADRA7a/8f0JK8D2LDycbb1stynrpnCWCmVKQwOFXjd4yW01elbQ9elJzikWJHTHwCUGOnV8M5GhIVxFeYEJJnEbK0znVT6OTSStqp6ZW0M62KsT9+IbSTv7jwHapJlaPt1M/eD3uCb43oCZpFTjeqWz/LOZqyr20lPbjCOfMwic7zT7Gc7T5jI8sfyIezP/5DerMazq854GfE5R7qvJ2nZVw4WCYU/WlYYyPvhspiATrdh3vnBvmk0ta/jdCeLW0HEDlWzODeTHgDX+OlSceZczDpqpjihlA3dan2zhIQcifWESNvdBR3MiryGH0R8poKXhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruA9lnRF1LNeZUhUA1qZDtntI+8b7WZgJf13qLyyyOY=;
 b=H2TrkCnfIKL9ijc428uZCCgW7a38xk71Jb8YLZLvERCwbUKckPjU13NLB7NbkIP09ar7q1V72vO8OkGvKi6duPhpxgeg5+wYy14EIl0ki6n6gTvtBa8tWvmGsRHWikpiXDzRNwnxJQv6dXqDCsQgaZqtK2F9Ocg1drMMSntI106EwmLmmXC0EFRdqOm3tpePp2+xPtXVcHnGvOP6hFnRLB3CHyTkve0V/xLCAL3PEuXLQpVgx976kiA6m/RkOsmbIF8sU9Zx5BDRfOo9KNQ5Sejbd7mhr2LRfto0L6ZfWeSBJE8wrKMgXbfPN/gYiQkezQXAlieH0LeRcE8xDR6BhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN6PR11MB1378.namprd11.prod.outlook.com (2603:10b6:404:4a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 9 Aug
 2022 15:05:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 15:05:51 +0000
Date: Tue, 9 Aug 2022 11:05:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [Intel-gfx] [RFC 1/1] drm/i915/dgfx: Avoid parent bridge rpm on
 mmap mappings
Message-ID: <YvJ3ykH0MS+i1jp2@intel.com>
References: <20220808103555.345-1-anshuman.gupta@intel.com>
 <20220808103555.345-2-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220808103555.345-2-anshuman.gupta@intel.com>
X-ClientProxiedBy: SJ0PR03CA0201.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 080721e9-cbb7-446d-342a-08da7a18a610
X-MS-TrafficTypeDiagnostic: BN6PR11MB1378:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PKIL6rdNP4hqfDu7N4Jr4MjdzMohkCXBx4+72w3oeaT0VY8b4s98I0ok3hhbF+DNfELIeGgEOOTldXb/zVaHLt4+sSz12UYLOwuA0oY5udRR/Ngcm+sWcehc+HrxJcDXq+1fRWy/sSD9HhBA74s6j9BDnBDkjAao6SVPgqiIqe60J4XxXluCcdVH2VTrNp0Q/o+tIQ2hcNcRgIBgn/OtowKjGaD4n+GFDMWrzkIdK8urL2jpKOeuB2CSgpXMglJhDITj1i2Rp0dK7KgGmFXVYNVV6ymVuKAhITKtVquQM1Jhkh+HaHVg/fBVVIvD02oFvRgDnBnA+BhGQqdATRR7fmetEmRZgqyYsmWSaFRpMdYuSRiZWUPYKf97c+44KrMmJB6tfVLrlCjcsSooZ0Wtyg8df6wYYF8rW3Rq5te6FC+qId/zLNtRDlhoB9hGZfyMgylhvB1o0XCpMC/7CetrFtzSa4usYN6slKasZYImD1+krLup9zggM5qixvcxhzOKn88aN3kCHqIvihu1+w024CLIJJCTe+vJ5G8dMN7C+9L56/YAgltMXZ4+Py6xUT+3lupe2/cVlRoZ4Qwv4yAcdaTT/5Ym4J8p6JteJ+MCdL9Xxcg9yp4/uO3NbCbF+eLBNoqQz9ErIUSZ8fNBiRXTQZK2nBDVPCZJNSvNlo+mWdaAp9TeIJ83/tgffnkFOqKqvJcXzOCguygecE6X9LyUhnZEE3FEt2g11V1PiIZsn2aT2x89mEZi7ZluePhaSDmHXo788BxxzpASi2RBI+UNT+BfXAKbFaPvbPLT+hyhqXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(39860400002)(376002)(396003)(136003)(8676002)(4326008)(66556008)(66476007)(66946007)(44832011)(2906002)(36756003)(6486002)(478600001)(316002)(37006003)(6636002)(38100700002)(41300700001)(6512007)(86362001)(6506007)(6666004)(82960400001)(26005)(8936002)(6862004)(5660300002)(186003)(2616005)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlZBcThrSUxsNks2MVg1cDNsS0NyM0dkN1hFWmgyU0prVVB1NXZIRk1UM3lq?=
 =?utf-8?B?NkcxNXFNQ3dmb0lYNHVXejd4U3hFME10QVZXTGtiVHc2cEt6WkVNemZzd2JB?=
 =?utf-8?B?dGthaURtMmVmUlJZWktKNmE1cVB3dTN4enh2cEZaYmZXOG5IQVhxMEVBYmUw?=
 =?utf-8?B?OHZ4VFRxcjQxbFJiNWp3dGxlVVpucUNWaytPQmRYQ29DcDdOY1NZanZaYVkz?=
 =?utf-8?B?eGtnUS9wTVVBcFR6NWJoU2kvcCtmY2ZuYzlGYzdCRFlMWDlOTnRqdWwzMnlv?=
 =?utf-8?B?TXNLbjJ1UjIrZFF1SjZpeVZBYXZTcFRDd2I1SVB5Z1hEajBleWh4RGdocGVw?=
 =?utf-8?B?eks1aTZiRjFXa0pYRk5zK3FibmNpc1lKVXBVZXgvelFPWUhhcjFGcWNoeVNa?=
 =?utf-8?B?eDdYRlN1WDR4OGgrK1hQWEEyY3d5U0Rwbjd1dW1TQmdITWFvMzJnUVA3UTR0?=
 =?utf-8?B?QjNFUHhxK2p6clNETGRaVVoxb214b1h2Y2RDRFdpeVdNNkdDM2NSM2ppR0VL?=
 =?utf-8?B?cHExdDVuRnk2eTdNalFEdzNtejFzd2RrSnVTeXpSOFN3a1VrN3NhMXhvTFZS?=
 =?utf-8?B?ckhWRmdNdVFpeS9rNHJQRTJwYUZkR1lzb2pyWjllY1VSeVc4Rit5Uml2cjAw?=
 =?utf-8?B?NUtITnd2dzBqeXNaNktqcWVPWEVnNFFwY29sL1BnQmlrZ29OYjd2aW44a3Ur?=
 =?utf-8?B?eTVXbzdJL0lHdXptTkNiSDZMN3dkUlJFa3Q4ZU5SM3BaSmR3bUs0ZjRLY3RF?=
 =?utf-8?B?QmhqQ1ZTb0VzRU05VmUrRDZSemI1V0NTZmZGSVNoaHc1a1FwWnFzV3M3elQ4?=
 =?utf-8?B?b3FnZW80VFBpWHJnTUJtc3ZQK09CdFMvaG9HWWJkZTllR0lDZDY4Uk1iTWRD?=
 =?utf-8?B?bkZRNWphK3A4elNuVEF5TTloZkZvMzhqeXN2ZnQ3bmtHNFZidURVVDdKRU5x?=
 =?utf-8?B?RC92UjBSUUF2RWhJWDNWYWQybnowNXFiNXN3TzliM3F0SzA0NnhPNGVjUDh2?=
 =?utf-8?B?d3h5N2VWUVY1dUsxTFFaMmZzUGw2MExRNEJjQmFTaUdxRDRCY25XclNQOGVS?=
 =?utf-8?B?UXdRbkVnZVJpRHRneGZiRURjSzVueWx1akVnYkpaU0pXc2RPVTZHWFRLTy81?=
 =?utf-8?B?WFdETFl5L3JWUldUMi90ekdUK3NpYzB2dThRdTNNcTlHVEl3L0lWUGNVMGJK?=
 =?utf-8?B?MFE1L0hsUUZIdCt4Rk81SHY2cXVNaEtXbkJ2U016ZXRLOXpYL29mZTJQR281?=
 =?utf-8?B?SjJPY0RFMzMyT0ZQNnZUektEUjRpaDhneVREYTJyaGhUbko4R0x3TlhXUkM3?=
 =?utf-8?B?TkVybXgvWjdob3NuejUyK2RqZmxremQwRjBCVG9HUmZ0YWsvZU5wZHpNTmxq?=
 =?utf-8?B?V01uaTFQZWp3Z1NvMTZYcGJhS1NVRFJ4OEM2YjI1SzBoUnBOV3BrZXBGOFdr?=
 =?utf-8?B?L3pVbFFhalZVZ0dBTC83Und6MUlaVGhab0F0TjhnM1N2bFRlS055b2FjUWNz?=
 =?utf-8?B?SUoxcndZRXE5QVJvSmlBU25TK1BpMzhLcnBkYjlxZXJMekhGZm1ldG5kMExQ?=
 =?utf-8?B?N2VmVUJRbEkzOGZ3ZHFPci9kd1ZMeHlFc1ZKeHFHR2FaemN4SnFhZmM5cWta?=
 =?utf-8?B?cVJHNXpDTmQ2MlJqWHpVZjZ1VEIzMW1VdlJVZFFFVDdVd05TRmpUNHNURFpj?=
 =?utf-8?B?Y3lJOHBhaUtYSmNPTnI5SmpJVlVCK2ZSbEVyVzJYdGg5akQ4bFYzTVQ3OFhN?=
 =?utf-8?B?bHhnd0N2OWVPUHFETDN6bGtHTmNwMDBsT0hGUnZMcXd1d0tLaE1KcjcxeERx?=
 =?utf-8?B?TTRIMU1NTnNzWVZIcnR3NVV3YVArMHNyc2FiNmE0d3JZVnhYSFpsTHRLQ1NT?=
 =?utf-8?B?Z0N4cVdKQ1F6QXp5WWp3TGRnaHEvZUlHQmRzN2xmV0Y3eXRobkRBREt5dncr?=
 =?utf-8?B?ZkhzcklUQWtkMEsxVjd1TjlTTlVCcUdXQ3VaYWg2YVBpb2E3Nm9DcG0ySU11?=
 =?utf-8?B?ZEhNRmJidXdUTkZPK2luVU5Ua25kTG0vV1UxckJzZmNielNXdC9XYUpBNGdp?=
 =?utf-8?B?ZlRmRkZxUkxRVTFFNWxub2I4ZUQvNUt6NkI2eXg1dFNxOTFzK1dnNXgvZUtz?=
 =?utf-8?B?WDZTVitBQmpnbEhZYlA4MXJsZXRyd3I2dUJOUlVmSmtGODhCb0luSGdLK2pa?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 080721e9-cbb7-446d-342a-08da7a18a610
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 15:05:51.7103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 734c424+dR6CKDxREbBC8deLMZ1v3iY+kT9toimzeVj7BaYBqCnoLVI9WBm1SfxROBC6/9YtD2ahlVNMW9vIrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1378
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 08, 2022 at 04:05:55PM +0530, Anshuman Gupta wrote:
> As per PCIe Spec Section 5.3,
> When a Type 1 Function associated with a Switch/Root
> Port (a “virtual bridge”) is in a non-D0 power state,
> it will emulate the behavior of a conventional PCI bridge
> in its handling of Memory, I/O, and Configuration
> Requests and Completions. All Memory and I/O requests
> flowing Downstream are terminated as Unsupported Requests.
> 
> Due to above limitations when Intel DGFX Cards graphics
> PCI func's upstream bridge(referred as VSP) enters to D3,
> all mmap memory mapping associated with lmem objects
> reads 0xff, therefore avoiding VSP runtime suspend
> accordingly.
> 
> This will make sure that user can read valid data from lmem,
> while DGFX Card graphics PCI func is in D3 state.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 11 ++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c  |  8 ++++++
>  drivers/gpu/drm/i915/intel_runtime_pm.c  | 35 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/intel_runtime_pm.h  |  2 ++
>  4 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 0c5c43852e24..968bed5b56d3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -845,6 +845,10 @@ static void vm_open(struct vm_area_struct *vma)
>  	struct drm_i915_gem_object *obj = mmo->obj;
>  
>  	GEM_BUG_ON(!obj);
> +
> +	if (i915_gem_object_is_lmem(obj))
> +		intel_runtime_pm_get_vsp(to_i915(obj->base.dev));
> +
>  	i915_gem_object_get(obj);
>  }
>  
> @@ -854,6 +858,10 @@ static void vm_close(struct vm_area_struct *vma)
>  	struct drm_i915_gem_object *obj = mmo->obj;
>  
>  	GEM_BUG_ON(!obj);
> +
> +	if (i915_gem_object_is_lmem(obj))
> +		intel_runtime_pm_put_vsp(to_i915(obj->base.dev));
> +
>  	i915_gem_object_put(obj);
>  }
>  
> @@ -972,6 +980,9 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  		return PTR_ERR(anon);
>  	}
>  
> +	if (i915_gem_object_is_lmem(obj))
> +		intel_runtime_pm_get_vsp(to_i915(obj->base.dev));
> +
>  	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
>  
>  	/*
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 5a5cf332d8a5..bcacd95fdbc1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1101,6 +1101,10 @@ static void ttm_vm_open(struct vm_area_struct *vma)
>  		i915_ttm_to_gem(vma->vm_private_data);
>  
>  	GEM_BUG_ON(!obj);
> +
> +	if (i915_gem_object_is_lmem(obj))
> +		intel_runtime_pm_get_vsp(to_i915(obj->base.dev));
> +
>  	i915_gem_object_get(obj);
>  }
>  
> @@ -1110,6 +1114,10 @@ static void ttm_vm_close(struct vm_area_struct *vma)
>  		i915_ttm_to_gem(vma->vm_private_data);
>  
>  	GEM_BUG_ON(!obj);
> +
> +	if (i915_gem_object_is_lmem(obj))
> +		intel_runtime_pm_put_vsp(to_i915(obj->base.dev));
> +
>  	i915_gem_object_put(obj);
>  }

we need to ensure the runtime pm get / put at dma buf attach & detach as well, no?

>  
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index 6ed5786bcd29..a5557918674f 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -646,3 +646,38 @@ void intel_runtime_pm_init_early(struct intel_runtime_pm *rpm)
>  
>  	init_intel_runtime_pm_wakeref(rpm);
>  }
> +
> +void intel_runtime_pm_get_vsp(struct drm_i915_private *i915)
> +{
> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev), *vsp;
> +
> +	if (!IS_DGFX(i915))
> +		return;
> +
> +	vsp = pci_upstream_bridge(pdev);
> +	if (!vsp) {
> +		drm_err(&i915->drm, "Failed to get the PCI upstream bridge\n");
> +		return;
> +	}
> +
> +	pci_dbg(vsp, "get runtime usage count\n");

we should always prefer the drm_dbg in our subsystem

> +	pm_runtime_get_sync(&vsp->dev);

why? I believe that grabbing our own ref would be enough to block the
upstream chain. I don't understand why this is such an special case
that we don't see any other driver in the linux tree having to do such
a thing. what am I missing?

> +}
> +
> +void intel_runtime_pm_put_vsp(struct drm_i915_private *i915)
> +{
> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev), *vsp;
> +
> +	if (!IS_DGFX(i915))
> +		return;
> +
> +	vsp = pci_upstream_bridge(pdev);
> +	if (!vsp) {
> +		drm_err(&i915->drm, "Failed to get the PCI upstream bridge\n");
> +		return;
> +	}
> +
> +	pci_dbg(vsp, "put runtime usage count\n");
> +	pm_runtime_mark_last_busy(&vsp->dev);
> +	pm_runtime_put(&vsp->dev);
> +}
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.h b/drivers/gpu/drm/i915/intel_runtime_pm.h
> index d9160e3ff4af..b86843bf4f5d 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.h
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.h
> @@ -173,6 +173,8 @@ void intel_runtime_pm_init_early(struct intel_runtime_pm *rpm);
>  void intel_runtime_pm_enable(struct intel_runtime_pm *rpm);
>  void intel_runtime_pm_disable(struct intel_runtime_pm *rpm);
>  void intel_runtime_pm_driver_release(struct intel_runtime_pm *rpm);
> +void intel_runtime_pm_get_vsp(struct drm_i915_private *i915);
> +void intel_runtime_pm_put_vsp(struct drm_i915_private *i915);
>  
>  intel_wakeref_t intel_runtime_pm_get(struct intel_runtime_pm *rpm);
>  intel_wakeref_t intel_runtime_pm_get_if_in_use(struct intel_runtime_pm *rpm);
> -- 
> 2.26.2
> 
