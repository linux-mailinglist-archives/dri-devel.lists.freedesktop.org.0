Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58C831072
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 01:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A8310E0F4;
	Thu, 18 Jan 2024 00:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC1510E6ED;
 Thu, 18 Jan 2024 00:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705537273; x=1737073273;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KJifuxAn0r09aMAynrDd/KqgEVz3OO+OezjgpPl8lXU=;
 b=QtzgPYfD5jcrjKtWEKlbDcmy3H1S1xIuSZ3aVegMLvlx9wU8vk6IvaN9
 dwDlbM+paW+y3IFHm/B7vDrtqFStZoDzGdrnns4cPF2Qz/+XzZnbru4os
 AEvmqE2PB6VWWSqCsncfCmNZA9C3a3WIuzEn72cNXQS1fOj9QFJmMvMLY
 RI7BAaMkosHLmAsJEnKjbmTwCtLvS8+Rj51Kku4ikSwrXJN+GiUOc6/im
 cEr9vd+XnFIT+kBcCwxTCz1S4JvGN2LqKKhwahXLrrJxhr31SgtUIQAVq
 GHloiX1g2JakJpfWOihJhHz2dsFjThEFHvH+gtWfoaDYogoG2Em+999jB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7007099"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7007099"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 16:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="247040"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 16:21:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 16:21:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 16:21:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 16:21:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMD98k1Yed3EuWxkpty5ETejmAYOkGFbIYYuA3uZlYZrVqGR1hCZzql+PcEOQUvpvd1y4GMWyMcGnMEC8eEKhY1g4Opfc5KrxmQJFjtfBeC/L4dMHTByb34epD7N9ZsM3e5Rr4iNN+oTLvqUJ4C+12FvU5TaiA3a2hXKWR3fbHCBO5DluaPHAXHh0MygsynWhcgfv24cicx1VVhdNW7h8/qQrGVpl4eHK1z+hyLZZh8NaMBSqV+9RAlLyAY5hitTdO8qRBqtCPe7x0hZRgeaR0DT06FzhPmqNA5D0iG39eixzn+2IRDvHi5gK8Lcqhs1mq5MCMZqSouvBffbZzPeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMW9bI2yXXY3Lw31uTqKWyvbgVr18oUjI//Gp7G4Jgg=;
 b=gmxVfF8Tud0j3EI2WpTGdVxMCIa0T9XxNLJBucJij2bXPQZIKXXoVJhfBWllcRUFX0B8eoeV/XlSLho7MTJrHqquRWyWF3oSyJL39t37+rkOcu2JmP7zCjNABv4gh13Bhf+TRxjPYJNTbnvf/f54Ry3HqQxeVz6cb44Gq4hwB55+OyVwThjl113b1iO8qpueX43tHNAnuipnnuWpGCN/LjKucxvIp5aiILuJNYn8WevTWuq48NZjX3f+QLAxNFbgQGxalp3n7QcJe8iqUrNQQ7an7B9AOOnjGoZegaDdAINN6OygfrwM6NmxUBM365/buI82AGwBkumuYf/eU/6x0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Thu, 18 Jan
 2024 00:21:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 00:21:07 +0000
