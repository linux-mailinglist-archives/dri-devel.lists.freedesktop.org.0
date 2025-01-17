Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CD2A1575F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 19:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5221310EB6A;
	Fri, 17 Jan 2025 18:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/5OxDt7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1593910E10F;
 Fri, 17 Jan 2025 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737139583; x=1768675583;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MxQPv4x0TgO3N/ubTkH5kr4cfD+v2YGubVL9HeoVWic=;
 b=Y/5OxDt7PV1fb4SJ/zQ7SsnTn3F+SneGdbxl1Vx9102zDl/TBznDl9AX
 M/ml71IAejW4r3NzsaxfV/Y8ahHtm30k+dwpxlDs3NhNoYm6s2WQfoqzH
 b5UiVk+klMQjIAtU8hePir5HvSTzGxFp9kh+ssA56umGy3MvG7w4Wj3Qp
 xdG86NjZlI1zH3VJAa47Zvs0GfdSGIGpnjdhR4nfRUj14bvNHJD8i2UXp
 YyJvHIXC7lpcxsAnjc50xGLou8BS9UovYpRM9efOm3jRjH5KM2KddFzK2
 UVFud8zXBYqdfrV3qJVnNrJbZ7PH5ZEB6a6n6c6WgrcgCEMjYLbtMYMua g==;
X-CSE-ConnectionGUID: +m3M/7o2QrKnywbeYwm6Qg==
X-CSE-MsgGUID: PrfwQrFfRDqzYYszdSSOtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37464044"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="37464044"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 10:46:23 -0800
X-CSE-ConnectionGUID: G0hnD1YhRT6H9cgiEDJufg==
X-CSE-MsgGUID: MY0w6IhPSqqo8vn0Bv5GwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="105675955"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 10:46:22 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 10:46:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 10:46:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 10:46:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4JJ1iHsmVvuYf/+iiAVhos0BhZ7+j8ntThwDqqO7Wm0x1axyR7QCK4y48gEMzSzvC9kl97cEk4g90+uR40DZS/PPA/rJuBBwmQplf4qqgAs57qFv35lnM12Ojr+TGD/Z3QB8pjJ+GmOWBLXC9d2SHLIM7fNjVTazj8l/OGz8KGHqltDihuFuxPH2up6H18l9yM/4nAXsQi3yMambHCvPuU8iXy/NEK63hFV3UlFAII2d8sEOs2wBDWLcEqKbmPrc60h+4S/MSLaA3Gj2QJHovFQNXKmBXSalSEIA5mBU9b0AoEuFtbCZcXjj89AzOFndIiQJ6ddnoD3XViA3oZa3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPQNA2YwWddU0COiNtBt7ABcIzT27fOfhlvWW2CQPjk=;
 b=JTyjrTk+8ZsukNlnAizb2gOE1bjSdN9m5xQ8b3ianOhaIUPuuV/0m8vVSsUPdzv0QzKEneV4j065ZdjBr7T36FmMw3/6zRGI0ee/H9eNQOpt6JmHoNC/AJ9uQYTz2F5yo9vcMhTaD9Didd64wz9IrB712uTKRB4BBjBgLXS+WjbI+r8GjxBfFYKU5+G6Yvv86qW/3D5SXZ1qIfkyjjC7Dfj+A9vuZAqYVqXV+DnT/CjbyKPFnSr0z8opLeKzWjnrH/ZmQEUX6lRQa2M3xgaBithgR/fwUCF6y/kx4K4ReogOkuCVYqryV1YzHx+72PPQyY8/s7IqGrzV7yaeXgL58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 18:46:18 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 18:46:18 +0000
Date: Fri, 17 Jan 2025 13:46:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH v2] drm/i915/slpc: Add sysfs for SLPC power profiles
Message-ID: <Z4qleD0uerUnc2a0@intel.com>
References: <20250110232151.2844865-1-vinay.belgaumkar@intel.com>
 <Z4mOwZz1tJCxLeP0@intel.com>
 <0a192f39-0361-4c2c-82c1-1bdc45edaf06@intel.com>
 <Z4ppRx_hr713Ik1S@intel.com>
 <0302a082-57b9-4335-819c-eb366b0be063@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0302a082-57b9-4335-819c-eb366b0be063@intel.com>
