Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9A5607E3F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 20:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A09A10E084;
	Fri, 21 Oct 2022 18:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66AF10E084;
 Fri, 21 Oct 2022 18:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666376710; x=1697912710;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FEfNNgABhg08rFXvUJ0I/Csp+9lLo5ttswlK+K0VJPg=;
 b=ZHuUVXmOULa6LDwvWFWgD/M8flFU0a3AdAWeK2qMVzK5eHEToonI7Fwk
 OfOWzhzK6ARqXdPPocWrYJ9TSk/xei2cuT9IBAZVOndQHnZqu2gPZkU1b
 /f4gjbiquqOyF+lIt+kkcuMQSd+luyvWj4cvKGsoGkoP1Y4INSNeTYyLX
 VNroUuTtnhQjGZB7jM2lysLfmARqCs7fSdB9PxsymHPhxp4dzCFOaYp1O
 eoZ99LGTwEeQ6AepiORg/BDXAjBiYFgk91k2kxZkrVenR7GzWuABGzsk1
 DrvmjaAajVmgjTtWKMGv9xgG5vyHmOxKrSFmaF1/xYK3DoTe6dWU13kcz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="308758928"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="308758928"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 11:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="875788000"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="875788000"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 21 Oct 2022 11:24:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 11:24:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 11:24:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 11:24:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRYL/ttNC4mi+Gm1mTBOH1CxzsULJxfrUy+eh+6B5lyhszmfrOUiAXUMIbzzBo8dJzCso25YWFb9tqZ1O4uj3UYVlyEdXOOCh0IZXmSYkro3Mifw/vzPHw9FjAMczntZ+QEyTurih4rIT1/86Zr1JJCu081xzf3Chv+An8amAQIFacxQZxxu95UKUkX+6l+NylZlt2ppyeBfDndydf2eQ+wtn5I7EsZeoOfj+jSnF0BP0kIXMZh3JyDpz0fvSjVBF5qDH4ZIjW+Nwm04ZSXmKBn0cO07Jk/BHwCB/kMNGoNeOH6hI3UFk0N7JIMCH97jxrTBo+LEBdtGxnp4aOuFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iyuyHL/fuKvqOHvEp24CszLISCvM/Q43sOfEQosZzc=;
 b=MYqCF1RiLGa3TBbxBh0W30QoUrFP8/wL3zV00UQxo5oxtkXHcPqWbyhYRtV2LaGR8hOxLB0ePCRxnIpTImd4IWJPAR3uHtYTusbToNF3U4Baq+yeousbEsJBkerG+8Dm7OY8qwZARR8ALqpG7CwhmmY5ztIbabMwWu0f0it70bLGPnOqFIdTk+EO5vnjzLn31ebCYmNrcU/Zxsd0eDReWyRL7F4cvXPw4d95WhoDxDUowNrfmOw8i0I5NVMh/jGRiPfmwh6if7MVvsXvdajlGl8nhkORA8ac7AowTd1N+GSS9tpd92Hn9fG3recEVQB9xKZi07qXUs68Tno/f5wChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 18:24:43 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5723.033; Fri, 21 Oct 2022
 18:24:43 +0000
