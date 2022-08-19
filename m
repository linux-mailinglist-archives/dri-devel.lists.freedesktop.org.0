Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCBD599856
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 11:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FF810E2D3;
	Fri, 19 Aug 2022 09:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C468D10E2D3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 09:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660900456; x=1692436456;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E6m3VYVYg6mmJuPNL9mH8gZQr4z3Q0K/C3crK/G9Rpo=;
 b=hxDTfOHemRzYuy5qDzQLrQuQcxtZdRi/vMCebPc0M3cpCNBtrMdEPCeW
 NzQk/lsvUGDp8e6izQMmAPN+1q+9dA2vEdd5Cbq+/z/IdhiKogBHDjPjn
 +cr5QR2j+P0XxZ/dmcVBLDEZjpex2T3M2oWG98Co48WuVR5NwBG8ouZJG
 VKP/J9kCQar9RZs7o8cDqxvHwTDE89PYFwDpp4vtUEd5QqLr7nTobifcq
 Fic7cBSQoSX6SMoro9RH7pDdKI/+ZheAfveikr4Btz3wS1kmsghbor5Qe
 kvdNkDN4AOE6ze0s63CR61e21mPL2sGi1oJ4uJf/KHjQ//NrUyOLCGR6N w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="356959356"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="356959356"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 02:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="734352935"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 19 Aug 2022 02:14:16 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 02:14:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 19 Aug 2022 02:14:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 02:14:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 02:14:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrsIaaP3Zr8iZfGtVDgHbqCuxendm2fLFzc6w5FLc/gcJOmaj2Hklh8yegl+v19Bc35cFVeLxCtCDvYK3VXBwWUbWEXdfjLFG0pmAR78pZiqfcGGr0gt9AlgZrWXqa7H/4mUK/k2dhJFm1zEgR7gnpM6vt2CpIu7H1S0/2W2J20or/hvssIwTxWVADEKcIzmKrZuk+cLwopdxJAAr/tjegVVZ0Bc1YQe1aqtzOfmfNRV1PqURaX4+jynagwCpo2jjmmMTFe0Sps2RALtxwDXQP/Wg3VY70nk8KqGyV04i/8ODV0RI6aPRQsbVREhu2Z8e9uBKSSoVoLTzIF5SzF9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZZ+UlGELqkz7EdjR2bD/HokXRgfX+jVzpYRIlvoeKQ=;
 b=A5EgyPuiG8EmeJaMDxCOGB3MkmUiMLwZVipG5N2E0+t0YCbnETbqpECUMo8ELeHwJDnE9899BzNUrR6tY20bEIL+WvGz8Etm02cX6mdYh+Ha9NtvekvGiCMq/0SiYkW7QAADtuHpA4mkWe/qMmh6CwwKSep+tYjxhA1CimTfF4e7q0v+98QKF/g/HGdnw1HwhyVUcDZdmRPNbufCda2JwRmOn8yzYko6Z3zPTLWOGdgIMgRkLIbZpaa5uA06M7IhP9Wmt+ecvTKnaeNnvxwTiqrVI9sHV3S54wewdqVT4VRWg1ewLo/b/sJEqxah6a9HdWCwr5L0SXS99sD5/f8eAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN2PR11MB3613.namprd11.prod.outlook.com (2603:10b6:208:ee::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Fri, 19 Aug 2022 09:14:11 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 09:14:11 +0000
Date: Fri, 19 Aug 2022 11:14:04 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/3] drm: Use full allocated minor range for DRM
Message-ID: <20220819091404.oulblhirfwszhhwb@nostramo.hardline.pl>
References: <20220817230600.272790-1-michal.winiarski@intel.com>
 <wWV4E0y1qoweGL7vMn0IgY903SnA0rN5qqy_58NIvSX9j0XkFb1JKTmea4HhNCPsxCUe88Ni7HUa2Bu1UMIxtZZh1nrIR3aVaoooDiAaUvU=@emersion.fr>
 <20220818120616.xuhlnsckjd4octwb@nostramo.hardline.pl>
 <QfMoMae4qM8am6w1mha9iE_XrkqBLaR3r0gaT8oxaXDgysa0_8Si7kQuirRgJ-x_4YPILalQsNJKJqyi5ZDScnPUv65cPwd0y3di5Dntmrw=@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <QfMoMae4qM8am6w1mha9iE_XrkqBLaR3r0gaT8oxaXDgysa0_8Si7kQuirRgJ-x_4YPILalQsNJKJqyi5ZDScnPUv65cPwd0y3di5Dntmrw=@emersion.fr>
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cda8a50e-a7cf-4a93-cec6-08da81c32dfc
X-MS-TrafficTypeDiagnostic: MN2PR11MB3613:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrTJ4cA8IVj1UAiCWBRmM2i0YD4tM92ADjjT3eATyokzH2+ItARJuS5SA4CwyAxKvemIJ7Z/m567RQ4ijtY0rnPGsUiEEoXzyI4uGC4/3rS8dh5iVEtY+QKME8bp0nLeuSZEv/ue9H98cQq8laF/+fz1SLyzNnhva7ZNIkI192h0oZzvYSSXUDQLbfHGgrj9e0/2YV4aRqti9MeXDMsJwyNaSlgiXzmpFoDtsgyut6Oaf4s4MAjoinnJoBgVADjUIcVG6vHOZ70a/GpbUjxPxJcSPZ1aSCL/UScy0cHU1qljKTf5SI3GFIFxJj3BJ6JjeROJXtMth1KtdkQ1F6dLhnUkuLSTkvkGh4LNihCP5udmbFheTUkEuic6P0eq5PU8Bx4LMOiA3rwQIIGX4Zw3f39yzTIwAC5XKyCv5/+T6GxndPpuFr5dr2Z6kBwg/RLICoyVr44JOhDH6HYgmqU37K2JvpoGdlN0PXW1mvz3aFPp1bPL8vs0E6zGlIB3t9dSTbD/tzhJmfu51iOpzPchFDjEV0kEvur4crubL7N54frl/0nMeUqNNxq1XgCrCwl8bjxVZ7SO1d+PArsF7s1EqgDSIzvkYxlZtMWqlL/6BF6YfQDXXIohvKn3NKMbZ0AWLQ70p8mI9SAE+XxTgHhOpgq2Au0bqke30WKejGd+dIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(346002)(396003)(376002)(38100700002)(86362001)(2906002)(316002)(54906003)(6916009)(26005)(3716004)(1076003)(5660300002)(186003)(8676002)(6486002)(82960400001)(66556008)(966005)(4326008)(66946007)(66476007)(6506007)(41300700001)(6512007)(9686003)(6666004)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZyeW5RQXdYN3NoenhuT2l0WU9qTERtdHpOR3JueE5xa2hUQlNaNGhDaUkr?=
 =?utf-8?B?QVZzTXYwQW1zMUFjdnFRVXVoZkp0U1BNV1o3ckh3Q0NRTWIwdUhhcHhWU3pz?=
 =?utf-8?B?VVlJd2ltRS80R080SzFZK2NiS0RRTDJtOStyT1NRbHQvc01pY0UrejFqV2NC?=
 =?utf-8?B?Mm1tVmNjakthQk1TSlBCVkNjcStEaGM5UE1oWDAwdW5oUElJZGhMQ3VNTHh0?=
 =?utf-8?B?bVJrNEM0cElZQnRadXNURWh4eGdxZTlraU1IVEZNNHlpK3BTLzV0Vi9XWG82?=
 =?utf-8?B?VjN6MWMvOW9CcVM4eklxaXRPNy9URWhFd1N4Zm1TamxwUXdnRmkwMjUvbnha?=
 =?utf-8?B?Wlh1N1RSdzJWZzlkbEkzM0FRRGpVUzFCNThiOSt2cDNxbHhZN3RqMThiUkZy?=
 =?utf-8?B?RHh3SVd5SHArcEJHOHJ3Rld3VlhNZHlRSGtCdFVZdmJMOFZmYXYrMWgzK0wr?=
 =?utf-8?B?dURNUUVmSkxOZ2JOUjFHbkdVK1pOQTk1aTlRWHFOUk1ZQjZhZnZScjJHcXBE?=
 =?utf-8?B?Zk9XdHZlOXBPWDMxVDFIc1d4RXpJcGdDeVhyWGZTL0c4U3kwRkhjSE0wR2s3?=
 =?utf-8?B?YkFFOFJLSmt4SHdEdnkzd08yOFRpL0FveHp1WHFUeG5EYTdBcGltaVJtUFFr?=
 =?utf-8?B?NXljK1JIOGNJekkzMnVxUkVQM0tnbFFsRXdMSWN1QnlVd1g3OElOdW5WSGxw?=
 =?utf-8?B?V2tJMDV1VlZVOUk1NHlQT3l4Vm1MdGhxSVR0T2hwR3VhYjdoQ1NjUWJiTzlD?=
 =?utf-8?B?NmVWRVVKdnlWdWxxQUNWNmZ2Y3BkOUNvbENsZDBHaGROdXl6K0I0cjhjSUVT?=
 =?utf-8?B?SU95MFZaUnNQdlE2T1lvYkxCL2VNM1pIKzZTUW84TEZLNVhadmdRQzlLYTNF?=
 =?utf-8?B?K2gvQnM2QWdFQ3c5YTlRR25tN2FhVkx6enJZMys3R0lKUWFnbzRMVDFNbm1N?=
 =?utf-8?B?VTFxTHdIVXRhUWM2UStXUUVVRCtFYUdVWElTY2xZS1J3blBnRldVOE55Nm9y?=
 =?utf-8?B?VTFCemFUMElHa1AycXI2Tm8zOXd6ZzExZXc2Q1I5ekRMcHFia01Ka2wyOHVZ?=
 =?utf-8?B?dURPbGMvOVZydXRNUWt5cTlFVjJld3lQUit6a3R4aHFqTWRCcjF2S0REQzk3?=
 =?utf-8?B?VUpDaWwrNTJnZ2ZwWnBhbmF0T0ZGQVRmLzBjblJaTDZkWGhoRy8vNno3cHFI?=
 =?utf-8?B?bXdQdGgvdmxseUJJQVoyRUg2c1FBZUZMTkRkYS9iWjFLSnRHQ3orZXVVTU0z?=
 =?utf-8?B?TE1vcFJmaGVXOC9zZndLVzBVTlM0WSt5TXdwK0xGNWZWbUlIRHhaSERDeHdX?=
 =?utf-8?B?RUpJYzNybExtMlhIbm4rR2NMcTFtKzBnY3NYdFhQL3ZCR1dmckpiMVJEU1JZ?=
 =?utf-8?B?aFZIZno0bEI2UW5xYUY1eVJsZTVDNjFWZlcyVksvdG5OaGczZ2VlQjBTcERr?=
 =?utf-8?B?NWdOdVhYcnA0SUF3bnNyZ012Qlc4Y3VHbEZaSFV3T3FJNzQ3MkZObGxCdDJQ?=
 =?utf-8?B?UnUwaHg4cnZocCtlNXAvd3ErT3ZBOEh1aU5VekNwdVpIQ20zcmhsaFppWFhj?=
 =?utf-8?B?bysyRTFNU1BxV0tTejFyZWgxOUxyRUlnRlFTVDJYOUc1WDluOE9Nb3oyQnhB?=
 =?utf-8?B?UnpKejZndHp3Y1ZUdzcrRW9DdTl5RXF1R2luWk9sQWhJaFpNaEJESUJEU2hC?=
 =?utf-8?B?ZXh5b3lzZzdnZW1DZVlObUd0Q2xWaFg4RXNTWHVVMk55RUFIT1RHNmVPbFJQ?=
 =?utf-8?B?V1JHdkQ1QXc1ekZwbHpXRnpjQXJaOVpNV2xHRzMwUFJOdVpQTW9YR1JkS0cv?=
 =?utf-8?B?NFRWQkk3eHFLOWIwWXVya2JGTTRiMHpyS3ErRTl0Vnc3WHF0aklxRkVsUHFi?=
 =?utf-8?B?cURYK01FYzFYNTR2V216b2JlNE5RNTNYbGNIb0hqRkhKcUF4NDdiS1ZIRnNm?=
 =?utf-8?B?S0crRmJaL1JGcGoySVVhQS9Va05jbGJpZmhSQ2dvS3BhdjExSTZwZzhzK1Rw?=
 =?utf-8?B?VlhPRGJkMFB3TVRvY0NXWVRDL2xMK1VTR2liMEhVemtocERGd2ovbGd6Z2xz?=
 =?utf-8?B?a0xIU0tiY005ZGdoa1hRV1J2STlKN3NlRC9DUkM4TnNRVU5ERDdpNnlaVzBq?=
 =?utf-8?B?dHorTi9NVFpaNGtsaDgwMVcyRDZEa0xNZkMzZVNDeWdCdU5nUjlvbE05NklX?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cda8a50e-a7cf-4a93-cec6-08da81c32dfc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 09:14:11.8369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3WbvN4oR2SBB8JiE0B89OLdCgZDclAv9nRq8Zf8+F+tG4FasD1QtZKyLcgqpuYYo6IipatecutltFGlb1E5iYjaTuw9T6Z8dWbhbXWs3vI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3613
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 19, 2022 at 08:16:07AM +0000, Simon Ser wrote:
> (It seems like the list was dropped in my reply, sorry about that.
> Re-adding it now.)
> 
> On Thursday, August 18th, 2022 at 14:06, Michał Winiarski <michal.winiarski@intel.com> wrote:
> 
> > On Thu, Aug 18, 2022 at 07:39:13AM +0000, Simon Ser wrote:
> > 
> > > Hm, I'm a bit worried about the user-space implications of this… e.g. libdrm
> > > can check for the major/minor to find out the type of a node. Dropping CONTROL
> > > from the enum will break that.
> > 
> > Yeah, but that would only cause problems if there are more than 64 devices in
> > the system, and the user-space in question is smart enough to support that.
> > 
> > IIUC libdrm only looks for 16 devices:
> > https://gitlab.freedesktop.org/mesa/drm/-/blob/main/xf86drm.h#L47
> > 
> > I'm not very familiar with mesa codebase, but I think it has something similar:
> > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/auxiliary/pipe-loader/pipe_loader_drm.c#L52
> > 
> > I expect other clients to also have something similar (loop over minors, 0-63
> > for primary, 128-191 for render).
> > 
> > So this shouldn't really cause a regression, it's just that "old" userspace
> > won't be able to use more devices (but it's also not able to use more devices
> > without this series).
> 
> Unfortunately I think there are more assumptions all over the place, see e.g.
> drmGetMinorType:
> https://gitlab.freedesktop.org/mesa/drm/-/blob/main/xf86drm.c#L986
> 
> Also I'm not very found of dropping DRM_NODE_CONTROL from the kernel enum --
> this results in DRM_NODE_RENDER=1 in the kernel but DRM_NODE_RENDER=2 in
> user-space which sounds pretty error-prone.
> 
> > I could go with 0-63 primary, 64-127 empty, 128-191 render, 192-255 primary,
> > 256-319 empty, (...)
> > But it just seems like a waste to burn 1/3 of minors.
> 
> Could potentially work I guess.
> 
> > Perhaps it would also be possible to go with:
> > 0-63 primary, 64-127 empty, 128-191 render, 192-512K continuous range
> > where we distribute minors first-come first-serve, without any link to type (so
> > usually we'd get continuous card192, renderD193, and so on)
> 
> We would need to re-design drmGetMinorType if we go down this path.

It needs to be changed either way.
Even if we keep reserving 1/3 of minors, drmGetMinorType is still broken (will
return -1, for minors > 191).

Let's respin this with dropping patch 1 and reserving control minors.

-Michał
