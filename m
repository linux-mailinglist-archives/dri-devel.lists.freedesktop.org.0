Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37270AD7204
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 15:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B1F10E4D3;
	Thu, 12 Jun 2025 13:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNG3Rch0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E31F10E3F8;
 Thu, 12 Jun 2025 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749735124; x=1781271124;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jbmMDb16XUvh8YGOZP7N+4JcRQNapIY88fcfj8o0t90=;
 b=NNG3Rch0aj5hVf8I0HZ4aXRqP2XzkJH5j8KHc60RTrPrjok+YKy52EHN
 k86DYgHW1m45bV/EQUTMATwuV45nhe55c5SJ9nacuqhUtr1hMM/oadxLC
 OsWaYGsw9lwCyeD3nWIC+Qy4fIQk8dYQpk/Su4WIEFkNicuTcrmErqM7B
 dZ6t5SQ2GbV6coYodp58FZ7OmY0tm6pw56mhPKqSK+1wwLBkd8h+xPxf5
 xJxatnDzR3lXaXT4Paxf7stOg0y9uqcf/YZNYm4kAncZLABn2ofh+pbzG
 ccKE3mo+a9fUeONERF0toG5sc0RZKvTwcIsTcYkQn1dyz8PdIIur/St3/ g==;
X-CSE-ConnectionGUID: WchYFa8nSduHZKXi26b2xw==
X-CSE-MsgGUID: +fv1DA1qS8GY+XzvKPCm4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52001923"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="52001923"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:32:00 -0700
X-CSE-ConnectionGUID: YCPZHQDXQJOUfrH5Ma2Sqw==
X-CSE-MsgGUID: 2fwMtyg2T6Wlj6ed69bStw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152429893"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:31:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 06:31:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 06:31:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 06:31:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDkLGfudI86N0gmwmjeotEHh5+ModGz84Ht7OqzImfbOwrc5sFOwwPd7EMxj5UYOZhNcLSdnTf0zgTYLrEIY9uB/hOCDaZiOeUzKmTK/udIOjrpUaZMJ/SpLqXhO03FUzoenKW0KI9iX5EjG025GFxHtC2Vyc5UTYPqSAoQvpTo2yEC1FDVwYcm9ojqlzPX7Q2/NdfT+uKhKPr9Y065Cgp+c4yEKLRpdvC3dZTbjceNSvnYkXXsc19RkeZhYPo8ah6OHimADI+hDYEBfIuthw3THspwoyi9pTj00fiAZsI+Hoo8t16yNBHMzVDN03Nm7+b4EysCGHVz61dpcoDSzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaRsqn5P4C2zbL7NwELTtbmMl68tRXxyKhaFmL/1aoA=;
 b=XxMAC1twN9LtTNiPu1zORQIuebPT46AqqM932JJI0hJDrjPTYQKmr5nPFDFuVlrjbqkVrqdjIeJW7JMI0RWRgdBjLlEKxrvGRtuQ8LWd/hrxy9OnF3mWU2Q34iZnZ88j8KxcFIJxN3+0Lr7sEbVlkKGn8HLnptyR7512qKj7yj+HhXa1lC10UeJFNWx9B83N7qZ8hsr7ZfnIsmF7mKVOi5mAT6gGbNk0UGyikU/3nbSDTCql+zN6PK184DeAL33/9sosvl+U/ji/ff+0CMg6DmNKfNCg/4ZVPx+6uSprS1jsqjHB433orIQq6zw2hGOH9ikLyHMPuMuTcVw5NQhDAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ5PPF1EED2E381.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::817) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 13:31:43 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 13:31:42 +0000
Message-ID: <b21d66c0-88f2-4280-8724-89375bde1f99@intel.com>
Date: Thu, 12 Jun 2025 19:01:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-6-badal.nilawar@intel.com>
 <a51e1b65-dece-4ac4-808d-8749a1a21d8f@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <a51e1b65-dece-4ac4-808d-8749a1a21d8f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ5PPF1EED2E381:EE_
