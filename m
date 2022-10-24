Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3760BA2F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 22:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD710E00A;
	Mon, 24 Oct 2022 20:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB5F10E00A;
 Mon, 24 Oct 2022 20:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666643319; x=1698179319;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PkimrQzHZRKBRAWNLJ5/iM/HWCydeZPNoRZTvAWZSvQ=;
 b=Xa/+8PIY6dEKwVUjkZOI3/VHa/9Cropzuku0TAnKXDm5MusMr+fL/MCm
 bH1ABgdYNBhcC53PkS0E66KFgDu/fueHKJGuZoHTBLHH/eAgKfLQppzA/
 39cyGh67+zh+uukd0XDaxVex1WbuR3sxLBM6BfOCgNxIvBr2F5bkfnU5P
 sckPWusdGVUDTN7tZipkH9uGD5dOJtKH9RRWTdehua60mCc9YEZjmUd3c
 8rQFXC1ZkhNUR9e0jPBOTIAiCvGPRfGsaj08dkl3ENFwcT7eEBqAvjsd/
 cWxEg9z52arXomX+NwvNOCvFTMOeLMmLKR35sbWQkY0W1fgbQqRZnnTJX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="294915753"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="294915753"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 13:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="626187337"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="626187337"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 24 Oct 2022 13:28:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 13:28:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 13:28:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 13:28:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 13:28:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaYaf4Lfdn+Fh98b4DUqyrIz8sXrVFpw1rl6QRo85HCNUXYOSo8il8hWIDpWintXut/tMoVkSwmNQHWfWarCXdVhhaOpkm8uh9LR4YTGq/s8iufyt8F0E1M5Qx70ExWhLKhc4SF01gIrafnEjcQUbmDxeQIEB5HeTPaGkEcscE6i7a9mUn1AW5hYMXOSp8s1spgKD7gWe/ilhHo38lnobPn9EBvJnH1QCmLGsP9ekpLC1ZJzPY+23jgueqLGlUsSq20nAfTTsaSJOuntD3B8AlCSaxAWU0DLh2Ygp4wpbUxf3W+B248X2Z1W6+o/tbyjyXvi8BtT6WlmaOfZ6HR1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V78MnuX6voN/G+EgsUvmFqdb2pdD+Ym4lzGzk4tY4ek=;
 b=SsE0kanDHFJucvyBBJu0w8iQDF5/dQw6aHIazthfUS5tplAflqHA9lacd2kh3JcMP8WaC0bUXDXfhLtnHLvOIjapEQBGVr8Vrjog+4ft3rU2VqLs4bKK9zPKoxGJ0HkHVguDoyZ5LRsUJVaepx7kRaNeelkZ5rBW2COHljI0wSgh9YFNPwf2t1lBvhvKC+4a6dpR5qkLR50c1buqRu+jRNB/9QPP+ENIq6idfyzUxwkwhyL5cSIMEoOETLqFc99iN/3+wg3r7XGyGbtrclRzERAr2b1/21oqKtCwBuYxluJRKWAsWZysnWjhleBtJh8JX1CX84qu7FZSls5SCihhtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH7PR11MB6673.namprd11.prod.outlook.com (2603:10b6:510:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 24 Oct
 2022 20:28:35 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%4]) with mapi id 15.20.5723.033; Mon, 24 Oct 2022
 20:28:35 +0000
