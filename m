Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38640633138
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 01:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8509D10E1C1;
	Tue, 22 Nov 2022 00:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511EA10E1C1;
 Tue, 22 Nov 2022 00:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669076257; x=1700612257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ruuY2ai78bUFq8jS6lbGP5oArQuXMZ8lH7vu24idyVY=;
 b=S9yKa4BgKHDlUr7NHIFiE337F2yxNZKH4PbdRkmSPK67uwp5Rp71g4/t
 Up/66hUfNMwEcxBb8fwaMRMxdyQSlD61v80rJQ1pVZ8G3V5rweYYROZFD
 Fxx6EhgDQA9qygVVx2ky4avhniH6JbxpIJ9TNLv9nKvVjfl8vRfbZZDhz
 P55VG0gCP16K9VSCNzBO1q4JDeMmL3JIV4hdztepDCopXe+2MzfOFlUQ8
 JdrP2gD8WWPEFR1eAjO7ChZNatPprF4bTwjc2NokwykE1sDONAuZb0jka
 MPUKJw+DG3DTvQb6w6OCrv+f1/D0HIBLGx5dCd0/OyG1UFb+xkxXcX5KT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="340557937"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="340557937"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 16:17:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="730206173"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="730206173"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2022 16:17:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 16:17:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 21 Nov 2022 16:17:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 21 Nov 2022 16:17:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGo/fA0uc2MWIbK3EXiMJvYw/N/yHl5iYw4BuvW9PnvEUedPcz4rPuZ53Gnn+m3YKj5FzzZekRKA5qmEQJ7lWzexC9B3mf0d7o9o1ZGIey7pAVyIRyI/f9xu44NDEDou7irL3sYA/DLkJE0TUXDdRY2mnb+hGpR4viCqZQJHfAmwmHlTXf7L/YYSc7V0uvja+C4WZPYcIYRka6QLx7J84LsQKlwtsI3ZgVTyjdAh3nqFbIHvckqzYVDcRHBrm6bQXRiLkOQ+Bf0Ifa029MXBznWbabqhvAzyx0I1QtEePlii5o564XC44aho0SjyOc2A9ED6Uie5WLry9jdstDAz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fox9Mmt1xx2aM8uUn0o/+k77byhTKgyNYl8ns7Q7KbI=;
 b=VRJ8NsuQ1fHUa0xERFPAfRLukpZqqXNOnW8IP2Lpri8parWdCjZiea0whefWfuvGEDz2+rXqgVxang9VyDQCbDtGPNgbsuL15RFBKazvWQ2FemrW2+sujUQGmGx3wXXau6zvMA6tYpxJtDR8+ucrtxGKLMP48NcoHlLUIaWKjLXDByTJ9lKkP8NFOuDuWn6TAS7vbS0FEQeGNZpAbd78rojSR+9YVML//u/SX4R1MTOwi0ukiVQwM0Bml9rLuWBLxy0CSJufTgIoikiSrws1yd+NsoeQITTyr3ZwyT+kSFBJyP9YrOOjmloa6GNt2UOJ/Xht1d4NsVEuSJhnEqepRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 00:17:34 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 00:17:34 +0000
