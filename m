Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13AA231B7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAE010E37F;
	Thu, 30 Jan 2025 16:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hX3CDusK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3219D10E37F;
 Thu, 30 Jan 2025 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738254328; x=1769790328;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tDqAC+fE04xK0ZzKirrFz3V0BYLFlklGSWkXcGE7bBg=;
 b=hX3CDusK4Ado1NMZu/BMqiQAED5B3gZrwqx/6WfRzIo4TdCKLZgZFSjO
 4q1znoIhP27u3R9N0dSTw3roWAUcAiZb1jnlFmtcTCMdK7r6RwqXv2GZj
 a0zRE5g1pfaTijI1ZA2FCgS2eEVsts6oKF8D9U9VB8Zu5FoVcQDgMfmKd
 wjjaajb7gylEEc882cSbG+yuEjHmK1cPIA/9qA6V8YEd3G9yIbbWh6Id4
 r4bLYx2AYZQx+mSqd7ftk9uRS0o1KC25W5bFJIOk6TcMYbvfhXtF7lgPF
 xXfsM/brqTPNtZuDmuNWo3t9j9wmRxrMII0ADIqiLzapgyYY2vqmP9VHL g==;
X-CSE-ConnectionGUID: zJG1S/lwR6CcaaKub96Syg==
X-CSE-MsgGUID: ivRgdjRMR8ao+LCv3CEELw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="41641113"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="41641113"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 08:25:27 -0800
X-CSE-ConnectionGUID: fsANjlKIS7WfGbEo6X6M3Q==
X-CSE-MsgGUID: yFCwoaQuSx28WMuJKpiOXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113387623"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 08:25:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 08:25:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 08:25:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 08:25:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKYlanZtgjozgXnlP7+AKXnXjSfCkz+rDZQsqK3wO5Na25qfyypkXvHVOcLD4lKW7AZ0DqAfcNwZbz1pL/QP94anoX94HsoFc5huIBOnHKad/qwmXZxy/bLuvCUeutegQcaXXyEnvljf0ou3900wS+Rv7th0sisEwG2ZUEmVGzkYRJ3CjEg+NTieU7UrU+LBxHEkGu2nZ5N7RuLA6qvJZYo8LBji5q1JvH2mhtcjPMTtwyO2DN7bW678QCwvh0X127sSJue8yAS6NUO+VArcQHvvUn2Xamhvweh9DHkIfmwkVkza/3B/6f9kq5JvOBBf1re5SEe5rZ2baAY6D3+r1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5MDaJwpRF3qHipocoRteaV8filkuUXA3UdQzAruCWs=;
 b=yN1mloWoomjdAKJTFMxzOmB19tx9X5MlCLw7eMWJcHOaz+kjUIRIB/CYuw0XQg+7zQ65MEgPx8WNj6YoYnoG97j5+tuZ3BAkA/6roUY21jr7kmUTTx5YQ3d9/NrdaccfFtxOO3Crd6hIytpCstoGBNO7USpiQuaPzEZVief8GSQihp2lsoLQnYt9ajJp1+OLXK4p+Y9IfyT0CHMoCEl0S21MlCZe9BJpAJOPKUqNyuJTspjD+YQVp1h88Mi84Ku7L/Q0hS6KJfixrPgABaD6g/jY33xSIWzAR2D/T7Jm2/oYyHxeFF2ZkwJzut6tWNNjFZoZMa2a4n5E71XsBPW/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 16:25:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:25:24 +0000
