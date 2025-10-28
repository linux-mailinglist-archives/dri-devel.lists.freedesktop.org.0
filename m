Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC41C129CA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 03:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32A710E57D;
	Tue, 28 Oct 2025 02:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuuzUoak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7C410E1CA;
 Tue, 28 Oct 2025 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761616818; x=1793152818;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cwzvjJiRqH93FR8vSWd8/LBe3x9AHewLCCzBQDyyp54=;
 b=TuuzUoakm0oKxtmZ4LAJ84HkrBMGbH/RZJ86Fh3IQ1dHZz4m+3fi7r2u
 P9piIU8BXn40HYMtNyZfCGK49t96fGpQsPzzpEtDHIW+EPkqH+fEYms3q
 VHpc/gtpP7NX4JpFzk8MdchmaYTpiyQFDpT5nz690JPf25/IFXDy5XVZs
 wsxt10BiIa4R5k/1B0sOpFXLATa+IRZqJBtDHqsyxbNskdjna/M+sT/Z+
 2wk05Oo7dWdOIgenBObp4sEMneMGR3J3vEhU2SqhbhAS6a6mJ4azbOHTm
 z1QYenyCRcos499eklxzbVHUK/L7LwrXqarjDtacGNEQBzS2D0GI6/NYF g==;
X-CSE-ConnectionGUID: BW/1Z0YaSxW5YRb0GtwfFw==
X-CSE-MsgGUID: IUTft8WOQ6+toBUqVWAA0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63745961"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="63745961"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 19:00:17 -0700
X-CSE-ConnectionGUID: yfiR5+rAS3WeUE+62OffWA==
X-CSE-MsgGUID: GpAeVC6XRqOVuxftn+zZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="189265409"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 19:00:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 19:00:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 19:00:17 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 19:00:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4+b0kzW6vle00vrXbrOqmIVhDMFOpBt1apO8xFYKZ0LrjjeF5qBwLNSXhhHmu/if53pGsNlIhP+mKvw8No/o/ftKcTRpENZ92vG0zsZ9t1ZPXGjNnW7qv+0PkccH8faXSWEZ1yJml7+9vBB45Cai8lXFiqzqs25PbeXroLX4xl1HgZ4vQl4i+8yXrZbJOF3W6GnYV6l55B7/8DXdHvJhQ04bZqMFmjJjj2JSuyOqqKJBmW2d4Q1KmjR21YYvBQuFpOg+vw4qilsxUyoLeXtKI46Y7z7bHcgbL8cZzAwyZTvQZF/yzjLhWgIK9h4XSxxPJnti32vdDlBR8DGjrYvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMq56CH0B7fC3l5nxlm8B4sINwcybXBpi0jmZ9lDRRQ=;
 b=AKiTTFzVJ0awgq0B4odZI/vlqBDQbkv/4E5NgpEEuUteZZoRCEwD7EdOaYhJrKA/jARZR3U1AVH88krQBSgDnmc51B2OUbMEPInULwE0e0iYgb2J5x4xO7nUdA7kmWftzvNm2cg5aDEUTXQzpJ//pkFAGy1dQxw3Nvqc/5NiNRJOpzHm5eytXaR7JYbFtkIDJZ9QCvKf/NjKPRb7jy7sVCzlP86RwjnDsdjElKDzGUrbYOU0czG8WORPNBj9BQxkLCEnKvrGaHsXv87+xAdil6zjQxOTEqdxI5mGrKPjhFjdoNZl7o/o+JFSFrWr9BUu5UqU0eRqdsFFZnhVZSuCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 02:00:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 02:00:10 +0000
Date: Mon, 27 Oct 2025 19:00:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, "Jason
 Gunthorpe" <jgg@nvidia.com>, Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC v2 4/8] vfio/pci/dmabuf: Add support for IOV interconnect
