Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E29626344C7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BC310E481;
	Tue, 22 Nov 2022 19:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C0410E45B;
 Tue, 22 Nov 2022 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669146165; x=1700682165;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WaphyYv/HKGLheA9L4OgjjhggzWbP2ZvRzcmRbq7MJE=;
 b=S47FQ6jBWsvmknyLhEJqmx3oBgknfGLmRxvm6SQQKZfkOYjhdyhLtwn5
 7zmlWyOMfvsXTsdCCccUPtx0iMJBZxnaipz/fCnnWffmFT+21Ra3RoG/k
 7x831DlzrdyyfS36Dk4ohMzZm2RKR9vi/Lxp2dc3DxT6w1CimIpMujWaB
 M9w5k4nHq35eNlSTUIpkSSomfd1zLqZJh8F5LC/OLSinaznax1sQidfFM
 va2aDV+b/smQz/PSpXVHTc9h+xG5/7NEz4UF1dns2DD+brdRkxuMrA9h2
 cJp/tj2wo3Jd0kZfWBqZPTmJf4qqP7uuMJfH30mBW+eI16Q12R+O01lrm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="311528937"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="311528937"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 11:42:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="643838329"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="643838329"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 22 Nov 2022 11:42:45 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.13; Tue, 22 Nov 2022 11:42:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 11:42:44 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 11:42:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiDaNOWxvt+AmO4ASBTZsiUidtau6bLoErHX2ILnYp9/qxSkugI+EJI5L4bt/P5cImjUFzCbfV0owriUvbUdMWvS7fOI1olZQ1CudZVlJwXXCy6Zo+hCUbuijDyS3pE02qvFmvxy+ADmHPTB8ZeWNI7I1s8urNQEo54Knp6ymJ9hlpSYnIHrQn/DINdb/EAs1O6WCoY523e21F+x5tyAMVMmon4Ie3x9JHHYCkdATKuupbKpazrQ/LW8gHGbFMCTRbVE0IEQygo1Irk/vrX4tAkUghyBBbUWUf8ZVY670Ve54cw10/PkB4vg1M2oXWFp3sYZ7g3UYRmUxx4FPRyifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAMBzoPaWnAYwTr96ZNkOyAxHqNdHTxMXtmXVfQ3yVA=;
 b=WlnvNAnwG+K7ipISUwzfR/74CPRsyEiiL8+XwTGPQZwGToHeZ6DeY9rb1JYv+8OxSDPQHPTWXhhxx+Wmts4lUI3S1HrBdEQ9KBFSOmjoT/6uqF9oywzB44aiImYKcJvkZLjY9xz0YnP0kjN82W1s2NXDwKI8CHrWCrgVyl9lXGlmiKNy3SrxH35KcgVTUYcYAJTjTqR+T22lXSBtxkEfpbPQZvUpwLByfSMAv65KdZBFKltZzKHwITVFuieZgfgrdcKrFbsSlIG2s9knFhsoXl7Z+LcUGiScTjvyw3jzeNi+VqFU1U2l4iKF7i/GPeiPiinT+gwPVDJbtjQj/4K0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 19:42:42 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 19:42:42 +0000
