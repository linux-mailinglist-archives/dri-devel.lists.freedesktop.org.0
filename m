Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075B265CA1F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 00:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B106010E28A;
	Tue,  3 Jan 2023 23:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D0A10E285;
 Tue,  3 Jan 2023 23:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672787030; x=1704323030;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MjA/v6xfCb7qYdw3Ie4Ts69KJmp2Ym54UB1w23VkJz4=;
 b=mJacwmrgMnwoliQtlv7XNS2xmG5DuYViMepDEB713ZAMN4UA5GqY/WKl
 R3qjvxLjmL7Hh1YllAJlRdZfF3RjiWfoX0/OyCnWRiUOE9TuHD2dvCk22
 gZ9DUI5DgN0cO4FUclrn+Hq5mNlLpE8NQeR2xX3aXi0Nw58EEgbQQslOJ
 X0uGLuX0M/f2smDU9zy4zVgrxKL62XvD3dAaz1Bu/xTaovvaW4CuZOovH
 ggUls08dHT0JMsZOm8HRcEhUjsP20G/PHzVtJJ+bSQavvInwLkKFXwRKJ
 bZybgPQJXMziZaSLp/w4MqQI+y1fk8lMHKfIfojIx/2eVtg/zjdWTD08O A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301465839"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; d="scan'208";a="301465839"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 15:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="685555424"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; d="scan'208";a="685555424"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 03 Jan 2023 15:03:49 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 3 Jan 2023 15:03:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 3 Jan 2023 15:03:48 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 3 Jan 2023 15:03:48 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 3 Jan 2023 15:03:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQP9q/tGnf7K8v4jGLcVXK+vS/8vxIh8hlXvfvhNEOPLowJXFhLR3f6n3/0n3awdBI994faRDkmIx4xTTLC9cjWFSU49qV8mOSVLYiTXOLoBwkchvO1yuYEBSdrD0aHp02qlcyK401m8Crp48Fqi+2sHl/lr7oRSkBVg0my+yBLQJ+YoHyFvLmaBS0dobSui+mxY3BGlMJZrcBpHnpEQwVB3oeTDc9arWnSndogqVOE4q6bRMvz5bXxku6vUoRNTdxm7jtDlGRcviL/2dXOcumMckE4fgpbu8nVMhK4NBnFXgeqAw7ZAN0KNeQKvZIJwnWsgFPwWvkchqjwb1aVkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVleh2aSxyRoiOXN7SJ6ogF4gD+rDjuN9gNQvNr7lhk=;
 b=O2fzVmnM1Khy83QhO5J9Dj7RtyVeAlYtZBbdKH+YtFx/K/5D4RcBDQWC3D11C5TtXbLZEduEBHf+LHLFvldADC71IuJEWnKFC9yc/uRimDHH38Hw7yu9eEFaAZ9pnQRf277gwQ/bCk6pvnK25PEmjySZM22zMebAC5Gg+2zGNz0s18ve21r/lCRKKDJScrmTWH8d4URQRoDPjKsV/w8o3fy8hMxkyiCbPYhBPvoiHj+rpX8JbkqGXUMw6S0ankoaaydub8TI6MeOfF8llV8uvmlVgl51QKLBjOpf8nICUTjHgdHbrP/NqiLvixF2gpZ/EcaydauO8P/W36qDxul9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 23:03:40 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%8]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 23:03:40 +0000
