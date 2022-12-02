Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7AA640F03
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 21:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D7B10E720;
	Fri,  2 Dec 2022 20:15:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF36010E13E;
 Fri,  2 Dec 2022 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670012153; x=1701548153;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n1WgM8PJLOL1M0KoByTIHFLs1CzV1B2ltxFtITwY3ZY=;
 b=d6MR7c3Y4RloVhY5qmRMaHmkJJ7wZIRHSf8X0KkBrNBMB0g0cHW95u7F
 0xN1oHmolm3fYJ+bbV5KC+VU5zsu+LCaIR4xfdMVYmJcWW53EExmWMBr3
 G8O2EaC49gmK+kaGX4LY83ywTXFh44IrPMxAM10sDn4mwd3DZ5uyXwU4O
 XSKmFv+5GRcQjMLK9z3XX6vTMAbwFxjvQyP3mlZPeuARuWIKgzszN6fLn
 1PIlIHcugpEw/cogCg6qsiDdx/+wq8PxTKYinNzAVPApxxSe7uX0WK4k/
 CoXThvVAJM62JXRM35h+nITyOue4uq4vxvarW0HXuaIUfZpAEuLn/CAvk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="299436186"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="299436186"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 12:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="708606299"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="708606299"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 12:14:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 12:14:11 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 12:14:11 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 12:14:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 12:14:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lE/t7SCHoJzJteASh3ZrBbmEz3UJ5Y9Ax93LEyQp2fCv16FKecwscIbyaXhfFEzXxI7ZeiH2/1y/V4rhFev6EcYAXjEDSpEIQNdik86LYsdU+1nB2J/H47A4wrAT+VK3Zm57/OJE2iDHyxRRImzgT1RFRWrOiYCgkhI+5zYa5CMK9iyd9Ihx0cYVEjTEWZ6qGkDi/hcWktNR9kzQSW3qcLeTg6kJT2ZxYug2vP5zGPooQgHwq1V+ixknfRoI2aLgLedV7NmlRR9Fl54X+urHcUdAUNrOExxDmeyIFixb2ILSvUZWTRMJZpfZAK6wwojqb6UIo/9RTZueJ+9xfq6gyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u4ovKFDYNEoCesjGBPTHUQjrjS0Ww6yz6xNpPzTMxk=;
 b=afznxRr4d06XhkRDAzrHW31hvPiv/qduy+MJKC8raIH4qtPxYyXk1+WONnY3Q+I2ppdWzngrRadxg5cxxXexKTN9itMQ2Bnwd0fKyPWpbHDycdlagkPYdOiXtWwvCUfw8SbjAkhfVZk1BKLShaS1geg2+yzNTjigY+hrpzUqMTdL8Qka0yJ1mOYCEwJk7zMbr3ArjiH2CM9QV1T8D/CG6M8Lbj7W1ALF7fgKM8KGyqzI0JlNz47kZke7UFjNJYeDEO2m/IJ5bt2CHMxtaqcOsHVfZeiiFH47MK843PksGpKy+K66NhHAYPTjzE9ZcYLTUaoDEmuj9qUyK5Dmif9vtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 20:14:08 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a05f:67f5:ab9c:6221]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a05f:67f5:ab9c:6221%5]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 20:14:07 +0000
