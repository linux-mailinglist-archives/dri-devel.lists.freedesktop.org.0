Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66236EA01E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 01:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F7E10ED3B;
	Thu, 20 Apr 2023 23:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F176B10ED3B;
 Thu, 20 Apr 2023 23:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682034273; x=1713570273;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pH8gMb7IAFZc0sJZ5wiJTY0iA1cDE/xmAFbsgbiMUT4=;
 b=N9Ex66tZJF91vVfxOi2Dv64rltiSURSrWyWpyDhYhlMLtjCeBpt85Glm
 5VP343jSnyFuOluR2w0rr3bstso/fyOid6eAXr1eneID9SqpTleN/GSla
 eiuK3Mz31JDBi6B5Ujoi9Xi5gJiORIqjAh83c5wgG3LgGEIxCWTUxA+B+
 MAEtm3aulohTv77sDkq2cdlRWWnSvSudAA/twiyWAkxBnrR6yc6F/0UAY
 jjJWBgfIC0SApWj7LmRVUOHI7RrNM8tZLEPaRcR9xl2qUefA/jvn80j2H
 ELKSTumeHj7cVh22fwdVTkwun8NiX/UnpOZrKBx5+DzRBGUkyS9BeN8iF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="411139175"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="411139175"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 16:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="724598720"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="724598720"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 20 Apr 2023 16:44:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 16:44:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 16:44:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 16:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqGZ2460dwq3Z8ZLJREKdB2oSmlbXVfQfdxiXdgMFPIo18bZ9PgovIFoBDkNK6nbnwErjhhbNTS9f8gyVAj8jJ4z3EZoaw+AkZALt3dHs/jLiwHKM7EGIrDk3dmUJwW+7DH/R179dJ8OnpInXg5VowmuKfrezUznPr4/SaRFYsvvzPdbZ6a69qJrgaf/2sE9O32r0ISgeoBDIukk94MizgP20DxC6+AMIuk1/jSuSFLFaK1/AsRrshsy6p/AWbX9JQfE+FvAx/9bZqvJuNuXR8SUrmJCKzDVW4sc266PVGQoRaJBohq7NycgLlXptGI9Glhz/MKyGTQGzZJfFKsncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbavR+Soe1Zi7OgZb1UcsPwl+avL0R9jjxUzKWe4S14=;
 b=JU43jtGsR2ZlhP7uXlR/eHXXspfxpxuAEfWJK4ObtztJgNINtYf1lEsYl8QAx1bxByaU0hRu6TrjErLz/h9vrr155bnr2nbJAIFtZnLzLdGLozI5iwmHh+L84NARiIt3Dvsk4y+SOf/i0XzsTX6UvABE0EZDktW6vyEwoh0H/CLPm7eITPCOAXp2AHC0LDtQ7G+3lI7zHoLAB0dMqf3mEnlwZY4VKfYCJnzyeDGWKIpDSj+ekEB1hF7l3vG/Bny4331yTBwFjVNvL7YFwrTdEyZkUmMTb3AbgStg9uv/vygl3Nb5UAJlgx+4nS4QBi1LRpo+1mpPwlpeUq2spDuCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Thu, 20 Apr 2023 23:44:14 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 23:44:14 +0000
Message-ID: <1cd7f54f-1e57-669d-1786-8149c29f6b6b@intel.com>
Date: Thu, 20 Apr 2023 16:44:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] mei: gsc_proxy: add gsc proxy driver
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
 <20230329165658.2686549-3-daniele.ceraolospurio@intel.com>
 <612b04c9c35f1f67083ce5cb889f909fb89bb066.camel@intel.com>
 <553a192a-f52a-a3fb-4f20-ed79bf75f0c6@intel.com>
