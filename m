Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BA18B1495
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 22:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA49A113D8B;
	Wed, 24 Apr 2024 20:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBPE6vRW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812B311208F;
 Wed, 24 Apr 2024 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713990587; x=1745526587;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kLAgvf+tDX27USKUnNScCzVuVi6GpAvHLsmylcnV6a4=;
 b=CBPE6vRWr5vt2jDoEGQRUPrNw/2U8SKTSGLqhRI2vzefLbhfMGfK8rH3
 Q7hSb3B1TrEp+EtsT8Tf14pP7W9rdg/z82fBNQgcR1JkFz1Me/4tuEXCD
 YUEpydQAhejgi6il6OShrQ11Fq7wetNIv1QQ/zCZnufxa+AZAIuIRtzxB
 6r5gWh8jNW8vzOrBZ/NwfROzooh9H4jjyLFGBXPg32d05siGYSCG3H1e+
 Es+WswseCqSxtu50kh3ix/RTp3G2jHwABbqlLk5CbBX5Tz1WLJ6p6ebMu
 x3ttKBu+hLCqpzW66JKqBCXPkhrFWBxIFmgAoAsJrsAiTM0ut7JIbDXCL g==;
X-CSE-ConnectionGUID: k0DLORCdTL2UmcqeewntKg==
X-CSE-MsgGUID: FyYlMFzRSPq4WzefrpbcTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="35042927"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="35042927"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 13:29:46 -0700
X-CSE-ConnectionGUID: JdhydyupRbOV1+zerbn/kg==
X-CSE-MsgGUID: S9PtYHd8TAmtH/yYaNjrLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="25342133"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 13:29:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 13:29:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 13:29:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 13:29:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbXjZ6S6AZ3XUeV3gNbn5H93j+0QFHWVG+cC+MUWp39a1m/CWk5EgOgB3wyrbbbYhpQIYnlViAuSFCqwQTN7/we2YWS5ZtwY77Nqhw8wkHqx9/talKCxMDJ1M/H5dCqkeblmZVYGgMpcGFllDJDCmLET6BdHXMNWCYi4GW9a5tF8Amktyd6v3o0O7kJEQHToHRKUoV4zYJ/kMH7flDdS27+kKJthCxevRn0ijj6t69hS0YkuXs7TpkvGcJEG+Y6AMSIGlMcWK4V8FrcP9I+69qUM8qXju9qoq5OO0RyIZfwKveiz6mI86RXFkIXYOxBRCZ2KKvi45ruf+5ddb8qy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOUXRXsRTl0erS6jDIFwOhEHMBVOBFQxlTK/ULQDhew=;
 b=dgPzWZF9CVdIMPJkxojamGtwgkoVkpZemQsbplGXxOvrpnS7b5wo9hf5G/NltB2UVAv3Vp+wkAg8HOiSVNsXQIP/+mo6LP4H0t3nGCKEfv3kK6G1FKxkJZEA1G01p8G4kT1iSVYzsBYAZ65dYn1VBzhlUSDvO5CdnyOeZmMhPmPRQrvLy1w8EVaS2EX/yDYbIqcJI1inAo+ZU6RqfvA9M3ccFOzpF4wodKEAHBlSyIdxa/3QZlCpZJqsYFA+k58HhQdsGwFGyYsMYG1OQvsuDzYkTwUFNd3KkyMpaGc2Tsl9NAFE3y7kRpGuAHmAECoJs9ABilp6nFTKfJxC7eJVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 20:29:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 20:29:43 +0000
Date: Wed, 24 Apr 2024 15:29:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <ville.syrjala@linux.intel.com>,
 <imre.deak@intel.com>, <tejas.upadhyay@intel.com>,
 <jouni.hogander@intel.com>, <javierm@redhat.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <ogabbay@kernel.org>, <thomas.hellstrom@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 0/6] drm/{i915,xe}: Convert fbdev to DRM client