Message-ID: <f15199e5-0ff5-1a8e-78d3-26803bf55eb9@intel.com>
Date: Mon, 24 Oct 2022 13:28:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 7/7] drm/i915/guc: handle interrupts from media GuC
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
 <20221022001008.2340224-8-daniele.ceraolospurio@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221022001008.2340224-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH7PR11MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: cac25713-a758-4847-404e-08dab5fe539e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a2aIRYy+ENz2FHx67Wx/h8Gp28sFBy/0OBqJWfx8VpnOVa2qNsLiZqRPX4z5aasMrS+e8+nATgrcfcKZlbF8E/Pg1lAe4Mc7WFsRgL8YgpnHJsdFbnglOx9moWyA90+fD+7d8mXn8L0v38PFXaoVk9zo9v6cPAGYLSWw8k6BHBtn1ZvXiVR8eRV7vxc/Aa96cZYXbSRFku9Y3AsXeQu4uzV35DqeyN7R/3M6s4fKgeiJ7dwOUFPJbu97dNCy9juaYS54bBSB5to6fl9ojgw89vEjkU8zINyR3Wqa9vXtT9wiI+N2fNmdFAHzSME1PowKtS1N9UHeVE/+IZUyEA7k9h5341kQLTMCk8kykvmwa+IqGe9aGmUlXchdg8q5KXDysUnfS0FsN+QYaJnq1HUE65r0VY3mjRL1Is+gasck0az2OG0q0jASaJ/N8Ed85wm5tME9KIf+ibfqlhx0an3MPz/seUCbnabLTsdw/9cdidt7ot32OEMvrAFWueX0x+OWgui7fQQw4KMPJS5khhUQqXieyWTBuillm9UwK5AbBPTWVHK2H6qeHEfNIsVgnZw1nD3NqVU6yY0Ce4tRUT0JpCnQVdkmhYgxK/ida/YBJ9AMMRJCfhN1xjpaM1TPFR1NGOQd3Xkdvw+T+aumX5pYRaa+dSZSxD82vXBL95HMeue2EwUYrApudYQR9jhnXkf2ZSyh+fvpHu1b4n0xWFD7xAyqnisNm09tPwMUochFSoTDVs7LL/qJAZo949BXxSDg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(478600001)(2616005)(38100700002)(31686004)(966005)(186003)(66476007)(8676002)(83380400001)(53546011)(6916009)(66946007)(36756003)(31696002)(41300700001)(450100002)(54906003)(26005)(86362001)(6512007)(5660300002)(66556008)(82960400001)(8936002)(2906002)(107886003)(6486002)(6506007)(4326008)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVJVNDJ1WFhkUVFOU2IwNklMa3lLN21lTzkvVUpFV0ZTME9lOHA0WUcwRkR2?=
 =?utf-8?B?eGhFeEZrMUI3RUU0REhyY2xUTndTVU9FZkp5WnR4Z2FhY09pSkoyY0V5UG5x?=
 =?utf-8?B?RXQyVzhOa0NaOVErdGdGeFhGaWRYWnViQkxVTkkrYkdYYnNSeW0zT1h5MUpn?=
 =?utf-8?B?elN5eDZBS3J1ODY1VTEzUVU4ZHJiTFd2LzZ5SWIwOWUrUDhRczBKMXludy82?=
 =?utf-8?B?amsyd2tMUXF6aHNVajdFWDJlcTZCWk1ITjg0S3hWSjJ2ZHRRVEZJdURSeFFh?=
 =?utf-8?B?M2xBZnZFRXVnZHpBU09lM2VuN2wrWWQ5NEhWS2MyM1ZPRzdoUWdYUkN5Tllm?=
 =?utf-8?B?MXIyTG5EQmxyR0JqZjJkdkRnNVJFTjVBTUFsVUhHL0pjVWhCZGRsdjdaNkhh?=
 =?utf-8?B?OUJWdzdHb2dPbzgrdFdQNmY1N0RRRHRXbjcyUi9NcGJINGpnLzV3aElzK0t4?=
 =?utf-8?B?M3pvT1poM3p5UkVCSy9VUEhUbms1THlhQWF5bWpxMUJtREI3YjZjVnR2UlJJ?=
 =?utf-8?B?ZkRDZk9PTmpadzJyOWlsR2dqVGttMWRrNlgxa1U3UjVHdzRUOGhhTkt5cEU5?=
 =?utf-8?B?STYwU3hUVHN1Z2dyVzFvalJzbXQ1amdzQ0pKaFFhcm0xYnY4dVg3dU5NSXlu?=
 =?utf-8?B?aW9DaGJnS3JCQ0xPeWlwQTNOcFF5Zjk1Q25ZRzVFU3lGOTRTbUNWSVg2anha?=
 =?utf-8?B?RG94cjNmSlhmYWJKb2huOFVNVlEySXJHTkt1M2pxOU51WnBocWxlajY3NDhM?=
 =?utf-8?B?QUZtYlB2REJKOU1KdHIzK1lzNnN0d3JnZUFVQjV1VzFCV0xkeGhpM25LdW9u?=
 =?utf-8?B?Rk14a25KelNxbno2UXVCVkZQTUFsWTI2dU1sUlVVYXdCU0thVUZjQ3ZrUWVp?=
 =?utf-8?B?bG5LN3haZWJLUUVwai9TSW92aVlQZ1NZWVdkaUk5RktlWWdrSk1IYUdDSVkw?=
 =?utf-8?B?WHpaeDdXdTJzR2lCaFlTVHlPOTRoWW1Mc2FrSEhsQ0IyeFdXcVZMb3ZURGhT?=
 =?utf-8?B?RFZkM0VSZ0FmVUs0ZHpsNWhsQ05PRktQaHlGS0QzRTBwcERaU2VJb0g4YUtS?=
 =?utf-8?B?citEdzVydFZnMTBBV2Q5NE5GeWZqbVdyNFB2NHg0a29yN1R1MktNeDBBV0pp?=
 =?utf-8?B?bjRRM2lWbm5DQ1ZKOWZUZ2dwVVAweVVmUUorSnFhR1E2N2wzaGhzQW5Qa3lZ?=
 =?utf-8?B?czllMDhEdWdIS2dmTlBMTGFZY3JLK3RSMS9iS2JKQ1lSM3VoUWV3b1VTT0Rw?=
 =?utf-8?B?djhqNXVrTGFkdGJWODl6UnhvYjB6cnQ1N2s0NStOMFlWdyt2MVdIcjRSY3dC?=
 =?utf-8?B?RnBjREtYSmF3YkJBQ2p5ZitSMHB0OHJ6Rm10VG5waFh1ZERmZXY0OUFDWGRz?=
 =?utf-8?B?a1pOTE9qZ2hLU2JjNHNHdFNZU0lKYkE5MjhBSithMTloUnVacmh0RndxTS8r?=
 =?utf-8?B?TU14Wlpxb1BMNUdjK2RuZUJKSGluc0ZJLzhtWXFRN29yZ0NWUUZBTFJOMUtB?=
 =?utf-8?B?enEweGNSMlBMaU9neDN5a1Y1NFJZWlRvOEFYR0lhbjRmVm9ielA0bkFzcitP?=
 =?utf-8?B?NnZUMkgyYmdHcWZHZVB2MjdnTUhvbXgwbWt5SENLUG9xWVUwUGNwTkxsMUpu?=
 =?utf-8?B?Rk12bzVOV2dSSVpaSS9rL084UE1XaWFYdC9JUG9nU3JtaHZuVE9MWUdjK09n?=
 =?utf-8?B?Z0orN0V6cnRudnhiQmw4a0k1UURHSm5mTDJtR0phMzlsZjFOSHpucFNnVzNt?=
 =?utf-8?B?R3pCUWhzc1MrcitPTlBvYWdRUzIyUWhnNEIzT1JRc1pFM2c1cGxQWXk2YVBO?=
 =?utf-8?B?bUc3YnVDL2NoQ1NvUkhaRlJUekNPS2pzbnY0aXliOUh0UkZvWi9tUFZ5ZEw2?=
 =?utf-8?B?UUM1TG9OZUtNVEpMYnNiZnlqbGtTV3Z5dTdRcERWaVE5d3hNVUl3N1JwaXo0?=
 =?utf-8?B?ckZTNllid3psblFlcUtjeFpIaVhKYkVVM2RhUlhDSmVlSlZHOERLUkxJbFdR?=
 =?utf-8?B?ejVzQVhhd1JKMmI3MWJUTnNTMDVvQk9nTmd1VytTdUdCZXlNUFZFZXJRZ1Zk?=
 =?utf-8?B?d25CREZPZ2ZEaGwzcS9CMHZrUzJlNzlvYmVGclM0LzVtVFN5VisrOG1ZaDl6?=
 =?utf-8?B?QlRsUFlwRGFDVGVyczdjZkVWWE5yYlA1dit6d0MvbUJmSXp1NmVVWUR2TlhZ?=
 =?utf-8?Q?hBPTJc5blqQ9MRpzWVbHwaY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cac25713-a758-4847-404e-08dab5fe539e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 20:28:35.7890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCcLEg/oRNxXBlMgjQQBOliyuGpQOG3I+6yYAaU9JYhRphIY5KevM2E4CBH325wgiKxm0AAX0OucwqAE0rQ5ZQfpMcCgnlnMYes13mrNCH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6673
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/21/2022 5:10 PM, Daniele Ceraolo Spurio wrote:
> The render and media GuCs share the same interrupt enable register, so
> we can no longer disable interrupts when we disable communication for
> one of the GuCs as this would impact the other GuC. Instead, we keep the
> interrupts always enabled in HW and use a variable in the GuC structure
> to determine if we want to service the received interrupts or not.
>
> v2: use MTL_ prefix for reg definition (Matt)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

