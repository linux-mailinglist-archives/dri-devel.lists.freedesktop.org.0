Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0498353119A
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 17:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B0E1123F9;
	Mon, 23 May 2022 15:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85F31123F9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653319937; x=1684855937;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bG86QEyCDyVvOeiyBjAimSs2kXtSg1JQa5cTl977Tjo=;
 b=C9/+2TNAnUBbwgHl3kF8NIN8j/jp3ToLnU8g2NbcyDwkCOXWThBv2kWx
 3YU8hbTxdcl//RpC57ryvGY6nEjVjTXMoQeqIL7WBIUtYPxWUtjvsgzOs
 Et834aEO2s3LEWIrXcsx9YB1Y1Zx5pefbGnIDmhQFkHBdUF1SJuMpyWHw
 Cj6fRA+3w7bbMSlyvXs8KIv3QYm6strXmxaBcgCoYgNluWi6KJ9nxyFYB
 mVYpb0LUY2UwNA8EPNeTf4B1+ZZcJ40NByJbAKJYrpzExPs2yuDYhw66T
 wwj7Coiz+UBoVdKZWxszl+49YLINnTc+bMIVWiixMcg+62Mas5O4sbcB8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="255323827"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="255323827"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="525990454"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 23 May 2022 08:32:16 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 23 May 2022 08:31:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 23 May 2022 08:31:24 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 23 May 2022 08:31:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoguzIDiI9GbNLRtbb082Cp6qd4PDPrVWKFZYD2zMDcDZZwSzWsrwSSYyeAIrF+sbSotGI/zQxCBRLHG8ezJhX4YB4rHEqv9FwwquigHaOHlXltiXlqmQ3mlWl1dxKW+TmQb6t0SiHK8VucRMjurqEb60NKO/FH+L8Fc1sGE8d2XPhZohuPMPhMAkd33pSLAlpWuOxlrUpAgpHMgBI0kn8Os0gdY71CXXO32/KPt3r6RYAw/69Hfa5E9U9fs/iSHjuqM8AHSUEs3qpSkApV39DdfQS62vN6nA3jNCvg3SPiPGhud6JITWLg4zl0w+nAyqayx6C/6zs91MFf/kN/Zmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYABcL4t3X+Jy+sqBvg9Q6qmOhtiYro2WHgJ5GhLLqE=;
 b=PuhYJN/XFOXetdFDld2VCtq/KaeEPr9H+CwqwsMBAfNAx/OcOGZfs5YRevSQBuuxYNTsA8LKxiVq+DLSNeZfYBTK1H3kv+i+X/lu0RKPYg7tncXwsuD2KnaWqaEQrm6SWEqkXAWCZzvY0xDqrjhiB3EuNM7VhuyQFiNaxbk3mn880kJz5cWdmTopPseifzeDxNTIWs/p8JEIFOFTz5R/tGSkwg4gaUwNFrm2otPozDbfK8wfDA08l6Ljz82IRBZ4QBbDQ9numdI95IHNQ4jX7apZW+oab6pDX8YnxI8h16CKJV4DicKXJQMFLuaSTpQtr/1DaC7jczhsYYsiPsDhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 MN2PR11MB4158.namprd11.prod.outlook.com (2603:10b6:208:155::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 15:31:20 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1079:a2cc:665e:f397]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1079:a2cc:665e:f397%7]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 15:31:19 +0000
Message-ID: <6e2f6c56-a869-39a6-c56b-24a07b925622@intel.com>
Date: Mon, 23 May 2022 17:31:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 02/11] drm/bridge: anx7625: Convert to
 drm_of_get_data_lanes
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20220519112657.62283-1-marex@denx.de>
 <20220519112657.62283-2-marex@denx.de>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220519112657.62283-2-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0053.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::30) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4df9b60f-35dc-47dc-888c-08da3cd148ec
