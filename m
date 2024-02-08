Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3217A84EA48
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 22:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EA910EE05;
	Thu,  8 Feb 2024 21:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaERUpEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5CE10EDFA;
 Thu,  8 Feb 2024 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707427318; x=1738963318;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ecp30BrwqlFlYVqY1hrY7I4AlQAD72cNGQD3FsGiMIk=;
 b=VaERUpEWOWV29z7GSpF4Uzz4Z1r023mml1S0wRpTSlpFIVJU4yNV51Dm
 KG+FUHqdVpSp18oqJttwNg0aiynoeShlg2+ekrYKckRw+CXmTytESalE9
 ycu8jwZY25qUk4tu0Rkb8CVuEsldkKM5VDapunv4N37ai/AI+Osz1Rd1y
 ir4bwY9XKL8ETt3WPXe0XRBxRHEzAAD5MCalktYAfER21GSTQKTbMjPDq
 MXysmu71UVuwG96+AVpFqrCNO38Ngy1x1kyJcVjRJzajpQ1vspkZqTylH
 fpaW6MhdZUNhho5DV14ykgzFloabrJxLLE8skL8vvvxif8UMemuO5qse4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395738739"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="395738739"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 13:21:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6429389"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 13:21:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 13:21:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 13:21:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 13:21:55 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 13:21:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+f1nItAhmQKkZESJYcw9kHcvkoEEOdlMl8vh6+5gyMk3HkJ4SBCE2ZX0WkjV1BBuyB/CXC7K5MjqfEL7hxOI+dWog7ozfz7MFIloubkMwJkj7Qg+RrR3/oMYqDPxLurrZb7NPdz+or7GNeTIvE4tg0h+F35213TfyL0LvTW+t7GZXA67dHRVj7xgZ4KPgRBnTFi6XrlOe3QpLyeC51eDLyxf2OarhPQyHI0WEAr1uztU+Y01HYKvSEsFPmkwMlcv5sUl5o/XvWNCRIpF4gxkvSMdg5m0rgHQ5NTHL45wrI+8GqI7cm4GZg72TaGynH/X7xuQfVEV5tNz5Oo07OIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZezaEjRHAqtDQfndn6M8Lg4344vfiMuriTtvNMuir8=;
 b=NENDb08NSiTAzabMaDKm+/8Ve+Wa4YR5zQX7xb2SsZaMaA1VTqQd7KaU6htJ85VvQgK1AmUqqUbqB58WrO3aq8PG/6zmXErRxYnn5rKz84HMs/Q3VISybGVH02urDhc+z+od6mAOSr+eFkjiB4YJLSh4kL1790FVEKDZelBuyEotMF8IKT6TyBNRci15UCvlQk8tCvLg2D2qctuV7XgE05IhJ85XQ3xdtXtg1v4CNTIEr7QXts85tZ4SnC8LOtSVJKwOBtsbTixxjhnWAunhct5am9+fuzjzwJ3Ru2iHnWAknD/M6FsXkXo9TsRhpq/MDsncNXgnX7kI5AhtuKVgbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 21:21:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 21:21:41 +0000
Date: Thu, 8 Feb 2024 15:21:37 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Yury Norov <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: Re: [PATCH v3 3/3] drm/i915: Convert REG_GENMASK* to fixed-width
 GENMASK_*
