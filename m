Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF1383E53F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1B710FF58;
	Fri, 26 Jan 2024 22:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D28D10FF56;
 Fri, 26 Jan 2024 22:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706307784; x=1737843784;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pf5VEu3L5azT0asLLbR1rDez7MQXYIyLl4+BV7tlzUA=;
 b=nZpbeVgn9oTIVXHnw9smNR0SH9ba8sK/JniaMfpmo85lRpUlxlpcdEFs
 FcPz+UuC/ohO/ISTGf/qqV4Jv067miAlTaMU8DviZox/Bzcadzx8aECdz
 iy7g+7xtfU9hVUqj1NnblqMANeeI9vdqsYKtN/0hvDQFh1s8yY/j0lTfs
 TkqfcD5TSU1OvJP758X4jrwylRjqgsNlUA8VaGEssCzhCdmGYDbrcYHEb
 UPTPFcNP+nDZXPzjqt4ZvVygAgT0fE756src2/5fcoQWfCFi93TBrGlmU
 zEql4k63I4yekLKd1g34c07MQhTTo1TpLg0BX7WOFoRfR4DF7u+TKBPjX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="406321296"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="406321296"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 14:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2719642"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 14:23:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 14:23:02 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 14:23:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 14:23:02 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 14:23:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G29yTnmbNGDP+g9Z67TqFBqyXBxo5Xu6lHTxvhQ2kAnVPYCRTC/nlOsJOQvgbaSKExYNjdOIqOpI8qNUujpSrPbWhJHctQJ9xZlC8N2+yPf+RQdMdVp5mFnpm56mR7C63zyFlYp9sb7Zy+PPm4cGvfFNxGqF46P0SwTdSnutMN8h3gxfyWFkz0JDlJSJKvCigKcrFUoM8ZsncRtTbU1V28rlB+Ngy7MK9xDmuzTi34yFJK5KmPyHPf0v4fSjGeK818wsYH00oUoehiuAIsVoPi2bkqy7UfetKHcg5VmPTkI9O2sjXKJgLIKCfRGgnsa5ihx+8k6yxLS6YenM46qf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crm1CRKGYaFyWK+1paMYCEVZ60WQvHJfoqFPuZGHcyM=;
 b=D1EzmrL2924lxJrrl6+6EHvdz5CI6zPYRVQMqAzRNH3MSYZjthODXZVaNLqfYvVtLI3050aICv0StCb2Rmu6h7OjYMGG+7fyqVZU0VhjZOMPncvvcRaOTNIP8aAOdwJsKo64ztNZLH/OfjAYdCn44pyiF4Kwk2zwK4asc7BAGaxRKylezrztJyUe33volA0xlR+ybfogJtBf6g6E9dBMxJlXaK6ZOAKFA82NRNoZJYJFIASEtjaQ+DLrLs6aqXhYddJoyTGeSAblCIorww+pg+A8oYeuoc84epFLP9QlHEIuwwQWh99OEZxDwhnDzoFjm92JE/2QVrcM0cx8vari/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:94::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 22:22:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 22:22:54 +0000
Date: Fri, 26 Jan 2024 16:22:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: Re: Re: [PATCH 3/5] drm/ttm: replace busy placement with flags v6
Message-ID: <gvhkoky553gdmbtllaiyesejzg3xrgmxkoptnk23pev53uacsp@vvm3uh2v5kds>
References: <20240112125158.2748-1-christian.koenig@amd.com>
 <20240112125158.2748-4-christian.koenig@amd.com>
 <0049f12e-ce96-4320-8158-c5a23164261f@linux.intel.com>
 <fe9875a1-1cd5-4b2d-bfbc-9d779e79823a@linux.intel.com>
 <835b15e7-a2c8-4c03-9789-13f78078a024@linux.intel.com>
 <4a2hta7mv3mu4eoobtqtv4kmmdbrlowzbbrwjht73bzb2aoziw@awfcv5vhhnly>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a2hta7mv3mu4eoobtqtv4kmmdbrlowzbbrwjht73bzb2aoziw@awfcv5vhhnly>
