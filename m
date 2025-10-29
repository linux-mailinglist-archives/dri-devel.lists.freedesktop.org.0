Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A893BC178E5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 01:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F097210E6C4;
	Wed, 29 Oct 2025 00:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OacQm7wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD0810E6C4;
 Wed, 29 Oct 2025 00:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761697924; x=1793233924;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Drb7TCx7WaRQtSnEpB7ZGoPUXB5Ui9/1ulzUeZD7UmM=;
 b=OacQm7wa0TKkvD3IIS6Po+BFs0KfP3uk7IvWizi4EL320OLQvAB9v4yo
 OedA2BizviqRPICofB7nKvRSa1BNnDNmie98nhaLslAtMVENS7BgduwFM
 b03b5r7avMPCi8WAqBgLwUHQSNTZZhrWcwBphR00hCh0Fzp8U4f8ZAaYM
 hjxk5ud6jPSfeSSaJW+AoBubm6x1LN/tsJ3PPQAfzyF3vxpmjotDaNIjz
 JoCrYBjMcsWiBOEWMuuCVx4z4ix1YNWJ9pjh/xSFBBabjib8b9eyOBkEc
 2R/CRV2CNCjkgsk8GC6oDGWE2YthVjhuuAnwsqonZ2KE8Ug4md9epNsS0 A==;
X-CSE-ConnectionGUID: Vz6KS9OPTIKQOSC/PDYzpQ==
X-CSE-MsgGUID: R2Qt4QHpQtmkcvbz3onkyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67648865"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67648865"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 17:32:04 -0700
X-CSE-ConnectionGUID: O9JdE6WNRdq5Jc19q7Rj9w==
X-CSE-MsgGUID: uvhwkQvuQiCHeMGmGdnZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="184743704"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 17:32:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 17:32:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 17:32:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 17:32:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umJCKtjiWCiKGD7xIquEY1aYW4UaHnmBj94UvfhBu1kCZzTr1emqPZl8MrzGJg+BqoT6buZYFOUod+e1xIvUjuhreQ7eNqyHH50D86F8T3DxOBIUB++g8krCuvgAYfY+ydZ5/JtS+c0Htb4hLdYBNentZ7rahOqr92EYY1ovNxvcuIJ4j+16v4F2X9nUu7I8tUpyB1YTxQW73C38f0kVyLIuMAMUWTIlN8H51ofe55/sYktnEmRZ6gudnA2M3H2iS5FzWz1gV720ipcS4bxWWR9DALkUNZGJiXGbgaSsKZlj3i2PcY9E5wNjhbKrP5n8t2emBlXCr6KYN5tdZGd8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6s3mek+X9xRctB7KPAO2IYPi7uVfTQHHKkBpNBOEzI=;
 b=X+IUzTeljCfB2RDOsuRdyxaOi1e4i/2YOmZ6Gy7ecA04ihuNj0LW7C26ZPnTGQCclEANLbyID01giTZ2elzF89JSDt0HKrFPKddxIOkbHRC140aRmraUGk0xCQrbXe7GGcGTh+FqKYsIjaQRx8Md8vcilm6qQMGjSCpsHU9aANQoNVqcRsFQy78ZKAV+kr3ecB+GJAk4S2Twqm+nmu/YWXKjsfNSh8fuRxAjs85w1WVg+SdjPVxlxp0EU7J71M1ZXH3dyS3x+GnAo3WzFhbzqEtU/c0k9Y0u2U2QJnfOClUSbB1Xg7CFRGxd5uUe+p7UgfYmhEwxhuEqfmmpD1Qt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF208195D8D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 00:31:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 00:31:53 +0000
Date: Tue, 28 Oct 2025 17:31:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 01/15] drm/pagemap, drm/xe: Add refcounting to struct
 drm_pagemap
