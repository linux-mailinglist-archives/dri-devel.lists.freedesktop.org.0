Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447D683A052
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D6310F5DF;
	Wed, 24 Jan 2024 03:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1154C10F5DF;
 Wed, 24 Jan 2024 03:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706068777; x=1737604777;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pT1QNgQONdS6hXv9EQtNaEm8266mb1J8b+5P5qUG1ng=;
 b=X0R8xSV5Gkxytmsp/tt8aiFN6uNsAiQC/c3ryntv4Bcaa8+i7K7LRZ0Q
 rAOMTLghss+IjhqI3CACfyeaTQ/2N5g/ccFnI9A09Rr2EeFJRCaly45N2
 KSr3beskYU5FJg6YtsEJ5r901f7IG3THOepIURbrpAEXvkNXUVaQcXqfK
 JjEgiZq6rUm8MDCQA/wfC8/3pqQkGctZFunY4anvOgmNX8spuDF+QW1JX
 +K7fATzAvV5rUNaeF7M1s9VxpQa1JdHoY8yQ7T2dCTZM2nwQ05IvrigY/
 T0uVsS8Lf0eLF38CZLy52s/aWjdBq76er91pAsYsUs3LWyQ7axKlm8PDA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1577913"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1577913"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 19:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="34636517"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 19:59:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 19:59:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 19:59:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 19:59:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 19:59:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV1lMPgMpiTdYURY7l/BkTwEis//HPzmr8coNJmlCqEXR+6iYbDWYIsRpbM0HXRZxfqRZQBSVAo3CNK/Z7cjWFVAh6SzSJSSVmGHe2I7pZLOtl1HZvhMCJk8j0rtz3+C4P76Kzs+jKsmWdjJ2HgRSLUfIzDfyTt/EoZh4NbpkbTTiwAOQDL86+gT0KSixuCTAH+TH3Rr6aJscHPmF96VQeJNZxAbKZ2YvioN0hZKzwXoRkZ/qOTkw7GxtKwlKPTHpKRQ8RgnejxPPiFNw4L16RQAnX0er16KjrKqOTZJ7P31D6mb042tfExirHScydJI0Z2koS3kj/XlRWZSMvySBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JALFcKSprsw0Elt8O1XjXmBtH2YAbVz1T8JMZmwDdsw=;
 b=NgyxT6mhCeDICL04579WADY5Yhsw3OcVknM9g5WepGsqAU17b22tgBS+eSfFa1PEyZxlxJ0H0DT3dKB591U0XTXwlJM/rben5vTWoWictblhK9MqNfs5YbxeE6k31O9FVL6CMEQCE+zkOl7Wle9XRHeKhwW9S89yoTqMZUHYUzQ1QKydMvOtru/i6i+bfq2avtEyP1yuDGSc4H97Qgm9Sje3t+P8U07F0UmUWCF+Rw2nwYh2uJZH5oQJeDZop6RySGenX7s3wSkfWd2uzabL75imbnYTRYsWhSXioeCiFkDiaRc1v7lSPNDZm8otPzl7b6IPHZk1Qv8hYHcv8iF7HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5972.namprd11.prod.outlook.com (2603:10b6:8:5f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Wed, 24 Jan 2024 03:59:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 03:59:27 +0000
Date: Tue, 23 Jan 2024 21:59:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: Re: [PATCH] drm/xe: Remove PVC from xe_wa kunit tests
Message-ID: <ygfj6wy2foheqikd5rr62r6ponkcbun4bolkdauyrwy5yowxr7@xg7pqjjvylkt>
References: <20240123031242.3548724-1-lucas.demarchi@intel.com>
 <20240124035538.GC5506@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240124035538.GC5506@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 561717bd-6ebf-4372-d603-08dc1c90dbde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRr7JzCdQfYmMlWPydj0B+BHvP4MZHVf4wO78GLIHeA9pwgBcfJIV9x/STLSdYZB3nyRgfk7x+ceBtdyAMZTo45aYw/waZiHLgHiF0zemOy/Ze+owEs0ZAQpV2CKMvOQgPHIb5+gBqnrGc7Yis+Gll1d91QlCDW8V772nPPm8/uanfE0faaY3R2gmowh731kO/aqqlzrqk98op/Vz+FwUs7i4/lywsQm5a2ptISVCF4z84PqFvgM1Adu43r0EcjxPt3hMrBlHM6szyan4bJ528EWssGXJ/j44T3xpV+K3uj4i4NDaxNezO/6C4VFGfaKopWmeUZkYq1/cAVJeGxFj4Z39bOWknGQbT1tgj9BV7crDtDM85Hfg+t0vgvMWDjKJqp88b3m4Y70fTcfjnsGZtY6aIxcoWaxIEdMIL/G/i+QlOjzdVKB4OVvwXNG5/rd3vojw7ot1St4wLu9bNweN/hcmmXrrA2pxCZUCADmh3asgjxyBY20xdF0heg98l7WCB1FFczqHdGli5f8aZXQEmMVw1PoDNGruvpP1IBgLwhf1k0aOYMAHP3if3MV5jgM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2906002)(4744005)(5660300002)(86362001)(38100700002)(478600001)(82960400001)(33716001)(6486002)(6512007)(6506007)(9686003)(26005)(6666004)(8676002)(66556008)(66946007)(6636002)(316002)(4326008)(66476007)(6862004)(450100002)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/m7w7fw+q6VuB7RtxHDSEsisZJOjkRqtEvb3XMvSjRERJUnIKM0AIo06nn2j?=
 =?us-ascii?Q?3udfvJmw4YQMHHKhPZzu38r15buG5+YfxhBz1yoULDFlY7j1+byA8j3YaW4b?=
 =?us-ascii?Q?TX7n6e4s3hEmR//Dsrt5nW6DIFyLcO1QNi2KqZWufr8NrR0LMAmCpj2tsj/q?=
 =?us-ascii?Q?iJkadiGgD8DqtTooOh8XEViISMGNO956Ss94eLK1cVXbzoQXqyc5d8MxMMm7?=
 =?us-ascii?Q?HqrYzSqv5I26h0U1MCUKh/KnwzCdhc2iYFAytw3pmzR1zsFkg+7Qoc/HHdvo?=
 =?us-ascii?Q?wEYcr2pfX9CitQNiDu0pdZiRwIVUWnsK6JJi+ApgAGJ2hT30i3BPi6LecBPv?=
 =?us-ascii?Q?M8HbPk71Xmg8my4i+gU5sj3RKfX94TpZT1nwra3aFmh0heGVWi9R9mgCYix9?=
 =?us-ascii?Q?1mofrzMEGb1rlM6CMohH+eJqJO4waq49nM0JbvY2fo7/iGWv70bRZtl2jxyQ?=
 =?us-ascii?Q?g/3kiExj+owZK4ILebmH/ZJGJoKoVJ5FGhZ89b1M1L57S9gdX4WKs1MAwxkf?=
 =?us-ascii?Q?7RyG5Zud+U6GsVncYgq15C3sscVpZVjFPc0i8bu859DB68Tl3kP1IQhXheOm?=
 =?us-ascii?Q?byKFTFs58cOP2ApWVbBuEX52K2Ep+Hnuj3zm5u3lqvv/QXbEttStOHwMm0qg?=
 =?us-ascii?Q?JyN73JXAbBIC2tLXdxSu00UZbhCn70kX6jPS1ZwF7Quuwjap71oF78nMuLEc?=
 =?us-ascii?Q?yEhEPNKENaMGil+/psU9pHx4ZW5tJyYnkLC43bTzUP4/figIhCm7HOrt6M31?=
 =?us-ascii?Q?jFtksIkRZp8s8yvIJv1SmpMc/ogIduLgYpJ7UrC+u2jlTwQ7qkk23CWNU9a9?=
 =?us-ascii?Q?WsnMF9B5+Mu9SLwZVFPwC6tSrpOMeYxul1T3Xu8ODpE3zd9Z7uyY29SZJijn?=
 =?us-ascii?Q?3iwmEaepdUyj2MuySRXwaHuKZwqPMfHSqETUdNVAiDobSkVotDOh/RXM/1oo?=
 =?us-ascii?Q?oTvtk9psArbVCEqyPJpUtXKVUzfXyrXBCC6Hz7J2zmVIHsYpU233XqQA2Aa6?=
 =?us-ascii?Q?vIOPgoGZJjWNZlZrwcDbA8OSRWGg/nQlhXMMmDQn7X0LY5m5rqSuBUh8jiDH?=
 =?us-ascii?Q?Db+/PNDLApWg58T0wytcFvgeSeZ1bV44ScdY+PT9byUN7PZYQ1vvk95PpNSZ?=
 =?us-ascii?Q?WAj7x/ymPECFrxrEud4nh8MNkkQs1irBAMzLvLuUr8w1FrUAb/rPY1cY8JIN?=
 =?us-ascii?Q?QJVGPOVauWkb0i1+PPJXmf7g/d/wkhWlsQyQpw1olV3gdakW781wz7MNWHzg?=
 =?us-ascii?Q?iRyn1nhE+G0kdq3zvoRsgJbbPAL0n+d3qZ8d+4W1ORo+xWqy1bctHGMSzHzh?=
 =?us-ascii?Q?XF2LxDleaxpsR4RDvkPhe930TsZIiKipVFZ5i6++bV+fuwsNih2g0P6UN2we?=
 =?us-ascii?Q?229ZQ3xYW8jcBNfW0sF6lQEzU3o5OQ8ZkfbrvVckw4MlEzrNrTKpO/jZniK6?=
 =?us-ascii?Q?1gDdCqolW9B9fzfBQs84/q5Cs+E63YFaqFfoMTyg2Kx2Ku8z/pPQ/TL2UNQF?=
 =?us-ascii?Q?lovBcdsiUXO2KopZGiS7fFbmQ43KcG+iGLM4XPF8DhayE7JiXPgvvV4/h67k?=
 =?us-ascii?Q?LETy8JTOSkxq1HNits5wjne81Wsv58rYbrduabDKXZxKkI4g31W/HQQuuv3E?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 561717bd-6ebf-4372-d603-08dc1c90dbde
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 03:59:27.0423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVwPacOeLT8bomMs2qPqOekV/g9vEekZPxQqKjSzDDdcOXouktuBrtqkw02q2Pa56vW4vOw/EUnWdR8SzBciLi7VeAk7PbmQgwBtlg5HzsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 07:55:38PM -0800, Matt Roper wrote:
>On Mon, Jan 22, 2024 at 07:12:42PM -0800, Lucas De Marchi wrote:
>> Since the PCI IDs for PVC were added to the xe driver, the xe_wa tests
>
>This first line doesn't seem to be worded right.  I think you meant
>either "weren't added" or "were only added to topic/xe-for-CI."

yep, I meant "weren't".
>
>Assuming you can reword that,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I will fix that up while pushing. Thanks.
Lucas De Marchi
