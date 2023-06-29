Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D60A742F56
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 23:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ABB10E092;
	Thu, 29 Jun 2023 21:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E7310E04D;
 Thu, 29 Jun 2023 21:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688073080; x=1719609080;
 h=message-id:date:to:cc:from:subject:
 content-transfer-encoding:mime-version;
 bh=CpkGcrL/FG+DsZJhq0xgfAvA+lLV6ixuEtrqGCSQQqQ=;
 b=dXWoqRgp4ujQo0RUumUYPcZh54CRGWtkl7DFuEr4qobV71bsD7jCja6H
 A2FgJfnQx+j06YOzymRxklNMqFf1iGJmGQ3mSThQHs1jGhVbmX67Q/+lw
 zAhi9J0S34s2GkujoZ+tJHWuvqijeNM15pYORYwq23rpRbLdbYlIdtMZH
 Heo4ksfizZTTLwePGTHCHKVdb7ggDtaYyk25q408kBZfd2LChlPOXUfdD
 dm9N9tYxqK+DE8m9JK/jMbykInFY74yOFs1yH0HsszsHgb66gK0AEQ3M+
 bA/nSHfUcao3JMH/z8RfL7YMQI4PKb5qXssHXg17PAegFCh6lXqNgCokz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="341817332"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="341817332"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 14:11:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="694808258"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="694808258"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 29 Jun 2023 14:11:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 14:11:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 14:11:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 14:11:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 14:11:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO1EBP6IsPtS6Y0/Phdb5mJXVzZJjSo2X/bOF7U0DiftzM9Woye6lazGNNIp2XtIyNT6k8+cs47o5hPm8f3KGvbaZz5BRxGPnG8viL9RaLJZBy8sFYyPLmjRugh1Yfrr3HckvZNmIuOYaDvHvI8cpalZaOCTvsIukPJ/45hxuOcA9TLBpws43soS+iG0UmEY25zjVg6wbnOvcrodOY4FV85ONk+6/uMQmrfUgC9GOQN/pYjCJNoYAIr698NjWO2OVuZCAi0PNQQDBncAUYZ2Zj6fx8zIWf2oKGZksz16DprGPmewVZwljvOb7DSKzS8DpwWk3iazOr2AQyvEdA6Mgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsB1A1MaCF+am8d62ihYbAF40lfWHEt2Cnc577VJxBQ=;
 b=lpwBsM0cPigpG5/0R4Kh1oqoackIX2zP8NPFC70iuClP5S0kX2L65TNIAHugPuIBJZCF2hKSQrSlMzveZoEHEgZBgE4PUZjFtlHqYr3q3XKkBTMIKARXhml207eajuDB3DY44p/GJIubNJ4BNGeHrG2ZU2gQicEJuyEHX1ocWqqdNe3qN63/jDXIvS7N43PBgSKflSkRqaam96bmxr3RPrLulmjt0cI0b9/xNTLgED2Dww44zCepbOECE/a9bNKTYV9T6S2PGA+SJbKsouYhefune77lLfqYWvz26qRqptruo6jgQhlbeyo3s6ZpalOJWkZz4t8/VCfpkNnm6h1hQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 21:11:01 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::a35c:a9ab:37c1:69a5]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::a35c:a9ab:37c1:69a5%6]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 21:11:01 +0000
