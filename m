Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB991C2F5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 17:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31C010EC6A;
	Fri, 28 Jun 2024 15:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dE3lB3mX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4489F10E299;
 Fri, 28 Jun 2024 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719589958; x=1751125958;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=P2suzYKDC5Yin+QS8OZ2On34Eqcb0Fcui/gTlaruPPg=;
 b=dE3lB3mX0ZSkTD80Zy9iTCJy4mfJ/nAWmbcP9/CMarC3kix8ooKc1JHh
 t97Em99kLSnZ2N/Sq2qEhT1FaTn6qOs/H93NdEkTKeHirydQuMVQW0pfx
 vw/zbv3JvdZoLkRzgCi5N0fRliBoYCOBQmHic3D+FFgDiqpNcm0QlR/mu
 jeuhtc6HRFw/TyCRmFP9W+F3JZzuE2zJP1R7A3NLb3OFDCrrAc9XX2sph
 ygFb8p8iEB7E8W31/jH5K8WgaoDhGYfl6i6yPgE5lxcG27Y6nBWqEezZE
 BcOd1EYBEzDY6wFCZoJC7Xo4aGq+Rjv9KLfTcouUrDKytqwtk6m/R07QG A==;
X-CSE-ConnectionGUID: 9yR9ZcKLSd+JQhI+6y1bCQ==
X-CSE-MsgGUID: wPX1DY3WTO2iKIFnByL6Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27368808"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="27368808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 08:52:38 -0700
X-CSE-ConnectionGUID: pvSGM2BtSZaxx81aQS73SQ==
X-CSE-MsgGUID: hezwBBTJTO64EYyxUvbMgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="49390608"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 08:52:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 08:52:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 08:52:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 08:52:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRXeST52GO1S4GlaYYcXUxnvtgjY3JTj94lwXuAAtsO0OxgC0nM6e4scLiTARYX0YDAUBX3hSIo/i4miQrEsbjRBB2+1NwoTOATB0D1Y0Dsado8me5ZQinI8OWp1ayKQ/UQum52bA8Ub5ost/Vv1Geo9EPWRnSk5iaiQKmB1u9Kgf66yn0Zea3tfAWeNL2J89PrScopQG1rgH143OMyourIU+PrjQwT+U8tfPXg4MM07MCvAecuhnlNfrX/d7/EwYjRw1cF2DY09qI9qkJz5i0WWDDeU/reR7/W0/PpJ+HcMqKSS3M/dcOXFLYTyOMTDGO3dF2X8c7DlowVk2egb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfzZGPGlBII9KurNK42o8Kv/nTid/RoqgPLhB/WYv/c=;
 b=b3I10jWMCQ3LOm4bQcNed4jAPz4sSUGETpO4ZcRP7rkFZcueaibU/a91Baa8pFWxmJHpCeD2i5IZkUXnZNLS/fRiwd+U9wwTf+mDh0Y4CYUDIZkf2CET5+RescaslGuG7aLQpPxH0N9Wz547PHF4vetVFcbnNOM1ZPXoxJWZGmMnWve6kCWyxZhyrjTksHi4WIpjPZ8NoXEpaYKnF3mELBgE+8nMluLbfc/umkUnhx8UBI81f2gZmYsaKYSGQXt4M+rOdeN60m+enfiIEg8pjnDz4g9ubyH3qG1iQ7DzvmdDXRr0JADNfyJGf6di7WOCeHeyl7HeSsEe4MU6mWmjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 15:52:21 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 15:52:21 +0000
Date: Fri, 28 Jun 2024 15:51:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/ttm: Always take the bo delayed cleanup path for
 imported bos
