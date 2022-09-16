Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173705BAED4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 16:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB7110E47C;
	Fri, 16 Sep 2022 14:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE20410ED40;
 Fri, 16 Sep 2022 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663337040; x=1694873040;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Siwj145StJOL6JKxuu7Xk8QOccZSS4HacKxpH3yTs64=;
 b=dGEqMYapX1oe5RYsBcjnY91CkabzxBtXGZWZVrrDy9dxen3Qrmk3y8fS
 HvD4yAULudoHDTO+IuAZWAsYw114dNoKtZDpp4tdP0+rQGm8ZfPLZMB/4
 BM1+5R8vFSaiXYdFmEQMlIB8gt4FrO+PdTFF0ymZITC+R+Q6ta8vl0od8
 oxhXR1JWmO8MRoz/EfwWiDow5pLPhn27PzfDLpihJ/Kas/3xzfFMSyrfp
 mnliqw+hHhx0sOKC/ymk4YyWFrB7f/efZbynU4SR3MljZfVPBsnEpy0X+
 SCox6rk4u1gxv/u79hLgZYTPF9+kbM2SeaasctPdt1UM5QrI5Z15r+z6X g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="360736699"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="360736699"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="648270036"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 16 Sep 2022 07:03:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 07:03:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 07:03:58 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 07:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQnpuXt3vwwYxKILW+sviqhtPKAlw9H15JxLJOpayjPKtflVRRF4zn7sEL+viaoSrXEk+ukAJg4TAdvtM6wBHhSoI0Jn0Ui1Dht7vbEc1jOuwj+kCrW9Ap7dB0KaA9PFLMP79aRmK9Yf2EAYwI6stT/+1Tn6YKh0we8tNEXWjVUhwHH0/4//6XbTljF46hcDVvvgUDP/DGg/Tz0QMlVIMEEcuNpUeYQXQ05ejFXDOTn7kbzANZPXorSO9RRT4eKJkgiPnNRHHmF728+BxzcFRaL0Y40I7rF7fBQz4WOkI/kZvutuxvagCm9KwCxI+L1WZ9ryNK8hVRfUdSCJMlyMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBNXbB2yQ8Knj8ucc8GKCl0QYacQX7Fxts4/b4Nuyx4=;
 b=aWd13I2WKwUBFAP6ILedmRG6+To9OY841A+ZecXfSRyADGHqb3eCVwjchSwgS2UwWZLQMzdttjLyfiM2OoA4d5mDu4+vm5EaLOqLUnPU30IkoShc6Kd9NEI9ZMkKCtmNuumahK1jRfGFEC1Xb2QhjENcz7dsqRu6DvXJsgD1js7ryFF8a47BMIWYi7mTYOlHvfBtoCN1GpCdqMgcpEoJYmTSD1zbkN6VkbMwROQT+El7yUKJsGgjs6Gpm2DTPxXtFK2sMWnqcdkNnfC/y10C0h7jUNOcWUOAi7OXeHzBGo1CPxHrVcGeIOB1XflCAMEB+J8N3Y17Vr+Vr6I0/6QTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 16 Sep
 2022 14:03:56 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%7]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 14:03:55 +0000
