Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB47531148
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 16:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEC610F002;
	Mon, 23 May 2022 14:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F8C10EF45
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 14:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653315513; x=1684851513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CaXpLN/HQ1IcLpDHNysOC2X+UevErWlykoTAqGdUUMY=;
 b=g4dS0NAx4mnFlm1vRaDiGvXlKb+O2WBDCcaAm+osgVGgbbPbaEnxBwY/
 FvJlwCJ8mptTbQlwBj/dXdpif8O9iS1Dx+9rgyJ61PPljqB4m9JN6rX9z
 Fyqmu4v8gwQCRhtb86XqdBxDWzHpkGAa9m1Tkvyq8PV+PLy03d6cFEcK3
 PPoo3jyLN60AZmyjYahioSsONG9aDu8jQ8ev9oFl3WYmCxJk6jVLSQIe6
 FIYuE2d2Bw5etYaRmw/HasuwQ/H0RBmSeLcuVILfJYAQaABtYVWuLjkrj
 YmYQnD+3rBXr+nX7AzTusnkECJpOsVevOC2CXUMwV443KcvSUL6FFwOfu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="272051915"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="272051915"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 07:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600673340"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 07:18:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 23 May 2022 07:18:30 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 23 May 2022 07:18:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 23 May 2022 07:18:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 23 May 2022 07:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4eW4ivq0q0E2bV2m7emVJ6rM6Jp+zJstEv5jb12vaoi6HSoKibM6g3nNi6jNJUWL5rU6hZzYXliRas+LdTaVg9G3bqZmAsyqGYcI8scIOfjOw+k/oLhXWN1XzocovAqUEj/SeysgCcmmMD0eli5b+x6RF2KKTolWaLntG3kmjEbnzkyL6rdIm8g0Bu3o3rxhMp1SNMkEt50mpsFaQxBcNUnRDbnFO+7n68rUr+p6lLmEPU82nIe7dbVevOeZKC98FIIqYu6DVYQ9U6i/muzpK7ZlXbW4uSvMiwhGcU5Ti05mwmtmNWZIiQtlpPiudfyS4INGAOIFsR4aXNe2KUDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpepqdKqRwkJTzjqq9KutpHWkStNTtVJH6hqbhGKRYk=;
 b=lU+cbBVv8U03pUK4451TxlN2tM77YHOJEQhBNjhO5HqDVHQ+KIIhWARsD+KSh9O5DQgi4rMA9DNaxU2j5lXPJSG0DNcCUCa+Jyg9Qfmia7FqwG9GBzoR6AzbfubAgNx29IjD5xETUN789rnczrlgmWHEp7Vix0EB3x/brSJn0mX1SAXIH1e5rEXG43osIAm+vxQeynWYSzTpzngE/6CgfyvOcM9OCaex7ORfdihXThx6MbUG6VaptR1SG/Zy353CYuiiY0lkUaVFDvMcr/PKHBGyclZuk1mEm+7yCDbTrDrTh8T+wYYuKrHDy4eqCSssH2IWgQkdtGdUcW/SnB4rKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Mon, 23 May
 2022 14:18:27 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1079:a2cc:665e:f397]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1079:a2cc:665e:f397%7]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 14:18:27 +0000