Message-ID: <Zn7cBbi/iZ1cxWPb@DUT025-TGLU.fm.intel.com>
References: <20240628153848.4989-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628153848.4989-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0172.namprd05.prod.outlook.com
 (2603:10b6:a03:339::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfc1df1-1245-46ea-0e9e-08dc978a4ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ds2/v3yO9qtDwcyv33wX1tivAs78VOhmdGIsXSGr7W9VpK0NmFzaJIoFkD?=
 =?iso-8859-1?Q?EyHs1tH9a2BWHFv9+pyHtMZtUKT0qqyU16RjZsW4Tvn10bqwlAFvyspxtf?=
 =?iso-8859-1?Q?wQVcjvUqJRf52QnS5o8HpcYlBVBAyozJJ7WGGEl46Nd1dk7k+9XVJ9JpKR?=
 =?iso-8859-1?Q?FzEcB9/rvQgu6yK+oJlcvu5yCxsh0h5A6wGKgnrXPBGsRCHhrThBRJECov?=
 =?iso-8859-1?Q?CG/6txON48bgsAq7Ai/4Z0K6F7ikP4BJaMOUT5Q2va3lT8us7w5jkofIjr?=
 =?iso-8859-1?Q?UjGj13pVucd/QVg5hA5QXGpdxCNQF6heKO3NYGVYmWKTutJimcbTx0YiDw?=
 =?iso-8859-1?Q?Kazr7Hl4QH9Vtjx1c5zl+NS/jGlbOVZJBJQO9IsPLF6stjnn3Tz7jzGpe9?=
 =?iso-8859-1?Q?ZgPQKIwESnHXfuFEvIZvppHB6IArRv7HAK9i8AFHfiVRMYR+kN3/6Y2nzr?=
 =?iso-8859-1?Q?XzGzFe35dvxUGTr3irASfF6229/yPGPaCOkwqDGcdIZ/IGPeSgpTy4jGCt?=
 =?iso-8859-1?Q?IWKdKVCf2qxhGXDfu3n9lEWy1ei1j6XN5RfBmSl9QJR+AEyV/l1LASgqfM?=
 =?iso-8859-1?Q?+plUv7/1EpwKruhomtn0AaDvpyGE1vMg0KZC9d8qiWw15m+NqtycfI2D+b?=
 =?iso-8859-1?Q?U89Dc7CfyXrkl750l3zIk2ibh6tMBquu8FvddIr4T7uoCVbCM4cCJrvQyf?=
 =?iso-8859-1?Q?ohQXzfLTx+nu2buagy/K0WxcOP3s75rPYwAli3wf0qW2gtRtuOmY+/EGsG?=
 =?iso-8859-1?Q?xFGkKt97hE0plpJswz0QnHezYOfkXZMTbDeyKB+vNweWa+ie/4aheFKDGy?=
 =?iso-8859-1?Q?TIp0PDu5LOMaF+hkDgIzrcN2pwq1TuCZr9xSVP4fX8MxWfUfFssEhkrEMq?=
 =?iso-8859-1?Q?8HzNah2GQn3pvGP5u6diBCduDjtqWGIP5KS5l7D4NOIGNaFSgLTePOMT8h?=
 =?iso-8859-1?Q?ZLyrKQ9ybeYQrLqzHPbw9KQU/e1K+J1VTGxETE+/V9jPUZKwmhQRBYgPoJ?=
 =?iso-8859-1?Q?9/DDUiRqfa6Pfp5uOFBooQMELwUvf6iRV28i8PU5T5YSoHPCK8v5FVmJJg?=
 =?iso-8859-1?Q?BmiFgb2gUXJcq+6SxX4LbL7Oc7o8LDaHj5qgfp1FLC2/IbRdzp9OKbtpY9?=
 =?iso-8859-1?Q?h9j4Df49F+/R+5kH9fmZA9oONClMXp8Is+yR5vTkrTsX8aZ8MVv6YvBuU+?=
 =?iso-8859-1?Q?OLf/WdcZtpV74KpKxqvkCf7ItEYxImsUWtOSido9IFPrf8OOIIkMbM7Sdl?=
 =?iso-8859-1?Q?53OMYC/FfYjym63cQNITr9izKPcVC2cSV4S5FQMcpKz8ZS4pYhAjCjVnYQ?=
 =?iso-8859-1?Q?apC6vxEPAlxz2+W09vUKKM6jujx9GEURAr4sjiOwZrIAiimaBBPRzez3tT?=
 =?iso-8859-1?Q?DM/WeF/y3ZuOp0Dl5504Z+1Af/qLnrPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aYauU4KNCoINmPIrfwCshA4t6qxwRqC3IWFPIBSY8P3XwaLYBzUE81FlG+?=
 =?iso-8859-1?Q?RX4jeBsNpAeLamRVVJlf1egMBwkO0ff/xLd95bpiLVrmtrhE0MZAKMsmO+?=
 =?iso-8859-1?Q?6i1IcgEcsaiWDwi5D/t4GPOIOdNqEu0EizZtyB8YQxJ72dA/9hybah9xOy?=
 =?iso-8859-1?Q?AAV7gW7KZ8VA5iYm8XJXmZj5R7+EFtaOT78tCsec0tFv6mAAo3QFYd+8ny?=
 =?iso-8859-1?Q?4EGGOrvWexHOqc2ng50NvZDb8s6/++c78D70dcK9lwfzdoONqmNkxMMUk3?=
 =?iso-8859-1?Q?dXnNlP2qn4DoBjintA/jsN+WJNbt1wYRoBSJXqGq9YQkFjcWG6Ijo/rrpg?=
 =?iso-8859-1?Q?b1wvJy+XlR5ZDZ0etroERWZPCGUFaxZyjc1ZMvVFU2a0w3GNUEQlN6MNSM?=
 =?iso-8859-1?Q?gQxX+qgrW/Bv2nkPUwupMEGo/jEzjBlryd9c0Kowfa0dTWRGs2MEgrV40e?=
 =?iso-8859-1?Q?MsiR2I/65+j2KxcMMSxmREdrtYSe2vAPApJpanRSFMkY1xUwCWU0q0qECb?=
 =?iso-8859-1?Q?Lf2zoXjgRFG3eqtMWp6d5AsNYj14/QrMHako6oktA0uGSa9Qmkjq/xCevU?=
 =?iso-8859-1?Q?DXm2BPEgUxdDkO581OMwQRaGLhyU+FueRjYbdI+I5FUVeeqHdcOrZmlTBF?=
 =?iso-8859-1?Q?tqB+T47lGymLHwS/pgKu8H4Ih9XRzVH40GjmGBFy5E+alIcWnYnkLv0u4h?=
 =?iso-8859-1?Q?aGD/D5MHfcDVcBWA3vwj/S/GxEAakaDxPiUBjnfjbhT8CemcqImpbmR95G?=
 =?iso-8859-1?Q?pjX4dQeNkkA8rZGwx3KClUJSs3sFHR1KxHWTLR1PVtVEfP0JVmxnPnBDuI?=
 =?iso-8859-1?Q?VvufAChFmQ7VLMI4bR/JOZU65Y/IKWmGCv3VeVrUP8uB5jhMcyvhFWjbqS?=
 =?iso-8859-1?Q?aZnjv0P+nmJLncX/7/+A2iVPUCuG5jbjXl1WGzRKkA6OEqQ04+E6NLWfe3?=
 =?iso-8859-1?Q?m7E5a2X9HwHBVrajjdD7BppCH0Mxc9CpaR1h6KCvjLs1ksnEhYl5s/6vv+?=
 =?iso-8859-1?Q?CROCzF14ZyECZgM4bsQaQpwchCwm++icbqdcuNzNL5H0TrOkg37LjnflyG?=
 =?iso-8859-1?Q?ZRUUUuIQqQVlJbYv5YLeh0ZaJSg2QOHHFYmRMfAwvfNGdKCXuy++2qVSQl?=
 =?iso-8859-1?Q?ogVpsemqhtszTnOFwRFQ2cPY3xHV+SGTgddFlz1PugY7vM9Fv52R17uZ4G?=
 =?iso-8859-1?Q?d6flNap8LSMnJEVgS3EYDfSdUpiRjFpmSeaXAO2pXv2oYj3UQ35kYTwD/d?=
 =?iso-8859-1?Q?n0gVbbnwQcU8WaSgTZVrMWqqiL/bavkW68r9c0lHUPCXL77OnbQCKMceX5?=
 =?iso-8859-1?Q?r4GiVGwGS1oI16HERPSEln/UKWR9ef+K15kU/OxvCLOx6e7dOLUZSgFe1H?=
 =?iso-8859-1?Q?i70U1ycj280L44MZpmAMxkDgEyFzqLon4f1L4d2cXB4U9Vai+yhWGUan8m?=
 =?iso-8859-1?Q?brJucFGE4/W/HscIWVALCCrUlyWDTfC41WghFenV+ysXgUfwFHICTA3B3E?=
 =?iso-8859-1?Q?1udijWNZEPrMI+U+da2uybS2DJMWVoqnCIQlgeWNZotfOlDbZtdEg9Z1Kg?=
 =?iso-8859-1?Q?TzdqZvMNftoGETba23MAs4TDDcWej3tUxjsJH6dEnfgMLk7RnFFFu5OCyr?=
 =?iso-8859-1?Q?PDdVhs9vwcY/WXl+SLZ8SzBGwyyQoU53R1Le8hy884x9JLObzO+wjP2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfc1df1-1245-46ea-0e9e-08dc978a4ba2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 15:52:21.0814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCkR8D9QLCKIL6pLAR8Z9rFbP8AWAHGc3qflrNeMFF55Au+NIKypf9KkBZB/LlZKfbLRNSURZDbj9JRtwqVbDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
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

On Fri, Jun 28, 2024 at 05:38:48PM +0200, Thomas Hellström wrote:
> Bos can be put with multiple unrelated dma-resv locks held. But
> imported bos attempt to grab the bo dma-resv during dma-buf detach
> that typically happens during cleanup. That leads to lockde splats
> similar to the below and a potential ABBA deadlock.
> 
> Fix this by always taking the delayed workqueue cleanup path for
> imported bos.
> 
> Requesting stable fixes from when the Xe driver was introduced,
> since its usage of drm_exec and wide vm dma_resvs appear to be
> the first reliable trigger of this.
> 
> [22982.116427] ============================================
> [22982.116428] WARNING: possible recursive locking detected
> [22982.116429] 6.10.0-rc2+ #10 Tainted: G     U  W
> [22982.116430] --------------------------------------------
> [22982.116430] glxgears:sh0/5785 is trying to acquire lock:
> [22982.116431] ffff8c2bafa539a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: dma_buf_detach+0x3b/0xf0
> [22982.116438]
>                but task is already holding lock:
> [22982.116438] ffff8c2d9aba6da8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
> [22982.116442]
>                other info that might help us debug this:
> [22982.116442]  Possible unsafe locking scenario:
> 
> [22982.116443]        CPU0
> [22982.116444]        ----
> [22982.116444]   lock(reservation_ww_class_mutex);
> [22982.116445]   lock(reservation_ww_class_mutex);
> [22982.116447]
>                 *** DEADLOCK ***
> 
> [22982.116447]  May be due to missing lock nesting notation
> 
> [22982.116448] 5 locks held by glxgears:sh0/5785:
> [22982.116449]  #0: ffff8c2d9aba58c8 (&xef->vm.lock){+.+.}-{3:3}, at: xe_file_close+0xde/0x1c0 [xe]
> [22982.116507]  #1: ffff8c2e28cc8480 (&vm->lock){++++}-{3:3}, at: xe_vm_close_and_put+0x161/0x9b0 [xe]
> [22982.116578]  #2: ffff8c2e31982970 (&val->lock){.+.+}-{3:3}, at: xe_validation_ctx_init+0x6d/0x70 [xe]
> [22982.116647]  #3: ffffacdc469478a8 (reservation_ww_class_acquire){+.+.}-{0:0}, at: xe_vma_destroy_unlocked+0x7f/0xe0 [xe]
> [22982.116716]  #4: ffff8c2d9aba6da8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
> [22982.116719]
>                stack backtrace:
> [22982.116720] CPU: 8 PID: 5785 Comm: glxgears:sh0 Tainted: G     U  W          6.10.0-rc2+ #10
> [22982.116721] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 2001 02/01/2023
> [22982.116723] Call Trace:
> [22982.116724]  <TASK>
> [22982.116725]  dump_stack_lvl+0x77/0xb0
> [22982.116727]  __lock_acquire+0x1232/0x2160
> [22982.116730]  lock_acquire+0xcb/0x2d0
> [22982.116732]  ? dma_buf_detach+0x3b/0xf0
> [22982.116734]  ? __lock_acquire+0x417/0x2160
> [22982.116736]  __ww_mutex_lock.constprop.0+0xd0/0x13b0
> [22982.116738]  ? dma_buf_detach+0x3b/0xf0
> [22982.116741]  ? dma_buf_detach+0x3b/0xf0
> [22982.116743]  ? ww_mutex_lock+0x2b/0x90
> [22982.116745]  ww_mutex_lock+0x2b/0x90
> [22982.116747]  dma_buf_detach+0x3b/0xf0
> [22982.116749]  drm_prime_gem_destroy+0x2f/0x40 [drm]
> [22982.116775]  xe_ttm_bo_destroy+0x32/0x220 [xe]
> [22982.116818]  ? __mutex_unlock_slowpath+0x3a/0x290
> [22982.116821]  drm_exec_unlock_all+0xa1/0xd0 [drm_exec]
> [22982.116823]  drm_exec_fini+0x12/0xb0 [drm_exec]
> [22982.116824]  xe_validation_ctx_fini+0x15/0x40 [xe]
> [22982.116892]  xe_vma_destroy_unlocked+0xb1/0xe0 [xe]
> [22982.116959]  xe_vm_close_and_put+0x41a/0x9b0 [xe]
> [22982.117025]  ? xa_find+0xe3/0x1e0
> [22982.117028]  xe_file_close+0x10a/0x1c0 [xe]
> [22982.117074]  drm_file_free+0x22a/0x280 [drm]
> [22982.117099]  drm_release_noglobal+0x22/0x70 [drm]
> [22982.117119]  __fput+0xf1/0x2d0
> [22982.117122]  task_work_run+0x59/0x90
> [22982.117125]  do_exit+0x330/0xb40
> [22982.117127]  do_group_exit+0x36/0xa0
> [22982.117129]  get_signal+0xbd2/0xbe0
> [22982.117131]  arch_do_signal_or_restart+0x3e/0x240
> [22982.117134]  syscall_exit_to_user_mode+0x1e7/0x290
> [22982.117137]  do_syscall_64+0xa1/0x180
> [22982.117139]  ? lock_acquire+0xcb/0x2d0
> [22982.117140]  ? __set_task_comm+0x28/0x1e0
> [22982.117141]  ? find_held_lock+0x2b/0x80
> [22982.117144]  ? __set_task_comm+0xe1/0x1e0
> [22982.117145]  ? lock_release+0xca/0x290
> [22982.117147]  ? __do_sys_prctl+0x245/0xab0
> [22982.117149]  ? lockdep_hardirqs_on_prepare+0xde/0x190
> [22982.117150]  ? syscall_exit_to_user_mode+0xb0/0x290
> [22982.117152]  ? do_syscall_64+0xa1/0x180
> [22982.117154]  ? __lock_acquire+0x417/0x2160
> [22982.117155]  ? reacquire_held_locks+0xd1/0x1f0
> [22982.117156]  ? do_user_addr_fault+0x30c/0x790
> [22982.117158]  ? lock_acquire+0xcb/0x2d0
> [22982.117160]  ? find_held_lock+0x2b/0x80
> [22982.117162]  ? do_user_addr_fault+0x357/0x790
> [22982.117163]  ? lock_release+0xca/0x290
> [22982.117164]  ? do_user_addr_fault+0x361/0x790
> [22982.117166]  ? trace_hardirqs_off+0x4b/0xc0
> [22982.117168]  ? clear_bhb_loop+0x45/0xa0
> [22982.117170]  ? clear_bhb_loop+0x45/0xa0
> [22982.117172]  ? clear_bhb_loop+0x45/0xa0
> [22982.117174]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [22982.117176] RIP: 0033:0x7f943d267169
> [22982.117192] Code: Unable to access opcode bytes at 0x7f943d26713f.
> [22982.117193] RSP: 002b:00007f9430bffc80 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
> [22982.117195] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX: 00007f943d267169
> [22982.117196] RDX: 0000000000000000 RSI: 0000000000000189 RDI: 00005622f89579d0
> [22982.117197] RBP: 00007f9430bffcb0 R08: 0000000000000000 R09: 00000000ffffffff
> [22982.117198] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> [22982.117199] R13: 0000000000000000 R14: 0000000000000000 R15: 00005622f89579d0
> [22982.117202]  </TASK>
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.8+

Patch and explaination makes sense to me.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 6396dece0db1..2427be8bc97f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -346,6 +346,7 @@ static void ttm_bo_release(struct kref *kref)
>  		if (!dma_resv_test_signaled(bo->base.resv,
>  					    DMA_RESV_USAGE_BOOKKEEP) ||
>  		    (want_init_on_free() && (bo->ttm != NULL)) ||
> +		    bo->type == ttm_bo_type_sg ||
>  		    !dma_resv_trylock(bo->base.resv)) {
>  			/* The BO is not idle, resurrect it for delayed destroy */
>  			ttm_bo_flush_all_fences(bo);
> -- 
> 2.44.0
> 
