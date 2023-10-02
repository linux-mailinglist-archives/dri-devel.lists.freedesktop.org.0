Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4835B7B5569
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 16:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050BC10E2CD;
	Mon,  2 Oct 2023 14:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5698A10E2CE;
 Mon,  2 Oct 2023 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696257901; x=1727793901;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CFn5cWNzJedkHgbNy8r6VeSpik9BqN+Mq2NZiDUnB8U=;
 b=F0fMJBMbhfFO8QqvCtFHcsBRvpO+/X0qzWWiAwP24cQ5M3WKkHb8QUeb
 AAEeXD2sbt4TZz6BPkLQWMi+/LJLTJnMn24g0jeQcHQ5XXyK/sed1izhd
 W3tAFR09OvvLd1r8rItE6a9M+n7wBBWlZ8Ux95BAzPQNzSUpmPk4Z5QkI
 uviEZjQTV1cTfOaH1ARmK6hP7tBGfnnWZ5V5bHOIicBfEyOt3P/EWAKpo
 jUFCwvDQr4k6bUxjws8RMov0zlwKBYsESuCD2hnBgJJtqoRPdvpBwqWHh
 tEos1INpVJPjZcCKrMrU/MmEo7DbS1/KIAz4Wg94tRfhWZ2hQaDlC649Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367711460"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="367711460"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:45:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="727280922"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="727280922"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 07:45:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 07:44:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 07:44:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 07:44:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 07:44:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq341spFU4fTUu7yyampEKktc1Ay0QZpxkaq/e6BWIbSmHxJHDAvqfABLteK8tce/xcBoxfDsl2MKmo/kTHDXJjPOetHzxWMC87h9qSme7ywkA/utIfF1IaxGvrU08OuhkRfWS0+eLYHwXmwbzkeb/5pONIOinopJTayyTIDwuRnppeeE1OCahDo5ZV110g0Br1nmMs9aeTQeV/I7m9UghVExQ+A2oOkdJonrjLjsTAU7WXv7okAM7BgKtOz+pmUzrHPbxvQJCl9eyK0BNWZL0k/WMpMAYSJ7yEg5Pogmcl+3mxVkyp6u3ceE0bIgqgtD1wRcaDtl2ko3M13dz49NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFn5cWNzJedkHgbNy8r6VeSpik9BqN+Mq2NZiDUnB8U=;
 b=V5sGtRCa0DGiUgZahObxh46VdXwzueDS6V4yl9oyx1aBlGaQ8Qwf6ptlNyJrMx3k1WDY8omJ9m7cf1kLk8ReLeZkEe/4tnR2X/v8WW53bQC/DXBdP8g3HP9f8NGRDD7hY0BYVX0Za/3pLsahIi/dYTj5EOe1BK1jIYmpigXiP0fv3TKxufBw8xHvNbFOWDgKgYDXpCNjOxWC9i+fyh4KPldW1j2S/Se3Zx1ZlRM55I5QS0kZ8/A90U7k2DcDOoc+oiD908EMWgZ7HzHkbbciBQGZdn9xhRH08sW/JBB5ov1ynbQshHbrFQ2+1TtXtzus+aUGxwz5wBCQrIT/ETu3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.39; Mon, 2 Oct
 2023 14:44:57 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%7]) with mapi id 15.20.6838.027; Mon, 2 Oct 2023
 14:44:57 +0000