Message-ID: <dd787d9d-8559-1da4-7e99-2635ef1341a8@intel.com>
Date: Fri, 2 Dec 2022 12:14:04 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Add GuC CT specific
 debug print wrappers
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-5-John.C.Harrison@Intel.com>
 <48f594de-9682-4b60-f934-9420d02b405e@intel.com>
 <dd9559e8-7d65-d7bb-ea1a-d169a1c7eec3@intel.com>
 <4579b7e8-eae7-b760-66aa-b01273d18aab@intel.com>
 <d658f8fa-a063-aa0c-48ff-14f32cb6b339@intel.com>
 <9a5a84be-a5ae-7be2-f522-5e976511e4e1@intel.com>
 <143a660d-de2d-a77a-b490-8ad2add80420@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <143a660d-de2d-a77a-b490-8ad2add80420@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MN2PR11MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c60d02-35ef-4738-4643-08dad4a1c46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UNQUJOQT1YtsLhPRPgGnqdM5qQjJTSkb+JLtGV6Q1taP87YWxv2cgPuospwTRbYXgKvoxBCa7ZQhZ3iyc9YvOaZ6NZIStA50urrAa0l5mo7S3p+6eeTZqICBJyBWca2P4fPjaP0X992wwUORIl0Clquwt9YBTpdxXGwrFpRfrNfdtbdxPI4yt0RarxnbApr9mt1Ss8bTbOBE9M9OR2bFWN2qauA6VzcrR0g0dcfU2T8snvKPrifDkOwpuRkW2DJmNZxjiCelw9FAH0FbZHLXuq+d6tFCSB1MUfHQSa9qeuo2OyFD+3WiLtucxCglnD9zmyleME2AiOxg3swtVdoWIsd4G0cYWydzMQm7bpr5V+rA9dSA24PICkn6zUrJu4JmEDb6G5q+GbfWIa+UfaDsvt+eCdR2EAwZYsJeJewZ2m1LiqmCbW+5RHW84T/WvoptphfddvgG3/0eXDltkpiUOMFZ952UfdReFlzTxq74I95QnQfCf5ggFP8i3tPR7zQmPRVl9ZvxiWmK0LBd/GY2yJK67cgv3c0CQX7w7yzzntCpUTmaBmknO++tA75DEt5Ewot3+tFYNPF18n4roSRvwnzu6jTIbS/8C3ToJPGxzSVQya6uhiWEyrwZ7wkOt0gwCeNqV5Awk9oBCNAngvOG5Ftx8UyaXcv7S9DP0PCnySymBvhk3KrMsptvosvw2tuHXsMlWlpTr8z/iDud32ZrsWVDyjmNxFtWwGQZRM0AvVVYu97A9H0p4vTT1uUWa3W5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199015)(31686004)(66899015)(86362001)(110136005)(53546011)(6512007)(6506007)(31696002)(36756003)(6486002)(38100700002)(2616005)(26005)(83380400001)(186003)(41300700001)(6666004)(478600001)(5660300002)(82960400001)(66556008)(66946007)(66476007)(8936002)(4326008)(8676002)(316002)(2906002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkJTeVNnaWtweU1sTjl6aGxLR3pLT1U1cVIvRzdDVWIrNkNDREU0TFF0WHdu?=
 =?utf-8?B?WlJiS0VaZGNDOWVjSk1lL2JmNU1uY28vZ0tZVEVraE5ncERPekdEVXZtek1w?=
 =?utf-8?B?QmoyVUI0S3RITmhhZ3p0SGhDODlnUFR2T3g5aDN1YmtTV1NYMnY4azVIbUtR?=
 =?utf-8?B?YTNreVE2bzN5VHUvcVlZT2FyZCtFVkZyNWJoMDcwUzVxUTZTaTJwTDNYVnB4?=
 =?utf-8?B?UVZESUR1dVBhZkhLNnNYK09vUHJpai93VUw4cStPSml2amdtN2paWlY2aE9E?=
 =?utf-8?B?bDRGUDhaT3U4dFU3YkZSZVo0bXZZcTR0Z1B5cS8veFhHaktHRHgrUFVoeExU?=
 =?utf-8?B?RzJLaHd1bkFLaC9iVHo4Um9UZjhRSUlWb09CZ2RPYjZiU254amlGbVc1YUFv?=
 =?utf-8?B?dW4vYUFqSi84TmV2T0VGWkVWN29OdHRFZDM1TWkvT2NKdmJIU1BDcVVkM0p4?=
 =?utf-8?B?OXpwMmdNMnp1M2Rac2VtdUZGQ0g2UWxUN3VXdjBQSTVnUzUwcUVzVUhQOWVk?=
 =?utf-8?B?eUFOR1ZFUzhBRXMzSENKRE41cmVtUXpTcW5TVkNuTFFGTmlvUmFuTWlsdG4x?=
 =?utf-8?B?dkU5RElIZ0NWNm41VWdhQi9lMjhLYmZwaTk4MnBweHhYYjROUjliZFJxdWhv?=
 =?utf-8?B?RnBQUnE5TUN1Tk40clE4MHhLc2NsYzZXcVczYXpmZHF5WWFPZkMxTGt3d1Y0?=
 =?utf-8?B?a1NsUHlHZ29qakY4TjFYUkMrRzJCYS81ZHUwdW5aeWRJd0FpamNGUnpVUTJk?=
 =?utf-8?B?Yy85dXNlckVTODRiR1pVeCtWbmo5VGdZNkZUUVJQSHBTWXNHVlFTZStNM24x?=
 =?utf-8?B?a2pwTzQ5Q1hJNk8yaHRsb2lxYkNFNEQ1d1V0RVY2enM4RU4zcVFVOXRYNllY?=
 =?utf-8?B?alVwZHhTOUU1SnZSSzc1b3hRMFhXaEF5dmRwSlcrbC9oNjJSZGZtZlE5UG5q?=
 =?utf-8?B?LzF6MW1sNW8xMDFTZHNSRlJTSitjWlJRN2NjOXdLUDRvQ3hNS2N0RnprQmhQ?=
 =?utf-8?B?Z1lISXhibXB2VFVqVU95ZWRPNDRQZWp3REJHSndkU01oc3hRcFB0L0d6N0pC?=
 =?utf-8?B?NlVHcFhka01YenVBbUxMYkpLTzBVWFFiR21lR2wyQXNUbXh6aHB3NVFWYlhG?=
 =?utf-8?B?RG9xb0RaNXBrZ0ZVL2M0c2ZGS3F6RWZJNlE5cDZ6aGV2M2NMVzNSWndkMXdw?=
 =?utf-8?B?eDd3T3FLOGczeFNjbEM4Ymd2RkVrT3oyeU1LYjBBS2VqYk1jQklJM09QOUdH?=
 =?utf-8?B?V2dwUEdMVG9JU0ZmMVNTR21YRjJiSWJ5M2pOU0U4RzZXc25XenVGN2NVaGJJ?=
 =?utf-8?B?d1BEQmFZVksxUHg2SWM0UjIxaTdQN2JqOE5yczFtbUF0dWM4amVvZHg1TEtE?=
 =?utf-8?B?dnVwd0FWMFUxYTdSSVVhb0diZzc4MWFSWHFtTFBsOGNQR1hQaTlhT1gzdnFi?=
 =?utf-8?B?OVdwYkNGYjE5amNvYXdxM1FiZ2hvTlhnUThiRUhVZ0pLcUh2elhNTmpFd1N0?=
 =?utf-8?B?UUdjbXN3eWVQRlF4S0FGOSsxd014WGxxS3NuWXVkYm9FL3A0azJMVWt4bllT?=
 =?utf-8?B?R0RTbmNrcXc3VThGSWxjS2NPOHVpR2V4M0JwNDMwN0lkYmZDcTM3bDBESWpE?=
 =?utf-8?B?TjRnejlMTEJ5RXZkM0MrMWIxNUxwZk9EdHg5TUhVQnJXMG1BS0w3SEkrYkRh?=
 =?utf-8?B?WU1MVWNoY0pKNm9KQ2Vsa2cvWWdyN2I3UkFpcXVJTERHalhKNk9tdEtqUWl0?=
 =?utf-8?B?QTk4Um9FZ3JVYWJ0cWVtQk53a1lkbFBzUW9ndXpmYlVQR0hhWEJZVVNyNitq?=
 =?utf-8?B?eXRxY0psRk9uL3FxZDhHRzBwZjNFNzJ6NEZUOWpKdEROUjJHeFZyR2JZU1ZR?=
 =?utf-8?B?bFNRVzFmZ1djOFlWT05JYWVuWlVManh5cmxTb08zVTVOS3QzOTVlN2RvaWNX?=
 =?utf-8?B?YnB5T1pmSzVmWGVQeFdjaHF4dnpDSUlKd0ZWZ29INzc4d1ZuazNPYzhCMFhp?=
 =?utf-8?B?RGVUNE9OcERYLzB6cGxBMWNISHdwbWtUSEI2anhtWkhWSkkySzB6WjFYN0Ry?=
 =?utf-8?B?TlZHY01PY3ZjWTdXVkVLcFRRTFlXWjRIUUxYempDMEIzdlI0ZkZ0eUJuV1Bt?=
 =?utf-8?B?YVBiRmF2K3VLcmxrZ1ZjN0FPMHR2Z1EyclFKQzNVQklEdFNkd0Q2b0F2Syt6?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c60d02-35ef-4738-4643-08dad4a1c46b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 20:14:07.8409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0aqIcomg90b2JOIbUaA8GoiSHhI6CZipzMItBk8S6gBQbw3FIaflIHKXU6c5IwEylwnQB5pqRlJ9O49MzEf41UJ8KWWPeNx5GDoMznKFl3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/2022 04:01, Tvrtko Ursulin wrote:
> On 01/12/2022 11:56, Michal Wajdeczko wrote:
>> On 01.12.2022 01:41, John Harrison wrote:
>>> On 11/23/2022 12:45, Michal Wajdeczko wrote:
>>>> On 23.11.2022 02:25, John Harrison wrote:
>>>>> On 11/22/2022 09:54, Michal Wajdeczko wrote:
>>>>>> On 18.11.2022 02:58, John.C.Harrison@Intel.com wrote:
>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>
>>>>>>> Re-work the existing GuC CT printers and extend as required to 
>>>>>>> match
>>>>>>> the new wrapping scheme.
>>>>>>>
>>>>>>>
>>>>>>> [snip]...
>>>>>>>
>>>>>>>       /**
>>>>>>>      * DOC: CTB Blob
>>>>>>> @@ -170,7 +188,7 @@ static int ct_control_enable(struct 
>>>>>>> intel_guc_ct
>>>>>>> *ct, bool enable)
>>>>>>>         err = guc_action_control_ctb(ct_to_guc(ct), enable ?
>>>>>>>                          GUC_CTB_CONTROL_ENABLE :
>>>>>>> GUC_CTB_CONTROL_DISABLE);
>>>>>>>         if (unlikely(err))
>>>>>>> -        CT_PROBE_ERROR(ct, "Failed to control/%s CTB (%pe)\n",
>>>>>>> +        ct_probe_error(ct, "Failed to control/%s CTB (%pe)\n",
>>>>>>>                        str_enable_disable(enable), ERR_PTR(err));
>>>>>> btw, shouldn't we change all messages to start with lowercase ?
>>>>>>
>>>>>> was:
>>>>>>       "CT0: Failed to control/%s CTB (%pe)"
>>>>>> is:
>>>>>>       "GT0: GuC CT Failed to control/%s CTB (%pe)"
>>>>>>
>>>>>> unless we keep colon (as suggested by Tvrtko) as then:
>>>>>>
>>>>>>       "GT0: GuC CT: Failed to control/%s CTB (%pe)"
>>>>> Blanket added the colon makes it messy when a string actually 
>>>>> wants to
>>>>> start with the prefix. The rule I've been using is lower case word 
>>>>> when
>>>>> the prefix was part of the string, upper case word when the prefix is
>>>> Hmm, I'm not sure that we should attempt to have such a flexible 
>>>> rule as
>>>> we shouldn't rely too much on actual format of the prefix as it 
>>>> could be
>>>> changed any time.  All we should know about final log message is 
>>>> that it
>>>> _will_ properly identify the "GT" or "GuC" that this log is related 
>>>> to.
>>>>
>>>> So I would suggest to be just consistent and probably always start 
>>>> with
>>>> upper case, as that seems to be mostly used in kernel error logs, and
>>>> just make sure that any prefix will honor that (by including colon, or
>>>> braces), so this will always work like:
>>>>
>>>> "[drm] *ERROR* GT0: Failed to foo (-EIO)"
>>>> "[drm] *ERROR* GT0: GUC: Failed to foo (-EIO)"
>>>> "[drm] *ERROR* GT0: GUC: CT: Failed to foo (-EIO)"
>>>>
>>>> or
>>>>
>>>> "[drm] *ERROR* GT0: Failed to foo (-EIO)"
>>>> "[drm] *ERROR* GT0: [GUC] Failed to foo (-EIO)"
>>>> "[drm] *ERROR* GT0: [GUC] CT: Failed to foo (-EIO)"
>>>>
>>>> and even for:
>>>>
>>>> "[drm] *ERROR* GT(root) Failed to foo (-EIO)"
>>>> "[drm] *ERROR* GuC(media) Failed to foo (-EIO)"
>>>> "[drm] *ERROR* GT0 [GuC:CT] Failed to foo (-EIO)"
>>> All of which are hideous/complex/verbose/inconsistent. 'GT0: GUC: CT:'?
>>> Really? Or 'GT0: [GUC] CT:'? Why the random mix of separators? And how
>>> would you implement '[GUC:CT]' without having a CT definition that is
>>> entirely self contained and does chain on to the GuC level version?
>>
>> you missed the point, as those were just examples of different possible
>> prefixes that one could define, to show that actual message shall not
>> make any assumption how such prefix will look like or how it will end
>> (like with or w/o colon, with "GuC" or "GT" tag or whatever)
The point is that none of those are ever likely to happen so are 
meaningless to prepare for.

>>
>>>
>>> This is pointless bikeshedding. If you want to re-write every single
>>> debug print (yet again) and invent much more complicated macro
>>
>> the opposite, I want clear understanding how messages should be written
>> to *avoid* rewriting them if (for some reason) we decide to change or
>> update the prefix in the future
You say that like there is any consistency or regulation at all on how 
messages are currently written.

>>
>>> definitions then feel free to take over the patch set. If not can we
>>> just approve the v3 version and move on to doing some actual work?
>>
>> if everyone is happy that there is inconsistency in use between gt_xxx
>> messages where we shall be using messages starting with upper case
>> (since prefix ends with colon) and guc/ct_xxx messages where we shall be
>> using lower case message (since there is a known prefix without colon,
>> either "GuC" or "CT") then I'll be also fine, but for now that bothers
>> me a little, hence asking for clarifications/agreement
>>
I don't think anyone is happy with anything.

Personally, I don't like the idea of adding fixed prefixes for every 
subsystem just for the sake of doing so. Having a wrapper that abstracts 
out the messy structure mangling of getting from a 'ct' object back to a 
'gt' object maybe has use. But with regards to fixed prefixes, all I 
ever wanted was to add GT# (because that adds useful information that is 
other completely lacking) and, ideally, a display prefix for all of the 
display prints (because they completely swamp all other output in CI 
dmesg logs, so being able to trivially filter them out would be 
incredibly useful). Beyond that, it seems like adding work and forced 
formatting just for the sake of it. If a print wants to say 'Error 
received on CT read channel' then why should it be forced to be 'GuC CT 
Error received on read channel' which is coded as 'Error received on 
read channel' ? To me, that seems less clear both in dmesg and in code.

And for the record, I didn't want to add the GT thing as message 
'prefix' either. I would rather have just extended the PCI address that 
is printed by the dev level printer. But that would have been a much 
more invasive change at many levels outside of i915. As in, "i915 
0000:00:02.0: [drm]" -> "i915 0000:00:02.0:GT0 [drm]".

And here we are a month down the road and arguing over whether a three 
level deep prefix should have a colon or braces around each level's 
forced message prefix!? Meanwhile, it is still impossible to know which 
GT produced a given error in a multi-GT system and the ability to filter 
out display messages has been completely nacked for reasons I don't 
understand at all before I even got to suggest it.

>> and while for dbg level messages it doesn't matter, I assume we should
>> be consistent for err/warn/info messages (as those will eventually show
>> up to the end user) so let maintainers decide here what is 
>> expectation here
>
> Could we have some examples pasted here, of the end result of this 
> series, for all message "categories" (origins, macros, whatever)?

GT initialisation:
gt_err(gt, "Failed to allocate scratch page\n");
i915 0000:00:02.0: [drm] GT0: Failed to allocate scratch page

G2H notification handler:
guc_err(guc, "notification: Invalid length %u for deregister done\n", len);
i915 0000:00:02.0: [drm] GT0: GuC notification: Invalid length 0 for 
deregister done

CTB initialisation:
ct_probe_error(ct, "Failed to control/%s CTB (%pe)\n", 
str_enable_disable(enable), ERR_PTR(err));
i915 0000:00:02.0: [drm] GT0: GuC CT Failed to control/enable CTB (EINVAL)

Random meaningless (to me) message that is apparently a display thing:
drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] disabling PORT 
PLL B

I'm sure you can extrapolate to all other forms of dbg, notice, info, 
etc. without me having to manually type each one out, given that they 
are all identical.

Personally, I think the above should be just:
gt_err(gt, "Failed to allocate scratch page\n");
i915 0000:00:02.0: [drm] GT0: Failed to allocate scratch page

gt_err(guc_to_gt(guc), "G2H: Invalid length for deregister done: %u\n", 
len);
i915 0000:00:02.0: [drm] GT0: G2H: Invalid length for deregister done: 0

gt_probe_error(ct_to_gt(ct), "Failed to %s CT %d buffer (%pe)\n", 
str_enable_disable(enable), send ? "SEND" : "RECV", ERR_PTR(err));
i915 0000:00:02.0: [drm] GT0: Failed to enable CT SEND buffer (EINVAL)

drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915-KMS]] disabling 
PORT PLL B
But presumably that requires finishing the plan of splitting out the 
display code into a separate driver. So for now, something like this 
would still be a massive improvement:
kms_dbg(dev_priv, "disabling %s\n", pll->info->name);
i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] KMS: disabling 
PORT PLL B

John.

>
> Regards,
>
> Tvrtko