Date: Thu, 30 Jan 2025 08:26:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 05/33] drm/xe/bo: Introduce xe_bo_put_async
Message-ID: <Z5uoLOcOCyiSf90I@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-6-matthew.brost@intel.com>
 <bab72822f953bb938efa37f6c3e4e59dbbfc39ac.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bab72822f953bb938efa37f6c3e4e59dbbfc39ac.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb374a4-b688-47b2-784a-08dd414ab2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?F2M1O81d6ptwfRifEWZo0raekMV6dPzLCTMCBO8SGfOrd0opl0RDPUUJeD?=
 =?iso-8859-1?Q?PQkRwevi7TCJail//ZJGas20cbNEvctDYs2yIMPb1Wf96/hMjbukg1b3XI?=
 =?iso-8859-1?Q?ySTaAqj9CiYQej21bccRD3dnaP/c7x6S1gRcJbBS+DDPgUdV7cOUAeBsH4?=
 =?iso-8859-1?Q?3bblaOjIVm29Jpz5gMzfZaKtmPe8gJYxji5VmOpV4vDYl0NnsIm6/OpHmp?=
 =?iso-8859-1?Q?K+IjGusWUT5eUcgP1PIPcW53QsgRTeNEysKQ2f5u7LmrnB7hb8TETxy2Hp?=
 =?iso-8859-1?Q?8iV0zNy5g32k+/d/yEaQycY+f1t7RkaeGZrF9DBEDw3ghBcqhgiDbB1tWB?=
 =?iso-8859-1?Q?EzZsuEKN5VvRiV1SI89VdrIL7gEr0h2phNnmktVj+6DYAEYJuTmvE+wUVX?=
 =?iso-8859-1?Q?mShtRf7hCrW2smO2hV4z4dszZ3TYPAcNLKfBv1RfdU7k9fr5L+VuAD+JRt?=
 =?iso-8859-1?Q?7QpgfP1Xtd7Hbr5pnPu74SEJznGyOqHT8OwFGIgq5YNtipjIqDhAk2O9iE?=
 =?iso-8859-1?Q?PJZN+AF1CiHL6Kkh/3MLjnvKGnVkGkJk4/35mokQYT3tFIhIh0FzX2GFpB?=
 =?iso-8859-1?Q?Dp99558P8z1cGCREqL2copsgh/v7RkgQhQ8DFbSUieUdVfyR9GMNpAx+3h?=
 =?iso-8859-1?Q?aLUFUVKglX960xdIsso8uFuDk1Zzt/MCP3+Dn4e7z+LsYJIi03nerJWENq?=
 =?iso-8859-1?Q?k/9vErsGmvNfTotGG6a50qgkV/ckUO7HmiBDjEi8pQvhKyUG/6CBbMBQn2?=
 =?iso-8859-1?Q?3gzxQUxvfy4F181g0wG6ZGD4rVjcxPeyEVNvJSR3/05HuRWYvcIazLXXNt?=
 =?iso-8859-1?Q?/Vp4LGgo6qQ+fEi/SLoRBcisAnfDgD+27giDmGnRwCd6V7z61CLaymrAVC?=
 =?iso-8859-1?Q?y/pz18P9UPMSM+ZJPr7rZNyGrsgFve8tjfhT7ws8BWndskct5XLIf48xYz?=
 =?iso-8859-1?Q?RqaPhh9wI6DvT9fifkUw9kS4GQkQKjSCLmr4XX3dfSu1z6JPauWY0wh6MD?=
 =?iso-8859-1?Q?npzOCpvRCaMXgrB8qMWbWFp+w2phxJnMGoFCbm1kDQ1+KHSHLn5WS6Dq8m?=
 =?iso-8859-1?Q?nhy52UmJ9m1v2Mi5z+cv/6ZxlgRFRlu6L/5bfFhaJw9x9wdQtIqVODyUM4?=
 =?iso-8859-1?Q?sDOpHdqB63P/pvQyRsRLEWPZ7DwQImvWd+O2hYPdQ8z09Zc3fSGdaTCNLI?=
 =?iso-8859-1?Q?DmdIfa1MIBA7dzwUY42aUqglLj8nKrpEeLlHdCLjv3MxIuEhQpg4mHv+rZ?=
 =?iso-8859-1?Q?3ROysoSWA9yw74ivM+6hOkvGhW3D9q5SAjkMH4KKEKYmySTnRXG2/7qOJR?=
 =?iso-8859-1?Q?dy7EXJrQOsqdfqDMEXvH9X2tEIMWD5I2JL3StdlRjoyGFkQGcRmcyuECIv?=
 =?iso-8859-1?Q?tUGrzyyE7OTda/YO+yy6oGYj7hV1nmqQPpOBH60Xw/hpJbksXY4YMPT+H8?=
 =?iso-8859-1?Q?NSMzRFcAYZB0cqlT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uFqeQJ6BCPjFHBjqayktonZEsawmlKpd7QrYpO9T8kqhVK8CUoUW0j9S1a?=
 =?iso-8859-1?Q?XX32k+hcOQ9aZywL1arXgnQgFtlNigzdXGS/4voDhYA1N501rO/J8OuB0M?=
 =?iso-8859-1?Q?aaTevJY0Q8s9M1bN/bgaHQHj19A6r0Qd4qJhPEtDBI22hBDNllYUonvN/V?=
 =?iso-8859-1?Q?4Skm+os61U5jcGrLKpy48uhQXhby0Ggjsc99QWSQRrYoMPjwcz/5y8oeID?=
 =?iso-8859-1?Q?cMop9ijUOHZdhWBoXappJbijAKWJ1KhKHl+yGR3S+ehTZO7x+L91LnyeHA?=
 =?iso-8859-1?Q?LvNWF2LbK7t4LvDoxoROL+/OYBVUmtaXz35qDHe/Sh1qnmbJS4TXoQXmOT?=
 =?iso-8859-1?Q?MBG7dy2lS92+rWB63awqQJJx7+OoEHni2Shup37TzS+wkDWHVgbSWecJqu?=
 =?iso-8859-1?Q?t0pcPt7reKQiGC2zKpjGdtDJW5jyG15OiQp4nU2qJISe2HSFpZ/IEa2el0?=
 =?iso-8859-1?Q?cdkOyKMFuBO9wPC98oPuDEROL/cLtKpcACVAQIunXsq0WeQAIeA7mWyQsS?=
 =?iso-8859-1?Q?WnD6DQnyIXIqRt7QZZjZGXpHjg9DxIoxXrkxjd34EiKdL1h7g07fVSkyj/?=
 =?iso-8859-1?Q?R9MnubluSBEZkoSkUSYF71xVRuDkPkJEWRC90f4s7+dL+86Vf3D2vjp0Yt?=
 =?iso-8859-1?Q?IyCzRMa1khgzYRJcOEoLcLFhM7d6rsSipj/sxMBNHUkwwLBXer7ODXASlg?=
 =?iso-8859-1?Q?LXWtZiFlqCSuUmL8yH6/hIKv7ARVMBt0BKedWUQKCDZpr7p1r+QieT6PlS?=
 =?iso-8859-1?Q?QWQm9y3wQi8HolLzIyBmOexwsJAYmPHco7vv7J6UUigdpr1tRvCVKwqB3v?=
 =?iso-8859-1?Q?I5Quo81TeUGVg9YVBi8L2diZTLB7uAr9nXjsQUNjNwGi67e1De0L9eM0Gk?=
 =?iso-8859-1?Q?VFd60ZyGf/bHB2xkilw0FHSOWpXUj39rm2htL66YJawX30/EBQwdQm6N+K?=
 =?iso-8859-1?Q?jWD6/9OyCpEvpbiT8Be+EUbQjyJ/c7LtG+YHQbKEkUC8VJ6rWH4O5eZn7o?=
 =?iso-8859-1?Q?BZVrtLOsV4CLNqFq+gq5qCNiHK1FIKxBh918YdU07tJ1C9GTG6AuDtaMW3?=
 =?iso-8859-1?Q?VpBjCA7cpcAcwW6JN2jwjfCVmlDHdJFu4yDFbGs8LjPqLBscX9+9NHizJ1?=
 =?iso-8859-1?Q?/IZ5IxIEtTGIcd6G0qxzxnMp/pGHdptptFueiH3kqNmNZb+1dZyDUsrKdC?=
 =?iso-8859-1?Q?TyI2m71dULqpiDbYNYC9HnTvroBhdjLYYqqKcbXfxFgUXri6Yw09AHByYW?=
 =?iso-8859-1?Q?2a8ibomfWGSTmLTNEfEPSBK8DiR86l8hIXMJITeYyn6ltJztFTidZwnHOO?=
 =?iso-8859-1?Q?cLqILwBBQchh/Lrxun1jg97RpIjSE1Xcc6+DXxzPM5tL247UeYSgXez/HK?=
 =?iso-8859-1?Q?9Ev10CkjwYYXVbV2rVsQOpWuvzS9E++FEDo2KEjmWtrg5yQzOCmQQXtn7S?=
 =?iso-8859-1?Q?pEz/6po9/nMEcEPMM7wfGFiXEqA12L4Jjm9UDOzF3SFktPlK7dZBW8rYjs?=
 =?iso-8859-1?Q?XHqYEerZso8g3qQWePosXMy8fIy/c6C8UwCruILgcD5BqPyeG5wLEi2WYE?=
 =?iso-8859-1?Q?+VWyetOp39s4px9Zl2Y+eyyZgQJ7b0E8QknrsfKrFZl0k3cY0i4hKxjg4m?=
 =?iso-8859-1?Q?hfPDe/rWwFI5QOj9ilXO320RyludTNvJ9bpSpGtyfhmv4ML7c4I6c7fQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb374a4-b688-47b2-784a-08dd414ab2ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:25:24.0769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jWasLjyPVQ/0muakU0izCCTC/3pg5fnHqtrJw9UQp6ScQHAHzayNrLHzLnXzh7+ojdcgZcPcN0J6G61ORnhWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
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

