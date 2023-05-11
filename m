Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA976FFAE4
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 21:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D2B10E0D3;
	Thu, 11 May 2023 19:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2597210E0D0;
 Thu, 11 May 2023 19:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683834936; x=1715370936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tV1RtbXKsueDb5tbGc9ZLGMnt6lfBYm7/eJ3X/1ggt0=;
 b=YRRCWXVfwfvKlfOEOPP2LZXFoLsP5COTvRdg7UIBKDm8QBBirUjiN0DR
 gDGQiNtHCpEhH/AE9TC1blEf1lcu7p1nJH394k+LDEF3OjDmjGeNa2yND
 ge86uBhaNk90OwEnnqZ7DLNqvhl9soGFz9b7K6X7tqRjtgE+CC/2oU7WQ
 GaK4oIyiKgXkZPjJIDzIKfHA7lviIU06w6g0QnwY2jOtdAHvvx/38DVB8
 JUfCxTRyehBYzDzaewBXLnFbxZ4oZyvkFbiki9tkqNtUmtC9K4CUwK6ya
 U+JYvGFRNrllbsk6InOs4sS1GrApPFl7OY+9cgj0rbfD2H9yFV43rGH5R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330234587"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="330234587"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 12:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="677391278"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="677391278"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 11 May 2023 12:55:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 12:55:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 12:55:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 12:55:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 12:55:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbdL/EalREgUKFlw3vAGebowAcAzx6qtTpafo9CKFb+my6htzxfsRlicPwb7xlTdaq3sWDapc/W355fQgSnUL+VeaWwd2ZT3caK53+aQMqeBBncx9RPs3H96UN8L3al9q2wC0FrxEYJDfHZ1nXbE4nEM5n/yOgvVYRr2b4op2V7dXsiOyAKVOGn7bi2WOKpWXtrInK2v2kukciUjo0dTerweW88eqRNyl68N6mFpuxfGjx+wGWCv2G4C9+oZphzPP02s/d8VRfpsvgY+BhtpwPr3W9YVnvp4il6G9Tfz0RV+F2RkyvkqBWYXRl13V22ohrmZyrRCekc1gT0aooNQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjgO2ne2MKIuFEx8s/qwQXQnQdYER1PkVx8U3DWQKWo=;
 b=MtYMFIgLDOqaVMt470Mi6u0yiIzD72oh6o2WaOjiyCcVbRvv9bDjgPIrlM5hXz+9lUtgsv0JwZLF23xr6jSOZyZ5GLZOEyT2roKfS4Qtbh8KmA959PhG3vRxvP/Ry1O6mvWb618CYeKlvVdZWpupb7VWwii7e70rQ+hNa0ymCIcHAoC89miQrD4p7PbT34+0heztvLbd11Ko6+sBzENCI0QBW4eI2TE4WFOQcil5sM3b8bQV7p/hfgQhVdHCIJ9AS+VNwDZHldXZKCoJhMtSsunHx9M0kIGLtQfS2Q7PEyyh0j/x8zFy5sWkufgFMx60zDz1g5Cala7o4QBnAbpwGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Thu, 11 May
 2023 19:55:32 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Thu, 11 May 2023
 19:55:32 +0000
Date: Thu, 11 May 2023 12:55:25 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/fourcc: define Intel Meteorlake
 related ccs modifiers
