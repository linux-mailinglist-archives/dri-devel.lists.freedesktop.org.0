Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85D825BAB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 21:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D14410E6A5;
	Fri,  5 Jan 2024 20:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3466C10E6A5;
 Fri,  5 Jan 2024 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704487065; x=1736023065;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JeLQutiotm2mrp+1tixgT64BVJYwTfIw57Vwe0mWih4=;
 b=blXPtpbPI84s041jPEtmka25J1+boRX9DLj/Fnb5+bVvDgcWOEwyAvy7
 KLBmFu+8Cp+FrSQAXahkGmhtPdSeBKkaNqCkHknCPyMRLDrakynvPlRfE
 eTu9Qq0VQUEL/nMkmTUgi4JEivxViwebdC2gi/bjDcIAiW0TfAhvtGHnw
 c13G92tIGvh2ujZB5TG0Yws9lJJhyMH4q76k8zALXW4MwUWL098pHMoxc
 eUuL87KvWZ9KgPIxW+6/SoSTBqULgYB+8Gh6/wO/XFFT8WU8jwWOW1f7y
 CYSAlqNsrgvXipgwSD7R/1VcME6CU5WF3thWmiO7bhTjnD61ZI5pUa0VM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="388029307"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="388029307"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 12:37:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="780855036"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="780855036"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 12:37:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 12:37:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 12:37:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 12:37:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 12:37:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnU1anY2jbBC51w1CnJ6IK9zh/PpCuU3jdj1SbSaKZa+xX1ORKLsphXD2uIg2rNp/qRbCyudQqBu2F3TS2Lt76Vz0LuC/uUf6dS5NvQSKOk4Bc02oE6GYthW0SuODYI6MkOop74eknbg51MSkRSu/qtf3rcUGcbBM7XP/76V193HMoQlT4oa2VhEXMJmLIy7zmoZOGFaiOPfeVJzJ2/qKBcbP55F5G/7x3UZsecAFqVC4o9PRoZUcYuq84CKrbIjrKmjzaEu8MveI4S63IxRhAoTGXNbLJSAeQOGP4ZmcCpoAjxcggFAezO0cNoYqyw9G58l7qzMyht2pg1MavDvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/bcgK3xVCRGoC7L/AxFqWxbk0+zNN9zQ1j4hEMgyfA=;
 b=Y6cUTSbJKmm+wFKAX3s+2sPCyLqCIMGKBmuZ9g/SdN1LD+z2WZbDBoh46q18sbV7fiG/YxlVkSbDdmYqfDpwjNXeSy2pd5FQwQpAcm9VuFBLEpLGkWOXyguhyWN0Sg7SSGkXiNmK2yji3rID/AtntaJKoQRrsxi08ppdmKapoTgzDuH421qv5kq8DNy5Sr01zStHqJY3N1U3DPXtsLfZjp9DJQNM+NzBWLRLfeoemlyX95Ce87vusDQ+VIYY9Gk58NS56abS/T2O/x16+a/rbc2z8pKwhcpQd1WJlakfdyYMBTXfbwD9RMOL7iEP/Tf36VdzJ3S70D7NMZ8h/c38yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Fri, 5 Jan
 2024 20:37:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 20:37:42 +0000
Date: Fri, 5 Jan 2024 20:36:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/xe: unlock on error path in
 xe_vm_add_compute_exec_queue()