Message-ID: <ypktbd2nxt2dd6h2yzgcuz3zlgvpsdbldib2bhvh6pq4w55mq5@ryp7doqn6sye>
References: <20240409081029.17843-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240409081029.17843-1-tzimmermann@suse.de>
X-ClientProxiedBy: BYAPR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 3850e833-dc7f-43e7-76a0-08dc649d463d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007|7416005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fizT24s7WZmEGBlwsnrygwZKu4/cKKXrWxLteFJzzltsoEr3eAYRu8nVapy4?=
 =?us-ascii?Q?yjB2ztHEDdn4+YXknHoMW/sd2IJlwNwN5WLsiYIQi80YiQNqwHHObwQxqb66?=
 =?us-ascii?Q?0cYdIymzh1o07db4SO3eVEd8T/jUxYTg0ZIHt/z4r6zV1UnWkUSTiSXehSWC?=
 =?us-ascii?Q?O27Qurknt1BBluzLeBmvx0kjRRDrHgWqfQ+xgz/3KqwZ1lkOcqFD60EbWG6f?=
 =?us-ascii?Q?shcSw6fACSc2l5GZj5dqiHmIvBIBpYbqKEd1Dbg++8eZobbA0X5Um32gTlNT?=
 =?us-ascii?Q?1wtORAI3PVbozVJp0r9hv6IzR3QbGD2d2o7GahLuZwtQ5U2+Hjq3tWW8u9Lw?=
 =?us-ascii?Q?uCGkFdukLWOfHC0t1p7/M0Zvft31kBktaNlOYxEw1tmG/SOVW8/Q5HrzYmtl?=
 =?us-ascii?Q?cdqiXDOGuE6/S+bt1PfxFhwbuh+jxhkyf63ToNLhY637ftrWsLOiOUHIyxmW?=
 =?us-ascii?Q?aOANCU7TfJMagmMAz1Vtm4d1lSnNBi2d62vSXf4Dw1+j6FO4LtW3LDuFPE3L?=
 =?us-ascii?Q?t/M7FfQ/sWuT1eNRWpMeklXOlFx8GqR7XfUYnA96O3dx/S26CINtYCmcSw6l?=
 =?us-ascii?Q?MIkjNrHu4fukgLnvAPyY8ttYoh/AAcMmJ8QrxKmGgF6FSnqZHi8n/r1RoR+Q?=
 =?us-ascii?Q?MptM4gCBVHXsI3Uw6ASG2Di1xr7GxyhAm8i1GhD95bTkMr4IVoM1S4myQpQF?=
 =?us-ascii?Q?IbvGzqv1REVrB7/iG/JIAMdHau2hJemMXG7oWvcQGcaKua8jCNGJpmWKs5L3?=
 =?us-ascii?Q?itt7CNdqLxyiRVE0ZlwWQ3V8qzVOKm5HwgZMpcnjge6/bEC19Ikr9ppx7xIN?=
 =?us-ascii?Q?YNm57YDSairPQjgcKSqZNxWBvl/u1aTlrEV6b4IBqG2JGkl/MvWb5yS1jIzu?=
 =?us-ascii?Q?BkEBJuKDfMNWyzwoD7vaoyIK5nnfLrfKCeE6naUxs5rMoV/N5RarMugRFhAN?=
 =?us-ascii?Q?xqpLlzm2VtM3d3YPr4R6IKQ+3qKXAgHISaRl2z+eZWcdhVpgNllAQt3B+qYD?=
 =?us-ascii?Q?gICCkbU6V3l3ufuH0T+JdCVvvYeiETvZRSpF9a5CRf411Bxs8fVVl0aLIGlh?=
 =?us-ascii?Q?oMXzJqyhO0u3ys3xpSGOeG8b4Y7ptIKDZS3iBJm+e4ro4idI6oPRHLxnigkk?=
 =?us-ascii?Q?UBCuyo9kMpiJlK6GY1Nqu+aa4My0H4ByO9cF3ooqYT7z5dzmXUlx97EB9k2T?=
 =?us-ascii?Q?lobHS+kU1aQKbJrnAQpdePbmSuxu4jMUyiiU8AyV7rmgXiuehc1PdT00OAeM?=
 =?us-ascii?Q?aswnvdDZm8jrRMUlwTfKKK0dWS3iLKXDFDIoOBB3Eg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?437NlHIyiNJV+7vBwrJwto8Y/I0m4oR/eWafanJN4/CYqYeDg/uulvNLIh4A?=
 =?us-ascii?Q?/FeDKBu6FyWUo1aiW0zJYu0lf54O9i5ds+EJTgIVFK6Wausna/sT0s7iP46e?=
 =?us-ascii?Q?5xkrkisf0AgIwNVjyxCWmnFq9zB3eRnmU2+MFnexTs6Ugb7neiRR5blDSjNO?=
 =?us-ascii?Q?vrZOd0A2fTZ8vAep4i9JhAr7Rr0k1Ot1qRxPVN5GilsEuDnCBki5EuCzFKQE?=
 =?us-ascii?Q?lgjXQfKHVhWcH7tXJqvfnQMdO1MPpu2Eor30FopsdIj4O9kAbDdJpO+bIWyG?=
 =?us-ascii?Q?z0zQSWmIKX7pC9++XajcVL0hE/+Ohw9cWWTU8q95ss3egcbJtxwRQmXs6ei4?=
 =?us-ascii?Q?5mbCylyw8PZqCi4ef6FPGp1ZtRiemMbO9d7x/WGZHHYErOv10lHQpPc1Ayk1?=
 =?us-ascii?Q?9BT1O1cWD3OlsWIOtdMpb5/K41MW5VyzboDbnVusrGsQ3dS4wAygk9Y7M1ti?=
 =?us-ascii?Q?g+MV+W89v5om2ck/56EKf3kWkbOquVkNRw+EL1x1CPKizbF+BHGaagFBNloB?=
 =?us-ascii?Q?7ItUC8+HF41RSIg/ZTDk2SAwqqrUbhWX2u2xMhI6S7UUDuehMExkQkn3AyFb?=
 =?us-ascii?Q?jHGQDurirLsFufZcDtAdpulbke99hoa/Fc/FsksnU/p5WPGJQtnuuOBi+3mp?=
 =?us-ascii?Q?DcRbNi1WIXpNYvCUSKyazct7+4/luvqDdd24ztU49/aPQ9ur/Wq9ec1bTxoJ?=
 =?us-ascii?Q?oEOEnfz9Q07lSR/SZ78/tuufThOVIUGoqFYNK5QbjwlDabGvFF4BlW7yN/Vm?=
 =?us-ascii?Q?AkQIFWLW/iDrzWearqrFSiobpkKfQ2mMYJEfE+3u0DSR8kQAH7s5GEpJOsBl?=
 =?us-ascii?Q?0uNHsmGolUDxyWQW7gNrdyPxmKjHwHVPe+MKEAKj8f7KfAsXsVOKppRjm7MS?=
 =?us-ascii?Q?4sZxMCMuXiJQxHTgAtEDSfaO+nV51mgB1Run+RACibkp937V7Z48HTgwaSlz?=
 =?us-ascii?Q?HOeAozr7Mnw7+hW4nviS5mlGyl8GFCHFxVv28ufA/B+QJKojCETFF7RFP+1/?=
 =?us-ascii?Q?3ZO4Ek7RQrCC6wnBx54zgVtnei4XO1YS6PV/sfUDoe9AiqOz0FP1wpj68V36?=
 =?us-ascii?Q?kBimEUOWBzaWm6Tvb6ZjunL25jl/rC9Hi5kitj8URShhKunupO/PcVgDUd1I?=
 =?us-ascii?Q?yHy1CjMbmMdGy5UUCNYNl0FiTXnJeq2NlFiKdjUxP7CNA9fRHNNwuZ0N3lwZ?=
 =?us-ascii?Q?FC21IaTToC5L6OOMfjgfgCWW0lJxC6zsK2ZU06LhYGtZrA93JVgiSYyn0CA/?=
 =?us-ascii?Q?O1uIY2K2DA+R3TcU+vQc7zdMtS7sFBGXuZn2+UQHUJLbZ7xcQX1hORgzxnrd?=
 =?us-ascii?Q?zh+LepGo5ZJ5z8TX3QnFhvlAju8BFAjTeCGutoSlx7Gu4PNs0Q6akFoXlBj4?=
 =?us-ascii?Q?8MbfZR/ojeHQLD1Encro+sDKqFEy7OqsZ/z2Vk12t1lNIb/nuPjWs3cyhLCC?=
 =?us-ascii?Q?jTjhqYiyuamJl2ErKjbm00bBY/5sT1pGYjskOUXQ1diur1u97VAAoFXGkcoI?=
 =?us-ascii?Q?2u2bSsZpMmKRcRDgkmA5oV1Chrgu/SVmk61teZsKjUoyqjsp3dKrj1+jlwZU?=
 =?us-ascii?Q?QtuL+ikUvUApeXZv7curMsc7ni5l/jBNnB2JHmgFpndiibV0YXag3ZozKDPD?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3850e833-dc7f-43e7-76a0-08dc649d463d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 20:29:43.3764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITSHkM+nAiTeSbNH+Mo90KeJoaIK5CMbzPPKjODBsmvzYZxXbjZizQwe+N40NnLNT26gkpziFTiEHxwoZYLEt0jibYuykU8Smm7Ii8P6gmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
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

