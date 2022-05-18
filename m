Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E551C52C279
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 20:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0958010E38F;
	Wed, 18 May 2022 18:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B741910E38F;
 Wed, 18 May 2022 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652899452; x=1684435452;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MpsZLOEv60R8vMdtnfihFY8tCpfgvFbwKwSLVC7JIKQ=;
 b=nHKE4PDPx1hxsB2JJiV9wN7WyAbw7O01PABPXZxacka7Iu3cpG/Sylrx
 KkhbRvS2sLV/Zycu9//RMFEWP3J7vDjwee4gvMw6PAeYO2Ahwr0Chgdss
 QxD2k+PA51lNjTOo5BNjPssA+XwzV3cy5eUhEmAdcK/E9bbNvvkBa+hv0
 y6iYcI21RabEiSGvfYIVIcffBx7jwLGe4WED1Pv6gcGsm1+zU5v/71lBU
 hsELw7Cmlg5g/4dapONKKB9kVttRUbQhhfjwI3jWGzFCyVxBFzT3rFM6N
 8Srnu1QrbOJhDiOfjPs/yOhQPCrF56uIkHmHqcTy4VOm2JprweLdA0F/Z A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="269427646"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="269427646"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 11:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="569687669"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 18 May 2022 11:41:46 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 18 May 2022 11:41:46 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 18 May 2022 11:41:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 18 May 2022 11:41:45 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 18 May 2022 11:41:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQk/Ax/dInoekCKe3odRsGndFhXn7Kntchk1tfOIYjAv/KHZ+LHTYDmklB/TK8zQZy82K44WXoSOt06zTdBPwFb3CWQl6Dq7Vhh3edWjT3a/YMCuEf+IFr8Gltet0FgYjJ3PX1mWPiOgX9GCtisTUZPeMvWtOWuKRM/xl85Ux8YLcKkM/UgGoSpfG1HAVAQa785FW6EsM1/kDx/ANd4Ujv42NcGbpd65IWZpYdugi2AIU5gPP0ymlUcY3QXfM7Qp5cIAQxrJ2pfMMMoSLqNy9xJinsbtmcOD2Sj4fUo2BjZLDhr5F/UmmBXA5/nnZhAlqNAScZghCh89+Ip5pT026w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yY+ZXvDpMywvxPuQYN85qh0Y3c9+LWz+TaoP3eSMSM=;
 b=RbZRPUaEahv4EKqjTmfgtRFVfFrnyxplWzr1MWcsPWiwungzd4f930OQ5Koc0UBBNW+dwPNx9602+2KLnDmKP2VNvnU5hrNKnn6ToYAE3BUggR29INBEcnOYiTgYf7P7aUesyjjFcYGrq73cJsCgvF/GyE/YvEFChsMfkk8+wVpKWanaeUOyyg22rSzkpJUZ/sep/w1x5TFRm/4vOqtcpvyN3dHog7TL8Vf3xKCgZ2BotRVWcdJZSM8LernqlqzuKJp9H8+7gyIzJzgxq/rsjCHj2HIrJQDyQOGLlcmKSMgExmP9wGykfQQSxoYlXNwcx8LvAzEM/J/BNJaYsaw8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17)
 by CY4PR1101MB2182.namprd11.prod.outlook.com (2603:10b6:910:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 18:41:43 +0000
Received: from DM6PR11MB4514.namprd11.prod.outlook.com
 ([fe80::3874:dee4:2f1f:9f4c]) by DM6PR11MB4514.namprd11.prod.outlook.com
 ([fe80::3874:dee4:2f1f:9f4c%9]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 18:41:43 +0000
Message-ID: <0b92c096-7d92-f0e9-5ea2-a6b88b75802d@intel.com>
Date: Wed, 18 May 2022 11:41:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] uapi/drm/i915: Document memory residency and Flat-CCS
 capability of obj
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
References: <20220502141508.2327-1-ramalingam.c@intel.com>
From: "Ye, Tony" <tony.ye@intel.com>
In-Reply-To: <20220502141508.2327-1-ramalingam.c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::20) To DM6PR11MB4514.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 475fed73-d38d-4282-d6ae-08da38fe0e18
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2182:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR1101MB2182E63F9E1D07F086BBB82DF1D19@CY4PR1101MB2182.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJVtXoRvQP1d8jspw6L1Pq9OAvSGgBnqJcT8fB1PQ6bN/uJidxYjByIRnMmkuyL5kqBIIe2sO/jTrUL0Hk+qbck/aDK/dlkIpwSIqAJSAZEZZrd+kOlqjiPeZq0iVOUqCVWXgHVVJi+ICPRpAMZHgUFHLTDbwtLTuCAR/VRHe33zQiCtWe+pFflK2hZJsSBU6ABNsmSAtGDdjzaNJudSYYYmvtIuSoX2hXWfAV+NMN1flmib6CVWNuXyDPmLemiV+qsU5pa/qIFsbeNkIJnPIf/KXZlyi8LpZDgCc+1Agc1DSNsaA0hrSQexycU+JAaj6WVaiRcQzXLgs+6FQaP1gk3yHwOYNXE1dVAgUiy7YpwqI0nFFA/AUyWnhmkFHXGB2VEX5NOoqlzRN262Or7UuEfKCmWDU8pLxQsDE0bBVBdYJpHzSo8QCAayec3YZJ+1tX/XKgU9E5QZa6+cGB9HdJCT/r6E1kdnc0WvSuy+q8MU7NkS9DGU+2zPAq4/fXWTmGgw5i5BGuzpebLyTBCWv+seozI6eK8ntX5Oa4wVHCiD0QLP9JDk1u72DFC6VOXMhuBkphEQfPdxcBoKVk0VmLGiuj3SjTZ7NsKCISZ+RVTR0NKwq2UeLZywfd0SZJgG9c6k44nTrAbchuZhFJMcd/cWCsP9T927WA7mRBnaj/nCx+J32B/qwm2WFH6url/hnGXCcyNV0e2HB9LI+OxNa41qSv3GyaLuTdfEy4fKlkl+HF7vw4K6H9oCsgweY+0O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4514.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(36756003)(83380400001)(53546011)(31686004)(6486002)(26005)(186003)(6512007)(2616005)(508600001)(2906002)(66946007)(54906003)(31696002)(86362001)(110136005)(5660300002)(8936002)(66476007)(82960400001)(316002)(38100700002)(4326008)(8676002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmdoMC9oc1V3YlZsY1cwRnc5akl4L0VGZ05zanNtdk5kWE1ORUFkMFdGeTBH?=
 =?utf-8?B?THBZMUNBcnE2dDlqcCszc0owcDFrRVZkazExREZocnZWc3ppRys0SkxLb0hD?=
 =?utf-8?B?UnFJU3gyQ1BZSytwRVhhVHZZaWpTeDJYY1ZHMnljQjRlTUhOMkpKT1BxeGFy?=
 =?utf-8?B?dlluVDJQeHZhWVlWMzRqRHJBOWlrQlN2bTE2Zk9YTWw0R3JaRURvdEJQSHNh?=
 =?utf-8?B?QlhOb3FkYlFoYnNtTHZMYStLNmFMWURIRStlL1J3SjZScHp3NW1QMjhsRUti?=
 =?utf-8?B?YnRneEFSWE9Ocm94azUxa1k4RVEwNDNMLy9NdXpBdi9XVGNkU3FGNzFjNTht?=
 =?utf-8?B?eEQvSEN1WVZsOEE3M0xRN1lXTVc0NzNNZFpabXFLb1RjeVF4REF2dWp3dEFy?=
 =?utf-8?B?cTdHanNLYlJDSnFScElwUFBhY3Q0Zm0xRHBuYjFMTHNIdXZsTklpdldlNDQ0?=
 =?utf-8?B?djJkSG1TNTNsRTZlUkMrRXA0RDRBd2o5UU4ydkgxOUFaVTAvdHBNYmdjTm0r?=
 =?utf-8?B?SE1sTlN3M05LNkZxRTZuQUorNGdLSFVsbWF0UlV5SXV5VklLNVp3NFltZnkw?=
 =?utf-8?B?NmRKODR3UTVUb21Nb2xaYkF0TzZreDlYTHFuNzVUU0JrTituMkV1M2pVakdm?=
 =?utf-8?B?WXB1OXlscy92S1NKb2RwLzVDSDZQL3lMZFp4cUhDTWlCZ2x2UTJ0aUVqQlND?=
 =?utf-8?B?RndZUDZ6ak9ZRU16WlFaMCtrZXgzZE5oajdNZ0ZYYmpka1pwQlN1SXpTb1FS?=
 =?utf-8?B?VC9tWjZreHRGSmtJM2g3bTNTa2FKWHdtZlRKeHJqNEVRVHhKdm1GUFZkMk5q?=
 =?utf-8?B?dXhKczhDUXg5NStTODYvTkhhVlh0VHNiUXA5SkVyWGhOYWVWbGliYjBHQzBW?=
 =?utf-8?B?azMwSFRkZmtRMWprQVhwUldXU0FVZld1Q3ZkNVloUnFrMk1jRGdVbXh6Qi9h?=
 =?utf-8?B?NUZ2dDJjSUlneGZXZm1sTlhyNE1Ib29GSS8rRU9vb1kwc1dDdHcwWHU2V2Fi?=
 =?utf-8?B?R0dMUzFFTFNpT0xxakJSWXU0VWVyNDlJMUIrMC8vYjNoSE03NG05OEdrSDdB?=
 =?utf-8?B?OGxOd0QrVGxwWE5hVlJ4Qjk3YzJCdXNkS2MyZEFJdFlVdWNHbmNBQ3JyaXFj?=
 =?utf-8?B?bXZ5blJVcG00Q09aTXNhd1pIUklkNmhzS210R0ZKa2thdEI2ci83WHQxOWFu?=
 =?utf-8?B?Z2oySkF2NHNqMXpDa21uMUNnNXJ0ZXpuekVWa1l5MmF3UHJwdjcvWVBIOXFQ?=
 =?utf-8?B?eXBmVFQyanJVVW5vYUFvUUVZNTVCcW5jUGs5bkFPZFNDcFFCSWFNMEttWEk1?=
 =?utf-8?B?bG9USCt0bFdsV2J1aDZ4R2lRb2kwRTNXRTV4cmR6eFhuR3kxQzBKV0c5RkRY?=
 =?utf-8?B?cVJLUDJDSkZ5R2E5UnBYNGorY3FRV0NnVUZZZ1h1aE55dUFkSWxGL1BFWlp0?=
 =?utf-8?B?UWk2Y1RHNDRzMWtkZFFDTUZjbWtjTitVNE9NZGIvYVA0bWxtVU92ZDllQjd6?=
 =?utf-8?B?V3FUT2ord2Y0YUpIQ3cyd0FVWEIyaUM2R2JHRFY0N1pmRTBSaHcwbjN5UHBk?=
 =?utf-8?B?RjdETFJNZUlDMmEyQkhWMHlTMmpDK2pwSEFQMU5QRVJpdlc2ZGNOZ0xUdWYx?=
 =?utf-8?B?OHNGU1ZrOUFIaVZWbDdqMndObmI4L0NKeEJncGM1c1I2K1ZZL1pzakh4VFJ3?=
 =?utf-8?B?WFVDUDF2MTdjN3dNc0FzV3ZFOVgvVEVRRXdjSkt4VGlYbGlEUDgwQkV0WUJa?=
 =?utf-8?B?UWdMaGkvQXZUUkZ5dzN1OENnY3FKNHZYMFB5SVI0UVVWS1FCNmRyUVhtOTdI?=
 =?utf-8?B?MEg2cFQ5SHNMOWFBc2xObFdZSUMvWkpianVib3Nyc3U3a3ZzUFdSMGgrZzNk?=
 =?utf-8?B?VnFnWmNld2trMFFQQXlEcWR6Y3daUXh3c0NLOUdrdG92djZTVjVjYW8waVZG?=
 =?utf-8?B?d2ZvRmN3cnNFT2ZZN2R1aEdGL3NxVzhIUzBmZU0zbDNXZHAyQjExWVZpSy9k?=
 =?utf-8?B?ZEhDNjNqeXNUb00rUVAwaDJPbWkxRjFIVkR3Z3VSZXVtczUzQW1JaWVPQzNX?=
 =?utf-8?B?QTdXV2JYTm1lWm9GWXE1V3pmdzJ5K0dSSDI2b21lOTVyZlRHSExMeHJBNlBl?=
 =?utf-8?B?alJ6ZmlRajBHQ1FGeHFPaVM1UWJ2bDFtOEtGU0RBdzd2YXVZeGpCRUFMWm1h?=
 =?utf-8?B?dEhXR2xyWFFmbEl6Mm9JY01LZ1hsTVFkcnpQZjc0ai84UDF1WGtIOWJ6U2w1?=
 =?utf-8?B?eFp5QjNhZGR1bUc1RWxTcmZOZGt6R3VEZUxFNTlpYzhhZENxV1VhalVNRWN2?=
 =?utf-8?B?c3NyU3V3b0w3d29hNVpqbXUwVFFuYVR4Q2grN1BFbVBBOUpudnlkUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 475fed73-d38d-4282-d6ae-08da38fe0e18
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 18:41:43.8047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CYPjnC+5cUk519tz1sSSdXIIDUevpVU0pb7oPAVDw0/iLb+hfhVTMUa72QoWjGz7BKVd7pNSv7bnbyVnJYPxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2182
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Media driver never creates a BO with more than one backing regions.

Acked-by: Tony Ye <tony.ye@intel.com>

Thanks,

Tony

On 5/2/2022 7:15 AM, Ramalingam C wrote:
> Capture the impact of memory region preference list of the objects, on
> their memory residency and Flat-CCS capability.
>
> v2:
>    Fix the Flat-CCS capability of an obj with {lmem, smem} preference
>    list [Thomas]
> v3:
>    Reworded the doc [Matt]
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Matthew Auld <matthew.auld@intel.com>
> cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> cc: Jon Bloomfield <jon.bloomfield@intel.com>
> cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> cc: Kenneth Graunke <kenneth@whitecape.org>
> cc: mesa-dev@lists.freedesktop.org
> cc: Jordan Justen <jordan.l.justen@intel.com>
> cc: Tony Ye <tony.ye@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   include/uapi/drm/i915_drm.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index a2def7b27009..b7e1c2fe08dc 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3443,6 +3443,22 @@ struct drm_i915_gem_create_ext {
>    * At which point we get the object handle in &drm_i915_gem_create_ext.handle,
>    * along with the final object size in &drm_i915_gem_create_ext.size, which
>    * should account for any rounding up, if required.
> + *
> + * Note that userspace has no means of knowing the current backing region
> + * for objects where @num_regions is larger than one. The kernel will only
> + * ensure that the priority order of the @regions array is honoured, either
> + * when initially placing the object, or when moving memory around due to
> + * memory pressure
> + *
> + * On Flat-CCS capable HW, compression is supported for the objects residing
> + * in I915_MEMORY_CLASS_DEVICE. When such objects (compressed) has other
> + * memory class in @regions and migrated (by I915, due to memory
> + * constrain) to the non I915_MEMORY_CLASS_DEVICE region, then I915 needs to
> + * decompress the content. But I915 dosen't have the required information to
> + * decompress the userspace compressed objects.
> + *
> + * So I915 supports Flat-CCS, only on the objects which can reside only on
> + * I915_MEMORY_CLASS_DEVICE regions.
>    */
>   struct drm_i915_gem_create_ext_memory_regions {
>   	/** @base: Extension link. See struct i915_user_extension. */
