Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E95EA79A7FA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 14:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCAE10E2D4;
	Mon, 11 Sep 2023 12:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A8410E2D4;
 Mon, 11 Sep 2023 12:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694436037; x=1725972037;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uA7/uuJH+DamdyK+hQI04MseMpyNnZgG5t/+7pVeONE=;
 b=eGGW2SjVXn1w8InGmrafrebX3gmnXOX2j4tfLbWlwB9lniW+9ycqSve3
 FhkBbSD2SjFiTGgF7+BdYbbCqRuUdyeezASiWk8wHa/lNcUu0dvCAXLCP
 8oQdtcOGB0/Dm96Wpzv3sd2Rwqz2HvHEoFqncuYZhg4wTmCVTrl6ylKHH
 RdaY44mciXMaxcO7RPcCKFKaoPbeneOdUkIEYGuCp8v4rkdQ02TnQS8+6
 l3d3+18QlsB8OGUw5GH+0lxZT5jjWFLynGdFDfV/fAxuot0TLIj6TmuOV
 ZAcZoxmzceHoI+zD9fgzQ4gFFbhgvZrjMK4qiyIGQ20JhHh1JhZeLC5q0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409036879"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="409036879"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 05:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886505757"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="886505757"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 05:40:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 05:40:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 05:40:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 05:40:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 05:40:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Md0u8h+FPhQPRFs9ImYsdALg/G6Qxw++wd+67sSmZ06RkrS3sucgU1K3H+IXEkquzFJ9mwcEyeT0orvpU3YnoxAYfcRtpGQfkv5EhuorZJyD7BqcGe7NuUR/iVHN/sIWjNxq5oBny77Fxh5RuX9op0zSwgHl4je1/JqD5efjrqQFAYMNEORaAoYHCxbsYPx2GDq/6MS+rrdaC6qi/EKP6X0/EocFkLlV0gzibCv+SGxrRQmB9sxSiiqqx5inRNjszhL5UvkhjVA3dqUBRQKbZtDHu4cB7yv416/AZTfd5ud2wCkeeHVSOHiexjkRrCHvid58Yvvm/2EH5HJxjgGuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEWzU+zWZHHOAuCWjwibdWlOs+JMaORUy8wS7NVykR8=;
 b=Z9NX7CN6Kh7sUGU8P/1LBBmzyV9M4Nmxv4iVu4dZLgnvMrWMCJxycfaErEmp55ItjEev841nXhCTOcduCGxuDXgA9KsdnFqE4j7kaQSUg7qpchRjsTSPYd9t8RTT8SQQcJ+N+9aRvlTMgpnZBZaxgg3hHYBnRTsisBPAFu7vCZzyBpuzsYLAlT5VcFJ6UapxgDRPhwQ4TNshxy/8eLHB6hegDCX9rzVGJn5zck9iitxe99kV2RQ0VimyD2pNtSm0jwyjPLjT6Mg7V41L1YKuZlDty3d+0VJiJS2TUpUWQJMffvQzI2yAtjvjx9BW/bsyOIl5hVcNsfAqLYZmpXIvHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SN7PR11MB6946.namprd11.prod.outlook.com (2603:10b6:806:2a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 12:40:33 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 12:40:33 +0000
Date: Mon, 11 Sep 2023 14:40:25 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/tests: helpers: Avoid a driver uaf
Message-ID: <ZP8KuXoyS8RbRWws@fdugast-desk.home>
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
 <20230907135339.7971-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230907135339.7971-2-thomas.hellstrom@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SN7PR11MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: 8100cddc-eb26-4527-1fce-08dbb2c44a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMVDfxnRjOyueCbtYrpkoBGY9eKFyqAH2YS1Cy9IcN3Uc3TGPCSwNk5J9nQTH+5Cgfn5sTmMGzSWSGiiulT+tXVswNtzNWS18GhUmyVPJJ1GKlwFRIOCZFccnRKbB9bYsOC6mKerDeoapatH5Q7XCcv6bpf0C4WpX38wyOA72BkVWTJ+od2x7irBpmhVAramJwpcXN0Elp58Z6StWiymGarb3j1Wg6tN6WZsybA9dlycV12B3I3MF1w6ODJJw38AijdcXBQnPTqZD0hxWA2XYaB7sM6HDX6XgLTwo4gjhThbOsFnjKNItoulsl5LL/RVOdM63ArYHMGl+5Rch2W5q5K1ZVqEEgwglFMcm0Ht2kIYIUC/h0pJpf1U4FlCYqagXMSgnK7IWgwvPMV+CPK1MbLeJZFkGcVEld2cPxeWrRSVGLl4/+TCeMOktSxEcjDqDhBHwU/2le7Fof3Udb1zH+fC3LK0D/xGzE/wZ2xyVPdMOVbdZ5iEwdULKEpLF8aBA4LVzCNiCwoTo21yqkX+oFLvILmY91G+lKR38kdEkZ0vyjaWw9aeqefUWQX2mvRa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199024)(1800799009)(186009)(83380400001)(9686003)(82960400001)(6512007)(44832011)(36756003)(2906002)(8676002)(5660300002)(54906003)(8936002)(66946007)(4326008)(316002)(41300700001)(66476007)(66556008)(6916009)(6486002)(478600001)(6506007)(6666004)(38100700002)(86362001)(36916002)(66574015)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CeM+wxEyHbweX1MzEpNiQv46N5eOMCNCQthjfAOi6xSK8G+L2MwPoyvwE2?=
 =?iso-8859-1?Q?ZFKjy0loPr9uOX3453kVf08vDjvlizK/O/sgfxbrZ7jmG6hs6KULgdIxlQ?=
 =?iso-8859-1?Q?hW+28ZRP7HwzOP7Yw16grQmEF8w3Pp0p11KkU5bsuHVxPgw7NyLoa+b9fX?=
 =?iso-8859-1?Q?ARFx8G2ZehhM/Uqfbtv4mOFyieNmn0MFKm/mceghEnt/o5vTKTrhzZY+6c?=
 =?iso-8859-1?Q?qJMJY8Ih0fTZPUx8Pizo0MXcrbgU1/5F2GtNsIPxJfmuvmSe28yBfFDPIF?=
 =?iso-8859-1?Q?cUn+8vP5IfGTLUb1w0L/5vWtzZXWij+XmPGj2+HRoDosSjiXbBtRJPhoem?=
 =?iso-8859-1?Q?VkbhwUZRMesqwIA5qR2k/bzvv7Q/17LEKTX6ofdGBAkij2Kncs2qPZtW9Q?=
 =?iso-8859-1?Q?0htXd1BGf5sAuBcizmEmf+jnpgOhuZA4Y2YB8xEuMpsoamSY6pvyj2aaZw?=
 =?iso-8859-1?Q?i0+fPr93dxAV0fsdf6qqFUNCoEPen0nAQ8u5yzxeCj1CPBiyNPz9QIGTa/?=
 =?iso-8859-1?Q?lzFu6fbWt7TrZ7Qw0d5qdM51LFUUjFAhyMEH0bdAMUar34dfH5oLW78noU?=
 =?iso-8859-1?Q?RmgNSzwLIHf29tX9uRbBVvIRe8BGq3mOTs0lc3lVwakrbB/M0A+wuhCXtD?=
 =?iso-8859-1?Q?khEJuZUxQP1GYC54u1LcKvdNDD5ZdXAcX4pCPUBEyU3Mmk7By6IaV/KxPH?=
 =?iso-8859-1?Q?dR7Xmu/So+G1lItIsBBE0Zgl99Nkek1c/Y/X0mJg2tMKxO8vGS8O9gZEHV?=
 =?iso-8859-1?Q?GmxE3XMG5+JWjIQMuNcUrET9PoAnJWAJf4TtAVAikt8HZdWyxES2UOKBwN?=
 =?iso-8859-1?Q?4u1XV0wz3MRSB4rkgzGfhtbtYlWipFqJyDKUXfAqqCELH3yYX/kwm1hYVv?=
 =?iso-8859-1?Q?wUOZuV5AnfPQ7NJg3CwJEjalJ5GH+rlFWC1acD+kJNTNzCRCUahZ9hsn9C?=
 =?iso-8859-1?Q?RgSgDmYYa5vYI3z44qzW6IYxnYJM6VdmcruEQie9nTzcP7ajZQPiGIdCfv?=
 =?iso-8859-1?Q?j4mZxmUKXYdXSX87tDYkyGenCpSuowe6sooSa8wMPSaPRH8PapLQ1FCgoB?=
 =?iso-8859-1?Q?vTFwe/+cvDm8jF1OZy74yGcWgR2OrSl9u8iki4NIzDhL1iMQsjjhISA6Hu?=
 =?iso-8859-1?Q?bZqXSLTXCXdAyEDjsV0lrZJnlLZQE/2ddXcgeNZkaYsrZyRlHw30nNkJcj?=
 =?iso-8859-1?Q?4r0PdL0fE/T8K3doKBzO/soM5szQFQ9aVAcK7orMWUfLv8XV5p8j1Hj2de?=
 =?iso-8859-1?Q?fclA6CAod186nDnCoY2Qn8BXyEQ/cN0jWZZNurrDKt1LLaVsuU+CqaMsHC?=
 =?iso-8859-1?Q?haCRJ2r/yqlhbqsKtCTNd9zGwi9G/bQx1AX45X/6g5Bqc5aH/uQY02QQPb?=
 =?iso-8859-1?Q?X4y7Qq1MF/iQSgy3jeXsaC6Pr5LomNkWjEJ0rTrMkpUDwvgAMPHR+f0dbV?=
 =?iso-8859-1?Q?8wzbHnIXXh/lgDyppFNl39ffYCUU0uM9peL2UK7avQnmQdkVMVk7W+mcm9?=
 =?iso-8859-1?Q?jhMsOnAa3+RdDplJRsDsMtmPoJ68qgCohTRij6ozCPoH9rkWxm7CLTnv6v?=
 =?iso-8859-1?Q?09uhXtJJnigp9uCwBpV3b0EoJCpTbfeGUmBD/fUcOM7o46BIbLUZkm753a?=
 =?iso-8859-1?Q?7Ndq2Y+V77cLeLfExofmoJZqUD9sBW+X91Tp2QzoME+pt1uU/u3Q1IDQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8100cddc-eb26-4527-1fce-08dbb2c44a59
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 12:40:33.5575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yfNuvaA9HJwPadfpVKqI4M2R7WAwRR/kA8TC8F1xf6mL2FV0sZQkz39PHDfCXhTkCgUlSdLRErCDuAmrbNIAewTNLb87cr7KZLRGS5K9sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6946
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 07, 2023 at 03:53:38PM +0200, Thomas Hellström wrote:
> when using __drm_kunit_helper_alloc_drm_device() the driver may be
> dereferenced by device-managed resources up until the device is
> freed, which is typically later than the kunit-managed resource code
> frees it. Fix this by simply make the driver device-managed as well.
> 
> In short, the sequence leading to the UAF is as follows:
> 
> INIT:
> Code allocates a struct device as a kunit-managed resource.
> Code allocates a drm driver as a kunit-managed resource.
> Code allocates a drm device as a device-managed resource.
> 
> EXIT:
> Kunit resource cleanup frees the drm driver
> Kunit resource cleanup puts the struct device, which starts a
>       device-managed resource cleanup
> device-managed cleanup calls drm_dev_put()
> drm_dev_put() dereferences the (now freed) drm driver -> Boom.
> 
> Related KASAN message:
> [55272.551542] ==================================================================
> [55272.551551] BUG: KASAN: slab-use-after-free in drm_dev_put.part.0+0xd4/0xe0 [drm]
> [55272.551603] Read of size 8 at addr ffff888127502828 by task kunit_try_catch/10353
> 
> [55272.551612] CPU: 4 PID: 10353 Comm: kunit_try_catch Tainted: G     U           N 6.5.0-rc7+ #155
> [55272.551620] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 0403 01/26/2021
> [55272.551626] Call Trace:
> [55272.551629]  <TASK>
> [55272.551633]  dump_stack_lvl+0x57/0x90
> [55272.551639]  print_report+0xcf/0x630
> [55272.551645]  ? _raw_spin_lock_irqsave+0x5f/0x70
> [55272.551652]  ? drm_dev_put.part.0+0xd4/0xe0 [drm]
> [55272.551694]  kasan_report+0xd7/0x110
> [55272.551699]  ? drm_dev_put.part.0+0xd4/0xe0 [drm]
> [55272.551742]  drm_dev_put.part.0+0xd4/0xe0 [drm]
> [55272.551783]  devres_release_all+0x15d/0x1f0
> [55272.551790]  ? __pfx_devres_release_all+0x10/0x10
> [55272.551797]  device_unbind_cleanup+0x16/0x1a0
> [55272.551802]  device_release_driver_internal+0x3e5/0x540
> [55272.551808]  ? kobject_put+0x5d/0x4b0
> [55272.551814]  bus_remove_device+0x1f1/0x3f0
> [55272.551819]  device_del+0x342/0x910
> [55272.551826]  ? __pfx_device_del+0x10/0x10
> [55272.551830]  ? lock_release+0x339/0x5e0
> [55272.551836]  ? kunit_remove_resource+0x128/0x290 [kunit]
> [55272.551845]  ? __pfx_lock_release+0x10/0x10
> [55272.551851]  platform_device_del.part.0+0x1f/0x1e0
> [55272.551856]  ? _raw_spin_unlock_irqrestore+0x30/0x60
> [55272.551863]  kunit_remove_resource+0x195/0x290 [kunit]
> [55272.551871]  ? _raw_spin_unlock_irqrestore+0x30/0x60
> [55272.551877]  kunit_cleanup+0x78/0x120 [kunit]
> [55272.551885]  ? __kthread_parkme+0xc1/0x1f0
> [55272.551891]  ? __pfx_kunit_try_run_case_cleanup+0x10/0x10 [kunit]
> [55272.551900]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
> [55272.551909]  kunit_generic_run_threadfn_adapter+0x4a/0x90 [kunit]
> [55272.551919]  kthread+0x2e7/0x3c0
> [55272.551924]  ? __pfx_kthread+0x10/0x10
> [55272.551929]  ret_from_fork+0x2d/0x70
> [55272.551935]  ? __pfx_kthread+0x10/0x10
> [55272.551940]  ret_from_fork_asm+0x1b/0x30
> [55272.551948]  </TASK>
> 
> [55272.551953] Allocated by task 10351:
> [55272.551956]  kasan_save_stack+0x1c/0x40
> [55272.551962]  kasan_set_track+0x21/0x30
> [55272.551966]  __kasan_kmalloc+0x8b/0x90
> [55272.551970]  __kmalloc+0x5e/0x160
> [55272.551976]  kunit_kmalloc_array+0x1c/0x50 [kunit]
> [55272.551984]  drm_exec_test_init+0xfa/0x2c0 [drm_exec_test]
> [55272.551991]  kunit_try_run_case+0xdd/0x250 [kunit]
> [55272.551999]  kunit_generic_run_threadfn_adapter+0x4a/0x90 [kunit]
> [55272.552008]  kthread+0x2e7/0x3c0
> [55272.552012]  ret_from_fork+0x2d/0x70
> [55272.552017]  ret_from_fork_asm+0x1b/0x30
> 
> [55272.552024] Freed by task 10353:
> [55272.552027]  kasan_save_stack+0x1c/0x40
> [55272.552032]  kasan_set_track+0x21/0x30
> [55272.552036]  kasan_save_free_info+0x27/0x40
> [55272.552041]  __kasan_slab_free+0x106/0x180
> [55272.552046]  slab_free_freelist_hook+0xb3/0x160
> [55272.552051]  __kmem_cache_free+0xb2/0x290
> [55272.552056]  kunit_remove_resource+0x195/0x290 [kunit]
> [55272.552064]  kunit_cleanup+0x78/0x120 [kunit]
> [55272.552072]  kunit_generic_run_threadfn_adapter+0x4a/0x90 [kunit]
> [55272.552080]  kthread+0x2e7/0x3c0
> [55272.552085]  ret_from_fork+0x2d/0x70
> [55272.552089]  ret_from_fork_asm+0x1b/0x30
> 
> [55272.552096] The buggy address belongs to the object at ffff888127502800
>                 which belongs to the cache kmalloc-512 of size 512
> [55272.552105] The buggy address is located 40 bytes inside of
>                 freed 512-byte region [ffff888127502800, ffff888127502a00)
> 
> [55272.552115] The buggy address belongs to the physical page:
> [55272.552119] page:00000000af6c70ff refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x127500
> [55272.552127] head:00000000af6c70ff order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> [55272.552133] anon flags: 0x17ffffc0010200(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
> [55272.552141] page_type: 0xffffffff()
> [55272.552145] raw: 0017ffffc0010200 ffff888100042c80 0000000000000000 dead000000000001
> [55272.552152] raw: 0000000000000000 0000000080200020 00000001ffffffff 0000000000000000
> [55272.552157] page dumped because: kasan: bad access detected
> 
> [55272.552163] Memory state around the buggy address:
> [55272.552167]  ffff888127502700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [55272.552173]  ffff888127502780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [55272.552178] >ffff888127502800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [55272.552184]                                   ^
> [55272.552187]  ffff888127502880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [55272.552193]  ffff888127502900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [55272.552198] ==================================================================
> [55272.552203] Disabling lock debugging due to kernel taint
> 
> v2:
> - Update commit message, add Fixes: tag and Cc stable.
> v3:
> - Further commit message updates (Maxime Ripard).
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.3+
> Fixes: d98780310719 ("drm/tests: helpers: Allow to pass a custom drm_driver")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  include/drm/drm_kunit_helpers.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
> index 514c8a7a32f0..ba483c87f0e7 100644
> --- a/include/drm/drm_kunit_helpers.h
> +++ b/include/drm/drm_kunit_helpers.h
> @@ -3,6 +3,8 @@
>  #ifndef DRM_KUNIT_HELPERS_H_
>  #define DRM_KUNIT_HELPERS_H_
>  
> +#include <linux/device.h>
> +
>  #include <kunit/test.h>
>  
>  struct drm_device;
> @@ -51,7 +53,7 @@ __drm_kunit_helper_alloc_drm_device(struct kunit *test,
>  {
>  	struct drm_driver *driver;
>  
> -	driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
> +	driver = devm_kzalloc(dev, sizeof(*driver), GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, driver);
>  
>  	driver->driver_features = features;
> -- 
> 2.41.0
> 