On Tue, Apr 09, 2024 at 10:04:22AM GMT, Thomas Zimmermann wrote:
>(was: drm/i915: Convert fbdev to DRM client)
>
>Convert i915's fbdev code to struct drm_client. Replaces the current
>ad-hoc integration. The conversion includes a number of cleanups. Also
>update the xe driver accordingly.
>
>As with the other drivers' fbdev emulation, fbdev in i915 is now
>an in-kernel DRM client that runs after the DRM device has been
>registered. This allows to remove the asynchronous initialization.
>
>i915 and xe are the final drivers with an fbdev emulation that is not
>build upon struct drm_client. Once reviewed, the patches would ideally go
>into drm-misc-next, so that the old fbdev helper code can be removed.
>
>We can also attempt to add additional in-kernel clients. A DRM-based
>dmesg log or a bootsplash are commonly mentioned. DRM can then switch
>easily among the existing clients if/when required.
>
>v8:
>- do setup and cleanup in intel_display_driver_{register,unregister}()
>  (Jani, Jouni)
>- mention xe in several commit messages (Rodrigo, Jani)
>- resort patches to put driver-independent changes first
>- slightly reword cover letter
>
>v7:
>- update xe driver
>
>v6:
>- reorder patches to fix build (Jouni)
>- remove unnecessary handling of non-atomic commits (Jouni, Ville)
>- return errors from callbacks (Jouni)
>- various minor fixes
>
>v5:
>- style fixes (checkpatch)
>	
>v4:
><no changes>
>		
>v3:
>- support module unloading (Jani, CI bot)
>- as before, silently ignore devices without displays (CI  bot)
>
>v2:		
>- fix error handling (Jani)
>- fix non-fbdev builds
>- various minor fixes and cleanups
>
>Thomas Zimmermann (6):
>  drm/client: Export drm_client_dev_unregister()
>  drm/i915: Move fbdev functions
>  drm/i915: Initialize fbdev DRM client with callback functions
>  drm/{i915,xe}: Unregister in-kernel clients
>  drm/{i915,xe}: Implement fbdev client callbacks
>  drm/{i915,xe}: Implement fbdev emulation as in-kernel client
>
> drivers/gpu/drm/drm_client.c                  |  13 +
> drivers/gpu/drm/i915/display/intel_display.c  |   1 -
> .../drm/i915/display/intel_display_driver.c   |  24 +-
> drivers/gpu/drm/i915/display/intel_fbdev.c    | 265 ++++++++++--------
> drivers/gpu/drm/i915/display/intel_fbdev.h    |  29 +-
> drivers/gpu/drm/i915/i915_driver.c            |  22 --
> drivers/gpu/drm/xe/display/xe_display.c       |  11 -
> drivers/gpu/drm/xe/xe_device.c                |   1 +


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

> 8 files changed, 167 insertions(+), 199 deletions(-)
>
>-- 
>2.44.0
>