X-ClientProxiedBy: SJ0PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:a03:338::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 370b1b0e-4908-4672-349e-08dc1ebd575b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3RNwOcQcX2hA+m5VZXLMqN5OVpHo/rEhGst33uIyY+qwjfZVxoT5rgN6N0NT35/L3PIChaLX0VHSHBjReLUInFwcP4AX11nTQJHH1dVunE9jxLPQGWdqe4/tCyxHCSdF7n9vuAjN4CfN0LHhVXDCRANjHDBsMfa7jzkO54+cNaDIhfNQb35iYKKdS5h1rA6UoL/jSqbOqxqduk8DCHhDt7r6BDBqP7XhUQzF8lTKeRc0NDAb3yU+SOqqBORflm7SYt44GWONVWJnucx4/+1YYTieyWqX3ch1wQvOvqUlNGFI4ssq7pdUPC0Ig8FO/GI7G9LJTNDGPn9CQJRYeb+EhKhBchHx0ZRJPQAHBCxQFfdzHUty4HUD+E2nPO9efNoO7LxnCj5hQwcs5/N6s8R3cL7wR02MzyoxtmLcAhYAvXddAWPjnZtm0EqG4T08wUW6Qen0/B6wVhjE641am1cvfJThXTiEvIaeFK4DJQ4rWxZMZlxUxuaaSSmGH6ogwu++Rp+MTfVsGMc4YeDIfN5knbq3KFB2Q0dQ4fZFK5h/05RGUSkYbehRiRpUX2pkEnUW26mXNU0xzVXTsYBUhxeIEnukqubRIhVYJv+3BwE6aLTTYvty49lobAZ5R6lNTwPB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(366004)(346002)(396003)(376002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(8676002)(8936002)(4326008)(478600001)(66946007)(66556008)(6916009)(6486002)(316002)(66574015)(66476007)(83380400001)(2906002)(38100700002)(26005)(6506007)(33716001)(6512007)(6666004)(9686003)(5660300002)(86362001)(41300700001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGVzblhsTVhFL0R0WDhQZlVibW1qRlYvRzNjS1V3U3lkWWprQUF1UzdtUmhD?=
 =?utf-8?B?NWtEZi8zeHhSV1RyNTdQTXNsMXJlNktzc3k0L3c1UFJOcmVIRTQ1K29ydFRB?=
 =?utf-8?B?bVJWK3AxUjhrdnpmdXhCYUZtQ0tGZFV3VkFSU2l2SmsraUxGdUx3OEc1NnFs?=
 =?utf-8?B?RndxN1dubGdnWEt3d0s4VzV3NXRGTTUxcTRrZkl2OEY2MXM2WFJwcEU3OGtP?=
 =?utf-8?B?RmJYK3NNR2k3MnlNWUI4RWpVRXJOYVdYU0RwOVBoQXVHdFhtbGtBRCt6Y3hQ?=
 =?utf-8?B?cWU3U2pVd0JMa20reG9RVTNoTkVNWjVYS0NCendhalJndDk2akR0aENvdGhW?=
 =?utf-8?B?YjdkcTZ5dXIySWRDc0EvVXRLNDhqcjBtaGdsSFRVZ3RUN0k3akJHTW9CYTZs?=
 =?utf-8?B?Z0NiNUlRLzJqUWZwVnNZbGFidzRadmVQTGp4YXRMRVN1MmMzNjZMWnFjbG1x?=
 =?utf-8?B?R3FHMWtqOFd6SWV2TnVtU1V2aGw4V0JycFV4aFRZWkZlTEVobHlyblMvMHhF?=
 =?utf-8?B?Z0pGSWY3dy9Hc21kczVhcm96N1hZS0pSTTBOaCtYSDgwWW5zaElsTTNyU0Jk?=
 =?utf-8?B?ZnhKK2ZzM0loNFdPemZKTGJ0WHVnSU1xOUJ0QVRMek5tb0IvRU5vd243RTkr?=
 =?utf-8?B?Ym15SURFWWtQanVzS3JTTDNlNk80TWFFVEx6VEdSTEp3MG5zWFNjczltUnZs?=
 =?utf-8?B?RUlRK3VycnJjdGp3eHZ3TjJiSStjYlhTb3NkTENCRVdOb2dVODJndVJ1VVRq?=
 =?utf-8?B?clozMVBzT1dJb2djVmFwRGJlTklRMC9zWlFhbTZIZUdpbnhrZ3ZhUmhPdW92?=
 =?utf-8?B?NzVaOUg1WEE2NGtKWXJUWjhiN082M1pQWEJWY2lySUVZenJmaUwwTlpuMCtj?=
 =?utf-8?B?NzRra1JJd0VuNjZzd09YSWFIcHRTOUM4dkRSWWg3UmVZTkxLeExxKy9rMVdO?=
 =?utf-8?B?a010bzRKTHpWdEtEM3ZtSzRsNVhMZ0pEMlh2dzJBVmhtWnlpN1dBZXp1ZzdC?=
 =?utf-8?B?RU80bmZqdHN1aXdoMGplL0labWpQVmFsSXgvbkRURGdXSXdEUG9va3dDZzBP?=
 =?utf-8?B?VFBYeHp0bmkzY3F4c251bHVESmNUMFdZYWpHU3ROTDk3bUtDTVFBd0thaTJR?=
 =?utf-8?B?c1NMaGRGN2NVUHAveDE3bnVkcE9RY0ZldERmSytZbXpZeGZRWjZ5blJINmFG?=
 =?utf-8?B?NjdZTDdJQnhWZWx4Vk8xM1p0VHVqY3VYVTdHYjNKcXlsR295Y3lKUzQyYXJp?=
 =?utf-8?B?QUxXaVFaSnlHKzhiRDc3bksyc0JINUJxUWMwNFo5S3Nqay9GYVJNdG9OZXFS?=
 =?utf-8?B?SnV2aFIwdUw0WXgvMFF6SG9kejE2NGJIQzZjYUVPeVFEY1FDcVZSN0REUEVB?=
 =?utf-8?B?TnJ6a2t3OHBVZUJjMEEyNCsyNGZDb3B2aHdhNUNBRHpLNUVuMDladEM4dUlL?=
 =?utf-8?B?eVhjM3lISUdVRjZaTU5DekViakdNNXFURTNwNXNrQVdKOTZwdklybDR1ZG0w?=
 =?utf-8?B?aWFiZ2VZWllkd2J4cVJZV0RNUjMwZkFZdnFDSGRiSmxnZExjV1lsQUJzajFX?=
 =?utf-8?B?Y2NkbmxPaW5rc3lHQSs2bUdONWUzbEtOSWthV293VVFHa0FXUWlmUElpQ25y?=
 =?utf-8?B?akJZck5MRUYxZ3lta1RMMG5HdVFQZmRMY2swK1YvQmlHRHpwZTlnNE5CVkZL?=
 =?utf-8?B?cXhYU2paemhRZVdCaCtKMUhQME5vNE8rWlQ3TWdjNkNTbFlwU29QdE5TK1RG?=
 =?utf-8?B?UStxR25NV2N1SlFBanN3Rk8vdEJCVjlLTWxLRE15Y1ZxSFJLWkxDai8xT0JC?=
 =?utf-8?B?SGJpZW1saGpFVXFNMDN3MzFKdmw0VGNyS3gyZElOcVhPZndIZjh0aS9pcks3?=
 =?utf-8?B?UmtiYitzdHpLYTVFak5ZenBRQktsUlVaK0FXb0l2TllHVEREa2hHZFBxVFZp?=
 =?utf-8?B?TnpsMGlDNzhHRURqNW5Yd3Byc1k3K0sxY2p2aGpkRldSUFIrc2h3U2ZGZ0M2?=
 =?utf-8?B?RHpmNENadFUyV1V0N3JFSlc5SVlobjdtNXZITmh3SHRMa3BCSmwydStMN2Vw?=
 =?utf-8?B?TGVwSDRtaG5XVHRYRjFGcDZ6RHJqN0IrUDFUSndIOXZ6SUl6VW9pbDB2blRP?=
 =?utf-8?B?VjJCYlIwV1ZrYjA0WVdYZVY5WHV4U0g1NmdwbXJHK0g0Y016WlFwRUZlOVkw?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 370b1b0e-4908-4672-349e-08dc1ebd575b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 22:22:54.4574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvEjOVPeZxltrtfVlF2a0WsK4j2rAPkAffwgL9Jn0MIE9XR0hC3bTFe3Zsy+DN6pliFFAOryn6Xc7zBi5LKpWHpkP8bx2rBIF4vxMVIJRDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
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
Cc: kherbst@redhat.com, michel.daenzer@mailbox.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 04:16:58PM -0600, Lucas De Marchi wrote:
>On Thu, Jan 18, 2024 at 05:38:16PM +0100, Thomas Hellström wrote:
>>
>>On 1/17/24 13:27, Thomas Hellström wrote:
>>>
>>>On 1/17/24 11:47, Thomas Hellström wrote:
>>>>Hi, Christian
>>>>
>>>>Xe changes look good. Will send the series to xe ci to check for 
>>>>regressions.
>>>
>>>Hmm, there are some checkpatch warnings about author / SOB email 
>>>mismatch,
>>
>>With those fixed, this patch is
>>
>>Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
>
>it actually broke drm-tip now that this is merged:
>
>../drivers/gpu/drm/xe/xe_bo.c:41:10: error: ‘struct ttm_placement’ has no member named ‘num_busy_placement’; did you mean ‘num_placement’
>   41 |         .num_busy_placement = 1,
>      |          ^~~~~~~~~~~~~~~~~~
>      |          num_placement
>../drivers/gpu/drm/xe/xe_bo.c:41:31: error: excess elements in struct initializer [-Werror]
>   41 |         .num_busy_placement = 1,
>      |                               ^
>
>
>Apparently a conflict with another patch that got applied a few days
>ago: a201c6ee37d6 ("drm/xe/bo: Evict VRAM to TT rather than to system")

oh, no... apparently that commit is  from a long time ago. The problem
was that drm-misc-next was not yet in sync with drm-next. Thomas, do you
have a fixup for this to put in rerere?

Lucas De Marchi
