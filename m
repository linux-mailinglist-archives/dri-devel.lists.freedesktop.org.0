Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE06B78CB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 14:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E0B10E51D;
	Mon, 13 Mar 2023 13:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C7810E51D;
 Mon, 13 Mar 2023 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678713844; x=1710249844;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=do5K5L3vaCQlfw4M2RzVOMZAkd4SH7I0IeG2mermsxU=;
 b=Y9/tJNWljMRZg6CwyNddjewyqz/AKJ21DKjkV7vUE7bMKEL5BYISbbip
 HCAw0pvMlT3lrl1i7+n/X78yAc7aEgap0YA0QrEHmkQ3CK9T7t7rDYKwP
 BIvyEW8m8GXdK4SIVtACUD1ek0RQuKIuzIxx9Ix66tNsXXK85SmA4wQxv
 CVdW+ffyEONA0BGuOZaviu9e9Zl5FPZG2P65UOYF47noxwQGO4/1RC3nd
 Xo6VlN+rv5LlfTMFHVNH8SOjCUGJmjem5WGlSshq2JPJvQf/GzbZRwXMO
 XThCDhunWfeRUtDFNM+8VpzukDm4LUTZNegvjHH6oUZjqeEaVeBQZ8DIL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402013381"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="402013381"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 06:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="1007983614"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="1007983614"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 13 Mar 2023 06:24:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 06:24:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 06:24:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 06:24:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQHP12AfwmO0CnKkISroAgNdb92WSZ01jUGwQg1rnusZ1mvv6Uhqmy+kI5F4ouVEXTUNH/skkSJxxQ7IkrbQ8i2QhEH1eOEoSEpaM1PdA/iclFT/6pGqfis8VGku2SPr/hPSql2yiy5f5/61ACyvWT+AeUI6zQrWP2xN/zW1KW+4JdCWSQx/N86UqPWYTw5Q006b+TB+4CGl8P50qjrBmsVLutVkg3KbArPP+bMWauols2ml4ZagKnnrinV5FXOmUVeSOdHUqsSjSBuHfduKA6AjgBgjRzGN4TJH3nZE5bfsF66xg7n7SU9j4qBE/gmIF9P2k+E+xXn6Se+x7PmHkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzgRUoYo/17PmQc9MvsyQp0VXmrno1otEX+OiByvp5o=;
 b=cjFlEdWPsG8K3PHNkrCmqEkpkV+SkBtda5IChaN+FKt/gs6y4/Hadr0Yob8IgPgZZb8t1T4TXi3zuKsVAIEag3yNLOOx1iu5oYm1e/Drj4NAO+eyKiF1MBxIJ/b9V0sZNgssg9c1SZTYRKZVpF0mcnKuW3JUSF71Ds4k71GvM0uthkEd9KjgbtQa4e9BJUWO5hWkK0B0fwnTp7tFSN9HYV0QknFwlNxXjaUJKOjyG+YHMtLge3ZxsFs0TDzWp09sKMciKOTa1EQtaKxafPBiWHzeN3moYMeubPk7JqMG4fPpbsywaBFgnk4BA4YG6RBZs3pxNh+qlByIPukat1LJsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:24:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Mon, 13 Mar 2023
 13:24:01 +0000
Date: Mon, 13 Mar 2023 06:23:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915: Remove redundant check for DG1
Message-ID: <20230313132359.xahyrz3d4o2rgw7s@ldmartin-desk2.lan>
References: <20230306204954.753739-1-lucas.demarchi@intel.com>
 <ZA7oghE7c6eM/Dkr@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZA7oghE7c6eM/Dkr@intel.com>