Message-ID: <aQAjqFw6ElAJBmxF@lstrano-desk.jf.intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251027044712.1676175-5-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027044712.1676175-5-vivek.kasireddy@intel.com>
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0d3709-1bb2-4b95-31af-08de15c5b9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xr05J99qmyKIcl6ZDl421SrCMiNrufl7InCYP+LbENmMM7ITKGsS/xJZAf?=
 =?iso-8859-1?Q?DidaBaMbCChBOas3j5yu5VED6cSVdS9Eq3PCw5oA7QpFexdwJqu/TLA6Mq?=
 =?iso-8859-1?Q?3UWLB+yiDn+hsKp18a7Do7kvowiPwn+eAkH2El4XVaGwtbmcS7BZzwkzY/?=
 =?iso-8859-1?Q?IaNRzdC0+HQdEW382jvnzgeVQEnRuhiyjveAEO7bvzJj1ytrhYSMT4qZok?=
 =?iso-8859-1?Q?9qZkoCzk7Tfv/Ixh/4UjweExCjAH8B2oBJi73uw5CisRWl8Fpntp9gNhdR?=
 =?iso-8859-1?Q?3US27MUA3sbUmDlhKU/DiW+LZ4Ec2UKvlJh8hvbjz5GrxVvn0m7Xf3gQPU?=
 =?iso-8859-1?Q?f9LW76dgmP8xRgN+VITsMaS9z0ULeQ3LWel1SvZkw/qYPjqbIINImAKgea?=
 =?iso-8859-1?Q?+X+WxBLapM0oi3tOPrNHmOl82GmsscLVj/nYPzE77+FVui8RUJ5vgHyQKu?=
 =?iso-8859-1?Q?deLCH5aqJdpzpPDwCYNwyZmtwjhCZuPzdhWtfClu9nRB2SHjGC8A7J5Pom?=
 =?iso-8859-1?Q?dyV8MQNNU+xAod1gM3DafhXAivc4QI5APN9PrVFS5s17HOW/NGdhSGIaDm?=
 =?iso-8859-1?Q?nTCVQA7gyVQe+FwPkxyLTDo9bIgQNAIzdFACTtQe1lDuH/eg5xTsT7Vu5w?=
 =?iso-8859-1?Q?ZEyuaPEC6ZJQcOmKJV97poRD0PSlb9hVuVLvzyxdq76V3Qncxe1FHKYJw1?=
 =?iso-8859-1?Q?CLQbfh2yOq0Z0mWMeo5LJr/ftqN6wVp2LzDZhg2RA+ryA4Z2u6EiP6Y4vo?=
 =?iso-8859-1?Q?744P4qGetvVQ2ViuhKF29oMle4QvnHe0+m3sQLAK9V00TObyt05Wer1VH2?=
 =?iso-8859-1?Q?a/zQUQumvO7NoVvM8e/lAjLfBdwB0e6+fHbousTcioeHTrJngBElCHTl9P?=
 =?iso-8859-1?Q?0Xm9ZZExsqxpn2D+a8z4yN933Nfhx1OQ6QwKI5+2AknGiDmzJf5MQG/4Bu?=
 =?iso-8859-1?Q?MQ5VK9TbK6g9KrM+z9lJCkGejyZ2/NMZZP8VAPmbPdKl8J4bwOC9CVIUMZ?=
 =?iso-8859-1?Q?koWZHTCuhBl1azcBD5J6oSyLLvXQ6g+OREcvVhgBuHpy4YC1NBYQBPv5SL?=
 =?iso-8859-1?Q?nyqtlLH7yZFRQ2LU6eRRX6x04S6NowO1XgzhwM01fjXTap4vweVvDqNEfO?=
 =?iso-8859-1?Q?mScLSdSQWDvM4fok8xgGHWT4LlRbDR1UAB+1q2QfyIjrrr1UvjJh3+CjOS?=
 =?iso-8859-1?Q?5h46VqJcboMG0cIYBd6O+yfW6Dt7OG/NvRSiakSzCFzHK0Gxbcsl47csI3?=
 =?iso-8859-1?Q?+/HcajWzeHRiujF7eT60Fyw1eWPHk333QFn66ccxYSettl6mFTE79moMKh?=
 =?iso-8859-1?Q?Xjim5SbEkVqbWfssj13iTCcLcNFT13dK2lhO0b5jewJWF8LOWaWvH6TXXO?=
 =?iso-8859-1?Q?xqEuwaWLQ5iv7/iBxV8xqJOC+w+ksLqe97S5tCyj3rnGGZ/GMg/fskJB+i?=
 =?iso-8859-1?Q?JrDJmbb1TP1Nrx8/x/malfguJrUjdj8DZOSW8B/HFNmTSmWk9aS80duJAg?=
 =?iso-8859-1?Q?XQZLxrJedrePgWqIj1OI4g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1akfOupl1GHNpb/K2ZSzSmG72yzR8W+x2iB3nTq1jABl8XEWJePP7dQhS+?=
 =?iso-8859-1?Q?J1CiN+d+R9Kitw9uS9ICVVkqZmL0czmwJmuxgAHMjcQKOK9SKiAv9Q/+Zp?=
 =?iso-8859-1?Q?uxtXzz+P9toH2NzSD5DrugbA70TGsRryp5K7CFkr2+VfvXqQg6637GMLsy?=
 =?iso-8859-1?Q?vbS7N8CrSvMDaFBQ1oMUxwkjpdS580LsjmUtN7MO7tGC56G3MxCNRP0Yy7?=
 =?iso-8859-1?Q?eBwTKN34csShDy3aTXS7wk1lvxRa1mLCilEyG+T3lGi0TTHPFOgNHY2otG?=
 =?iso-8859-1?Q?Y5+fzj7F20EA0dAp5mBn3K6tthHxhEoc+XG1RQluBosmz/Fpbsbs+XzihM?=
 =?iso-8859-1?Q?0pvNsElnEAcaUR1Ctp5PT2ttIcuWzBKn6fFQ8sVljdpv9CilGDDu8K0ZAo?=
 =?iso-8859-1?Q?uMTx/5AjrTDs8MQChsq1TEXKCjTgJJnNtuVPTfDYZli4MSZVE9Wa6Pgq/1?=
 =?iso-8859-1?Q?qXPPCL8wVnrqSOnFaq/pg8yrZoS58CUevRiR8HdZbc7LHNFLxYadxCiBfh?=
 =?iso-8859-1?Q?zdfVNHgObgLUHq92tX1l1FKjlTk10GFzOglFb9YVvmCPBQXbebeiZVdDhe?=
 =?iso-8859-1?Q?nd5nd/TL5eu5JFak8y+gVsyiGx0vwUpCcaS5qE4yFJjTK4J9/yimfwpHpD?=
 =?iso-8859-1?Q?IwGGXJ3l1HU8ibN2zPwe+/4tcFLk/OxF1EAU5bzFi+iEDkd6JL3HBr74AX?=
 =?iso-8859-1?Q?HktUnXcnMI7Q7fOXbXAYdWLQ1z9BVLUjitziLEUCFzgXBUX8b+Y8x8ngOl?=
 =?iso-8859-1?Q?SK0aSS8gDS1MLKggeQR+V7xPw+yU0GdcIRki8NgJASSGT9gvtKTCIChexP?=
 =?iso-8859-1?Q?6LCQjAVWIvSlVdQmDVRchJea4HAo6iw0gjvgkYAmryJUISNytZm50KAMTX?=
 =?iso-8859-1?Q?RNb644BXu8dFAxA1seYsV3Tix7ZrCb18jZ6Zd9PGs/AUjQpU9DuMTmuN1T?=
 =?iso-8859-1?Q?FrlrRw4kGuv/JHlP72vcwBnLh4i5Ly38q1iCyi8XC+tymeeDkJyRQA+Opw?=
 =?iso-8859-1?Q?4Zzsah+rzylH0XG0TlxuI90oz517kYKnLztMYDtzfyim1TNrqHSCJ478Ic?=
 =?iso-8859-1?Q?3mls2br/z290Qtz54hhNCGwC1ipBIfPWHq7JfImg9YWNuhUvEo48FcLoj4?=
 =?iso-8859-1?Q?0zg02Q9kzMetX43KZDZtDxTh+cjXLInQ3LeyI7DUxwx5NkF2P0rMbzU0T8?=
 =?iso-8859-1?Q?NFj3rft92n/KbEKOq+X8wPsrc6npIhXJcPI6YA1u4JIJtG60BC31GjpKJN?=
 =?iso-8859-1?Q?0r2Jb2tDgxc+2wXzbUIZ2QBSfu3NGcOEIFkLlbe7vXsQ5swsNvl1SKlAa2?=
 =?iso-8859-1?Q?6Bg1tvmHF1823C8SoGJMHO3RBS4/cw7rdYpjO21WN1KA2Cx9Z50HurIFa5?=
 =?iso-8859-1?Q?iqvFjv3BCu+rM3BmvLTlngxtWed83d2BP8zrF9gbWPKo4NB9wYRNrs7yqS?=
 =?iso-8859-1?Q?oVyaFeU49fnUcxQW/eq5GOsLW00NmMGFTGR3g7tCEYY+rZpKHH+LztFzC1?=
 =?iso-8859-1?Q?OqDSRRijGY72oSQUbnw5VsdY4HZrygYqR/y8Mel3LvyhsjEaFl4x2IG420?=
 =?iso-8859-1?Q?HicYyTXMK1KYQtm1W0aEoRfedfwMTU1+QDR4qJOa8RhMk8D7Wi7vmxejbT?=
 =?iso-8859-1?Q?PaPLYcdzUasyCh0Kp9ZZZgORQDQS2w6vjmCMHlbJ1aoDLsmWQACSY7iA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0d3709-1bb2-4b95-31af-08de15c5b9a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 02:00:10.2381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyUfdkn4dfE0dYynzxL1lwCbElBNkvz2jP91CgSbekiRWPKkcWA4f/DmKzrJ0B5u62imEisYekQDcv2UxinOMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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

