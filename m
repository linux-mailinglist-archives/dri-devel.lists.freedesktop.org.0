Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B61758D718
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00791CDC77;
	Tue,  9 Aug 2022 10:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964AFCDC49;
 Tue,  9 Aug 2022 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660039419; x=1691575419;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=guPDW1QSKUx8VI6EKTtbRGoJgGUu7Jbm3L38csn4vPk=;
 b=mwxrJZ925fSzdLff2HegiSc+5ZxfqqdvCvLdcU3jSKQWiVnn7uH110+G
 l30h8cFUBdabEjOZZBH8+qbV8j3/YL/shIvnmEEdDllkFy886u+LIJuFM
 WtFlStH4g+iannpoMNDg+IaaY/Zx9xkDKbM6nLX9WozjT3f2kNqudvWOJ
 k2WXElpki28cLwmOZ1YJZUxMBK1uzBNItGrFmEPMMwo5faJbxBWRphpLN
 bBSigDLrwiOmBsqJcYU3DgywUcHxTq3PRUmcSxDG3re9CQclIf1TftU3n
 +4YzpyBhVD5N5hn9eV8f6tekGr8tW6vyp8sX8JsHloQFhOYJjenpgnKXX A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="273849582"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="273849582"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 03:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="604703648"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 09 Aug 2022 03:03:23 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:03:23 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:03:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 03:03:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 03:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjjphhXVSj7dRN2+T2Q8VZiX+O1eWMPzK9giYHSWMap0ioqZXpnA4uJPJWEuqEM7GLFBGTrw7AMOPPhi5SFdU+RE35D7mG/6qnDfR4Hpo6x3xwfRX3amk1Oren27i2odlsMifASPGSEoUaNjcBGqJ5MszZkrx5bZAHA/YXi9hE2xwf0r+/rYkjLOCEiG/KXxqyskHxiZ05l59Wu1stTVHq4uV2c0UhHt2yAgLjhYjiPfk2tZ9oOF5KCGFimKMJGG1FZ/kSFPTrbmqdL4BPJY+Ji8NBvCDib2USIheIIEvvGN/2pEyv66i0Yd3L87gsJgpPeYbNewb81wxrFv6NnNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kEBDSZPRf4LZPjZZLQal3mWdPso0xFOF1iJoy6f+Yc=;
 b=IZO2vLgyglg3ocbqlMQr6vM7Yf4MHfEczcId8N2OR1yUDvQfiPwaBDoEGK29UeAxlES5TyVJb1N4gpKD/7/0/WOpmkE0GiL40UGtFQ4WYA2O+la1kb1LRIeH87YyqbMLfld8bQc6K+EyCOGd2eQQPqOx7pU1POq8nry38xOP7sDO7oZsI21sIkPoeAqvp8a7z/OT9Oy77O/duQLMjHwb4M7HMcsEpO8p+/WWyvzxv/8PXFKxpWCCijqSL1bnt7d1/xbTrnK1cmKkz/Dbqdbo02sVk/QOb0VCUquu6iXBiy1YA+B7l7wtQUKCAaeFkdfmT2KORPKGh7tBEDW5bbnzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN6PR11MB1393.namprd11.prod.outlook.com (2603:10b6:404:3c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 10:03:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 10:03:19 +0000
Date: Tue, 9 Aug 2022 06:03:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 33/39] docs: gpu: i915.rst: PM: add more
 kernel-doc markups