X-MS-Office365-Filtering-Correlation-Id: f52525c7-baf0-4e6a-82d4-08dda9b57802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V21QTWtYM0FpeTNldjQ1MlNVMFppSGEra0dIeXptT2FMNWJSRE1zNHIvOEFJ?=
 =?utf-8?B?cG8vWE5mWGl3NEtYUjBrSTVTOHBNTEtteUs5bUtTQVFBYkR4bXB3bFdoL3hU?=
 =?utf-8?B?czBQMVJ2TVlaN1I3S0pWYnBQWUtzQlM0Y2pTUDFNaFRwSnZqVHMwRkVzZ1di?=
 =?utf-8?B?ckV4UGphR3gzbWRjL3hnNEVLZVZtbE9YTXRVM0J1ZTRnNW51REw1R29acXYx?=
 =?utf-8?B?a0x6aEJCUzdTcXRrR1RmcUZuNGl0T1pvZ1hZdjBPM29zS21veTB6emJaa0Q2?=
 =?utf-8?B?K1JlUllSZlFKaG9LelozdGRKUys3c2FvcjhXeGZSQ0FsZldEcncwSlc2MTJV?=
 =?utf-8?B?VlpFUUJlZG9ERzZZZk9NUVV3Nzlmd3o3WHNlZnRFaVh5UVNPUUdlQkpqZkxZ?=
 =?utf-8?B?VWlXWWJwdEpKdnlMaWFZd0Vtb0s5Mko3cElLR2ZzelhOSDNkSUM0UkxrbjFm?=
 =?utf-8?B?ZStKbmxORXFIblN6STMzNy9ONFlpZmtKU0lRKzE2aWdNaTM4enNZalc0Rmpy?=
 =?utf-8?B?Z0hiS2JWWkYxaUliamJrNTU3YjBvcjVpTVdWZmtBRjUyblN4WnFjS1k0T01M?=
 =?utf-8?B?cUNKUDl1eHg2K2lPUlBnN29EZ2ZRWTd1YzdrSWlqV1dwVEE2b1BRK0szN3kw?=
 =?utf-8?B?UmhFSWJYZkx0NDRzalgrOU0zdWJHZVhZQi82ViswMkJqbVdGakdBYU5sM1dz?=
 =?utf-8?B?cEVMazhHaTMxam00VEg1NG8wbGx5TG5IQ3dwMnV3dkIzTnhsTEc1Vy9XZWZ0?=
 =?utf-8?B?OFFjVHQwdUhNa3ozSEVId1VsSnF1WGJlSUE4L1NPb2dHRHBmSmpieWsyN2NX?=
 =?utf-8?B?OTd1WThPOWJ2WjZPenhkbWUraGxCa2QvSGNDdzFXbkx2aGExVW83WTNrZnhU?=
 =?utf-8?B?Mk0xWjJzRDNNRjZQN0tqZ0Z1UmdFLzk5K0tReFBuZHZOQTd1NDllZFZwR1Yy?=
 =?utf-8?B?RjErWVpTY0hUQU5VVTlYUFZsT0pWb04yVjBjMS9lOGVYSCtMQ3hwZmFINXdM?=
 =?utf-8?B?WDBKZGJ2YTd4T3VHY29UUlpDdWI5MVkyejY3ZTFINVRoVHB0UGpzV28yNHBm?=
 =?utf-8?B?NzBzSWdHNGNQbFpBeTVFM3Q3UzIyVlY5Q2lheEJEdkhrY2YwclkxRTBlQlh4?=
 =?utf-8?B?TCt0NkE2UkROL3h5OHRPa0doMTBQamRyZGFIWG85dVErWU1za3NKek5mUGxH?=
 =?utf-8?B?R0piam5TWFpBb1Vzdm9EcS84WlhPUkppWnRRTHZPa3VER0lFV01ZS2dqc295?=
 =?utf-8?B?a2dzVzFEY0VndWZRYjJxbEVCeGNFdm9md2xsSHR1S0hiZ1hCd08rOUZscHRM?=
 =?utf-8?B?MzZ0SlZ1bnJBWG5zTHgweFpnR0pwdzNaNVBuL0VGc3dUMnVaK1dDT2dxOUlD?=
 =?utf-8?B?Wjh2cDRlUVdIcG13Wk1OQWNnamttdDFxSzdvTmpHMmZoTERGYjAzY29aSVQ2?=
 =?utf-8?B?Wm1aT0c4T3pTaWRHR3hpbXVucS8zZ0VTQ3E4SkJjdXFiM0M2SVNuTGJFN2tQ?=
 =?utf-8?B?Z0tIRFRvTUdZaEpKaXdIc3hEajBHVE9yUXN5L29SUTBpZXRLM3BPeDlySTlQ?=
 =?utf-8?B?cG0wTlpFalBFS3ZYUEZBWi8yNlBrVzRJbFJ5elNVK3B3b0dqeEJVRk9mb1p6?=
 =?utf-8?B?bVJvR1J6dEtTdGJXbUFzamNaY2EvV054eG9DdTA1VnhVN0M5b1NJUXhGZUt2?=
 =?utf-8?B?QzFNZ2JvY2xjVWlMVS95RWNSVHpDSzluMExrSStzRUVlNXkzUGtiaEVSRGZs?=
 =?utf-8?B?VCtXMUd2dG50emMyM1ZweWpGT1RGWlNUaGJJaktBYnA2Y1R6YkE1eEQvWkFW?=
 =?utf-8?B?ajE5eHUyQ0VHeFNjSG1JdHNTSVozeE5GeWxBZU9SQ3haS3NxSzFCZmVKdXFX?=
 =?utf-8?B?aE92NU1KTVI2Yk5FL2VwNVNPZW1RdGZUM1UwdUh0LzY4TDBrd281dE9Xbm1z?=
 =?utf-8?Q?rh67BF5Py00=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVRPUXpWd1Nka01RTWtHWEVVQzhybEllTXdBWlBaN3Z5TU43L2hDWkxBOWtG?=
 =?utf-8?B?dnJyUmlicFhXdXdCTHlSTXQ1MXE1REpmc213TzMvZ1hRZnEyOUluMmRGaGxM?=
 =?utf-8?B?eEF2STBlaTFjK3NvbVg5dDlrT1ZjQ0wzMkh3NnFKSTJSZlhQR3l4Rk4yNVh5?=
 =?utf-8?B?SjU5eFBGdTVuOU52OWJRNjByTW5JRnJtREt6SEs2eldmY042NDAyZDlkQ0lR?=
 =?utf-8?B?OWVyaEp6ZGpDUWt2N0hmNHhMN0pwUC9xUjdtRGVYcjFmNjJoTXNOSWlqYnZl?=
 =?utf-8?B?WWxMYXBheGhiUXR6QW9lVHJULzRrVkdlVUZ3WWk0VEtvOGNkWXNyb1QxYlBz?=
 =?utf-8?B?dzhZbUNpVVNZbzlVV2ZrNW9kRWdLWXJUaGlIY2pqejRzeUdWZWZNb3o2ckp1?=
 =?utf-8?B?VWF6OTR6dWcwZFYrVVVSUHJiSDhhOUNaelpLY01nZnZHYXJ1SFprZGZDTlpL?=
 =?utf-8?B?Y1ZFcVQzRmF3WXhOWmFpY0N2TjRCMkJJM1VFR3Z1VG1TcWh1WmU3S1pZZEtm?=
 =?utf-8?B?MlpyS1lYVDhVS3BESmd3cnJyeVA1R2tPWGE1c1JrbTZaMnJ0emVCVytiM2Ny?=
 =?utf-8?B?NUVSK1p1czFmM1R6RXhSSW04N2ViTm9KdkludGo3NzZFbHoyYXh2b0k3aURV?=
 =?utf-8?B?cWE2L3I1T3RWRDFteEs0V3ZYMlErWXdtejBPcGlqV1R3VDlYN05hVDBZSkF0?=
 =?utf-8?B?RHNjQzdDVFVaRVQxNW5acUxUVU12b2NTVFFuVGlEanBWUzRYR2NFOVdYT3Ji?=
 =?utf-8?B?djd0anJ0Q0dEYkVVUVhlcEFBMjI5T0w5WTlaL2g1WTFjWW82bkp0VEZnL3o0?=
 =?utf-8?B?ZzJIRXpVZ0xoT25hdzErYTdmWjRPeXF4NEVDdW91QU5OK1ozZHYzZm1UdEkw?=
 =?utf-8?B?SU5hYU5obGF5d1dkTVpqSVpWL09uRXBvWEIzVDdiZFQ2TVlCQ0RlL1BLaHRV?=
 =?utf-8?B?R2RwUGVkSG9URTE1bjFZcWxKdHFma3g0cXBzNnRNS0c4NG1yclVsNFdDdWlV?=
 =?utf-8?B?UUV5WUM4OXJkTVJXdVlVQjRWUGwwZWREUktEWGRFVUExQVQ4OHZONGl5VkZ1?=
 =?utf-8?B?VlhxTk5lVWdSZDRkSlB0SVNMY2RiekZpcmpKZ1RHU2NtaTFqdnJiYUU4SWdV?=
 =?utf-8?B?aUt6bVQ0SEVudDgydjVJS2NpY0gwSUw3bXc3cGhLYUF2dHU4UGlNQjRkS29y?=
 =?utf-8?B?QWRDSEpQUDdpTzRmWEh3Q2ZlckdhcmR2ZUVCbDN4UTJzSGdMcU9tOVpueHNr?=
 =?utf-8?B?bHNuZlZsT01nQ3I3bGhlUDE4dEx5Si9SNDkwV1VyaExEMjNzSWpZdUVxNTh1?=
 =?utf-8?B?MzJIYU90MXNxV1oxd05lOUZKdzl4UTZ2b0JXWkFzOFpRcU5OcDJmZWFIc25T?=
 =?utf-8?B?MnZJa0p3QnZDOW1Sc1JyZS9mZUsrVk15ODhaVXVDQUN2Zzdpa0NRL21ROGd1?=
 =?utf-8?B?MitrOVBPNE5ObmY0WnZaUmFpTnlJNzJYNUYxdTM3cHVZQXpWOXdKYzd5eC9j?=
 =?utf-8?B?UTBLNWlFTmhMN2pjYlVHTmx4SGx1VEw1eVRUd0ROU0pMRkJYL05RZDVMTnFB?=
 =?utf-8?B?VGNPYXh4SXdzcDY0VFJtK0JoM1VCNE10UGxKeEpJVlBCOVlpTWd3akVGa2JC?=
 =?utf-8?B?L09FMEYrNlBEUkUweXQzWUtGSHZlVVg3M1hacExzNHM3ZVVmdUF4alF6Y1hq?=
 =?utf-8?B?ZmdUcTlUU2NQbENoNzFGbnVRdVdJdHYzdEc3NnhOcTBFa2g4TnNTbXluSWRO?=
 =?utf-8?B?SG1nVVZUdjI1b0lqbmxOK29Ia1N2TlJObzlOUnV1QjJDcnFYWDlURXprU1dz?=
 =?utf-8?B?Uk1lbnJUdTZ4eFE0RjdDbXZMc0xKRHdrWkozM3VlNGxaeEJnSUxRbFBPNkd1?=
 =?utf-8?B?eDBrTGEzQjQ3QXg2MFVLeGFZL0drWmpMWFFJZXJRZUdYV1A1RTk0SVk1YVBv?=
 =?utf-8?B?VVgzZ2FxOER2Z0VmNVp3d2tPcXVsY21KVHNWeXBWUmRwYWhWU09BMU14M3dl?=
 =?utf-8?B?bmxqd1Y0REtiSW1kMExMTkNvUWtMUFZ5ZXRhcjdwMGt6STJIWjBmTmx4YXVC?=
 =?utf-8?B?dCtTUWlvZm4vU3ZyVGZyVEt6R3RPQVJyZDl0WFEyN1dzeld1bHNHMC8wZU16?=
 =?utf-8?B?bjZLZU9LcEVmeVpXc2NhR3liTnN3VUc1ZUltalhGREpLNHlYMnBmVnFTZFFM?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f52525c7-baf0-4e6a-82d4-08dda9b57802
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:31:42.8104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8oUSvePypHhVLVUC3rdVDn2QuWIa6S1zqt17w6uGGw9l5qqXp0NUeQmc/rpjt6mOiSFNdmWkeBXaCpJw3958g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1EED2E381
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


