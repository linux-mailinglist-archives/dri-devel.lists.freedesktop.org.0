Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E34879FC6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 00:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196C310EBB0;
	Tue, 12 Mar 2024 23:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c03SPzXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A323710E71B;
 Tue, 12 Mar 2024 23:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710287286; x=1741823286;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/o/w5CRfCMSeTdmChQk0P4aUW4D/zhqStLzAB58uNoU=;
 b=c03SPzXgPzOMl83JaLTUqpNtvmVB3WIwXbmlQ+qHOpc0g44V606CQNZe
 IjvxAZn8qqtylAGIqfzywtFyda0Zlo3Mogrty4KBFGwkdBzvQ6coE25HK
 rKw987XKmVp+WcStmDesz2M+UiYJzq/lOwRVRTuVjt2WmXyrZflXrMUE4
 Dt2Mg+Gd+diP5rIbu7UxlDUudAMucEt5wRcLjKZIkUIeV7bSSny9FAXhf
 Pj7DeeefcX7VpjFP+IjoYMZY+8+XaMvsvvpx3CfhdsxF1Ki9nYS/7Zh8E
 Ni3LYBPdpvbneIxUV1tI/vnb/9vdadqJKa4XNdNAfkZt8GIoLDjmya/Qt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5151131"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5151131"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 16:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11754328"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 16:48:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 16:48:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 16:48:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 16:48:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 16:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIwoVKClMmnVbYgWyYV258V6l03VEdZjMO/JXTiGLZhkTMXRJUzzPRU7i9fl/iYT9MmUxr17N5IsIaGZfO/4ljlrDcqPzScufXLE+pGx50md1PhrPathxhSYv2EBkpmown31PCkx+9aernJekcIOGwV8DI+XmMe/A63/4Zyl4vDjI2bkwqnbxGnGnHc2CO32Dm6bqLcGZGrUEhYpMVJ3DIZXqA+P5c7TK8s23091oJwFguD96mQDZMQGvIjOLHjf+5+le/2wOV6o3ALsQJrYUpiYXESMdjTth7yWm/YoO3qDVEG1C3cpC2Adk3Q+01/0bW26+swEwMLNPjFeq8JVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mym/wCiGfL8CI0ktn4LtPmbVxYq6gIpNo7Tc1GrRmQc=;
 b=O8Aj+j8aJ1TE6fMZe19lWtiubLO/ZUUv5XonR+QeYa+OE/CAvsDn0fswqK6I2Vb8rHGusKk4mEkzj55+rnCUOze98qMtagfZ4aNsmYvrl28W4WkmTHfSaLhOLlPpCR7WjbicNgh9iRx9ye8t4+DienkrQlNLSL6HteKmptm2S/MplWh03uBlM4CG63EOji8ctYcWmvyPXLqGSx5BbFVSuP518KQFVOqBdW/ay6UpStCsuwuJ4hE6WQrCO3KaIzD9DaW6CiYpuW+eod8hFHuzRr1M9+QHxMjkEHcm5rQ6VMIkCM9TVOBdhrwkIukiYHc+ph7OsgtIDTzHfJ5gYhGvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 23:48:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Tue, 12 Mar 2024
 23:48:02 +0000
Date: Tue, 12 Mar 2024 18:47:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>, Michal Mrozek
 <michal.mrozek@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/5] drm/i915: Drop WA 16015675438
