Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3306A881973
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 23:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCD910FFA1;
	Wed, 20 Mar 2024 22:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8vS+tV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1786510FFA1;
 Wed, 20 Mar 2024 22:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710973523; x=1742509523;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/jDJcuIZH5OsRHFf/MVrcisSYkI0fVK9YLT7HCN8fCg=;
 b=d8vS+tV/tfQDMabffqWIMGJUQR3OqX+9j9EKIbi2UllKkjpZr1PvERgx
 ULPx77UWdW+/GiSFZfna6iAX9jTosEQQKwmmPfK0+UPuMYbGzlXRqKjSx
 VPGOH/pVAABR7jOOk0c3KZpGDVPuLeTPlzwIp5rM0/WlMvYZ6f1bRpoEc
 4QsieXD+WMZZOS0kCXKFHAIdl7o575cTmYIftBD+N1MnZUXvlrbqqopO1
 Y9gvzH3QR8Lb6PpbNZStQuPtMXitFRGh6yQfixFFRX4lZDw7w9kyFvztP
 XmLYLk/bY/QNTNJkOwe6nXhhcoe91CLJjv7KegN63UBBz2PSHPp+/bIT3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5870987"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5870987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 15:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="18988303"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 15:25:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 15:25:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 15:25:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 15:25:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 15:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liuvnS8B4o8sIWKde59sPxUgHw27Y9ef8nDyWHoKzG9t/GHjKdUYHD66sQfwVBxBNvqqutdoOsWp1CQE3F6nFEDOpXAcJa5Y+8UrhnrfDSH+HD3tUrZGopMokSUlEoBV7JP7AUCvjD3QX5UXZQ7RbaXI2fZ6fXNzV3Z3frQmmuk+HP4yZWjAY2JoncOFPtPggw4k3tmEhqG/EbqHdTTsP7vdujdEvV4IhFYGEsLvQBYCPegcCLrjfo2feunFHtgLc9vXZuw/WZGG5osRbLrvtKVTFSQ6mDlPsKIay0e9AAVYUuqexf7tHQyQkNnpK4xodv9WNLZZzWDa3Yj7txynxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jDJcuIZH5OsRHFf/MVrcisSYkI0fVK9YLT7HCN8fCg=;
 b=Otf6vqEtpwJZo5g8x13i+ja7hFLnNxQyy4HLbmKp+zYAdLP3h/kVFokQ0OZ0BrPSLYdbDsljfjt26xRvrg65L9Xt/YeLdRiqmTVIYYrSfC8T6z//dJ0v5WEV8E/jisdNxoxLwNxUoVnMrCGm1se9kF7fXxrl/DXBQfx7ZHsn3zBKeGbcqgHOy5Wv25WYNt2ldrkkKA8Yn7enROqStzNpuJCfq8NYpFoaZgL0O85+gIxOpRCCwenSHsykHoR6WOTKiejkqq+UrVUQj/JyZuMkO10nmUZ32PjnEFFqTO9dxKKMQvyFmjT3j+3ZPgnd5cJfi8cazIK+8RS9z3ePSJd8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 22:25:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 22:25:18 +0000