Message-ID: <2aa5f49e-af83-6368-8db5-e9b33dd19f06@intel.com>
Date: Fri, 16 Sep 2022 17:03:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v3 01/37] drm/i915: fix kernel-doc trivial
 warnings on i915/*.[ch] files
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
 <752ce443ea141601cf59a1ad8a5130deed2feb4f.1662708705.git.mchehab@kernel.org>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <752ce443ea141601cf59a1ad8a5130deed2feb4f.1662708705.git.mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0081.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::22) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SJ0PR11MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb4c824-065d-4de3-d992-08da97ec4b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aT1DxenA/4+gnTHMGLtlt/uHbDnCwePqHURX8wc7T0fk2bLo7TNGlR+aMYQWBk4jafW8XUqeNGzmRn/r6Vbia3rxpQHCFyTPVxSXQur58tko6w9VLSV/vvnqCmtsFQIgjtTX4bCFSDtFeT9H5Oql0iAj0B7K+CkLRkKOM5rgPHY1Xa01Tk8ukcbqbddS7qLZxs06wYfYWd8cwdzNLrp1byLOf9aSiref+ahJG09jEUDHTSEH0cw9CHmdZKLm9SM7xxfqEhPzaQGWjYIqC9xUFXBoDYLKLL6M0hdGjRiRYEYrjCRPxfUgNqXpKJBJ7CSgB+o2Emfq5s16x2z4sKesIwwCQD7KibKKjeW8gjYgO9Qf7GjSexjbn33jJAxNuwUhdqvWDvElrntmiKHw38ffLPGGDnNSA+MruYGb/iDVUHfRrjcDh3+SfqIM8RjW4M0cH7e4HLpKnUMj9CRQP+QM9/FN0h6IadCI9B1KKlkIADErafHv1ii451xO8dTAM2/WQP8h8x8BycM/xKGUA8i46WTiB2xsOrYcEpdu7+82Ow1d4Awng03NYSn57/oit5HIvYSqZHv95tUy1rQMG50jmWZo0zhIZ0oAH3lt66KMRfCmqwuvyNObzOlhUglkZ/O1CzyeVqqWM4XUDplyAVY9PbloqXDCzDxUXT0Sh1Ad4qhNiAJKbfc/yr0HyvmZcDtHatjAciFJiew1gxkrVFExDhEhjdVhux04ReYsIYKAxKP/lTOJ2dfrgw6EhQwZ4guLUwOdBWu2Y4yCXLpONiLnpqb5LWw1qEQJ4Slfogd7NfkzlmkdmGyw4CwQLv6bjI6QKyI6qFDKuX5IuufR2fJSZue+c98Pv1heio+en89KN6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199015)(107886003)(966005)(30864003)(4326008)(31696002)(2906002)(36756003)(316002)(66946007)(26005)(41300700001)(6506007)(31686004)(54906003)(83380400001)(8676002)(186003)(478600001)(86362001)(38100700002)(6666004)(82960400001)(6916009)(66556008)(8936002)(5660300002)(6486002)(53546011)(2616005)(6512007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjF2REZhcWkvRFM3cmU3dGxucXFjdHlGSHg2SjZuSGQ0eDVaWUc4SkpJNWtY?=
 =?utf-8?B?eDN2ZVFIUmRVTU1RWFhVUUlMelMyU1IxemI4ck4xQnlEam02aVVLeTZZMURE?=
 =?utf-8?B?enI2ek1xZ2YrbVJMaXFrQ3IzbWlqOEd5T05lVlNzR1VsenNvTWp2eE84VTBr?=
 =?utf-8?B?OVB2VkZBeEhUbER5QXowTVI2RXRTN21YcjcyNEp3eGNMdEtTeTM1S1RqOW90?=
 =?utf-8?B?alVoS01hcTRyZ0NRWUNuVE9rTnR6TGJJRUNCNVU3czZVS1YySUU0eEJCK2Jw?=
 =?utf-8?B?ZDhYNGlsWjJmYU15RitrS0JncUdIVlhpU2NqMkpyVHYwZVRkOE9vb0NPSnJW?=
 =?utf-8?B?ZEE0QnF2SzNPSTdjcGtVdG5BM2VLNHpsZU5CUnJQeDdjSSt1M1NjMnNIalJ6?=
 =?utf-8?B?M2Jua3RyQnllQnUzZ0xtY1FBdU95MFVTNFlTdGhSOXNzZ3lyNU02b1BwUTI4?=
 =?utf-8?B?VGQxemhIVFM3b2VGUVZUSWRCTWtDOEE5MDY0aHIwTnM0ZU5oUGpyeE9lcWkw?=
 =?utf-8?B?Nk5DaGV0NURmWkowL25Da2tIcTJhNHNJNnN3VXk1dGZOVG4wU01obk5RR1NJ?=
 =?utf-8?B?aWVHQ2NQT0tnWldkek5XQVBsdERkWjJ6UFBBY3lxdVhKTndRd1p3bjVaUGly?=
 =?utf-8?B?b3VhdDEyKzVqMGZJUS9IZUxIWUh4VW9WaWpPVW41ZnY4U1A0MnRUU1pnQzVU?=
 =?utf-8?B?VVFWOVFWaU9SRHhJVFFZSmI4TlpxdmVqS2Z0Z1RJMG4zbHVjdFJIRjlOZW9O?=
 =?utf-8?B?bjdtWERMWHBvcm5MZVJhaENiRUNISFROM0R3bkJ4YWNxQTNRNkdRalNzRW5u?=
 =?utf-8?B?dVp2dk5BRTh5QkZRVUVIS0VJNU5Jam1YS2JlNTlUSTRKSFpIU0NjQjJNRzB5?=
 =?utf-8?B?bDB6U1ZyK1FYTGZrTjFDZ1NlNEJkRSsxUG1idkZKa3NBOXM5R1crZDlleDZm?=
 =?utf-8?B?NnFqaWxydXIxZ0ZQM1J4YVd0RndDa081V09BSGtyZnF5cGxmNGUwTjd4WlR1?=
 =?utf-8?B?U0xvcVNRYkwydXhIUStZQVNGM1A4a013QWxjK1FjYm9IT1VMTTAwd3pGOWRX?=
 =?utf-8?B?SEgwMnZ4djRUNERpc1FPNzk1NWE2RzkxTGpHWTVqVythQ09qRXE0Y2UxVFJy?=
 =?utf-8?B?ZDFZU2RZQkFoYVhpNFpFcW11c0hzMGF1ek5KMXF3c1o5WXZwYXFvWkROVHpy?=
 =?utf-8?B?ejVyZjA5ekZlQzhuVzFtOHNXaGF4NGpiL1NPbDl0UitJbkxWam5FTGg2em1s?=
 =?utf-8?B?TjJmNGh5MzhuamNQamRyR3ZYNXJrOXdBMG15V3hoamFPRElrQXNiRldiZzFC?=
 =?utf-8?B?Q0tOQVZHMHBVMHRDcGwzb2tJU01tVnVlU1VYcW5xOHlNQ1BDUmRGcjVKR0Vv?=
 =?utf-8?B?NHJ4VEtNYWcyQlJkNmdGZHk2U1NVcnJWMDJyWmVTNTYxWUx1WW5jdkp3RUtp?=
 =?utf-8?B?NkFwNmQrcURDVmYza1ZTMGJ2Ri90L0lzc1FCc2ZwVlZpc0w4c1c3MTFjbEpN?=
 =?utf-8?B?VGVKTWx2REhOUjEyNFB2bmJXajZPTUhBM1A0a3dWdEd1RzdJNUUvMklEYkpC?=
 =?utf-8?B?dGFTYkcrRy9mK0VseEQvQ3Zsb2ZGSWFKU0dDc1ZMK3pvM3MxWVZhSHRyemE5?=
 =?utf-8?B?cWwvWlhBaHBJL0hZTU1TWGtwdjBRempkSHBiUm1odkRDRk9EbGszL1RuQWRP?=
 =?utf-8?B?WmZMR284dWd5UU5JME1rWWZ5TmpLaDVnZWlPN0YvajhZOFVHTHNERHk3VWs2?=
 =?utf-8?B?QVVlenBHQWM0SUxQbVg5eHVFZCtDSDkvcUl2eEp1c0kzdDVyOHRVRkpSNjdZ?=
 =?utf-8?B?Yzl0Q1I3WVEvSEljaDdCUEVOcTBteERQbFJGS1o1MUFORDBzVXpZU0JtMGRB?=
 =?utf-8?B?VEo0YnNCcXhTaEFhRkFoakRSeXVCU2tON09yVFdDQUlXT2txUU1VeDREbG9h?=
 =?utf-8?B?eE9EMGU1eStoTE4zZEJMNzlGbHBHK1llc09YaGJvSTZSQzd5cmsySE9vTjlG?=
 =?utf-8?B?TEdDMFlqUTdiaERPSFJDLytjYzF0YVZNRzZtT2xUcnphdXhlT1Vib2cvRGw1?=
 =?utf-8?B?akdFQzdVNmFKMTlORnJ6dlJjZzZmOThzZ2RlK1R2T2lBWWl6ZGFHaUtWWHRa?=
 =?utf-8?B?N0VSUDdwWWU0TkJYa0FUb1ZuVnFPU001SGpEZ3J6R2pXMkNHSFpvQmFJcTJj?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb4c824-065d-4de3-d992-08da97ec4b22
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 14:03:55.7978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ke6p0m7TqauqIpnM73PeBj+VVL8iEipP9n0405v5Dfv6fMV6cWnAilWeBeg+dEYSYzxRpMcRe5TnCe3htRgJ8wERmbyo2iO8H+7peaXdzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/9/22 10:34 AM, Mauro Carvalho Chehab wrote:
> There are several trivial warnings there, due to trivial things:
> 	- lack of function name at the kerneldoc markup;
> 	- renamed functions;
> 	- wrong parameter syntax.
> 
> Fix such warnings:
> 	drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'active' not described in '__i915_active_fence_init'
> 	drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'fence' not described in '__i915_active_fence_init'
> 	drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'fn' not described in '__i915_active_fence_init'
> 	drivers/gpu/drm/i915/i915_active.h:89: warning: Function parameter or member 'active' not described in 'i915_active_fence_set'
> 	drivers/gpu/drm/i915/i915_active.h:89: warning: Function parameter or member 'rq' not described in 'i915_active_fence_set'
> 	drivers/gpu/drm/i915/i915_active.h:102: warning: Function parameter or member 'active' not described in 'i915_active_fence_get'
> 	drivers/gpu/drm/i915/i915_active.h:122: warning: Function parameter or member 'active' not described in 'i915_active_fence_isset'
> 	drivers/gpu/drm/i915/i915_gem.c:443: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Reads data from the object referenced by handle.
> 	drivers/gpu/drm/i915/i915_gem.c:532: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * This is the fast pwrite path, where we copy the data directly from the
> 	drivers/gpu/drm/i915/i915_gem.c:717: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Writes data to the object referenced by handle.
> 	drivers/gpu/drm/i915/i915_gem.c:802: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Called when user space has done writes to this buffer
> 	drivers/gpu/drm/i915/i915_pmu.h:22: warning: cannot understand function prototype: 'enum i915_pmu_tracked_events '
> 	drivers/gpu/drm/i915/i915_pmu.h:33: warning: cannot understand function prototype: 'enum '
> 	drivers/gpu/drm/i915/i915_pmu.h:42: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * How many different events we track in the global PMU mask.
> 	drivers/gpu/drm/i915/i915_request.h:177: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Request queue structure.
> 	drivers/gpu/drm/i915/i915_request.h:473: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Returns true if seq1 is later than seq2.
> 	drivers/gpu/drm/i915/i915_scatterlist.c:63: warning: Function parameter or member 'size' not described in 'i915_refct_sgt_init'
> 	drivers/gpu/drm/i915/i915_scatterlist.h:153: warning: Incorrect use of kernel-doc format:          * release() - Free the memory of the struct i915_refct_sgt
> 	drivers/gpu/drm/i915/i915_scatterlist.h:157: warning: Function parameter or member 'release' not described in 'i915_refct_sgt_ops'
> 	drivers/gpu/drm/i915/i915_scatterlist.h:180: warning: Function parameter or member 'rsgt' not described in 'i915_refct_sgt_put'
> 	drivers/gpu/drm/i915/i915_scatterlist.h:191: warning: Function parameter or member 'rsgt' not described in 'i915_refct_sgt_get'
> 	drivers/gpu/drm/i915/i915_scatterlist.h:207: warning: Function parameter or member 'rsgt' not described in '__i915_refct_sgt_init'
> 	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'OP' not described in '__wait_for'
> 	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'COND' not described in '__wait_for'
> 	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'US' not described in '__wait_for'
> 	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'Wmin' not described in '__wait_for'
> 	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'Wmax' not described in '__wait_for'
> 	drivers/gpu/drm/i915/i915_vma_resource.h:88: warning: Incorrect use of kernel-doc format:          * struct i915_vma_bindinfo - Information needed for async bind
> 	drivers/gpu/drm/i915/i915_vma_resource.h:123: warning: Function parameter or member 'bi' not described in 'i915_vma_resource'
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/
> 
>   drivers/gpu/drm/i915/i915_active.h       | 14 +++++++-------
>   drivers/gpu/drm/i915/i915_gem.c          | 10 ++++++----
>   drivers/gpu/drm/i915/i915_pmu.h          |  6 +++---
>   drivers/gpu/drm/i915/i915_request.h      |  4 ++--
>   drivers/gpu/drm/i915/i915_scatterlist.c  |  2 +-
>   drivers/gpu/drm/i915/i915_scatterlist.h  | 10 +++++-----
>   drivers/gpu/drm/i915/i915_utils.h        |  2 +-
>   drivers/gpu/drm/i915/i915_vma_resource.h |  2 +-
>   8 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
> index 7eb44132183a..77c676ecc263 100644
> --- a/drivers/gpu/drm/i915/i915_active.h
> +++ b/drivers/gpu/drm/i915/i915_active.h
> @@ -49,9 +49,9 @@ void i915_active_noop(struct dma_fence *fence, struct dma_fence_cb *cb);
>   
>   /**
>    * __i915_active_fence_init - prepares the activity tracker for use
> - * @active - the active tracker
> - * @fence - initial fence to track, can be NULL
> - * @func - a callback when then the tracker is retired (becomes idle),
> + * @active: the active tracker
> + * @fence: initial fence to track, can be NULL
> + * @fn: a callback when then the tracker is retired (becomes idle),
>    *         can be NULL
>    *
>    * i915_active_fence_init() prepares the embedded @active struct for use as
> @@ -77,8 +77,8 @@ __i915_active_fence_set(struct i915_active_fence *active,
>   
>   /**
>    * i915_active_fence_set - updates the tracker to watch the current fence
> - * @active - the active tracker
> - * @rq - the request to watch
> + * @active: the active tracker
> + * @rq: the request to watch
>    *
>    * i915_active_fence_set() watches the given @rq for completion. While
>    * that @rq is busy, the @active reports busy. When that @rq is signaled
> @@ -89,7 +89,7 @@ i915_active_fence_set(struct i915_active_fence *active,
>   		      struct i915_request *rq);
>   /**
>    * i915_active_fence_get - return a reference to the active fence
> - * @active - the active tracker
> + * @active: the active tracker
>    *
>    * i915_active_fence_get() returns a reference to the active fence,
>    * or NULL if the active tracker is idle. The reference is obtained under RCU,
> @@ -111,7 +111,7 @@ i915_active_fence_get(struct i915_active_fence *active)
>   
>   /**
>    * i915_active_fence_isset - report whether the active tracker is assigned
> - * @active - the active tracker
> + * @active: the active tracker
>    *
>    * i915_active_fence_isset() returns true if the active tracker is currently
>    * assigned to a fence. Due to the lazy retiring, that fence may be idle
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index bae857d5221d..f68fa0732363 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -439,7 +439,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
>   }
>   
>   /**
> - * Reads data from the object referenced by handle.
> + * i915_gem_pread_ioctl - Reads data from the object referenced by handle.
>    * @dev: drm device pointer
>    * @data: ioctl data blob
>    * @file: drm file pointer
> @@ -528,7 +528,8 @@ ggtt_write(struct io_mapping *mapping,
>   }
>   
>   /**
> - * This is the fast pwrite path, where we copy the data directly from the
> + * i915_gem_gtt_pwrite_fast - This is the fast pwrite path, where we copy
> + *	the data directly from the
>    * user into the GTT, uncached.
>    * @obj: i915 GEM object
>    * @args: pwrite arguments structure
> @@ -713,7 +714,7 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
>   }
>   
>   /**
> - * Writes data to the object referenced by handle.
> + * i915_gem_pwrite_ioctl - Writes data to the object referenced by handle.
>    * @dev: drm device
>    * @data: ioctl data blob
>    * @file: drm file
> @@ -798,7 +799,8 @@ i915_gem_pwrite_ioctl(struct drm_device *dev, void *data,
>   }
>   
>   /**
> - * Called when user space has done writes to this buffer
> + * i915_gem_sw_finish_ioctl - Called when user space has done writes to
> + *	this buffer
As per this link[1], the brief description does not have a limitation to 
match the indentation when explained over multiple lines, unlike 
function parameters.

[1] 
https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation

Therefore if you look at the function brief description over several 
lines in i915 and drm,

One of the drm apis, drm_gem_lock_reservations(), is used without 
indentation in the form below,
/**
  * drm_gem_lock_reservations - Sets up the ww context and acquires
  * the lock on an array of GEM objects.

In i915_perf.c, indentation is set as follows.

/**
  * gen8_append_oa_reports - Copies all buffered OA reports into
  *			    userspace read() buffer.

...

/**
  * gen7_append_oa_reports - Copies all buffered OA reports into
  *			    userspace read() buffer.

If there is no problem when using the same form as 
gen8_append_oa_reports when generating kernel-doc, it seems to be 
indented to match the existing i915 style. However, if there is a 
problem, I think you need to remove the indented part of the i915 code 
like the drm apis.

except i915_gem_sw_finish_ioctl  i915_gem_gtt_pwrite_fast parts, the 
rest of the parts look good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>    * @dev: drm device
>    * @data: ioctl data blob
>    * @file: drm file
> diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
> index 449057648f39..c30f43319a78 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.h
> +++ b/drivers/gpu/drm/i915/i915_pmu.h
> @@ -14,7 +14,7 @@
>   
>   struct drm_i915_private;
>   
> -/**
> +/*
>    * Non-engine events that we need to track enabled-disabled transition and
>    * current state.
>    */
> @@ -25,7 +25,7 @@ enum i915_pmu_tracked_events {
>   	__I915_PMU_TRACKED_EVENT_COUNT, /* count marker */
>   };
>   
> -/**
> +/*
>    * Slots used from the sampling timer (non-engine events) with some extras for
>    * convenience.
>    */
> @@ -37,7 +37,7 @@ enum {
>   	__I915_NUM_PMU_SAMPLERS
>   };
>   
> -/**
> +/*
>    * How many different events we track in the global PMU mask.
>    *
>    * It is also used to know to needed number of event reference counters.
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 47041ec68df8..66d6dee98525 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -172,7 +172,7 @@ enum {
>   	I915_FENCE_FLAG_COMPOSITE,
>   };
>   
> -/**
> +/*
>    * Request queue structure.
>    *
>    * The request queue allows us to note sequence numbers that have been emitted
> @@ -468,7 +468,7 @@ i915_request_has_initial_breadcrumb(const struct i915_request *rq)
>   	return test_bit(I915_FENCE_FLAG_INITIAL_BREADCRUMB, &rq->fence.flags);
>   }
>   
> -/**
> +/*
>    * Returns true if seq1 is later than seq2.
>    */
>   static inline bool i915_seqno_passed(u32 seq1, u32 seq2)
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
> index dcc081874ec8..f664c1ce02cf 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -56,7 +56,7 @@ static const struct i915_refct_sgt_ops rsgt_ops = {
>   /**
>    * i915_refct_sgt_init - Initialize a struct i915_refct_sgt with default ops
>    * @rsgt: The struct i915_refct_sgt to initialize.
> - * size: The size of the underlying memory buffer.
> + * @size: The size of the underlying memory buffer.
>    */
>   void i915_refct_sgt_init(struct i915_refct_sgt *rsgt, size_t size)
>   {
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
> index 9ddb3e743a3e..79b70ae2e766 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -149,7 +149,7 @@ bool i915_sg_trim(struct sg_table *orig_st);
>    */
>   struct i915_refct_sgt_ops {
>   	/**
> -	 * release() - Free the memory of the struct i915_refct_sgt
> +	 * @release: Free the memory of the struct i915_refct_sgt
>   	 * @ref: struct kref that is embedded in the struct i915_refct_sgt
>   	 */
>   	void (*release)(struct kref *ref);
> @@ -159,7 +159,7 @@ struct i915_refct_sgt_ops {
>    * struct i915_refct_sgt - A refcounted scatter-gather table
>    * @kref: struct kref for refcounting
>    * @table: struct sg_table holding the scatter-gather table itself. Note that
> - * @table->sgl = NULL can be used to determine whether a scatter-gather table
> + * @table->sgl == NULL can be used to determine whether a scatter-gather table
>    * is present or not.
>    * @size: The size in bytes of the underlying memory buffer
>    * @ops: The operations structure.
> @@ -173,7 +173,7 @@ struct i915_refct_sgt {
>   
>   /**
>    * i915_refct_sgt_put - Put a refcounted sg-table
> - * @rsgt the struct i915_refct_sgt to put.
> + * @rsgt: the struct i915_refct_sgt to put.
>    */
>   static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
>   {
> @@ -183,7 +183,7 @@ static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
>   
>   /**
>    * i915_refct_sgt_get - Get a refcounted sg-table
> - * @rsgt the struct i915_refct_sgt to get.
> + * @rsgt: the struct i915_refct_sgt to get.
>    */
>   static inline struct i915_refct_sgt *
>   i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
> @@ -195,7 +195,7 @@ i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
>   /**
>    * __i915_refct_sgt_init - Initialize a refcounted sg-list with a custom
>    * operations structure
> - * @rsgt The struct i915_refct_sgt to initialize.
> + * @rsgt: The struct i915_refct_sgt to initialize.
>    * @size: Size in bytes of the underlying memory buffer.
>    * @ops: A customized operations structure in case the refcounted sg-list
>    * is embedded into another structure.
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 6c14d13364bf..85994298a74e 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -256,7 +256,7 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
>   	}
>   }
>   
> -/**
> +/*
>    * __wait_for - magic wait macro
>    *
>    * Macro to help avoid open coding check/wait/timeout patterns. Note that it's
> diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
> index 06923d1816e7..e155f6f7af6f 100644
> --- a/drivers/gpu/drm/i915/i915_vma_resource.h
> +++ b/drivers/gpu/drm/i915/i915_vma_resource.h
> @@ -85,7 +85,7 @@ struct i915_vma_resource {
>   	intel_wakeref_t wakeref;
>   
>   	/**
> -	 * struct i915_vma_bindinfo - Information needed for async bind
> +	 * @bi: Information needed for async bind
>   	 * only but that can be dropped after the bind has taken place.
>   	 * Consider making this a separate argument to the bind_vma
>   	 * op, coalescing with other arguments like vm, stash, cache_level
