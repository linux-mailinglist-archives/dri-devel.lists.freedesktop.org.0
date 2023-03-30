Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875B16D0A37
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B65B10EEDD;
	Thu, 30 Mar 2023 15:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043CD10EEDD;
 Thu, 30 Mar 2023 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680191084; x=1711727084;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hgIcXWKunLKlHpG3RM1m6ggrZjdqZpvzr/nrQgCRUC0=;
 b=PXCAyRcotB0u8B1RqeTKmIs+UMFwB1cN8PgtaKbIzBG5fD53IiFn28jP
 9dBxloRm0TXu2Hm/+C4zdnIn75qvslQwSmfDtIhOsxf2futy93nirRAcN
 zrStRYXBrrunZ8xhpAyHZNanzAp3Iwn16yBKGh27puXUAqxABJ7sxyXuG
 VjIcfrJGXo8jg70DPzHVF9Ge/Krs/VQV2aw5nH18NPzca1XTKI/FJl8YL
 nMgU23/+y4UW9b6IV4LzTOgaAebEqaO46ZtT8dp/ILOqqHeMUmsGvceSm
 3GRMOYSb7yq4oHYqPP4VklDvnHemb+lW0u6QnIS7iTvuojPB/JBSye9Rs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="368986005"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="368986005"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678245472"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="678245472"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 08:44:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 08:44:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 08:44:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 08:44:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFeig6xpkABms/1+oR2wTUiSUQYqUSH8SoiM/SzUr4Eb1TPZdAnpBWTxlHIZUtGlrCKm4gSgmB3CMM9TSUiNH3a+V5P//E1N3JvmzrfYJrvnUXv8UCZ6Gi4A1abOwZAftn+W+v2/jCiycOt6J8lbfY9JuOWb+uIvpJYUHNoXogEONZO/Q+wGHoO+HcMmQvLxWhcgR8WMSr8XLzBL2L0K0Wnw0fs9xy9tOX87lB1ylJ5fdZENNRIaH0z3ZGX7s1MsSi+fYvsrg7DtWl3A7N2hEZ4Cs+spyrVSIODh3zGHC54dgzgLT5JGhnW5vb9VWkn0zOApFUqe+NJFARGTVAb2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSMZLQMWPTEULqiy0yfPCMpaknDcyGuwXlIO/ppkSIk=;
 b=YfCsA41MoyBMJC8aPej5lK/hYRpi8k/NjVN+HJuNBhjHxBEFTdw2LEqoRPgjPeIe+MsZAJW8C0jLtdNQsXwgXK7k/pHzGX1I1XKde4cv9mVQvV8MeEQ8ZNcbJtBG/uxhncROcpkjHnOaHSwFDsR6OP1xpr9bzelukxAgpJIP5XJe7RJfnLiNKIqSCIWg/T8QvRdMQp6fWFbHagxieTCJVy7uREfftOTdyn+Bt54wrrlRNZ7KWNkNXsrL3jtWb8krXIt4hCt6alSzvJcyKkf4Qqj+cUal94dY/2NRHMlJyAvZpgzJSFlvUiCZJLdz1pwTIRXtCuEk6KCGpJ86m2UJ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6332.namprd11.prod.outlook.com (2603:10b6:510:1fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 15:44:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Thu, 30 Mar 2023
 15:44:38 +0000
Date: Thu, 30 Mar 2023 11:44:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/i915/hwmon: Use 0 to designate disabled PL1 power
 limit
Message-ID: <ZCWuYg7wwiO1TaIL@intel.com>
References: <20230328233543.1091127-1-ashutosh.dixit@intel.com>
 <87cz4qlre6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87cz4qlre6.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5f0e6e-14f3-4c4a-4c8a-08db3135ab67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QmDm5t0xWSaPHUJCnx9muF8fxclJcWOxS26qAUeXdpTPf46Y5M2anr3mpj0LvAPolydV2HnBOB6kyv6r4KnmSX89/JKx7JO+mzV1lmC8BVz1rWeMIOds19z9sd3EBTRwxIDuyrt4+4/1OlzwIdkNvEdn+XJYtCNcr+6vsj3eSqQMEngloWsy/hRS/nAMGZ/bkrRTRF1oYLAZKiAhxkdm9TeaVe7pbszcL3mCORGQJybdk3rAlUmFvjOidZqljHOYCpxpsSByNqnqpi6OeNP+oZdk2J09GZblozG+jp8XZo7MjdWFfEWYZvvDnTJfFb2Yv7kfZQ6Gs6gJ5klI2VTT5n9VIwR1x7FWeiicrO/gCds+NnG3PcRhe5Vlk3ZMxdZdRA9HWal6dZzRa+U/w8TUvgDnRXpZCazviGhpnZa9mufnqchA5WTjFf6JDeOWZO0G5Q+itOPSFycLPN4kNvj5u/JOdWlpb6OWoeezpwcv45spwQ5KFm/Mi6Ll/81JI7dlzqdxc3sfME+kg8vGzalqGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(36756003)(38100700002)(4326008)(8936002)(44832011)(86362001)(5660300002)(6862004)(66946007)(66556008)(8676002)(82960400001)(41300700001)(66476007)(83380400001)(966005)(6486002)(2616005)(6636002)(37006003)(54906003)(6506007)(2906002)(186003)(6512007)(6666004)(26005)(450100002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Pd2RFn69sPsszSBb3mAWZyukYOqETWIHkM7MsYc2qZH211yBOFCFkEPryOc?=
 =?us-ascii?Q?sqdNge7y2KJ/zMNUUMOc7N3imNyeV77ci8GZCNh27w886HbfE+58ptp/wBbK?=
 =?us-ascii?Q?I1ssjtUb/yxKniCQZH80SIZpLD/wGPES5iiSQ5BQWK6BBXrC+vRnCDEa+sQv?=
 =?us-ascii?Q?YITkDZsFt8BAKNCBV15M0JVBxBxvqwFoRoUrMwKHW8cX12LDBQaDy97cmwQR?=
 =?us-ascii?Q?EndvgrD0yUAO8eHVotH6xPtUvUwbkHFRkuNF2i8aa9Chqv9uNwCdZG/sDQDt?=
 =?us-ascii?Q?/1wmPg6T2Wu34W+YAREpP4WMbgspne057ynaJVxQhdMTohW+z3pcFiIhIVcB?=
 =?us-ascii?Q?8+IImi2VcwkD/wkMvxURaw0TdRHtdc6J4MkxozprhwLlrd8JNSUgZGGihxGq?=
 =?us-ascii?Q?98F9hFGMssDZfkhRrW6EL0+GQTF0w2mfHPGf3vFGSQvR5MUho/93157mNXet?=
 =?us-ascii?Q?HB4v4QlK3Oydj9NLN0ztTQQPRVQXlDNwEc5CVuLevOsfGP2h1BefvtolkWQZ?=
 =?us-ascii?Q?oQ9HMFeU/GDG0fE+TSU7FQN0X6rrJ68SZk/9wceJAtazNTwnSMuyo3p9FEbO?=
 =?us-ascii?Q?Ihv3ej1oJYXActrvipmtXeK7SGGC9iRwql00Crs0wY4q6mpnjc9WfDFmgHXX?=
 =?us-ascii?Q?qEVWqzcZUKMmDU7jg7PilrxhZnntNjRr6zAH8lliSZQqGXK5j9Kp+NALuMj9?=
 =?us-ascii?Q?xtAIml57onEPZup+L/fc0S8yWB2Najm5IEsiJjmBLUm5MOE+UpyU0CmVJTmv?=
 =?us-ascii?Q?+xyLyJnuGF0nBomaySS0RgmumLbQ/spIkQ3Bwp9Y7hWOssfguQVkLEMrcps6?=
 =?us-ascii?Q?B3n/1L356hDN8IgnXbL06jD/NK3eKW6W+dHI5kZHHcFx/1VzCQKN7XdpRnwg?=
 =?us-ascii?Q?3kPFsr1F7+ITkoSwRcsfyKjCCRE6FMuGyBIdHU/jiZmG/fh+ytshCVk5rGQc?=
 =?us-ascii?Q?lg750hqxnAlM7OoeUkyzRwTxF+1L9bHinS2B41KQS48wgPmxOlPUYnCqdWkt?=
 =?us-ascii?Q?3f20mx95gSbAoWLAFvHR95/oWQrIJ//Np/QI9EsH/mNgyp9+7JTGbky1+stF?=
 =?us-ascii?Q?A5pLOxoQDQ2LjgotFJ9Yt/JWW7yaV2W78oTvqicjolobEbYFQRNEWsDV44vF?=
 =?us-ascii?Q?0Dx7U0chTAStfyJqRbt6p+zMXQMY5vOMyKJDg2/9E97FbyZ7rmPiGTTcNoVg?=
 =?us-ascii?Q?JVOEcQIqSI82vojkz8y5vxZpeq1FS7Gn60iTLh93qWfXOZs7S1r3+8cw47y+?=
 =?us-ascii?Q?/5QY47NjD6WJ5xM5M64r6ktPlx1JNz9IoSXm9aIcAMekn8Z7zN7ouVzqwnR6?=
 =?us-ascii?Q?MCWO48zMq9uGaBk57hNMlRkaA/MD8u7lu4kxqb0xMm03QUKPIieaCK7gVJYb?=
 =?us-ascii?Q?HOe3vluIbLeZ2ALlksAHOV6FFnO8XFNnTMdDDS0BfCaf79+/OM3ahLqW3uqf?=
 =?us-ascii?Q?dxFyH3Jq+x5hf8iMg6uPJqBtW9a8ACjKzXMBjtTroBSGXB73bi7x/DCx8Z/B?=
 =?us-ascii?Q?mhWvITSkGIMBAuFNfvkkKih73EWTn8/qWIfGEOesWR0RzFJW+e+/MsHMTzJO?=
 =?us-ascii?Q?hXqFZy2Q8+fC+Bcab1Ud64A+Oz107Yf4MH0+Bg8G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5f0e6e-14f3-4c4a-4c8a-08db3135ab67
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:44:38.5060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xP8wA2VYcawyZHOe9N1Rx5vQtx1TAI/txmBRHkzyIXC+1ji8Y0Ao6vcHODyriHNFD2sVub+XePPF1dNs711fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6332
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 10:50:09PM -0700, Dixit, Ashutosh wrote:
> On Tue, 28 Mar 2023 16:35:43 -0700, Ashutosh Dixit wrote:
> >
> > On ATSM the PL1 limit is disabled at power up. The previous uapi assumed
> > that the PL1 limit is always enabled and therefore did not have a notion of
> > a disabled PL1 limit. This results in erroneous PL1 limit values when the
> > PL1 limit is disabled. For example at power up, the disabled ATSM PL1 limit
> > was previously shown as 0 which means a low PL1 limit whereas the limit
> > being disabled actually implies a high effective PL1 limit value.
> >
> > To get round this problem, the PL1 limit uapi is expanded to include a
> > special value 0 to designate a disabled PL1 limit.
> 
> This patch is another attempt to show when the PL1 power limit is disabled
> and to disable it when it needs to. Previous abandoned attempts to do this
> are [1] and [2].
> 
> The preferred way to do this was [2] but that was NAK'd by hwmon folks (see
> [2]). That is why here we fall back on the approach in [1].

I still don't get it, but let's move on...

> 
> This patch is identical to [1] except that the value used to disable the
> PL1 limit has been changed to 0 (from -1 in [1]) as was suggested in [2]
> (both -1 and 0 seem ok for the purpose).
> 
> > Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
> > Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/8060
> 
> The link between this patch and these pretty serious bugs might not be
> immediately clear so here's an explanation:
> 
> * Because on ATSM the PL1 power limit is disabled on power up and there
>   were no means to enable it, in 6fd3d8bf89fc we implemented the means to
>   enable the limit when the PL1 hwmon entry (power1_max) was written to.
> 
> * Now there is an IGT igt@i915_hwmon@hwmon_write which (a) reads orig value
>   from all hwmon sysfs  (b) does a bunch of random writes and finally (c)
>   restores the orig value read. On ATSM since the orig value was 0, when
>   the IGT restores the 0 value, the PL1 limit is now enabled with a value
>   of 0.
> 
> * PL1 limit of 0 implies a low PL1 limit which causes GPU freq to fall to
>   100 MHz. This causes GuC FW load and several IGT's to start timing out
>   and gives rise the above (and even more) bugs about GuC FW load timing
>   out.

I believe these 3 bullets are key information that deserves to be in
the commit message itself.

With that there,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> * After this patch, writing 0 would disable the PL1 limit instead of
>   enabling it, avoiding the freq drop issue above, and resolving this Intel
>   CI issue.
> 
> Thanks.
> --
> Ashutosh
> 
> [1] https://patchwork.freedesktop.org/patch/522612/?series=113972&rev=1
> [2] https://patchwork.freedesktop.org/patch/522652/?series=113984&rev=1