Message-ID: <1c1331ed-b951-2326-060c-966e908ba609@intel.com>
Date: Mon, 21 Nov 2022 16:17:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 4/6] drm/i915/gsc: Do a driver-FLR on unload if GSC was
 loaded
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-5-daniele.ceraolospurio@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221121231617.1110329-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0133.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::18) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA2PR11MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e0af2a-986f-4693-546c-08dacc1ef3b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LAIlIaRK6bSf7BUW8w3OC8SRXUCOFbkoXqL5Ii29Gj2mJZrQ/TmTyVij05KBt0cRt73ok2QoyoWF5QorOaUB14wFmd7f5ywg4TGDwzX4DGE4tfXVYNXqXm0aC1MrR0hBhZ1DXvx/nEk4i33CcxTOgRXVctCC+kjaV5Plk5URNBoelDu0kk1frHdlUgj3uKK2Od5o+4al1H5jRgsxMNQ8m/lkQLNcs3tuNOQLng2MIA0eSNh35Yv56FxAsKI4p9VgRJ7AbHXq4ZzGcqrUa4zKzGoRjYS27+fQQ/6vBYCZASH285ly9KQPjKtAcvLKYHnIP3IEqYf0eA2WflDy3wRk1O9kUAjyaq/pb1baYA2ImRJ16a5UhuIj1PFXCxB0VF4FAn4/2zNFth4DgO+sa37+0l43DMjyZd5iHkKweycYGMnzVO1gZU0zxIVwI0ZuaCD6A/iSM0djBVTe1Tc4ThI3UI8Jpu+skenzxRPwcDYq8Wu/8gE7rf6HITt+X8BR76EIxXsiXQ7bqQkcrAS+ivCfXztXDhcEsH7LOLh2SOw+169zKZ6bOLgzxUXZvHVXTZSoUTt5BcfmfgPUemZVVEmUKBprWIvT5xh63D9CR+7wL2HZ9niJCsz6zwaE4S2In5lr9Op3qNvVnUs25oJijFZ5Qjvr+fuINBw/NKsVajsYgCvScQFEAqturJTa1Tta5Hww9G3LGZjwpsZiCCQTKGFUNv1SziSLBfdpTftybSnK3fo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199015)(2906002)(31686004)(2616005)(6506007)(66946007)(66556008)(450100002)(41300700001)(36756003)(31696002)(86362001)(66476007)(82960400001)(6916009)(38100700002)(53546011)(4326008)(83380400001)(186003)(8936002)(8676002)(5660300002)(107886003)(6512007)(6666004)(6486002)(316002)(26005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEVvaVQvOXB0TVNZTVczUWxvYWJnSDhmei9HKy9JTDBQV3czamtmVVIxZlFR?=
 =?utf-8?B?eENFcEhDbmVUWGtOQWxXOWlpMlp6NUpmeWsxcUEwY3ZVOUtickZtWCsyM0Iz?=
 =?utf-8?B?cmVvRVlJZDVHM3U0QmhRb1hPZGQzaU9QN1J4UFJPSCtsWHMyQWpRbFFtMjFs?=
 =?utf-8?B?Z2tLVEJ5Y042QkdEZ1NlZTExNU9Wa1EzRThJSk9WQkgyeGFLWTNuYjNZL2Zh?=
 =?utf-8?B?M20zQUpmL21qWkUyS2pMWHZ3WXpyaDM2dXhPRndHbmp1bHRUY2wvVFlXNDEx?=
 =?utf-8?B?RW5XdXB2WGZQWTdqWDhsTGM2VUNLOTlDbXRnOW1yYkRrZFVRVGlFc2JuWTlm?=
 =?utf-8?B?SzM5b2ZNVTNNY3dUUzdpdXpYanA4bExyOUxlaE9pT1FsZ2k3NkY1bHlIMzJS?=
 =?utf-8?B?MlBpTFFkVTRuQUVUbWhjRENhbkhVT3ZjbGVtRnJ4OFp1b0MzYThqbkF6c3pu?=
 =?utf-8?B?d2p2UW0yaWYxMGRXK1kzSHQxM1BtR2RLYlBKNWlTQnBqWEl2YjNOVVBUR3pK?=
 =?utf-8?B?ZlRCRlU4aDF0ZnFjNjBkN09aK2hDVFdycDdHVGQ5UEtFbW0ycklyUkp4Q0ph?=
 =?utf-8?B?cDhERzlleFRQRWpyQnNKWHVBa1VDVjlhcHNWVWJMaDhBNVN6Vm43UHFqUnA1?=
 =?utf-8?B?UFRJWDc0dmI4UFFweDZnVEVhRklQLzY3cUE5cExqdW9uaDY4bzBXbXYzTWhD?=
 =?utf-8?B?eWZBeDVpQ01NSmlKUHBSaEZlRmhmbER4STA4b3krMXZIZTdBNTVjVnBmZmlR?=
 =?utf-8?B?OXF3em9COG1wRWRvWkMycG5NRXZabjUyQjlpU0JtVGJ2QWFiM3JhaDlvZENi?=
 =?utf-8?B?cUVYZ2tOOWJPaUpEK1NTZDFDb3FBdUZHMEtvVmV4SjN6V084aDdiWjh2MzYy?=
 =?utf-8?B?emNMMEtJRkZ2ZFA0SjRITlJTK3BKZEpMRExad1FqRGZ0aFpsR2FnK0lqTFM2?=
 =?utf-8?B?ZHlkc3ZydWIvUHV1UXFLSU5Wb3NaMlRabVp3LzI0NjVIWDN3Q2FpYmNQY1U4?=
 =?utf-8?B?UGdLb0xRRUtKMGtHZ0dkY0luMktpb01xYjIxWmxRUDVOWmNzNnFhMmFmMks4?=
 =?utf-8?B?TFgyalBQcWZ3Tnp2Q3R6S05qS0xNLy82Y2Z4Tys1NCtTbEtVQjZoMmpXQzVW?=
 =?utf-8?B?Nm5QZVVKeUJKa2VUM2VNRFB5T0lqZWdReWZqcW9RSDB1SVFYSDNoeGxMc0hB?=
 =?utf-8?B?YjBOcTZqa29ZL1dMV3hEc2dzbkhQUUlZQXNxOHEvb1M5RHRHZ0JCZjdkc2xF?=
 =?utf-8?B?QjczN1BUOHBlNUkwTHg4c1R2V0hwZTF1c2Q3bUxFcE5PbFA0UzYxYTRHVU9K?=
 =?utf-8?B?aExXSEhSbUtGdzhONjB5UW1UWUZWTEZjNnBTZ2UzdklhbHlhN3VET1h4K0NR?=
 =?utf-8?B?ckdSUi9VUjU5S3l3L3h0bWhVSG5PQTRmV3ljRFcyWEhOZXhSQ3p2eVlNaGVS?=
 =?utf-8?B?dVdaREtDWVlReGdxcXVtTEUwZ29tM3RIK0lpcVBiYkZ4N2tYbkNkU1A5eCs1?=
 =?utf-8?B?RVE5L0xuellVakdlbkFwb3FISmN0QVhrUHRaY1g2OXNZeUJiVTZzUGpRdWl0?=
 =?utf-8?B?ZGF5T0NNSWNhRTFubEFOZ1BMU1dBeTI1RjhZMjhvVWwyOFo0eEdjMzlwZmR4?=
 =?utf-8?B?SjAwR0ZWK0E0aWJnQW9MZ2M2MjBaM0JPWnV5YXRjMmJGZklpM0ZIR3Bwc1Uv?=
 =?utf-8?B?TExaTHU3KzJoK284bGdFY3FZNXkrZDNtNVNhcnpBbzYydXBlRWhiYVdiYnlD?=
 =?utf-8?B?U2NNeUFJVDV2Um9YWU9seTB3RGw4ajFJeTB3cnMvSUZBbjZ1ODFJcXFSNnJZ?=
 =?utf-8?B?WXBaRDNDa0dscnNhaVNSakcxQW01eGJXR3ZWODh2elFXQkxXa0ZGbTlwYkY5?=
 =?utf-8?B?K1hmWnI0cU9QeHhVM3ZQOE1JVE4wd2xzcG1DWFlVSkNKVXJjNXVRRWdSUDk3?=
 =?utf-8?B?S2haeFJ1Ui9zNjNQWFRZeFhuZEhKL2NQMGRGTC8zcGhXaVEwSDEvQzhnK1NU?=
 =?utf-8?B?Njk5YWNFSVU0OVl3ZytZOGNkR1B3OXloZVJFb2lGVjJBbER1YWp0SlNFcmNI?=
 =?utf-8?B?dVFGbWRyZCtHazNyaExLZWVUOUhDeWYrOVE4dFFLaVNaOWFJaHloektEM2sy?=
 =?utf-8?B?Wi8zQUVuUUdGOE5nK3R3M1AxSUdsb1BJOFdjU3ZXNHMzd2c3cUZ5THJtMUtN?=
 =?utf-8?Q?PuLiKemxTi3jvcVboxk2Bac=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e0af2a-986f-4693-546c-08dacc1ef3b2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 00:17:34.0372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7giBhuibr2V38HSJLTWNaUc0feYXV+vFQRyKUcdjCMi5flQlAXoFnE1uwAqszXPnU4AArWlP6Iw2L1Jer7mMjkMQA467qrvMAyMEO4CjEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/21/2022 3:16 PM, Daniele Ceraolo Spurio wrote:
> If the GSC was loaded, the only way to stop it during the driver unload
> flow is to do a driver-FLR.
> The driver-FLR is not the same as PCI config space FLR in that
> it doesn't reset the SGUnit and doesn't modify the PCI config
> space. Thus, it doesn't require a re-enumeration of the PCI BARs.
> However, the driver-FLR does cause a memory wipe of graphics memory
> on all discrete GPU platforms or a wipe limited to stolen memory
> on the integrated GPU platforms.
>
> We perform the FLR as the last action before releasing the MMIO bar, so
> that we don't have to care about the consequences of the reset on the
> unload flow.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c |  9 +++++
>   drivers/gpu/drm/i915/i915_reg.h           |  3 ++
>   drivers/gpu/drm/i915/intel_uncore.c       | 45 +++++++++++++++++++++++
>   drivers/gpu/drm/i915/intel_uncore.h       | 13 +++++++
>   4 files changed, 70 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index 510fb47193ec..5dad3c19c445 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -173,6 +173,15 @@ int intel_gsc_fw_upload(struct intel_gsc_uc *gsc)
>   	if (err)
>   		goto fail;
>   
> +	/*
> +	 * Once the GSC FW is loaded, the only way to kill it on driver unload
> +	 * is to do a driver FLR. Given this is a very disruptive action, we
> +	 * want to do it as the last action before releasing the access to the
> +	 * MMIO bar, which means we need to do it as part of the primary uncore
> +	 * cleanup.
> +	 */
> +	intel_uncore_set_flr_on_fini(&gt->i915->uncore);
> +
>   	/* FW is not fully operational until we enable SW proxy */
>   	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
>   
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 8e1892d14774..60e55245200b 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -118,6 +118,9 @@
>   
>   #define GU_CNTL				_MMIO(0x101010)
>   #define   LMEM_INIT			REG_BIT(7)
> +#define   DRIVERFLR			REG_BIT(31)
> +#define GU_DEBUG			_MMIO(0x101018)
> +#define   DRIVERFLR_STATUS		REG_BIT(31)
>   
>   #define GEN6_STOLEN_RESERVED		_MMIO(0x1082C0)
>   #define GEN6_STOLEN_RESERVED_ADDR_MASK	(0xFFF << 20)
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 8006a6c61466..c1befa33ff59 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2703,6 +2703,48 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>   	}
>   }
>   
> +static void driver_flr(struct intel_uncore *uncore)
> +{
> +	struct drm_i915_private *i915 = uncore->i915;
> +	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
> +	int ret;
> +
> +	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
> +
> +	/*
> +	 * Make sure any pending FLR requests have cleared by waiting for the
> +	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
> +	 * to make sure it's not still set from a prior attempt (it's a write to
> +	 * clear bit).
> +	 * Note that we should never be in a situation where a previous attempt
> +	 * is still pending (unless the HW is totally dead), but better to be
> +	 * safe in case something unexpected happens
> +	 */
> +	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
> +	if (ret) {
> +		drm_err(&i915->drm,
> +			"Failed to wait for Driver-FLR bit to clear! %d\n",
> +			ret);
> +		return;
> +	}
> +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> +
> +	/* Trigger the actual Driver-FLR */
> +	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
> +
> +	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
> +					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
> +					 flr_timeout_ms);
> +	if (ret) {
> +		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> +
> +	return;
> +}
> +
>   /* Called via drm-managed action */
>   void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
>   {
> @@ -2716,6 +2758,9 @@ void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
>   		intel_uncore_fw_domains_fini(uncore);
>   		iosf_mbi_punit_release();
>   	}
> +
> +	if (intel_uncore_needs_flr_on_fini(uncore))
> +		driver_flr(uncore);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index 5449146a0624..a9fa0b11e7e4 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -153,6 +153,7 @@ struct intel_uncore {
>   #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
>   #define UNCORE_HAS_DBG_UNCLAIMED	BIT(2)
>   #define UNCORE_HAS_FIFO			BIT(3)
> +#define UNCORE_NEEDS_FLR_ON_FINI	BIT(3)

Dumb mistake, this should be 4 (and that's why the series is failing on 
older gens that don't support the driver FLR). Will wait for comments 
before re-spinning.

Daniele

>   
>   	const struct intel_forcewake_range *fw_domains_table;
>   	unsigned int fw_domains_table_entries;
> @@ -223,6 +224,18 @@ intel_uncore_has_fifo(const struct intel_uncore *uncore)
>   	return uncore->flags & UNCORE_HAS_FIFO;
>   }
>   
> +static inline bool
> +intel_uncore_needs_flr_on_fini(const struct intel_uncore *uncore)
> +{
> +	return uncore->flags & UNCORE_NEEDS_FLR_ON_FINI;
> +}
> +
> +static inline bool
> +intel_uncore_set_flr_on_fini(struct intel_uncore *uncore)
> +{
> +	return uncore->flags |= UNCORE_NEEDS_FLR_ON_FINI;
> +}
> +
>   void intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915);
>   void intel_uncore_init_early(struct intel_uncore *uncore,
>   			     struct intel_gt *gt);