X-ClientProxiedBy: BY5PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb9b190-b93a-496d-2838-08db23c63561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqcL/91bziPB9KUfyfCxypQEvpZriePz4p0CTNrYoe+ll55NplkO/kLfVNbYcrxnbnWk8jG9fcdma5RXjimuQZvE3bo62FYfzysb+dRc83lDaI75pz8K9JCSJrUtroeOEN1oiiGcL11Gd+OzKAGYUWXv0dKhkrLJ3bK7bzgkGla0eQ9IxWA4bk4VVHqqdmKIEDOUsaPNoMuBeRAlmjcHW/AX6neHT9f74D7f+SkvkldZ8vdAoziqXaulyqJf97LCVv1lKXvGE7NM8oQxP0rw5+W9zoOD3P6UIWOGze5SOFlVX6RIzAQgf4x+eiEcahHHU/SCwZQAM5hMlFjm0FmgSwoDJpIY+RsukeSZTYJvVCWQEkMrppv+3kIBNnEFFuQMz7wFSVCnXk9Gdz5L45RAC18rMMmdC7y0h4ps2TRalT9gk4vPBw2QsDfNIyHf1GvdOqwqYaX/HSbavb6nkv47/+wYlOSnHnUURRhLFJl0qtHWODPyaXJuUJPj7GFT+2Kb3pD4G2BecpV0KGQ84kYFOXZw3ysZBj5EJ3M07vbgGJMZUzs7V4xb3SGUFz4MxpTx1p6XFQvbVkbRZnvGbPHsKPde5vlaJoxvspXnt0Khtj+ySeALhokaxkb5+2sTOlkqA/bNsYfyzotuU+lJLioNTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199018)(36756003)(5660300002)(8936002)(2906002)(82960400001)(86362001)(38100700002)(66946007)(478600001)(66556008)(66476007)(8676002)(6486002)(41300700001)(4326008)(6916009)(316002)(83380400001)(9686003)(6512007)(1076003)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8PGD0ZM3SJmynPCBE751meMxGHRvnKHLY1Z4JQ08KW0yoR942eTgfxJJmC?=
 =?iso-8859-1?Q?Ru/zqV3OHaSvG/Lktc8xwGtqOyCOLemRCLzbd6ZvYjK7gRU+etyeHwBwJE?=
 =?iso-8859-1?Q?zBxrJwLAi+eW296Sz3FzkycKJndvoJjXFdSh+lzzje8Vg2DW7vKvwH29UN?=
 =?iso-8859-1?Q?dRPh0DPXB6ivxzflclSldXFoWDrunt2GM8K89svHhZeDM1yXYAt/Pq8qEG?=
 =?iso-8859-1?Q?b/xC7kCEYr0Oq2wqcDSPJdBLTepOIImCYuX64aMudGUkUKTGXVMAPlKOfq?=
 =?iso-8859-1?Q?8UkH/sC4r5WHxO5XOCFDADYE9tagr9MabPlucozf3TrAg1zDjIJcqAyypS?=
 =?iso-8859-1?Q?WBfv8pSuy4W6mXCLH6/qDt/38/aQ+Z9PqygMUAmAmooYcSfmD5L5IceQNu?=
 =?iso-8859-1?Q?ZRYimSQELQxq2XVKiGxedbN28raU/iRerYt6lEqnDFCpWRnfmJSpm2z+s6?=
 =?iso-8859-1?Q?uX+dV7MyxJT+ZFxo/y3ac+c9/eBhn6f9H3aYrAzv0J6eGBk37SMRSLeFQb?=
 =?iso-8859-1?Q?wxID2ke0ybYQryRYpimVRqptJIHQKcBS9otJr+cR3AMBHSHts3UUcCWr53?=
 =?iso-8859-1?Q?XX3t3K2Pd8h8Ti6/6LmFiql08gqNetKriN7J+P88BEwW7Y5nle+qLNjOBe?=
 =?iso-8859-1?Q?7Lecsp5c9ty3iz+MMzAEljnu080ydAzGZIlpOPzY6t19qiwk2xTxxOYsxx?=
 =?iso-8859-1?Q?pYYFuT5DL3lMNcAk4mcxSGC5NfMZetDuFCxHP8oUPUFXFPKnj0EAfD4mvf?=
 =?iso-8859-1?Q?9WylzmuVjRQom53ijWdknL3K2u81axSrgUXPd8ab2KqLfbU0KuZZI1ZNyU?=
 =?iso-8859-1?Q?9sRmWGh6otvYS2Fvwnx8VV89mjim3H9p3c/vPqbwroeSvvW/fVZ3sAt61J?=
 =?iso-8859-1?Q?h7dbWGpz0hXnYaC/DroE+LOIp3nLD28uymkqmpJ28TljC3vRkYQauXsnaj?=
 =?iso-8859-1?Q?yeoD+EyEKKzZZ26o//iipHwXofeCZZ3uCDbfY7piUDQwuGOQ8GUHHZrqXB?=
 =?iso-8859-1?Q?4tr2O5Pgc7Qfab7icHOq+hxNXFpd5C+in4xPtI4AfdLmVPrdIOvfbTPnuL?=
 =?iso-8859-1?Q?HFtCTCMv9i2KfWlxyLwq0oPyG5h5hmFxNDoMUzsoCxh/S8CZ7mz6fTzLL/?=
 =?iso-8859-1?Q?016mId3M6wzxm+94xq9ZMEvlI7X2yQUuzdpSf4EStXZl4Vxo1czOsLHFMy?=
 =?iso-8859-1?Q?OCzb4jfg9ktpyQqftaEdzU6KK2gdzJbmxUCVxj9Wl9x0gr4MdtI47G1eyM?=
 =?iso-8859-1?Q?MVdMelmHZV+Gojh3bbWM5eMgiTCF0WGR2NAH+vDESZ8aBCqLpiN303c97O?=
 =?iso-8859-1?Q?2rGxBCFpGrgcngAnGOmHXq2PYFj1YqVpAgswNTgq/KQDr2gV5Pon6U2Lk1?=
 =?iso-8859-1?Q?a/r/iCsFFlwYN+h2QR3ucLgHJ9M8TnKFunTCOo7Kg/eL7nqWGcZSUTMwqE?=
 =?iso-8859-1?Q?NrL263Q6i4Sr/hos/DjgVvYmRlQk1SyXrjj6ip+aIAbDMFYDZWjD4Nnfsn?=
 =?iso-8859-1?Q?gcqZCtiCqjmA/ee5X7nforHrjHwXxghqKFL+HJYadR8QzMAbW5XMe6jYUl?=
 =?iso-8859-1?Q?BsmrXoOKBuRDLkn54q0JOGuyToaHqPnvG9miQiCNjVOlMhPOTh0YV3PMjd?=
 =?iso-8859-1?Q?t1ZKDoOXLviTcKQecZdv3uDGpfTcZYaGGSGhogfDz1rov3maAn2Ujt6A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb9b190-b93a-496d-2838-08db23c63561
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:24:01.1626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 973Qx65+TT50b3F+SIS4cuhmKRyWn32Tzlz69ZJ8RFYyQbiBtasQmT8KV7gP1s60kDocLlWCVJgBaUHrn226Q5eO/KTY6nFXjwjGc4UiRDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7846
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