On Sun, Oct 26, 2025 at 09:44:16PM -0700, Vivek Kasireddy wrote:
> Add support for IOV interconnect by provding ops for map/unmap and
> match interconnect. Note that the xarray is populated with entries
> of type struct range. The range type contains the start and end
> addresses of the memory region.
> 
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 135 ++++++++++++++++++++++++++++-
>  1 file changed, 134 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index eaba010777f3..d2b7b5410e5a 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c

In drm-tip vfio_pci_dmabuf.c does not exist as a file? Is this series
based on another series / branch where vfio_pci_dmabuf.c hasn't made it
into drm-tip yet?

Matt

> @@ -4,6 +4,7 @@
>  #include <linux/dma-buf.h>
>  #include <linux/pci-p2pdma.h>
>  #include <linux/dma-resv.h>
> +#include <linux/range.h>
>  
>  #include "vfio_pci_priv.h"
>  
> @@ -16,15 +17,132 @@ struct vfio_pci_dma_buf {
>  	size_t size;
>  	struct phys_vec *phys_vec;
>  	struct p2pdma_provider *provider;
> +	struct dma_buf_interconnect_match *ic_match;
>  	u32 nr_ranges;
>  	u8 revoked : 1;
>  };
>  
> +static int
> +vfio_pci_create_match(struct vfio_pci_dma_buf *priv,
> +			  struct vfio_device_feature_dma_buf *dma_buf)
> +{
> +	struct dma_buf_interconnect_match *ic_match;
> +
> +	ic_match = kzalloc(sizeof(*ic_match), GFP_KERNEL);
> +	if (!ic_match)
> +		return -ENOMEM;
> +
> +	ic_match->dev = &priv->vdev->pdev->dev;
> +	ic_match->bar = dma_buf->region_index;
> +
> +	priv->ic_match = ic_match;
> +	return 0;
> +}
> +
> +static int vfio_pci_map_iov_interconnect(struct vfio_pci_dma_buf *priv,
> +					 struct xarray *ranges)
> +{
> +	struct phys_vec *phys_vec = priv->phys_vec;
> +	struct range *range;
> +	unsigned long i;
> +	void *entry;
> +	int ret;
> +
> +	range = kmalloc_array(priv->nr_ranges, sizeof(*range), GFP_KERNEL);
> +	if (!range)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < priv->nr_ranges; i++) {
> +		entry = &range[i];
> +		range[i].start = phys_vec[i].paddr;
> +		range[i].end = phys_vec[i].paddr + phys_vec[i].len - 1;
> +
> +		entry = xa_store(ranges, i, entry, GFP_KERNEL);
> +		if (xa_is_err(entry)) {
> +			ret = xa_err(entry);
> +			goto err_free_range;
> +		}
> +	}
> +	return 0;
> +
> +err_free_range:
> +	kfree(range);
> +	return ret;
> +}
> +
> +static int vfio_pci_map_interconnect(struct dma_buf_attachment *attachment,
> +				     struct dma_buf_ranges *ranges)
> +{
> +	const struct dma_buf_interconnect *ic = attachment->ic_match->type;
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	int ret = -EINVAL;
> +
> +	ranges->nranges = priv->nr_ranges;
> +
> +	if (ic == iov_interconnect)
> +		ret = vfio_pci_map_iov_interconnect(priv, &ranges->ranges);
> +
> +	return ret;
> +}
> +
> +static void vfio_pci_unmap_interconnect(struct dma_buf_attachment *attachment,
> +					struct dma_buf_ranges *ranges)
> +{
> +	void *entry;
> +
> +	entry = xa_load(&ranges->ranges, 0);
> +	kfree(entry);
> +}
> +
> +static bool
> +vfio_pci_match_iov_interconnect(const struct dma_buf_interconnect_match *exp,
> +				const struct dma_buf_interconnect_match *imp)
> +{
> +	struct pci_dev *exp_pdev = to_pci_dev(exp->dev);
> +	struct pci_dev *imp_pdev = to_pci_dev(imp->dev);
> +
> +	return imp_pdev == pci_physfn(exp_pdev) && imp->bar == exp->bar;
> +}
> +
> +static bool
> +vfio_pci_match_interconnect(const struct dma_buf_interconnect_match *exp,
> +			    const struct dma_buf_interconnect_match *imp)
> +{
> +	const struct dma_buf_interconnect *ic = exp->type;
> +
> +	if (ic == iov_interconnect)
> +		return vfio_pci_match_iov_interconnect(exp, imp);
> +
> +	return false;
> +}
> +
> +static bool
> +vfio_pci_match_interconnects(struct vfio_pci_dma_buf *priv,
> +			     struct dma_buf_attachment *attachment)
> +{
> +	const struct dma_buf_attach_ops *aops = attachment->importer_ops;
> +	const struct dma_buf_interconnect_match supports_ics[] = {
> +		MATCH_INTERCONNECT(iov_interconnect,
> +				   priv->ic_match->dev, priv->ic_match->bar),
> +	};
> +
> +	if (attachment->allow_ic) {
> +		if (aops->supports_interconnects(attachment, supports_ics,
> +						 ARRAY_SIZE(supports_ics)))
> +			return true;
> +	}
> +	return false;
> +}
> +
>  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  				   struct dma_buf_attachment *attachment)
>  {
>  	struct vfio_pci_dma_buf *priv = dmabuf->priv;
>  
> +	if (vfio_pci_match_interconnects(priv, attachment)) {
> +		return 0;
> +	}
> +
>  	if (!attachment->peer2peer)
>  		return -EOPNOTSUPP;
>  
> @@ -189,6 +307,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
>  	return ERR_PTR(ret);
>  }
>  
> +
>  static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
>  				   struct sg_table *sgt,
>  				   enum dma_data_direction dir)
> @@ -228,15 +347,23 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>  		vfio_device_put_registration(&priv->vdev->vdev);
>  	}
>  	kfree(priv->phys_vec);
> +	kfree(priv->ic_match);
>  	kfree(priv);
>  }
>  
> +static const struct dma_buf_interconnect_ops vfio_pci_interconnect_ops = {
> +	.match_interconnect = vfio_pci_match_interconnect,
> +	.map_interconnect = vfio_pci_map_interconnect,
> +	.unmap_interconnect = vfio_pci_unmap_interconnect,
> +};
> +
>  static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
>  	.attach = vfio_pci_dma_buf_attach,
>  	.detach = vfio_pci_dma_buf_detach,
>  	.map_dma_buf = vfio_pci_dma_buf_map,
>  	.release = vfio_pci_dma_buf_release,
>  	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
> +	.interconnect_ops = &vfio_pci_interconnect_ops,
>  };
>  
>  static void dma_ranges_to_p2p_phys(struct vfio_pci_dma_buf *priv,
> @@ -365,6 +492,10 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  		goto err_free_phys;
>  	}
>  
> +	ret = vfio_pci_create_match(priv, &get_dma_buf);
> +	if (ret)
> +		goto err_dev_put;
> +
>  	exp_info.ops = &vfio_pci_dmabuf_ops;
>  	exp_info.size = priv->size;
>  	exp_info.flags = get_dma_buf.open_flags;
> @@ -373,7 +504,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  	priv->dmabuf = dma_buf_export(&exp_info);
>  	if (IS_ERR(priv->dmabuf)) {
>  		ret = PTR_ERR(priv->dmabuf);
> -		goto err_dev_put;
> +		goto err_free_iov;
>  	}
>  
>  	/* dma_buf_put() now frees priv */
> @@ -391,6 +522,8 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  	 */
>  	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
>  
> +err_free_iov:
> +	kfree(priv->ic_match);
>  err_dev_put:
>  	vfio_device_put_registration(&vdev->vdev);
>  err_free_phys:
> -- 
> 2.50.1
> 
