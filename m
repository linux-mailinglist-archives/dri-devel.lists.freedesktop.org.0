Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC645B5F1E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 19:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AC910E1B3;
	Mon, 12 Sep 2022 17:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D3610E1B2;
 Mon, 12 Sep 2022 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663003162; x=1694539162;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B1eYrGmza941Es8Ptg1eOzS/GZDvSllr4K9x63V2mPA=;
 b=L+CmdNbBkfgNn7ncp4/D2QdRdfnTP2Ce/yHkc3xx0d4DbIuW4ZjEvtjz
 Kvy6My/TbvFXVRx9T39SP6GXFurgIZQZhf20miu1k84zBDI+WLy/8apSa
 OQritLKVr0lG5zofijf82v6SLlWY9248eUkBlEdg2us70zHPX0iGA9oD9
 /XiP7omjpbwviOmQf/mNoIiX98b0kBAOfULCJ+IjrCmLUBlqkdiYMOINl
 u5WGfyPOyto/UUX5mE3S2OiB4fkoCGK695bB7G0kUsRcI+jENiiIDfKtg
 AkP06tyvXjDIWcu0vOIk+r4KJQXPQBIMX+ymflwsq5aGqTgy09+kTYYYQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="284943905"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="284943905"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 10:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="649336509"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 12 Sep 2022 10:19:21 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 10:19:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 12 Sep 2022 10:19:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 12 Sep 2022 10:19:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoanPlzMV1llfbJX+9jhXUrIQooUza5NSyNN2t3ScHWgu4Z1cdYbZC5QaDOiYMK/2X/i5YOBu2SuDx6BR2daZmtq5QZwuxm9Kv9+OE7RsFLA8gjrnC982SLbMMQ7r2gwhSv//J1oMN+jXjHpp2ez/XUt91VY5/B9Ldj6iXURcnEYY6bh1GyF315917LFP5YSnBb/xTR4JvNIMKn6eabFABfgwQxySA8PWDuK107+9NrJQ4q1htUlZOpHINM0JVzY8N8M4Byw31lMMCxRBqed18hlI4LULei+fIJBu5Y/lKfK077qpMYZMJHV5QbTuMZ3dYcWQcOt5bMuLUjExf/3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZONWdsIFNZoFvZJc38R+FmMra4O/xflVUscOXTrn+48=;
 b=aHJRxSSVer+KAdmJJHzncYeTT34mJ7rkBy4Gy4N4+WD99mkqOx4qe6teM+LDJL2Wk4FY4rxdyiWqHnjrMGLlgxWOmMTwtjcjbfDDiPKFJOymtb+cVUGazENiIFqdxE3qlFYaZClR20uVerA/av5fNHcebmo3YUIIa6mwmHS4QqAqtpnBVnWmB7veSQ9oayetCc+zS3e1qWOhrLuhjSwdM7BlGue5RxkuONtdsCRJgJCSgKggjOMfgKqXi2JsC0xE7EZOtpaIYWCSQPy6x/wSU7h1xxlm63ULQ3uzjrroIkw99+gU47eWWGRieOomgHi5kz0m0uFAIiBVOY2iHpVj+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 17:19:08 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5612.022; Mon, 12 Sep
 2022 17:19:08 +0000
Date: Mon, 12 Sep 2022 10:19:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 19/37] drm/i915: stop using kernel-doc markups for
 something else