Message-ID: <YvIw4noyDnG26ejl@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <70a08436861741590c53a807a8b69e8f97f029e8.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <70a08436861741590c53a807a8b69e8f97f029e8.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BY5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6280b19f-40c0-4b06-31ac-08da79ee628a
X-MS-TrafficTypeDiagnostic: BN6PR11MB1393:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GgwuOacUQHbtZ8JAGFLxzdKI94r3/UGU59tMXWUbwkNS9L4wXOjC1awHP7E/MtjfV6/RMUpdNCQ+JJhUMxlMrKlOBM1+KuzlwH/kMe37Ryv2vA3bYbri0J6e4dMY3Thr8TwRpHvtBNouIHmxnwSLLRWJIuYrTF3wUc68g2GmX8KX/OWf27M7VtD1q4yzjC8hwG95v3h3AurBopdCuLoayF91/3Bv5MTdQSUOS58eTM/8tWTblEkyKQWBdTmYxDw0Cfj7xVAv1lz69t3xeNRjFasZTNe6VYNS3uDv+C16i2Im6IctmU9Avs+f6xqsNYBDisR+u2xiuo4I+lxLGvHEkErZ47Y73t13y8ZkGwI+YqK1cXyLgT3lbqiW0SMo1dwXM2jVxI66M7lNjdhVJRroU972/sP79U7Ps7ECIsZ9VAL5NAZ3I76gUmRYVHgTCKeH/P0lQSSyyTNjNCZ/8QvMkNYjXOPzcwIuq7aIVXHwlFzRbXejqm6WRbp5chBVIB7MFsR834qx/vXLuENlQkyPNdsFKLc/Uqpf0pGcLGj68Z2jfS2aofY601HY22aqrXV62JjW7lQPu8VksVMlNAvFr5FSRcJR5ZTIi+zsN2TPa9BMnDh8m0+D+DWbMwg9L1haPYOEtWCMCZEiWqcWpacfnY8qp3/ZfUw9QkjtD1fWM/5cmT4IZAdsEFBiLo8pnL2LuVWW2/Nys0Kckw5RRsnZ0E+8tMDHvo1mXR0XBivEthWIknZWdL7D7+XjzG3A3GDs3CBR3O9J5lxUQQTQsxrORQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(366004)(396003)(346002)(136003)(36756003)(8676002)(66476007)(66556008)(66946007)(4326008)(44832011)(5660300002)(8936002)(966005)(6486002)(478600001)(316002)(2906002)(6916009)(54906003)(38100700002)(6666004)(41300700001)(26005)(86362001)(6512007)(6506007)(2616005)(82960400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cbgx4VMjOytaJd63m3Ur/Fndh6AM6t8kIphlIidAWhWF9gDvIv11Mr4FUcTf?=
 =?us-ascii?Q?MOi82BXzmRNvs0vBywL9BP8Dir/t+3eyR58cMgItGN4b3BthVakU9XnrzHF9?=
 =?us-ascii?Q?J6JsQWHfBtX9Nochf9j0LB1xsO4z/K7tWWFZW9QqfE9oBJf07stdb2O8K1Bh?=
 =?us-ascii?Q?j4XCZJRHPFe9UM80e7LR46C88A3zEakwV+XkIheOo4CuDoOyJZw9rj4/g9LI?=
 =?us-ascii?Q?KXKMS6UO53+mTlcDxN/nMY3MxDcI0RdxpqAT6phWEgEmJg/6SxSOuDu8zs+0?=
 =?us-ascii?Q?NYjinxtnVf9RGZudyfjFr51tBlv7iPYyZaeAx/HmkF2lqL7b7Ixn2kx2aqly?=
 =?us-ascii?Q?KA1A8O2CsxaJ7POKNxugCN2CE5QM+3d75TAZmcJVPjPfuBjYV0lgxn3NXE8y?=
 =?us-ascii?Q?pDCceErWhG4LWwSjU47xtYDydX7fvU0ob4wGchgViiYctV1PDOQS0GW+a3ur?=
 =?us-ascii?Q?mI7hDFa28g6QxqMggjAfVfRhG5Cp9Hla00fPLaB5vgqqWtXwloFu5SmyQT1u?=
 =?us-ascii?Q?PNa+2Vt4Tj17DFs77uKepn4/e+V/RZlJWNJ4sk+DYqIGv9UkvPKt4xY4YdJR?=
 =?us-ascii?Q?XYXKhSFaqrOp/Jl/eVcP88QcKms44qXGb9zpYoNrRzVui92K1iiBob4HsRHU?=
 =?us-ascii?Q?CaxqD5Q3JCa6I9ydbVhoolQV4IuD5mcrHJjH13Pg2UTB0aERbusOE7lu4IjL?=
 =?us-ascii?Q?B8GB7fWDDsCVzKPHsDBH66yiuQYBrsPN4qIRjedO+xtN98q8tyZ88+0Mulug?=
 =?us-ascii?Q?OrxHV8J3NIZ6QaKD+1Ji74Dpf5nCyD9/VxXQ6Ty2WiAAb5ZaUwbwfuyuGobl?=
 =?us-ascii?Q?j57Fp6Crw74Eby9eB8n0MTxNjvGAuK+EQMHY/ZT5rXiZFI+FjY/YAVB8BsE+?=
 =?us-ascii?Q?Etp/ZX/2NrWMFT30LgV00vnPhShpJfHn6ZdqaxD9EfRL70C4hsXEVo0H3mUl?=
 =?us-ascii?Q?IqrZJtVqXF97NiXicV5PtUgnBkiIZ3Fk9a6z8/+/Z5McT8+u9ES0vv5fcZQT?=
 =?us-ascii?Q?2GfpaNuVSq+LAFq5D8hmwz+5flXmCS23lsTOvxvUEPoxm0hOnI9KupQHYb1A?=
 =?us-ascii?Q?IBV9RzTjOQEz2lE2gBjyJJXacVY/swq+Jqfc3QYdRXMKpp+5RYMwMWqvzzlT?=
 =?us-ascii?Q?aVyajf4UEfkUfyHKG6L9a+uC5hsdUpuX8c9EJ8etyA1rFKcj+/duSdhrV+8B?=
 =?us-ascii?Q?pvvZBP/AcRdVtys0ruGa9NFcH53ORyFXNeQ9auhr/DnwMf+eQFwPuIhpyW1B?=
 =?us-ascii?Q?4qhORSf5QZREi5UFRtWJNkEtYls7ZkX3XzZeEgdcfmcJK3RP51HOMzwRG0K6?=
 =?us-ascii?Q?uYTKVBiNdZjuUtQCHk5l6sTGcupvTBzaU0zj8r2gL21oU/zuWWcNuE3cuQ/S?=
 =?us-ascii?Q?371TpEnv0cYq0JGq+50G09aKCkbifX2uUmwyaonLXH1bth3vCFiI9OSex9/P?=
 =?us-ascii?Q?l1E6u9ESiai6cxt+bR/fTIHifYlEK0C1OLO9M5aJXgAbsEZ41ly3xGt4kRRo?=
 =?us-ascii?Q?LxC1gG3yIcDnNSvLAZ2MMK6X/c6T32RVfy0rKBfNNqfaISCA0jnkj8TBxAWB?=
 =?us-ascii?Q?cUzaB4ERa5HO9aJhX45nH0jn43b1dweA9LEM0mmFtdImRzpsHAyAr4Qqx5YZ?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6280b19f-40c0-4b06-31ac-08da79ee628a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:03:19.0934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1p94AX4VmCT3nGEVxgrPPBtg42ETrFnH03RhxE3zjXgO1Y6qsyMtpaccqYSw/bVPUEBRkaUKAlMZg47FKX9PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1393
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:21AM +0100, Mauro Carvalho Chehab wrote:
> Both intel_runtime_pm.h and intel_pm.c contains kAPI for
> runtime PM. So, add them to the documentation.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 3ee121a0ea62..c32409c03d32 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -25,6 +25,10 @@ Runtime Power Management
>  .. kernel-doc:: drivers/gpu/drm/i915/intel_uncore.c
>     :internal:
>  
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_runtime_pm.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_pm.c
> +
>  Interrupt Handling
>  ------------------
>  
> -- 
> 2.36.1
> 