Message-ID: <ZZhoYCzCgq4zBsIO@DUT025-TGLU.fm.intel.com>
References: <fa88d289-9886-474d-b697-b69881b4ddbe@moroto.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fa88d289-9886-474d-b697-b69881b4ddbe@moroto.mountain>
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f4a726f-1880-43d8-47dd-08dc0e2e2a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsXnrPcfSwj/Ms+ahc4TC72VvSLu0F93T4Z3zVEvmZH5HjugKKDi5dwWxzRjHjmtgRY8c9bcFA/l7e2kWggW9vumJUol+5UZSIjmralLeNhvQn/j4weBQJq61yYZGwm0KkOjpzq4voeG7DB5ukAjgGRDYP5wtErER8HyWIXBKzVabm/WVn7GQH3bq37k0HfNnJOqxDPp1FGMWZju9LCIjsfVT4C3DCYSdigGO9jEbDM0Bd2k8/jbXGxQMTjnGt6GsCAo84lKP+mMcILM1wau1w7xmrrbNxg4htDQLDf22z8LgI6tiCZqOgtMRQmZOVKfJWi18vLjjCYv6ADf5b9LecETnHC6yUR4ao1fJBuyztfLyxwMaKS9gK28zzbrE0IuIkKFeWhw6lo2UuOtO4S6ETbwkovK8MKZhiC8Z2rEylSU4FOLlHuSxue7AqPthzVtb9FjcpfPTVOHcjP19MIgGJcTBSwgBmNjmVkagLO86bWGZTiQdc++uuvPzeebYT4b2YO3d74q7XBud5rjBYfOWfyBihDCpflulFwFETpc2Od/D7fwAa0u1mY/qrqy9WrNCBQYp+Mxu5nje9CExBlAssEfseEdcoTZB2JKCg6fEoElftSBOKfQZBkpmagNPXkw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(39860400002)(396003)(230173577357003)(230273577357003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(5660300002)(7416002)(478600001)(4326008)(44832011)(8676002)(66556008)(41300700001)(6916009)(316002)(66476007)(66946007)(54906003)(8936002)(6512007)(6506007)(6486002)(86362001)(26005)(83380400001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MxiUxtn6ykXhNZvvjpYV99JmoEjqSm9OjeMrwqGVBj7qB2spa1BiFRyLNoqm?=
 =?us-ascii?Q?pUrAbQXtI6eGUc8/Soy67rAN8o1ELs8XzHNfkBj6Xejk1ggAwedFTgEBtLKv?=
 =?us-ascii?Q?DQptl1NWMltZeENv0roo6hr8upfCaQgQXWJDZSo7x6abxx6096TNM9QwwRRF?=
 =?us-ascii?Q?cTgQszgM7JqN96nwpMIySdV8d4rfMctWb7ZjV7QmrHypEffSzfAUi5Sa2xIq?=
 =?us-ascii?Q?N7aoHADjP1TFEWK8aj9e/XMTLCZrC+GuIdv608TzVi2p7UUxqWOsHF/kOofW?=
 =?us-ascii?Q?zbaWYelHrkKvGMYpUbD3XKRc2dB++6mOqENtrgy1pj3FniscEz/9T/3+P1/m?=
 =?us-ascii?Q?J4ojdlaOgILo9YUJzCs8942wEKQD730ol/ciLWtrZkSpSm0FxwM5Rn+8/e/R?=
 =?us-ascii?Q?RJEHd1EabrWsKyYS+wcJhBlpbXZ2LYt/ugpHdJ+Js2NTG4WvOwlOGHHZV7LW?=
 =?us-ascii?Q?LcBWwWPw9TdHGJ1TbJbYtj6+WGTNtdzks1KnhugCC2akMGmFvFKiEEoZ6e9l?=
 =?us-ascii?Q?ZkUVfcf2MlvOQHIcOFd00mOQB/SEusB/Si0TgwblGHQrdGYQrI4G/wqi22pZ?=
 =?us-ascii?Q?kqextptpTXBNpSO/tZL4m2vmCg/IKgCTkBWEqseEo3/tLvcIG9gRvp1n1Phb?=
 =?us-ascii?Q?ESU51nRNm/VXllJDvjECikuNljAGxyfdGVgirJZKYPACsZ1T7GE+T0CV6Zqp?=
 =?us-ascii?Q?eXIVuaRjpOrT3Ej+cSprSKnMYC0HBWnxkuBPou87OvHWoi0DWaUkNOegOih3?=
 =?us-ascii?Q?e2dkYwRlvjbXvFCOg51AVdhS67n3VEQ7BXMFKn7soY433CSX2SOrdg3oZ22R?=
 =?us-ascii?Q?QLbXWs9qajysn6Q9OMzybrHiSIm+uCKuGtkuRF3vmCAQXpa0AtnviROnx9Vv?=
 =?us-ascii?Q?0J0/Y4LA4uXYzVMXw7lEjYtswq8JvWXbVedIbiGTTak6f3DZeP4J3VGbLIRV?=
 =?us-ascii?Q?uSNGig/BV6vLN9UTfOWiU0Mv7vRJKokwSUBLZqQdu+UORChtxktuWTZTkioR?=
 =?us-ascii?Q?T+WQS2vncIU5mZ4WWMbxmC8dGa31d3LN8QouZD5Dezpw+/AQK54mQlKvelPY?=
 =?us-ascii?Q?ZBm8cqCe5n4pTd7waxpaPSEZjpsZG+fe4bpf1DLQ1xW92A4IYjj9FaLm2NoV?=
 =?us-ascii?Q?Y2jcgFm1qWeAVTmejHmTvDuTjHSiJxt4HU7cQ+8ug8OOAGWZbWIx4m7ULhIj?=
 =?us-ascii?Q?5z2pWOYvwyJ6RyVAYB0rwImz5fWSWmfanUOYbq3nDZbQYvHDam+rneZgxrT/?=
 =?us-ascii?Q?aTLLQ0VXDCmSjuVPyDHi7ZAwE9ZCqx/t3gB6J+AhvmH/u3030qdrHsbe7w6p?=
 =?us-ascii?Q?iFGRrXEax9FEDWXC1yGM/Czc6fxRp4cNtW29SEf9MFUX3acuJbJ6+yhBB1WN?=
 =?us-ascii?Q?q2Rjd3GyIC7IMwWyLj/eEEEhkenCS1qSsjOxG7S7H1LgTZihBj58Iv/+8l52?=
 =?us-ascii?Q?dlrfjS0gZJn0Dz15MY7iMQjLcWMMGT14VSVydnv1v3oeTiKzjmeNxD9r04xy?=
 =?us-ascii?Q?CLwh9ypZFkvpV/6PMSniBV79BHZW3Oveanx4ThJZnikDyXW6weXLkS8G5+xg?=
 =?us-ascii?Q?1XSiuVf3txZ/VABSFCHeUNTphCHtYvgiqpDgWJsT0pznVYg/sib0Z3G56sQB?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4a726f-1880-43d8-47dd-08dc0e2e2a72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 20:37:42.4339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQCGkeL0wKK5Vwyc0TBUYESBmLWjrGt7XaJLW5cvgWLU8hCpph53yN5rGsAgTkOpvWKqvNcpK9zagcP/hiFUiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 05, 2024 at 03:20:22PM +0300, Dan Carpenter wrote:
> Drop the "&vm->lock" before returning.
> 
> Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9180f2d2d71d..4aa7979fe6bf 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -332,13 +332,13 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	down_write(&vm->lock);
>  	err = drm_gpuvm_exec_lock(&vm_exec);
>  	if (err)
> -		return err;
> +		goto out_up_write;
>  
>  	pfence = xe_preempt_fence_create(q, q->compute.context,
>  					 ++q->compute.seqno);
>  	if (!pfence) {
>  		err = -ENOMEM;
> -		goto out_unlock;
> +		goto out_fini;
>  	}
>  
>  	list_add(&q->compute.link, &vm->preempt.exec_queues);
> @@ -361,8 +361,9 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  
>  	up_read(&vm->userptr.notifier_lock);
>  
> -out_unlock:
> +out_fini:
>  	drm_exec_fini(exec);
> +out_up_write:
>  	up_write(&vm->lock);
>  
>  	return err;
> -- 
> 2.42.0
> 