Message-ID: <aQFgdpgcj3k0Egt/@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF208195D8D:EE_
X-MS-Office365-Filtering-Correlation-Id: 887a2e53-3050-431c-e5f9-08de16828eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7sbKYhqRAPYgR4/fjEUoQr0O1xVUMRzRjTnYyqyJSTkibuv+uQdc9iz5cD?=
 =?iso-8859-1?Q?aHSfMESURtQCnuga15sehwhDY4LI58mrHSvvPk3/3FW3zl60nnR/YMiiYt?=
 =?iso-8859-1?Q?kdehJLIoreUJN/GoX2Gyzu+b9lnLPIy8coIgEWWix4HcAcSR5dVad9Scrw?=
 =?iso-8859-1?Q?t7orvTHxoZSdpgv88W3IoLCal5ZjnYwu9vuGpOX35C5/t2bIk/aI8FXQYw?=
 =?iso-8859-1?Q?c3ywk19j9m2HaphrWEhVrjKhZt2A7bF7LAFOEIi8qZNBLxv0+qWef9SU70?=
 =?iso-8859-1?Q?vikokonkKjjO0VNPm18meK8paO3B6HSzlPJxWBSn+dFXzMbw87qqOUnZ8p?=
 =?iso-8859-1?Q?l3pew31Tsiqq1/JBYJm1EI4zHZxmvwSPhPH65qYbmXiP64hZla3mxw/T5p?=
 =?iso-8859-1?Q?k2STTkdOtjRGX15i+JDZk28fA9sGJnxHMP/P4PebdNNlPgVlO5i26Y3Gpk?=
 =?iso-8859-1?Q?Y+jymZiTK6JepuYKo9Hb63V/qAhUHPShdZzOWwP+8KGIEDxVQT643s4oRX?=
 =?iso-8859-1?Q?QeLJ9r8R9xIpixEWsst4TycKM4G4V9tbFMyOYOKKhah76nu59LXwhz75qD?=
 =?iso-8859-1?Q?Cf9qxUGOWngisT+xqgrS4I+7z5z0kHBRk7/z9/CIeq/yrBAySpsT6EodUz?=
 =?iso-8859-1?Q?wbbUCtUE2kRwkQQ8VKKffbyaLTvqd6ajJJOyy9Nm07H/ngpeo06hWsYhrY?=
 =?iso-8859-1?Q?H107WMgcm26Ir4PclG5n3Ej8Kqnyeix0MmAjJ4FXSFi96UPUx8z9RxPdHC?=
 =?iso-8859-1?Q?Sj3Hl5jyr2iwbW2m0cG1kdKjnsOR4VylMevAIojaEKy6FT7Vi1RikA7uJR?=
 =?iso-8859-1?Q?bzprJggwg9hisUGfC+xW/MdbfFTvXgRk5bRFmqBkkGc7H/eFErsQd7GB/j?=
 =?iso-8859-1?Q?WdrpiMX4RHZl3zWXJmbwcFHJfmQ1U+3KVx+GZblgaudDa9g0H6ul7oD2s3?=
 =?iso-8859-1?Q?0Dmk1V/shS0QhgBlzVRa1Cw/5pPohtzAG7SY397U4dw63qh4VpQriNn43q?=
 =?iso-8859-1?Q?6XwRQq4WDbcPgJ7Hyo9ihFskqqIxFHOafkfEwlaMtrwnVoe4V+0NnFmTyX?=
 =?iso-8859-1?Q?G8/pmLhzxgXQDHLeUQ2RIRKlKPTh3zuuJhnPEF0cC0n1/YKqMLlXMrQN0s?=
 =?iso-8859-1?Q?d6Pf9cOpF7e8cZEEr18IjDWMxlQlEbx7pZUsi2dqAJ6H9ILPWYSIbPaZdM?=
 =?iso-8859-1?Q?QtwJTXB+5gCiG/jTwi5AEsquj72IIPdTF57AFQ2UupJpNXR+xDet9wNhKQ?=
 =?iso-8859-1?Q?kIXDW/Q/n3e2wmjTZWth+sZ4Ic6MR3tqHFm4Dxx6SJQQ6HLFDbNltVL0xT?=
 =?iso-8859-1?Q?7nhEDF9gIxzpRd4o2F7sHs342srNQIr5LvVfeG/psDm4DnDnC4ipK7mPVx?=
 =?iso-8859-1?Q?w05qfTLgVyHSjNT9+QyO0VhENioUhLHNrrDGTz3ipRkLpllCV4uTSkzRvq?=
 =?iso-8859-1?Q?Dg9Q+cRGz0+uT6jhgvMR4hJQivbfwBUJwsoZ7OcaLp8xAxIh9Y7jqdzcJn?=
 =?iso-8859-1?Q?HvCX4ADOgaSp2bHQTpcuqB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?I34NAOmjUt1cFxISWUNM3wrUYrV+B+wlziCFZXL1GTFM1Z0Nlb2CzKYeV2?=
 =?iso-8859-1?Q?x4lRsJWPzpaolwx+C71daVHF+DjbipCORAJFsPEDOzX4YLjYqilECOmXKz?=
 =?iso-8859-1?Q?Cf434dMcFqkwS1oV7y3mHnqWNuxfewj4QejEKGFafWB8u/ERbEER/RrBK6?=
 =?iso-8859-1?Q?fPoN/48xrhpvdrYVUrPAJ28sdzT/redCXWheOogxB21SBjZahvBhsHVUwo?=
 =?iso-8859-1?Q?HaqyfEEsAhYSLpFOV1el8qouMv+aBnGYc5Uz9xXXAk/Rn+/iHyaURUYdTt?=
 =?iso-8859-1?Q?Yk8P9hlaMPCN5/qOjTeMDdMxJXo2NZnd8fkxy+TPkeodx1HJA2YmKlojzZ?=
 =?iso-8859-1?Q?s2a0wpLLybro5YluLizoCirt60q9sxG5aE3fTAaQMQxV63MH2wskBOo4/G?=
 =?iso-8859-1?Q?LczjRAoidEjrBuD68jN99HaqKy3bzuYsbfeuPFoBKM4ibxXTebOfbHOPjQ?=
 =?iso-8859-1?Q?LSYwXsDnrWHvP+VpeZlCBXYMA5oSl5nKba44rxirWRq7F9BV9gkStuKNCY?=
 =?iso-8859-1?Q?PeWtc9vzxJOavQSf/XqSTN4Jw4J7GXp2iMY2J3yhOWVz6jJUIsXhrHNyIS?=
 =?iso-8859-1?Q?7QQhOCKf4Bl42tMy8PRCyAt65v1FNXu+jcsE8xG/3GH/s7T4LzEQMvgwck?=
 =?iso-8859-1?Q?62USYR0UU5RO2G4Bc+X26dt5hTDdDA64jm3BAzaS0GRFCaGz7QFD+qFUCq?=
 =?iso-8859-1?Q?BH41iSvJJMgB875T3pdQ6gWyrRVeX6T2U2/MC8kHYVqY79lFaX1eZpnhJ+?=
 =?iso-8859-1?Q?rl7Side7SPXiIWcEbWpZgIr6WaW0K4nralRpjUkREwVfbWwjfvz14/scyX?=
 =?iso-8859-1?Q?Wfa+lWGHbuP0C42VC7yXVUrkfvK3xZsCzWgekUMfn2TgBhcVYnDGz71B1S?=
 =?iso-8859-1?Q?jiv47gFxWUG62Rs2FHOvfOnb/T29KvdurPPcy+xrDWt//noDGuCXIeaCHB?=
 =?iso-8859-1?Q?iy/WFzzwh2a3L16iiVWeDCWKsNiOFooRPScQIAWwCaD1xaZKKp9cmoiD+9?=
 =?iso-8859-1?Q?8XJ+puJ1LStTx3MpJeeqlBLie5HNDNC/pvjI+QX/xRgdO5eYpBTg6vNZSZ?=
 =?iso-8859-1?Q?/iSHsIYVybsLSoVXt/6XdB66ecatiTMqFQvdHswmk/1Ebe20FlXbU+j+mI?=
 =?iso-8859-1?Q?jh+Apyijy718yl5SsvGCX8OgWwpV/gAnukeZh/Xl8C7BeDM5O3+lehuyEH?=
 =?iso-8859-1?Q?NKMGeSB3Fj/VnGx7O+IzPhkdGgSdLdvqwsDHSAWrHB3Awums/UwMbcAxdO?=
 =?iso-8859-1?Q?emSXm9s84JSWRhIh2Q20zpmQ6ap+UG1rypI+WUKV+yyCWhreKZZLxs1JCw?=
 =?iso-8859-1?Q?L2VUfPKqkr/0+8JVoL5mamj4fNApiCVFuJi+AMGzK4UYYSYaDtttBcmvJK?=
 =?iso-8859-1?Q?Z31TMYs2O5SZvT/RxYwRkmHtQIE3gFBD0EvXRr5im6RjEosIvE8nQAICqm?=
 =?iso-8859-1?Q?f9dq6dYw0ziSWoTBkbVwhjjR6I606PnLTTURiSV+SXxpmYml5Cf03aCyp0?=
 =?iso-8859-1?Q?VSrePzm/oD+vLcmZgvmv2ExhuzpZ3Vc0OdsVwtTROnDLASZP6w0lX1y/cI?=
 =?iso-8859-1?Q?u+mhg0JkAmRwmOi2z5ZRaHBFywBNUwLj287naxyb1glHwdIebAmJXdRM9p?=
 =?iso-8859-1?Q?EO/zTFjt7gBFzqMlvVpXKN965KgLnHrGUPVJ/xum9GCqmLwEpONGz3jg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 887a2e53-3050-431c-e5f9-08de16828eac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 00:31:53.1180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+BFMipXidFU51lgtKrTT3tWmgKD0OTDs2bdh4iRREKtSTQNaPnp30Lsbu7fN1RO77odD6HeFPtiNA9r2a3ZwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF208195D8D
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

