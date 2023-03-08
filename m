Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E206B0891
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 14:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7784210E147;
	Wed,  8 Mar 2023 13:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8F310E147;
 Wed,  8 Mar 2023 13:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678281874; x=1709817874;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xg7WtaJAdRO+zeb0+T9LzWOvuwr7cmHQTKSGk0bV1Qo=;
 b=Ivt2yoQm2HLsiw8CzLnThE9nsJEU3+adj//Mmo532M9jxwMn08zg9631
 7FlnxeSq+M0pRCi40+FOFdxH9yV13fI9hlkVcA96n0ZtP96tP3bP/BhJP
 R+tdiCptoxDZkQ7GsXVLmYa1wgU+3uuVcQGbZRZyAEfexA7xZ0ziBYHJR
 gAQUd6HVwkYFX2cxf4/nk+xzPXKRGd/JzLrQShdNxGQh1vwUtnG3WePKn
 wd979aILuBKj/y9uczLbPuNldyrwk88QFon3DxtQKUAFRQyg5tzzxy4pi
 5ePXQyaat5A8HG0/snf6EBj1XS770BzeOjTjPrUwPZ/dVJ7LsY6ffpdjq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="363785191"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="363785191"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="670333488"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="670333488"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 05:24:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 05:24:33 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 05:24:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 05:24:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0fKpdNWp3xKSlwPy2ec1CoRVhxqM50NnlY1gOB8NLlkR9TLJSIt/gtdcu/h7X1wXWKB6NTgnRGSbMBngp5bzrk8SEWolzGrdHBNc6XdpNkA91PCNVCVOwIGaJK/rIHJvlrNGW0ILf53mWiXWFoazPMuyFJE58AV6aRxdfZjMiM3vWeZUG2PpToaoNT/OS5RcC+juEemUSN/02UbYhFS1uF0weh/YW4GKbhdNGAYZRCFcZBt9my0FYw0OFanODpxw9xXAqNWIBh83vPN1ezyjrvq1E2ExwZo8JbxeWeyGLPlqvvNYaOVP7JB+v4dFQdxSvnFSDtVhCNL/pY3R3aJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75JwvWcw2XSNpSs9agh9B1xENmPFjvXwUq47k27wUcQ=;
 b=LZFch3WgldyAqggL8ScarH+lcKqlsTFEV4yFlS/AA47RIZQl9Q2BeS31qPXoJkedigyulERB+XTzdXKBjh1NQIuf0OzlFsyFEuVevZ85ZyR+dya8hMX8bcK0k4nXEW6oZTIF5oKYnnuxLLuNC8xI7JLSbZENah9HZRqCcK8ZdeT8mdanDfHguaj1R1DBjFEn5WyBDZ20WIASLCMzQUMGVNWaS7V5h0CPbnn/ZAbfSqBeNA031aEwVb1GCOpL6W+x3ODpKNObcJEobD6lcwJNZnox8PtsR/wyI2FjQGR2QJKn/0Pmib4OerNYRPxXlpZSLYBtDkmjhP+DHl0MARZw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 13:24:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 13:24:31 +0000
