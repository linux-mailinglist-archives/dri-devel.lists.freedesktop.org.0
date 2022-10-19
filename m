Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5061660373A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 02:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B7C10EA10;
	Wed, 19 Oct 2022 00:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA70510E060;
 Wed, 19 Oct 2022 00:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666140284; x=1697676284;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9MEFb2KWaqsJRdbDkaPOkWBs8pic6UDsSLWGoP5+h5I=;
 b=aKF9W62MJ1/gjr7HvzqPK/SPp21bp2AOuq/7RTzCa/O7/pfMZkUoI3Kp
 G8hJAhd1KCMjF7Xq0O0faF5Bn/HGhuorv83IaBmPMLcFHe2K2uikd7fDc
 ultMBC5baRe0KtOT/SQ/EdCD1ql3zhUGwO6aPQfIvvkwbS1cxceFpDNKJ
 EKR3EUiYGIWc0iGKHC/XxaBkECdYFJikJYBLBaasBm4b8R+36SSyNcHwY
 +ZBNlOUiY91yxfqLvaG7fi7pOG9FTbItiDHGY+Dzv080buevQjmF6keOY
 umEIvQg7QBWrYTbpw3cA5LztE1R0UY7zAuklxhV01InYYqlW3b9dKJIMM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="392574020"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="392574020"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 17:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="606823304"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="606823304"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 18 Oct 2022 17:44:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 17:44:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 17:44:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 17:44:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 17:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMUDQDGdQBZ4nzarBZz9K6DaYnTIOTspkYIRnjGtq8TWvmATK4xckPac6ATcCL+XFftTev0J9WYtbOGi6vnPdjDJTfV0Epo8HbstY4HgLiBRUigpQeeyy2cHPSh0Rmb83rJyhaLZ9kTD3KPszqBrxolszgddWP5vIHl+P2Gu39yPGShwqXV0Oqtw4DDvpK8t9pPwl6P7N0GNkvnbr0KCZ7ZgXckjMfsTYQE0FbEugnArGGgjhcW3IQjX8d7DeHXpwrT/uY+XodLiPi09puBchUKCCiI3eu+PGdewidPlS6pNYf63Cy2KwPGpotkc1p2vLHscPyWDDJla+PiwkvtDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHZhI4pRt1numA8GqcyZEsq+9O9wZOCoZ5rQVMO7T+I=;
 b=aZvv8nXhA+JY+Xc9BL0nutkM/6t8qGA4ldRCNTkNS/x16s0GoCmM12NexOImYMZoFCOjBwjTuvw9Ft1jOgjY+s0NWSUrd2ySuR4EWe8mOXz/qy4ul/hjamqBqgZfiQ5JTKNXym7YElu4DvvpJgjvvFzeY0hQ4wX7C7DEFvXQ+hkzdu1zBueeB5h3iMwdqs7P09YKp+SvcWoc1n8shGmaae7u1pKcVGoqpjyTkvB0+HjSlh6xoAJ/V99NQv3JVrACUHv4HMfW54iO1+XKaP6D6xgIVrwlDkBqQ0Fjm9gzRsQXJkhOZv+mdvfgIhun5zuVL6c/EYh74pcluKuvJOzBlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB4596.namprd11.prod.outlook.com (2603:10b6:5:2a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 00:44:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 00:44:40 +0000
Message-ID: <bd37abdb-a9af-3f30-17ed-7a13a9652389@intel.com>
Date: Tue, 18 Oct 2022 17:44:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.3
Subject: Re: [PATCH v2 5/7] drm/i915/mtl: Handle wopcm per-GT and limit
 calculations.
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
 <20221013000332.1738078-6-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221013000332.1738078-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM6PR11MB4596:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c242fd-985b-46dc-b4e3-08dab16b1b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UOnLmSvCPdytHY3aRepcVXjD553AKejsFT8ECqIDAVy7+OgInJasWuqI5Z1QXSh88sSbcj9qqZZWvm8gp1/rNyWXNnlqnhI4ulTiQbCIi4sQ+lLYsjpWrnJ1Bm90NCT+1hSjQmad/zi5/AxI9EMhGZFbEr/GU3VPxCnhSroI6QDDdrmUucvMcACMkpirPtRNTvV2zfNq1aF5L36mRviGSJ0qQs8iFlbg92gh0DyEP7qcYI4pQJwkmdw81yPIkNHcehbhzHeaS/FNb0z3OxPEQKtkPvkxwKk8GUlJrQoj6vdxbXBaEyr2VJ4Zr5yibHRokk2OHE6CCpi8zbCRAj4u84yjeyi44VuFxbG4P21S1twArcn0fylPYbnm2AoPGxGDMySabR+vaA4L4XSy8fToowxXdpQvGyRByJSFhBPkPlPFIjV9RVOcRNbyGrS56gwhFTG3Ozs1rP6vl9Kav8smSX6G1kk394SR8OVe2IpGKw+FxFt3XeLjMutApam3lbNKhJnsbmetgj8MpUfd03DqTd5/k8xo2BCP3Qka6EhKr7KwfmOwmPRI40UYmGGCHXIYVnkBZLQy7ZAsX2NMGqlKXJKhmFY8tKSBrT1S8+l03bFT3UddE0r4oopV8TJYL3PFryySHoTocIqYLlnLmSzcv1S6KzbAnJTLvf8sXd2gD4AkUwE5FfUC2URJYWU7nwkUte/6UrQ7j3t007Dg+9aat3NdnfdljzSu6ExS2MjKaFmnGNfMoplSYREDjae+6yMpbVZae3HMxB0S/8Pvg/icGlhl4ZRJ8MYjRXC3mpGteNE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(36756003)(66899015)(31686004)(86362001)(31696002)(38100700002)(30864003)(2906002)(5660300002)(82960400001)(2616005)(186003)(6486002)(83380400001)(6506007)(316002)(6512007)(41300700001)(26005)(66946007)(54906003)(66476007)(66556008)(53546011)(8936002)(478600001)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U01iS2Vna2I0WEZGYkdPK25iYS92dTB6K01QRmVaTmVZVFVkREhDNDhHSFZm?=
 =?utf-8?B?dFFlK09ocWlWMnMyZEM5RGpaaWFFemNRc3N2T3FReHAyNzlFU1diblpKQUZS?=
 =?utf-8?B?a0pycDJ6U2pYa3VZYlY3dzlCVWxqSEZWSWpYb2xsLzJqN21FOWp1MndkM1VF?=
 =?utf-8?B?YmJKYnowTC9Ia0VVL0p2K0orUVkweVpnYkVqWlFSc2N1QVdNVUp6azlCWUpS?=
 =?utf-8?B?cStrSCszUlFjbzQ3MFE1RnhoS05xa3hienA4ckdQamI2YkRpamlRSUsrS29P?=
 =?utf-8?B?Q2RnODM0REdyZzZkVFlkVEREbXQyWUZyQys0cCswOTBOY0g4cVpHQ0ZISmNF?=
 =?utf-8?B?MFkxZWNyL2dUbkpVeThqdVVuakdiZWQ0TFNuTUsxWVBqVW9HTnRBUnhrMWtJ?=
 =?utf-8?B?UENtVkVvTG5MbVNxMGFJWXBGWWw0MDgzM090N3UwRCtRbkdFVXEySk5hbG1G?=
 =?utf-8?B?YnVWYjBOUkJEcy9uUk5kWThMMlRhTm9WNkhNYlNzbEdwQkl4MjRXMGhRZkp4?=
 =?utf-8?B?T2dnSTl4ekJVdEd4K3RZY2JJa1duZnh1Y2dGaEIzZy8zUmRIa01hNVFWRTZt?=
 =?utf-8?B?c0wxMXd5Wnl1UXVrRjdlNEp1WXMwQ3hFTkZlcXU0L2p2UFBQc3F6SEFqNU5J?=
 =?utf-8?B?REIzaTVnTzNFTnc4SGd6WEJEb2NlZENJVDdMQWZGcklmejJiTWZkOFdYcXdQ?=
 =?utf-8?B?QkgwTUdSekY0RHpLN21Yd3JSaDB6MjBuRjNoKyt2M2RNYnBXTWV2ZjVkZ1lQ?=
 =?utf-8?B?Tk5jKzdIcnJ6OXJKd3FPOUpRWUlpVTMvdUppbHB2cDJ0bXI3YWlzUUxwcDZH?=
 =?utf-8?B?Y0RGRUZ2aTVocnBCSzdqMmk5YjFtdFVIVmtDbktuSVE1N0c3WUZGeDk2RVZo?=
 =?utf-8?B?NlA4Nmp2MUpid3JxSUVURDR6UHNPc0JjdWwwS1NPM2lEb1V5aGZ1dHVhMzE0?=
 =?utf-8?B?dVNSczhUU2p5d1NWU1E5OTF6RGhBZU1MNXRCS0FaZEpLcndORHJGeTc1TFJL?=
 =?utf-8?B?ZjQzNmFPNEZiMlFhMy8vRDY2SFFxT1Y3SXdyaW1STGZxLzRDb2tCZS9EcVlO?=
 =?utf-8?B?MzFrYzAzL0d6Sm84N0lRU3lhak9wUTJ4NVV3NGY4eGppZjFkOHcxRzZDTHhs?=
 =?utf-8?B?OUZBb3pYMnNnRGRaU1hKeWhTVWEzaEFyMElLZjV4NTFLV05KUUpUMUpueUhT?=
 =?utf-8?B?K3doNkFmVVZSMU13V1NxYUR5TzcwRGp3Rm1vSVRXRW5HMmZ2eldWWXZkN1U3?=
 =?utf-8?B?QSttZUkxblIxL1d0SFJpdUVrOGRlQ3NobGFDdmxldW1ZK25raXRiWStBSUhm?=
 =?utf-8?B?NEs2eW4zOEhMbHF1TUg1UVB3cnZWUWZqWmtRWDVlcnhQWHBoY2ZxMTFsN2FS?=
 =?utf-8?B?RysvQ2E3dDNxVmhSbUo0bytxcE52M1ZmSDUxTmR5Z3BuSFc0UWJ5NEFQaGNv?=
 =?utf-8?B?YmIvakUvVW9CaEdEYnlsSmZtV3V2TlBFRWlTVXNZWHpMdktJWEVTejRNbFpl?=
 =?utf-8?B?VDh5eE9OdCtlclhpekZtRVZyMjhJN2hqa3hSRnQ1TGZsaWJqbDU1em9jNmgx?=
 =?utf-8?B?TWJjSXd3UHIxb2U1dk1JNElUU2VOYlZVYjc0Y3JuWUhlRUgyZ2FyY2tXaGRi?=
 =?utf-8?B?dmtZSk00dUlWeTVPTWRqeVZQNGM1WlR4WFEvZUh5U0FBTE1TaGZEcFUrVTFC?=
 =?utf-8?B?WHFPQ3lNR213WUdpeGVta0RrS25iQTliSk1sYUkrMWFIYjdnbFNDQVpOZ2xK?=
 =?utf-8?B?UHhycUVwZkNZaVJ0Uk5nL1F3RkV6dHVVUVZIRWNQQytyNm96S2U1KzVBRkk2?=
 =?utf-8?B?dFRycFc2bWw0amJLbnVrc2JqMUg3V0VWMkVyOE9ERktOUlZBdXRzUVJyTEhZ?=
 =?utf-8?B?bDNXVWIyalRJQWxhc3EvTm04dnBPM2N3UVpoa2R3RHBmb2VadjNSemZoOGxa?=
 =?utf-8?B?SzlMUGpHeCtLRGhROTVxaTUwZ0FLKzdDVG5WbHR2eG5KR0RqV2tHdnJQZE5n?=
 =?utf-8?B?Z3E4MTREQlVEcFNHQUVCWHBOSmVFV3piZ3Nubk8zVEgraDNYRFFzWHZnbGo1?=
 =?utf-8?B?SE04UG1adjNHRUM5RDFISU9mcHBMTitOaXRHUkg1SGliKyswVjMyd3NqYm5T?=
 =?utf-8?B?OWt0UUovUndOOWppYjc3MGJMc0ZxL0xzRi9FVTA2eDZHQ0Zva2VXOURUU2hQ?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c242fd-985b-46dc-b4e3-08dab16b1b77
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:44:40.7887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFDUJ76IT2X/P8PNv9FYsyxPdyrdqP8ZfD7bZ3Ei/86uJ6gahDw7It3T2HBQGO0lmZb2L0DW2i32PQwsc4je2psmW7u5z0sBAa8olUHqih8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4596
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Alan
 Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/12/2022 17:03, Daniele Ceraolo Spurio wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>
> With MTL standalone media architecture the wopcm layout has changed with
> separate partitioning in WOPCM for GCD/GT GuC and SA Media GuC. The size
What is GCD?

> of WOPCM is 4MB with lower 2MB for SA Media and upper 2MB for GCD/GT.
>
>      +=====+===> +====================+ <== WOPCM TOP
>      ^     ^     |                    |
>      |     |     |                    |
>      |    GCD    |   GCD RC6 Image    |
>      |    GuC    |    Power Context   |
>      |    WOPCM  |                    |
>      |    Size   +--------------------+
>      |     |     |   GCD GuC Image    |
>      |     |     |                    |
>      |     v     |                    |
>      |     +===> +====================+ <== SA Media GuC WOPCM Top
>      |     ^     |                    |
>      |   SA Media|                    |
>      |    GuC    | SA Media RC6 Image |
>      |   WOPCM   |    Power Context   |
>      |    Size   |                    |
>    WOPCM   |     +--------------------+
>      |     |     |                    |
>      |     |     | SA Media GuC Image |
>      |     v     |                    |
>      |     +===> +====================+ <== GuC WOPCM base
>      |           |     WOPCM RSVD     |
>      |           +------------------- + <== HuC Firmware Top
>      v           |      HuC FW        |
>      +=========> +====================+ <== WOPCM Base
>
> Given that MTL has GuC deprivilege, the WOPCM registers are pre-locked
> by the bios. Therefore, we can skip all the math for the partitioning
> and just limit ourselves to sanity checking the values.
>
> v2: fix makefile file ordering (Jani)
>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile               |  5 ++-
>   drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 48 +++++++++++++++------
>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 14 +++---
>   drivers/gpu/drm/i915/i915_driver.c          |  2 -
>   drivers/gpu/drm/i915/i915_drv.h             |  3 --
>   drivers/gpu/drm/i915/i915_gem.c             |  5 ++-
>   11 files changed, 55 insertions(+), 31 deletions(-)
>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (86%)
>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index f8cc1eb52626..4101b3507346 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -127,9 +127,11 @@ gt-y += \
>   	gt/intel_sseu.o \
>   	gt/intel_sseu_debugfs.o \
>   	gt/intel_timeline.o \
> +	gt/intel_wopcm.o \
>   	gt/intel_workarounds.o \
>   	gt/shmem_utils.o \
>   	gt/sysfs_engines.o
> +
>   # x86 intel-gtt module support
>   gt-$(CONFIG_X86) += gt/intel_ggtt_gmch.o
>   # autogenerated null render state
> @@ -183,8 +185,7 @@ i915-y += \
>   	  i915_trace_points.o \
>   	  i915_ttm_buddy_manager.o \
>   	  i915_vma.o \
> -	  i915_vma_resource.o \
> -	  intel_wopcm.o
> +	  i915_vma_resource.o
>   
>   # general-purpose microcontroller (GuC) support
>   i915-y += gt/uc/intel_uc.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 5c67e49aacf6..b30560ab1c1b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -560,7 +560,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>   	 * why.
>   	 */
>   	ggtt->pin_bias = max_t(u32, I915_GTT_PAGE_SIZE,
> -			       intel_wopcm_guc_size(&ggtt->vm.i915->wopcm));
> +			       intel_wopcm_guc_size(&ggtt->vm.gt->wopcm));
>   
>   	ret = intel_vgt_balloon(ggtt);
>   	if (ret)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index b367cfff48d5..a95eb0b656d2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -56,6 +56,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>   	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>   	intel_gt_pm_init_early(gt);
>   
> +	intel_wopcm_init_early(&gt->wopcm);
>   	intel_uc_init_early(&gt->uc);
>   	intel_rps_init_early(&gt->rps);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 30003d68fd51..a23cd3af5bf2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -30,6 +30,7 @@
>   #include "intel_migrate_types.h"
>   #include "intel_wakeref.h"
>   #include "pxp/intel_pxp_types.h"
> +#include "intel_wopcm.h"
>   
>   struct drm_i915_private;
>   struct i915_ggtt;
> @@ -98,6 +99,7 @@ struct intel_gt {
>   
>   	struct intel_uc uc;
>   	struct intel_gsc gsc;
> +	struct intel_wopcm wopcm;
>   
>   	struct {
>   		/* Serialize global tlb invalidations */
> diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/gt/intel_wopcm.c
> similarity index 86%
> rename from drivers/gpu/drm/i915/intel_wopcm.c
> rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
> index 322fb9eeb880..487fbbbdf3d6 100644
> --- a/drivers/gpu/drm/i915/intel_wopcm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
> @@ -43,6 +43,7 @@
>   /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
>   #define GEN11_WOPCM_SIZE		SZ_2M
>   #define GEN9_WOPCM_SIZE			SZ_1M
> +#define XELPM_SAMEDIA_WOPCM_SIZE	SZ_2M
XELPM? Isn't it just XELP?

>   #define MAX_WOPCM_SIZE			SZ_8M
>   /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
>   #define WOPCM_RESERVED_SIZE		SZ_16K
> @@ -64,9 +65,9 @@
>   #define GEN9_GUC_FW_RESERVED	SZ_128K
>   #define GEN9_GUC_WOPCM_OFFSET	(GUC_WOPCM_RESERVED + GEN9_GUC_FW_RESERVED)
>   
> -static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
> +static inline struct intel_gt *wopcm_to_gt(struct intel_wopcm *wopcm)
>   {
> -	return container_of(wopcm, struct drm_i915_private, wopcm);
> +	return container_of(wopcm, struct intel_gt, wopcm);
>   }
>   
>   /**
> @@ -77,7 +78,8 @@ static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
>    */
>   void intel_wopcm_init_early(struct intel_wopcm *wopcm)
>   {
> -	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
> +	struct intel_gt *gt = wopcm_to_gt(wopcm);
> +	struct drm_i915_private *i915 = gt->i915;
>   
>   	if (!HAS_GT_UC(i915))
>   		return;
> @@ -157,14 +159,18 @@ static bool check_hw_restrictions(struct drm_i915_private *i915,
>   	return true;
>   }
>   
> -static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
> +static bool __check_layout(struct intel_gt *gt, u32 wopcm_size,
>   			   u32 guc_wopcm_base, u32 guc_wopcm_size,
>   			   u32 guc_fw_size, u32 huc_fw_size)
>   {
> +	struct drm_i915_private *i915 = gt->i915;
>   	const u32 ctx_rsvd = context_reserved_size(i915);
>   	u32 size;
>   
>   	size = wopcm_size - ctx_rsvd;
> +	if (MEDIA_VER(i915) >= 13)
> +		size += XELPM_SAMEDIA_WOPCM_SIZE;
This should check VDBOX_MASK as well?

> +
>   	if (unlikely(range_overflows(guc_wopcm_base, guc_wopcm_size, size))) {
>   		drm_err(&i915->drm,
>   			"WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
> @@ -181,12 +187,14 @@ static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
>   		return false;
>   	}
>   
> -	size = huc_fw_size + WOPCM_RESERVED_SIZE;
> -	if (unlikely(guc_wopcm_base < size)) {
> -		drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
> -			intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
> -			guc_wopcm_base / SZ_1K, size / SZ_1K);
> -		return false;
> +	if (VDBOX_MASK(gt)) {
Should this not check for VEBOX as well? Or is it guaranteed that you 
can't have VECS without VCS?

> +		size = huc_fw_size + WOPCM_RESERVED_SIZE;
> +		if (unlikely(guc_wopcm_base < size)) {
> +			drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
> +				intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
> +				guc_wopcm_base / SZ_1K, size / SZ_1K);
> +			return false;
> +		}
>   	}
>   
>   	return check_hw_restrictions(i915, guc_wopcm_base, guc_wopcm_size,
> @@ -228,8 +236,8 @@ static bool __wopcm_regs_writable(struct intel_uncore *uncore)
>    */
>   void intel_wopcm_init(struct intel_wopcm *wopcm)
>   {
> -	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
> -	struct intel_gt *gt = to_gt(i915);
> +	struct intel_gt *gt = wopcm_to_gt(wopcm);
> +	struct drm_i915_private *i915 = gt->i915;
>   	u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
>   	u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
>   	u32 ctx_rsvd = context_reserved_size(i915);
> @@ -274,6 +282,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>   		goto check;
>   	}
>   
> +	/*
> +	 * On platforms with a media GT, the WOPCM is partitioned between the
> +	 * two GTs, so we would have to take that into account when doing the
> +	 * math below. There is also a new section reserved for the GSC ctx
ctx -> context - should not use such abbreviations in comments. It's 
unnecessary and makes the text harder to read.
> +	 * that w would have to factor in. However, all platforms with a media
that w would have to fact in -> that would have to be factored in

> +	 * GT also have GuC depriv enabled, so the WOPCM regs are pre-locked
> +	 * and therefore we don't have to do the math ourselves.
> +	 */
> +	if (unlikely(i915->media_gt)) {
> +		drm_err(&i915->drm, "Unlocked WOPCM regs with media GT\n");
> +		return;
> +	}
> +
>   	/*
>   	 * Aligned value of guc_wopcm_base will determine available WOPCM space
>   	 * for HuC firmware and mandatory reserved area.
> @@ -289,13 +310,14 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>   
>   	/* Aligned remainings of usable WOPCM space can be assigned to GuC. */
>   	guc_wopcm_size = wopcm_size - ctx_rsvd - guc_wopcm_base;
> +
Extra blank link part way through calculating the guc_wopcm_size 
variable because?

John.

>   	guc_wopcm_size &= GUC_WOPCM_SIZE_MASK;
>   
>   	drm_dbg(&i915->drm, "Calculated GuC WOPCM [%uK, %uK)\n",
>   		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>   
>   check:
> -	if (__check_layout(i915, wopcm_size, guc_wopcm_base, guc_wopcm_size,
> +	if (__check_layout(gt, wopcm_size, guc_wopcm_base, guc_wopcm_size,
>   			   guc_fw_size, huc_fw_size)) {
>   		wopcm->guc.base = guc_wopcm_base;
>   		wopcm->guc.size = guc_wopcm_size;
> diff --git a/drivers/gpu/drm/i915/intel_wopcm.h b/drivers/gpu/drm/i915/gt/intel_wopcm.h
> similarity index 100%
> rename from drivers/gpu/drm/i915/intel_wopcm.h
> rename to drivers/gpu/drm/i915/gt/intel_wopcm.h
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index dbd048b77e19..4cd8a787f9e5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -357,8 +357,8 @@ static int uc_init_wopcm(struct intel_uc *uc)
>   {
>   	struct intel_gt *gt = uc_to_gt(uc);
>   	struct intel_uncore *uncore = gt->uncore;
> -	u32 base = intel_wopcm_guc_base(&gt->i915->wopcm);
> -	u32 size = intel_wopcm_guc_size(&gt->i915->wopcm);
> +	u32 base = intel_wopcm_guc_base(&gt->wopcm);
> +	u32 size = intel_wopcm_guc_size(&gt->wopcm);
>   	u32 huc_agent = intel_uc_uses_huc(uc) ? HUC_LOADING_AGENT_GUC : 0;
>   	u32 mask;
>   	int err;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 021290a26195..57eaece6dada 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -478,10 +478,11 @@ static int check_gsc_manifest(const struct firmware *fw,
>   	return 0;
>   }
>   
> -static int check_ccs_header(struct drm_i915_private *i915,
> +static int check_ccs_header(struct intel_gt *gt,
>   			    const struct firmware *fw,
>   			    struct intel_uc_fw *uc_fw)
>   {
> +	struct drm_i915_private *i915 = gt->i915;
>   	struct uc_css_header *css;
>   	size_t size;
>   
> @@ -523,10 +524,10 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   
>   	/* Sanity check whether this fw is not larger than whole WOPCM memory */
>   	size = __intel_uc_fw_get_upload_size(uc_fw);
> -	if (unlikely(size >= i915->wopcm.size)) {
> +	if (unlikely(size >= gt->wopcm.size)) {
>   		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > %zu\n",
>   			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			 size, (size_t)i915->wopcm.size);
> +			 size, (size_t)gt->wopcm.size);
>   		return -E2BIG;
>   	}
>   
> @@ -554,7 +555,8 @@ static int check_ccs_header(struct drm_i915_private *i915,
>    */
>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   {
> -	struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
> +	struct drm_i915_private *i915 = gt->i915;
>   	struct intel_uc_fw_file file_ideal;
>   	struct device *dev = i915->drm.dev;
>   	struct drm_i915_gem_object *obj;
> @@ -562,7 +564,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	bool old_ver = false;
>   	int err;
>   
> -	GEM_BUG_ON(!i915->wopcm.size);
> +	GEM_BUG_ON(!gt->wopcm.size);
>   	GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
>   
>   	err = i915_inject_probe_error(i915, -ENXIO);
> @@ -615,7 +617,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (uc_fw->loaded_via_gsc)
>   		err = check_gsc_manifest(fw, uc_fw);
>   	else
> -		err = check_ccs_header(i915, fw, uc_fw);
> +		err = check_ccs_header(gt, fw, uc_fw);
>   	if (err)
>   		goto fail;
>   
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 24d3d2d85fd5..4ebb4ef982e2 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -370,8 +370,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		goto err_ttm;
>   
> -	intel_wopcm_init_early(&dev_priv->wopcm);
> -
>   	ret = intel_root_gt_init_early(dev_priv);
>   	if (ret < 0)
>   		goto err_rootgt;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 90a347140e90..24cffe4f9840 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -62,7 +62,6 @@
>   #include "intel_runtime_pm.h"
>   #include "intel_step.h"
>   #include "intel_uncore.h"
> -#include "intel_wopcm.h"
>   
>   struct drm_i915_clock_gating_funcs;
>   struct drm_i915_gem_object;
> @@ -235,8 +234,6 @@ struct drm_i915_private {
>   
>   	struct intel_gvt *gvt;
>   
> -	struct intel_wopcm wopcm;
> -
>   	struct pci_dev *bridge_dev;
>   
>   	struct rb_root uabi_engines;
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 9093d2be9e1c..7a9ce81600a0 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1140,9 +1140,10 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		return ret;
>   
> -	for_each_gt(gt, dev_priv, i)
> +	for_each_gt(gt, dev_priv, i) {
>   		intel_uc_fetch_firmwares(&gt->uc);
> -	intel_wopcm_init(&dev_priv->wopcm);
> +		intel_wopcm_init(&gt->wopcm);
> +	}
>   
>   	ret = i915_init_ggtt(dev_priv);
>   	if (ret) {

