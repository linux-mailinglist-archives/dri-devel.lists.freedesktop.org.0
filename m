Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751EA4F145C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 14:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67B710F24C;
	Mon,  4 Apr 2022 12:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537C510F24C;
 Mon,  4 Apr 2022 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649073998; x=1680609998;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9NZUu8AxQGVI0zeJb46wuw7X/+C9TkhxSRO5m8EczmQ=;
 b=mLKQqzAiVM/wjuEhycBp7Lb5UJq+UG28PkCSYITZPt/x5GntUk3weBQ2
 N8C6FgbigkQpPu1Odr05dDpTX8yRQDkBi2OGp26h9y0L6Uk76lt2cE19U
 gxAAK/6TYTtiVeX01DswnhTfhtY1jHgZZuNpd5Euivas9lhZXHshdUAz0
 VfPMMaBVzgUbZsULe4qCnZRTs2jA59QKtGTc0asgGmeMPwAZE47Q27N8A
 FuMGE0XAjkOTCUmvu2QK4RGqK1UEZVc1Cmcgg6cgEC4xW/dN3dX4qtIim
 UDLdsfw7vh7i0r0M1O7DO81mZBbuobNUhSYUVbz86oPgb+8z7tdVfDKOa Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="260196535"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="260196535"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 05:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="721623639"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga005.jf.intel.com with ESMTP; 04 Apr 2022 05:06:37 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Apr 2022 05:06:37 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Apr 2022 05:06:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 4 Apr 2022 05:06:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 4 Apr 2022 05:06:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3kWRKiVtNc/4pbscNA5MTnDvP0QE9G0+iYoi4JVyp2D7RyhPclF6ZY/ksYEyzvTTkezrOK39Bw7O9wJxCK2t0TCH+XZ7b9OG2fIKrv7fO77LkFOudHk24rDIMitpMvr0nuhXD9T3/NYdVxoONUW0Ns96ELEXaBfEA6LjuqZAKDz/Gxgyeg4/wgzKSdh00GfG0j41mSm2R7Lv1V1CLgaNJPNbWEKEOQl5yYHmyK7+ryeCe/3J1z16its9xQU9r38fcuVMPhLmT2tnqukjzpdIqsBk612OoZxdWDiUY3aNRyJynpbbEJs+lufHAL3LCYeRHqyrBWy/ImcfrKO1vLBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGfAR/H/tyXmhNjazs1K4GNIjxvJrPIb0SK/pkz/N3w=;
 b=UVWYxCXU+q+ZPO66Oehr80voWhuUsp/s3yan2cSP/LTamhwG/51/mdWui+edrld2OSA0iCDLPY64Tx6tcepz3dCFKfh83954yd6TuVXECmfgnxLnhLXBWdJ4pJ17MORiK6MLtCWPUl8HHBbA14qBBFOLgJtcsL1JEcYd+9tszGppRQt5dTxY4JHUqg0bvdoRfA/N8W5v6uWAqdUAKwQBnAcPOsJVlvZiJAqe2iDTD7l/bwDrerViRRUx+0+xkDBQMMB++BiKBb6GHFiO9mNhmJ9FXxZG0XSQd50deQ3Lkp61jpRk5pVItsLzUQmGCXShflVDQVoD/D8mTcIfm1r/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 12:06:33 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::bcfb:902b:c181:8c72]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::bcfb:902b:c181:8c72%4]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:06:33 +0000