Message-ID: <Yx9qCCmxnSM06CgH@mdroper-desk1.amr.corp.intel.com>
References: <cover.1662708705.git.mchehab@kernel.org>
 <6405f00c4ba03987abf7635f4c62d86b40a0e521.1662708705.git.mchehab@kernel.org>
 <Yx9LxciaH/y8fnRD@mdroper-desk1.amr.corp.intel.com>
 <20220912184756.61492ad1@coco.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220912184756.61492ad1@coco.lan>
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|BL3PR11MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a06d1a-5efb-43ca-390d-08da94e2e673
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xEjwuHMFTA9jqLrnmFM8Zr0bbUi7qM3C5PtFHantwqCCzbjlxf5N0mTdRC7Fg8f9iMTGqAphv7pRZ1Q2+ed2NyA52gB+4lb8lYSU7jMjB2FjpcsbwuAIDiU1txJLoZ9zzBlj7UGGM3cqOg79WTiRzGX0NFFbxjVKiN5v2YHUsPr3PJcFhxT8p6XrF6Syx+Le4rthCMLM27h3N3PT5B21M+c/4ZR7hsemJGQixl744WbbC8lY8+g46opb8XXIMze8k5ew3MINtFhk1HZjcxUlvUr/tZeDm5ju/Wi5dzh9PqPPmcYxY0ZooJis2VJZS4YNeImbbICW78hVSt3376ZuVsHCG/xmiQN6vjnVWTDh2CbAjpC7Lr1nMDyVNdTRfD0Zv+96mXQDa2ZHI8ZpOfzz6jVvmsLdv/+kbVmyniu4ppMw9MLy/acVlQ2Y7lT5I7RHqP4LlWMqHkpsoRuyYDSyGVJnUC3y/SsWPxZkb096zW+oSWLSvmEMN4r9K/5EfZyiJjSETDLCqQ2lYmKz67IL/LyxzBmtobsMBG6KBy0fEdJLXK3gft0BDZa55XSNHCTbinYQ0ug3KzqZrrD7GyXERB7LK45tiR0D34SZhw/u7FvvR5BmLaJsXyNR1RyxAmHmlnyNjM45B+IYyNonq7xHmqVkg0V4BkVMjXVcZAQ7J9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230019)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199012)(41300700001)(82960400001)(6486002)(6506007)(966005)(478600001)(26005)(4326008)(66556008)(66946007)(38100700002)(8936002)(5660300002)(7416002)(2906002)(186003)(6512007)(83380400001)(86362001)(6666004)(66476007)(8676002)(54906003)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wCogdo0EZpV7p+kwaxMkMv3VqzTyN1d4xWyBIC9kZFfh4KWLXculjPhUAZXX?=
 =?us-ascii?Q?1So6ZcA2gUkSKQOSkmKY+nGvoYykjYdbTnUtUfQhd/pZ5GQwEM7a+Uqrvrpx?=
 =?us-ascii?Q?Cj6m2JI0s5w7Ag3H0fOI633cK98bdKikuQooWpZpeeHfu+0FwJqBsiVzrXT+?=
 =?us-ascii?Q?H7tpXS4BblqEmh22r4WBDn0MT1xxvC2CWOAIRWU/jFaEpcFNYhuopaTaYKWU?=
 =?us-ascii?Q?9GUp9bfubfy7fSOqRavWpnKiyM0sckgFQjtD+kHCkJAvPtodSZZ2HheSTgRA?=
 =?us-ascii?Q?6qapfDUbpZVLUSxAMcZ4JnqtnWyrTeDgpy+edT1Tc5RKC2xSlNRtOTRS1+4F?=
 =?us-ascii?Q?I2QiGJj5yHbUIBeG5paW+OwODmcPkFY3XkcC8Q1YzRVJT8xbBZYNLYvtV6fs?=
 =?us-ascii?Q?IzoSnUMRYfIGOW5jlbvg51WhrrUzSpcnL3IRDcWI0Cj1Ak6lEomlDMCk4KAN?=
 =?us-ascii?Q?fotN5FPMOT3bfL7vJ20YD0CPDdYgd7d2q2VCnl1BhISltngaFnj+Zmidx4iv?=
 =?us-ascii?Q?0/lnYakeuKy0o/7GzgoY5vEHTvUfxo8ZYAlyv5JnzQqVcLC69V0EihtWr3pE?=
 =?us-ascii?Q?yoOBQ0TJLsZiYvFQpa3StscWoUAQPAAYzBtNIsg22UoYcAaFU4Glikm5FLoZ?=
 =?us-ascii?Q?pnf4v8ufKeaQBP6b5e6mFevhWk1thw1QHfTrwSCY5wUvB+dYrNDIjaG9fiU8?=
 =?us-ascii?Q?vlXe3umMWROdmXSQ3duzpqKrzvnutkhxV5zDKmbOMo7rtfaoHNLOTIUzd3ro?=
 =?us-ascii?Q?Lcev3MZ6auLYMXst5pQjyDK4OMkMyNOm4Gn+J/E1jteDWnY4JXo11ldRrJYT?=
 =?us-ascii?Q?GRL7UWKrv6+HLW59jEBdPrn3sZkKNlmTXqIv0QJbQ2+KeyS2R4Sv7N+WklRE?=
 =?us-ascii?Q?MZJiuJCvOEyb1xY6QD9BnN024QEcNF/5LY1W5y5mruMnrh36kAWp3yYJPJ9O?=
 =?us-ascii?Q?aR+sMCKfIrLNnnlzyzxEJkYkMCeVUxIsBfVq6G1FSu6rM2DtPTbpaXxJOQAC?=
 =?us-ascii?Q?s5QF/xVyD3NU0Cmwjf6WY3iEH5jNro6cwRrU0SdS3ZMlY182HUK3I64S3mSa?=
 =?us-ascii?Q?q5dGFgDzTP5BiuYVAJJwIVsLRLP0EhNZUEzwS175Ua7ajrdmlvJxKkOFakYn?=
 =?us-ascii?Q?I/9GQnqMBCWzRUPpueHuYfqRR3jfUaDSmzrnXsMpt2mDRdZVjzY2b9TjbB2Y?=
 =?us-ascii?Q?+21ROCzv+FIg0qFikmSYO5KzeKjazREDew66Kn+UAqa+BX73q+qtXqpJyZdq?=
 =?us-ascii?Q?3RtyZEJDgpqTdZo93MK+kUjW8aTxa4HoEkTT8YnEtAFXRT92wV01KSnl9YTA?=
 =?us-ascii?Q?9FGGheKSYjL7yLaVVn8sKBywn21s2wFQf9GvSNbp+FZ2Ro9a9TPd6BIWNalz?=
 =?us-ascii?Q?+p8vESbgZ2CG0XiiCtRaQpbkNwz6ngZ7M9NUb6RvHDdf31Ko/YPFb2oq1kbu?=
 =?us-ascii?Q?1nS+aWa8QWjalrlmQR592u1jPu9WhUyeqUrVCC6oWu8JXRxr0h6CQHpWy8EM?=
 =?us-ascii?Q?yn9LpFuD1Oem5gXP8OTYUJe2BskPndMR/HV7TSfP2J7Jd+xsJQpDgpYFLAL2?=
 =?us-ascii?Q?IEGu/LGSxzLd0osl+YMxc54h7Z+/C3pN30jhsQzSE24YhFbE2xlMIZJz8F3S?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a06d1a-5efb-43ca-390d-08da94e2e673
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 17:19:07.8833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTkb5ExnHK2IaUd1k68WJEuB8pHzuSdUf7nOdrZr/uUOx/eQSC0NqUUAnXdvYShyex2k+oUFrhfAhICOyXE08+wk9YvxZUGm4V+uKhd/bW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Matthew
 Brost <matthew.brost@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 06:47:56PM +0200, Mauro Carvalho Chehab wrote:
> Hi Matt,
> 
> Em Mon, 12 Sep 2022 08:09:57 -0700
> Matt Roper <matthew.d.roper@intel.com> escreveu:
> 
> > > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h  
> > 
> > Several of the comments in this file do appear to be kerneldoc (in fact
> > kerneldoc that was specifically requested during code review at
> > https://patchwork.freedesktop.org/patch/448456/#comment_804252) and this
> > file is included from Documentation/gpu/i915.rst, so I think some of
> > these changes might be moving in the wrong direction.  Should we instead
> > focus on fixing up the comments that aren't quite formatted properly?
> 
> Those *appear* to be kernel-doc markups, but they aren't, because
> the structs themselves are not properly marked. See, for instance
> struct intel_context.
> 
> scripts/kerneldoc will *only* consider what's there as a proper
> comment if you add:
> 
> 	/**
> 	 * struct intel_context - describes an i915 context
> 	 * <add a proper description for it>
> 	 */
> 	struct intel_context {
> 		union {
> 			/** @ref: a kernel object reference */
> 	                struct kref ref; /* no kref_get_unless_zero()! */
> 			/** @rcu: a rcu header */
> 	                struct rcu_head rcu;
> 	        };
> 		...
> 	}
> 
> Describing all fields inside the struct. Just placing
> 	/** something */
> on some random places in the middle doesn't make it a kernel-doc.

Right, what we have today is incomplete/incorrect.  But I think we
should be fixing that by adding the missing documentation on the
structure, rather than giving up and removing the kerneldoc.  The end
goal should be to have proper generated documentation, not just silence
the warnings while leaving the actual output incomplete.


Matt

> 
> If you actually run kernel-doc in Werror mode:
> 
> 	./scripts/kernel-doc -Werror -sphinx-version 2.4.4 drivers/gpu/drm/i915/gt/intel_context_types.h | echo "ERROR!"
> 	ERROR!
> 	drivers/gpu/drm/i915/gt/intel_context_types.h:1: warning: no structured comments found
> 	1 warnings as Errors
> 
> you'll see that this is currently broken.
> 
> Thanks,
> Mauro

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