On 11-06-2025 05:47, Daniele Ceraolo Spurio wrote:
>
>
> On 6/6/2025 10:57 AM, Badal Nilawar wrote:
>> Load late binding firmware
>>
>> v2:
>>   - s/EAGAIN/EBUSY/
>>   - Flush worker in suspend and driver unload (Daniele)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 121 ++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   5 +
>>   3 files changed, 126 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 0231f3dcfc18..7fe304c54374 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -16,6 +16,16 @@
>>   #include "xe_late_bind_fw.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pcode_api.h"
>> +#include "xe_pm.h"
>> +
>> +/*
>> + * The component should load quite quickly in most cases, but it 
>> could take
>> + * a bit. Using a very big timeout just to cover the worst case 
>> scenario
>> + */
>> +#define LB_INIT_TIMEOUT_MS 20000
>> +
>> +#define LB_FW_LOAD_RETRY_MAXCOUNT 40
>> +#define LB_FW_LOAD_RETRY_PAUSE_MS 50
>
> Are those retry values spec'd anywhere? For GSC we use those because 
> the GSC specs say to retry in 50ms intervals for up to 2 secs to give 
> time for the GSC to do proxy handling. Does it make sense to do the 
> same in this case, given that there is no proxy involved?
>
>>     static const char * const fw_type_to_name[] = {
>>           [CSC_LATE_BINDING_TYPE_FAN_CONTROL] = "fan_control",
>> @@ -39,6 +49,95 @@ static int late_bind_fw_num_fans(struct 
>> xe_late_bind *late_bind)
>>           return 0;
>>   }
>>   +static void xe_late_bind_wait_for_worker_completion(struct 
>> xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct xe_late_bind_fw *lbfw;
>> +
>> +    lbfw = &late_bind->late_bind_fw;
>> +    if (lbfw->valid && late_bind->wq) {
>> +        drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
>> +            fw_type_to_name[lbfw->type]);
>> +            flush_work(&lbfw->work);
>> +    }
>> +}
>> +
>> +static void late_bind_work(struct work_struct *work)
>> +{
>> +    struct xe_late_bind_fw *lbfw = container_of(work, struct 
>> xe_late_bind_fw, work);
>> +    struct xe_late_bind *late_bind = container_of(lbfw, struct 
>> xe_late_bind,
>> +                              late_bind_fw);
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
>> +    int ret;
>> +    int slept;
>> +
>> +    if (!late_bind->component_added)
>> +        return;
>> +
>> +    if (!lbfw->valid)
>> +        return;
>
> The first check is redundant because lbfw->valid can't be true if 
> late_bind->component_added is false with the current code.
I will remove this change, while scheduling work already lbfw->valid is 
being checked. Shall I even remove check for late_bind->component_added) 
as this is also being checked while before scheduling work.
>
>> +
>> +    /* we can queue this before the component is bound */
>> +    for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>> +        if (late_bind->component.ops)
>> +            break;
>> +        msleep(100);
>> +    }
>> +
>> +    xe_pm_runtime_get(xe);
>> +    mutex_lock(&late_bind->mutex);
>> +
>> +    if (!late_bind->component.ops) {
>> +        drm_err(&xe->drm, "Late bind component not bound\n");
>> +        goto out;
>> +    }
>> +
>> +    drm_dbg(&xe->drm, "Load %s firmware\n", 
>> fw_type_to_name[lbfw->type]);
>> +
>> +    do {
>> +        ret = 
>> late_bind->component.ops->push_config(late_bind->component.mei_dev,
>> +                                lbfw->type, lbfw->flags,
>> +                                lbfw->payload, lbfw->payload_size);
>> +        if (!ret)
>> +            break;
>> +        msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
>> +    } while (--retry && ret == -EBUSY);
>> +
>> +    if (ret)
>> +        drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
>> +            fw_type_to_name[lbfw->type], ret);
>> +    else
>> +        drm_dbg(&xe->drm, "Load %s firmware successful\n",
>> +            fw_type_to_name[lbfw->type]);
>> +out:
>> +    mutex_unlock(&late_bind->mutex);
>> +    xe_pm_runtime_put(xe);
>> +}
>> +
>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct xe_late_bind_fw *lbfw;
>> +
>> +    if (!late_bind->component_added)
>> +        return -EINVAL;
>> +
>> +    lbfw = &late_bind->late_bind_fw;
>> +    if (lbfw->valid) {
>> +        drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
>> +            fw_type_to_name[lbfw->type]);
>
> This log seems a bit too specific, also given that you also have logs 
> inside the work