When re-spinning I forgot to paste the r-b that Matt gave on v2 [1]. The 
patch is unchanged so it still applies. Including it here now so 
patchwork picks it up.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Daniele

[1] 
https://lists.freedesktop.org/archives/intel-gfx/2022-October/309140.html

> ---
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c  | 21 ++++++++++++++----
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c  | 29 ++++++++++++++-----------
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h  |  5 ++++-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c   |  8 +++++--
>   5 files changed, 45 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index f26882fdc24c..f6805088c0eb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -17,6 +17,9 @@
>   
>   static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>   {
> +	if (unlikely(!guc->interrupts.enabled))
> +		return;
> +
>   	if (iir & GUC_INTR_GUC2HOST)
>   		intel_guc_to_host_event_handler(guc);
>   }
> @@ -249,6 +252,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>   {
>   	struct intel_uncore *uncore = gt->uncore;
>   	u32 irqs = GT_RENDER_USER_INTERRUPT;
> +	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
>   	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
>   	u32 dmask;
>   	u32 smask;
> @@ -299,6 +303,19 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>   	if (HAS_HECI_GSC(gt->i915))
>   		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
>   
> +	if (guc_mask) {
> +		/* the enable bit is common for both GTs but the masks are separate */
> +		u32 mask = gt->type == GT_MEDIA ?
> +			REG_FIELD_PREP(ENGINE0_MASK, guc_mask) :
> +			REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
> +
> +		intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE,
> +				   REG_FIELD_PREP(ENGINE1_MASK, guc_mask));
> +
> +		/* we might not be the first GT to write this reg */
> +		intel_uncore_rmw(uncore, MTL_GUC_MGUC_INTR_MASK, mask, 0);
> +	}
> +
>   	/*
>   	 * RPS interrupts will get enabled/disabled on demand when RPS itself
>   	 * is enabled/disabled.
> @@ -307,10 +324,6 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>   	gt->pm_imr = ~gt->pm_ier;
>   	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
>   	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
> -
> -	/* Same thing for GuC interrupts */
> -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
> -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_MASK,  ~0);
>   }
>   
>   void gen5_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 36d95b79022c..868eaf3f37da 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1548,6 +1548,7 @@
>   #define   GEN11_CSME				(31)
>   #define   GEN11_GUNIT				(28)
>   #define   GEN11_GUC				(25)
> +#define   MTL_MGUC				(24)
>   #define   GEN11_WDPERF				(20)
>   #define   GEN11_KCR				(19)
>   #define   GEN11_GTPM				(16)
> @@ -1602,6 +1603,7 @@
>   #define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
>   #define GEN12_VECS2_VECS3_INTR_MASK		_MMIO(0x1900d4)
>   #define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
> +#define MTL_GUC_MGUC_INTR_MASK			_MMIO(0x1900e8) /* MTL+ */
>   #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
>   #define GEN11_CRYPTO_RSVD_INTR_MASK		_MMIO(0x1900f0)
>   #define GEN11_GUNIT_CSME_INTR_MASK		_MMIO(0x1900f4)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index b3600be61a9a..09f2a673aa19 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -98,6 +98,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>   		     gt->pm_guc_events);
>   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>   	spin_unlock_irq(gt->irq_lock);
> +
> +	guc->interrupts.enabled = true;
>   }
>   
>   static void gen9_disable_guc_interrupts(struct intel_guc *guc)
> @@ -105,6 +107,7 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
> +	guc->interrupts.enabled = false;
>   
>   	spin_lock_irq(gt->irq_lock);
>   
> @@ -116,39 +119,39 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>   	gen9_reset_guc_interrupts(guc);
>   }
>   
> +static bool __gen11_reset_guc_interrupts(struct intel_gt *gt)
> +{
> +	u32 irq = gt->type == GT_MEDIA ? MTL_MGUC : GEN11_GUC;
> +
> +	lockdep_assert_held(gt->irq_lock);
> +	return gen11_gt_reset_one_iir(gt, 0, irq);
> +}
> +
>   static void gen11_reset_guc_interrupts(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
>   	spin_lock_irq(gt->irq_lock);
> -	gen11_gt_reset_one_iir(gt, 0, GEN11_GUC);
> +	__gen11_reset_guc_interrupts(gt);
>   	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void gen11_enable_guc_interrupts(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> -	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>   
>   	spin_lock_irq(gt->irq_lock);
> -	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
> -	intel_uncore_write(gt->uncore,
> -			   GEN11_GUC_SG_INTR_ENABLE, events);
> -	intel_uncore_write(gt->uncore,
> -			   GEN11_GUC_SG_INTR_MASK, ~events);
> +	__gen11_reset_guc_interrupts(gt);
>   	spin_unlock_irq(gt->irq_lock);
> +
> +	guc->interrupts.enabled = true;
>   }
>   
>   static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
> -	spin_lock_irq(gt->irq_lock);
> -
> -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
> -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
> -
> -	spin_unlock_irq(gt->irq_lock);
> +	guc->interrupts.enabled = false;
>   	intel_synchronize_irq(gt->i915);
>   
>   	gen11_reset_guc_interrupts(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 804133df1ac9..061d55de3a94 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -78,6 +78,7 @@ struct intel_guc {
>   
>   	/** @interrupts: pointers to GuC interrupt-managing functions. */
>   	struct {
> +		bool enabled;
>   		void (*reset)(struct intel_guc *guc);
>   		void (*enable)(struct intel_guc *guc);
>   		void (*disable)(struct intel_guc *guc);
> @@ -316,9 +317,11 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>   	return err;
>   }
>   
> +/* Only call this from the interrupt handler code */
>   static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
>   {
> -	intel_guc_ct_event_handler(&guc->ct);
> +	if (guc->interrupts.enabled)
> +		intel_guc_ct_event_handler(&guc->ct);
>   }
>   
>   /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 4cd8a787f9e5..1d28286e6f06 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -636,8 +636,10 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
>   {
>   	struct intel_guc *guc = &uc->guc;
>   
> -	if (!intel_guc_is_ready(guc))
> +	if (!intel_guc_is_ready(guc)) {
> +		guc->interrupts.enabled = false;
>   		return;
> +	}
>   
>   	/*
>   	 * Wait for any outstanding CTB before tearing down communication /w the
> @@ -657,8 +659,10 @@ void intel_uc_suspend(struct intel_uc *uc)
>   	intel_wakeref_t wakeref;
>   	int err;
>   
> -	if (!intel_guc_is_ready(guc))
> +	if (!intel_guc_is_ready(guc)) {
> +		guc->interrupts.enabled = false;
>   		return;
> +	}
>   
>   	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
>   		err = intel_guc_suspend(guc);