Message-ID: <twuonp2odpkqqxyrgyvpcjtv3dov6secuu7xoxlxc6oexq7ltm@2ro656cxjie2>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-4-lucas.demarchi@intel.com>
 <ZcU0hDSPOmhX76pq@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZcU0hDSPOmhX76pq@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: be4c8839-492a-4cb6-2626-08dc28ebf17a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S9PFOQ70vCvZjbmmRnlp4TCiuFqLq19OpkDdzTuZ5Moot3dyHE40StHiKR61knzLLX3bAUZ1UZoLGcnbPVdfOrCB5i2qJ4fnYZgtmeqQKHG1h6T8Qr/6VTl75YRC37F+H5lOLS+sz8RDdA3+CP4C5SUZIvAVoui4/RHOSjdN+5qYcgb2NDASn6cex6zasW9Y3UY/JWmnd7DRC0XcgyEnZgvgcJEqz1ZOsH4l3fP6mkz/V/aYdBTy5YZkLykNKVsADUZ/ajWw+rtrorH1KdEiw7MOY4+pfIBcts4/gCzxwBVrzohncYIKsw5MMNaZkBlBrV5183aVTwBkrrLQr2Yu9awmYl/DJir8KguscGXG+KxFMEGn9b1A85XKa5IPdrozgrEaen4Tw88IySidwF/LuoXQzERjMIO8/F4A7YpOUpSKPoTRUKyRsxjHBe7y4o1/Ddgo246wP7cQn+o9UHl9CYKsVxw4pgxvz9Zd7ll4vEsnhP/9YEjCFb/grpBNXV/IBTBahSbAhx5mNWMB8q9LhYPYiBSpZ8rMSKmbX5gczrGV3aB0KHlfpuFPM/adzZh2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82960400001)(86362001)(316002)(66556008)(54906003)(66476007)(66946007)(6916009)(478600001)(4326008)(6486002)(8936002)(5660300002)(8676002)(2906002)(4744005)(38100700002)(9686003)(6512007)(6666004)(6506007)(26005)(33716001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CmiGEY5h6WT42BFq+ioOiaJ0mY90YAvh6mpibIrg8wSaZlq+WIukxLtGzdwe?=
 =?us-ascii?Q?XSYqIDKcXR6lHIeNC2qzppx7lLi/5KIcUBjwusJMU5qwKuSLvFWZwt6PcReb?=
 =?us-ascii?Q?5ett8pQ6e38Y+9uAgY9WT88CtwmGvAJoVZvf2yuLnKCnkDRdTeGv2XmLZgyQ?=
 =?us-ascii?Q?qHC8uIzzXoWdIuy8aq3regj/UTsTur5oyMGWAa7DQmOLz3xUJTRH+wLfX4Qg?=
 =?us-ascii?Q?ZPvyUpwHuSSkwTzCay1ZrlG2xQDmT2yweGyvW9VsLbu8POrhg4Y/oEdv/63P?=
 =?us-ascii?Q?pofjBbWOldS6btDkW5W1uq9ctovhamMVAcQtZJkPoKcBCGUmycnTV6+/4SdM?=
 =?us-ascii?Q?eAV5eL4EwaZEGu9JxlF+mPqQDHHlY2Ox1eXWECpIgoSkH5snHMn7w2ch/BFB?=
 =?us-ascii?Q?W9CrHCnjmxpWrdRbzsKxW1Gw65MTjWVBMbzfHYge9TsP2C93YZOKmazshDyz?=
 =?us-ascii?Q?9KdkVl9dg6bMqwTR5ZTB8hGPEMttucvKlnF5nFII6lP1lnlq3hJJDGsH0NKm?=
 =?us-ascii?Q?Rk2O+Re7ylzWw0dhAkN249ublwVVzrUfKObeOzoNEgpk19aORNUFFOtsVNJr?=
 =?us-ascii?Q?u0ODuB9Q3s095xcPWGsH08RRolSfVW6hA5NIFL3hu83Uv2NQwgKtfpCVrkr3?=
 =?us-ascii?Q?Pi3ppyToqzsjKKZFEj35FwYvXrHA4928lIicCiQbGyCgQYgdyDZcsWoww8PC?=
 =?us-ascii?Q?4q9nWZH4gjxOEND9hWAJCVy+QnoJPxmjrg1+Dx1PyqKLGyXawAysgtcAqrXU?=
 =?us-ascii?Q?uEEK9GoAcyvAi3cycYLqIdF43L0O4aEAcuDQb9nKowgF5hpthvvTmPVlsy+5?=
 =?us-ascii?Q?Mn05kEOnsCWCJOllcUiibau9sTrcZYM42DpFG/XHbFOwRIQKPMp7Lj95vx7w?=
 =?us-ascii?Q?SMJrZ5Yda38PzjwONESwAhSsS8AV9aU4eWQfP/b9jw9blG1Y/2KG22sXcK9s?=
 =?us-ascii?Q?8ChQZkDFALXMm6VWp3RYH1BFFhdcWyN6Bs8hvQwm0dt89Lig/KPStthsNK3h?=
 =?us-ascii?Q?uCj+XxzTE3hKhnqICP9akT2Wjv+JMsupZ2fKrItG4YNPnZi9cjKXOTaqwB6A?=
 =?us-ascii?Q?k0r8Jej2gomGtqp7AV6YNMieRmyLY3/SUMRfZZu8VgfTlnLrK61xNQ8I3Hzy?=
 =?us-ascii?Q?h79uw5RhWkZGnTIXYuFDvQTP+Xu/8wchle1rO8lIoAYEJ/rce5RtKUOnPsaL?=
 =?us-ascii?Q?n+nkZgR15TBdy7dcjEtqoeOchUjdIpHdceLpCrnrben0sP7kn1sWbjN0gfCV?=
 =?us-ascii?Q?Shrgix8Nn4vNWW2ZQP2zrxs59lWjy3Z3kokUE+/CNO8lZXKf9fKck2An5pay?=
 =?us-ascii?Q?ip73mvyw/1EKDtlFBOf7eVRizoATnRIXxU3zGf13UT0XgF2GgIG74i8Z+7+N?=
 =?us-ascii?Q?2AObKb/nEbnnqji+TT8EQgU5Ctg4SG5Dc2ybND93cuu+i0AipI2jnsLLAJkC?=
 =?us-ascii?Q?dq+awA9ZrYe+BNrwrRd1G4+UEZ6w4/SZLoqne+RHQUfEPB2cMRKV8d2mim0E?=
 =?us-ascii?Q?tZOiS/64TwxjwHQW/BpCrvYlnltFAcpC9KiOjC9bfjNonQVLnVsGBnGKv6kN?=
 =?us-ascii?Q?4lL0v0HDnANcrhNI35WCAni8ligdjPL38H8EvaIBIG2FO4NXa/nAbVjX3g6u?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be4c8839-492a-4cb6-2626-08dc28ebf17a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 21:21:41.4365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xd4Hoys/5Cd6LxT1pijhBiaEF0JehcC6LLOmtlh8a0tjZzmUtKiHuhj7d1P696zcJzfbpvpL/VITtSZxomdpvgSS16zrTJckjP0iPhZZvaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
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

On Thu, Feb 08, 2024 at 09:07:32PM +0100, Andi Shyti wrote:
>Hi Lucas,
>
>...
>
>> +#define REG_GENMASK(__high, __low)	GENMASK_U32(__high, __low)
>> +#define REG_GENMASK64(__high, __low)	GENMASK_U64(__high, __low)
>> +#define REG_GENMASK16(__high, __low)	GENMASK_U16(__high, __low)
>> +#define REG_GENMASK8(__high, __low)	GENMASK_U8(__high, __low)
>
>I was hoping to use directly GENMASK_U*() functions.

this would be something to be done on top on each drivers' trees, not
something to apply here.

Lucas De Marchi

>
>Andi