Message-ID: <2287a44e-80df-ef3c-1d4e-5ee80a62e381@intel.com>
Date: Fri, 21 Oct 2022 11:24:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/slpc: Optmize waitboost for SLPC
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20221020002944.4228-1-vinay.belgaumkar@intel.com>
 <874jvyqr9o.wl-ashutosh.dixit@intel.com>
 <bbe2b4c5-04be-bdc3-3911-d1544516eac1@intel.com>
 <871qr2qd7y.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <871qr2qd7y.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0384.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::29) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SA0PR11MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d91c615-e13c-4e9e-ff7e-08dab39186a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SLc6WdIGjF2vqbtuaubFOhe4kpS11Rincu9uTqx9vX06vUz1G/85FLi6qb5p95BjDJ87FbX7uVIYmcxoPa4dCA4juGk9LePN1pxk7ctBhC9iJ3CoKnWhkqRYFZZH2un9Hps6c7DtOwjAWSenjabiVvZ/f5bDg1gosDXyTHBLB06mYbAaAbBqPGhXphq/ppdjnTJjqNZEEmWTx1J798JtwOUZEjwyHM6m6BzAoEZXg4Fdeu4f/XWm7vWXFIvH/u04KO9oCx1i7l9bGaohA/TlKj9UqBFNpIW9v2vGvPElWPtc8mEWrmw3B7lilRpQ95z7bQa2Njw/Gd12OcYcynfVKmE61BnPT4dibta9/bZiBkbjx7QxjcSRraD8VpNFd2cxe9ADS2feW+tcGa7mky4DgwJ8mDKx7RxiEFOQtXC4+KTUEcBqIUxHWblRNyyc8v+46h1y3iBWRH7rxp/pwoCmY4Fp6BWeJyObXUu4ZcKy21GSTvjB4ZTM6p4JURuRTpL4x9yoND3N9+86cU0l+S0SsCm6CZsdfPyT5V0DV3RGkhAZbrCFC4JYPPnkkkJPz/QjpxzgW/5cH79VPEfTSgELeK9a/1/FneINnAnkQwA4s5CXzbQn/fujQAJRbvoBLxukpIe2lN+Q2+iZ6RV5lZ94dqCQtHIAlvA/orLFdZKOsR/ojxJUGqicCbk96G55E/g6zKgsl52skJZB5cPvTaxspFKe4HP4ohFfAva6LxxWfeMtnj9ZZRYuZvNf7q1Yrs32pl8orI6PYUruOCyAeGa9jhvedib+r2CZGSb9nFyDJMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199015)(6486002)(86362001)(478600001)(82960400001)(316002)(37006003)(6636002)(31686004)(5660300002)(6512007)(38100700002)(8676002)(4326008)(66476007)(66556008)(66946007)(6862004)(26005)(83380400001)(31696002)(2906002)(36756003)(186003)(8936002)(41300700001)(53546011)(6506007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0RyTmpEUXpybEZuY3lxV2tXaUJMYVhYSk5RNnVEblI5UUV2MWZzVXd3VHUv?=
 =?utf-8?B?L3hlalZvMHUyY2xicm54UlRRdU0vUm5nTzk5cURWemRHQkhDOEJudGxNTVhH?=
 =?utf-8?B?YVlsTVhjUGR4SjFiMjFUY0UxZTZaUVZ6RVE3OFVnME5kMTg3LytoQ3gwc3p6?=
 =?utf-8?B?YmVKczF1K1ZVUDdBQzNzdUtrWlk5TXR4djBITFU5OHBOTDF1TWVlY01DNWNm?=
 =?utf-8?B?Q3U4dG84a0IzcHB3TURRUHFPQTh3VmZUQ2hzZjlXOW1JQTIvTXVFQmlRUll4?=
 =?utf-8?B?Um9kOUx2Z3Q0WStVUGtOM3QzdUsyVHo5NzhseVJzSmtnQXRZQ3pYS3R4Mzk3?=
 =?utf-8?B?dkRYMGZHbEdLckprY0pIL1E5S2xTQTgvVWFZZUxZeXBRekR1K293MVptRXoz?=
 =?utf-8?B?QzdWUkY5OW8wTXA2d1FHUFM5ZUQrRXF4KzNsZmo1WDV1ZE9vMFR4YnlzZUUv?=
 =?utf-8?B?RmJLbnBPMmNwVlB0MXJlOS9Ra293RGhQVi9OSnhPSlMydlkwcXJYeXlmZkZ6?=
 =?utf-8?B?blA5ZVlEVFVIcmJNM0ZnTVdFQnkvdGVJUWhZdDI5VUpzeHM5WVdlTHRwbW5n?=
 =?utf-8?B?NEw1d0lCUDdZM1c5eVVhZ3RRSGtYVDh0bUlpcHBtdi9iUkVNUUhYNTdrMWpZ?=
 =?utf-8?B?TFE5TW9aaHUrdmpUT3l1bG5nQTU2bWg0cVlPMi9xZGhGK0ZtY092d1k3QWE2?=
 =?utf-8?B?MWhZUm5oamYwVW45Tzg2OEFPTmpzbm9EeGdZKzdUYVVKQUhON0VROUY3dGt2?=
 =?utf-8?B?dS95bWVKd3pvWlA3MmVtekMzb1l1VVhPQk90VXBPNVhDZnlRYVUzMms0ZmNO?=
 =?utf-8?B?MUtnNzhIbmZzS2xkTDE0cEFZTkpGWEJ1N2RlTXhCS1pKcGozbWFBcEVuTHdV?=
 =?utf-8?B?RFg0alFmV2dpd09FeFRyRnVpUEFYM05SVnBsaXFpbkRMZFdSb3M0UXlGVnlM?=
 =?utf-8?B?UTVlN2JScytEZmZvQUpacmp6ZDdtZDJDUGNEdDJDWWFQWmNjaTRjdWNhTWMr?=
 =?utf-8?B?UlNCN0ZMQlZhM2lrdXhNS1FZbnlHcThxaC96YnNEejFhMjlhSjdvZ3ZQY3lU?=
 =?utf-8?B?QXM2QXVVWk5CaWY5UDc4M2p5TzlPa2FaWFBwZllFY3NYVFZ3SWNSVVZ6Rytv?=
 =?utf-8?B?NDhyRUhTcy9ram13UlBraTNMQkE5SFFHYzUyTi9sK3Mza1JCMGFYbmNsNkQ5?=
 =?utf-8?B?eVpWbHgwa0c0YS91NW9ubE9jTFNwSXZKTWtNUVhuOFptdUl5TElxSHdobk1i?=
 =?utf-8?B?UmlqNnBpQmxneVpGZW85YkFIUHM0NmVZSmQvbkdMSEtIWWVHSzVqNzhBSGlr?=
 =?utf-8?B?Z0hlYXdPcGtqUTFadUV1NmJqRDdWTWlZaWJDOUlOK2MzaVFPUDNaaTduYXl0?=
 =?utf-8?B?M044cVUybi83M1BzWkRTVHVCZFhyaGZhQlVvZWxweC9aSGN0Ykl2bElIdXdM?=
 =?utf-8?B?WkVQWlZQWHA0Vnd1Vk0wcGkxS0xkd3hlRGRlSFNrMnJGMGY0cEIwazRyTVN4?=
 =?utf-8?B?RzdkcmV2UE41QmJRMU0zSUJxN05MMnY1TU5vckdEdEhrdUI0VVZxOEF3dFFH?=
 =?utf-8?B?RzdtUlRxSWYzOWdiRWt2bmMvR2xRbE5sMlFwanVkS1UyZmxqa3dxRllPME9Q?=
 =?utf-8?B?aWNWdiszM3BObkRsZStrRFM1T1dDNTBLejFkdTA3V0JtT3Q2dTlYVzdVWldU?=
 =?utf-8?B?WXB4NGl5OWJYRzljQitGaFBmSnJUTUlDQlFTZHZaN3QyQ3QvdFlEMWJSM3A3?=
 =?utf-8?B?eFJrTml1b3VhL2tEejBRZTNxOFhvVnlReWpkQjF5UkhWbWZmd0Jsd08wSkFh?=
 =?utf-8?B?d2FEMVhTVUgrQlRPNFJ6U2xVV3A3UVpIZlF0YUpvbHdQTjNQQWdCVEFFMkZM?=
 =?utf-8?B?bXIwbGd5aHMwQWs2ak1TTURFazBvNzUwNzNBdXNIYWVVK0NDbS8vQ1VLZmFn?=
 =?utf-8?B?NmpXZy9UT09VcURnT3Uvemt1eEw4cmEzdy9pNjRIZnludDZRbWx6bW1hZ3lu?=
 =?utf-8?B?dCtUSUduTDZoRjc3SWpkWFNXTWk4Mmdyd0llQk5YZmZKYk1OaHV1dmwrVjUz?=
 =?utf-8?B?Uy96SktlRWZzRzBxOWpWcHFJZGFwbXhFYml1SDJQNGpDSHJZeWt4WUVaeU9U?=
 =?utf-8?B?MU00TzA0QnBJc3k0ODNRd3ZydmVRYVpEZlFvcjU3a0d2Zy9OcGNMZDdMck5u?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d91c615-e13c-4e9e-ff7e-08dab39186a9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 18:24:43.8357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npDeWuRXgqv09NrnGLWAhIDkIOfRJ2ERaMzaEmC969EfvdJ43jCPoFzI0vTCvmPO215H+pv3+SvdoexOI5t9b64OMrCOTcfBWc3JaRkxjxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/20/2022 4:36 PM, Dixit, Ashutosh wrote:
> On Thu, 20 Oct 2022 13:16:00 -0700, Belgaumkar, Vinay wrote:
>> On 10/20/2022 11:33 AM, Dixit, Ashutosh wrote:
>>> On Wed, 19 Oct 2022 17:29:44 -0700, Vinay Belgaumkar wrote:
>>> Hi Vinay,
>>>
>>>> Waitboost (when SLPC is enabled) results in a H2G message. This can result
>>>> in thousands of messages during a stress test and fill up an already full
>>>> CTB. There is no need to request for RP0 if GuC is already requesting the
>>>> same.
>>> But how are we sure that the freq will remain at RP0 in the future (when
>>> the waiting request or any requests which are ahead execute)?
>>>
>>> In the current waitboost implementation, set_param is sent to GuC ahead of
>>> the waiting request to ensure that the freq would be max when this waiting
>>> request executed on the GPU and the freq is kept at max till this request
>>> retires (considering just one waiting request). How can we ensure this if
>>> we don't send the waitboost set_param to GuC?
>> There is no way to guarantee the frequency will remain at RP0 till the
>> request retires. As a theoretical example, lets say the request boosted
>> freq to RP0, but a user changed min freq using sysfs immediately after.
> That would be a bug. If waitboost is in progress and in the middle user
> changed min freq, I would expect the freq to revert to the new min only
> after the waitboost phase was over.

The problem here is that GuC is unaware of this "boosting" phenomenon. 
Setting the min_freq_softlimit as well to boost when we send a boost 
request might help with this issue.

>
> In any case, I am not referring to this case. Since FW controls the freq
> there is nothing preventing FW to change the freq unless we raise min to
> max which is what waitboost does.
Ok, so maybe the solution here is to check if min_softlimit is already 
at boost freq, as it tracks the min freq changes. That should take care 
of server parts automatically as well.
>
>> Waitboost is done by a pending request to "hurry" the current requests. If
>> GT is already at boost frequency, that purpose is served.
> FW can bring the freq down later before the waiting request is scheduled.
>> Also, host algorithm already has this optimization as well.
> Host turbo is different from SLPC. Host turbo controls the freq algorithm
> so it knows freq will not come down till it itself brings the freq
> down. Unlike SLPC where FW is controling the freq. Therefore host turbo
> doesn't ever need to do a MMIO read but only needs to refer to its own
> state (rps->cur_freq etc.).
True. Host algorithm has a periodic timer where it updates frequency. 
Here, it checks num_waiters and sets client_boost every time that is 
non-zero.
>>> I had assumed we'll do this optimization for server parts where min is
>>> already RP0 in which case we can completely disable waitboost. But this
>>> patch is something else.

Hopefully the softlimit changes above will help with client and server.

Thanks,

Vinay.

> Thanks.
> --
> Ashutosh
>
>>>> v2: Add the tracing back, and check requested freq
>>>> in the worker thread (Tvrtko)
>>>> v3: Check requested freq in dec_waiters as well
>>>>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_rps.c         |  3 +++
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 14 +++++++++++---
>>>>    2 files changed, 14 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> index fc23c562d9b2..18b75cf08d1b 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> @@ -1016,6 +1016,9 @@ void intel_rps_boost(struct i915_request *rq)
>>>> 		if (rps_uses_slpc(rps)) {
>>>> 			slpc = rps_to_slpc(rps);
>>>>
>>>> +			GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
>>>> +				 rq->fence.context, rq->fence.seqno);
>>>> +
>>>> 			/* Return if old value is non zero */
>>>> 			if (!atomic_fetch_inc(&slpc->num_waiters))
>>>> 				schedule_work(&slpc->boost_work);
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> index b7cdeec44bd3..9dbdbab1515a 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> @@ -227,14 +227,19 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>>>    static void slpc_boost_work(struct work_struct *work)
>>>>    {
>>>> 	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
>>>> +	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
>>>> 	int err;
>>>>
>>>> 	/*
>>>> 	 * Raise min freq to boost. It's possible that
>>>> 	 * this is greater than current max. But it will
>>>> 	 * certainly be limited by RP0. An error setting
>>>> -	 * the min param is not fatal.
>>>> +	 * the min param is not fatal. No need to boost
>>>> +	 * if we are already requesting it.
>>>> 	 */
>>>> +	if (intel_rps_get_requested_frequency(rps) == slpc->boost_freq)
>>>> +		return;
>>>> +
>>>> 	mutex_lock(&slpc->lock);
>>>> 	if (atomic_read(&slpc->num_waiters)) {
>>>> 		err = slpc_force_min_freq(slpc, slpc->boost_freq);
>>>> @@ -728,6 +733,7 @@ int intel_guc_slpc_set_boost_freq(struct intel_guc_slpc *slpc, u32 val)
>>>>
>>>>    void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
>>>>    {
>>>> +	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
>>>> 	/*
>>>> 	 * Return min back to the softlimit.
>>>> 	 * This is called during request retire,
>>>> @@ -735,8 +741,10 @@ void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
>>>> 	 * set_param fails.
>>>> 	 */
>>>> 	mutex_lock(&slpc->lock);
>>>> -	if (atomic_dec_and_test(&slpc->num_waiters))
>>>> -		slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
>>>> +	if (atomic_dec_and_test(&slpc->num_waiters)) {
>>>> +		if (intel_rps_get_requested_frequency(rps) != slpc->min_freq_softlimit)
>>>> +			slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
>>>> +	}
>>>> 	mutex_unlock(&slpc->lock);
>>>>    }
>>>>
>>>> --
>>>> 2.35.1
>>>>