Message-ID: <mgydv3afrxdraulzba2e3q27uyvm5qnhhvv2wddjbw4gcgqlck@2on6hfp7n2b6>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
 <20240306193643.1897026-2-lucas.demarchi@intel.com>
 <20240312225409.GM718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240312225409.GM718896@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 2173a816-5bc9-427d-ab58-08dc42eedae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3gY6gMl/8Q65lSDRb1JwPg1TywfgtXjZQzOAsHOBOdxWq+shoPRKCd5IGVLw724JwzRsJw7kCb2LS7m4zHKsMjPC9UDe1Wz0BXBL3B9SG7mn8Lcmn/n1k8DL0Va90dCEzJYnY82V+ZfzqSF4JpPHtU2m4fUvY+e4I3ECKw1y0QFVua+HgOA6VuZNxrZTPl5yQqgZWJmE7U8sZBkMcRdcIcGKr0XjzAQVu1Kp+QJRwOslyUZpDWQK6Mo6LQInIbsb4maxBLjOzbk4OCAoq5vwDh1WZh4KVxKY50lBJ4uQXwZqoWS36EkkxYPFCKkazpiF+bTvbL6g1FSn0oLY6Up3on7fBB+WkrMsgJCG5FNo6n5jyreIymftcx2s6c2weF0pPLKT/t4dNltBoJzJnDwGXQR026VGJVKmioZNy8ncsOaK8asrvScIiUcQUiKCRk/86djuApSs4dfMcdi+a3pStyunIeEUqfckUbkDFjPBT4MQC0lxYuu6Tvp1yiL1x45ZdX8zbF+WR5XZQkh6Wn5ff9jo+fLf3jh1W0yP1YJNFTImnnby7mh+HaONkskTKuWTqwr0Gr1oc2UpKAK0revu65beXPlb0Uti+q1kImdWbOpVgaMKUY5X6V1ksD7jMal3REUQkBkbabPUl+rZEZeA30/Rwa9FlTaxo0zAUxtaOrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0j6w100765IipgTEEw5Z7Au34axt0gtqx2IQA+DkGStNfn6Hj5S82vaS2ifS?=
 =?us-ascii?Q?igXY8KQ9vv4R+Xh4Fv/FdBzcGMaqCLgjwsvxtOxbF5sRo+GeTnuqVabcBRMy?=
 =?us-ascii?Q?0Q4x0vRN2yxFKlSt3gk/KPHVm9vHuQU1MKPZpLrDnTQlw0zxbxyzs7rgEj8e?=
 =?us-ascii?Q?CVnYYzbrzC3UIWMQ0XH0tkUDsm1oW5v9GyA7gytapDbqwa0XsJOAYDF0VHJf?=
 =?us-ascii?Q?sfIGfVfbfF69tGAV25/JfzrcYSZ3gq7KgLFj/7QxX/rWFHE4wp6doE0pWzg5?=
 =?us-ascii?Q?0WzZ/AjsVAMwLgKdKf35gQifxGdW0lbkq4831s3e0UzvZ5o6zsAK52rDiw2p?=
 =?us-ascii?Q?3A72Ayg/RjECmQFaA6I3coNF7tuTAE5vQS7HBiDCT7GxXCuoQ3a3/Ez1u7UC?=
 =?us-ascii?Q?boHKlqnTvTZU5oRQnN5gCxOZRB64mAlRYq3GfwBEOHxUmyNXI+A3bq7eAIDN?=
 =?us-ascii?Q?nAfXRauik00P1+aFC8vzk11P71v60xASGTrRfeL+ekS+V+EcTmxlzdu+Grc1?=
 =?us-ascii?Q?prDWDJTkD1Urqp6wY8SrtAGVTEuUoAiS1rWcuwlK63kPBsDkfYuva1kLP3Ps?=
 =?us-ascii?Q?gIsJlR0C/uILw7E8rTaZD5HEekt0KA1gpYi0iReT+W3picIbVlwu5JwpOtJK?=
 =?us-ascii?Q?jpokDp1ySHPV0puhqN06tS+pOchbhiLmMAzokH+C2DI1nejy+mPf/7JVTXPN?=
 =?us-ascii?Q?e3ayG5rLsLAeFqlS/kH9SqprYOi9o9nqNCR+slnI3ScHhTgggJWUM7/ei9UO?=
 =?us-ascii?Q?E8qgsxaiIwTHLIbNFwpLyPrTWADtczfrqLypETsWl861JYsReTRvlKxd6NEk?=
 =?us-ascii?Q?E70/+rmThVQgu0g8m8mJi+J9eZ+YvE9D+gR0jgFo1rfHaaNYfdPSvu0QlQV0?=
 =?us-ascii?Q?xl9UqgxW6sG7PAivIlGgX4zPSjdqyJinG6lUvDht0AgGz0knFKQ22QsMWp4D?=
 =?us-ascii?Q?1HXveSMdVHF4r0KDWgZMKAl8R4McffAojbL1nGBM0rnZjxsCKaqQkJswZbfF?=
 =?us-ascii?Q?nPdDyhwB7hxh2kFQMGBunSX/esMg3z0mn10L8yd5OChp+tArOQj4L6SlTFZw?=
 =?us-ascii?Q?4NZErWhl28tA40Qfhmuujz1okKtJ0RBpIQTYvs1rjrf1/l03vJ7IMzHViPvV?=
 =?us-ascii?Q?MZHzR0zo/6fivDr5kegrriKMsfAN7Jq4S0saqnpHt5pIlkP1ciu8Vwsk5vve?=
 =?us-ascii?Q?JWu8yeed4IESd5/9ZNX43s5HilAtKZh/RGlArM6GR1NjutjhuaTHLV5y0X58?=
 =?us-ascii?Q?Go14vTYf0dM6wwykcSViN2zSLC7Ifmk3YE4nt0U04zInaK08ag+7SO1iaNn2?=
 =?us-ascii?Q?QCUn5U1ft0pAg8YtxWevLzJXBhLSzS3/o+DI/X7/xfIsnDM4c1DvN2iMPq5U?=
 =?us-ascii?Q?Jhv+ktiq06kDoWI0rvIcxoIwDeOzI5ub73YWeHQYpyo7GylKzgF2p2my+o4d?=
 =?us-ascii?Q?LwhBNN8aCB5Va/F5TCig+vq6CXo/nwUMzzVvK8qXafglLeE0VZiYtinBjCZ+?=
 =?us-ascii?Q?l4YLYSeVxDymNhiJER1J/ydAwOB/+XWZTJPJfTExYAROlu2EJrgTUmFehyzt?=
 =?us-ascii?Q?NCnNAosEC3+a3i7caja9Grz01zYgQrSbFcIlEpn38/aF9CsMrewMp/3wTBel?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2173a816-5bc9-427d-ab58-08dc42eedae9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 23:48:02.3751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnndeyqnpI0u6gW68aQuHyTv/TETnL+d4ALHLJTs0UKX75rsAY3os4FfnFp3L7L3eaWkBNIOQb0B4p/r0d2wkgAXNQXVH4pFdByNDpN/Gro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
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

On Tue, Mar 12, 2024 at 03:54:09PM -0700, Matt Roper wrote:
>On Wed, Mar 06, 2024 at 11:36:39AM -0800, Lucas De Marchi wrote:
>> With dynamic load-balancing disabled on the compute side, there's no
>> reason left to enable WA 16015675438. Drop it from both PVC and DG2.
>> Note that this can be done because now the driver always set a fixed
>> partition of EUs during initialization via the ccs_mode configuration.
>>
>> The flag to GuC is still needed because of 18020744125, so update
>> the comment accordingly.
>>
>> Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Dynamic load-balancing disable hasn't landed in i915 yet (although it
>probably will soon).  Assuming we wait for that to happen first before
>applying this,
>
>        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Humn... I probably grepped the wrong tree for this one since I was
seeing ccs_mode being set. Indeed it isn't :-/, so I will have to land a
fix or revert since this patch already landed a few days ago.

Lucas De Marchi
