Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F373BBFA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791D710E666;
	Fri, 23 Jun 2023 15:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CD810E666;
 Fri, 23 Jun 2023 15:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687535358; x=1719071358;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f1vtJUWn5GkrrciCQgPzyLnhU6Q134IlVZdSLsRGeNE=;
 b=j9CPxVHUlkmNk5BHvqeIBVDtovbnVJWiw1HQwQwBVwIED0hyYHli7daT
 DKUcT2W01Q77Q2EWLC82sJJHzYa9eP7qvQNhtQ3bka55otM1kYw6YqXO0
 wmJq3jXi1vHH3o7PNELkkBlG1/YG0a2Pj78YqkGoMNMdDAta+U61VudlI
 zcValizo4/KvyVeQ+mz1+hcSgUNbRIAg6huWrQlkc2eLK9Hu+NeX9cbz0
 4QuJNCbNF13O7tZ8Zm5eYwbZ21RLp3LC5urRs6JnBjK+t3yvK047fHz7G
 RD3Tf/HSLy0i9IPSRhEFFq+DhXBOqkr1i62ZdRKRhPPF68P8jppe5R85P A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="340386968"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; d="scan'208";a="340386968"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 08:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="961996992"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; d="scan'208";a="961996992"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 23 Jun 2023 08:49:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 23 Jun 2023 08:49:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 23 Jun 2023 08:49:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 23 Jun 2023 08:49:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 23 Jun 2023 08:49:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGgFIgJs1Xsx2aPb6scqHllvMes4tCr4tih6IYIAssU/YMpcS+hJDCK93aeNeb+jJZ+73oTWe5s0arNrz65gbqA6YnEQrpFfd0eK5CkBSf7jjsQW6VehSnAcOZHWEkJNhzmOXOMxx2RmCrVOk0GcTIB894O0iQOwsJM3/9dVDN6BtsRD6Ha61OvitTvh2sLucuU959B1JeKjVflWv4C/4x3cEqm7ZeId22xtKxNU5mfYWRp1UfkVwnPudpb4ej80MoDdoDyTr8yis+32GX3RVJPNOWEryVdEsthcjDU3V6YKjiT+AG6S2q8Jq81uupAlgXNFGSWUAsQusKoX9BGAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jU+wMIXZ3DV8c4GEkCXPxzLXXDZpVA6XfCceWcMS7s=;
 b=P56tQaSdZsbO9V9VJt2IP0WXPlCwGziHZg8yBOWGZdUFizcAKLb6Z0E+VUIqUOjnIEXyIEjm9ZRDrY8dwgYc9RuEMLHnHVoSyYL/of4M9tuHnxgd+TQXvcTMHVnNiRWkFzdpX+9+r41MeOr4Gn0LmsZCTA6QhjWlk38jY/El1/j9J726JE8cdabrHskYbz91mEzFDZnglqDBUQBx7jTUrPuhBnkg9jX6hv/LCTOTXLbX3zaFQ4V3EF3aFVB/L9o6YYPbJPZ7XXdNGySVFrRNq35FksfvDFgl9FjuiBzTP+MzlmUN2GzpCGSTRNc+4xs7C5UaJxOC4sJKw31WcbpN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7212.namprd11.prod.outlook.com (2603:10b6:208:43e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 15:49:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Fri, 23 Jun 2023
 15:49:08 +0000
Date: Fri, 23 Jun 2023 08:49:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kenneth Graunke <kenneth@whitecape.org>
Subject: Re: [PATCH 2/3] drm/i915/gt: Fix context workarounds with non-masked
 regs
Message-ID: <ehp36knxqfilobajjyk54oamk3n43s3cja5webx3q4jzm6xrlm@idrattdnr3fa>
X-Patchwork-Hint: comment
References: <20230622182731.3765039-1-lucas.demarchi@intel.com>
 <20230622182731.3765039-2-lucas.demarchi@intel.com>
 <3337022.2OMYdDKdcH@mizzik>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3337022.2OMYdDKdcH@mizzik>
X-ClientProxiedBy: MW4PR03CA0330.namprd03.prod.outlook.com
 (2603:10b6:303:dd::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b40465-9a50-405e-ea6e-08db7401616b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZspaTnhT7sH6WHgCVosHOHDXE34fEuJK3FEcHBZ1pz/mQmT5zgCxqzvWBBw5oAQMnq9RY8h2QLbrNuNVub9huoPMxODeDqjyJHffAF5XZsImkRAHFXpe9pIf8rHNBE9YthPXswVHiiJjvQNvAbp1RAcL1lTSk9N86XRnLt+L5eVKRT8Vr9lCmSPHSXs6vC27yVhN3g4/Eg+f2iEkhPmKz0XuLLBNa5XR1WTuigUMX95OBCUZaSCdQeF4HTfCe1RD/8V9CZPUnn7kuF7z9KAnUXUn1tw7yZLITu7ZLCAgYgRo3rNAX0cz/30Zz4frmKBTEbUQmCOlpRZKuCg04Eilbc8gYoGc3h8FxLLjanVJLZx+yV3O0iZ9wNIAjvQCA9hmAvtaj+jQm93bifeQw1SlyO9TAw2oagWCoBVsGycx25oLXd+Kd3oyBpK10E+GDfhMe/1m3axn8U+GTksoxgPUpDHlUgkspLIiLPTvTp0FytSkojIhCqGMb5WV3U+uHScKtR8lih0W7P9+KDjK0q6DO2szdjfvUpymxQuPD+vghDgNVgdRnBx9hZT1O7iBOKaX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(33716001)(478600001)(86362001)(41300700001)(8936002)(6916009)(66946007)(66556008)(66476007)(316002)(8676002)(83380400001)(5660300002)(6486002)(6506007)(6666004)(6512007)(2906002)(4326008)(186003)(9686003)(26005)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1uRDwALj/XX7cfPjqIODz6BDffHz9X33j5NF9Sbo297ViJPvA98BlS+QwW07?=
 =?us-ascii?Q?D2nG/Dk0+ZSWaLrFbO22E2s9C3frU8D4fwN9q+G4MRYuxRk8AuQs6WxkKxro?=
 =?us-ascii?Q?YItPbCW2MRzgpNm0dP6495tVo4jWFqJ35pKnRXtbLhYctdiDyF/7ud265KYg?=
 =?us-ascii?Q?FMw9XCdIzWZTwiNfjcePdEpLMmwrTP44iVKTfKLnAIzq9gLqWv85V5fd68ho?=
 =?us-ascii?Q?XBA50Y5A/5lTryPjxZg+Xm63t7WLOnyxwdxRkkph+fX10sDJ6F44HOyZTKsS?=
 =?us-ascii?Q?JCA5Tn9wOmVsiyYqSP+RcJyRfsao7lw0XyI1o3tGtwPod60B9ojU2ZjAf7Z2?=
 =?us-ascii?Q?W29cLwuj59O/yD00UIDGAi3FeTHIZmuZGsPyK9FloeiwteiWwtTrtKbB0WDR?=
 =?us-ascii?Q?CfixdLrVhzmZwdyQSi3VYAa2RtyrCUCoK1QJE9WshW1PH+hMYGlk7KD9624i?=
 =?us-ascii?Q?vjlk0eTBe750u1Otjd26Gry1/fCSyOimfxWGSgULSCKvKIoZoKlCta2WH2lw?=
 =?us-ascii?Q?avRRKQXactmAcdWRyaDDK+mcNuwxNwjYobEGdBpYejFgHQuRk0B0z2HokP++?=
 =?us-ascii?Q?uCcFHoWPguo9PuTTyPjC/NveeWbxPni7RZGHFfa0CjvP9VyMsHSGSl5EjsaC?=
 =?us-ascii?Q?ld7mBb+SgRa2gcv1LXx9wu7AfBRaHrumPNSMPiM+RcDzAG9X/+jbgdvSruFu?=
 =?us-ascii?Q?K/VpcVmf6BhxWMnELPg3+zuQRMU3hsPfZBVafsThupeL8isv3US2zFMBd3BC?=
 =?us-ascii?Q?jrYGD7ETV4ziIVZCqhFJORayDWkV1QAzoBKYy6rYg/rOk9DdDGDZiIxsjLIR?=
 =?us-ascii?Q?OH7Q0R6ngFGLPfi58f8lfTY+2odBduXoeQ2XMYfW3qvHfgvNbTV/xdGeApdK?=
 =?us-ascii?Q?hstBvtaTR33ztXxjXZyrFU12HSwwuXy3AirMrs7yrEmb+GsJnPh0kTCfQeVP?=
 =?us-ascii?Q?cboNA/FTRL+bEQcCjkQhBnFJre0NNgaH+Ffn/8P1e5dji6Eum8bQc05aC09B?=
 =?us-ascii?Q?YnmAHPFMPKHO9yVYfKL9vHGMbEU6a8mGQuRYzINne22zfUFaaMPVTfyAt9Ze?=
 =?us-ascii?Q?K1KeVvngBFAKKZytAKThBVfPfP5yIg5BoJ20OL56bxpKs2nRX6N2B/XtSP+f?=
 =?us-ascii?Q?BBKzPBW82J9xVExMvpNJPnjsnPsCt3ArH5Xw3V3SYR1PC05WIP+qqt1SMHLF?=
 =?us-ascii?Q?plLUEwiqXoWvcUOpXS72EhJ5hK6tB9aHpO9iHBT/ogn7n7EjeltU1G4V8Yji?=
 =?us-ascii?Q?fL/0w/sfGFVdYRW06v3AW4ON8rxW7OxQFkdNio3O+tQKS8zv8w+8RVOAmRoT?=
 =?us-ascii?Q?6Mb1yLWcHO0CNBZSuO1/017X5rifCl2z6Q7S+TLPrbRDqXOlc+KVyN2Uw108?=
 =?us-ascii?Q?fepNAQrRdEtP05WluKBaOj6ROvCA92oZm4w7pPTiJAKX6NOz0sWRLOUm+LBN?=
 =?us-ascii?Q?nGQIf5kLoHgRXPSmarIa0mGKKR1KEFIypODr2c5lfjrhdNrLntQ1EdWMP2LL?=
 =?us-ascii?Q?DsGMRduP0jOGWQ2WN1wS+nCllVhU2pTVLRZc1aQi+QySq8ydWIArDoAkBiRz?=
 =?us-ascii?Q?D0CA56AwRQGGoVByo1OSBbCG9LRJGhHawZSw+P51ctbedcZRS6FBgBJ+Pz9H?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b40465-9a50-405e-ea6e-08db7401616b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 15:49:08.3355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYgPjvE5CrURip8YDQnYCMvCouRYFoQijqtluJJjRp7ZccVRXPaVl7WeuXgxdUFPB9FXIXgeeEec+lMEvMACxvMonQZvtpgjGx8fzCDHQZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7212
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
Cc: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 04:37:21PM -0700, Kenneth Graunke wrote:
>On Thursday, June 22, 2023 11:27:30 AM PDT Lucas De Marchi wrote:
>> Most of the context workarounds tweak masked registers, but not all. For
>> masked registers, when writing the value it's sufficient to just write
>> the wa->set_bits since that will take care of both the clr and set bits
>> as well as not overwriting other bits.
>>
>> However there are some workarounds, the registers are non-masked. Up
>> until now the driver was simply emitting a MI_LOAD_REGISTER_IMM with the
>> set_bits to program the register via the GPU in the WA bb. This has the
>> side effect of overwriting the content of the register outside of bits
>> that should be set and also doesn't handle the bits that should be
>> cleared.
>>
>> Kenneth reported that on DG2, mesa was seeing a weird behavior due to
>> the kernel programming of L3SQCREG5 in dg2_ctx_gt_tuning_init(). With
>> the GPU idle, that register could be read via intel_reg as 0x00e001ff,
>> but during a 3D workload it would change to 0x0000007f. So the
>> programming of that tuning was affecting more than the bits in
>> L3_PWM_TIMER_INIT_VAL_MASK. Matt Roper noticed the lack of rmw for the
>> context workarounds due to the use of MI_LOAD_REGISTER_IMM.
>>
>> So, for registers that are not masked, read its value via mmio, modify
>> and then set it in the buffer to be written by the GPU. This should take
>> care in a simple way of programming just the bits required by the
>> tuning/workaround. If in future there are registers that involved that
>> can't be read by the CPU, a more complex approach may be required like
>> a) issuing additional instructions to read and modify; or b) scan the
>> golden context and patch it in place before saving it; or something
>> else. But for now this should suffice.
>>
>> Scanning the context workarounds for all platforms, these are the
>> impacted ones with the respective registers
>>
>> 	mtl: DRAW_WATERMARK
>> 	mtl/dg2: XEHP_L3SQCREG5, XEHP_FF_MODE2
>> 	gen12: GEN12_FF_MODE2
>
>Speaking of GEN12_FF_MODE2...there's a big scary comment above that
>workaround write which says that register "will return the wrong value
>when read."  I think with this patch, we'll start doing a RMW cycle for
>the register, which could mix in some of this "wrong value".  The
>comment mentions that the intention is to write the whole register,
>as the default value is 0 for all fields.

Good point. That also means we don't need to backport this patch to
stable kernel to any gen12, since overwritting the other bits is
actually the intended behavior.

>
>Maybe what we want to do is change gen12_ctx_gt_tuning_init to do
>
>    wa_write(wal, GEN12_FF_MODE2, FF_MODE2_TDS_TIMER_128);
>
>so it has a clear mask of ~0 instead of FF_MODE2_TDS_TIMER_MASK, and

In order to ignore read back when verifying, we would still need to use
wa_add(), but changing the mask. We don't have a wa_write() that ends up
with { .clr = ~0, .read_mask = 0 }.

	wa_add(wal,
	       GEN12_FF_MODE2,
	       ~0, FF_MODE2_TDS_TIMER_128,
	       0, false);


>then in this patch update your condition below from
>
>+		if (wa->masked_reg || wa->set == U32_MAX) {
>
>to
>
>+		if (wa->masked_reg || wa->set == U32_MAX || wa->clear == U32_MAX) {

yeah... and maybe also warn if wa->read is 0, which means it's one
of the registers we can't/shouldn't read from the CPU.

>
>because if we're clearing all bits then we don't care about doing a
>read-modify-write either.

thanks
Lucas De Marchi

>
>--Ken