On Thu, Jan 30, 2025 at 09:49:54AM +0100, Thomas Hellström wrote:
> On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > Introduce xe_bo_put_async to put a bo where the context is such that
> > the bo destructor can't run due to lockdep problems or atomic
> > context.
> > 
> > If the put is the final put, freeing will be done from a work item.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c           | 25 +++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_bo.h           | 13 +++++++++++++
> >  drivers/gpu/drm/xe/xe_device.c       |  3 +++
> >  drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
> >  4 files changed, 49 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index fb1629d9d566..e914a60b8afc 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -2544,6 +2544,31 @@ void xe_bo_put_commit(struct llist_head
> > *deferred)
> >  		drm_gem_object_free(&bo->ttm.base.refcount);
> >  }
> >  
> > +static void xe_bo_dev_work_func(struct work_struct *work)
> > +{
> > +	struct xe_bo_dev *bo_dev = container_of(work,
> > typeof(*bo_dev), async_free);
> > +
> > +	xe_bo_put_commit(&bo_dev->async_list);
> > +}
> > +
> > +/**
> > + * xe_bo_dev_init() - Initialize BO dev to manage async BO freeing
> > + * @bo_dev: The BO dev structure
> > + */
> > +void xe_bo_dev_init(struct xe_bo_dev *bo_dev)
> > +{
> > +	INIT_WORK(&bo_dev->async_free, xe_bo_dev_work_func);
> > +}
> > +
> > +/**
> > + * xe_bo_dev_fini() - Finalize BO dev managing async BO freeing
> > + * @bo_dev: The BO dev structure
> > + */
> > +void xe_bo_dev_fini(struct xe_bo_dev *bo_dev)
> > +{
> > +	flush_work(&bo_dev->async_free);
> > +}
> > +
> >  void xe_bo_put(struct xe_bo *bo)
> >  {
> >  	struct xe_tile *tile;
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 04995c5ced32..ce55a2bb13f6 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -317,6 +317,19 @@ xe_bo_put_deferred(struct xe_bo *bo, struct
> > llist_head *deferred)
> >  
> >  void xe_bo_put_commit(struct llist_head *deferred);
> >  
> > +static inline void
> > +xe_bo_put_async(struct xe_bo *bo)
> 
> Needs kerneldoc. I will rebase my multi-device series on this one, Let
> me know if you'll add that or if I should do it when rebasing my multi-
> device series on this one.
> 

Yep. Added kernel for structures / exported functions but missed this
inline. I should be able to write something here.

Matt

> > +{
> > +	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
> > +
> > +	if (xe_bo_put_deferred(bo, &bo_device->async_list))
> > +		schedule_work(&bo_device->async_free);
> > +}
> > +
> > +void xe_bo_dev_init(struct xe_bo_dev *bo_device);
> > +
> > +void xe_bo_dev_fini(struct xe_bo_dev *bo_device);
> > +
> >  struct sg_table *xe_bo_sg(struct xe_bo *bo);
> >  
> >  /*
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index 8fedc72e9db4..5fac3d40cc8e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -387,6 +387,8 @@ static void xe_device_destroy(struct drm_device
> > *dev, void *dummy)
> >  {
> >  	struct xe_device *xe = to_xe_device(dev);
> >  
> > +	xe_bo_dev_fini(&xe->bo_device);
> > +
> >  	if (xe->preempt_fence_wq)
> >  		destroy_workqueue(xe->preempt_fence_wq);
> >  
> > @@ -424,6 +426,7 @@ struct xe_device *xe_device_create(struct pci_dev
> > *pdev,
> >  	if (WARN_ON(err))
> >  		goto err;
> >  
> > +	xe_bo_dev_init(&xe->bo_device);
> >  	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy,
> > NULL);
> >  	if (err)
> >  		goto err;
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 89f532b67bc4..71151532e28f 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -519,6 +519,14 @@ struct xe_device {
> >  		int mode;
> >  	} wedged;
> >  
> > +	/** @bo_device: Struct to control async free of BOs */
> > +	struct xe_bo_dev {
> > +		/** @async_free: Free worker */
> > +		struct work_struct async_free;
> > +		/** @async_list: List of BOs to be freed */
> > +		struct llist_head async_list;
> > +	} bo_device;
> > +
> >  	/** @pmu: performance monitoring unit */
> >  	struct xe_pmu pmu;
> >  
> 