Message-ID: <e27a9356-e09b-ed0d-8824-91b8dacfc945@intel.com>
Date: Tue, 22 Nov 2022 11:42:40 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915/uc: Introduce GSC FW
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-2-daniele.ceraolospurio@intel.com>
 <87fsebz7h9.fsf@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <87fsebz7h9.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ1PR11MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 094c857b-4134-4ade-d64f-08daccc1b890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y1+tP2Da+/E+74nr+zG71yAXvC9b+vb1WeGwFZNlaoiocTm9bpfs9h6q/TOO1warEG5s/+M2+GC6m3Swx2SKUs3AIEq86GoK4mBnDUNzvV1iy0hlyREyjZVWDXJSoTTuvmr0gkDwwNwTE5hXlaw/4BJlDQQp1XRvVoFJZmu/isF2hO/vQjapF8VHHzjyRBIZi85Lebk93wjMeh4hjTJPvYnPpOgT+XHn5T2s7l7fPFcNg2v/QJKyPBlgvzdEE6HHrokAaL2cKRg2ptILdmJpLotlOkckexUj7C4PcliCe7c5Ui9qhSkAjFtfY8EArZ4hBl08a9juQTxHeRNGTbTMOIiqtc69oUUpX6AgZhaKFISQkvR8PYi3OELic/LL2W6REtda8fhUYGSJzMgmRvtWPe2s5umw1ZCK3H8uAk9JWDXAsfKMV3TAdqG/Uke3zo1clPff2P39JO9Co/jpxmYuPyNOfYy6EPSMwQJJX6E5HpvwiEIY44ij+16Ppznau9viv0/Crkxbxm12nhvWad0uuesYg/lSNMqmjkmOhVkXyQ497xi2suTiWZlQvKkeWS72JWOFvVCLv6zdZ/+wIjM/vt5ceWd9HuTtSSlMMLbM2iosZnQfJcUf2JNykMvQL1vD+/YNkd+UM1aZjO3XTL5utQ2C2wngw/Fexzo19LFZKv+mJg1G4HUX2+9ptjsDKFfz1s5RyaowHZCgKCnx8RiG/kNiHzjIZV+ErRQJUxnGfIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199015)(82960400001)(8936002)(186003)(38100700002)(36756003)(5660300002)(86362001)(26005)(6506007)(53546011)(316002)(2616005)(41300700001)(31696002)(6512007)(4326008)(8676002)(66476007)(66556008)(66946007)(478600001)(31686004)(2906002)(83380400001)(30864003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWV1cnhWZ2FGT2RETi80b2tqYjQ0MHJOVjdiK2N2aWtaR0VhdHdqZ0pCYVBY?=
 =?utf-8?B?YlM5emRrdTNMOHJZQ1VaR3c2RTBpUEVsaXhUVmVzdG1JVmxqRk5jVHU3R2Qz?=
 =?utf-8?B?NUdyZS9qV0pNOWFTbkY5VWgxcndJK0l1aUkvQWhnc1V6aG9PVUdkVDVwOXhG?=
 =?utf-8?B?NFhoT0pUY0xEcll2eVdUSXU4U2FiQ01DNCtkUkVMVmJCVzRybFZUNTRnV2di?=
 =?utf-8?B?bFN5WDYyZC9WdEhyL0NMTmQxK1owa1EzYUlqdkpVMUJyTUc1MFFsOSs1YzZI?=
 =?utf-8?B?UjhhYU9IMzdCYnhWejVkdkdRMHErSHZJdm4zcW00NWU2S2FKSnFXbkg4T2ow?=
 =?utf-8?B?djhUeXp5VVJwcnh5NUJCN3JaWjBNYzBqN08xeFQ3YzJtcjluOGI4TUcveTBI?=
 =?utf-8?B?WXRWUmdFZE5ka1IxSXplV0dYbnh4NTIvMXNiNXVUaHJoaEl6K1UxMWd0bkx1?=
 =?utf-8?B?N1UrV2xqMk1BV0pkWE5FN3RtS2NYY2tJU2h3L01aYnBCbURZWUVtakxuNU1B?=
 =?utf-8?B?bjZla2ZrQ0M4VWJkOTF2YjdMWXVUamxQQ0Y2dE84ODdIY3pHRkovNmZFZFp0?=
 =?utf-8?B?Y1NyT3RTOXRXdk5Tbyt5ajNjenBneWpxSGJjVkJ6ZGtiOWFQSzhYeHArNlRT?=
 =?utf-8?B?VkdSWElXRHZvQjNIVVlxOHQwUno1T0pIUytvTE1QWVpHSDU4TGtHYTFXRWNl?=
 =?utf-8?B?eElPK25ScXlGRjVDSCtWamt4SXBvVGdueFlDTnRuNUM0TjMvTFBtakFWcG5Z?=
 =?utf-8?B?dThQbHpVTklpQ0dqNHJZd082S25oaVNGdmNad3pVSnViR1ZJTlg1bVlnZ0U2?=
 =?utf-8?B?VGRCRDFpWkMrV202elBZRUVBVDgzUmY4M1dSMmlMRml3OTV4TnZ6NWViWHA2?=
 =?utf-8?B?N0ptcW9HT2w1ekx0NDcxbWRzT2drYnpaTE5hOHBUcUhKdWV4cG9maWVDdnpG?=
 =?utf-8?B?eUEzL0ppMlZ0cUhJVGpJeTBML2kvSlN2ZE1xaTMwY2V4UWczOVc1cnFvdFZR?=
 =?utf-8?B?WG1CaFV4ZXRrTlVFODhsbHNJQmpsdWo4WCtpQ055Y0N4YzFscFRGYm4zL0Fs?=
 =?utf-8?B?V3JoK0Y1QVEvS2YvUFBzUHVhT0dldS8xS0kzVFVaa0hDTWdlNEZkZHQrVzdt?=
 =?utf-8?B?ZkxsVlZLS2s1UHBJS3BBZktjb2hrNkVyNXM2byt6Zll0eGx0OUtpQUlOU1Aw?=
 =?utf-8?B?SDNzeENrYWdhTGU4UUIra09CcUZYUk9IdW52b1loK3ExbC9kZngzSzh6YlpT?=
 =?utf-8?B?M2kzMXIzRitXeEM5VDlBK1dDQ1EvVmVGQ1Rla2tWTHhRYmtpR0wxNDZtZW44?=
 =?utf-8?B?MUJYeGFJUlVQamhtaXArVHltRlZJRktEbUhBUVpDZFh4d1FUY0ZuVW16ZXJH?=
 =?utf-8?B?NWxkM3k4UExiQ0JLZkEyUWh5Sk5XbDYxd0RWUkF4azZEbFVmVWliNUVwVE4z?=
 =?utf-8?B?amoxN1UweC9ING84Yk12KytGNzNQSFhtYWgvb2NUaVh6T3VHUGw1bW9MZkNL?=
 =?utf-8?B?dzhLa1Nxa05uOGF2emZFbjdjU0NwcjZqU01USDJ0dUx4NHU4anc5Zlp3aEdX?=
 =?utf-8?B?czduZmRiejlyTkp4SXkyMmR2YmcrN3hYMEljQzdKLzdyV0g5b3BmMnVQRHkw?=
 =?utf-8?B?L3JGUjczV1ZIcllLZjFESVpiV2JiN21LU3lrTUIvZ2hWUHpEM0VCTzJrMmhE?=
 =?utf-8?B?cVFsUjh2aVFLeXBEUDNsMk1ZWkFQWWhNRFgzeUU5RlhNODZmbUJkZEprcWEw?=
 =?utf-8?B?YitNQkx1VFRlVlpKUFZCSGFVOFp3NlFobTdmR3p5MUh0SXpqYzArWTRsQnpj?=
 =?utf-8?B?T0JpVU11a2k0M2hadURXaVpET0Q0RG1MY1I0ZFNNaElaaXdQbzhxTnpqZ2FF?=
 =?utf-8?B?UzI3TW1RUGtEYnd1NXNJbEsvcjhKMUJMYlBBdUZWMWZWSDRiYWVsQi9sWVBR?=
 =?utf-8?B?b3M5eHpMaFEwQ3lVcGxLUjhyaXJzMFN3VzdCcWFqaXdnWjRlaUU1WDBsbGxO?=
 =?utf-8?B?ekhYd1ozd0dJenJUTXdZVnJyaCtQMWdGWjdPaW9OaHlFdDdrSTFHNnBVZEhh?=
 =?utf-8?B?OEdiYmorVUd0ZnBUa29semlqTEU4QmJOUnhFWHJEZzU1MWk1Rk50OW16Y2Rh?=
 =?utf-8?B?NTRPTG44ZmNwQ0ZxdlYvSkl3aFo2TmxSbnAyOGRiai9MOHdQUWFhb1p2TWUx?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 094c857b-4134-4ade-d64f-08daccc1b890
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 19:42:42.5175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8x05J/7CxW3WbThHLUp+Zrg+VjAK1fHXnnOkBbIrermKDi4UuOLo164Ab0STQoNvKvvhFcBRzJuV7LaAPCUNC5BpnacD9HVOi89W/7JvKIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/2022 1:03 AM, Jani Nikula wrote:
> On Mon, 21 Nov 2022, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>> On MTL the GSC FW needs to be loaded on the media GT by the graphics
>> driver. We're going to treat it like a new uc_fw, so add the initial
>> defs and init/fini functions for it.
>>
>> Similarly to the other FWs, the GSC FW path can be overriden via
>> modparam. The modparam can also be used to disable the GSC FW loading by
>> setting it to an empty string.
>>
>> Note that the new structure has been called intel_gsc_uc to avoid
>> confusion with the existing intel_gsc, which instead represents the heci
>> gsc interfaces.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile             |  3 +-
>>   drivers/gpu/drm/i915/gt/intel_gt.h        |  5 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c | 70 +++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h | 36 ++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c     | 17 ++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h     |  3 +
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 25 +++++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  7 ++-
>>   drivers/gpu/drm/i915/i915_params.c        |  3 +
>>   drivers/gpu/drm/i915/i915_params.h        |  1 +
>>   10 files changed, 164 insertions(+), 6 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 01974b82d205..92d37cf71e16 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -205,7 +205,8 @@ i915-y += gt/uc/intel_uc.o \
>>   	  gt/uc/intel_guc_submission.o \
>>   	  gt/uc/intel_huc.o \
>>   	  gt/uc/intel_huc_debugfs.o \
>> -	  gt/uc/intel_huc_fw.o
>> +	  gt/uc/intel_huc_fw.o \
>> +	  gt/uc/intel_gsc_uc.o
> Comment near the top of the file:
>
> # Please keep these build lists sorted!

My bad, dumb mistake.

>
>>   
>>   # graphics system controller (GSC) support
>>   i915-y += gt/intel_gsc.o
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>> index e0365d556248..d2f4fbde5f9f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>> @@ -39,6 +39,11 @@ static inline struct intel_gt *huc_to_gt(struct intel_huc *huc)
>>   	return container_of(huc, struct intel_gt, uc.huc);
>>   }
>>   
>> +static inline struct intel_gt *gsc_uc_to_gt(struct intel_gsc_uc *gsc_uc)
>> +{
>> +	return container_of(gsc_uc, struct intel_gt, uc.gsc);
>> +}
>> +
>>   static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
>>   {
>>   	return container_of(gsc, struct intel_gt, gsc);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> new file mode 100644
>> index 000000000000..65cbf1ce9fa1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> @@ -0,0 +1,70 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +#include "gt/intel_gt.h"
>> +#include "intel_gsc_uc.h"
>> +#include "i915_drv.h"
>> +
>> +static bool gsc_engine_supported(struct intel_gt *gt)
>> +{
>> +	intel_engine_mask_t mask;
>> +
>> +	/*
>> +	 * We reach here from i915_driver_early_probe for the primary GT before
>> +	 * its engine mask is set, so we use the device info engine mask for it.
>> +	 * For other GTs we expect the GT-specific mask to be set before we
>> +	 * call this function.
>> +	 */
>> +	GEM_BUG_ON(!gt_is_root(gt) && !gt->info.engine_mask);
>> +
>> +	if (gt_is_root(gt))
>> +		mask = RUNTIME_INFO(gt->i915)->platform_engine_mask;
>> +	else
>> +		mask = gt->info.engine_mask;
>> +
>> +	return __HAS_ENGINE(mask, GSC0);
>> +}
>> +
>> +void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
>> +{
>> +	intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC);
>> +
>> +	/* we can arrive here from i915_driver_early_probe for primary
>> +	 * GT with it being not fully setup hence check device info's
>> +	 * engine mask
>> +	 */
>> +	if (!gsc_engine_supported(gsc_uc_to_gt(gsc))){
>> +		intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
>> +		return;
>> +	}
>> +}
>> +
>> +int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
>> +{
>> +	struct drm_i915_private *i915 = gsc_uc_to_gt(gsc)->i915;
>> +	int err;
>> +
>> +	err = intel_uc_fw_init(&gsc->fw);
>> +	if (err)
>> +		goto out;
>> +
>> +	intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOADABLE);
>> +
>> +	return 0;
>> +
>> +out:
>> +	i915_probe_error(i915, "failed with %d\n", err);
>> +	return err;
>> +}
>> +
>> +void intel_gsc_uc_fini(struct intel_gsc_uc *gsc)
>> +{
>> +	if (!intel_uc_fw_is_loadable(&gsc->fw))
>> +		return;
>> +
>> +	intel_uc_fw_fini(&gsc->fw);
>> +}
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> new file mode 100644
>> index 000000000000..ea2b1c0713b8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +#ifndef _INTEL_GSC_UC_H_
>> +#define _INTEL_GSC_UC_H_
>> +
>> +#include "intel_uc_fw.h"
>> +
>> +struct intel_gsc_uc {
>> +	/* Generic uC firmware management */
>> +	struct intel_uc_fw fw;
>> +};
>> +
>> +void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc);
>> +int intel_gsc_uc_init(struct intel_gsc_uc *gsc);
>> +void intel_gsc_uc_fini(struct intel_gsc_uc *gsc);
>> +
>> +static inline bool intel_gsc_uc_is_supported(struct intel_gsc_uc *gsc)
>> +{
>> +	return intel_uc_fw_is_supported(&gsc->fw);
>> +}
>> +
>> +static inline bool intel_gsc_uc_is_wanted(struct intel_gsc_uc *gsc)
>> +{
>> +	return intel_uc_fw_is_enabled(&gsc->fw);
>> +}
>> +
>> +static inline bool intel_gsc_uc_is_used(struct intel_gsc_uc *gsc)
>> +{
>> +	GEM_BUG_ON(__intel_uc_fw_status(&gsc->fw) == INTEL_UC_FIRMWARE_SELECTED);
>> +	return intel_uc_fw_is_available(&gsc->fw);
>> +}
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 1d28286e6f06..622935770aa1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include "gt/intel_gt.h"
>>   #include "gt/intel_reset.h"
>> +#include "intel_gsc_uc.h"
>>   #include "intel_guc.h"
>>   #include "intel_guc_ads.h"
>>   #include "intel_guc_submission.h"
>> @@ -126,6 +127,7 @@ void intel_uc_init_early(struct intel_uc *uc)
>>   
>>   	intel_guc_init_early(&uc->guc);
>>   	intel_huc_init_early(&uc->huc);
>> +	intel_gsc_uc_init_early(&uc->gsc);
>>   
>>   	__confirm_options(uc);
>>   
>> @@ -296,15 +298,26 @@ static void __uc_fetch_firmwares(struct intel_uc *uc)
>>   						  INTEL_UC_FIRMWARE_ERROR);
>>   		}
>>   
>> +		if (intel_uc_wants_gsc_uc(uc)) {
>> +			drm_dbg(&uc_to_gt(uc)->i915->drm,
>> +				"Failed to fetch GuC: %d disabling GSC\n", err);
>> +			intel_uc_fw_change_status(&uc->gsc.fw,
>> +						  INTEL_UC_FIRMWARE_ERROR);
>> +		}
>> +
>>   		return;
>>   	}
>>   
>>   	if (intel_uc_wants_huc(uc))
>>   		intel_uc_fw_fetch(&uc->huc.fw);
>> +
>> +	if (intel_uc_wants_gsc_uc(uc))
>> +		intel_uc_fw_fetch(&uc->gsc.fw);
>>   }
>>   
>>   static void __uc_cleanup_firmwares(struct intel_uc *uc)
>>   {
>> +	intel_uc_fw_cleanup_fetch(&uc->gsc.fw);
>>   	intel_uc_fw_cleanup_fetch(&uc->huc.fw);
>>   	intel_uc_fw_cleanup_fetch(&uc->guc.fw);
>>   }
>> @@ -330,11 +343,15 @@ static int __uc_init(struct intel_uc *uc)
>>   	if (intel_uc_uses_huc(uc))
>>   		intel_huc_init(huc);
>>   
>> +	if (intel_uc_uses_gsc_uc(uc))
>> +		intel_gsc_uc_init(&uc->gsc);
>> +
>>   	return 0;
>>   }
>>   
>>   static void __uc_fini(struct intel_uc *uc)
>>   {
>> +	intel_gsc_uc_fini(&uc->gsc);
>>   	intel_huc_fini(&uc->huc);
>>   	intel_guc_fini(&uc->guc);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> index a8f38c2c60e2..5d0f1bcc381e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> @@ -6,6 +6,7 @@
>>   #ifndef _INTEL_UC_H_
>>   #define _INTEL_UC_H_
>>   
>> +#include "intel_gsc_uc.h"
> And thus intel_gsc_uc.h becomes another file that causes the entire
> driver to be rebuilt when modified.
>
> *sad trombone*

I just followed the same pattern as what is done for GuC and HuC files. 
What's the recommendation here? Should I split out gsc_uc_types.h from 
gsc_uc.h ?

Daniele

>>   #include "intel_guc.h"
>>   #include "intel_guc_rc.h"
>>   #include "intel_guc_submission.h"
>> @@ -27,6 +28,7 @@ struct intel_uc_ops {
>>   
>>   struct intel_uc {
>>   	struct intel_uc_ops const *ops;
>> +	struct intel_gsc_uc gsc;
>>   	struct intel_guc guc;
>>   	struct intel_huc huc;
>>   
>> @@ -87,6 +89,7 @@ uc_state_checkers(huc, huc);
>>   uc_state_checkers(guc, guc_submission);
>>   uc_state_checkers(guc, guc_slpc);
>>   uc_state_checkers(guc, guc_rc);
>> +uc_state_checkers(gsc, gsc_uc);
>>   
>>   #undef uc_state_checkers
>>   #undef __uc_state_checker
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 0c80ba51a4bd..5b2e4503aee7 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -19,11 +19,18 @@
>>   static inline struct intel_gt *
>>   ____uc_fw_to_gt(struct intel_uc_fw *uc_fw, enum intel_uc_fw_type type)
>>   {
>> -	if (type == INTEL_UC_FW_TYPE_GUC)
>> +	GEM_BUG_ON(type >= INTEL_UC_FW_NUM_TYPES);
>> +
>> +	switch (type) {
>> +	case INTEL_UC_FW_TYPE_GUC:
>>   		return container_of(uc_fw, struct intel_gt, uc.guc.fw);
>> +	case INTEL_UC_FW_TYPE_HUC:
>> +		return container_of(uc_fw, struct intel_gt, uc.huc.fw);
>> +	case INTEL_UC_FW_TYPE_GSC:
>> +		return container_of(uc_fw, struct intel_gt, uc.gsc.fw);
>> +	}
>>   
>> -	GEM_BUG_ON(type != INTEL_UC_FW_TYPE_HUC);
>> -	return container_of(uc_fw, struct intel_gt, uc.huc.fw);
>> +	return NULL;
>>   }
>>   
>>   static inline struct intel_gt *__uc_fw_to_gt(struct intel_uc_fw *uc_fw)
>> @@ -246,6 +253,10 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>>   	int i;
>>   	bool found;
>>   
>> +	/* FW is not defined until all the support is in place */
>> +	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
>> +		return;
>> +
>>   	/*
>>   	 * The only difference between the ADL GuC FWs is the HWConfig support.
>>   	 * ADL-N does not support HWConfig, so we should use the same binary as
>> @@ -374,6 +385,11 @@ static const char *__override_huc_firmware_path(struct drm_i915_private *i915)
>>   	return "";
>>   }
>>   
>> +static const char *__override_gsc_firmware_path(struct drm_i915_private *i915)
>> +{
>> +	return i915->params.gsc_firmware_path;
>> +}
>> +
>>   static void __uc_fw_user_override(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>>   {
>>   	const char *path = NULL;
>> @@ -385,6 +401,9 @@ static void __uc_fw_user_override(struct drm_i915_private *i915, struct intel_uc
>>   	case INTEL_UC_FW_TYPE_HUC:
>>   		path = __override_huc_firmware_path(i915);
>>   		break;
>> +	case INTEL_UC_FW_TYPE_GSC:
>> +		path = __override_gsc_firmware_path(i915);
>> +		break;
>>   	}
>>   
>>   	if (unlikely(path)) {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index bc898ba5355d..5d2a8965a592 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> @@ -61,9 +61,10 @@ enum intel_uc_fw_status {
>>   
>>   enum intel_uc_fw_type {
>>   	INTEL_UC_FW_TYPE_GUC = 0,
>> -	INTEL_UC_FW_TYPE_HUC
>> +	INTEL_UC_FW_TYPE_HUC,
>> +	INTEL_UC_FW_TYPE_GSC,
>>   };
>> -#define INTEL_UC_FW_NUM_TYPES 2
>> +#define INTEL_UC_FW_NUM_TYPES 3
>>   
>>   /*
>>    * The firmware build process will generate a version header file with major and
>> @@ -205,6 +206,8 @@ static inline const char *intel_uc_fw_type_repr(enum intel_uc_fw_type type)
>>   		return "GuC";
>>   	case INTEL_UC_FW_TYPE_HUC:
>>   		return "HuC";
>> +	case INTEL_UC_FW_TYPE_GSC:
>> +		return "GSC";
>>   	}
>>   	return "uC";
>>   }
>> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
>> index d1e4d528cb17..61578f2860cd 100644
>> --- a/drivers/gpu/drm/i915/i915_params.c
>> +++ b/drivers/gpu/drm/i915/i915_params.c
>> @@ -192,6 +192,9 @@ i915_param_named_unsafe(huc_firmware_path, charp, 0400,
>>   i915_param_named_unsafe(dmc_firmware_path, charp, 0400,
>>   	"DMC firmware path to use instead of the default one");
>>   
>> +i915_param_named_unsafe(gsc_firmware_path, charp, 0400,
>> +	"GSC firmware path to use instead of the default one");
>> +
>>   i915_param_named_unsafe(enable_dp_mst, bool, 0400,
>>   	"Enable multi-stream transport (MST) for new DisplayPort sinks. (default: true)");
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
>> index 2733cb6cfe09..3f51f90145b6 100644
>> --- a/drivers/gpu/drm/i915/i915_params.h
>> +++ b/drivers/gpu/drm/i915/i915_params.h
>> @@ -64,6 +64,7 @@ struct drm_printer;
>>   	param(char *, guc_firmware_path, NULL, 0400) \
>>   	param(char *, huc_firmware_path, NULL, 0400) \
>>   	param(char *, dmc_firmware_path, NULL, 0400) \
>> +	param(char *, gsc_firmware_path, NULL, 0400) \
>>   	param(bool, memtest, false, 0400) \
>>   	param(int, mmio_debug, -IS_ENABLED(CONFIG_DRM_I915_DEBUG_MMIO), 0600) \
>>   	param(int, edp_vswing, 0, 0400) \