Message-ID: <1ded6cc3-fa1d-4731-8400-e2e98be78c4c@intel.com>
Date: Mon, 2 Oct 2023 16:44:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/i915: Invalidate all GTs in flush_tlb_invalidate()
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231002122032.23703-1-nirmoy.das@intel.com>
 <ZRrJdzaUF9X967Ig@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZRrJdzaUF9X967Ig@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0131.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::16) To BYAPR11MB2966.namprd11.prod.outlook.com
 (2603:10b6:a03:84::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|SN7PR11MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: a31677f5-60b7-4687-ce92-08dbc35624af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GrueiNmluHGaelqTm5L+ydkZcE0jCekfGD6Any9SYldNs7VRl+//PMomw9x/QDjOutVkez/z4h3ve68UF5w3FTxwtVkk4OrBYsdl6eox+Fp98xlWLu8XbI4PfA/GteirXOW8Czme7XdxPrp0S095UX2dxp6Vv4YEmEtGA/bXjJHWfsut7D+XP++jpQLYmypo5PS8uzVr/pa7vNzhE0D4ad2aQ7/izztuSyuYZiYyEb94jWZ1Ugu9VrlpkYagVVCZokymZNs+nF4FPxx+Tuigew6dUYm2Gpr/JQpSxT3s5veSOx/vEXhXeUPFIDf+BHGDxxI4vKxLdl5IpuWWjHGcPKtqZtk+jRUUgj/9gBUWwyQn59MBlVY+aK3mtPyZaN6xu2Y1j/RTBXKKpl2+1tu/hT925GwAJKot2RAMeuqJKvO5XT3JQ89IRmrm918BZULYIiJW9xohNN0vLemMaXV3zhdR99DsNmjtCl3H40AexLQOaAl2py+3HMCGno8QcekVhK9Z+i9LV/AfRXA4bf8PP++Q+47LSX7gW17UN5S4qX0oLEpS5jGv29THuEY/LzJrwsijF9c7j17I+vu2kE0UfgZuWkFBQ1Zkn86vFQl28wapYnaRuDoU2EtDO6bgDE57
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(31686004)(6506007)(53546011)(6512007)(2616005)(6486002)(36756003)(86362001)(31696002)(82960400001)(2906002)(8936002)(7416002)(6666004)(83380400001)(966005)(478600001)(26005)(8676002)(54906003)(66476007)(41300700001)(66556008)(38100700002)(4326008)(44832011)(5660300002)(316002)(66946007)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnNtMCtjdzhPWlhTejFKazFrVjMyN1RZdVJGbWFkcXBiakc1cWZKM3hKK2RG?=
 =?utf-8?B?WlZkRjM4SUZFZk1OVFlLcDVGOGJYQlZIVnArVWdxMHhXMUVZbEVtckFpSmdz?=
 =?utf-8?B?Y2ZMd2FLalhkRnc2N21QbTVkckpPVlpQbzY4N2VsY3VtaU9Ka2J6NytXdWtB?=
 =?utf-8?B?Vk1MNVVFSGtCcDZyaFE5aDh0TTBlc3FYenVVcVhEdG9ib1h4MFlvV1JNaVJx?=
 =?utf-8?B?QVJOVjVNb1pUUkdTaHA0UC8yQlkvZWpXU0R2QWZzNWdRbzZjWDJ1RVlnZEdl?=
 =?utf-8?B?U04vVmVFQ2tqeTJaMUMrbkJVRHZhWVVvL0taUElqK0ZtQTBORFR5Tk9qMnhj?=
 =?utf-8?B?T3JJYUdFRWc5SHRBZ0x6ajJTQkt2QUF2YXUvUE9RQ1RiZHFpcTRlSk9MUUtL?=
 =?utf-8?B?MnZVa1l5Nmk2U0pyMUQ4NUdUZ29vYXJzaGpRYjRxTnpxeU53TXd3bHJWWUc1?=
 =?utf-8?B?S0hQSXRiT0FqeW1leWVxcHRheGIrYi9UTFVHZkhRQjJ5MlEvcnZtbzVRNXUw?=
 =?utf-8?B?cUpzVVlvbDlCREdWRUNOcFE4NE9DdWlRbkhkeDNxUVUra2lVUFNvM1VZdHdP?=
 =?utf-8?B?dzBWL295UUZXYkxITjJlaEVKR3dBdmE1NEx4YStZVWs0VGwwdnc2TE40a0NO?=
 =?utf-8?B?TEZTbUVqRWlvYk5kaVFRNXJHOGxHVmI5U2hxYURVYmVGczlTTGtUblFsK1Z3?=
 =?utf-8?B?d3JuOEptaE5hTnFkbXZoQUdFeHU1N2FwTlVSUmwvci9qZEJQNUVJWW5UNmhi?=
 =?utf-8?B?OVhtY05VZ2MwVkVtbFM0Tmtqb1ZJelhTVjFUeXBzRE82dVNBOHJoM0tZL2Nn?=
 =?utf-8?B?SFdXVENTaEFuajhkejBLOC9PdmpBWUlmRWFLL0RObjA0cklHV3A1cCtXNFov?=
 =?utf-8?B?eWRWVzNlUTNpSnFIblhzZVVDWGlzMjM1TzVXb0pCSi94UGx0OEUrRDZqQTVz?=
 =?utf-8?B?cEN5cWhnejNSOEhmMWxiaVFwby8xWUlGaGtzc3hYbFVKbldZanNHTUsrMlZS?=
 =?utf-8?B?dEU3TEZhUm8rVHBmVTFMVWpVTTIyT2phL2F1V09HTUpzNlVLZHlKdUdTMUpR?=
 =?utf-8?B?N1RSS1pPemZxMlF2enRoNEx0Yjg2eGhhSTBGQTFMY09DMklYb3duUEp0bkFs?=
 =?utf-8?B?enA3ZFRKbHpCSmFlOGFiMEU0SjR6Z09pa3RDN21JT0M2RjNBWTNPaUg4WGRX?=
 =?utf-8?B?WmRNbEZvTnlHb2Uvb1hnUHhBUUMybXJQcktCZ3Q3TThkc0UycEkwd1RPdkFl?=
 =?utf-8?B?dkJJSWc5Ukc4TkllT0sxTkpTbktZV0tId3lubTRITERoN0Eza1pIVnNHS05r?=
 =?utf-8?B?QUJKMTNhRHBWQU5Qa1Q4YUtmb2JoSkdzNXBKenJFTkdJME53cjkzZWR1dTZz?=
 =?utf-8?B?b2szaGJVUHR6b3dtWXZkUklPdmZhSUNJUHdIZWxvYXp3VzVPRmFaTnZQTzh2?=
 =?utf-8?B?UEFYTWl2VkVDUDh5TzBvMTNIN05ya2ZQVnM4S0J3YUw2V2RxaVVwVHNEUkxL?=
 =?utf-8?B?YXlPM2c2S3FhM0xEU25kU0sxUlR5b3Nhem5scmhvYUprTXBjL3J5U1lyZHlS?=
 =?utf-8?B?ODRTTmhyS2FpT0lpME9sdUVvYjE2dFJhMWhHT1RmM1VYRnk0MjNROG1YeGtM?=
 =?utf-8?B?eTNFWnc0TkEwTlVpcjROL0tHTU9pS1VSYWI3bmxOUXVIbUFRZlZYTFhWaEM5?=
 =?utf-8?B?aVk4b3ZFbHdlWFZ0VmZDZVFhSE9zS3Vub3BGMXpnK1M4L2JvdkpObkppUHZv?=
 =?utf-8?B?OVMxemZXVE5td2k1N0E3NGJaUDNvelZKZkF6R2RycHowNGJDUUlQQnAvYzdP?=
 =?utf-8?B?S1dGY3dybnlORW9iWFJDeGNjQy9acVllYmczd3JyUENGZDVGS0lhNHQ1aE05?=
 =?utf-8?B?K3ppL2Mzb2llaFZQeE5seEhMcSsyS0wyWlRFa2VFQjNpeTJqdURBb2FOZlI1?=
 =?utf-8?B?TjBsUFFOQmdWYitvOElNc0xHYis5TmY0UUFBL0pLWllpc2NkZWFRSGNBRzND?=
 =?utf-8?B?QmRycVY3ZXNrRnF6MS9uTEd6aG9vckNlTGJiNzI4SEEyY2tYbVQvdUhjdUZX?=
 =?utf-8?B?ek5qcDllWG9Id2JTS3pldWozSHhxT2x5bkxERFN5cnBwdTh4SGlFTklxNE5i?=
 =?utf-8?Q?w7SeDRDVQeoN59b43MqJbq2lV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a31677f5-60b7-4687-ce92-08dbc35624af
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 14:44:57.0006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxlesEysUCdd0IrwMFzLNHn3JLKFMGiUkQ6dCUTAKNBthO1LvM2LZD98XbOCgC4wW8TpWCpwj0j5MNNh1Ldhcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org,
 Fei Yang <fei.yang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 10/2/2023 3:45 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Mon, Oct 02, 2023 at 02:20:32PM +0200, Nirmoy Das wrote:
>> Don't return early if one of the GT doesn't require
>> any flushing.
>>
>> Fixes: d6c531ab4820 ("drm/i915: Invalidate the TLBs on each GT")
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Fei Yang <fei.yang@intel.com>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> This patch has been sent already here:
>
> https://patchwork.freedesktop.org/patch/560309/?series=124472&rev=1
>
> Can we take it from there?

Missed it. Sure,  works for me.


Thanks,

Nirmoy

>
> Andi