Date: Wed, 8 Mar 2023 08:24:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PULL] drm-intel-next
Message-ID: <ZAiMihOpRv1Gzre9@intel.com>
References: <ZAez4aekcob8fTeh@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAez4aekcob8fTeh@intel.com>
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d59380c-8f63-4690-e59f-08db1fd8737f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e0WgkJK7w5PIoPrp3VIIKe5sIaqzRFIwSKOlyqa/FW+XbQuabB8YyK4X6ij7IDbrgKEd7MZbHYW3Ekr2b60mPhCF/kvK8Dl/lZEyLeszNnQTcN97Y6DP5/jkfFFN9Qby9WwuizH+Si9SOmDLCB6M0Vp1zP91vOby/BUOY4F8xZF+dxnKiMEf2RCo/Q1IVnwz3NcnAesEQsGm8GlqMmIJAmyOQTtL6PStLxt3cwXdyUNJ6r5tCmjmwrCX741vkVe044yzR8V1himY3gcOXIB729E8IU6b5djuiPZcHOvk1bkMJQZcqHacWmVKeDTs5i4QQZL2g6v122MAysUCH7JDVJs2I5NYmEASbLyIPQuF1q5mLQ9lLeAqpMTfjjs6URXfLwz2mi+PR4Tz+vmv9bXYBlGQ8D2/X2liXKlHsZlzvyLTkpuCRQsFGoweN2oUdbKdXB1u6vQiM3RLSfUpan/wGOQxGExVbk5IWQ3wp3hy/pS0joK7Xh8mHNAfe1SAoOz9X+/YX2uoNz/Snw79Lnn3x/tsMcTFt0MnqI0F3inVeK9GVGWcbN8okzCW2RgC6PHTGxh7ygXYQGi8z91FQdqlCFcglZeewWde/qN3a28Rtw/PAJXFTy6GK2nalvP4eylKKATgdu1LHyjgE67blF9aVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199018)(66574015)(38100700002)(110136005)(54906003)(316002)(186003)(36756003)(6512007)(86362001)(82960400001)(6506007)(83380400001)(26005)(2616005)(8936002)(5660300002)(478600001)(6486002)(4326008)(41300700001)(6666004)(44832011)(30864003)(2906002)(66946007)(8676002)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gehGHjAxzof8b7uHloUlGKfg8ivvWhVF0gMohu7lc78efDMShr8yzP8TII?=
 =?iso-8859-1?Q?mUZKYped1dAeR3/OiVAcXdu9L3Z6s2cm5amPMsgaZtA8lNmXLCzJ/u7yNu?=
 =?iso-8859-1?Q?XOYDQFI5Vl9Q45UBKmJhN9c7nshgCUzEBJWPxkdVyqKDogQ0Iprw2vYjZg?=
 =?iso-8859-1?Q?y9iBStrV5V5stHMeKNbQVSQsZ4JUsN4VzsdrDZlY3WChg8C66CXisFwb0l?=
 =?iso-8859-1?Q?70xqytcgQZR+LDfBupxSuzjd6Lqt+hX7xWgG/zq6bztH40Z665Z1MG78Hs?=
 =?iso-8859-1?Q?1m2A4cJS+7+1FzUA3A7dS1uKXZTsNF1KmDMs6+bVtn6Xork4k+at5thEOc?=
 =?iso-8859-1?Q?HbgP3JRvNfz/nzKNKWzROlVCvaThZ+IOMWLETE2ba9SxJkuDAVobUQFfAA?=
 =?iso-8859-1?Q?1lqQpwakcTp+vYbqPsZ98bczWEUZmZ20kRTFltJWL8vMM97fNQN3nQIKXG?=
 =?iso-8859-1?Q?ZdgSdn4hInHvplwrrR03U+enRAOUxCl3m3fgYDxIYlSab1QkLTVp6tQgZk?=
 =?iso-8859-1?Q?t2mlIdqlygwf9kdGwEvvZSKGhogPBGnLct+TfQG46w1OhzHHHNX4dk8ZGJ?=
 =?iso-8859-1?Q?MkgPJ9pBbE6tDVuFu3MeUpSBLbZbjNMkzvuxDfHOS72FgzrjGHDkcSvPO3?=
 =?iso-8859-1?Q?zxWfON5+BYFxQZ/Qwd8Lv+LUGeLRvfcQAEGrf/wrQ3wVTgyVM39Fyb511J?=
 =?iso-8859-1?Q?YEb86O17eVuwqANm41FitBbaejYe9f6Se2jFWN/ySPlKW/iFysm5JL3DaQ?=
 =?iso-8859-1?Q?uyMALXCXf8ExkxWfWQtL+7GB7/LEaodJN8BsVOFqHikZnpfj0bXOQKcPO7?=
 =?iso-8859-1?Q?2rwPOV29eDzkpO+N+OZMefw/mNsVCA5Ubtkce2y5ixA3Hl1qrmUKVJR6SJ?=
 =?iso-8859-1?Q?aFSM4dkp+70TFj45dhYyHXyUXD5SJLseCbfJZ7sUdXcicU2zPIwpJKHUHU?=
 =?iso-8859-1?Q?oR0mA/XYYlLyYZ/GSm7/V/SO4NrOZsZGw9MdJ13UHn3XoDE1w+TboGxx/Q?=
 =?iso-8859-1?Q?X/gyWg24mxUCYhIVn/f1y8nR8vE6NhTdiKa2Wta43cH+wsNgs2njrYeoLL?=
 =?iso-8859-1?Q?39IuN4xOiACMjlJGjpt1V3i+6I6crU5jZWO3qy3XYSSLz5DNGF4SG30Y6g?=
 =?iso-8859-1?Q?qWKAMLuzS79BpcZZq3rAwia08ibh95a8TdsLfq2+Hk+82hCYnkByvsM5L+?=
 =?iso-8859-1?Q?4+NQc5QMuw4z1Ef6NL3HCRQECB9Z2WfufP0NEfg/BlLuiPmoxnYieE6nU0?=
 =?iso-8859-1?Q?/FDYn4hiO3dxZIrVUEFB65O4cH6Vli6regMAZeoco3I+Er6bWjbWTR4rC/?=
 =?iso-8859-1?Q?McL0ibxKGU3rzGwp6vZ0HGZA+kdgNz9kSc4LksgApeTKZB5CiGAK7PNcK/?=
 =?iso-8859-1?Q?lgGOV9XqCEtRQadZGwnkDeI1yjhNX8stpZz+aCQzKOhpmqAqa3iPlvjmV/?=
 =?iso-8859-1?Q?mlqvEkidF/WNbsHlnsK7v1a1F1eDNXzVWr55I8E6ZTxVrTGCowAMCSNDEQ?=
 =?iso-8859-1?Q?khkaAbcPocgIaZmXiGYRqnONgSIzEPSEEcb73g4mmigy8gbiZQ1nMoi7Fz?=
 =?iso-8859-1?Q?8I09oXWgghIu8MgxUn+8+n3cdAkFMwAzpJ873wzpRMA15Vf380b6K0tfuf?=
 =?iso-8859-1?Q?etGmhvUtjkpQzOJ1rWVRcMDb4mdL/ooTdNPtiCx1qJjNDQ/k1k/hravA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d59380c-8f63-4690-e59f-08db1fd8737f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:24:31.6731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwHZrHcGuqv6Fpmm8t+20pcj63wAMMeUbFm+iSnrXBC5NC4KXGMBFNTpidU4c1yyg5p0aSOvve7/FQbCQHAvpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 05:00:01PM -0500, Rodrigo Vivi wrote:
> Hi Dave and Daniel,
> 
> Here goes our first pull request towards 6.3.

You know, I meant 6.4. :)

Thank you Joonas for noticing that.

> 
> drm-intel-next-2023-03-07:
> 
> Cross-subsystem Changes:
> - MEI patches to fix suspend/resume issues with the i915's PXP. (Alexander)
> 
> Driver Changes:
> - Registers helpers and clean-ups. (Lucas)
> - PXP fixes and clean-ups. (Alan, Alexander)
> - CDCLK related fixes and w/a (Chaitanya, Stanislav)
> - Move display code to use RMW whenever possible (Andrzej)
> - PSR fixes (Jouni, Ville)
> - Implement async_flip mode per plane tracking (Andrzej)
> - Remove pre-production Workarounds (Matt)
> - HDMI related fixes (Ankit)
> - LVDS cleanup (Ville)
> - Watermark fixes and cleanups (Ville, Jani, Stanilav)
> - DMC code related fixes, cleanups and improvements (Jani)
> - Implement fb_dirty for PSR,FBC,DRRS fixes (Jouni)
> - Initial DSB improvements targeting LUTs loading (Ville)
> - HWMON related fixes (Ashutosh)
> - PCI ID updates (Jonathan, Matt Roper)
> - Fix leak in scatterlist (Matt Atwood)
> - Fix eDP+DSI dual panel systems (Ville)
> - Cast iomem to avoid sparese warnings (Jani)
> - Set default backlight controller index (Jani)
> - More MTL enabling (RK)
> - Conversion of display dev_priv towards i915 (Nirmoy)
> - Improvements in log/debug messages (Ville)
> - Increase slice_height for DP VDSC (Suraj)
> - VBT ports improvements (Ville)
> - Fix platforms without Display (Imre)
> - Other generic display code clean-ups (Ville, Jani, Rodrigo)
> - Add RPL-U sub platform (Chaitanya)
> - Add inverted backlight quirk for HP 14-r206nv (Mavroudis)
> - Transcoder timing improvements (Ville)
> - Track audio state per-transcoder (Ville)
> - Error/underrun interrupt fixes (Ville)
> - Update combo PHY init sequence (Matt Roper)
> - Get HDR DPCD refresh timeout (Ville)
> - Vblank improvements (Ville)
> - DSS fixes and cleanups (Jani)
> - PM code cleanup (Jani)
> - Split display parts related to RPS (Jani)
> 
> Thanks,
> Rodrigo.
> 
> The following changes since commit d3eb347da1148fdb1c2462ae83090a4553d3f46f:
> 
>   drm/i915/mtl: Apply Wa_14013475917 for all MTL steppings (2023-01-26 13:54:05 +0200)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-03-07
> 
> for you to fetch changes up to 4b736ed40583631e0cf32c55dbc1e5ec0434a74b:
> 
>   drm/i915: Get rid of the gm45 HPD live state nonsense (2023-03-07 19:09:20 +0200)
> 
> ----------------------------------------------------------------
> Cross-subsystem Changes:
> - MEI patches to fix suspend/resume issues with the i915's PXP. (Alexander)
> 
> Driver Changes:
> - Registers helpers and clean-ups. (Lucas)
> - PXP fixes and clean-ups. (Alan, Alexander)
> - CDCLK related fixes and w/a (Chaitanya, Stanislav)
> - Move display code to use RMW whenever possible (Andrzej)
> - PSR fixes (Jouni, Ville)
> - Implement async_flip mode per plane tracking (Andrzej)
> - Remove pre-production Workarounds (Matt)
> - HDMI related fixes (Ankit)
> - LVDS cleanup (Ville)
> - Watermark fixes and cleanups (Ville, Jani, Stanilav)
> - DMC code related fixes, cleanups and improvements (Jani)
> - Implement fb_dirty for PSR,FBC,DRRS fixes (Jouni)
> - Initial DSB improvements targeting LUTs loading (Ville)
> - HWMON related fixes (Ashutosh)
> - PCI ID updates (Jonathan, Matt Roper)
> - Fix leak in scatterlist (Matt Atwood)
> - Fix eDP+DSI dual panel systems (Ville)
> - Cast iomem to avoid sparese warnings (Jani)
> - Set default backlight controller index (Jani)
> - More MTL enabling (RK)
> - Conversion of display dev_priv towards i915 (Nirmoy)
> - Improvements in log/debug messages (Ville)
> - Increase slice_height for DP VDSC (Suraj)
> - VBT ports improvements (Ville)
> - Fix platforms without Display (Imre)
> - Other generic display code clean-ups (Ville, Jani, Rodrigo)
> - Add RPL-U sub platform (Chaitanya)
> - Add inverted backlight quirk for HP 14-r206nv (Mavroudis)
> - Transcoder timing improvements (Ville)
> - Track audio state per-transcoder (Ville)
> - Error/underrun interrupt fixes (Ville)
> - Update combo PHY init sequence (Matt Roper)
> - Get HDR DPCD refresh timeout (Ville)
> - Vblank improvements (Ville)
> - DSS fixes and cleanups (Jani)
> - PM code cleanup (Jani)
> - Split display parts related to RPS (Jani)
> 
> ----------------------------------------------------------------
> Alan Previn (3):
>       drm/i915/pxp: Invalidate all PXP fw sessions during teardown
>       drm/i915/pxp: Trigger the global teardown for before suspending
>       drm/i915/pxp: Pxp hw init should be in resume_complete
> 
> Alexander Usyskin (3):
>       mei: mei-me: resume device in prepare
>       drm/i915/pxp: add device link between i915 and mei_pxp
>       mei: clean pending read with vtag on bus
> 
> Andrzej Hajda (14):
>       drm/i915/display/fdi: use intel_de_rmw if possible
>       drm/i915/display/vlv: fix pixel overlap register update
>       drm/i915/display/vlv: use intel_de_rmw if possible
>       drm/i915/display/dsi: use intel_de_rmw if possible
>       drm/i915: implement async_flip mode per plane tracking
>       drm/i915/display/core: use intel_de_rmw if possible
>       drm/i915/display/dpll: use intel_de_rmw if possible
>       drm/i915/display/phys: use intel_de_rmw if possible
>       drm/i915/display/pch: use intel_de_rmw if possible
>       drm/i915/display/hdmi: use intel_de_rmw if possible
>       drm/i915/display/panel: use intel_de_rmw if possible in panel related code
>       drm/i915/display/interfaces: use intel_de_rmw if possible
>       drm/i915/display/misc: use intel_de_rmw if possible
>       drm/i915/display/power: use intel_de_rmw if possible
> 
> Ankit Nautiyal (2):
>       drm/i915/hdmi: Go for scrambling only if platform supports TMDS clock > 340MHz
>       drm/i915/dg2: Add HDMI pixel clock frequencies 267.30 and 319.89 MHz
> 
> Ashutosh Dixit (5):
>       drm/i915/hwmon: Enable PL1 power limit
>       Revert "drm/i915/hwmon: Enable PL1 power limit"
>       drm/i915/hwmon: Replace hwm_field_scale_and_write with hwm_power_max_write
>       drm/i915/hwmon: Enable PL1 limit when writing limit value to HW
>       drm/i915/hwmon: Accept writes of value 0 to power1_max_interval
> 
> Chaitanya Kumar Borah (3):
>       drm/i915/adlp: Fix typo for reference clock
>       drm/i915: Add RPL-U sub platform
>       drm/i915/display: Add 480 MHz CDCLK steps for RPL-U
> 
> Imre Deak (4):
>       drm/i915: Fix system suspend without fbdev being initialized
>       drm/i915: Move display power initialization during driver probing later
>       drm/i915/dgfx, mtl+: Disable display functionality if the display is not present
>       drm/i915: Sanitize the display fused-off check on GEN7/8
> 
> Jani Nikula (29):
>       drm/i915/dmc: add proper name to dmc id enum and use it
>       drm/i915/dmc: add for_each_dmc_id() and use it
>       drm/i915/dmc: remove unnecessary dmc_id validity check
>       drm/i915/dmc: add is_valid_dmc_id() and use it
>       drm/i915/dmc: check incoming dmc id validity
>       drm/i915/dmc: drop "ucode" from function names
>       drm/i915/uncore: cast iomem to avoid sparse warning
>       drm/i915/bios: set default backlight controller index
>       drm/i915: move memory frequency detection to intel_dram.c
>       drm/i915/wm: move remaining watermark code out of intel_pm.c
>       drm/i915/wm: move functions to call watermark hooks to intel_wm.[ch]
>       drm/i915/wm: add .get_hw_state to watermark funcs
>       drm/i915/wm: move ILK watermark sanitization to i9xx_wm.[ch]
>       drm/i915/wm: warn about ilk_wm_sanitize() on display ver 9+
>       drm/i915/wm: move watermark debugfs to intel_wm.c
>       drm/i915: rename intel_pm_types.h -> display/intel_wm_types.h
>       drm/i915/wm: remove ILK+ nop funcs fallback
>       drm/i915/dsi: fix DSS CTL register offsets for TGL+
>       drm/i915/display: split out DSC and DSS registers
>       drm/i915/wm: remove display/ prefix from include
>       drm/i915/pm: drop intel_pm_setup()
>       drm/i915/pm: drop intel_suspend_hw()
>       drm/i915: remove unnecessary intel_pm.h includes
>       drm/i915/power: move dc state members to struct i915_power_domains
>       drm/i915/dmc: use has_dmc_id_fw() instead of poking dmc->dmc_info directly
>       drm/i915/dmc: add i915_to_dmc() and dmc->i915 and use them
>       drm/i915/dmc: allocate dmc structure dynamically
>       drm/i915/dmc: mass rename dev_priv to i915
>       drm/i915/rps: split out display rps parts to a separate file
> 
> Jonathan Gray (1):
>       drm/i915: Add another EHL pci id
> 
> Jouni Högander (3):
>       drm/i915/psr: Split sel fetch plane configuration into arm and noarm
>       drm/i915/fbdev: Implement fb_dirty for intel custom fb helper
>       drm/i915/psr: Use calculated io and fast wake lines
> 
> Lucas De Marchi (9):
>       drm/i915: Add _PICK_EVEN_2RANGES()
>       drm/i915: Fix coding style on DPLL*_ENABLE defines
>       drm/i915: Convert pll macros to _PICK_EVEN_2RANGES
>       drm/i915: Replace _MMIO_PHY3() with _PICK_EVEN_2RANGES()
>       drm/i915: Convert PIPE3/PORT3 to _PICK_EVEN_2RANGES()
>       drm/i915: Convert _FIA() to _PICK_EVEN_2RANGES()
>       drm/i915: Convert MBUS_ABOX_CTL() to _PICK_EVEN_2RANGES()
>       drm/i915: Convert PALETTE() to _PICK_EVEN_2RANGES()
>       drm/i915: Move MCR_REG define to i915_reg_defs.h
> 
> Matt Atwood (1):
>       drm/i915: Fix memory leaks in scatterlist
> 
> Matt Roper (5):
>       drm/i915/tgl: Drop support for pre-production steppings
>       drm/i915/dg1: Drop support for pre-production steppings
>       drm/i915/dg1: Drop final use of IS_DG1_GRAPHICS_STEP
>       drm/i915/dg2: Drop one PCI ID
>       drm/i915/gen12: Update combo PHY init sequence
> 
> Mavroudis Chatzilaridis (1):
>       drm/i915/quirks: Add inverted backlight quirk for HP 14-r206nv
> 
> Nirmoy Das (1):
>       drm/i915/display: Pass drm_i915_private as param to i915 funcs
> 
> Radhakrishna Sripada (1):
>       drm/i915/mtl: Initialize empty clockgating hooks for MTL
> 
> Rodrigo Vivi (1):
>       drm/i915: Remove unused tmp assignment.
> 
> Stanislav Lisovskiy (2):
>       drm/i915: Implement workaround for CDCLK PLL disable/enable
>       drm/i915: Copy highest enabled wm level to disabled wm levels for gen >= 9
> 
> Suraj Kandpal (1):
>       drm/i915/dp: Increase slice_height for DP
> 
> Ville Syrjälä (74):
>       drm/i915/lvds: Split long lines
>       drm/i915/lvds: Use intel_de_rmw()
>       drm/i915/lvds: Use REG_BIT() & co.
>       drm/i915/lvds: Extract intel_lvds_regs.h
>       drm/i915/lvds: Fix whitespace
>       drm/i915/lvds: s/dev_priv/i915/
>       drm/i915/lvds: s/intel_encoder/encoder/ etc.
>       drm/i915/lvds: s/pipe_config/crtc_state/
>       drm/i915: Don't do the WM0->WM1 copy w/a if WM1 is already enabled
>       drm/i915: Introduce HAS_SAGV()
>       drm/i915: Keep sagv status updated on icl+
>       drm/i915: Expose SAGV state via debugfs
>       drm/i915/dsb: Pimp debug/error prints
>       drm/i915/dsb: Split intel_dsb_wait() from intel_dsb_commit()
>       drm/i915/dsb: Introduce intel_dsb_finish()
>       drm/i915: Fix VBT DSI DVO port handling
>       drm/i915: Populate encoder->devdata for DSI on icl+
>       drm/i915: Pick the backlight controller based on VBT on ICP+
>       drm/i915: Populate wm.max_level for everyone
>       drm/i915: Replace wm.max_levels with wm.num_levels and use it everywhere
>       drm/i915: Include stepping information in device info dump
>       drm/i915: Prefix hex numbers with 0x
>       drm/i915: Pass the whole encoder to hotplug_enables()
>       drm/i915: Move variables to loop context
>       drm/i915: Replace intel_bios_is_lspcon_present() with intel_bios_encoder_is_lspcon()
>       drm/i915: Replace intel_bios_is_lane_reversal_needed() with intel_bios_encoder_lane_reversal()
>       drm/i915: Replace intel_bios_is_port_hpd_inverted() with intel_bios_encoder_hpd_invert()
>       drm/i915: Consult the registered encoders for the ICL combo PHY w/a
>       drm/i915: Populate encoder->devdata for g4x+ DP/HDMI ports
>       drm/i915: Pass devdata to intel_bios_port_aux_ch()
>       drm/i915: Iterate all child devs in intel_bios_is_port_present()
>       drm/i915: Use encoder->devdata in eDP init
>       drm/i915: Make backlight setup debugs consistent
>       drm/i915: Don't hide function calls with side effects
>       drm/i915: Clean up g4x+ sprite TILEOFF programming
>       drm/i915: Include connector id+name in all backlight debugs/errors
>       drm/i915: Reduce ELD hex dumps a bit
>       drm/i915: Don't leak the DPT if drm_framebuffer_init() fails
>       drm/i915: Add a few more debugs for failed framebuffer creation
>       drm/i915: Use encoder->devdata more
>       drm/i915: Restructure intel_bios_port_aux_ch()
>       drm/i915: Pimp encoder ddc_pin/aux_ch debug messages
>       drm/i915: Fix platform default aux ch for skl
>       drm/i915: Rename intel_ddi_{enable,disable}_pipe_clock()
>       drm/i915: Flatten intel_ddi_{enable,disable}_transcoder_clock()
>       drm/i915: Give CPU transcoder timing registers TRANS_ prefix
>       drm/i915: s/PIPECONF/TRANSCONF/
>       drm/i915: Dump blanking start/end
>       drm/i915: Define the "unmodified vblank" interrupt bit
>       drm/i915: Add local adjusted_mode variable
>       drm/i915: Define transcoder timing register bitmasks
>       drm/i915/psr: Stop clobbering TRANS_SET_CONTEXT_LATENCY
>       drm/i915/dsb: Define more DSB registers
>       drm/i915/dsb: Allow vblank synchronized DSB execution
>       drm/i915/dsb: Nuke the DSB debug
>       drm/i915/dsb: Skip DSB command buffer setup if we have no LUTs
>       drm/i915: Configure TRANS_SET_CONTEXT_LATENCY correctly on ADL+
>       drm/i915: Sprinkle some FIXMEs about TGL+ DSI transcoder timing mess
>       drm/i915: Remove pointless register read
>       drm/i915/audio: Track audio state per-transcoder
>       drm/i915: Mark FIFO underrun disabled earlier
>       drm/i915: Undo rmw damage to gen3 error interrupt handler
>       drm/i915: Dump PGTBL_ER on gen2/3/4 error interrupt
>       drm/i915: Extract {i9xx,i965)_error_mask()
>       drm/i915: Mask page table errors on gen2/3 with FBC
>       drm/i915: Fix audio ELD handling for DP MST
>       drm/i915: Drop useless intel_dp_has_audio() argument
>       drm/i915: Get HDR DPCD refresh timeout from VBT
>       drm/i915/vrr: Fix "window2" handling
>       drm/i915/psr: Fix the delayed vblank w/a
>       drm/i915: Bump VBT version for expected child dev size check
>       drm/i915: Populate dig_port->connected() before connector init
>       drm/i915: Fix SKL DDI A digital port .connected()
>       drm/i915: Get rid of the gm45 HPD live state nonsense
> 
>  drivers/gpu/drm/i915/Makefile                      |    3 +
>  drivers/gpu/drm/i915/display/g4x_dp.c              |   53 +-
>  drivers/gpu/drm/i915/display/g4x_hdmi.c            |   21 +-
>  drivers/gpu/drm/i915/display/i9xx_wm.c             | 4047 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/i9xx_wm.h             |   21 +
>  drivers/gpu/drm/i915/display/icl_dsi.c             |  317 +-
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   84 +-
>  drivers/gpu/drm/i915/display/intel_audio.c         |   86 +-
>  drivers/gpu/drm/i915/display/intel_backlight.c     |  193 +-
>  drivers/gpu/drm/i915/display/intel_bios.c          |  269 +-
>  drivers/gpu/drm/i915/display/intel_bios.h          |   27 +-
>  drivers/gpu/drm/i915/display/intel_bw.c            |   49 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c         |   43 +-
>  drivers/gpu/drm/i915/display/intel_color.c         |   18 +-
>  drivers/gpu/drm/i915/display/intel_combo_phy.c     |   48 +-
>  .../gpu/drm/i915/display/intel_combo_phy_regs.h    |    4 +-
>  drivers/gpu/drm/i915/display/intel_crt.c           |   46 +-
>  drivers/gpu/drm/i915/display/intel_crtc.c          |    3 +
>  .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   16 +-
>  drivers/gpu/drm/i915/display/intel_cursor.c        |    5 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c           |  173 +-
>  drivers/gpu/drm/i915/display/intel_ddi.h           |    6 +-
>  drivers/gpu/drm/i915/display/intel_display.c       |  603 ++-
>  drivers/gpu/drm/i915/display/intel_display.h       |    4 +
>  drivers/gpu/drm/i915/display/intel_display_core.h  |   15 +-
>  .../gpu/drm/i915/display/intel_display_debugfs.c   |  239 +-
>  drivers/gpu/drm/i915/display/intel_display_power.c |   80 +-
>  drivers/gpu/drm/i915/display/intel_display_power.h |    4 +
>  .../drm/i915/display/intel_display_power_well.c    |  134 +-
>  .../gpu/drm/i915/display/intel_display_reg_defs.h  |   10 +-
>  drivers/gpu/drm/i915/display/intel_display_rps.c   |   81 +
>  drivers/gpu/drm/i915/display/intel_display_rps.h   |   22 +
>  drivers/gpu/drm/i915/display/intel_display_types.h |   19 +-
>  drivers/gpu/drm/i915/display/intel_dmc.c           |  395 +-
>  drivers/gpu/drm/i915/display/intel_dmc.h           |   44 +-
>  drivers/gpu/drm/i915/display/intel_dp.c            |   89 +-
>  drivers/gpu/drm/i915/display/intel_dp_aux.c        |   35 +
>  drivers/gpu/drm/i915/display/intel_dp_aux.h        |    4 +
>  .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   84 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        |   29 +-
>  drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   51 +-
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  165 +-
>  drivers/gpu/drm/i915/display/intel_drrs.c          |   16 +-
>  drivers/gpu/drm/i915/display/intel_dsb.c           |   41 +-
>  drivers/gpu/drm/i915/display/intel_dsb.h           |    5 +-
>  .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |    5 +
>  drivers/gpu/drm/i915/display/intel_dvo.c           |    7 +-
>  drivers/gpu/drm/i915/display/intel_fb.c            |    7 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c         |   28 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.h         |    8 +-
>  drivers/gpu/drm/i915/display/intel_fdi.c           |  159 +-
>  drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   20 +
>  drivers/gpu/drm/i915/display/intel_fifo_underrun.h |    3 +
>  drivers/gpu/drm/i915/display/intel_gmbus.c         |   30 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c          |   15 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c          |   79 +-
>  drivers/gpu/drm/i915/display/intel_lpe_audio.c     |    6 +-
>  drivers/gpu/drm/i915/display/intel_lpe_audio.h     |    4 +-
>  drivers/gpu/drm/i915/display/intel_lspcon.c        |    2 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c          |  338 +-
>  drivers/gpu/drm/i915/display/intel_lvds_regs.h     |   65 +
>  drivers/gpu/drm/i915/display/intel_mg_phy_regs.h   |    4 +-
>  drivers/gpu/drm/i915/display/intel_modeset_setup.c |   58 +-
>  drivers/gpu/drm/i915/display/intel_panel.c         |    1 +
>  drivers/gpu/drm/i915/display/intel_pch_display.c   |   72 +-
>  drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   10 +-
>  drivers/gpu/drm/i915/display/intel_pps.c           |   15 +-
>  drivers/gpu/drm/i915/display/intel_psr.c           |  209 +-
>  drivers/gpu/drm/i915/display/intel_psr.h           |   16 +-
>  drivers/gpu/drm/i915/display/intel_quirks.c        |    2 +
>  drivers/gpu/drm/i915/display/intel_snps_phy.c      |   62 +
>  drivers/gpu/drm/i915/display/intel_sprite.c        |    3 +-
>  drivers/gpu/drm/i915/display/intel_tv.c            |    6 +-
>  drivers/gpu/drm/i915/display/intel_vblank.c        |    4 +-
>  drivers/gpu/drm/i915/display/intel_vdsc.c          |    1 +
>  drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |  461 +++
>  drivers/gpu/drm/i915/display/intel_vrr.c           |   10 +-
>  drivers/gpu/drm/i915/display/intel_wm.c            |  408 ++
>  drivers/gpu/drm/i915/display/intel_wm.h            |   37 +
>  .../{intel_pm_types.h => display/intel_wm_types.h} |    8 +-
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |    8 +-
>  drivers/gpu/drm/i915/display/skl_watermark.c       |  152 +-
>  drivers/gpu/drm/i915/display/skl_watermark.h       |    7 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c             |  158 +-
>  drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   18 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c                 |    1 -
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c              |    1 -
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    2 -
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    2 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c                |   29 -
>  drivers/gpu/drm/i915/gt/intel_workarounds.c        |   86 +-
>  drivers/gpu/drm/i915/gt/selftest_llc.c             |    1 -
>  drivers/gpu/drm/i915/gvt/display.c                 |   16 +-
>  drivers/gpu/drm/i915/gvt/handlers.c                |   18 +-
>  drivers/gpu/drm/i915/i915_debugfs.c                |    1 -
>  drivers/gpu/drm/i915/i915_driver.c                 |   40 +-
>  drivers/gpu/drm/i915/i915_drv.h                    |   18 +-
>  drivers/gpu/drm/i915/i915_hwmon.c                  |   51 +-
>  drivers/gpu/drm/i915/i915_irq.c                    |  142 +-
>  drivers/gpu/drm/i915/i915_pmu.c                    |    1 -
>  drivers/gpu/drm/i915/i915_reg.h                    |  901 ++---
>  drivers/gpu/drm/i915/i915_reg_defs.h               |   31 +
>  drivers/gpu/drm/i915/i915_request.c                |    1 -
>  drivers/gpu/drm/i915/i915_scatterlist.c            |    8 +-
>  drivers/gpu/drm/i915/i915_sysfs.c                  |    1 -
>  drivers/gpu/drm/i915/intel_device_info.c           |   28 +-
>  drivers/gpu/drm/i915/intel_device_info.h           |    1 +
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   71 +-
>  drivers/gpu/drm/i915/intel_pm.c                    | 4224 +-------------------
>  drivers/gpu/drm/i915/intel_pm.h                    |   16 -
>  drivers/gpu/drm/i915/intel_runtime_pm.c            |    2 +
>  drivers/gpu/drm/i915/intel_uncore.c                |    6 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp.c               |   65 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp.h               |    2 +
>  .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h  |   15 +
>  .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h |    3 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |    4 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_pm.h            |    6 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |    8 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.h       |    5 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   46 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |    3 +
>  drivers/gpu/drm/i915/soc/intel_dram.c              |  152 +
>  drivers/misc/mei/client.c                          |    4 +-
>  drivers/misc/mei/pci-me.c                          |   20 +-
>  include/drm/i915_pciids.h                          |   14 +-
>  126 files changed, 8279 insertions(+), 7974 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/i9xx_wm.c
>  create mode 100644 drivers/gpu/drm/i915/display/i9xx_wm.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_lvds_regs.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_vdsc_regs.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_wm.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_wm.h
>  rename drivers/gpu/drm/i915/{intel_pm_types.h => display/intel_wm_types.h} (89%)