Will remove this log.

Thanks,
Badal

>
> Daniele
>
>> +            queue_work(late_bind->wq, &lbfw->work);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * late_bind_fw_init() - initialize late bind firmware
>> + *
>> + * Return: 0 if the initialization was successful, a negative errno 
>> otherwise.
>> + */
>>   static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
>>   {
>>       struct xe_device *xe = late_bind_to_xe(late_bind);
>> @@ -87,6 +186,7 @@ static int late_bind_fw_init(struct xe_late_bind 
>> *late_bind, u32 type)
>>         memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>>       release_firmware(fw);
>> +    INIT_WORK(&lb_fw->work, late_bind_work);
>>       lb_fw->valid = true;
>>         return 0;
>> @@ -99,7 +199,17 @@ static int late_bind_fw_init(struct xe_late_bind 
>> *late_bind, u32 type)
>>    */
>>   int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>>   {
>> -    return late_bind_fw_init(late_bind, 
>> CSC_LATE_BINDING_TYPE_FAN_CONTROL);
>> +    int ret;
>> +
>> +    late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
>> +    if (!late_bind->wq)
>> +        return -ENOMEM;
>> +
>> +    ret = late_bind_fw_init(late_bind, 
>> CSC_LATE_BINDING_TYPE_FAN_CONTROL);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return xe_late_bind_fw_load(late_bind);
>>   }
>>     static int xe_late_bind_component_bind(struct device *xe_kdev,
>> @@ -122,6 +232,8 @@ static void xe_late_bind_component_unbind(struct 
>> device *xe_kdev,
>>       struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>>       struct xe_late_bind *late_bind = &xe->late_bind;
>>   +    xe_late_bind_wait_for_worker_completion(late_bind);
>> +
>>       mutex_lock(&late_bind->mutex);
>>       late_bind->component.ops = NULL;
>>       mutex_unlock(&late_bind->mutex);
>> @@ -140,9 +252,16 @@ static void xe_late_bind_remove(void *arg)
>>       if (!late_bind->component_added)
>>           return;
>>   +    xe_late_bind_wait_for_worker_completion(late_bind);
>> +
>>       component_del(xe->drm.dev, &xe_late_bind_component_ops);
>>       late_bind->component_added = false;
>> +    if (late_bind->wq) {
>> +        destroy_workqueue(late_bind->wq);
>> +        late_bind->wq = NULL;
>> +    }
>>       mutex_destroy(&late_bind->mutex);
>> +
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> index a8b47523b203..166957e84c2f 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -12,5 +12,6 @@ struct xe_late_bind;
>>     int xe_late_bind_init(struct xe_late_bind *late_bind);
>>   int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index c427e141c685..690680e8ff22 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/iosys-map.h>
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>> +#include <linux/workqueue.h>
>>     #define MAX_PAYLOAD_SIZE (1024 * 4)
>>   @@ -43,6 +44,8 @@ struct xe_late_bind_fw {
>>       u8  payload[MAX_PAYLOAD_SIZE];
>>       /** @late_bind_fw.payload_size: late binding blob payload_size */
>>       size_t payload_size;
>> +    /** @late_bind_fw.work: worker to upload latebind blob */
>> +    struct work_struct work;
>>   };
>>     /**
>> @@ -71,6 +74,8 @@ struct xe_late_bind {
>>       struct mutex mutex;
>>       /** @late_bind.late_bind_fw: late binding firmware */
>>       struct xe_late_bind_fw late_bind_fw;
>> +    /** @late_bind.wq: workqueue to submit request to download late 
>> bind blob */
>> +    struct workqueue_struct *wq;
>>   };
>>     #endif
>