Message-ID: <57c8fd1b-1441-1731-8b53-c2d08577fe16@intel.com>
Date: Mon, 4 Apr 2022 17:36:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/debugfs: Add connector
 debugfs for "output_bpc"
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220328075020.708022-1-bhanuprakash.modem@intel.com>
 <20220329060731.785476-1-bhanuprakash.modem@intel.com>
 <877d897z90.fsf@intel.com> <b5041da6-9a2b-c687-5dc9-c587eb6230b4@intel.com>
 <87fsmt6s8w.fsf@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <87fsmt6s8w.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8df93be-1919-40d9-ec3a-08da16338f60
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR11MB3911A02C1C3A5B46F0D23CBB8DE59@BY5PR11MB3911.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OREJSh7be4bArE1kahNrUEBZBMgcx5p7b85NmYKRwTDIH/+M0Q8MMYLEZ/3wA9CmoV3/QYJaZEzwqr/91fuLeYbszKqt2B2JTY9bWY45neE+j5Wag8gnwoB4kPygF4mnS5tfa6Pvi1ZegCXzi9iz6FApXa3kJ8ncARBMRsfHcatkGgw+TJviwDYYkUovcdMEO2Ky4/4sUJFV0o8mLVJO7BqAUiEc6RWmlesdsagv9W1Uo3pkYcztE9MLbtfVeScVW/dKnMy7ja0IFJZhUL1WYv3tNJZMbKtg3MM65n2kE25WMR/RhSkT3l/twqKvwhxLKkNjTrePGF8mq484RTRFQlZ99Yjc5PxoZ5UyShGgDJH4W0kGIy5xZiBT2vK86oRhHvjpNS6TYnPJiS+o8hlL/3ciD5Sc9kRjfCgJDwQ9wIEIg/rK+Ni/4xsLGKdN16UZ18a3dmXyANndIql8aodMmzpppOTxwQ+DM86zmvknpP7F1vCQv53q6/QAw7kDDTCmXjv4XK3CebgMeHfQOn5Bx5PKMdJ8mZUB3JFwFgMB/3k1Lc7LxF86sZFh+47ChJF9jF8YArwW0dtbI35RmlXFwMKAzPCOpYEmwTe91VVLhvLlfTRihSM7osXIY84tai7TXinHMW6sGmcgKFX4Tvykkwo0XYv+dLX2LN9HDfydRmtyJlJ+iS21jMVoc8v/bZvpDIB+mZ8GOjc4cujPGgslSYFfbWLTC6ByLTjTcEY311YU9uO3il7Dk0cVmn7Rceqn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(6486002)(31696002)(26005)(316002)(6666004)(186003)(508600001)(83380400001)(82960400001)(5660300002)(66476007)(66556008)(8676002)(966005)(38100700002)(66946007)(36756003)(8936002)(6506007)(31686004)(4326008)(66574015)(2906002)(2616005)(54906003)(36916002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXRDYnFxM2c3Q0taclN2Q0F6Qk1UbWV4Nk9NOHRGai9TSTZONWU3YkZzRTI2?=
 =?utf-8?B?WDdlWFpjdnBKSGRxcWNZWFRFQ0x1TXdKdFEzTjNPU2VRajBSczFQNU1YOXRS?=
 =?utf-8?B?NUxsT2pWMGZqQVJrVUNTQ0xpS0xXTDB1aEFlc0h4SFhGZkJnZGxpcjBVNXpp?=
 =?utf-8?B?RVVHL2RLbnRFRWwrKzRqU0JubG5jM3g2YTFVWm5nOW5yVXhidzF3MFZqeWQr?=
 =?utf-8?B?dXFGbSt1VkN3aGVPL3l2Snppa2pqYkdZQ2o1NkthcFBjZzRKTHZGRUFPdmNj?=
 =?utf-8?B?OEQ4QVNTMFBPRU41MDd1UTBwUS80bTFIalNpdW85RlE2SC9TUjZzeGpyVDRq?=
 =?utf-8?B?UURBWUR0aVdEaC8xREJJWXBiZDkxVDBqSlNBd3ErTDhiZVhxUDZKRE9MaW8r?=
 =?utf-8?B?alZ0K2RpcWlOS2xETS90TDdzd2VJKy9GT1FDRkxJS0lQM3BlaCtqRGJZclFN?=
 =?utf-8?B?UnI1ZjNsVW1pc0VBWi9FdEt0K1NyVU5VdDRabGhXMFZyT1BQU2ZpbFFuWS90?=
 =?utf-8?B?Q0owb1YxMmdxbzFPNExjMUxtTHkxL0xtQWd0QW12NzVpVlNDNUdlUTk4a29y?=
 =?utf-8?B?bnFBYWxzS0ZZeDVBTFV3NmtSUzdiRDF1QlJzNFRKS01UU1g4UGxTM3Q4bmo5?=
 =?utf-8?B?emNKajBiYW82cGZ0eVl0Rm1nWnBTNEFZc3BiVFJFTlQ5MlhjaW5UNGUrWS9q?=
 =?utf-8?B?L3JiRkxRVXpXNUNMaFp5MWZWSk9nSStQNEhMbk44UFlsTHpQTloxc3JMdnd2?=
 =?utf-8?B?ekR3c0hkbno0bkxQVmtFK0JsZ1hkckVFeWhWWEd1VXJrZVZsV2tsQ0tLQmRV?=
 =?utf-8?B?SkpIR3pjZnZzczUyYjV6UHIrUzBtMVQxOE5JYlFDQzRrTy9BcGR6R2VkLzBV?=
 =?utf-8?B?MTNBNEwrQTcra3RUaEJBZHJrVklkR3ZzZ2JJWHNNWjQ4YktPV0xZMmsveUNC?=
 =?utf-8?B?SmNJZWtZeWs1eVBqV1U2WXFXWFlKeGNxTk51czNmb0duRW5Ua1NNMFdIVzJx?=
 =?utf-8?B?K2ZjVFVsbkpadFBLV0NhbjZkUjJqQnBzUnAyS0pVeU5yYktSSFBHaWJ1Zkg2?=
 =?utf-8?B?b2tPa2VKN3FlOUxCUEJnVmdPNmgrMC8xVVkrc3A3SHlZMUxnVTB3UmphVG5W?=
 =?utf-8?B?ODZxbm1FclZHSVJpUW9PTjRQMEVMSG1DeUFWRG5TVnNVN21pM3V5V1lwS09K?=
 =?utf-8?B?U0ZuWnRmRE9DTmZLSFNsY1BPT3BINFZwVnlCbEYwUWJlOCsya3NKSmJCNlpM?=
 =?utf-8?B?OWphUEg1R0QzeHAwZDJua0Q1KzU3THRFWkY2V0ZDdXYyOWt2UmJnTThMdDVt?=
 =?utf-8?B?MFZHblJGOTgwRzF0UUpsUGFLWjJQYm1xQ1pMeUJ3MnlHcFJqbWxqclFBVmNh?=
 =?utf-8?B?L3IxMlRVSm5xTkViMnRJZHpyNFpneHg1UTZuQlE4UUF6K2tPbUJnbm9kTWFi?=
 =?utf-8?B?aHFsVzNmRWRJQzlabDN3RGlCNStWeW9jaTlGTHNoMytQUWorQlJTanhZWGZZ?=
 =?utf-8?B?cGZ5NXFqYUJ4Ky93TEtOdE5EZFIrREdvdGp0bW45eWowbjd4OFFhY3ZPZjJj?=
 =?utf-8?B?d1FodW1YQjVBMTN4UjlIVVcvTUlmdjVOZ0dUaytqamtpY3U2bFNZSkRVRVI2?=
 =?utf-8?B?YXpvaFo4dGtqWGlLalNJWDhXQ1U0K0R4UWdJanlWV0haMTNDbGJNU1ZNY3lE?=
 =?utf-8?B?UUxId3dSV0lRenhJZ2l3UWdqVndhUnc1TWR2ZjRjWDZNSjRxSW9nQndIN0da?=
 =?utf-8?B?UE5oQ2N0SkkzNmxTbXBUaTkwQXJYY2IwWmoxeXl0dkRqSStWOGVmL1JKdURm?=
 =?utf-8?B?eDBNelpFb2hQN2hISlVLVHF4YkMxMHV2ZkdyUFNmalNqM1lCTHdUaFRKSFBq?=
 =?utf-8?B?S1RyNzhiRGNWajNqamhWWWVvTXRWYVRyT0wvWU01d1dEazN0dEEyeXB4aVVD?=
 =?utf-8?B?LzJtMFBXc0lTaURDNFBKT1NkNWFCYytVc3JVMTNFRFdPemh2TVlvOTVmUVR1?=
 =?utf-8?B?TjNvcm1wRzVlbXczZzFJU1h1RUJtZFEreUpEU2xIbldmOXZ1YXZMQnJ6UmNT?=
 =?utf-8?B?WEVISDA4ZUNrc3dzbmM5N0FGQTRnKzVEN3V1YXhyaHQ5Z3BTNVN0S01oWFo2?=
 =?utf-8?B?TFJJY1NuNjlMa0dCKzhKOUdnRmRJeXkrbEcveVNtbWF1akZhWmZZOUM5azBv?=
 =?utf-8?B?RTNxemxMTno2dkJBaU5QdzNUdURKQS9jSmxqQ1d4SlA4bDBTZGZLUUZsOHky?=
 =?utf-8?B?ZjNFeXpqM0xhQldWcFRLSVVpYVpUZVI1TVd1aVRnRzFWVnVDb1FVb1Ivcmo3?=
 =?utf-8?B?RHhJenY0THdPUzk0bldBRGU4SWVxdDg5Z1ZFanY4TTl5M3ZQNVJqS1BlbnNX?=
 =?utf-8?Q?JXZ7htvjmgcWe8O4Z/I8CLniKsLKdZwGca4bq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8df93be-1919-40d9-ec3a-08da16338f60
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 12:06:33.4420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fz5HEkXDudcxZs1MI9xlfbNCZT0405v5cigdcJVHdfMfS723goaRsUuxay4sDoIfaBlVTvf1BqwIV0PLJWOf/dg8PAnUGs3vX15qonyJezU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3911
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Arkadiusz
 Hiler <arek@hiler.eu>, airlied@linux.ie,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon-04-04-2022 04:16 pm, Jani Nikula wrote:
> On Mon, 04 Apr 2022, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:
>> On Fri-01-04-2022 06:10 pm, Jani Nikula wrote:
>>> On Tue, 29 Mar 2022, Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
>>>> This new debugfs will expose the connector's max supported bpc
>>>> and the bpc currently using. It is very useful for verifying
>>>> whether we enter the correct output color depth from IGT.
>>>>
>>>> Example:
>>>> cat /sys/kernel/debug/dri/0/DP-1/output_bpc
>>>> Current: 8
>>>> Maximum: 10
>>>>
>>>> V2: Add connector's max bpc to i915_display_info
>>>>
>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>> ---
>>>>    .../drm/i915/display/intel_display_debugfs.c  | 46 +++++++++++++++++++
>>>>    1 file changed, 46 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>>> index c1e74a13a0828..694d27f3b109c 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>>> @@ -663,6 +663,8 @@ static void intel_connector_info(struct seq_file *m,
>>>>    	seq_puts(m, "\tHDCP version: ");
>>>>    	intel_hdcp_info(m, intel_connector);
>>>>    
>>>> +	seq_printf(m, "\tmax bpc: %u\n", connector->display_info.bpc);
>>>> +
>>>>    	intel_panel_info(m, intel_connector);
>>>>    
>>>>    	seq_printf(m, "\tmodes:\n");
>>>> @@ -2275,6 +2277,47 @@ static const struct file_operations i915_dsc_bpp_fops = {
>>>>    	.write = i915_dsc_bpp_write
>>>>    };
>>>>    
>>>> +/*
>>>> + * Returns the maximum output bpc for the connector.
>>>> + * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
>>>> + */
>>>> +static int output_bpc_show(struct seq_file *m, void *data)
>>>> +{
>>>> +	struct drm_connector *connector = m->private;
>>>> +	struct drm_device *dev = connector->dev;
>>>> +	struct drm_crtc *crtc;
>>>> +	struct intel_crtc_state *crtc_state;
>>>> +	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
>>>> +	int res;
>>>> +
>>>> +	if (!encoder)
>>>> +		return -ENODEV;
>>>> +
>>>> +	res = drm_modeset_lock_single_interruptible(&dev->mode_config.connection_mutex);
>>>> +	if (res)
>>>> +		return res;
>>>> +
>>>> +	crtc = connector->state->crtc;
>>>> +	if (connector->status != connector_status_connected || !crtc) {
>>>> +		res = -ENODEV;
>>>> +		goto unlock;
>>>> +	}
>>>> +
>>>> +	crtc_state = to_intel_crtc_state(crtc->state);
>>>> +	if (!crtc_state->hw.active)
>>>> +		goto unlock;
>>>> +
>>>> +	seq_printf(m, "Current: %u\n", crtc_state->pipe_bpp / 3);
>>>> +	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
>>>> +	res = 0;
>>>> +
>>>> +unlock:
>>>> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>>>> +
>>>> +	return res;
>>>> +}
>>>> +DEFINE_SHOW_ATTRIBUTE(output_bpc);
>>>
>>> Looks like an excessive amount of code for a single value.
>>
>> Yeah, but these values are very helpful in many IGT tests like
>> kms_color, kms_hdr, kms_dither, kms_dsc etc..
>>
>> Otherwise IGT needs to request the kernel to get the EDID, and parse
>> that EDID to get the "Maximum" value which is redundant (Kernel is
>> already doing the same) and not recommended in IGT.
>>
>> And there is no way to get the "Current" value except reading it from
>> i915_display_info which is again not recommended in IGT (As
>> i915_display_info is Intel specific).
> 
> Note how we have intel_connector_debugfs_add() for connector debugfs and
> intel_crtc_debugfs_add() for crtc debugfs, and how this patch just mixes
> up the two by looking up crtc and state from the connector debugfs.

I just tried to adopt from existing AMD's implementation, and it may be 
reduce the number of debugfs nodes.

"Maximum" is from connector's display_info (Needs connector debugfs)
"Current" is from crtc state (Needs crtc debugfs)

> 
>> This debugfs is already introduced & using by AMD:
>> https://patchwork.freedesktop.org/patch/308586
> 
> Wait, what?
> 
> Both amd and i915 adding the name "output_bpc" is *not* the way to
> roll. We only add i915_ prefixed debugfs files from i915.ko.
> 
> If you need this to be a standard interface across drivers, IMO it
> should be added in common drm code, not sprinkled around in drivers.

As display_info is the member of drm_connector, perhaps we can move 
"Maximum" value to drm layer and can use common name.
Example: /sys/kernel/debug/dri/0/DP-1/max_bpc

And each hardware specific driver could create a crtc debugfs node for 
"Current" value in their name space.
Example: /sys/kernel/debug/dri/0/crtc-0/i915_current_bpc

Please suggest.

- Bhanu
> 
> I see that amd is already using this in what is basically drm core
> debugfs namespace, and there's amd specific IGT built on top.
> 
> Adding a bunch of Cc's to get some clarity on drm debugfs naming and
> usage.
> 
> 
> BR,
> Jani.
> 
> 
>>
>> - Bhanu
>>
>>>
>>> BR,
>>> Jani.
>>>
>>>> +
>>>>    /**
>>>>     * intel_connector_debugfs_add - add i915 specific connector debugfs files
>>>>     * @connector: pointer to a registered drm_connector
>>>> @@ -2330,6 +2373,9 @@ void intel_connector_debugfs_add(struct intel_connector *intel_connector)
>>>>    	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
>>>>    		debugfs_create_file("i915_lpsp_capability", 0444, root,
>>>>    				    connector, &i915_lpsp_capability_fops);
>>>> +
>>>> +	debugfs_create_file("output_bpc", 0444, root,
>>>> +			    connector, &output_bpc_fops);
>>>>    }
>>>>    
>>>>    /**
>>>
>>
> 

