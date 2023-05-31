Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F1771724D
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488FB10E463;
	Wed, 31 May 2023 00:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4FC10E459;
 Wed, 31 May 2023 00:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685491903; x=1717027903;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jHTfXwFs48TxfJcLCeobxVtol1mH3cOwrCP/9JtYlaI=;
 b=iM30Aq5U3djWnJjshdxfqf+C7kAiwoHYDCJDGEthxBaUxDBTK43DhrPO
 ZNBCoBXNlbT9+SO9i2Uo09N9kVBQtUUIlhONFsHzhTw+VUAyIYaSg7/1O
 C2K798coE+8Sxh4rEDyU/XTJXQGxjdC/u2Sp73NuKKscCUB9wbg3wB+Ez
 z0mMVIEhvq8DVHfOVxspPBrE5X+Rgw5M3pyCw5u7yQp6aItr5pcyF2KkW
 aZrcFTLwayprUPsIbTOMR41BPpV829y5pMw9H0Yg7FWGgtJSamvWNdX0b
 bXDO5XjiEYp9bop7F28Mt17Ku7y3LTeKCAk1VBRM2AloLNVL+pwZ/Ioxl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383344767"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383344767"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 17:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="771773440"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="771773440"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 30 May 2023 17:11:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:11:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 17:11:41 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 17:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6nK9Mms9iQ53R5A1Bp9wfADsFdHyAlVo04xBRV6WlR/2iqUUb5x/wOMb6Cwrvp5V77SgH2ORcoFpUm0d3fgpMESGXRgEPp1v0DKWZRwwkLIYcs8dJrJUVwLgMamg4oXc9hUS8y8/BCqKAqpM2bLoeuoe5zigFmN1bvoe4cO/YJpq7jSoRcwTgtp1puOfWYL9RotR0qNxqGU9jIjdt2YyQSmacXtfLf290tkiP8xXioA4kKD55pxAkhK81uF2EzvznQpx807TExff/XLNPVxTgwsIoX8scg2i1nuKwhP29ODyL3VBP8+jhvkywz1wxdi7zkYJlcZDI4czXk1F8oc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsiDw/qm+idUHG2iz27+LO0UMLBcTDpD/gpimO8VkGI=;
 b=SIn4B9Ub8RTsjw3IRxTazldvp8796MD+vU79jVqV7wotn8y2yJLgdOtYQ1tmQUH74snatvmuwRAbVajFI9uL7orH2cOC8nuFUB6xa4HkqX/yG38HlfJF3lzPhZp37Ikmvi5VyaICJsmU/0shfzP9aDW9/mc6ZmcjKbakGjO0dF0O0/vGh+xmp0zeFrVd1iFsF13P0slr80SOWVPppcxOF3oI50IPjnSiXmh175+mfSdvk7wEnAaiGEY/DVJ5aG4fnpZcaiYuKm0lI20S1C30SpIdZMp/cvO3EsShOaY5e6HLJ2bIhlymqT2CZ1K0Cop23SVYTTcE8lgS7ZHb3d82wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA0PR11MB4526.namprd11.prod.outlook.com (2603:10b6:806:96::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 00:11:39 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 00:11:39 +0000
Message-ID: <ebce68b1-5b91-63ee-9844-df86b3d71344@intel.com>
Date: Tue, 30 May 2023 17:11:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/7] drm/i915/huc: Parse the GSC-enabled HuC binary
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
 <20230527005242.1346093-3-daniele.ceraolospurio@intel.com>
 <f4cd5240-ba88-8b7b-167c-81d90be88c52@intel.com>
 <ed576336-7b56-efa2-5355-f49001995182@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ed576336-7b56-efa2-5355-f49001995182@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:a03:60::47) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA0PR11MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: 205a8e82-b001-4425-161f-08db616b9ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PWlrfXpEsClL51B60nnAtkXRq6GQ9ygqote6mdtcQBOneIyY1lgebcsG0RUKiPQ8l/ZrVQMq2IhgsMrzTsG6P+uXxIw9rIee2jTWUKlNE11WkRPu95PdniIiTIFPvQGiTScvCrDsAuUrnuyrywjs4KmGSedIgOjYXtu3NN+5soTDhVf7L2eGa0cof2jzvP1BzOY7UEO/uIvUlbZN0t73mCypK2XKabHF6PnYgj5Wvo/rFNuHIwNADVl2+fBiS7+t8HetO6oWJ84nO+WU7MAIllbYOuiJt0ZKNulNV2Sb76RzUHnQYfDx2qjhzbVdtpHipm67BiGggfAdRWl1Z+4C5ViTj5/SRLXG5uqNhZNul/JyeYM91uoTZLPPPfsPMEHEcWSgxlEl75VJ4kqZeEWMwdWnV+q8u1Bs7SEkRsGnZRII3AL+jGy6rZn5Dc8Gi7XJwvoDtjwn0z+IlQGq0ThlG7xtx1scLcKwC487jKWuMXfyskze5a8ceWBnOpid+klusrN4puYKsNUyw4IGn5R3xDHGCvMV7AaHcyiRGGF6MCb7mTrWhavTQVVZgfpkNvxOdkdA0GLFqa4FOJ+lCYMCHMXVr5sCNQ7uUGlpBD4wn1X/6lBe9Q8MA1U3VHkQfhcx7Z5yFLQfDABMh5e+3Mo3wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(186003)(6512007)(6506007)(53546011)(2906002)(30864003)(2616005)(36756003)(83380400001)(4326008)(316002)(6666004)(66556008)(66476007)(450100002)(66946007)(41300700001)(6486002)(478600001)(82960400001)(38100700002)(31686004)(107886003)(31696002)(26005)(8676002)(5660300002)(86362001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXNBREc2SnNqN2VraGxVWFBPTGl1Y0RhTTc4VU13ZEFqMXRCUHo5ME94S0FO?=
 =?utf-8?B?YnUwNFgrekhQbUkwMEczUDZlczJwa3lkd3FlYU8vak96Q2o4dVhyN0FubE9I?=
 =?utf-8?B?cE5CWFRiNkMrWmZvcTFnTXJFamJMRG1HZDB1WG40eUtjMEZMSFFSNUlQaGxF?=
 =?utf-8?B?YkwvL1Q2WFdST1hqWURhNXZYMVU0bHpnejZWRnlqRm1qNnh5YWt3Vld0VjUv?=
 =?utf-8?B?bFFlUTJOU1JIV1MyMFh5U3VFOGlyL09DcXNmRmozcFVsb0tGVHo1UXBzYUtv?=
 =?utf-8?B?c2pQb1ovZFNDaVY0YUREbmwyWERyODZ0Qi91WFhweWRpUDhTYkdwempKSE8w?=
 =?utf-8?B?L1ZrTnJIcVNWU0t0NVhia2Y4TjNFeGxtSk5CdkNPR3d6YTZTQUxOUjNJR1lU?=
 =?utf-8?B?MWFhdTF5bTdLc1lYQVYvRkFsTHZ1Q3RzMnJpTXozWUtPNGhwUGxPaWVsWUxH?=
 =?utf-8?B?T0M4NEY0ZWR1ZjdZYTRVbFRXNGY4ZmF2NWIwRUZEU3NkaE8vbitUWDhjWlZs?=
 =?utf-8?B?cVNJSHdEWVZYOEtKV1NQK0g1aE03alVBeVVlZko0dm1aWHRIWHlqS3I0VjFS?=
 =?utf-8?B?c3BUNGtsdXNlNitaY0o0b2VzRmZqU2hlMUM5NmI2TlUzUXlWdllOVkhncTg3?=
 =?utf-8?B?RUVMdTJoTjdOeTIyams5VDQ1SERnUTJ2UkZXQkhpcmhoQ24yTFJCckRhYmU1?=
 =?utf-8?B?NWc1U3dHRzF0SmFuTFg0V1hmMFQ4L2ZGVFZPZks2c2FtYW4ydGh1dllBTGVh?=
 =?utf-8?B?SW9tQ2lyUkFadVJBd1BCS2c0QzJHV2ZLZk45QXRCL2pYVTRjYTg2ZVdNZmZu?=
 =?utf-8?B?UzJ1OE92UWFQcjh1dXVjNC9lUUZvSU1zNnM4MitTU01RN2Q0TlFJMXlCVjVu?=
 =?utf-8?B?TGZmVHNOM2NCcm9Xc2czZlhFQW02eHRMWG9iZHlxZ1ZhTDdzdDcyenB1SVZP?=
 =?utf-8?B?clZnWThXRE9ETjBGZDRNODUvT1ZJcFEvY21Xa3dZaFFFRk5UMHVndGdyWmFF?=
 =?utf-8?B?ek1wOFpEZjZnY3UzZlQ3MmJMOWRkKzY5SUUzOUZKTm9JOHl0WThNVjdxZXJ5?=
 =?utf-8?B?anJVZ2RZUW5tNUFBZklYOEJJaWJWRGViYzYrODVxL1VnU25SZUJ4ZC9kaHdO?=
 =?utf-8?B?dVh0K3NFeFBCVTFDSXhNRWtnMm1STmJzOTVYOWNHNWliMzlQMHlDdlRnT2o2?=
 =?utf-8?B?VHRrVHI0R0xweXJsNU16ek1uMnZ2M3NFREswZXR0dWZvYzFndWtCRXhyQnh6?=
 =?utf-8?B?OWR1b2JpQ2t5c3EyVWxJUGNBeEE5TWlYZUJLR3k3YjlOT0E2SmcvUENOOFIy?=
 =?utf-8?B?NkpVSjhyczdodEFaZTI4dEN1b1N1Nm5hcHh3RWJxMmdiRDNTY0pRUnNFTUNw?=
 =?utf-8?B?MzdGeUZVUkU3bVFPRU9NcGVWbmlmckgzalVOTENKcVhRQWNwZlhnOFdPMVY0?=
 =?utf-8?B?ckwxOTd0TVRJNWpTV0JhKzVTbkpJbDBlbmVJdTZmNnJxb2tCWUJJZnp0SSt2?=
 =?utf-8?B?RERqcEw5QUFvSjFPQVZOSVFLRy9KVjZWVUNGV1lQRXhEQk45VFkyT0QxMzZt?=
 =?utf-8?B?MEVtSFVRQytqblMrbDh6ZUpMRzdwN1hFSVN3VVpDTzh1Rm1ibjZlcXA5VVNW?=
 =?utf-8?B?RThqdjdPWHVXQm5UVFh3a1k5bGdYcUIrU0thbDBGaXBWNy9xUlBpcnVrZzA3?=
 =?utf-8?B?SzM5S3ZiMXZrVDhjYXdnUC9sUzN0Z2pnSHc2Vyt6TUVmL2dGNEhyQjh0ME1S?=
 =?utf-8?B?RUVsWmROU3JtVnpobVVmck5NVnUwY3JCTmh5dXZUWkljSktucGpZSUtlYXFG?=
 =?utf-8?B?ZSt5dW1wenE1RnJ0LzhicnJIWEIwZGFSMWRDdHJpVENzZGI2M1Y4OVJyR2JL?=
 =?utf-8?B?aDhyTXphRTRHSFY5VFAvUTl3ZmFXd1l4Ty9DTUc3Rk1YVkxoQUJrZTlHbnNT?=
 =?utf-8?B?OXZkK1RuUll1MC9uWHNIZTdET0h3WjV4ZDI0STFINDZEK3p5bFlXM0FFWk01?=
 =?utf-8?B?S3cxdjdkMXpoRk43ekwvOUI0QS9LMGdQTnNUWkk4UTlKNWVJYllSb00vcTEx?=
 =?utf-8?B?aFc3SEc1SDl2WXA1c254S1ZQZTllWU5IRU92ak1OVW8vMXhkNW5iNTVYREZq?=
 =?utf-8?B?MUhXb3E4UzgxRmpQVWJReUNwQWFYdWgzTGVLbmRVWGM3Y2lHNzBaVUNVTEZQ?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 205a8e82-b001-4425-161f-08db616b9ad4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 00:11:39.1817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjHvajHp6R1gkmEm2Ntq4e+YquVT8zLhXeurQ1hayVfbze5+5JJB8/IU7BZjYNbyMjJylNkhr4ygn6Ps4ahlGNkNDsm9tHsAQt7jqAJv4To=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
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

On 5/30/2023 17:06, Ceraolo Spurio, Daniele wrote:
> On 5/30/2023 4:30 PM, John Harrison wrote:
>> On 5/26/2023 17:52, Daniele Ceraolo Spurio wrote:
>>> The new binaries that support the 2-step authentication contain the
>>> legacy-style binary, which we can use for loading the HuC via DMA. To
>>> find out where this is located in the image, we need to parse the
>>> manifest of the GSC-enabled HuC binary. The manifest consist of a
>>> partition header followed by entries, one of which contains the offset
>>> we're looking for.
>>> Note that the DG2 GSC binary contains entries with the same names, but
>>> it doesn't contain a full legacy binary, so we need to skip assigning
>>> the dma offset in that case (which we can do by checking the ccs).
>>> Also, since we're now parsing the entries, we can extract the HuC
>>> version that way instead of using hardcoded offsets.
>>>
>>> Note that the GSC binary uses the same structures in its binary header,
>>> so they've been added in their own header file.
>>>
>>> v2: fix structure names to match meu defines (s/CPT/CPD/), update 
>>> commit
>>>      message, check ccs validity, drop old version location defines.
>>>
>>> v3: drop references to the MEU tool to reduce confusion, fix log (John)
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v2
>>> ---
>>>   .../drm/i915/gt/uc/intel_gsc_binary_headers.h |  74 ++++++++++
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  11 +-
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 135 
>>> ++++++++++++++++++
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   5 +-
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +++
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  71 +++++----
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
>>>   8 files changed, 272 insertions(+), 53 deletions(-)
>>>   create mode 100644 
>>> drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
>>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
>>> new file mode 100644
>>> index 000000000000..714f0c256118
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
>>> @@ -0,0 +1,74 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _INTEL_GSC_BINARY_HEADERS_H_
>>> +#define _INTEL_GSC_BINARY_HEADERS_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +/* Code partition directory (CPD) structures */
>>> +struct intel_gsc_cpd_header_v2 {
>>> +    u32 header_marker;
>>> +#define INTEL_GSC_CPD_HEADER_MARKER 0x44504324
>>> +
>>> +    u32 num_of_entries;
>>> +    u8 header_version;
>>> +    u8 entry_version;
>>> +    u8 header_length; /* in bytes */
>>> +    u8 flags;
>>> +    u32 partition_name;
>>> +    u32 crc32;
>>> +} __packed;
>>> +
>>> +struct intel_gsc_cpd_entry {
>>> +    u8 name[12];
>>> +
>>> +    /*
>>> +     * Bits 0-24: offset from the beginning of the code partition
>>> +     * Bit 25: huffman compressed
>>> +     * Bits 26-31: reserved
>>> +     */
>>> +    u32 offset;
>>> +#define INTEL_GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
>>> +#define INTEL_GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
>>> +
>>> +    /*
>>> +     * Module/Item length, in bytes. For Huffman-compressed 
>>> modules, this
>>> +     * refers to the uncompressed size. For software-compressed 
>>> modules,
>>> +     * this refers to the compressed size.
>>> +     */
>>> +    u32 length;
>>> +
>>> +    u8 reserved[4];
>>> +} __packed;
>>> +
>>> +struct intel_gsc_version {
>>> +    u16 major;
>>> +    u16 minor;
>>> +    u16 hotfix;
>>> +    u16 build;
>>> +} __packed;
>>> +
>>> +struct intel_gsc_manifest_header {
>>> +    u32 header_type; /* 0x4 for manifest type */
>>> +    u32 header_length; /* in dwords */
>>> +    u32 header_version;
>>> +    u32 flags;
>>> +    u32 vendor;
>>> +    u32 date;
>>> +    u32 size; /* In dwords, size of entire manifest (header + 
>>> extensions) */
>>> +    u32 header_id;
>>> +    u32 internal_data;
>>> +    struct intel_gsc_version fw_version;
>>> +    u32 security_version;
>>> +    struct intel_gsc_version meu_kit_version;
>>> +    u32 meu_manifest_version;
>>> +    u8 general_data[4];
>>> +    u8 reserved3[56];
>>> +    u32 modulus_size; /* in dwords */
>>> +    u32 exponent_size; /* in dwords */
>>> +} __packed;
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> index 268e036f8f28..6d795438b3e4 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> @@ -6,23 +6,14 @@
>>>   #include <linux/types.h>
>>>     #include "gt/intel_gt.h"
>>> -#include "gt/intel_gt_print.h"
>>>   #include "intel_guc_reg.h"
>>>   #include "intel_huc.h"
>>> +#include "intel_huc_print.h"
>>>   #include "i915_drv.h"
>>>     #include <linux/device/bus.h>
>>>   #include <linux/mei_aux.h>
>>>   -#define huc_printk(_huc, _level, _fmt, ...) \
>>> -    gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
>>> -#define huc_err(_huc, _fmt, ...)    huc_printk((_huc), err, _fmt, 
>>> ##__VA_ARGS__)
>>> -#define huc_warn(_huc, _fmt, ...)    huc_printk((_huc), warn, _fmt, 
>>> ##__VA_ARGS__)
>>> -#define huc_notice(_huc, _fmt, ...)    huc_printk((_huc), notice, 
>>> _fmt, ##__VA_ARGS__)
>>> -#define huc_info(_huc, _fmt, ...)    huc_printk((_huc), info, _fmt, 
>>> ##__VA_ARGS__)
>>> -#define huc_dbg(_huc, _fmt, ...)    huc_printk((_huc), dbg, _fmt, 
>>> ##__VA_ARGS__)
>>> -#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), 
>>> probe_error, _fmt, ##__VA_ARGS__)
>>> -
>>>   /**
>>>    * DOC: HuC
>>>    *
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>> index 534b0aa43316..037d2ad4879d 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>> @@ -5,11 +5,146 @@
>>>     #include "gt/intel_gsc.h"
>>>   #include "gt/intel_gt.h"
>>> +#include "intel_gsc_binary_headers.h"
>>>   #include "intel_huc.h"
>>>   #include "intel_huc_fw.h"
>>> +#include "intel_huc_print.h"
>>>   #include "i915_drv.h"
>>>   #include "pxp/intel_pxp_huc.h"
>>>   +static void get_version_from_gsc_manifest(struct intel_uc_fw_ver 
>>> *ver, const void *data)
>>> +{
>>> +    const struct intel_gsc_manifest_header *manifest = data;
>>> +
>>> +    ver->major = manifest->fw_version.major;
>>> +    ver->minor = manifest->fw_version.minor;
>>> +    ver->patch = manifest->fw_version.hotfix;
>>> +}
>>> +
>>> +static bool css_valid(const void *data, size_t size)
>>> +{
>>> +    const struct uc_css_header *css = data;
>>> +
>>> +    if (unlikely(size < sizeof(struct uc_css_header)))
>>> +        return false;
>>> +
>>> +    if (css->module_type != 0x6)
>>> +        return false;
>>> +
>>> +    if (css->module_vendor != PCI_VENDOR_ID_INTEL)
>>> +        return false;
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static inline u32 entry_offset(const struct intel_gsc_cpd_entry 
>>> *entry)
>>> +{
>>> +    return entry->offset & INTEL_GSC_CPD_ENTRY_OFFSET_MASK;
>>> +}
>>> +
>>> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const 
>>> void *data, size_t size)
>>> +{
>>> +    struct intel_huc *huc = container_of(huc_fw, struct intel_huc, 
>>> fw);
>>> +    const struct intel_gsc_cpd_header_v2 *header = data;
>>> +    const struct intel_gsc_cpd_entry *entry;
>>> +    size_t min_size = sizeof(*header);
>>> +    int i;
>>> +
>>> +    if (!huc_fw->loaded_via_gsc) {
>>> +        huc_err(huc, "Invalid FW type GSC header parsing!\n");
>> I'm still not understanding what this error means. Is it meant to say 
>> 'Invalid FW type *for* GSC header parsing'?
>
> yes, sorry that was the idea. I'll add the "for"
:)

>
>>
>> 'fw->loaded_via_gsc' is set from the blob table, yes? And 
>> intel_huc_fw_get_binary_info() is only called from 
>> check_gsc_manifest() which is called from check_fw_header() iff 
>> fw->loaded_via_gsc is set. So it should be impossible for this test 
>> to ever fail, yes?
>
> Yes, this should never fail, but with GSC FW the code changes again so 
> I wanted to make sure I had a check in there in case I got things 
> wrong. There would be other failures anyway (because the parsing 
> wouldn't work, so I can drop this check if you think it is redundant.
Was more just wanting to verify my understanding and maybe wondering if 
it should be a BUG rather than just a if. But yeah, the code paths above 
change even within this patch set. So keeping the test as is seems sensible.

John.

>
> Daniele
>
>>
>> John.
>>
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (size < sizeof(*header)) {
>>> +        huc_err(huc, "FW too small! %zu < %zu\n", size, min_size);
>>> +        return -ENODATA;
>>> +    }
>>> +
>>> +    /*
>>> +     * The GSC-enabled HuC binary starts with a directory header, 
>>> followed
>>> +     * by a series of entries. Each entry is identified by a name and
>>> +     * points to a specific section of the binary containing the 
>>> relevant
>>> +     * data. The entries we're interested in are:
>>> +     * - "HUCP.man": points to the GSC manifest header for the HuC, 
>>> which
>>> +     *               contains the version info.
>>> +     * - "huc_fw": points to the legacy-style binary that can be 
>>> used for
>>> +     *             load via the DMA. This entry only contains a 
>>> valid CSS
>>> +     *             on binaries for platforms that support 2-step 
>>> HuC load
>>> +     *             via dma and auth via GSC (like MTL).
>>> +     *
>>> +     * --------------------------------------------------
>>> +     * [  intel_gsc_cpd_header_v2                       ]
>>> +     * --------------------------------------------------
>>> +     * [  intel_gsc_cpd_entry[]                         ]
>>> +     * [      entry1                                    ]
>>> +     * [      ...                                       ]
>>> +     * [      entryX                                    ]
>>> +     * [          "HUCP.man"                            ]
>>> +     * [           ...                                  ]
>>> +     * [           offset >----------------------------]------o
>>> +     * [      ...                                       ] |
>>> +     * [      entryY                                    ] |
>>> +     * [          "huc_fw"                              ] |
>>> +     * [           ...                                  ] |
>>> +     * [           offset >----------------------------]----------o
>>> +     * -------------------------------------------------- | |
>>> +     * |   |
>>> +     * -------------------------------------------------- | |
>>> +     * [ intel_gsc_manifest_header ]<-----o   |
>>> +     * [  ... ]          |
>>> +     * [  intel_gsc_version fw_version ]          |
>>> +     * [  ... ]          |
>>> +     * --------------------------------------------------          |
>>> + * |
>>> +     * --------------------------------------------------          |
>>> +     * [ data[] ]<---------o
>>> +     * [  ...                                           ]
>>> +     * [  ...                                           ]
>>> +     * --------------------------------------------------
>>> +     */
>>> +
>>> +    if (header->header_marker != INTEL_GSC_CPD_HEADER_MARKER) {
>>> +        huc_err(huc, "invalid marker for CPD header: 0x%08x!\n",
>>> +            header->header_marker);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /* we only have binaries with header v2 and entry v1 for now */
>>> +    if (header->header_version != 2 || header->entry_version != 1) {
>>> +        huc_err(huc, "invalid CPD header/entry version %u:%u!\n",
>>> +            header->header_version, header->entry_version);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (header->header_length < sizeof(struct 
>>> intel_gsc_cpd_header_v2)) {
>>> +        huc_err(huc, "invalid CPD header length %u!\n",
>>> +            header->header_length);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    min_size = header->header_length + sizeof(*entry) * 
>>> header->num_of_entries;
>>> +    if (size < min_size) {
>>> +        huc_err(huc, "FW too small! %zu < %zu\n", size, min_size);
>>> +        return -ENODATA;
>>> +    }
>>> +
>>> +    entry = data + header->header_length;
>>> +
>>> +    for (i = 0; i < header->num_of_entries; i++, entry++) {
>>> +        if (strcmp(entry->name, "HUCP.man") == 0)
>>> + get_version_from_gsc_manifest(&huc_fw->file_selected.ver,
>>> +                              data + entry_offset(entry));
>>> +
>>> +        if (strcmp(entry->name, "huc_fw") == 0) {
>>> +            u32 offset = entry_offset(entry);
>>> +            if (offset < size && css_valid(data + offset, size - 
>>> offset))
>>> +                huc_fw->dma_start_offset = offset;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>>>   {
>>>       int ret;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
>>> index db42e238b45f..0999ffe6f962 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
>>> @@ -7,8 +7,11 @@
>>>   #define _INTEL_HUC_FW_H_
>>>     struct intel_huc;
>>> +struct intel_uc_fw;
>>> +
>>> +#include <linux/types.h>
>>>     int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc);
>>>   int intel_huc_fw_upload(struct intel_huc *huc);
>>> -
>>> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const 
>>> void *data, size_t size);
>>>   #endif
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>>> new file mode 100644
>>> index 000000000000..915d310ee1df
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>>> @@ -0,0 +1,21 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef __INTEL_HUC_PRINT__
>>> +#define __INTEL_HUC_PRINT__
>>> +
>>> +#include "gt/intel_gt.h"
>>> +#include "gt/intel_gt_print.h"
>>> +
>>> +#define huc_printk(_huc, _level, _fmt, ...) \
>>> +    gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
>>> +#define huc_err(_huc, _fmt, ...)    huc_printk((_huc), err, _fmt, 
>>> ##__VA_ARGS__)
>>> +#define huc_warn(_huc, _fmt, ...)    huc_printk((_huc), warn, _fmt, 
>>> ##__VA_ARGS__)
>>> +#define huc_notice(_huc, _fmt, ...)    huc_printk((_huc), notice, 
>>> _fmt, ##__VA_ARGS__)
>>> +#define huc_info(_huc, _fmt, ...)    huc_printk((_huc), info, _fmt, 
>>> ##__VA_ARGS__)
>>> +#define huc_dbg(_huc, _fmt, ...)    huc_printk((_huc), dbg, _fmt, 
>>> ##__VA_ARGS__)
>>> +#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), 
>>> probe_error, _fmt, ##__VA_ARGS__)
>>> +
>>> +#endif /* __INTEL_HUC_PRINT__ */
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> index 31776c279f32..9ced8dbf1253 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> @@ -548,33 +548,6 @@ static void __force_fw_fetch_failures(struct 
>>> intel_uc_fw *uc_fw, int e)
>>>       }
>>>   }
>>>   -static int check_gsc_manifest(struct intel_gt *gt,
>>> -                  const struct firmware *fw,
>>> -                  struct intel_uc_fw *uc_fw)
>>> -{
>>> -    u32 *dw = (u32 *)fw->data;
>>> -    u32 version_hi, version_lo;
>>> -    size_t min_size;
>>> -
>>> -    /* Check the size of the blob before examining buffer contents */
>>> -    min_size = sizeof(u32) * (HUC_GSC_VERSION_LO_DW + 1);
>>> -    if (unlikely(fw->size < min_size)) {
>>> -        gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>>> -            intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>> -            fw->size, min_size);
>>> -        return -ENODATA;
>>> -    }
>>> -
>>> -    version_hi = dw[HUC_GSC_VERSION_HI_DW];
>>> -    version_lo = dw[HUC_GSC_VERSION_LO_DW];
>>> -
>>> -    uc_fw->file_selected.ver.major = 
>>> FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
>>> -    uc_fw->file_selected.ver.minor = 
>>> FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
>>> -    uc_fw->file_selected.ver.patch = 
>>> FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
>>> -
>>> -    return 0;
>>> -}
>>> -
>>>   static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 
>>> css_value)
>>>   {
>>>       /* Get version numbers from the CSS header */
>>> @@ -631,22 +604,22 @@ static void guc_read_css_info(struct 
>>> intel_uc_fw *uc_fw, struct uc_css_header *c
>>>       uc_fw->private_data_size = css->private_data_size;
>>>   }
>>>   -static int check_ccs_header(struct intel_gt *gt,
>>> -                const struct firmware *fw,
>>> -                struct intel_uc_fw *uc_fw)
>>> +static int __check_ccs_header(struct intel_gt *gt,
>>> +                  const void *fw_data, size_t fw_size,
>>> +                  struct intel_uc_fw *uc_fw)
>>>   {
>>>       struct uc_css_header *css;
>>>       size_t size;
>>>         /* Check the size of the blob before examining buffer 
>>> contents */
>>> -    if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>>> +    if (unlikely(fw_size < sizeof(struct uc_css_header))) {
>>>           gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>>>               intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>> -            fw->size, sizeof(struct uc_css_header));
>>> +            fw_size, sizeof(struct uc_css_header));
>>>           return -ENODATA;
>>>       }
>>>   -    css = (struct uc_css_header *)fw->data;
>>> +    css = (struct uc_css_header *)fw_data;
>>>         /* Check integrity of size values inside CSS header */
>>>       size = (css->header_size_dw - css->key_size_dw - 
>>> css->modulus_size_dw -
>>> @@ -654,7 +627,7 @@ static int check_ccs_header(struct intel_gt *gt,
>>>       if (unlikely(size != sizeof(struct uc_css_header))) {
>>>           gt_warn(gt, "%s firmware %s: unexpected header size: %zu 
>>> != %zu\n",
>>>               intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>> -            fw->size, sizeof(struct uc_css_header));
>>> +            fw_size, sizeof(struct uc_css_header));
>>>           return -EPROTO;
>>>       }
>>>   @@ -666,10 +639,10 @@ static int check_ccs_header(struct intel_gt 
>>> *gt,
>>>         /* At least, it should have header, uCode and RSA. Size of 
>>> all three. */
>>>       size = sizeof(struct uc_css_header) + uc_fw->ucode_size + 
>>> uc_fw->rsa_size;
>>> -    if (unlikely(fw->size < size)) {
>>> +    if (unlikely(fw_size < size)) {
>>>           gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>>>               intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>> -            fw->size, size);
>>> +            fw_size, size);
>>>           return -ENOEXEC;
>>>       }
>>>   @@ -690,6 +663,32 @@ static int check_ccs_header(struct intel_gt *gt,
>>>       return 0;
>>>   }
>>>   +static int check_gsc_manifest(struct intel_gt *gt,
>>> +                  const struct firmware *fw,
>>> +                  struct intel_uc_fw *uc_fw)
>>> +{
>>> +    if (uc_fw->type != INTEL_UC_FW_TYPE_HUC) {
>>> +        gt_err(gt, "trying to GSC-parse a non-HuC binary");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
>>> +
>>> +    if (uc_fw->dma_start_offset) {
>>> +        u32 delta = uc_fw->dma_start_offset;
>>> +        __check_ccs_header(gt, fw->data + delta, fw->size - delta, 
>>> uc_fw);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int check_ccs_header(struct intel_gt *gt,
>>> +                const struct firmware *fw,
>>> +                struct intel_uc_fw *uc_fw)
>>> +{
>>> +    return __check_ccs_header(gt, fw->data, fw->size, uc_fw);
>>> +}
>>> +
>>>   static bool is_ver_8bit(struct intel_uc_fw_ver *ver)
>>>   {
>>>       return ver->major < 0xFF && ver->minor < 0xFF && ver->patch < 
>>> 0xFF;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>> index 2be9470eb712..b3daba9526eb 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>> @@ -118,6 +118,8 @@ struct intel_uc_fw {
>>>       u32 ucode_size;
>>>       u32 private_data_size;
>>>   +    u32 dma_start_offset;
>>> +
>>>       bool loaded_via_gsc;
>>>   };
>>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>>> index 646fa8aa6cf1..7fe405126249 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>>> @@ -84,10 +84,4 @@ struct uc_css_header {
>>>   } __packed;
>>>   static_assert(sizeof(struct uc_css_header) == 128);
>>>   -#define HUC_GSC_VERSION_HI_DW        44
>>> -#define   HUC_GSC_MAJOR_VER_HI_MASK    (0xFF << 0)
>>> -#define   HUC_GSC_MINOR_VER_HI_MASK    (0xFF << 16)
>>> -#define HUC_GSC_VERSION_LO_DW        45
>>> -#define   HUC_GSC_PATCH_VER_LO_MASK    (0xFF << 0)
>>> -
>>>   #endif /* _INTEL_UC_FW_ABI_H */
>>
>