Date: Wed, 17 Jan 2024 16:21:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe: Enable 32bits build
Message-ID: <20240118002105.GT45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
 <20240116174050.2435923-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116174050.2435923-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 0edc8bed-4ef1-4928-a432-08dc17bb5db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cmKvmHU5iuyYqEgMBvxUj4mvvvO5t3FTUU6DuNtI2FcgAhZdZNYssWRLdYbZRA5LviydTonQmMWE2xShBu6LC/9sXl55Lyb2HnpCp/y5KbUTDjaQJ52aIneqfQy+SU/iNW5JDtgln4n+U1YkQlCu8xsd1zBs0Kjsmc0U5xtn3A64AOGKs2r8vPc/C0LO1d3ZYwt2exQWfLMz4G+0bGpfzBxLbOu3bjVuBgOJF5tJre4vuxnBKXFZyyPlXPSZzpQ/kCbJGyXXuEbI33m8MFf9gbDu3QvUlNYwO3NqswzsrcwwR64LCGxmO+HsEqbt0WgVvRK8ekQCNlC5e94ld2lNeGXu7jtBBcIvBxRL2kSw/MeUzKat0PrVvmXn051wvY71L5F6rW6YhinPqZuGk64HOT86YWItYeQpJMtxSZIsnT+u17J8jKVtJDgT7osItxClthFL+93pMJkBw1zmvCnYHssXj+s6PI+9J+OAoaSlRH0HGP7kqz5A4OcUcvDi2+HDZs2c8dxU3UgE/w2D/imEOTHPnnd7UyUeEO/cYvUyOHeOjVMHDylyuZ4nKxucW+v5TU4tyIkG1mTOlzWwn/X2qXx2WnTZXHjFGWNSMciln55e856TbDYJ5cW1hniUrERx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(64100799003)(186009)(451199024)(6512007)(6506007)(26005)(1076003)(38100700002)(33656002)(86362001)(82960400001)(2906002)(6862004)(4326008)(6486002)(5660300002)(83380400001)(450100002)(66946007)(316002)(478600001)(6636002)(66476007)(41300700001)(66556008)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vUn2Unc35XqWBv9FngQDqRQTPNyUZKNn8gmsXv7WzqQJuXL96jnsqjncrOPB?=
 =?us-ascii?Q?UiGdLSToL1WYCh/kb+eCNMy2obLMlq/mzpXEvmCiFr2TedHLw+VZTv80lASy?=
 =?us-ascii?Q?Gi2AMG+V57Fd99CX/Do5zxm0jr2+YwOdTFTokT3agO4jBkuAAJIvmao3sMno?=
 =?us-ascii?Q?y0UsbNCnlmrSKaz8lX/oYwWJuMRd7/bahhgDjVHMgR67D/ZCyQVly0hzAg69?=
 =?us-ascii?Q?wK1TvSAZgE3z0o/TpFI99zK4JZLQiVpnGwe2cdAZ/m6XvLJ6GMJknV0maEY/?=
 =?us-ascii?Q?wFrj0VY996+jnK7e3hV96lmW7E/jPN+CgTNE5GAviS8zbn8RiU8uEJBCJsuR?=
 =?us-ascii?Q?A5yO9RS1fy0+jE6o+aFM+48E+tRJ7R8e6CWdxCa3FvVcGWJz/KKDTqHN6FkK?=
 =?us-ascii?Q?r65RHoyb/uJDvKDXypuFzVW7ZnAUVPrTeP+RCoqEqjUfrbSGa7keqrjxAuFx?=
 =?us-ascii?Q?98BhbMR6PUr8rk5HsUXghF756eRFyfP9qztXGhpnDWadu5/V9QdK0IPZfLBO?=
 =?us-ascii?Q?nl5FFw90KHqPNnxtuBb4vk/eI0tWVEb7yJSG1gMt/RfjwFvztRtyvafAmMaK?=
 =?us-ascii?Q?hYEgOwQyiGHg1c0JWB1k4FddY4zm+9DSfHSgYvfetBVAk0a787K/NRwSFT6i?=
 =?us-ascii?Q?xTK6CT15hHbzTSNj4S2XouEDNuFPbVxdjhk33AO4iLnZXh5/mIxFvS+9MbAO?=
 =?us-ascii?Q?ZBZva1Oh23sIcZLSyMddxK1KEV8smSQZE8lD8EEPe+tKwyIA7wmwGn57Wn73?=
 =?us-ascii?Q?tvAotBkOL3qxyAVE6izUG1hN1xTJx4hFYa1B/BX0sKRelKInrPIwkrm+IHMV?=
 =?us-ascii?Q?fERqMVHfzvZBmETtnf7bFixhTWGnLAellWw9XVl32YPkNYNz/dkG2hcJBsHT?=
 =?us-ascii?Q?S8/igCTW7Yu2P+SJt2gQBJ08Gijf+5e6c2P58m+pDQC71FzA+a9NAxJTxsVI?=
 =?us-ascii?Q?cvDKrsEz10W3kK8t766mLAlAjopH3/DxzkEPetj0cIVclCj5WzI41iD7qK0p?=
 =?us-ascii?Q?J3FNxfZCNfvop9N+N6ki3PhPur5y7irY5B+jTHDdjBD6PwBfEzB9bfUU5qbf?=
 =?us-ascii?Q?H6JuJbYOJgfNXjWWjdE8YPZXSwOwdo6MP/sREL0nFrQWF1geoSfqbvYiLayk?=
 =?us-ascii?Q?6/Y5o5gMaqh1iPvkg4lVbHUCaH9VIZPeUmWKZSAleUNNuiYIm3elyjMAyqpH?=
 =?us-ascii?Q?xE32QVEFgjHZASzcZwXcWMCqHrf/0X0UlWPh20Pax/BCDykIG+DXDHMBHZIn?=
 =?us-ascii?Q?PWYetII4unOPvznhr6Am/MLJoD2/OLiz/JIbzFGcGusVDLMmPD/OKjvpK7x2?=
 =?us-ascii?Q?VEWeDGXy2VumtFd6GPBLmHow+2ipPob8LOrLKQ5EXk2LPZ5x4wogL1IJ9MIk?=
 =?us-ascii?Q?LfFKrj+GIDEyNh6Qmls4wlbkcRd17AMH25XND7LcNgnBhA87+dnXXJgpIsCN?=
 =?us-ascii?Q?Wm+7EecJA1l0UnWhdJa019jr2AsU/PaMcwaSKTWnvVKwoKsExmuiIIETCYtw?=
 =?us-ascii?Q?Rz/Ez+uTOk5aEdm6Hkum9cNzAdidrc2BYr4KaayON0//zGZhcMjrDTji0EHQ?=
 =?us-ascii?Q?G7vtLWiW7DTw7+5YkXZm9E5xjPWveBkWWcePNbdPwyClZIVaKAHP97vz5cjt?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edc8bed-4ef1-4928-a432-08dc17bb5db3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 00:21:07.9132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /A/wXb9nhKHWpiLY1oUuMswoXnQXu+TYgnojSFJbTN91ClJUF/NLRjOgyHludf4BhgX/jxrteJ1CrjiwYGU6epPVRbQOfKdrT9l2FTHEwGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
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

On Tue, Jan 16, 2024 at 09:40:50AM -0800, Lucas De Marchi wrote:
> Now that all the issues with 32bits are fixed, enable it again.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I didn't test locally, but assuming you confirmed all the warnings are
gone now,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 1b57ae38210d..1b0ef91a5d2c 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE
>  	tristate "Intel Xe Graphics"
> -	depends on DRM && PCI && MMU && (m || (y && KUNIT=y)) && 64BIT
> +	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
>  	select INTERVAL_TREE
>  	# we need shmfs for the swappable backing store, and in particular
>  	# the shmem_readpage() which depends upon tmpfs
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