X-ClientProxiedBy: BLAP220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::10) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: adcb746d-67a7-4bfc-7175-08dd37273a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NtVjxiOIPdKrl9GryF0ax5VnpM7VyXMIpMc8qC7fqIYcoqPkNvs7IPdxsPOx?=
 =?us-ascii?Q?PuJ2s5yYQqjl6MQglNVtL9n2tJFghQAAylZfQEDMAhtgiuC8yZ4naAtZ72HS?=
 =?us-ascii?Q?nexgadx+liJ16CmKkan4+RGuYaH3k1N6GYEgf355AVSqHL7dmlosWRZNgnbn?=
 =?us-ascii?Q?HWO64EAgw1G5g0B3QUxeFYggubLfkvb4cRZzZ374TkI3FC6wkN/mjVQU1QB7?=
 =?us-ascii?Q?ac813HGt7XC/Amr+3bu0J4+BAqAGHRWTbYLDqm2/Rp0g/DReDQLpyPWwIj6f?=
 =?us-ascii?Q?nFujjhKqGjcnU/vG6v4qmQFSDsQznDgIWmmc66USDSvuyzWa3CyR1FnSGDO0?=
 =?us-ascii?Q?9LmBkdMUB9dj8jdWpDgORinD1NalYtE9ALbjPk4AcMNKwai8qTg+GBHgW2UF?=
 =?us-ascii?Q?BdMouyvvyV7g2jHhnT4VSrJCZszpE7UkEQLDbZ3sr+tUzbSjkXfHv+UM09Hh?=
 =?us-ascii?Q?rXaA0Sg3Mzx8T7ENsSPoaEGpEcvcA6ko9BJJeekpjjGwgfdUTy68eHVK2mnh?=
 =?us-ascii?Q?Zu74cgHmYKc9PpV55RRF4Hyq6gAVVEyOx1f+/66WBXQE/r18BQF5s66dUU/E?=
 =?us-ascii?Q?+hQiuQCEA2pEg4eKTEunzUAOgXuvxim/+SNIMu87Axk1SlXRCOSGBdpT8qjS?=
 =?us-ascii?Q?UdnUEpOeoz1bY6zpkP57zCiObYO9IEu4YZo1woRgw5zkLtqBpqqguVcIwnvP?=
 =?us-ascii?Q?kXXGlkE0VPp2zG9WA03E2phvnHt/hQXrR8NQ4PkrcuvvPZvbQiBLU8HGLkYd?=
 =?us-ascii?Q?HRNwxsg2Qi7qv9ZscqBiB46AYt/WU0Cq8Ipug0Jn31k2CQ0Cm1nw1Dbv2gw3?=
 =?us-ascii?Q?y68gIFedtFTJRSQW/sy7wzYU/RnHtcCM8Rvljp3RYgxF27CVzfBRoU1BVRL6?=
 =?us-ascii?Q?8BKb5fG7VIRUPyRsE1usrQqkjvmrkF26cwYIZPZbGrdjGrlO99UiuwAPTZhV?=
 =?us-ascii?Q?ICBGRHWNgcGnsV1/i2/AoECv3YJx6u7a3hoYjowLf0wW9TsUNYgfDPHbIZa6?=
 =?us-ascii?Q?YLx5MjtjlnSWXAEVW/W4D4v5Rcd4JTRpWZcUXLld8iuXFRqCod8uoErnPTWn?=
 =?us-ascii?Q?0dgyKI5iuu/boPRM1paZFZuDuqW+bsfpDN5+HcB7J4xImvwO8M7t+BaXErsm?=
 =?us-ascii?Q?un4WgSKOWgBEjMleETMCSuK8/eBFif2Vo3ntRPtjVIO5bf6LWC3a5ZexMxuX?=
 =?us-ascii?Q?5I5laOcd7n0eejcwijCIpyEQQGpFdaNkdgHVSy0gJHHX3+AnGC3MU65mREi8?=
 =?us-ascii?Q?qg5c7P9J+7+CDRRlbMrVhDIyIyQs4SqjneHYUIimYaTMJjvPztIoSLJKcaAn?=
 =?us-ascii?Q?EC6l5RYQs0jzotzbYt4KREFiPx58lvXi8tN4psPphrQP16vWxxXGN+zK7jZ2?=
 =?us-ascii?Q?O/WuAcSNsWcTZZrOtkKq0di+XHn7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Am7KqqRFGvdZpcfto2vrWusjE8CM0aIz9fA4QYnI7XSgL5i7NXqxQLvBvQZi?=
 =?us-ascii?Q?NuDaz7B8aaqhNfEmwFopcRMyXy1S1hRx+CQYVIM9v1Ca8Xn/qMYhq7n3mGQB?=
 =?us-ascii?Q?bd6H98io/UeyRWYZw+s/oKF8LzzTquvy0jkH9y1hIJ1uHcOUM2y2jSgThPf7?=
 =?us-ascii?Q?31yIIO3MlFOMr3Wm61tz5tgZj0h4ROJo+vbJ5G0iY5PgDJlGIknoELTvROA8?=
 =?us-ascii?Q?+naxbpHLFfK1/yryoVQSBs1ijYcxxaYXQ6tRywDajRPF6Cqi6V7xMJI+jvnx?=
 =?us-ascii?Q?12B1LjJjBF/nkM88n2S7hUBQ4cdlyYoZkvlnom+DCRgAaSezMNIVfdfr2Sc+?=
 =?us-ascii?Q?GXCNcOqa1wQxLWsH4hZusqH2LXkD3D4sGfXNXsAhKFU4qETawcY69Yx3s4KS?=
 =?us-ascii?Q?XPEGUrKce13MNvQSiLIC7vz2yrA3km1imP7AoU70yi+3pOpUAxMmVSev06UG?=
 =?us-ascii?Q?QDJsSSESKS5DjQ1f5oKRF7zevBKeBjeW3maFp/tzD7VlkDVO0WSBgMcLlKPW?=
 =?us-ascii?Q?kJeTW8xSvWPy00fMIH5CR03hlk7xx2yjo4ptnN4f/vcNqX3GKC1TMfrxSdtJ?=
 =?us-ascii?Q?deUh2xZNY89HOfjAEwhSPNvMkmsDU6726Ji5tO+Vlq00ZJZj1M9m2a7syMti?=
 =?us-ascii?Q?orU1O3pTm/UUtvzhRfp7b/JFSyOhX7D+0s9IiZYo6zmRhXvm4Rp9UxsG9Uyd?=
 =?us-ascii?Q?xRgfXNNQ3276ppnbCKAjomE1QGuitHkAkOrtKKhK0OWfZ4nzXaeJKDllIET1?=
 =?us-ascii?Q?q5gFau8R7we3nW7L3rqpelxLbsT74FAqizRyxBkGMCpbmBgyUmNaR+PfULn/?=
 =?us-ascii?Q?vRKfgfvCT2gvUqcjlCrTefnV8+uxzt73kb90cCy5WseejGXkKBXwpwuqm8hj?=
 =?us-ascii?Q?owasmZP7/2nXBQR9yHMQzPSgBJ1iE3+3wipfjE7PPOkQtm0LEtw6sEWCMxpv?=
 =?us-ascii?Q?fulyUDf8wBNS4LhYilwmjYwPVOaWRCW73+X7h7LGUVB78BOqzGMTN9bsYITH?=
 =?us-ascii?Q?4BAPbwRI2fKhaIq4IzTczVXrR9GfuZ2zKZDtZXSx8cXtZd4LLCAo2GdXWRVN?=
 =?us-ascii?Q?6r9lZx7Ixi4AZ5QCexfaGr/YwsLy9+UilFJIjDRFf8ZMqUM+sA30L+eZS1XN?=
 =?us-ascii?Q?s7mOrArBKAiXwfefOMllAWsqK+qZIUBTX7KtzoEGyGT+QuSuZzyH7w3sB/it?=
 =?us-ascii?Q?BgZ8PMBT3UnZVcezueKuNamRy6y4VeN3dfpAOVUwh+mMpFvFskPmiON+W8Ji?=
 =?us-ascii?Q?pffi08CoDa4TPo8hx5V/uHi7bSQu8WUi9i6qSbYPAfg4OwU0RzpuTunMjq18?=
 =?us-ascii?Q?BTkBVJKfueJ5OjSM+YC16A6R4tcLlmuobJ6wA/VVBuyIcIv3rVWoxp0RMI2r?=
 =?us-ascii?Q?F/YzqiA+8rMxIfrKJDDhi7rQP3ROh0W9wzY6ay/6rc+q1KLLXcfFi3N+T9Bl?=
 =?us-ascii?Q?s4ZQaNFg5UdWEbCTTPDTS05b+ptSWI8U3I46nivSgzTACFoIkq2EX9U8DcgI?=
 =?us-ascii?Q?cPiottb8RKUJscOt/rXu4K0UApA48Qxs9l2GtWAED8JM5JlkjkMYGviN4t7h?=
 =?us-ascii?Q?U4F0zr7u2udcCCGL5Fp2RCQp9ZdXu0ORSfYMHOmJJTy0h6CyHQjXaz8WA1f0?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adcb746d-67a7-4bfc-7175-08dd37273a97
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 18:46:18.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQfVAGzejchbFXuTuRamFVQJQKzsGM9XjSK8Mtq14IE72IK9Jv+/vIyARMpOJnXjXZcbPwMdccAMvs/mcWqQ8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2025 at 10:21:53AM -0800, Belgaumkar, Vinay wrote:
> 
> On 1/17/2025 6:29 AM, Rodrigo Vivi wrote:
> > On Thu, Jan 16, 2025 at 03:51:03PM -0800, Belgaumkar, Vinay wrote:
> > > On 1/16/2025 2:57 PM, Rodrigo Vivi wrote:
> > > > On Fri, Jan 10, 2025 at 03:21:51PM -0800, Vinay Belgaumkar wrote:
> > > > > Default SLPC power profile is Base(0). Power Saving mode(1)
> > > > > has conservative up/down thresholds and is suitable for use with
> > > > > apps that typically need to be power efficient.
> > > > > 
> > > > > Selected power profile will be displayed in this format-
> > > > > 
> > > > > $ cat slpc_power_profile
> > > > > 
> > > > >     [base]    power_saving
> > > > > 
> > > > > $ echo power_saving > slpc_power_profile
> > > > > $ cat slpc_power_profile
> > > > > 
> > > > >     base    [power_saving]
> > > > > 
> > > > > v2: Disable waitboost in power saving profile and updated sysfs
> > > > > format and add some kernel doc for SLPC (Rodrigo)
> > > > > 
> > > > > Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 47 +++++++++++++++
> > > > >    drivers/gpu/drm/i915/gt/intel_rps.c           |  4 ++
> > > > >    .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |  5 ++
> > > > >    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 60 +++++++++++++++++++
> > > > >    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
> > > > >    .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 +
> > > > >    6 files changed, 120 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> > > > > index d7784650e4d9..83a7cc7dfbc8 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> > > > > @@ -464,6 +464,45 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
> > > > >    	return err ?: count;
> > > > >    }
> > > > > +static ssize_t slpc_power_profile_show(struct kobject *kobj,
> > > > > +				       struct kobj_attribute *attr,
> > > > > +				       char *buff)
> > > > > +{
> > > > > +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> > > > > +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> > > > > +
> > > > > +	switch (slpc->power_profile) {
> > > > > +	case SLPC_POWER_PROFILES_BASE:
> > > > > +		return sysfs_emit(buff, "[%s]    %s\n", "base", "power_saving");
> > > > > +	case SLPC_POWER_PROFILES_POWER_SAVING:
> > > > > +		return sysfs_emit(buff, "%s    [%s]\n", "base", "power_saving");
> > > > I had thought about something generic like kernel/power/main.c, but that is
> > > > indeed not needed since we do only have 2 options. This came out cleaner
> > > > than I though, although not generic...
> > > > 
> > > > > +	}
> > > > > +
> > > > > +	return sysfs_emit(buff, "%u\n", slpc->power_profile);
> > > > > +}
> > > > > +
> > > > > +static ssize_t slpc_power_profile_store(struct kobject *kobj,
> > > > > +					struct kobj_attribute *attr,
> > > > > +					const char *buff, size_t count)
> > > > > +{
> > > > > +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> > > > > +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> > > > > +	char power_saving[] = "power_saving";
> > > > > +	char base[] = "base";
> > > > > +	int err;
> > > > > +	u32 val;
> > > > > +
> > > > > +	if (!strncmp(buff, power_saving, sizeof(power_saving) - 1))
> > > > > +		val = SLPC_POWER_PROFILES_POWER_SAVING;
> > > > > +	else if (!strncmp(buff, base, sizeof(base) - 1))
> > > > > +		val = SLPC_POWER_PROFILES_BASE;
> > > > > +	else
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	err = intel_guc_slpc_set_power_profile(slpc, val);
> > > > > +	return err ?: count;
> > > > > +}
> > > > > +
> > > > >    struct intel_gt_bool_throttle_attr {
> > > > >    	struct attribute attr;
> > > > >    	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
> > > > > @@ -668,6 +707,7 @@ INTEL_GT_ATTR_RO(media_RP0_freq_mhz);
> > > > >    INTEL_GT_ATTR_RO(media_RPn_freq_mhz);
> > > > >    INTEL_GT_ATTR_RW(slpc_ignore_eff_freq);
> > > > > +INTEL_GT_ATTR_RW(slpc_power_profile);
> > > > >    static const struct attribute *media_perf_power_attrs[] = {
> > > > >    	&attr_media_freq_factor.attr,
> > > > > @@ -864,6 +904,13 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
> > > > >    			gt_warn(gt, "failed to create ignore_eff_freq sysfs (%pe)", ERR_PTR(ret));
> > > > >    	}
> > > > > +	if (intel_uc_uses_guc_slpc(&gt->uc)) {
> > > > > +		ret = sysfs_create_file(kobj, &attr_slpc_power_profile.attr);
> > > > > +		if (ret)
> > > > > +			gt_warn(gt, "failed to create slpc_power_profile sysfs (%pe)",
> > > > > +				    ERR_PTR(ret));
> > > > > +	}
> > > > > +
> > > > >    	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
> > > > >    		ret = sysfs_create_files(kobj, throttle_reason_attrs);
> > > > >    		if (ret)
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > > > index fa304ea088e4..2cfaedb04876 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > > > @@ -1025,6 +1025,10 @@ void intel_rps_boost(struct i915_request *rq)
> > > > >    		if (rps_uses_slpc(rps)) {
> > > > >    			slpc = rps_to_slpc(rps);
> > > > > +			/* Waitboost should not be done with power saving profile */
> > > > > +			if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
> > > > > +				return;
> > > > hmmm... I'm afraid this is not enough... Although I just noticed that we
> > > > still have a problem for the low context strategy.
> > > > 
> > > > Please notice the intel_display_rps_boost_after_vblank...
> > > boost_after_vblank() also ends up calling intel_rps_boost(), so it will skip
> > > correctly whenever the power saving profile is being used. The only extra
> > > thing is an additional work queue addition, I guess. We could avoid that.
> > hmm, that is better than I thought then... although it is probably good to
> > ensure we don't add an extra queue...
> > But also, shouldn't we ensure that the boost counter goes immediatelly to zero
> > and that we really immediatelly stop request the boost freq when we set this
> > mode? or that is too fast that we shouldn't bother?
> 
> There are 2 workqueues at play here - one from intel_display_rps_boost() and
> one where we place boost requests in a queue on the rps side. We check for
> slpc level criteria(power profile, current min etc.) as well as context
> level ones (low-latency), we could split the slpc level ones out into
> another function. It is better to keep all the context related ones in the
> same intel_rps_boost() function, I think.
> 
> I don't think we should set the boost counter to 0. That is per context, so
> could be needed for something that is in-flight.

Fair enough! Let's just add the doc then...

> 
> Thanks,
> 
> Vinay.
> 
> > 
> > > > So we probably need something like these:
> > > > https://github.com/rodrigovivi/linux/commit/42e24a146239a1b950ed047f619f334f5205ae8a
> > > > 
> > > > other than that I believe this is good, thanks for adding this
> > > > 
> > > > > +
> > > > >    			if (slpc->min_freq_softlimit >= slpc->boost_freq)
> > > > >    				return;
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > > > index c34674e797c6..6de87ae5669e 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > > > @@ -228,6 +228,11 @@ struct slpc_optimized_strategies {
> > > > >    #define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> > > > > +enum slpc_power_profiles {
> > > > > +	SLPC_POWER_PROFILES_BASE = 0x0,
> > > > > +	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
> > > > > +};
> > > > > +
> > > > >    /**
> > > > >     * DOC: SLPC H2G MESSAGE FORMAT
> > > > >     *
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > > > index 706fffca698b..bee78467d4a3 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > > > @@ -15,6 +15,29 @@
> > > > >    #include "gt/intel_gt_regs.h"
> > > > >    #include "gt/intel_rps.h"
> > > > > +/**
> > > > > + * DOC: SLPC - Dynamic Frequency management
> > > > > + *
> > > > > + * Single Loop Power Control is a GuC based algorithm which manages
> > > > > + * GT frequency based on how KMD initializes its parameters. SLPC is
> > > > > + * almost completely in control after initialization except for the
> > > > > + * waitboost scenario.
> > > > > + *
> > > > > + * KMD uses concept of waitboost to ramp frequency up to RP0 when
> > > > > + * there are pending submissions. The addition of power profiles adds
> > > > > + * another level of control to these mechanisms. When we choose the power
> > > > > + * saving profile, SLPC will use conservative thresholds to ramp frequency,
> > > > > + * thus saving power. KMD will disable waitboosts when this happens to aid
> > > > > + * further power savings. The user has some level of control through sysfs
> > > > > + * where min/max frequencies can be altered and the use of efficient freq
> > > > > + * can be modified as well.
> > > > > + *
> > > > > + * Another form of frequency control happens through per context hints.
> > > > > + * A context can be marked as low latency during creation. That will ensure
> > > > > + * that SLPC uses an aggressive frequency ramp when that context is active.
> > > > > + *
> > > > Thanks for adding the doc!
> > > > but now I'm missing the documentation of these new profile strategies in here...
> > > ok, will call it out specifically.
> > > 
> > > Thanks,
> > > 
> > > Vinay.
> > > 
> > > > > + */
> > > > > +
> > > > >    static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
> > > > >    {
> > > > >    	return container_of(slpc, struct intel_guc, slpc);
> > > > > @@ -265,6 +288,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
> > > > >    	slpc->num_boosts = 0;
> > > > >    	slpc->media_ratio_mode = SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL;
> > > > > +	slpc->power_profile = SLPC_POWER_PROFILES_BASE;
> > > > > +
> > > > >    	mutex_init(&slpc->lock);
> > > > >    	INIT_WORK(&slpc->boost_work, slpc_boost_work);
> > > > > @@ -567,6 +592,34 @@ int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
> > > > >    	return ret;
> > > > >    }
> > > > > +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val)
> > > > > +{
> > > > > +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> > > > > +	intel_wakeref_t wakeref;
> > > > > +	int ret = 0;
> > > > > +
> > > > > +	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	mutex_lock(&slpc->lock);
> > > > > +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> > > > > +
> > > > > +	ret = slpc_set_param(slpc,
> > > > > +			     SLPC_PARAM_POWER_PROFILE,
> > > > > +			     val);
> > > > > +	if (ret)
> > > > > +		guc_err(slpc_to_guc(slpc),
> > > > > +			"Failed to set power profile to %d: %pe\n",
> > > > > +			 val, ERR_PTR(ret));
> > > > > +	else
> > > > > +		slpc->power_profile = val;
> > > > > +
> > > > > +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> > > > > +	mutex_unlock(&slpc->lock);
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > >    void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
> > > > >    {
> > > > >    	u32 pm_intrmsk_mbz = 0;
> > > > > @@ -728,6 +781,13 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
> > > > >    	/* Enable SLPC Optimized Strategy for compute */
> > > > >    	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
> > > > > +	/* Set cached value of power_profile */
> > > > > +	ret = intel_guc_slpc_set_power_profile(slpc, slpc->power_profile);
> > > > > +	if (unlikely(ret)) {
> > > > > +		guc_probe_error(guc, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > >    	return 0;
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > > > index 1cb5fd44f05c..fc9f761b4372 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > > > @@ -46,5 +46,6 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
> > > > >    void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
> > > > >    int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
> > > > >    int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
> > > > > +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val);
> > > > >    #endif
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> > > > > index a88651331497..83673b10ac4e 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> > > > > @@ -33,6 +33,9 @@ struct intel_guc_slpc {
> > > > >    	u32 max_freq_softlimit;
> > > > >    	bool ignore_eff_freq;
> > > > > +	/* Base or power saving */
> > > > > +	u32 power_profile;
> > > > > +
> > > > >    	/* cached media ratio mode */
> > > > >    	u32 media_ratio_mode;
> > > > > -- 
> > > > > 2.38.1
> > > > > 
