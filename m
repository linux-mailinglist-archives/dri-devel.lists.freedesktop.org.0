Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B57E6654
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9640010E1F8;
	Thu,  9 Nov 2023 09:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8A610E1F8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699521063; x=1731057063;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uNe0UXyDuTHqxoavYeUD1tb43Fy0bAX66xe3gnZ5Gik=;
 b=JodlerlDK8LtCYgQ7+Mz71+faMWK65jEmJNl3cAZcU+gWDszAjhqiovO
 1472iYbw15/qEDllVgWsZ2ynBjlHXmGSF0wfDtaR2JePz6t/Y0R/lXl6j
 XEXFdTwcPsz8A66TQlovEkmFMt8ce8Xhju2FOk8vfwlLge7t4ZJ/ACfy6
 HhIj11uIiqFEFVfCFzs8jxQLpu3XK5Qnm+93K2ikxNLQ1PtsV+vqZg3L4
 WKzetvU0lC8aoy2hpsfHl2WBQWlFek6H0daH5grskm6ee38DV39JV7/N7
 s1r4t0ldUedsar7VnVmOr1bTs5OXGAs8i2SRCxtk0ALiu+fzevHPtk+J7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="421047100"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="421047100"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 01:11:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="763350662"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="763350662"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 01:11:02 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 01:11:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 01:11:01 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 01:11:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 01:11:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBgC1IDUGnpjQOahOL+pZPlp00MXwBwYROheT5BNvXiuoHDqaSgwSL7CaC01ubZNFNO0yy9QObjnUUEpkl1Ewl1q37YPFVXCTMscIqHc7PyiNO8KIOZvxiiXzMefHhHzYQr5do3NvIFQG6k8s7rHSn7rgMm7o67ihdD00R2upGGdqJspI9YzVx7UbFYz8KO/vqZQoqb1Hf8MyKWh5sAg6Xhxc0B4WpoB0XOqaJacrsmaXKa0l92jH+vzkV1lHDXTA3XUIVEiJcjV74ikVYXHLaHZpEmqJpnfZ6EhE5iTMvrgBcWcu1jPQQaW2NWHoAh1KMWfaAs2zvoMHIaq8ji+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp1h2GuXxGOuaik29S8ibG8JDfNMHl+ghc/HKWOB5EA=;
 b=d0AQb40oYBo6OtH0DgzgTBrwjM9ByXWVtKLWyuiZll3syQVmZGu7CTQebNHfA9KT8IrOhqve/DWVCprzqTh5rv1ELYR5Ov4ARVRepuq/SBo8m6ulp6fFxAp5K7eelgJP9e93SsE5NALPOzlSfUsNFEaE+iqy4GEVdcs0+sD1lGLIz6znKbr/R3U9RUDqhP7oMWwUcJ+JVw9S9nizZroi5VP/WivMGKGDGzPs+IAUDF44PXzqdEvm3rildAKtuWAPq8HrZDykhcyPLDv9MVlN0dinzleuBznKE6gLzW8+MhtMOTRYjwYw9jVQrKh8nrj74xH/b0kJ0Oe3Mmdm1m3xew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 09:10:59 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::5fe4:5d4e:d75f:23eb]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::5fe4:5d4e:d75f:23eb%6]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 09:10:59 +0000
Message-ID: <5fbee130-d57b-4c21-b37a-06751ef9aa67@intel.com>
Date: Thu, 9 Nov 2023 10:10:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] drm/ttm/tests: Add tests with mock resource
 managers
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>
References: <cover.1699445194.git.karolina.stolarek@intel.com>
 <3808f7b82c63343eb228a849c963afd163fed18c.1699445194.git.karolina.stolarek@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3808f7b82c63343eb228a849c963afd163fed18c.1699445194.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|PH0PR11MB4775:EE_