Date: Tue, 3 Jan 2023 15:03:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gt: Remove platform comments from workarounds
Message-ID: <Y7S0SY4CxXPNkqAy@mdroper-desk1.amr.corp.intel.com>
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
 <20221222082557.1364711-2-lucas.demarchi@intel.com>
 <2cfeee8a-7b7e-c203-37b4-f7a502123a5a@linux.intel.com>
 <20221222155535.gmih2rurxlo2xuo5@ldmartin-desk2.lan>
 <4c8ffcd3-259e-f651-6f32-296896d8b4b7@linux.intel.com>
 <20221223182807.tfyrx2yrjbv4flx7@ldmartin-desk2.lan>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221223182807.tfyrx2yrjbv4flx7@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: c642dabc-50c6-4a95-fe2d-08daeddec0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8+4/zMP4eEc8wYfh5iC2IzXD/+LEWWRTqr8fEARNHNZPFSITO2f88/kLPSN9oNnD7F+wPCHLiSs1At3+Qw4eX0Ka1dARR0vY9dLc52Ggymf8T5m4zmz6Ca/uNTh3qo+e8hc2EtobV7wMRaOT0FEFAj8dYrZypUKxgNepQVCS2VIxFba6dM4O15CvNKJJC6NAF7ucqicfR0HBFHA/x4BYIGlx2zhUJkO1TdI6w+kjfrMFp7l7aILnGA3LxEaLQjlNc+YrkjyUr9938llE1DN6JEq2yjSy6KpGd3H49NhuqbNlIXQB7ILrYXfazasJ0TZvy6hsy4YIO1NyXc0vLMDEZQoZUPXAOIN7AW8kCxOXMtxEiE7PSFsqwIMUMC9LmfvWeA6MohCzwhPhHZ30YenmuqTcnJP7xDR5NzKCHKCYMd5Gs8w3srHIdfaEZmoe6rWKlq6hEttVR6oTspGKUpDoBV5fpEd7GzQP5u+XsW45asYirDQdr+o8dMbSBeok/9eZbhQlbyZDYi09CeFJjGT8lhnhOweyfY22mCQzJqgM7QoLt7FNwmX6nKf/UK+CSYyGzblxDQ21JBxO4hEQpK+14rBiaFgxB+m6Wl6Vi4TtXKdzhvwXFxnF75BzZ+kgbLFmfrE9n6SwLCIPQ3SXE1+to9d3fluJ6GxM9oJIMDDwFOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199015)(66946007)(8676002)(66556008)(4326008)(66476007)(41300700001)(54906003)(316002)(6636002)(38100700002)(82960400001)(2906002)(86362001)(5660300002)(8936002)(83380400001)(6486002)(6862004)(6506007)(53546011)(478600001)(66899015)(186003)(6512007)(26005)(6666004)(966005)(22166009)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jEWsBq2KQWsYIw2xLM9Ue9dqJ7ol8nhKYQ4PFwAyz8WGFXW7UC4VYWGjua?=
 =?iso-8859-1?Q?dee2csGaxXUJHOXnId6UuPzt8f0AOTiCRG4YZGYflrDqtfRUDr08jDIIyR?=
 =?iso-8859-1?Q?uOq5+vZX9kue8XMteFQF/0l4BSbZoXAIp6Ai0/QnY63SWGbqGlZ7uiw6ab?=
 =?iso-8859-1?Q?DytgvfHjrgPbJQ5qRpq9NusvlN7tUW3MooiHToW6Csxm9S8dY7Bx91whH7?=
 =?iso-8859-1?Q?U+KB93bX2AHa0sBmdHcr0BX125tbg0MClSoiqtsesn1msGyEahn1sRxBOS?=
 =?iso-8859-1?Q?l1rZqjdGsbZAGxBHi+i9znIv8BYHGE+JjHOwmz52StJYh66usC5a2RHj7F?=
 =?iso-8859-1?Q?lh3khOeHf2usjK8wGdFKzVDBNtcViJVkdhnwTj/VCpgJDiTQDDUND5WMYR?=
 =?iso-8859-1?Q?uzoo4DXZJwaROGEgslOKXQw0bq9/jv2/oCk6LhnEGkP7jZi9RFHmIQFLSG?=
 =?iso-8859-1?Q?Q+QTVpZFz20flwcqk44B+66f8vcOiWtWNMUPln5bBi2j6qHOmtyOQSDCYx?=
 =?iso-8859-1?Q?2ry2tVP0d8b522a2vj/ETH6TkdG8gOzT80M+QrI+iuyBZ4Dsy34C55RTgz?=
 =?iso-8859-1?Q?KCImCgOD+2MKD25+o3NIKqJTZC2KvVquNFAp2BduQLFxmeK+d5lcKJMyGv?=
 =?iso-8859-1?Q?OdoGoqZ4zNdmh40xLX6nMX7o8CKnrae86Tbam0e42WhwKlOkSxv7KiUFFA?=
 =?iso-8859-1?Q?xpD5TXg4QeP1U4PTdO7MdqdOSBfuWSv5XT6xwJEh+WIrx1vv/qpyoDbaqS?=
 =?iso-8859-1?Q?0tN8XfA9g+bGdCO+oSmk93DOz4FOUKv+NF9/OHgR6lpdL7u3CuYY4Bno3r?=
 =?iso-8859-1?Q?z/Tu/0Kk7miQuxZzIBjBGoVAcwsxQSjLwxv0aQ2P4hQe+sGm4SY2RC9ddK?=
 =?iso-8859-1?Q?Ly+Fe44WUp0XFISibTKoNzQj4meApkK5yQvu+WiegSwTDAVwGsgicjaD6Q?=
 =?iso-8859-1?Q?bnRmIfoIVmXOepmWMImMs8eyb52jN+saLFHReh1yTWp9764SfoJJChCp8j?=
 =?iso-8859-1?Q?tx1+vi0m4RzIbJfXAFRVTrYVa6ZyGl6WTu7iAR7jWRnBQzkcWvXEpvuVFk?=
 =?iso-8859-1?Q?BNXnHmKckmRejnc6aLlU9FqX2vySjEqKVUjHEb9jZiihYX51x6P4cwRlgH?=
 =?iso-8859-1?Q?DQlcnqQJYNTRczvjT5pkM31gT1S72ZBkxIFzJIQk9ciqLaKhE71B6KTea1?=
 =?iso-8859-1?Q?etv5OD+RUPfrs1TYOeTAr01M/zX5mCf9iNOWI3Pvxpd/Ikv/jnJphQhIK/?=
 =?iso-8859-1?Q?+g8IPlq/1wLYahOUytqId4kOQnYFeR8yLD8iyCht38XYP8ZW02Ue0zLO1v?=
 =?iso-8859-1?Q?DqxPJlyrLPR4iQ1XXQbvtknYWPLgjLsPCjsWxwwOJcgPnN4Sme2AVgzrrh?=
 =?iso-8859-1?Q?KXE4nhoTlZ+nqOXT3/QOA9m2Y+wRzEsMXmS+vzfOpy5M9V8B3FD7JdrT+1?=
 =?iso-8859-1?Q?jVMxWKI1X5pmFPVW5hz8Nu80TBsmTromtWS5T3KJi51udxBe/FAJNSD2kj?=
 =?iso-8859-1?Q?+MGHK+tCIsUqc/0jET5D4mK7alzFsIrp4XxTGfHP2Z0e93h/lwApO8aRd8?=
 =?iso-8859-1?Q?5d1zirb/xSsyMGqK+Pa3fkdelo7Y5AmSRepUd6fs7lWb3CXgBheSucAPcN?=
 =?iso-8859-1?Q?tF7S8/FRkhlQzJ/vgXABWeJdt6We7nbgBkHHWMyybYtDAKSXXlpc688g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c642dabc-50c6-4a95-fe2d-08daeddec0c5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 23:03:40.0320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YK90YHU5JqPEFaeAU5D0SHArCfpueLxu2p0p4EI5JQ8UeWCkVB12k45j5tPCV2lIuztMlMprN3S+5/yUPplf/L68YgJ+9pdImu9DMwefcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 23, 2022 at 10:28:07AM -0800, Lucas De Marchi wrote:
> On Fri, Dec 23, 2022 at 09:02:35AM +0000, Tvrtko Ursulin wrote:
> > 
> > On 22/12/2022 15:55, Lucas De Marchi wrote:
> > > On Thu, Dec 22, 2022 at 10:27:00AM +0000, Tvrtko Ursulin wrote:
> > > > 
> > > > On 22/12/2022 08:25, Lucas De Marchi wrote:
> > > > > The comments are redundant to the checks being done to apply the
> > > > > workarounds and very often get outdated as workarounds need to be
> > > > > extended to new platforms or steppings.  Remove them altogether with
> > > > > the following matches (platforms extracted from intel_workarounds.c):
> > > > > 
> > > > >     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
> > > > > 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*/\1/'
> > > > >     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
> > > > > 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*\*\//\1
> > > > > 
> > > > > Same things was executed in the gem directory, omitted here for brevity.
> > > > 
> > > > > There were a few false positives that included the workaround
> > > > > description. Those were manually patched.
> > > > 
> > > > sed -E 's/(Wa[a-zA-Z0-9_]+)[:,]([a-zA-Z0-9,-_\+\[]{2,})/\1/'
> > > 
> > > then there are false negatives. We have Was in the form
> > > "Wa_xxx:tgl,dg2, mtl". False positives we can fixup, false negatives
> > > we simply don't see. After running that in gt/:
> > > 
> > > $ git grep ": mtl" -- drivers/gpu/drm/i915/
> > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c:       * Wa_14017073508: mtl
> > > drivers/gpu/drm/i915/i915_reg.h:/* Wa_14017210380: mtl */
> > > 
> > > I was going with the platform names to avoid the false
> > > negatives and because I was entertaining the idea of only doing this for
> > > latest platforms where we do have the "Wa_[[:number:]]" form
> > > 
> > > > 
> > > > Maybe..
> > > > 
> > > > Matt recently said he has this worked planned, but more
> > > > importantly - I gather then that the WA lookup tool definitely
> > > > does not output these strings?
> > > 
> > > Whatever it does it's true only at the time it's called. It simply
> > > tells what
> > > are the platforms and steppings the Wa applies to. We can change the
> > > output to whatever we want, but that is not the point.
> > > Those comments get stale and bring no real value as they match 1:1
> > > what the code is supposed to be doing. Several times a patch has to
> > > update just that comment to "extend a workaround" to a next platform.
> > > This is not always done, so we get a comment that doesn't match what is
> > > supposed to be there.
> > 
> > Tl;dr; version - lets park this until January and discuss once everyone
> > is back.
> 
> I'll leave my comment here since I will be out until mid January.
> 
> > 
> > Longer version. I've been trying to get us talking about this a couple
> > times before and I'd really like to close with an explicit consensus,
> > discussion points addressed instead of skipped and just moving ahead
> > with patches.
> > 
> > References:
> >  3fcf71b9-337f-6186-7b00-27cbfd116743@linux.intel.com
> >  Y5j0b/bykbitCa4Q@mdroper-desk1.amr.corp.intel.com
> > 
> > So point I wanted to discuss is whether these comments are truly useless
> > or maybe they can help during review. If the tool can actually output
> > them then I am leaning towards that they can be.
> 
> I consider "can the tool output xyz?" asking the wrong question.
> "The tool", which is our own small python script querying a database can
> output anything like that if we want to. The database has information of
> what are the platforms/steppings for each the WA is known to be applied
> *today*. And that can change and do change often, particularly for early
> steppings and recent platforms.
> 
> > Thought is, when a patch comes for review adding a new platform,
> > stepping, whatever, to an existing if condition, if it contains the
> > comments reviewer can more easily spot a hyphotetical logic inversion
> > error or similar. It is also trivial to check that both condition and
> > comment have been updated. (So lets not be rash and remove something
> > maybe useful just because it can go stale *only if* reviewers are not
> > giving sufficient attention that changes are made in tandem.)
> 
> I can argue to the other side too. We don't have comments in the kernel
> like
> 
> 	/* Add 1 to i */
> 	i += 1;
> 
> This is exactly what these comments are doing. And they are misleading