Date: Wed, 20 Mar 2024 17:25:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC 0/2] drm/xe: Support PCIe FLR
Message-ID: <dnlwghqkaduqivb5xjxrq6z4sktenlcxisaiwprwenvslqdlwm@eoe7cq6udssq>
References: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: bc638ca8-7367-4e71-33ef-08dc492c9f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: niGdNLwT18fHmgX0hlvAMvJF3hYHyAAhItNVfO+8RA9jrmhsnhT1FQyIQRgdbZUYBjbfvW1oXO4l4McIBKveQoP47eyCUtiwkSDecqBOglApPTN0EzV8mIbNnsMT9T89z+C9m8supRixgvZ52RYMMg1JZ8hxC5jcezPvtnB2i3r6jCa+I4alJpVAVTXp+tuxKV+xGwZXQeolQdNCUoxi28qK/d+9uu5m4Zm3/1C1EnfaH8MwXoU2p56HY4LVOpvTpX2qPk67oY8zIW7A0i7XcU/TAcaRIwSeiy755rX378oBBMakCI9W8/FE/t+V0/37BGkKEyd6Ydu8eSqjhQMQZqAtDDxLfoYtPCFwbYdn+kCyHfnW98gxB6wnxKnY7lrpbsQzcynW40KKMpSqUJG3v6BzMvv/f5KVYLy+QKeLFS9fWUM9FbHmarIu6SoSHXpyiOAMXba0xYKi6m0OOKOixGGiXy0izBkJevWt2+JGIHvN6ce99DzrU9SCSKmjTVmk783TNyS2qnFjNINhd9Fsgy+VuwJWOhyPZIbdkQesk1XLv5VfFlJOJSnp4oTfVHmNDFsW+LuYHIJ6kY5KYBKugAh0TiJ0SX5qrA3rCbtI0pircB7/XQksGQQUQO+DBXMLDbayVeo+9rYzcTGFL06il9qFLCPzkBsDIq+T3Zk3tWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mHYI2dVcwm98U7jcKMgnwCB2gbSvcK9zlYHLPCRbiaG/0W4pvZZ7hKIy4sPI?=
 =?us-ascii?Q?2umU+iCxWn6BSDA1gpANvVFjkQXeein+C73XQCVktlRy4MgHsgo5KGpfyyzL?=
 =?us-ascii?Q?BCuBpjRFW/esFwAhNMqZrnr8uhw1KIx9X9/5I7BS1CIQBsHUHsRcvDjDCgN0?=
 =?us-ascii?Q?YieI/E1dnBYEMbzGbqsYFf03cSZEw5UgF/3smX6ONAFobtaaF+KBLNdsED/j?=
 =?us-ascii?Q?Cc2HgAH3pOc8fHWgEULMOzJFSqyiT880XSEGTqVHmUtJEA9kisArXAssGWOc?=
 =?us-ascii?Q?pmCvjZ7+Wc9LR6xcGzF0LAeA5iHQPG5iG/N8mWx4PVdMMaR/g5/D0sA0aMlG?=
 =?us-ascii?Q?fZHJIWmv9uEPquYQkXTJOYBR+iCXGtJ+UzCpqst5mAWtR7YfIDq1Xz2RielX?=
 =?us-ascii?Q?6VZfm7JSkaSkzXmD1r0mx48xWgZxUPs4f6pKBm38Zs3nZ01gW+Y8XdznvZtt?=
 =?us-ascii?Q?n0wnK1UMfNCFawp461wIhDd37eo7OOrT6e/0hs3k98R+vex7GUBTtgAYYZ/y?=
 =?us-ascii?Q?KjLObAuHjFacVNB90cqBvvcyTArET8KD07cZkIjc6lcqNSopDDCQyJQBLDeW?=
 =?us-ascii?Q?Rp6A6aMcESlL8Kw/B4EgJjFZSeikradO7pIy+m69fz8+g9bgNZR316f1FmL4?=
 =?us-ascii?Q?k5tgWod+7VIsm2PD+n7EJ46koN+H0wHZ9HWG0BZi4mQi2ksnRtjutbAq2oHe?=
 =?us-ascii?Q?2OGd3RQoUMTeXJ3mKWlH8BHWotQaZbTvGr8bGfFUjtuzQwikBF/KK7dmoCB1?=
 =?us-ascii?Q?Zv27C1Qwi9Z6REmou5GgXRgvoFUQB+hTFTq/vgZsj/M5LnHmZRBNRA2JFihP?=
 =?us-ascii?Q?Pppu1nrdOvEk6gLsRxfYon/AjYL27sBvMr2MD8d8k1XQbIZ4MiWmObNORRsN?=
 =?us-ascii?Q?guzVDHfNXB2cfTZoGW44UrHRHIxNLgGt/7gq19os3RwiO47d+Z3bAOGOfcKZ?=
 =?us-ascii?Q?Wp0VRm1fMB8ii1pLXcQhWXJcloHKxpBESJUYyezej0oZd3q2ktonlGCOI1UI?=
 =?us-ascii?Q?dIjl3IwlYvpJbe93ggCniVquBuI3iCa4qDRjtSXwyGD3VFTRNeQixZqo5mdI?=
 =?us-ascii?Q?/3tKnMnm/e8jP+v08M46a0uBLbWkOokCMpmT1zHFNDTG4VOCWPU4vRObVBIZ?=
 =?us-ascii?Q?v4kcKg5WkXFtlBHdPYnOEKYPkFvlJJf3QnFNqstX4SM1mEYhxyOlR34f4M+k?=
 =?us-ascii?Q?xtRb2ge6SYNOdAL5cv88hoYlE0myLVGvEW6cEzfYZwYEzHkA0eoUTnED5aws?=
 =?us-ascii?Q?LdumA1KNLRKLJG9naZgK7+yX50LlNnPfV7Zr0Cd9lUjc7qSR15lsU9LcCdMp?=
 =?us-ascii?Q?47MahPZgPTHBtwm7t8iRJPi9i8F4oe9ZK4/+dc/BKy4x1DvsW4MWC3I0NlDb?=
 =?us-ascii?Q?cHurnro4big2/UveNC8oTZwCXtNzVUSLhsDaebWIfE/MgyPrYTs2XGfTa+GT?=
 =?us-ascii?Q?c8ADLzqEV+ixqX6y8+w8TU8TGzIgoMZzqFpVbnUGbj5ctFBJGTn+m3FHWB9S?=
 =?us-ascii?Q?z3cLenDfPSG11/hHPyltoIpFgqDAYOkyQjj2N1ThtyO5i0YxUM7UAokezaQU?=
 =?us-ascii?Q?RdXwp7jvsq11TBiRpncFjYvSZ4WpFHvo1pvuW9WGUExRgdNsM4LynOOz3w3u?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc638ca8-7367-4e71-33ef-08dc492c9f66
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 22:25:18.2598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxRVy6kCZo9XRmZ4/1taMFa1d06LB3DnNfdfdbAmJ3+6Y9frz38JkLNQ/QoTUy8PFdN8NFV9fZpDGNQ8bzY4MlHSBPyHtyMJQvGFS+lkObw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
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

On Wed, Mar 20, 2024 at 04:14:24PM +0530, Aravind Iddamsetty wrote:
>PCI subsystem provides callbacks to inform the driver about a request to
>do function level reset by user, initiated by writing to sysfs entry
>/sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
>without the need to do unbind and rebind as the driver needs to
>reinitialize the device afresh post FLR.
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>
>we get the below splat but the device has recovered, have executed an
>IGT post FLR.

ok, but that also means we we will need a few commits between patch 1
and 2 to get it in an acceptable state.

Lucas De Marchi