Message-ID: <f926ee46-5977-d3ea-a8ce-e4cf6767c918@intel.com>
Date: Mon, 23 May 2022 16:18:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 01/11] drm: of: Add drm_of_get_data_lanes and
 drm_of_get_data_lanes_ep
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20220519112657.62283-1-marex@denx.de>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220519112657.62283-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0273.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::13) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4c80804-b73a-4ad5-e730-08da3cc71a73
X-MS-TrafficTypeDiagnostic: BL3PR11MB6531:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BL3PR11MB65315C19902DFE5679A0C4E6EBD49@BL3PR11MB6531.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R/o5De55CmTs4ofA4OfAYT9VdtBCVWoxsXMGhrRFf1+w/Fzv7+QJKxwCNtKOu3pvNmD7iqZLxkULImQdzcxC6NXuwXOY6pNejefqavAa8YIEe48+rsajjMwxLgQTXYY3JYPnfOga/n5OH5hbjh2/jdqW+6AZlqHu6MNAxE71gnV2GYUYgdsIsf8u8kmwcH/4DZ4AFdIt6cLcGBJTe54ISQz00nPcYESpklR63hhBfEqn/V3Ng+cTZ1EM6wtZMvPFWa+SXeLcj4RQnttVXCjodeiphnTFYzJAeCN2TvtvoyWsAZtkPZTTNNjMZd5mDZF0BWl+xLCPzkxUKKhEgCMa6gfvXLtm2u7BH0vDryOe/Ii8Tz/Q3diktQNGtqX5ekY8YCEtjKgVg5ZBdijyeAnPrAys3l3CsGh+tNCnGy9DiB3dRUU5HQNpWhxnRH12DizjANvgVZF8dhrDvfN/VgfA83mjUo35ADaZlQBQQyltP9sOazlkoYLbj0+ts8/g4KjZET+HRZQhnkNT49VCq4emAADppPoiM2rOG8nUbS4Xx4bcfStfr+L+4snRL56WbHFkD6aRT4VODbFbpJIyE0NdKIjF1+XbUS6XkK3JPMPwVCQYg8+1FHSrh9LH1vYHzDpDu6UFiFPgdtAY4b85LcihwOW5VHGbfrx550YFRwKV4kZp8o2dI6HIXblfk5C4ZoMSNJhWiZTSNtgw/RI9/ukqrCpnaxXExmmMUahzvd6L9elrjWswomOvSQQcLL7bEMQsHicVQbOLvxGuHpFqRXoRtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(44832011)(2906002)(36916002)(4326008)(5660300002)(316002)(6486002)(66476007)(66556008)(31686004)(54906003)(38100700002)(6666004)(36756003)(508600001)(6506007)(186003)(8676002)(82960400001)(2616005)(53546011)(86362001)(31696002)(6512007)(83380400001)(26005)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1h3NkNtbnBMSmFiVWUvd1hXVEUzNFJFdnlrNGQ0b3FCdTExUWZqa1pVS0d3?=
 =?utf-8?B?Tm42ODIxeExEZ2doaUI2RHl2R3lqcHhNV3luSUNGMDliMG00dnZCcnpWbStZ?=
 =?utf-8?B?ZXNJYWdJSERZOXJrQ1dIRFRNbnFDbmJvMXNpcW4vVE5aVWxYMzVsd1JEdUpX?=
 =?utf-8?B?V2ZsdjQ3R0ZWclVFb1lmMkQxd3RRVEdIL0Q4Q3R4UGFrQWJWMHc3RElxQWFF?=
 =?utf-8?B?b3EyWkNrSXQwQXpKVjFVckRobjU5aGNrMEJTTUZuMWttOW1tYnhQRDFjaHRG?=
 =?utf-8?B?TEExRG9pYUpaVDJxWjJHV0M5ekwzU3k4cG1TS0ZZeEFzbTBpL21VWkN0V29G?=
 =?utf-8?B?R3d4OW1yajUyYk4wY3BZVk1KQVRBYi9WVVQyQUYwYXk4RHVEOUNzY1p2aHNJ?=
 =?utf-8?B?cHhNUSs5K0RYR001UkI1TFpxYkI3UU8vbXlleUNXbmVZMmpuRHV0NEtqUng0?=
 =?utf-8?B?NGVaL3h6NjNRdnhZZFF1bzNsUVdnQVk4WWJickFqNHZ2dHJwOWhaV01Wa3o2?=
 =?utf-8?B?OFI1RG1kYStYdjJsMUVuZ2JWT0VwSXprS2ZZaFdqRzhXY05wdkRGVnZUSHA1?=
 =?utf-8?B?RU1mc09FY0h1anE3c01pMHFSYklscCtZK2JPNFR3VHlKNzVUb1V1bjRuN2hI?=
 =?utf-8?B?a2NlY2JEV0dBOG9VazdmaFF2M01SelBDNEhTVHRyMzVUSy9tM0JHU1V3cUdR?=
 =?utf-8?B?WXEvZXBlNGlyRmdqVmJUZ2NBSlRZcEpRUkdhc3IxOUNwZnZYWnpoMFhQdjJp?=
 =?utf-8?B?b2lRRGttVGtIL1k0UmRrblBDRWxWN0xsdWxPczFHS2lCUWNEajFKSVpoTVdp?=
 =?utf-8?B?UWhXT1paQzlqVmEraW5zcUtBSVQxOGRVV1lvOTluN0FobHNZRTV3UFBJU29x?=
 =?utf-8?B?NTdjNzNnMkcxY25IM3JHY1dzZ0taVzZ3WjZFUnpYVUZnYWt4TnYzRHhHWHFT?=
 =?utf-8?B?UE52ZUFUUSsxNU9yZWhNNk53TWJkdnZFVU1QbFl4NTVNTnNKU0xkeElTVHRy?=
 =?utf-8?B?dXdwOFl6bzhFdkwwRzgwcXNpbGpsWDUrRENKemRJK21YR0UrcnkyK0RsNHJP?=
 =?utf-8?B?NFVXbWtBcW0wY1dBbDh4WitWZ00xdmZYSk5PY1dwNnh4WlR5QUJKNjRmcGty?=
 =?utf-8?B?Vng2QTRENDg2UXJqM1orSDB6UlVMWjUwQjNoOHliL3hlRWdiYy9EUDdkNTVB?=
 =?utf-8?B?WGNGTVA0SE1nYzRPT0FxSStXMmxMYjJlR2cxa2FEUnZtMEVQMHJoYnE2Yy9i?=
 =?utf-8?B?Vk1xZ3BDOEc3d0tHVkNKcjFOUENESTBrMUd6Nmx6MUtyak5YU21vSHJoRDQy?=
 =?utf-8?B?VW9kWmRlTGV0YmhXdVByWHJQNHpKZW5jMjhsdWx1Mzg1YTc4cDZyYWMxUmNG?=
 =?utf-8?B?eEdLU3Z6Ulp5WitydGwvUnVBNFhPbWx2eUQ1Qk5IekdERElMNWtNSVc5NGV6?=
 =?utf-8?B?SjlJUmlyQm9lUmlMSzAwOXpyaWlqYW9wSC8xTkg1OVBlRWluNmkxajhNckh1?=
 =?utf-8?B?b0ZLWFNPcVpZb0JrS2prcTdrWEtHMGF2RkdIWGdnbnIyWkttVmNBMGNJWWxJ?=
 =?utf-8?B?WTBmNW5EN3pmOWZiSlBSVVNKUzRqbGt0NTNNMm9kTW1kK3JWcVZmcldIVHVn?=
 =?utf-8?B?blVRK3hGTXUrc0cwbzZRUzFJWXBaUGZrMkc3dzFYZldudENDVVRMbGt4UFNt?=
 =?utf-8?B?a004SGtJYmlrZnlPTGw5SXFaV0QxaE5WQVVTcVJvUmtXUEZGN1Bqd0R5eDVN?=
 =?utf-8?B?RVVsSFQzSlB3cG1yQkczZzV4cUwwRXlMdnlZZTZNUmp4NHI5RGxhNDdNeU9N?=
 =?utf-8?B?RjJpWjN6RElOSEJ6SVdSOFdUbmVQc1dYdGx1RTdyZ1F5T0xuTzhmYjMvTkEw?=
 =?utf-8?B?ZGJaSGNEYXV4bStTSVlzaGlreW94aTZjMmdVcEdZYm5WTUdmQUtwQjFDMU1M?=
 =?utf-8?B?QmpDR3h5SG9ZeTk5eDBQUEFUdzlOWUJrdXRLZzJDU2M4NTV2Nm5EaHl4T1Zi?=
 =?utf-8?B?U3RpcGg0RnJ5L3RISTVrSzVqTi96Q3BVSFhWcUR2VERjYUpXbnVIK3prQTFE?=
 =?utf-8?B?YXBVc1dVOG5QRURiVW5ZYXIwdk4vUVpGeWcwSGlSVTAxSTNkMVpwZjh4WFF3?=
 =?utf-8?B?dlZjSVljbUExTVl6bzlqU1ppanozQXNpNmZHWC96dllJS2lEYzRKYU5uMmNu?=
 =?utf-8?B?ZXZTT3NvSUw1KzkwK2h4WUQzaXNyVktMTUFLTDQrV3kxSktqOXI2ZEkvcmps?=
 =?utf-8?B?cG54RldKMmIyblZrL1l6blAydUdVengwemM0VmMwaGFsTXc2VUlQWEhIM2dm?=
 =?utf-8?B?Z0tvaVBkWlEyQVRnNkNxRjhEeHRBRlVQYlppL2NIOWVrMHpaN3FHMGdwam9N?=
 =?utf-8?Q?o1cqrWoiNLc4IJXQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c80804-b73a-4ad5-e730-08da3cc71a73
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 14:18:26.9589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QD9+FA56FHU//f4GpSJAXkfqNsZbdLJpzpNnOhOQth7Q3Arajh2ake4Lbx18uGVetM3mTr8Mjs979mc/wO/7fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
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
Cc: Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19.05.2022 13:26, Marek Vasut wrote:
> Add helper function to count and sanitize DT "data-lanes" property
> and return either error or the data-lanes count. This is useful for
> both DSI and (e)DP "data-lanes" property. The later version of the
> function is an extra wrapper which handles the endpoint look up by
> regs, that's what majority of the drivers duplicate too, but not all
> of them.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/drm_of.c | 61 ++++++++++++++++++++++++++++++++++++++++
>   include/drm/drm_of.h     | 20 +++++++++++++
>   2 files changed, 81 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 9a2cfab3a177f..2186f966d2820 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -430,3 +430,64 @@ int drm_of_lvds_get_data_mapping(const struct device_node *port)
>   	return -EINVAL;
>   }
>   EXPORT_SYMBOL_GPL(drm_of_lvds_get_data_mapping);
> +
> +/**
> + * drm_of_get_data_lanes - Get DSI/(e)DP data lane count
> + * @endpoint: DT endpoint node of the DSI/(e)DP source or sink
> + * @min: minimum supported number of data lanes
> + * @max: maximum supported number of data lanes
> + *
> + * Count DT "data-lanes" property elements and check for validity.
> + *
> + * Return:
> + * * min..max - positive integer count of "data-lanes" elements
> + * * -ve - the "data-lanes" property is missing or invalid
> + * * -EINVAL - the "data-lanes" property is unsupported
> + */
> +int drm_of_get_data_lanes(const struct device_node *endpoint,
> +			  const unsigned int min, const unsigned int max)

