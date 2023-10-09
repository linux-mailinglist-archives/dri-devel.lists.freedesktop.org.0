Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998D7BE6AA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 18:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7ED10E12C;
	Mon,  9 Oct 2023 16:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AF110E11F;
 Mon,  9 Oct 2023 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696869493; x=1728405493;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vOVdywe+73U6renY6kpDc7fi1ouPeTCaX3AfNcE0RwY=;
 b=On8dB0iC5t8tncUOBd8kdKvBjEePAH1mqFDsOzbWcGfvWrDeQzVFlaDi
 TjdufDt8OQzyUaLM0fdbQ9H4Fktwc/thATsjeaeWhP72PqxSn8v5PZ/u3
 OBV3voO6EfAK0kuXTafsjhY7oBeRbydgADWVJtLMGqLdgny0IzQFiOLC1
 KGMNYKmhQLOlmI1sCYcQlrO8j3fnYTDpAP8UkmfVkGEt3GrmQCEy0RxIw
 keDzNbz4jmr4ijMFqSaCEZSXFaJMVCbcPDYoMNdzr0NV8T6EcdtlpV/d7
 GUw8DTO0N+juKZRH4WQAe6/V01K2fiqKH+K/C97K4y/rwVa283jfadfz0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="415177558"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="415177558"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 09:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="746740006"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="746740006"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 09:38:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 09:38:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 09:38:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 09:38:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 09:38:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VG/PVhUe89A2Er4NhvW7yADez4kzqhrB5kxNZn28rO+GPJATIxH/v4KkT/+QhBPZk76b788wb0jQLKG9Uyxwi0GoOhKPGcjgrJKy1Y/9JEXURczh9mymqLVE8AsT3haNrE83VwkH/T5A3RZlYCJACzgcr6JEQtuIEtDczPhiOm7+d8ygYTGEqMBwePW0YWb6yej7Z+6QTJnHZ1mYgL5LcBt9B/cOItd/6ZblAYdKFX3Az5IDvZQVl37xTBFr4UbsuNanay7lR+I+WczBDGGXM/xjBVleQyYqx1OF9n7K0JvcaPPqYuc0iUhVIBo5hDcANoRUaw74pXwz+2fClbpyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54z29y+ju3UHLLlcREashwpZzCbkEPTWbeWwsk8E3ho=;
 b=kQu82k6ASEmOsrB7dI9ZAjGFEQjbxFjXiszFd/zky6/9UDD7aAgP4XhWG8/uylFuJtwW/CVAvRyTONnMcwlpVK8yVWl4Ab6ZKotp1mTPGsUmwi6qnDojLNEKNetI2IvgV3+HgTKR1i5ngUGWwjmxT2gLmbvmMD7i4gJxijPTXPJe86AFTOdQy9rgcIimvOggtGCwHhq9MNbGFtHNkIvTERCwy1j/SN0eI4B8jSyizL744tkqgNHFaHsecIGpEeWUHlzyVMbwqTPYQJmPo21AfGJ1yrdCvuPiG+dpW1yJDPew/Bxc7kP24Yjp79GGlOWX0evX7gVy52fwaNIsrWPg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8273.namprd11.prod.outlook.com (2603:10b6:510:1ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 16:38:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 16:38:08 +0000
Date: Mon, 9 Oct 2023 12:38:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] drm/i915/uapi: fix doc typos
Message-ID: <ZSQsakKWN0/zSdbB@intel.com>
References: <20231008214942.28439-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231008214942.28439-1-rdunlap@infradead.org>
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: b419c666-c300-47dc-f7c1-08dbc8e61e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1blZ5aniftJ6ZEeHdAYwXKHC+oYBQgt8I+uRe/TJjgEKv1r89BWD3tPbOPZ2tmtFZkbzx5wJDENXs1BhfVmE9Ozjz5jK9Dr5spPqRBvJGmx9fiFu8JhSa1qhZHwukFrwK7kqACsFDsAhZ8BqV1QgvLDlCuhc/cqE95P2kagbW0ReaxEYwLknCyTZwU4TjLzQhsp+WqRd2NBScsPhyYyDraWg74Z2K6uJKzJk+Y2Zz/8ck3zYtBBhpP5aWAeHePHYMWSuIIyt0DzAvjR4n+E9PIA9TeFPUBfhjZF6lyDPdUqOjsK11rl0E6p7N3fMbNXxhUqNn4QI0zYsmwL0WZNF2WOPZiRD28ZGfAKFDHiop1ET7G1lIEDxVDuwdBEPFv3z6ELsH8WYuc863wvtsICbrcwyvAA9yLpTdyXX837Dy7wF0z0ww9soB3Nzi6+oqiqZl5RAwzTUsKcUA7IG3908Chmiq/jVVMUT+in6b+2MpotNSVLq2pavw8D79aRG72UL5mgHYFkxSQVkIIiR5dFDQFeF8vJfgZ4GVAyAOuP2FbTV/BiiF4F97r6gl0qy97Qj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38100700002)(86362001)(82960400001)(36756003)(2906002)(6512007)(6486002)(478600001)(41300700001)(8676002)(4326008)(5660300002)(44832011)(6506007)(8936002)(6666004)(83380400001)(316002)(2616005)(66476007)(66556008)(66946007)(7416002)(6916009)(54906003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jaKzmZ+NCnnyaj6gXarYc2M+/L16qmID21hojvbrReEy4EVVKXiMc8Tc2b?=
 =?iso-8859-1?Q?NtT0mcROHVroUwHdSnSQZTLSBsTKMQ6/H+7JxEP32GGrCPS0SfW+bVCQ2R?=
 =?iso-8859-1?Q?P+7ushk5O4CzA57mQ8cw6ei9TQbpJIf5Q80upwWbomFTvJPA7WAEbuIfVn?=
 =?iso-8859-1?Q?AxiD468HUsx/B7S7LWyzZGlc4yFvpfG9phvgF3AOcH5w2qAYp0h7Uji2JG?=
 =?iso-8859-1?Q?gVsy/KOfoqm8nEQy6OkUr3NaJqS4sRo4NTlY19jfSawNIp5IgjfRWQTsbS?=
 =?iso-8859-1?Q?wQeJ8nwnUvyU7Hg96AkyP0RRnrcxqLN7OTCu0wUO2W1PpjEPDchypzZf0k?=
 =?iso-8859-1?Q?TYJIDUPkFskVfwa/uAuGvOifV0QYe2yx8onrrjWgaS+p8qVYctpa9vF8yU?=
 =?iso-8859-1?Q?HwqlBuq2m8MbYlH+MCUovbSyjusapJWrBl6uBN/Pw1UJuD6mZgOL5n3kDi?=
 =?iso-8859-1?Q?hkzaR5RumuT+oaqtr7cevhHp75JrGalOq4+mThnIQlub28tpTv0bkoI1wo?=
 =?iso-8859-1?Q?gzDWtXA2vZTwRTh1Ss05BdlvsGfXdQkvlsEb8huriC5xiKqW0x5pPvs2LN?=
 =?iso-8859-1?Q?b/HhtjsJitI8rYdKnB5DouPMML6NJp81emDr1ouxZo0p3YQcPHwSyJrhWv?=
 =?iso-8859-1?Q?+mL6w87RwnDc7nNfSBVcUuOI866JI2nhSLZuGk3J0wwGVp7hMkM37s1FuL?=
 =?iso-8859-1?Q?sMgxKG6UTNj0EodMGEZxULbxCPrEQjAxLj6Ssh2hrfKeYvJ9iNo0USBx5J?=
 =?iso-8859-1?Q?S2v0coek/tawov+CbaZiUPX40e3hF0TIRFlrIOgaocIwGFJM9G/EWJQFdJ?=
 =?iso-8859-1?Q?QA/Br6EHLU1F/EBq7JSu4PpISiVZhwBwhEE/KnvjTG3Mnlrrd/34x2L7Uq?=
 =?iso-8859-1?Q?TmbNXnTKEYtUlM41TfzFbrCJ5NfVxwy4wkHJKzamgMizlQakmiAGnWfvbR?=
 =?iso-8859-1?Q?A24tm61kTF5ZC0CbIRJlXfQ1liPqYB73xjuVUTvGvhIBuYQVs1j0dFT4N7?=
 =?iso-8859-1?Q?WT99/JtsFCRPVQZMOGen3LQO7aOLn4tT6h95wihaivcfW/w0H1yTfnLFkY?=
 =?iso-8859-1?Q?6HUPVM3xCyr5VflkiaETodkQa0a9oqaFQvue4+aVtU3EU3MQiCXFg1CLFx?=
 =?iso-8859-1?Q?IvCv2f64lJYkS2uTeOpo+u6ik22sppK4nVx7sIjd2Eff5RHMIKr1mQdivi?=
 =?iso-8859-1?Q?4WVseG+auGXPWKzZGjBpZQ5zWLR1tWE+O34V+NAaU63EA8pkofhGRsL42f?=
 =?iso-8859-1?Q?Cg02HTbSM3qWMHuHu5BSzMFBBCxjW92RJhsivIZ+QpZ1MRKlWYw1deXS7T?=
 =?iso-8859-1?Q?7R7UII8sX4Q2h/cNtE4Wb6UIpHMETZODZP5upYLMn6Cffw4rb6xDV9sqGx?=
 =?iso-8859-1?Q?HEJzIuL0Yr+Dw7wUqRr+iFU1YKj4GWJNZwxEpgTaKATE6ck1L6d7k2v+Eb?=
 =?iso-8859-1?Q?tOob/IIi3w5cgypdsDB0OqLCWYl/Z03yUIynhPzDJi0AS27nh0m8dLvm/e?=
 =?iso-8859-1?Q?9qZJW35UXa3i1QobylITF+NU4eObrA3aGvs7hMOqbZqqRNjce18oLs6rjC?=
 =?iso-8859-1?Q?LBtcQy7/cUSjlTiTYE6hXyJo35R3qs7JMCi1EztnTe+Y28c3KjcqjK6Jd7?=
 =?iso-8859-1?Q?kcRJCQo4S64fXOFYCE2sJEFa3n1k3Q8Ufi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b419c666-c300-47dc-f7c1-08dbc8e61e73
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 16:38:08.4412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxegsHYdo6y+OPCn4DFuOwltR4e/ZbcQRvk9JGD33REpJetRsLkrKSz3rZOq9WXxTwTkGAyCyRZBTAwInvln+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8273
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
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 08, 2023 at 02:49:40PM -0700, Randy Dunlap wrote:
> Correct typo of "its".
> Add commas for clarity.
> Capitalize L3.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed, thanks for the patch

> ---
> v2: capitalize L3, add another comma for clarity (Ville)
> 
>  include/uapi/drm/i915_drm.h |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff -- a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -38,13 +38,13 @@ extern "C" {
>   */
>  
>  /**
> - * DOC: uevents generated by i915 on it's device node
> + * DOC: uevents generated by i915 on its device node
>   *
>   * I915_L3_PARITY_UEVENT - Generated when the driver receives a parity mismatch
> - *	event from the gpu l3 cache. Additional information supplied is ROW,
> + *	event from the GPU L3 cache. Additional information supplied is ROW,
>   *	BANK, SUBBANK, SLICE of the affected cacheline. Userspace should keep
> - *	track of these events and if a specific cache-line seems to have a
> - *	persistent error remap it with the l3 remapping tool supplied in
> + *	track of these events, and if a specific cache-line seems to have a
> + *	persistent error, remap it with the L3 remapping tool supplied in
>   *	intel-gpu-tools.  The value supplied with the event is always 1.
>   *
>   * I915_ERROR_UEVENT - Generated upon error detection, currently only via