In-Reply-To: <553a192a-f52a-a3fb-4f20-ed79bf75f0c6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::27) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc3af25-518c-4621-6fac-08db41f92594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OkR6aza03y+reWD8j0k4GGK7q5plJ90Dg08up30Os2mEw2BYYGfl7wlg78EILQZGYohzY4L5stvCUKE27gOJ5/TopTw68IlDUxtZBNoFiZ40j8ZDgg2ndwnK9TcoPDQFK4leqFYLLMQEP9qzuuU/G8JLkFdIMLRKWlbbZhcSIJ3KSA4p/xNH2D0JaXYFzKcxzcC5HvyKke5CS6JF/gYfj/IOzId0GTXBv3oHtes+Te7voRxd0Q7vobsp2j7kMeA0QT/c5q/kop0hVmblABqvhvlm/Xgtuw5WDnPhAPcVEtEbVJeF/01FPpZQzqT7fFFDS3y3wp7Kb1RXC9tI+tAV4qrCRFn0sXc8ufQrksmgSPz0OvDkTnmzKOBHilNVZj4irJ00lrdN/73xBI8DWe4+dQxNwG+ET/JWnrGWQOOrnXQptXCQfsAod/VJjkMP6doppXCKGL4CaNFaSB6LoYEoQGKSuCe/nJOgl5jR0cvNvEscoWDynX3iaTa4dcf7y/ryMZudLf9+SVfxZ1MwofJ5q5KJ63+4vfh/OD9aUSs14OxhrEUmrkgtF2eZDY9fc6Mcq6RfeZrQTSOKflRhRJS4PsvwasB8tgT+2bUFDmbe3+LDbyHQB6fX2QzltQx5NsZNnOfhILjs535PifiZg2RVmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199021)(31686004)(4326008)(8936002)(110136005)(54906003)(66556008)(66476007)(66946007)(316002)(186003)(53546011)(38100700002)(26005)(6506007)(107886003)(2616005)(6512007)(5660300002)(8676002)(6666004)(41300700001)(478600001)(6486002)(31696002)(86362001)(36756003)(2906002)(82960400001)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWRsUGpOWUVYc0s3Qnd5OUI2ZHVCbThHTzdPaWpFeE5PM3dtL3preTdsd2JX?=
 =?utf-8?B?S01sa3BUY0JMSHd0NFZySkN6VXBOK3dHOGFxR3dJeUljNWV2OUxlWTAzUlRn?=
 =?utf-8?B?eGR4U3hheDFMMkFpR3FsbGl6RUhsUy8ycERyVGRKbW5DMzh0UGJRQmVWNVN6?=
 =?utf-8?B?Lzh1T0J4RzNCRzJYM2hxM2lXcjcvalQ1Q3pzbHZRaTNlaDMvRG5aWnN4MU1M?=
 =?utf-8?B?TkJ0VGlOS09jQllsQW5FU041aTEvb3FxbS9nWDdoTWk1VHIrakZHR1lxdnB1?=
 =?utf-8?B?ODdDUFlaTnhmZnlVUlRDcmYvNkZFTFU2K000TWVIQ3dEeFBpbDYxWjNHWkJo?=
 =?utf-8?B?UWRPbVdjNEczNVZPVDZySmJMeVJhZzdSRXhBZW5XY3JBS2wwbWtDMzlaTkRS?=
 =?utf-8?B?SXRhazZCOEVCc1JZSjVRTEgvYU5MUHlPcStrV2lwU1Ewa2lYaVRTWFduRU11?=
 =?utf-8?B?MjlkTjIyY04xdHdLWEdwL1R3ZEpPbkZSVGhZaVBuVVpNVzA3U1NsMGg2b0Vl?=
 =?utf-8?B?bzc2U1JxZTZGbWpVQXplNmVveklpMEZsTGUvZzZoRURKc0EyZTZSRlI3NTVi?=
 =?utf-8?B?eE5sRVhNUkpaejhTOEh5NjlvVm90QkQ0RzhWN3p6VUJmaUpwVWVVNWluMU15?=
 =?utf-8?B?Tk9ROEpYZmJYblR6Y2haNWlZVnI5U05CWCtHZEwyaW5BNy9HdGNGTkRwMm40?=
 =?utf-8?B?MTBVMFdaVzk2cklYNjJudUpwdldmRHYyTjQrWDZtbkJNeFpWOVJwT0ZUNGY3?=
 =?utf-8?B?ZWZ3cURZOEkvR3dyMEJNT2w5Z2lzbTk4VUZDWHZSenR4NXRNVTBWMW1WVW9R?=
 =?utf-8?B?c2V6ZGhPbXBTUmJNcmNxOXh3Y2x0Qk01V24zSGg2eHpPdHhQZk9wVmlDYzAz?=
 =?utf-8?B?Z3N2NmVPTGtmVy9TM2FaR0F0ZnlOS3R4WktxR0swWmxLM0R1aWh0K1R5ZlNr?=
 =?utf-8?B?SW9reDJjclRvTWVzQzRzVGhnWmxHelE1UkhaN1BDcXlxWk4zMUVySEJVaU4w?=
 =?utf-8?B?L2FueXMrcC91ZEo4YzBpU0psNGNlVHRicms4MzQyZXZxOHY2WC9OcmtqWXMr?=
 =?utf-8?B?ZUwwbnV5OWR4OWNwUDJncTZIOFZ0bnZoWWpkbmZ5R25FZTdpazM3NGprWFhi?=
 =?utf-8?B?VnpIOVpmM3NydHk3bnBBRDRuWDdWNmpMS0tWcWIxbUFsR2cwbktYbUFnTVgw?=
 =?utf-8?B?anFqb0lwTGdHWjRPdjhVQk85MXoxUDFkYmM2WDY3ZjQ4THVwRUtNQmJWYU1h?=
 =?utf-8?B?MnhYZzBTR2xYdGdFeVp4eVlqOXpZb1ZwM21heWtQZ1IwejRYaDFCYk5lQ3JS?=
 =?utf-8?B?bXZ3ZCtIWk45cEs5bmtZcXBvN2JOazJQcG53elAzSzVCdDFjYWpkMGFGNTIx?=
 =?utf-8?B?QVNFc3VZL2ljNUlxU2g2eTB1eFJ5OWU4TE9vV2t1RFRTbnUwWHRqcGozazhv?=
 =?utf-8?B?eUZIbkUvUWcvdytWQ3VsbFJ6TmdlaVRsTEo3eDcxbHZHQ1lxdlRaR1RBemlM?=
 =?utf-8?B?WjJCdm5oazhDR3A3bXVqdGQybzNmMFE2U0VacUF0c1huRFA4UTJDR3hXZU1l?=
 =?utf-8?B?Y0ROQ3hnRm1mZjhjR1p5M3FzUjBaZFJDOE9TSFJaOEhKSityMEVOVG1FLy93?=
 =?utf-8?B?VVRaQklUUEdDNlZrTGozcWdWcFIxT2JLckZ2M3lSNkQrbHlXODZpc0tjbi9w?=
 =?utf-8?B?YUNOaStrUEpURE4yR2hraHpJTjVxOHA5WnQreHJkY2k4SkZTdmVabHJSNDhh?=
 =?utf-8?B?emRsaUsxSXVMVktsMjZFWG1HbGdLL1B5K0Roc1czVXo3OVJWN2dtODRjOUxX?=
 =?utf-8?B?VXBUZC8rNmYvUWFDV1EvL3pIakR5R3NNUHo1U2NvSlJJMmx5SUhQSlF6cE9w?=
 =?utf-8?B?cDBMNHJ0Z3lzTnNtUlVmWGxUOFJZODliQWIwTE1PeW1heFZqTUxnTlhMVjZZ?=
 =?utf-8?B?U2JVRXJVeHZqVGY1SVlBa2d6ek9DQ3R4OGtXeDUxNFluN1dwTW9aUTBMU0c4?=
 =?utf-8?B?dU52TmlRNW5XeWNrQTNKMXY5U0swK0lFZTVrcCs2ZjJRS1RDbG5xbVVDYW1z?=
 =?utf-8?B?bVhtN0xIaWFtbXdWYmlzTm1QYjdMV0dNN0EyOFZCM1FzU2VPY1dFaVZ6bVZr?=
 =?utf-8?B?M1A1aGlKUzVsRmJ4WHd1dG1HbXM4MnM2NGNFQTR0ekg0Y0tqS0k5UW1tRXVL?=
 =?utf-8?Q?j8KnUHTkNFSe++VNT2/7Y7c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc3af25-518c-4621-6fac-08db41f92594
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 23:44:13.8643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oM6ZBR03NSGs6pv1ZI/Q+pP/34vRZAUleQB6FS28emT1FT6MDPc0VOsxkgR2KSWdLNPUcIKNyZSNTZLE1ru6IdG21WMGRESucT5V6ziylhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Winkler,
 Tomas" <tomas.winkler@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/20/2023 3:04 PM, Ceraolo Spurio, Daniele wrote:
>
>
> On 4/18/2023 11:57 PM, Teres Alexis, Alan Previn wrote:
>> On Wed, 2023-03-29 at 09:56 -0700, Ceraolo Spurio, Daniele wrote:
>>> From: Alexander Usyskin <alexander.usyskin@intel.com>
>>>
>>> Add GSC proxy driver. It to allows messaging between GSC component
>>> on Intel on board graphics card and CSE device.
>> alan:nit: isn't "Intel integrated GPU" clearer than "Intel on-board 
>> graphics card"?
>> Same thing for the Kconfig description later (or am i missing 
>> something else here).
>
> Will change

Thinking again, GSC proxy will be applicable to non-integrated GPUs as 
well, so I'm just going to change this to "Intel graphics card".

Daniele
