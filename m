Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EF346F160
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F21E10E148;
	Thu,  9 Dec 2021 17:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F5210E148;
 Thu,  9 Dec 2021 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639069986; x=1670605986;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ezUEk2Qz9XwBD4aNfnd8lKlNW4ECJidQyN7uGIGJxA0=;
 b=bVN6hs7cqr8alfpIhKKfmndjb2j52uUc0eVi8GeHw4i5Sfu15WBNe9ET
 woWxL0nrTxRfrRM8/1JyDVFDwAHtf9CJSLB5A04xfu1DKiBJad/+/+6Vn
 cCBcG8x0ADDfU6dE92LS5UpYmDHDKqUV4Bi6S7vY8EJsHS5GTQpnN+VCQ
 4XLQYQHyRL5bxxcRdCBOS2WLLBMrmVhWs+/46URqpZU95ZnEQ7cEbG4hK
 Yy55KethDq8kxhCNURMFkVNo8cuWrHweYrisvOpYlBfamHFrZLZLjbklI
 KfnmvL6Kev9gZzpVrItuA3zZgPWzy6fqhHxP4Qu5p0vE4n3diOwApz/LS w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225021895"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="225021895"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:06:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="601627836"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2021 09:06:52 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 09:06:52 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 09:06:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 9 Dec 2021 09:06:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 9 Dec 2021 09:06:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqHea3WKoa6hedXH97+IQ95CEEvC6OuSzJhGSIYZIf8w9FcR4G+kxyeA8siHb4rMcF/oT9k8kVz1KE2LrwnOye6ku/GV1Ow/Oy6wN3rV+dl0o9ZZ6tfZAn2txyPQKUxPvMHsEV6lbu+N+64WafPiRp2klo19DQ8rBERcGh05z65kQ+JJLUNHtwXRKiINS9pcUwuAwinQD8doXGt78KOCOLy8R2xWxR5TfJRNCydqFelSQm6g7WQo6laplQJihvwQwyul4L80JKjcOV1WIhCFYXBTwq87/bQTsgLzRj1sZwr27ezS0iz7x3Y1N+NI4eTyXkEMSQF0qckIen5mSjLB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etIvGIIUlFFqk7+L0yfqDnJLhfQcdylLQ1WxW71Q98I=;
 b=azTUJ3tbXjtJQMN9h3cY4GyygWWtDuHyJRKo806PtOFfLW4vOh6Df8rdJj6hc+ywHBWFKj9Pu5Uau+ltlkxfvuerkbVdINYGp5LVVv+UNqjFP8bfXjCl7rAj5s6ojRmW5BB5b7yVxdDRkrtppWD8vlepcHt0WA4jOjOOdEqN3PGjSdJRgrskC5Z/MfzteeNLkaFYRGNbRvYescO4SBdnzkwNm96casAEbQ3M2n6j+QPLNCkVtKCspSf44teTlgJfu7thVjJMQO1TwSZE9735pHETnBMzQdJ9H9pbvvwb8Cq8V9wKpOgf6ZHJUMn5rW3djNa+jd+E9agrxiAqa2m7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etIvGIIUlFFqk7+L0yfqDnJLhfQcdylLQ1WxW71Q98I=;
 b=JJu8GcFYS9JzebvQt7WeisoxdvAG2QCefwcLssLNY28sUiSO6Mdj2XDVTBDWOpRJ1JIcVRz2QXfw/aZRbVsY/XUDkyl295Y7W3Nsp/COm1on7GK5QktjAOdqza2ZkRLU/Fcah37ejfClE4Sp+KgqwhNfz/XV7ZcJCDntJQdIdsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5639.namprd11.prod.outlook.com (2603:10b6:8:24::15) by
 DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.27; Thu, 9 Dec 2021 17:06:49 +0000