Yeah, this is exactly my feeling for why the platform/steppings should
just be removed from the comments.  Keeping the workaround numbers is
useful for quickly jumping to the implementation(s) of the workaround in
the code with grep, but everything else is (at best) just re-stating
exactly what the next lines of code should say.  During review, the code
itself is what really matters, and comments (which might become stale or
incorrect) just make it easier for mistakes to get overlooked.

I haven't reviewed the patch in detail, but from my point of view,

Acked-by: Matt Roper <matthew.d.roper@intel.com>

on the general direction here.


Matt

> and may introduce bugs rather than helping reviewing:
> 
> 	Wa_12345:tgl[a0,c0)
> 	if (IS_TGL_GRAPHICS_STEP(STEP_A0, STEP_B0)
> 
> One might read the comment, skipping over the condition and thinking
> "ok, we already extended this WA to B* steppings, which doesn't match
> the code.
> 
> 
> > From a slightly different angle - do we expect anyone reviewing
> > workaround patches will cross-check against the tool? Would it be
> > simpler and more efficient that they could just cross-check against the
> > comment output from the tool and put into the patch by the author?
> 
> see above. Someone cross-checking the comment is cross-checking the
> wrong thing. As I said, it happens more on early enabling of a platform.
> 
> > And point here to stress out is that accidental logic errors (missed
> > workarounds) can be super expensive to debug in the field. Sometimes it
> > can literally take _months_ for sporadic and hard to reproduce issues to
> > get debugged, handed over between the teams, etc. So any way in which we
> > can influence the likelyhood of that happening is something to weigh
> > carefully.
> 
> yes, that's why I want to remove the comments: from my experience they
> are more a source of bugs rather than helping.
> 
> > Secondary but also important - if i915 is end of line then an extra why
> > we want to rip out this for ancient platforms. Is the cost/benefit
> > positive there?
> 
> yep, here I agree and was my argument about using the platform names
> rather than a more "catch all" regex. I think doing this only for tgl+
> platforms or even dg2+ would be ok.
> 
> > As a side note, and going back to the question of what the tool can
> > output. Long time ago I had an idea where we could improve all this by
> > making it completely data-driven. Have the WA database inspecting tool
> > output a table which could be directly pasted into code and interpreted
> > by i915.
> > 
> > For reference look at intel_workarounds_table.h in
> > https://patchwork.freedesktop.org/patch/399377/?series=83580&rev=3 and
> > see what you thing. That was just a sketch of the idea, not complete,
> > and yes, i915 end of life point makes it moot.
> 
> now that xe is announced I can talk about this part... this was more
> or less what I implemented in xe: it's a table with
> "register + condition + action". There are the most common condition
> checks builtin + a function hook for the more advanced ones. During
> binding the driver walks the table and coalesces the entries creating
> a per-register value that can be used at the proper times, depending if
> they are gt, engine, context workarounds.
> 
> Lucas De Marchi
> 
> > 
> > Regards,
> > 
> > Tvrtko

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