Message-ID: <ZF1ILXLX6QG5Bf9K@msatwood-mobl>
References: <20230511103714.5194-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230511103714.5194-1-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: c757203a-4a27-4369-710c-08db5259ad7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b1TA5fNEg8EtALdGuOEe20reeRCNHiO2uIlHMVTBQ/XZ0TwaL+pRot/Uz9i45Q0lPn1kKKvkSP4XGwUxUXllreNhIsIDEYTPI7hjj2Ev6xiaX34jiRPJR4DkJI3RbWVUSXceqqo4WDslmD4/r2YkI1EFET5wnjuLOZ+ULd7xgtvrJPQIiGrWcY60r+Db7PBQuWo/08hW5YjnamvExSOxLgzIBXJpK1f984Un25GK8MCKKf5S3vkt+QXEkfkR6WMWVhGxG2rKqnQNLNO+d1F61J2orSqY975KYyxjlA8FDugVjLdZUkTTAWON2Aw0TrDiGFrAetzqO0WUTRrL+45pBxSF3IxtQGFAeq4H3e2qt9xBZok2QFx13841RtOiqNW7yqicB2mjMheOaSErkJSBE6JlYiU7qQ2BuLdWr0N7diRfwvll8WYforl5sX8NUZQFQzy38iqqoN6/g0whqzPe4KxsIOvlsKogZ6Y58EetAedXu8ig5qoTeP4vsTp8Ra2Q12HevfK+3I4aXiL3qj5E/swKfAaOoD1S60KhY8z+ajqQH0UKiz7N7FawOyFmshDb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(86362001)(33716001)(316002)(83380400001)(66476007)(66556008)(66946007)(4326008)(478600001)(6506007)(6486002)(186003)(5660300002)(9686003)(26005)(8676002)(2906002)(8936002)(6512007)(38100700002)(82960400001)(6666004)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEZpSGRqMnBFNlVmRy9kaEZ4cGhyaEc1eEpESDlWTVYzWHpvbGJ1QTFQbTFD?=
 =?utf-8?B?eWoxU0YydlRaNlN0ZW5LdEhVcCtpbXNidkk0bklZS1UrN1NWMzhMdlR5bVR6?=
 =?utf-8?B?aVpkVHN6WkJ3UHRZOGpMSWEyTHRKc2VDY2JLYXN2NGpwbEJJL2dzTVZDcmdU?=
 =?utf-8?B?TkwySW9BTnIzelZFYXZwaVgrRThhTWx1ZWxkZ2dySFFiVVRJeHVKZmZaRVVB?=
 =?utf-8?B?aElJQ1pzbmowSkNiM29lOVRwRnFuKytmalZYTyt4RVpPWFhWT2dTQ2VDNTAw?=
 =?utf-8?B?M3FHUGdDUWVhT1pSTnUzSzE0RC9SVzBHZGlnakxkZ3NDK3QzUmdtN1FPa3Bu?=
 =?utf-8?B?M3dCOTM5eS9uMmV5VDh1WEw3TG15c3AxckdKR3BPQmFtNnhWcVNtZFgxcS9t?=
 =?utf-8?B?Ty91Z1kyV0ZocUFZOFNRMVJnR3BtdFhlTmRCWURTdWdBTkJiTFdYa25hdysx?=
 =?utf-8?B?YUtnNU1heDN6VnFjK0U4cCtqd1ZyVXBTbG5zTmpqcCtiQ1VYMmsyRUVCdGZ2?=
 =?utf-8?B?a2ZMeEFwekp1bWNocVcvUHM5TStvRDlkZ0drd0srNVB5R0Nma0hLZ3ArSWRi?=
 =?utf-8?B?R2JDdUh0NUZKYlpxWUdlOVlNbXI3RCtSOWJpZFQyeEVYMnc1VGZodm5Ya000?=
 =?utf-8?B?YVBBY09GWWkvQUYzUnJIQmVFWWtMRWRQNUl2N0RYODN4Mm9MQVc2STF5SlBL?=
 =?utf-8?B?UkIxQUJpeG40TlVYOGVRRG5WbVJRUVpJUDJ0QlN0QlB6MDJaVU44TmFWMVVT?=
 =?utf-8?B?NmZMVFJESCtkM21DYzJacDZXa0JvUjBsSE0vTU5JUXdFM2w2dFFydnltbjR2?=
 =?utf-8?B?aW9XcHAwelMzT2pTQ1h5cU9xUWovL0pvVXNGOEdibVFCbmszK2NsTG5PSXVj?=
 =?utf-8?B?Y1d6dmlvanlvbk5keFZsMlhiVWxjKzBsbU0zTlNOSGpiY1d2T29xRkNucVJO?=
 =?utf-8?B?blNEQUNYTUdLQzY3d3RaR1RIWHVVTUhnUFBOZ21oeE1DMEtjdStjRGpjMHRC?=
 =?utf-8?B?WUgyODRQNEd1QisrRU9KenNWb2xoTkM5NkJIVkdWVG5QMHNiREpWcVhMaXI5?=
 =?utf-8?B?MURDVjZPODNmWnhoWjNGbEJlZkxuZkNlOVE1cDk5dlhSaC9EMXduUG5nQksx?=
 =?utf-8?B?L1ZHTlMvb3Q2d1pGU2NjbUZSNnVianJpQXFLaXRkSzc0MytHT1cwajFySHJ5?=
 =?utf-8?B?VlF3ODE2TDJZZnZYZS9vekttUTRnK08wQjFmcFA2U2lObEpWN3dwTE9TcTJI?=
 =?utf-8?B?WnNUSmRRa3IyRkt6NU9FdUErWlFDZldMUVRCSWV3VkxYMUpBVlFETEVYZHZv?=
 =?utf-8?B?Sm1jUGxNdit5ZlZwWUJJY0RETGJ2R25zN2pVRUVUaHVheEJqdG80c1VyUUtM?=
 =?utf-8?B?bjhsaHVNUk4yNm1IcEpZTTVtbW5OeE1CZVo5WHEzU0g2OFBjNEJxWVZyZUhC?=
 =?utf-8?B?anRuOEJqa0x0Nmd6TkNXM3krbnBYVlNlRURnaDBjdDVRYkZvMFNzekpwL3Vo?=
 =?utf-8?B?NEV5U0pleFFadHZaalRvWXVUYURXR01MSHlaZEpRN3BYTFBRZERRUmdXT3VT?=
 =?utf-8?B?THRxeTd0Uk1qSHpweGFuU3M0N1JEb2I0UE5iWGIzVHA5UE1HQUtCeXhxK0tz?=
 =?utf-8?B?OUhHWDVXUzI5MEdiczNpOXE5VFFjWFVLTUZYbzl5dVR6dlFEYi9QZ1FUcjJM?=
 =?utf-8?B?cys3OXVpSDNiUjV5TlNid0twaGhjWHR3b3J6azJwR0hJZUNPblpNaFVEbmJm?=
 =?utf-8?B?S00yOUNNUUxQOElHUk55KzNWdldUQzhGS0xYWHBabmdkZDJDaWlXQk03TSsx?=
 =?utf-8?B?djNYczZXUkpPejBTN0RsdVBheTVuNER1UElOZmEwYStZRzNxbnRZcHhHakFx?=
 =?utf-8?B?VjN5ekJaUER5dXB1eUtFR0ovWElEMVNPYnJNUS9kRHFsR3JVRUUwc1lKZm1Q?=
 =?utf-8?B?dEpCRXhZbEdGMlg2N1kxSk55cjhUeDY5WWowNXAyb25RN2UrWUFGMEwzcmhl?=
 =?utf-8?B?SlZ6aXVqRktWUkxOc08wc0IrdktCKzJ5VDBZdHVXR09GTnNDRzRZMVdNeDBj?=
 =?utf-8?B?eExXZjdaUTJCVGVPd2gvMUNCWmxBVGFoRDdHWGViSVVDM2VabWFMUS9wTUN3?=
 =?utf-8?B?SUhNN2dNYXA3RythVUZiTHFPZWY2K1ZaR0RieGsvTUo1OWREOElCU0VhZGU4?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c757203a-4a27-4369-710c-08db5259ad7f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:55:32.3469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUOHnnfEg5DJ27OFZ560+ZY3m/txybFxLf4bGmmASkoLT+LRBdsTcSMe+WCqldKmNsd6Ae4pCoZZjhlzNDSLW1/RmkZaFJ8pOVf1b5LYJeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 01:37:13PM +0300, Juha-Pekka Heikkila wrote:
> Add Tile4 type ccs modifiers with aux buffer needed for MTL
> 
Bspec: 49251, 49252, 49253
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 43 +++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index de703c6be969..cbe214adf1e4 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -657,6 +657,49 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
>  
> +/*
> + * Intel color control surfaces (CCS) for display ver 14 render compression.
nit: Color Control Surfaces, ver.
> + *
> + * The main surface is tile4 and at plane index 0, the CCS is linear and
> + * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
> + * main surface. In other words, 4 bits in CCS map to a main surface cache
> + * line pair. The main surface pitch is required to be a multiple of four
> + * tile4 widths.
> + */
> +#define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS fourcc_mod_code(INTEL, 13)
> +
> +/*
> + * Intel color control surfaces (CCS) for display ver 14 media compression
nit: Color Control Surfaces, ver.
> + *
> + * The main surface is tile4 and at plane index 0, the CCS is linear and
> + * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
> + * main surface. In other words, 4 bits in CCS map to a main surface cache
> + * line pair. The main surface pitch is required to be a multiple of four
> + * tile4 widths. For semi-planar formats like NV12, CCS planes follow the
> + * Y and UV planes i.e., planes 0 and 1 are used for Y and UV surfaces,
> + * planes 2 and 3 for the respective CCS.
> + */
> +#define I915_FORMAT_MOD_4_TILED_MTL_MC_CCS fourcc_mod_code(INTEL, 14)
> +
> +/*
> + * Intel Color Control Surface with Clear Color (CCS) for display ver 14 render
nit: ver.
> + * compression.
> + *
> + * The main surface is tile4 and is at plane index 0 whereas CCS is linear
> + * and at index 1. The clear color is stored at index 2, and the pitch should
> + * be ignored. The clear color structure is 256 bits. The first 128 bits
> + * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
> + * by 32 bits. The raw clear color is consumed by the 3d engine and generates
> + * the converted clear color of size 64 bits. The first 32 bits store the Lower
> + * Converted Clear Color value and the next 32 bits store the Higher Converted
> + * Clear Color value when applicable. The Converted Clear Color values are
> + * consumed by the DE. The last 64 bits are used to store Color Discard Enable
> + * and Depth Clear Value Valid which are ignored by the DE. A CCS cache line
> + * corresponds to an area of 4x1 tiles in the main surface. The main surface
> + * pitch is required to be a multiple of 4 tile widths.
> + */
> +#define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC fourcc_mod_code(INTEL, 15)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> -- 
> 2.25.1
> 