Adding count to the name would be more accurate,  for example 
drm_of_get_data_lanes_count ?
Up to you.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> +{
> +	int ret;
> +
> +	ret = of_property_count_u32_elems(endpoint, "data-lanes");
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret < min || ret > max)
> +		return -EINVAL;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_of_get_data_lanes);
> +
> +/**
> + * drm_of_get_data_lanes_ep - Get DSI/(e)DP data lane count by endpoint
> + * @port: DT port node of the DSI/(e)DP source or sink
> + * @port_reg: identifier (value of reg property) of the parent port node
> + * @reg: identifier (value of reg property) of the endpoint node
> + * @min: minimum supported number of data lanes
> + * @max: maximum supported number of data lanes
> + *
> + * Count DT "data-lanes" property elements and check for validity.
> + * This variant uses endpoint specifier.
> + *
> + * Return:
> + * * min..max - positive integer count of "data-lanes" elements
> + * * -EINVAL - the "data-mapping" property is unsupported
> + * * -ENODEV - the "data-mapping" property is missing
> + */
> +int drm_of_get_data_lanes_ep(const struct device_node *port,
> +			     int port_reg, int reg,
> +			     const unsigned int min,
> +			     const unsigned int max)
> +{
> +	struct device_node *endpoint;
> +	int ret;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(port, port_reg, reg);
> +	ret = drm_of_get_data_lanes(endpoint, min, max);
> +	of_node_put(endpoint);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_ep);
> diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> index 99f79ac8b4cd7..b559c53756196 100644
> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -50,6 +50,12 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>   int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
>   					  const struct device_node *port2);
>   int drm_of_lvds_get_data_mapping(const struct device_node *port);
> +int drm_of_get_data_lanes(const struct device_node *endpoint,
> +			  const unsigned int min, const unsigned int max);
> +int drm_of_get_data_lanes_ep(const struct device_node *port,
> +			     int port_reg, int reg,
> +			     const unsigned int min,
> +			     const unsigned int max);
>   #else
>   static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
>   					  struct device_node *port)
> @@ -105,6 +111,20 @@ drm_of_lvds_get_data_mapping(const struct device_node *port)
>   {
>   	return -EINVAL;
>   }
> +
> +int drm_of_get_data_lanes(const struct device_node *endpoint,
> +			  const unsigned int min, const unsigned int max)
> +{
> +	return -EINVAL;
> +}
> +
> +int drm_of_get_data_lanes_ep(const struct device_node *port,
> +			     int port_reg, int reg
> +			     const unsigned int min,
> +			     const unsigned int max)
> +{
> +	return -EINVAL;
> +}
>   #endif
>   
>   /*