X-MS-Office365-Filtering-Correlation-Id: 90848366-b0d7-42c7-dc63-08dbe103ca06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ujd79Pcz794p85sem46XeMeNbaosh4dFIwcg68d7vZo6fz+UgDsG7JNi5avKNmUmUvUTghWqzs2B37rbt4cNz5aqXLqLBnY34uc81YcON/Jx5sliaZHNymJOrA+1PLYUnFXwzbkrr2Z3Jayn9d0cZ+SgrzLNOxkq26yMIksFdO7mzZumTbDfIU+SLsJzWifbKszELPLj0Pird2r4NaHein3CSOZPkqsfoM9s9HSYxeIwtgO28Az28kgzKRTQUBFR8RhH6lsewGm1p/6qDAo9mG/DbaTlsJgY85BMigk1JSs3BJBLr6Z+7wd7DCnboLgY/kz4sfCor7Hgs01c1EfNdyRIYxv4d3cNOr3mH0PVMnM7WPfj4nFB+A4yEONVUV7lcNrTNdnOZK2V70OJvoFtrqAq37Xs0KDmQ95Tb8Fd7bloePWQpprpeeqIXWXE00xNHpszXVE5H6u3BeYVTAZZ29BnivgxWY5MsOvHqoNvjRz24Sg7AbQ5P55mykoX5LxWcUg48mK/IVryj5tzbHIdX6FIsSerJe3LwPQ1/9hFhnHKConztO5rz074RFFos/0MAAuxL2PUbUTfreTHM2Pxzn9Q2i8O2tCrJpBgz+8NECmn5aJnPfh5mq+4Rj+BVT4RMl82HboJnTnrVW0ckPaj6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(366004)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2616005)(6486002)(26005)(8676002)(4326008)(8936002)(6666004)(6506007)(6512007)(478600001)(36916002)(31686004)(53546011)(6916009)(83380400001)(66556008)(66946007)(54906003)(316002)(66476007)(38100700002)(5660300002)(4744005)(86362001)(31696002)(82960400001)(44832011)(36756003)(2906002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckZiMm9sL0daNFBBMFAwcm8vNFMreDdpcWFqK2xzY1doYzlKMmhvM1dlVlkz?=
 =?utf-8?B?YnhsUnFnY21zSDlSTXVCclJpTk9NcjJpQWEyU0dMb2Rhakdxb01HblcxS0xa?=
 =?utf-8?B?WUQ1OWRtNXdOSGlYVXNldXZzZEQxeThhNzBhcHIxbGtWRURJWm9BODRKSWlR?=
 =?utf-8?B?Vk5LdHhTNmNLZlJrV0hJVFJWUlI5VjdCTXBHMWFvemF5SG9mV2RlSjhKZFR4?=
 =?utf-8?B?WFdlTFZKWHFTNDk4emZUNldSNlRLcHJtOUdmemxTNm11UU1tTUZ3aHVTc2U1?=
 =?utf-8?B?QzBJcEEvZi9iLzlabFJ4WlV6cTlZRzBuUlBGck96Y3ZzYm9rQkxFcG1paUtn?=
 =?utf-8?B?eVRvY3NNbm5UUmhDdU5lNFIvSjBwSjFVclBxV2NHL2QvdDNNUXZDcllhR0hK?=
 =?utf-8?B?MEhmVktiVkh1QVIzYlIrRHRtcVc2MUkrNUNGb1pIKzJXU2wrM2VKNnNRcXJm?=
 =?utf-8?B?bUcrMW9QSVhyK0lPMm9wL1NjUTF6bGNBUkdhSnlhRTRJdjFlRTFLRENncUc3?=
 =?utf-8?B?eHdsNU9OaERKUFdVc3NOb29rK1liT1JYUWxlMzg2Q1VvUWV5bHA0SE5lRWhx?=
 =?utf-8?B?U1EvRTJ3ZzBYWlhRYlhsbkd5UUsvd2hDbTU2YkdjTUFTZ1dIMDZTQVBJeURX?=
 =?utf-8?B?Tno4ejdtVlNURm11THBjdUN4dUIzdnM2a3ZuQWZ1SW9XR1Y3T2ZwV2ZLVTRJ?=
 =?utf-8?B?U1NVc0hUTDdwa3lZNFJvN0JDd0VlRXEyS21PVWpFeHVoUDl1Y0lCT0p2a3BX?=
 =?utf-8?B?c1NidjlTdGUxOVpPdnZGcU1Danl1enNmNEV2VUE2dU9yejdJSFlxNEYyaDhO?=
 =?utf-8?B?dG83ZUI5d29UNitSRWhxWlIyVXhuZEIwQ0xVWm9YR1gxUlcweFIyNUE1aXhU?=
 =?utf-8?B?U0dqT0VtVFR3cFNsZzlxQmYxVHV3WkJ6RXVFZ0RoZG8xTE1HOXhISENiOG5O?=
 =?utf-8?B?TVVwbytWUUsrUW02ckNpZnEwaU5JN1FkWTJDYnBwQS81T1lzaFcxZms5STZh?=
 =?utf-8?B?YXlqb05scGhwbUVLeDlrYThzZmhMcERSTldFbmptWitJQTJLT0FHU2NnRzlM?=
 =?utf-8?B?bzUveWR0cGMrRXcveUViU1RBSGtUSVUxTnlmMDIyU2ZNSlVrTkZUT1R0RWZ5?=
 =?utf-8?B?bEY4QXlTcTlEU1NoR0pJR2hQY21kMGhGTVJLdGFOdFZBRGtjcm9zNmdvRHlM?=
 =?utf-8?B?elc2WEVCVEdhZXAyOEllZitJaGNXZUZPaUIzeFVFelhyODJTdStmVkZ3aU1O?=
 =?utf-8?B?d3lSVjZHMGdMcmY3VmlCZEVHUUdlU2J4dS9Dd3dmUUM5M3NUMWVzTUxqTVlW?=
 =?utf-8?B?YmJRYUw0WTZ2MHpkd1FxdXJocGFYUFpkMXNDeTlCMThnNWFTZWxLcVdnaU1j?=
 =?utf-8?B?S2REcG9JNTI3VVp1Z0JXSHVUNExxOWdoOFdhM3hPdG5hWDVUZTNxTXNQVURz?=
 =?utf-8?B?bkRaYTlCQmM1ZnVzNmt4WDR0UTdCU29tRGcxQ0x2aHZJKzlmSVVKQmpZODRK?=
 =?utf-8?B?dlJUU3FKc1VQelZTbmp5amt0VUJkeG1kYjVtcE8vWmw3VUtRb04vN2pNM2hE?=
 =?utf-8?B?bEMrQmNicFd0T1lKb0xiTzN6a0pFSmp5WFp0N2t0VHNnNGEwd3pnVmdQOGlK?=
 =?utf-8?B?a2ZUMUpZQVlrcUZmSlNJbC9oRXhkQ3BmUFdzRlVvakcrNkRrdFdRNDhOQUxs?=
 =?utf-8?B?N21YdDBYeGhrbWpOaXg1RE1UNS9rdWhRc24xY2xRN0JFMmpSNys1UE1zRm16?=
 =?utf-8?B?YzM5Zi81T3RNUk5DWFpFajV1MDljTHN5QkFseU5aNk4zZkVQbFoxUjU5VUZL?=
 =?utf-8?B?UUpNbktCT3JGbklwQXhtWGRJRStsb2NtV2Uxa3AyR042KzdDU090YmhNSjVl?=
 =?utf-8?B?N0ZQQ0pxK2tOaXR6Z3RZNUY4MWh5S25wUlloTDlTazU1UndlOUVDeG5ndFFw?=
 =?utf-8?B?UXR6S3RLRDliRnJJSmxiTmU0ZnExSk9wR2srdmtML2h4K1JsVnQvdnhQdXJ0?=
 =?utf-8?B?REtIUjFVOXNjc1BUbmp3bWdyS0hsSHVITjZ3SkpOeW1tMnBZWExORWxzdHVq?=
 =?utf-8?B?ekhuMzF2M0lTOVNMUmZnVTJleHRKVFlIUTRUQ1RLZXYxelF1a3p4MGdOdzZ5?=
 =?utf-8?B?WEUvUTM2bzJ2MzhSY2RpaWV5cDEwN0ljRE1vY1U3QStLVjhaeUhTdWI5RlIv?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90848366-b0d7-42c7-dc63-08dbe103ca06
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 09:10:59.7252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeO/SUiSoWfHT6h9lhjF6sLkxh6NOh+hngJt+l953I8yTahY9WjQmGhB8SMtmoz+NY14Do/xkpTxA/qBV807Sunta5UXWxO5UrR6jYZvbAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8.11.2023 14:56, Karolina Stolarek wrote:
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 38e584798584..f0f0ab992e04 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
(...)
>   static struct kunit_case ttm_bo_validate_test_cases[] = {
>   	KUNIT_CASE_PARAM(ttm_bo_init_reserved_sys_man, ttm_bo_types_gen_params),
> +	KUNIT_CASE_PARAM(ttm_bo_init_reserved_mock_man, ttm_bo_types_gen_params),
>   	KUNIT_CASE(ttm_bo_init_reserved_resv),
> +	KUNIT_CASE_PARAM(ttm_bo_validate_basic, ttm_bo_types_gen_params),
>   	KUNIT_CASE(ttm_bo_validate_invalid_placement),
> +	KUNIT_CASE_PARAM(ttm_bo_validate_same_placement,
> +			 ttm_bo_validate_mem_gen_params),/*TODO move that around*/

Heh, missed that note. I'll wait for more review comments and remove it
in the next version.

All the best,
Karolina
