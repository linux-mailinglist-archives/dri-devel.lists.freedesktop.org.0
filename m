Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1E76013E5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B17410E6A7;
	Mon, 17 Oct 2022 16:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843EF10E69F;
 Mon, 17 Oct 2022 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025436; x=1697561436;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xIgD6TGike2eQBGOZ2Kp1i39cYmb3rbEQ5LGzpcq/NY=;
 b=T6gTJ1h6IK3nWIUBZXRXZvR/zWwWMU5f7p4WWsDM41LWdQO/bE54MsVe
 9tYT4BwFvKd78lrDUrOIYeRtBM9MA6QqZO5G3xFCHV+T4kYiFuFJS78xZ
 HoI23ryjNBRiCxdq81LPqpfudzp+ujsTUeGWW0fT5g+22XKF+m6QAqa2w
 xm05ODa/HENJDSAPzXCSnvM9zEVzGvWVtUqi8Ek15O7hSLuaEs6ioODcc
 afG4YLBV7/0/51dFtp2F5LsXilSUgUXgcTR/U73yXcf2S7MgpBN7t8Dx+
 Cbi/r7PiLaezTLL5pbK0hMpfCCeJSlHw/m5kTHuZ4w79ANkEbtpQ/4N5G Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="306936864"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="306936864"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="957409137"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="957409137"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 17 Oct 2022 09:50:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:50:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:50:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:50:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzMJGFCYvCG2cuzlMeUnuBN4iilhxEYYZFGIQwFMD7DUF5R0UsNhSwomIEZkyqQKPAZ8MtBbfzzriY8KtYkRU6FYDW6Hb90gb+mJGWR7bZYDMmYpMoEMeOINSZxXXzhR3yYBmJFSPUXYicCqUVLQAVcvZXbfWNU0wibqQ/gEvPt/bkqGBKRgzUjiCnDLqUXrlduUnK/xMlgumOxbDiK7xu6t9VvMB+hNxJrDmeHa4o71qLIM59FM/SB2mqJU/viX6ImrQCSQwQ/F0hrQETTXLCwGmbpj474xgsLVel5VC5q+g2Ki0qXZSQAR1Unka1nHPSsevfC1n0EBGoiuIl39fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEm8FssaaitSjbb6BeWihsJlp5v2Kdg0KHc2sXBBkBU=;
 b=KXalUqy04ycgYKMTZ9ynPCtEtkLjwCiCuk4aWWjf/JQ+2HtLZmTaPMJtrZm/IS87TTVmUmzgxStCc3LoBP3jSWS+idYj4si0q3nw3G+WvAEX52Fudkw8+rx1nXj1tcZXMc8OLl0JYvRHOa4HkGUOydoy6qPvCGZUxAn/AdkcfqEiHk7mnnbhze4QezEQigpeqbs8579dboyqKBaCIxHgj7Xdx+UTuj8P1BR+D262l5UarL7VjiqsXWsfHhqz/5TlfvOUI2riJx/P+0qIarsA271ebTyTRyBHaR+3vWj+tmaNOnb3znpPNaJT4iNxfVM4T8uNVAEKlLK+3uM/N/HuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 16:50:31 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:50:30 +0000
Date: Mon, 17 Oct 2022 22:20:18 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 03/14] drm/i915/gt: Drop a few unused register
 definitions