X-MS-TrafficTypeDiagnostic: MN2PR11MB4158:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB41585A76E9576631201C16EAEBD49@MN2PR11MB4158.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8P5jFpFNCLSkd4daXr52gU3GgpUwlc6i/U+z77yic+zLrqsxKtZYigzjV5nQwO4wxPmOsq+T3SXfAhCuoqe+NCcwTCTvZQeZXwFztSA5qOVwnxZ0gimrnfqyhM4+t0pJhX7tNSM+6XSgl1lhpWINjreiYcsJdu6nLEZFGna2iNV1TPB2UI+O5Eou+iytVatCUP1UL2N2xbzRC+hg4ouYZbzSAXcdmkhOD00/2fAIhVka93EGdFUom/QwJ6+wGYZyYkZ/rsJego3vGlkgbh5+qqkWM2vAMES4itH9zqXt22p+Tvi49W4cv2QUEA+YZ5YOQMW2la+NYXhjpWUKbOpqyZoDPd69ZLbmzvXacAtcKkAEHWHXXyfysXaeghef7eLLyMuV7TS3zWSsQ22yB/EXPbmekZMXE+SyY6i9WVDGP9nLbjTunUy7NLUInoXwxcLABbKoXvSITfzvtjKjzHg9/0PivFG2/l54u2cnDHlrbIO2PRTl46xElZzl1dQCndqaDX280s1r44D/HLkvz9UqWDL2p3ZCN66LXasL6Ekv5VoYgDtdIqQEsU80iM3HXBq5fAHjbMB3uX2E5Hd7L8yHRLQUPIiCp34hy3bU//0qzL26O42hgq3FjfV/UzLltfK5ZruGQcx3T27Cu7lzLIjJZA6ugobXRmyBo1VwGdkL0uYAa6VyagJvS4hDVnflu6qAnAYwY3Az4fc/6sDaeCjAY760RuZrtpCDu7YbsIW/Vq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(508600001)(6486002)(36916002)(38100700002)(44832011)(2616005)(2906002)(8936002)(54906003)(6666004)(186003)(5660300002)(83380400001)(31696002)(82960400001)(66556008)(66476007)(86362001)(26005)(4326008)(66946007)(6512007)(8676002)(36756003)(31686004)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkloTU5qaFYyK1MzN3M4Z0lCRFhvUzF5YVYrOFp6VjlyOG9LQ3d2UzJSSE1y?=
 =?utf-8?B?QXc0SmJncmQ3MHlmbWRPaWZudWxubDk4RzRvZU15Y0FoWTk2NTJFdXpCNnlV?=
 =?utf-8?B?ZXRrTjNFemZybG85ZEVtTEVJSUJVcHFYUDF6dDRQNzZiWWJoeHB1WDJ0ZVQ2?=
 =?utf-8?B?eUZtRXlEVDRXZ0IvVnFZWWltOGJySWFsOHNTbVhwenU1Q0Z2VE43d2sxNUdK?=
 =?utf-8?B?akhyRlZDSHo4VnFxaWRXNDlMVkhnWnVXbHNpQjE1ZUZrdTZPWC9MbVBkc29L?=
 =?utf-8?B?MndocUR1eWZiU3d2Y2gvaEk0b0tDZHdzN0prTmc4N3Nlb1owOHpXRHYyVy9P?=
 =?utf-8?B?U29aOVoxS1pkaE8zeVdhUFV4S2NsKzRTNzBhOHlLVWI3MlZhRGF1SmJ4ZUNL?=
 =?utf-8?B?elJadDdoTjNBdGVXREVlTUd2WURYQWpiaTZxSWRxVDlNQm9pVnV4Y2pHKzdv?=
 =?utf-8?B?MEtFTDlQMHduM3dHYWo2V2IvYzJXRmQwWG9DcnhMMng1MzIyZnFQTCtPR2ta?=
 =?utf-8?B?ZncrN2t6LzFsb0doakRuU2hwaTZhR0pOZnJoZnhFbXB6SGQ5WTE0Qk9wS1ZN?=
 =?utf-8?B?OTZnVythNjVub3Z3eTdDOHdWbzgyR1VoWDdGTERlQ000UE9aQi9LUjZqVitI?=
 =?utf-8?B?a3ljaGdWRXVwWUh6VGFDdWxDMFc1aU9jbHNTTHduYUsxTENGSXEzU0V4K1lK?=
 =?utf-8?B?ZDBNR2VoU3BYb0puYUdQWHlBQ0ZyUHJLRGJ6L1lsYUxySGdFYkl4SkJ3RHB5?=
 =?utf-8?B?SmhzclpTY0Z2Y3hYK2VjU2hzU0ZtRlMxVjNWSlNwZHJlN21ySzg0WU1Ic0ZO?=
 =?utf-8?B?bS9XNU5CM1h2VEFuTzNCZ21WYXZCb1VJOW9weThLK0E4bFVhZTlzUHNJbFAw?=
 =?utf-8?B?a25Sb1hRTTYyMDFONDdjUHB3Y1hkTkkyNTdzWWZIcWUzQ3lnOVIxakJ4ODR0?=
 =?utf-8?B?aC9teWxwWFNJSGc1NkF6Z1UxdllKOVJ3bUhwMzFaZnkrUWJ6TTBRMlJHK0JQ?=
 =?utf-8?B?QjIyQ1FIOEwybWZDaGFFTTdqaUhnTmRSMmd4UG5BU2F5SUg1V0hGMzJkMFFm?=
 =?utf-8?B?RTlka2V2K2Jwdk5kdnp0dVFCbWl5VDZrdkpRV3RxdXJaNmdsVVpqMUVvaVZX?=
 =?utf-8?B?ZGkxZkpCa0d1RzBReGJ0WDBwWlJwaHByaUFQU0VlcjltTnFYWHdOZFhHSWdi?=
 =?utf-8?B?ZDVqSjRsYUVvQ0hJK0xHSnd0YnNNWFJYNVpSU1ZyaHdibjhUam5BZjBWTlFX?=
 =?utf-8?B?M0o1Ym1tUGlObW5aQVgzRm1Dc2prcTgrZ3RwNkROS2FCN1JSS0JPVnNRSGta?=
 =?utf-8?B?T3NEOHRRd2hQMEZTYTdBMFdPSFZWWVhweXVmaEZSbGc3cVh6VjRmNDM1Vjd2?=
 =?utf-8?B?V3Arc3RWTTVJN3ZDbE5RdW81cEpSL1Q4NjBNT2xucHpVRFh0c0p2a1FiRncr?=
 =?utf-8?B?bDJ1M2pqdVF4cEpoQi9WUjI0ZUhJM2VGNW1lYVAxVWwveFBTMVZyblEydlZs?=
 =?utf-8?B?Y0JUSFRlMFBYQkd0NVh6S3NiVVRua0h3Tlk5T1Y3M09VSzFmS0RLQ0tIQ3Jm?=
 =?utf-8?B?NUNtVCtjdm1heVVMQnhFQys4ZzRhc0dWTWZiZTdMcnh3R0dqaHVQYk5oNXVR?=
 =?utf-8?B?b0VNMlRicStjSDBSWTR3S3dIZzhibHVpUTZqL1IxZzVMc0l2Rm1jT0QvYjZY?=
 =?utf-8?B?cVlSOEdDZFlta2VaeTJObGE2aGdmYkJkWEI3elpkMGJCYnJnZXg2S2t4WWhF?=
 =?utf-8?B?U1NBdWpacG5XU1cybmVsMEpPVU5LWW0yWGZPOWxoY0VIK0paUHhEcHZvQzBX?=
 =?utf-8?B?ZnNJSkhrcnRoQlRHY0NhbEhnbmtIMWdEblVpcWxUckowVnhSVFl0RkFKdFNz?=
 =?utf-8?B?N2hjcXhZYUVtM0QxSHhXcmM1emY0UitlazVuUnRnN3Fyc2FBc1k0NjRSZktP?=
 =?utf-8?B?Q0RKWjJuYkFkTnBQZzdIWmxGQnA2VnhQMnNCSlp6MmlBMHZhdmJkOHhmSWlu?=
 =?utf-8?B?eGYvSWZnclFQRG1ydnhmamdKdVV0NU15bDBKUVlZbXBvVHM4dGlMU2dTU1dn?=
 =?utf-8?B?QUtTZkp4ZUZFMngrbEVqNDVCaHlEamNlT1RZUkRhRGF2amd3cWpjS0tsbXN4?=
 =?utf-8?B?STZYUy9xTU9GOUs4TkFlNVlnNWlUSGMyeDhzbk5sdHJRWDR5Ti9ZTnlUVERL?=
 =?utf-8?B?MC9QSzdySCtzRjEwdU05WFVEMU10cDl6QWx1RW9nMk9obHhZdnVvcFhiVGlq?=
 =?utf-8?B?Slp5R0pvVlRYUU82Wm50NGpOWTc5OHJ6RldBWUZUVHlpM1Rza1FreE1COXho?=
 =?utf-8?B?VWtGcE02M05RSldZenM3MjhTcjN4ekhOMzhKR1V5blJKeitCc2g2ZVRBTUJQ?=
 =?utf-8?Q?nipa91LLFrrAx5rY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df9b60f-35dc-47dc-888c-08da3cd148ec
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 15:31:19.7982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baSRFq9ecpZNmtXG+ng5Qso59GVo51dWxBNUTDWDyKzZME0fWPfDObbOkw76oY/tQjxJNWGTcHEE0T3tkLPTEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4158
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
Cc: robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19.05.2022 13:26, Marek Vasut wrote:
> Convert driver to use this new helper to standardize
> OF "data-lanes" parsing.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Xin Ji <xji@analogixsemi.com>
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index e92eb4a407452..87d7658b92fac 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1637,16 +1637,16 @@ static int anx7625_parse_dt(struct device *dev,
>   		if (of_property_read_u32(ep0, "bus-type", &bus_type))
>   			bus_type = 0;
>   
> -		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> +		mipi_lanes = drm_of_get_data_lanes(ep0, 1, MAX_LANES_SUPPORT);
>   		of_node_put(ep0);
>   	}
>   
>   	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
>   		pdata->is_dpi = 0;
>   
> -	pdata->mipi_lanes = mipi_lanes;
> -	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> -		pdata->mipi_lanes = MAX_LANES_SUPPORT;
> +	pdata->mipi_lanes = MAX_LANES_SUPPORT;
> +	if (mipi_lanes > 0)
> +		pdata->mipi_lanes = mipi_lanes;

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   
>   	if (pdata->is_dpi)
>   		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");