On Mon, Mar 13, 2023 at 11:10:26AM +0200, Ville Syrjälä wrote:
>On Mon, Mar 06, 2023 at 12:49:52PM -0800, Lucas De Marchi wrote:
>> dg1_gt_workarounds_init() is only ever called for DG1, so there is no
>> point checking it again.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 12 +++---------
>>  1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> index 32aa1647721a..eb6cc4867d67 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> @@ -1472,21 +1472,15 @@ gen12_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>>  static void
>>  dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>>  {
>> -	struct drm_i915_private *i915 = gt->i915;
>> -
>
>Looks like you pushed some stale version of this patch which
>didn't remove this variable. Now the CONFIG_DRM_I915_WERROR=y
>build is broken.
>
>Did you lose that from your pre-push build .config?

no, looks like a conflict between drm-intel-gt-next and drm-intel-next

69ea87e1591a ("drm/i915/dg1: Drop support for pre-production steppings")
merged in drm-intel-next dropped the only user.

This patch was merged in drm-intel-gt-next and I didn't realize the
race was with the other branch rather than with the same branch due to
taking a long time for me to apply. Let me rebuild drm-tip to fix it up.

Lucas De Marchi

>
>>  	gen12_gt_workarounds_init(gt, wal);
>>
>>  	/* Wa_1409420604:dg1 */
>> -	if (IS_DG1(i915))
>> -		wa_mcr_write_or(wal,
>> -				SUBSLICE_UNIT_LEVEL_CLKGATE2,
>> -				CPSSUNIT_CLKGATE_DIS);
>> +	wa_mcr_write_or(wal, SUBSLICE_UNIT_LEVEL_CLKGATE2,
>> +			CPSSUNIT_CLKGATE_DIS);
>>
>>  	/* Wa_1408615072:dg1 */
>>  	/* Empirical testing shows this register is unaffected by engine reset. */
>> -	if (IS_DG1(i915))
>> -		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
>> -			    VSUNIT_CLKGATE_DIS_TGL);
>> +	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL);
>>  }
>>
>>  static void
>> --
>> 2.39.0
>
>-- 
>Ville Syrjälä
>Intel