Message-ID: <Y02Hyku3+whe2onQ@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::8) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|IA1PR11MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ee9d7c-dcee-43c1-4bf1-08dab05fb376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vhdAgIMn78rtqpKddbgDInnBnSJ7l+5nVB5rrKAV9FU+saO2/zVpcu6Y9FFRmZuCwYOIyI1wCZZ4KcyAehRdlKLGe0C3cZExRuAVrKfSkrn6gnAbGg48azM1nuotqbi5V4zLaaizC36ZTRWgsCyRjn+xGloHChd0Obl15ALklDqC/tqXKIudN2n5f+cPR4YPI8hYj1b9sl+7U++tVq4VY+MFqnYgL0WcDeUXv3bE0+xfrF/Df/4QRT3haQvk1Beimq4vJQN8lIe/+dcFfYCd+DE9sOiPApb/Lci/S+ixWpiXFjy5pkuS6//sN6IjNAyEE/3FQilOffRCN+HqkPob8wiODcPK/X2SlnrUFMDCSeLR7nNmvnZkRNrtkj8Rz8WnB4v+lb4BYC/XRRZ93AKDSPLTPgQP8OJ9PA1HzHxaT0LL3IR5JhONaeIJvnZqoWQbcr75AwqdGmGGc7nRsuB6GOi/wVUVdCwZDuKLumewWSKrj723SZXvBIHBY5l6AJxBbyyibE9II/EWwJL2D7431dDpc15plVul4XHWRXZ9AToCovwNv8PyHd9/+RUwIAFVWE8KkoKHoRZfKuJnAkPz2GMADxZHnVPAYzt2mThgnReX+BTa+zCNyXPWYiUSh4JMbfqnDUFMWJMWy4TWg9bD4KSZ94L59+don72MYSmKCClphDv95gVmsWCpBq8RFmCZPKKSNlqDTXOWiOXPh/9wKpsr3iWuJslsGqRewqg5Lv0wl574YreCIIO405dOnTF2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(5660300002)(4744005)(44832011)(66946007)(66556008)(316002)(6512007)(478600001)(6506007)(53546011)(41300700001)(9686003)(4326008)(26005)(8676002)(6486002)(2906002)(8936002)(186003)(66476007)(82960400001)(33716001)(83380400001)(6666004)(38100700002)(450100002)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzkzQ1Y2V3VhQVA3UXc1TVVYK3hFeFJySW5uUXhWNEFjQ3FESG5JUDZPZWo3?=
 =?utf-8?B?Qk1wSFVuRUtMYlpIV1hCeWJFcU5XNnY0bEQwY3ZXUzdxZlhYT2tSNGwra2NX?=
 =?utf-8?B?Q0hXN2NVc0hvdWNpMkdBRVk1ZWd0Q1IzZlZ0d0ZUSEhMQy9GOXVZL0x6Q3Yr?=
 =?utf-8?B?YjFQSnJ0WVpIeGQ1bmNCTkMzMisyZHpBWDQ5aEkrV1ZwME9PQ0dZeWxOYUxY?=
 =?utf-8?B?aTI0Tm9DK1FlZjMrVmYwQWZ4dzViaFp1Ly9uQXQ2REtqM0dDNDl2Q0tLTGxo?=
 =?utf-8?B?RHptY1RWTDgzeFUzdXQreXl4b2tRRW1UYm9vdjZJWnJUcDgwbmpIL2xneng5?=
 =?utf-8?B?aVRsblpPS0QvamwxbWxUSkNsOTBselhRSTFFcE8xZVZiY1NkY2F0b3B6UFRS?=
 =?utf-8?B?enVxa0tEVzN0RDlJN2FZZW9RbjRURlA5bkF5V0p0WjNadEcrbkxCYlVvYlRy?=
 =?utf-8?B?K2Q2Q0FyZlpmWjJFS2ozSGVLUWdEbHIremhKYUZpWUltdXl3clNYc1NXN2Zy?=
 =?utf-8?B?Q0tzdFpDaFE4MVJaMC9JZkxMZW9JcnFnRzhoT0VqeXprWlRTY2l3ZmlGVTYv?=
 =?utf-8?B?WnJIK010bFpleElkL0RySUhaYlZud3BEMWhHOU9la2hSUHh0clRoczhlL1RV?=
 =?utf-8?B?cXdUZzBZQ2xaQ3RJemp1Vm8xN2U0RU5uNjM1cE1KZ1ZYd0ppREFJYmdHcitC?=
 =?utf-8?B?aXprVDZIdmFkQXB6U0ZmVll1MkQxNjVCMjdIS3RXZmlXejF2SEZucHhlUDdY?=
 =?utf-8?B?QzErVlpGbWluYmpNZmp3V3QxM1VXbkE5TThrZTBBMktjRjFrOFNkVm5taFZx?=
 =?utf-8?B?RFMyVGJwUXBtdk9MTCt4VWFJUG9TOHFJMGJVbWxtalhvVlBpMGFUcTBzR01T?=
 =?utf-8?B?cUFLMFdOV0MySzBSMHhnS0VFd1A4WXlnV2tRbEcvQnV1NmQ4eVc2MHhqYldi?=
 =?utf-8?B?TktGN1V6T2x6NGhFb29BREU0dnZXZWk2RmdJaFBtV1l1angwMjZrRVJoUXE1?=
 =?utf-8?B?V0Q4VlA5NG5rQlMra3U0TlhWaFp4SW9CU0FTemp1Y0VsTDFCbGlKbmF1TWVp?=
 =?utf-8?B?a0JYMS9BOG1BVFVjMkRDczNJbDBscHFlNzU3UWZZMzY5d01yVFZPNm9YNHYv?=
 =?utf-8?B?eTFUS3lHOEJrMk9XK2IzQzVxTmg3a2lZSHJiUkZQNjBSckZTSHdkbThtMVVJ?=
 =?utf-8?B?Q3BHb3U0VkM2RXFPNzk4VUc3TnNpUjVySkpQLzJ6RXFCWWZrbkdQZndXYnov?=
 =?utf-8?B?REUvRVB0ZnFzUkNCbEI3YXhGQ043eFpIVnVBV2RGOUdmb2hVQU51d1Q1eUI4?=
 =?utf-8?B?dnJnVGpEeHNzSm55Z3VITzRpbjBDbnBzVUxzbFZnOWpnRkg1aWxIQnc4aG82?=
 =?utf-8?B?S0d6TkVFVFdtNUYwS1dhWXpUNXZaQ2FDWkhQVWc1dVZOcHRzQUxzZGNrNFFV?=
 =?utf-8?B?Qlg2QTNhbkQ3R0RseWVkUzVXZGpoRmxQVUV4eUUvdUViNThwUkFyYkQ0VHBI?=
 =?utf-8?B?UXg4ampLcGZRZ0FrZjhpek9BcHJsRndYTVptTTk1M0llWk02VGphcnZreGZ3?=
 =?utf-8?B?NjkyUlg5b2k4S0RkNG1iNWVlTTZRVDNaZk5ES1NiQTF5NGVVdnluMmFUUElY?=
 =?utf-8?B?ZzVDZnNQdWVkRUp6eHE0anM0azBrRWdaWkJ6Uk9NZDFpOEkvdmRIN0hPeTdF?=
 =?utf-8?B?ZUlNUER4WElYdVlKbWg3c3RDNFJpQUV6bGtDWCs0a2VRM1Q5cXpoK3d5Y3hE?=
 =?utf-8?B?blZzMHBEckhBeUt0N3p3M3NpSXRGSUc3ZVRldVJxK0RFM2ZyMWM4aTJmYTRm?=
 =?utf-8?B?WEx2bWQxK3lIR25LNnh6UTk4SjJPeE9yQTBjR0JacnlpZ0lsSWxYNnFqVkRh?=
 =?utf-8?B?aEs0YmxOWGVTL0RYNkdxT1NQM3pKSFBRbjU2bFNsWFB0b2RtekxsVER6MTNj?=
 =?utf-8?B?WmNRZHo3QTRsd1hzVFJIRWo5azA3bzF0emZRSUsyb2RrbkNrSHEyTjhrREdo?=
 =?utf-8?B?UDVJOHAxa1EwRmtLMW43UDQzM3QrbVVIajE1cEcxRjJBNnFrWFhYRmVZRFh6?=
 =?utf-8?B?RW9FQjMwdjdsRmhyTjFJdVlmb3pBOGNSNE1xNmgwNU5QRllvcUlmUzNEUlBu?=
 =?utf-8?B?M0VBZWlFQTd4dWVOMStKUXVMcmZrRUIxUTRtS0F1VGQwdFVDNlhkb3Jpb0p2?=
 =?utf-8?Q?gpkXrAzDQhnENNZN+a+6Mmg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ee9d7c-dcee-43c1-4bf1-08dab05fb376
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:50:30.8727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sh2sHiQzBrLoMc5jWlUGdFd31u0gdzGKniRJNeEFy5BtNQJEKOiNXqoVpgu/KODYa26QQa1Lo7n3dBkmsaNcNoR5mbM75ndfef2aff8E52qKOq3B58rNJM4lHdT8VI96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.10.2022 16:02, Matt Roper wrote:
> Let's drop a few register definitions that are unused anywhere in the
> driver today.  Since the referenced offsets are part of what is now
> considered a multicast register region, the current definitions would
> not be correct for use on any future platform.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 17 -----------------
>  1 file changed, 17 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