Message-ID: <c886cd42-2a78-fe3e-405b-e531d54449fb@intel.com>
Date: Thu, 29 Jun 2023 14:10:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 <intel-xe@lists.freedesktop.org>
From: "Welty, Brian" <brian.welty@intel.com>
Subject: ttm_bo and multiple backing store segments
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8d1326-2aad-42df-cd3f-08db78e55741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NDNRgIgWEu2LmvLwwqsivetlMy2wU4+fWJYBHujzPT1InyRWGUQmuXF1MPgYKlfMI1lvQjUwe/q35kacbKtLqB99zIL2OiQZyJ1oaU9MuHVG24FDG1kvjgE8jJJ6W9xnYx2i8SryIR3hpO9vbkhJ/lmTMg0Z580AMweh1WMBHCEoIx6sBLmoiZnsPN1QHOwDkq8syqwbYwmjykrHdElzLRNenOJqZx1GwCnb3Sld0rlJ9eYgRGatfXv9c714XdcDAlZG5CKZjJSxg9DNrShWcFuVee9PmGC4FOxbBT9mF46yS/I++hORkOkjm/KZUv5QYNtX0C4wTPHs+JQvsoc0VnPGFFgGLyGMrNXVgbGG8Bul4mwVoKU3IzGfDUg0XDHhYCRU8Dkw3OLKvSXAgGiQc6UWdPLZCpPny786EUWVGP6A1ChMUFaynkhCztCwuWe5hsdjF43NGyHGHEUhEOVkik/Fhqsh7AsqZALCQ+kr/t4QOQpCFx6gPaZ3A8h6aqw+guJ5phP+VX0hpB2DpCYwSsVTlNAxFA9AsKdI2+8plWq12ICtS9MW1VbOeMmXQceuOTkzd0MiIw5chzIEJ5djTg+RpRzXLn8gJj9MHLFB3fv5q0yuarNhZZ8ehs9ReeeN4YFVm32M9QSYjK17/4fcBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(4744005)(6666004)(54906003)(6486002)(110136005)(83380400001)(2906002)(6512007)(26005)(2616005)(478600001)(6506007)(186003)(5660300002)(36756003)(4326008)(316002)(31696002)(66946007)(82960400001)(38100700002)(8936002)(66556008)(66476007)(86362001)(41300700001)(8676002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDJyUCtTM2xVZ3Mvd1dXaEZlc3Z6RElmcmlYK2ViL2M5a0NnVG1DRTlkMUs0?=
 =?utf-8?B?b2h4cmhQb0tkdUN2NndjejdpWW9PZHBrSCthK0ZNcTl2QnlKbDc1dGE4M1NK?=
 =?utf-8?B?TGpkWjVQZGZUMVdzNm9YUjRvMW12U3cyZ2FyZ0VlNVdxVXVPNWRVR3dOUWZB?=
 =?utf-8?B?aFRrRXdSK2J6MWhSdElaS09zOFRKZlNhd1NHUFlSNys0bmhzYWVzTVQ4UnU2?=
 =?utf-8?B?ak5rR0hiYUpZVkk4bjgwOVdIMTdvS3BjeGhPL2hmcWtYWnBYNExKOXliY1hZ?=
 =?utf-8?B?eFpjVXhMYkYvWW1PV3NZYjJDYmNaVFpJeEJXalg2b0lPOEJ1cldqT1dxUXRJ?=
 =?utf-8?B?VDk1dWJBZlZtMUlkMGVVYnZhd0xHa3F5dWFOanpocDFHVVgreHFSdjV1djlG?=
 =?utf-8?B?azBCMmppb043TnZwVEdEdmlYZTJDbkp3Nkw0SitEd3JzaUhtUEJQUnc5Z0ti?=
 =?utf-8?B?Z2tjelF0bENTYVhETVpQdkFQcWovc1ZkYmNvRmMxbkRoNVlmQ0tHQ3FzVVNr?=
 =?utf-8?B?RGlnbk1rUERDZEFaR3JCOXU4R3NCR1JZbU1nQzFXYkRUR21IdVVJdUpWSzN4?=
 =?utf-8?B?MnVwanpWMU1JRWpMU0ZPbTFwZmtYUitJWnBJblo5NXljYnFpNTE2OUE5YnlX?=
 =?utf-8?B?SlpWOXJVSEh0ZEJ6dFZMeE5xME1nTWpHU1o2ZVBETVdxUDVuY1U1QmVWVmtS?=
 =?utf-8?B?Qm9zZCtHTytxVWF5UlRQTnBBUHRCZFdBOGEyazBHV3ZTSk94ajd0ck8zUFlz?=
 =?utf-8?B?UG1JZnBEWDhFb1ZJTU5YQTZZVkZRRTFTVkpqQjhPY29zQkkxUzE5ZTg4Z2NJ?=
 =?utf-8?B?Nm9qOThLVjVZeitxcmdBdlhsYnRwMjJpQ21yN0pYV09nNm1XR1paS2VaR1Ev?=
 =?utf-8?B?VHR2Kzk3UjViMnc2eU5uNXVqNUpldWhPZVVYV1ZITm10SkN4bVBGc01OMGRt?=
 =?utf-8?B?VVBKOEZuYTVpVC9VUVBadmQvR2lKU0M0N3dIVVRnbWlFY3ZpQ2ZCbFpoajU4?=
 =?utf-8?B?STJCeWNYUm1LdUJ6M3hHS0Mxci9hQlRnSTN4aWNrVFV4QmpyOURMZlhVZDNl?=
 =?utf-8?B?aDBXaTBoOXNsSTRKbWxnLzFYbDNOZ01KYUhyeEFuSnhWcEtScnk4U1ltU2NN?=
 =?utf-8?B?UlBaa3hnZ1ltbnVFbnZNMzRnZy9iMGkzNVE5NCtCOEtFcVZIQUJ5UkJSb3RV?=
 =?utf-8?B?YmRLb2FKV3pNMUxFTTJKU25FTytlTmsxZTNLaGo0RXYzTGVvcVg0dG81Wm1a?=
 =?utf-8?B?OHdQTCs1NkF0eCtacjltTVZQNjNDaFJjeGJhN01hVDB0aTFFWFhYNjRwYVJ2?=
 =?utf-8?B?RVB5ZGVPR1MzMDRhT1ZGYWdURkE2Uzc1R21LalJPWVRtRFpQbU15OCs0UG5Z?=
 =?utf-8?B?VFJzZ2t5YjBSWTdHN2Vsb0p6bGVVOGZ3eGlReTBZRHBEaUY1R0xBWFFaMSs1?=
 =?utf-8?B?d1NtU1Nxc1lUdlBYNkxJd2VXY3M1dVBia292VmZLOHA1a0hyaWdHVEUwRDlh?=
 =?utf-8?B?dC91Vm1jZlgwZEQ4MlpoYm9XY0Y5NHpYbG9LQjNvZGcwTVppSVBSR0VZMXcz?=
 =?utf-8?B?QjhzRXUxcXNOTXd4L1g1S25sTTZkTXVQczF0ZjRLYUFxTFYwUUl4QmFqUGtp?=
 =?utf-8?B?OUxDZWR3QURPZHRXcmRqbjRONW1nWU02NjlzdUtPeE9CeDQ1bnpBc3JTREg2?=
 =?utf-8?B?UkUvT2FMOCtpT0ZuWFRURGx6eVNzaGlIVEtrTUZUVHJhV2c0dE8weUFJN0Fh?=
 =?utf-8?B?MlIrRDgxU1VkV2s4WUNyRis5SUlBNTRFZWtHSXFPdHgxT2JKNmZESFNXY2hp?=
 =?utf-8?B?dHBySjdpelVkNjFkT0JPbzQ4VjIvY1ljbWVDVkdWM1BWU0ZoaDhQQWdVS0ZH?=
 =?utf-8?B?azRoWDlzQkdTdmR6bUJOWkFFckxFRVZOaHJTNnJ2Z3hHWkZOOCs1UGM4NS9R?=
 =?utf-8?B?ZTAyNTVTRFEzS2tlVmdwSW5udDlLNjhHd3Q2bC96S3RnanpWVW5MRHhJUDZl?=
 =?utf-8?B?em9Jc09yVXR1SXljbjFYQ1dCZTgzNUpHSEZ6Z1FZR3FmdENRVjlrcHBhSmp4?=
 =?utf-8?B?MHFiWmVWYmNyUTZGV1d1T2NJQUlJSXhvaXZMVkdkdEhNZFgxY2xieFE3QWpI?=
 =?utf-8?Q?/tKXEHT3acAIFwZnq2Af0oFSh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8d1326-2aad-42df-cd3f-08db78e55741
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 21:11:01.2327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uip4dRYSFyDpkW/WusLQmkWBy5lpCA+24ExeHVg22YPzOcR1XWehP2hSWRwsJ1kVyGENZwfFQjx7cE0TC0Ol8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
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


Hi Christian / Thomas,

Wanted to ask if you have explored or thought about adding support in 
TTM such that a ttm_bo could have more than one underlying backing store 
segment (that is, to have a tree of ttm_resources)?
We are considering to support such BOs for Intel Xe driver.

Some of the benefits:
  * devices with page fault support can fault (and migrate) backing store
    at finer granularity than the entire BO
  * BOs can support having multiple backing store segments, which can be
    in different memory domains/regions
  * BO eviction could operate on smaller granularity than entire BO

Or is the thinking that workloads should use SVM/HMM instead of 
GEM_CREATE if they want above benefits?

Is this something you are open to seeing an RFC series that starts 
perhaps with just extending ttm_bo_validate() to see how this might 
shape up?

-Brian