On Sat, Oct 25, 2025 at 02:03:58PM +0200, Thomas Hellström wrote:
> With the end goal of being able to free unused pagemaps
> and allocate them on demand, add a refcount to struct drm_pagemap,
> remove the xe embedded drm_pagemap, allocating and freeing it
> explicitly.
> 

I think techincally we can leak a drm_pagemap in this patch by itself,
but since the ref counting scheme is refined later in the series, likely
not worth adding drmm/devm handler to drop this reference.

Anyways, patch itself look good to me:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c      | 51 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.c        | 26 ++++++++++-----
>  drivers/gpu/drm/xe/xe_vram_types.h |  2 +-
>  include/drm/drm_pagemap.h          | 36 +++++++++++++++++++++
>  4 files changed, 106 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 22c44807e3fe..4b8692f0b2a2 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -538,6 +538,57 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  	return -ENOMEM;
>  }
>  
> +static void drm_pagemap_release(struct kref *ref)
> +{
> +	struct drm_pagemap *dpagemap = container_of(ref, typeof(*dpagemap), ref);
> +
> +	kfree(dpagemap);
> +}
> +
> +/**
> + * drm_pagemap_create() - Create a struct drm_pagemap.
> + * @dev: Pointer to a struct device providing the device-private memory.
> + * @pagemap: Pointer to a pre-setup struct dev_pagemap providing the struct pages.
> + * @ops: Pointer to the struct drm_pagemap_ops.
> + *
> + * Allocate and initialize a struct drm_pagemap.
> + *
> + * Return: A refcounted pointer to a struct drm_pagemap on success.
> + * Error pointer on error.
> + */
> +struct drm_pagemap *
> +drm_pagemap_create(struct device *dev,
> +		   struct dev_pagemap *pagemap,
> +		   const struct drm_pagemap_ops *ops)
> +{
> +	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
> +
> +	if (!dpagemap)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&dpagemap->ref);
> +	dpagemap->dev = dev;
> +	dpagemap->ops = ops;
> +	dpagemap->pagemap = pagemap;
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_create);
> +
> +/**
> + * drm_pagemap_put() - Put a struct drm_pagemap reference
> + * @dpagemap: Pointer to a struct drm_pagemap object.
> + *
> + * Puts a struct drm_pagemap reference and frees the drm_pagemap object
> + * if the refount reaches zero.
> + */
> +void drm_pagemap_put(struct drm_pagemap *dpagemap)
> +{
> +	if (likely(dpagemap))
> +		kref_put(&dpagemap->ref, drm_pagemap_release);
> +}
> +EXPORT_SYMBOL(drm_pagemap_put);
> +
>  /**
>   * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
>   * @devmem_allocation: Pointer to the device memory allocation
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 129e7818565c..6d2c6c144315 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -861,7 +861,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  				      struct mm_struct *mm,
>  				      unsigned long timeslice_ms)
>  {
> -	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
> +	struct xe_vram_region *vr = container_of(dpagemap->pagemap, typeof(*vr), pagemap);
>  	struct xe_device *xe = vr->xe;
>  	struct device *dev = xe->drm.dev;
>  	struct drm_buddy_block *block;
> @@ -1372,7 +1372,7 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>  
>  static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
>  {
> -	return &tile->mem.vram->dpagemap;
> +	return tile->mem.vram->dpagemap;
>  }
>  
>  /**
> @@ -1482,6 +1482,15 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  		return ret;
>  	}
>  
> +	vr->dpagemap = drm_pagemap_create(dev, &vr->pagemap,
> +					  &xe_drm_pagemap_ops);
> +	if (IS_ERR(vr->dpagemap)) {
> +		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
> +			tile->id, vr->dpagemap);
> +		ret = PTR_ERR(vr->dpagemap);
> +		goto out_no_dpagemap;
> +	}
> +
>  	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
>  	vr->pagemap.range.start = res->start;
>  	vr->pagemap.range.end = res->end;
> @@ -1489,22 +1498,23 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
>  	vr->pagemap.owner = xe_svm_devm_owner(xe);
>  	addr = devm_memremap_pages(dev, &vr->pagemap);
> -
> -	vr->dpagemap.dev = dev;
> -	vr->dpagemap.ops = &xe_drm_pagemap_ops;
> -
>  	if (IS_ERR(addr)) {
> -		devm_release_mem_region(dev, res->start, resource_size(res));
>  		ret = PTR_ERR(addr);
>  		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
>  			tile->id, ERR_PTR(ret));
> -		return ret;
> +		goto out_failed_memremap;
>  	}
>  	vr->hpa_base = res->start;
>  
>  	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
>  		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
>  	return 0;
> +
> +out_failed_memremap:
> +	drm_pagemap_put(vr->dpagemap);
> +out_no_dpagemap:
> +	devm_release_mem_region(dev, res->start, resource_size(res));
> +	return ret;
>  }
>  #else
>  int xe_svm_alloc_vram(struct xe_tile *tile,
> diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> index 83772dcbf1af..c0d2c5ee8c10 100644
> --- a/drivers/gpu/drm/xe/xe_vram_types.h
> +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> @@ -72,7 +72,7 @@ struct xe_vram_region {
>  	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
>  	 * pages of this tile.
>  	 */
> -	struct drm_pagemap dpagemap;
> +	struct drm_pagemap *dpagemap;
>  	/**
>  	 * @hpa_base: base host physical address
>  	 *
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index f6e7e234c089..2c7de928865b 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -129,11 +129,15 @@ struct drm_pagemap_ops {
>   * struct drm_pagemap: Additional information for a struct dev_pagemap
>   * used for device p2p handshaking.
>   * @ops: The struct drm_pagemap_ops.
> + * @ref: Reference count.
>   * @dev: The struct drevice owning the device-private memory.
> + * @pagemap: Pointer to the underlying dev_pagemap.
>   */
>  struct drm_pagemap {
>  	const struct drm_pagemap_ops *ops;
> +	struct kref ref;
>  	struct device *dev;
> +	struct dev_pagemap *pagemap;
>  };
>  
>  struct drm_pagemap_devmem;
> @@ -202,6 +206,37 @@ struct drm_pagemap_devmem_ops {
>  			   unsigned long npages);
>  };
>  
> +struct drm_pagemap *drm_pagemap_create(struct device *dev,
> +				       struct dev_pagemap *pagemap,
> +				       const struct drm_pagemap_ops *ops);
> +
> +#if IS_ENABLED(CONFIG_DRM_GPUSVM)
> +
> +void drm_pagemap_put(struct drm_pagemap *dpagemap);
> +
> +#else
> +
> +static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
> +{
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
> +
> +/**
> + * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> + * @dpagemap: Pointer to the struct drm_pagemap.
> + *
> + * Return: Pointer to the struct drm_pagemap.
> + */
> +static inline struct drm_pagemap *
> +drm_pagemap_get(struct drm_pagemap *dpagemap)
> +{
> +	if (likely(dpagemap))
> +		kref_get(&dpagemap->ref);
> +
> +	return dpagemap;
> +}
> +
>  /**
>   * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
>   *
> @@ -246,3 +281,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			    unsigned long timeslice_ms);
>  
>  #endif
> +
> -- 
> 2.51.0
> 