Received: from DM8PR11MB5639.namprd11.prod.outlook.com
 ([fe80::14a0:8a2:b2bc:45d0]) by DM8PR11MB5639.namprd11.prod.outlook.com
 ([fe80::14a0:8a2:b2bc:45d0%3]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:06:49 +0000
Message-ID: <5cd8a8e8-5fd8-23e9-a2e1-eeef16f059da@intel.com>
Date: Thu, 9 Dec 2021 09:06:45 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: make GuC FW a requirement for
 Gen12 and beyond devices
Content-Language: en-GB
To: Robert Beckett <bob.beckett@collabora.com>, Adrian Larumbe
 <adrian.larumbe@collabora.com>, <daniel@ffwll.ch>, <ramalingam.c@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211207175301.321119-1-adrian.larumbe@collabora.com>
 <c91e8065-56a6-d758-5089-2405c5841858@intel.com>
 <971555a0-6bd8-4c1c-7235-6072aaac1257@collabora.com>
 <27c067e1-3bb3-efce-ee6f-ffce2224f5d1@intel.com>
 <b9770df9-e6ca-a5a4-dd8e-eb27125dbc2c@collabora.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <b9770df9-e6ca-a5a4-dd8e-eb27125dbc2c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:104:1::16) To DM8PR11MB5639.namprd11.prod.outlook.com
 (2603:10b6:8:24::15)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 CO2PR05CA0090.namprd05.prod.outlook.com (2603:10b6:104:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 17:06:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81ca8ff1-b68f-4ea4-95c2-08d9bb36497c
X-MS-TrafficTypeDiagnostic: DM8PR11MB5590:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM8PR11MB5590EE00BB9060798BA7E71DBD709@DM8PR11MB5590.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t5l+ITP2reClmcEXE5iqvZf4yfwtty/mLqOU0mJI/MHfXnqi73JhrQGuKL05J9gnYmx87cyi+7PpwDylFMATdoY/KZPuZSSpde4UfmHBnNlNEhaaEGuw3JfkoL75NQUytVOjlnqP6P79YdO6INiHWDBLoREN6pJCI1HmtynnxYO1h4nwjvGqnm5aAE5xtB0mVwBYJrNNpWFHL5k+uJLART2nK8lID3tq0Ltu8xYFAj3N+BlheCvqwFNoTPdAlt+bPEWKnvKEktSxddfMBuIPI1heRcermlNn6OWlRKYeuf8rN8GTMBk4s5UqJXdUvcYAn51VWPQcNDRAYK3pJ1mEblVN/9ZqJpxgRaFlS35AJ4cDmnmPVtAPjtQM8c+iKvID+N5HMlnG5nVW/mKA011cgqYxMbTgvBE3WRvUDqSA4Fd4+xFDk7kPyr7bMNsCRsfzZ4cvVoKFiWDa9JgyHnsclJ+ANqDmmOUsfHbUtCkGvBuuj1bug4lnatvu5wxd30wE/pesXdYIplAHzEVQ1aGOPMwdW9XdNS51L/jhSzl7pCsVfU+KNIT5K9TWSAEk198OYLixuRjleC6IDcI1woagVCdqWwpt7QqNyg4kO0v21L4bS4O4BXeYD4qtsU8VXs+wP1wKay3GUZaDZu5KHP27HoMc5u5QZyzJnhH5MnaKwiJsEHRDlQvF7b/8Yc5OkUQCCOdr8I+xuU5dBdF/53EiqdkM3+Ix5Btaco6Vz06ZvM7fNh2d1KRxGFoB/q4cx1Eo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5639.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(316002)(16576012)(31686004)(508600001)(2616005)(82960400001)(86362001)(110136005)(31696002)(956004)(38100700002)(8936002)(66946007)(66476007)(6486002)(8676002)(83380400001)(53546011)(6666004)(36756003)(186003)(26005)(4326008)(66556008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW8yMlR6YlBKbE9MNHJyRFJiYkplR0tNaXVzMUMzYllmNGxFV1NUQmpHSFpS?=
 =?utf-8?B?OERQVlVGWW0vSy84V1RnQzAyWnpiN1ZpMTlRZDE3YmxMR2xSY29oNTVMN2E1?=
 =?utf-8?B?UGpDWGVtaXl2TlBtdnd6cENlR1k2MWplZEw0YVZUcDVVV2oyZjZpSDlkZThq?=
 =?utf-8?B?M3JTdmg2YWU4QUMvaFR0MVkzcUpSSUZJcmRBdGxaWXJaWEZ5a3BqS1B4UUdQ?=
 =?utf-8?B?bVVxS0VJMk9iNTFmaFd4aFQxS283N2NWMTJaYUZIdHZqSGFOcUVMbkdOUnVU?=
 =?utf-8?B?T1Z0alBGNlVEK0o4aVk0WW1MQWoxVy96YUYyWkpBYXdEOVNjQTJ3UTYzOXNZ?=
 =?utf-8?B?ZktBOGlGSUI2T3NiSURtOXBnRlg2Q2FlZEtPVG1vdWIwUk0yaVBDQTAzV0p5?=
 =?utf-8?B?bC9lMjkrTW5VT1N5dzF4TlQ5UlJINmNwV0l3ek1oZ2F4cGJqWUl3d05GQWVj?=
 =?utf-8?B?RkdHZ24xRzk4cUNjNzZtUm9YVE10YmhTckhQVHp5MTgwNDFnaTFlS3grbnAr?=
 =?utf-8?B?QWlVV1prcEVGUlA2bHRyMWppMThjRkhsZVU0Sm50ajloM1dFQ243QnFlZnRH?=
 =?utf-8?B?MHExTkNkVnJZTCt0ZkhhUGFZdFNYbmdUS0djeGIzU01Pc29aUWk3TituUXV4?=
 =?utf-8?B?UXZpL1pLZFpqaTk0T2JxbjVOUHNpYy81YWpyZWJQdDZxZFBlOGR4SDlXNGYx?=
 =?utf-8?B?V084YXVQLytsMUQ3VUxwTmJ4RnRUS2VOWnFXTmpZejhOWEgyTGVZZDl4TmxB?=
 =?utf-8?B?cndIRTFjYWV5a3J3SW41VWw1K1V6YnNtZTFSN2g1QjhieVJFRlpVVkdtWWk3?=
 =?utf-8?B?YmRBcnhPRlI1S1huc2FPN2wwcUhIWGt5aTBBenVpN1Q5MWRRdjNaNTJ5L3Zq?=
 =?utf-8?B?TjROWkJsWFUxWVBXdVJpVGpDZDdWWU9MbmxmVE14Qlg4OFcyWDlYOTE4V2l3?=
 =?utf-8?B?S0VmRFNjRExOcXhxSXNCS1VTbU1GR3dEczBNc004bGVIc0NUUjVkdFhxR0JU?=
 =?utf-8?B?ZlRGY2dwMVpGbkE1MDZGZk9odEJTU1BHdFhOZkM1RXk5QU4wek9GNUliWEtq?=
 =?utf-8?B?MmU2NFROZk1qT0xuZWxNUUNjeHpyZDVKNHIrQ2wxUEYrMHpGTDZqcWZqenRV?=
 =?utf-8?B?Ky9EUEpJOFROVmV0KzBDMTdCbm94UDFUMXBxb1hCcjhjZ05oOW4rcVVnOXJy?=
 =?utf-8?B?b2xhUXIrVTFJUmlUU05hYWNhR2I2QUFkVjJSTm9tdE01NVlkU2ExcE9sWXUz?=
 =?utf-8?B?ektwRmhHbGVIb0ptTUd1R2VmNlM3eFRqaTNqYlNqMmgvdjd3cTZDVmlydTV5?=
 =?utf-8?B?ZlpZUktFQ3R3SE5OcENGaWxDRVMyMDcvN3RPVDg2L25idEZkK2tCUStEZ0F6?=
 =?utf-8?B?cEc1RDBpcWN6akpDSlFoM3IzSzNGOFIwRzhZVW4wQ21aOHJ3V1M1N0VGKzEv?=
 =?utf-8?B?Y013WHh2K1RDUDhNcG5ueUM4bU9LbWJPajhGdzd3azJPa3hNWHRObDg0OEZS?=
 =?utf-8?B?eUZObXR4blZJZlNSd0dUaVI5ejg2L1c2RTRoVVozWUw5RFg1VHBmb3lNeEha?=
 =?utf-8?B?QlhLRmxnM1o5RzdKMm9tTll5UmNLbkc2Mm1FbjNVa3RSZE9HN2tTTnlzKzNa?=
 =?utf-8?B?cWZONFMxb3hYbVd3YVk4VGkxVmdqK3owVDBMUW1BNFpQa3ZtZVZXVjFjcklL?=
 =?utf-8?B?SlBqbUdudVN4QUhyS3NvNmlXK0EyMS9SL2tTUjNIN2NndHp6MHNlWis3UVda?=
 =?utf-8?B?ZnJ6RUFrODRlb2VWNFYyYXJrNVpwWGJiOXIvY0pRU21rV2pUMUhGd1BtcEZq?=
 =?utf-8?B?b09mYXMxVE00c0tnOHVsc3hIa3ZaNEh5ZWluMVhyaldBK0F1bU1BTXY2eTRr?=
 =?utf-8?B?OWhNd3hINlBJMlpUdDN5dFJlTVNrdWR1dG1FU0xIWTRFanFER0huWHJvWXp2?=
 =?utf-8?B?QlAwTXltZUVFdEVkOWExVWx4UmEvUzFzbzhMRnZZNDJCaXppK01wTkE1RVJx?=
 =?utf-8?B?elZua2xWaitxdjc5cVBTdUlBSWo2bXVVV0pKdXNJeW5WVENja2FqYkFXS0tU?=
 =?utf-8?B?cDFLaU51NTdJN0pyVTZjOENDUlQ5V241UXFOa1BBUEtzWlAyUXVPTUZ0RVVG?=
 =?utf-8?B?T0Jla245UUpFMEFZZjdsK1NMUXhDYk9PMUpTeFJEcXltZml3UTdWM0NrODNN?=
 =?utf-8?B?RlFXbzRYQjhlSzJFb3VZUFJpT3p6OFZjQUYxVk1TVHp3eEhvT1kwbjBOTm03?=
 =?utf-8?Q?6wpHfDGQ+q04Ufu/5YvfQ+DjV/b+vxypWWIeVdMD7s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ca8ff1-b68f-4ea4-95c2-08d9bb36497c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5639.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:06:48.9852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jA3kswPskG+bd4sFgOHQzP6Flb0XpjEx96rLSoT1pzDVKoKV4d99ql+1nOWumpPNLy2CP+nTIkHNUfO+kzFsG5ycrF3wfio5nxfFfauDzLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5590
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
Cc: daniels@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/9/2021 06:41, Robert Beckett wrote:
> On 09/12/2021 00:24, John Harrison wrote:
>> On 12/8/2021 09:58, Robert Beckett wrote:
>>> On 07/12/2021 23:15, John Harrison wrote:
>>>> On 12/7/2021 09:53, Adrian Larumbe wrote:
>>>>> Beginning with DG2, all successive devices will require GuC FW to be
>>>>> present and loaded at probe() time. This change alters error 
>>>>> handling in
>>>>> the FW init and load functions so that the driver's probe() 
>>>>> function will
>>>>> fail if GuC could not be loaded.
>>>> We still need to load the i915 driver in fall back mode (display 
>>>> but no engines) if the GuC is missing. Otherwise you may have just 
>>>> bricked the user's device.
>>>
>>> good point, well made.
>>> though this still seems like an issue for gen12+ (excluding rkl and 
>>> adl).
>>>
>>> maybe a redesign of toplevel driver probe, with 
>>> i915_driver_early_probe before i915_driver_create could work. If the 
>>> GuC fw is not found, it could then register a new kms only version 
>>> of i915_drm_driver.
>>>
>>> or something like like that ...
>> Or we could just leave it all alone?
>>
>> AFAIK, this is working just fine at the moment. If the platform 
>> default is to use GuC submission and you have the fw then the driver 
>> loads fine. If the platform default is to use GuC submission and you 
>> don't have the firmware then the driver wedges but keeps loading. 
>> That means it returns no engines to userland but the display is 
>> unaffected. Hence the user gets a slow but safe fallback path in 
>> which they can still load their Ubuntu desktop and try to work out 
>> what package they need to install.
>>
>> What is the problem that this patch is trying to fix?
>
> In dg2 enablement branch, when fw was unavailable, submissions could 
> still be attempted and it would segfault the kernel due to some 
> function pointers not being set up.
>
> From what you said, it sounds like this may just be a bug in the dg2 
> enablement, which we can diagnose and fix if so.
Yeah, that is not supposed to happen. It has definitely been working 
correctly in the past. Maybe something is incorrectly thinking it can 
unwedge by a reset? That is permissible for a regular wedge but 
wedge-on-init is meant to be permanent.

>
> Though I still think it would be a better design to only register kms 
> capabilities if that is all that will be supported without the fw. It 
> seems a bit messy to advertise render and create the render node for 
> userland sw to attempt to use and have it fail, but if that is the 
> prefered design, then we can make dg2 match that.
Daniel Vetter/Jon Bloomfield may have newer thoughts but last I heard 
was the architectural decision was to simply wedge and not return any 
engines to userland. Maybe on the grounds that while a cleaner design 
maybe possible, it's not worth the extra complexity in the driver for 
what is basically only an error path.

John.

>
>
>>
>> John.
>>
>>
>>>
>>>>
>>>> Also, we do want to be able to disable the GuC via the enable_guc 
>>>> module parameter.
>>>>
>>>> John.
>>>>
>>>>
>>>>> Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 20 ++++++++++++++++----
>>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h |  4 ++--
>>>>>   drivers/gpu/drm/i915/i915_gem.c       |  7 ++++++-
>>>>>   3 files changed, 24 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>>> index 7660eba893fa..8b0778b6d9ab 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>>> @@ -277,14 +277,19 @@ static void guc_disable_communication(struct 
>>>>> intel_guc *guc)
>>>>>       drm_dbg(&i915->drm, "GuC communication disabled\n");
>>>>>   }
>>>>> -static void __uc_fetch_firmwares(struct intel_uc *uc)
>>>>> +static int __uc_fetch_firmwares(struct intel_uc *uc)
>>>>>   {
>>>>> +    struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>>>>>       int err;
>>>>>       GEM_BUG_ON(!intel_uc_wants_guc(uc));
>>>>>       err = intel_uc_fw_fetch(&uc->guc.fw);
>>>>>       if (err) {
>>>>> +        /* GuC is mandatory on Gen12 and beyond */
>>>>> +        if (GRAPHICS_VER(i915) >= 12)
>>>>> +            return err;
>>>>> +
>>>>>           /* Make sure we transition out of transient "SELECTED" 
>>>>> state */
>>>>>           if (intel_uc_wants_huc(uc)) {
>>>>>               drm_dbg(&uc_to_gt(uc)->i915->drm,
>>>>> @@ -293,11 +298,13 @@ static void __uc_fetch_firmwares(struct 
>>>>> intel_uc *uc)
>>>>>                             INTEL_UC_FIRMWARE_ERROR);
>>>>>           }
>>>>> -        return;
>>>>> +        return 0;
>>>>>       }
>>>>>       if (intel_uc_wants_huc(uc))
>>>>>           intel_uc_fw_fetch(&uc->huc.fw);
>>>>> +
>>>>> +    return 0;
>>>>>   }
>>>>>   static void __uc_cleanup_firmwares(struct intel_uc *uc)
>>>>> @@ -308,14 +315,19 @@ static void __uc_cleanup_firmwares(struct 
>>>>> intel_uc *uc)
>>>>>   static int __uc_init(struct intel_uc *uc)
>>>>>   {
>>>>> +    struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>>>>>       struct intel_guc *guc = &uc->guc;
>>>>>       struct intel_huc *huc = &uc->huc;
>>>>>       int ret;
>>>>>       GEM_BUG_ON(!intel_uc_wants_guc(uc));
>>>>> -    if (!intel_uc_uses_guc(uc))
>>>>> -        return 0;
>>>>> +    if (!intel_uc_uses_guc(uc)) {
>>>>> +        if (GRAPHICS_VER(i915) >= 12)
>>>>> +            return -EINVAL;
>>>>> +        else
>>>>> +            return 0;
>>>>> +    }
>>>>>       if (i915_inject_probe_failure(uc_to_gt(uc)->i915))
>>>>>           return -ENOMEM;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>>>>> index 866b462821c0..3bcd781447bc 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>>>>> @@ -17,7 +17,7 @@ struct intel_uc;
>>>>>   struct intel_uc_ops {
>>>>>       int (*sanitize)(struct intel_uc *uc);
>>>>> -    void (*init_fw)(struct intel_uc *uc);
>>>>> +    int (*init_fw)(struct intel_uc *uc);
>>>>>       void (*fini_fw)(struct intel_uc *uc);
>>>>>       int (*init)(struct intel_uc *uc);
>>>>>       void (*fini)(struct intel_uc *uc);
>>>>> @@ -104,7 +104,7 @@ static inline _TYPE intel_uc_##_NAME(struct 
>>>>> intel_uc *uc) \
>>>>>       return _RET; \
>>>>>   }
>>>>>   intel_uc_ops_function(sanitize, sanitize, int, 0);
>>>>> -intel_uc_ops_function(fetch_firmwares, init_fw, void, );
>>>>> +intel_uc_ops_function(fetch_firmwares, init_fw, int, 0);
>>>>>   intel_uc_ops_function(cleanup_firmwares, fini_fw, void, );
>>>>>   intel_uc_ops_function(init, init, int, 0);
>>>>>   intel_uc_ops_function(fini, fini, void, );
>>>>> diff --git a/drivers/gpu/drm/i915/i915_gem.c 
>>>>> b/drivers/gpu/drm/i915/i915_gem.c
>>>>> index 527228d4da7e..7f8204af6826 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_gem.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>>>>> @@ -1049,7 +1049,12 @@ int i915_gem_init(struct drm_i915_private 
>>>>> *dev_priv)
>>>>>       if (ret)
>>>>>           return ret;
>>>>> -    intel_uc_fetch_firmwares(&dev_priv->gt.uc);
>>>>> +    ret = intel_uc_fetch_firmwares(&dev_priv->gt.uc);
>>>>> +    if (ret) {
>>>>> +        i915_probe_error(dev_priv, "Failed to fetch firmware\n");
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>>       intel_wopcm_init(&dev_priv->wopcm);
>>>>>       ret = i915_init_ggtt(dev_priv);
>>>>
>>

