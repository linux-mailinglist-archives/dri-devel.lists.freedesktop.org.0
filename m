Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F07C87A4D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 02:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9F710E4DE;
	Wed, 26 Nov 2025 01:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KW/tKXVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40C810E4DE;
 Wed, 26 Nov 2025 01:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764119387; x=1795655387;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q5y2FfsjKp4CdKEk05LWGuGm5SfX+r0NIHG6BPNwZeM=;
 b=KW/tKXVB5HvQIkhSARWXUB74y4h7NxZcK8sZMdzJzODhJC/tjOwWb1S4
 RfCryl1qYjf6+OOq+Og44wKdvTS9sbtqwrJaPTmOwfPVZogZIUn31NNYO
 R3Cy2m7TifW0UnsT3OD+/zINBAFZRqZTyl5haWfMLOwgmDZjE0uAxRtc9
 Qgwq9i5j/CnHmJlXI4QtYPtApzpWoaoDOMSCkSLXK1RrdWif1pcLNA58G
 JTfrf7N7NtiQFXQoPEzfX8RtZuNy4lPodkbn8wYYUWbx3v7uxL1A0BL8+
 QH/KPjJj72TH14sk07jAbJN67qJScZDbiOoxG7ODv+NwAysggyl3gF73s Q==;
X-CSE-ConnectionGUID: h1rVKlHJSUay01RT4v7QUA==
X-CSE-MsgGUID: 9dPMRSt9RySGcmP5le9XBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="88796832"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="88796832"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 17:09:44 -0800
X-CSE-ConnectionGUID: lk7PRfwRSW69YQWRixoTKg==
X-CSE-MsgGUID: 3FOwW3XURsCPRTmfQTm2TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="192053269"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 17:09:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 17:09:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 17:09:42 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 17:09:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avIb2epeCXX/dkM/LvhK/h+TwUB38tjvdRUbu0JO5iPutsYenNkpp1IW8Nr/LsgOszWAmZ6EndsXEtn67DUnn1l0h3ZgREk7CyB1sVM7taEBIv09j9Hs1aeOhmj5CfPIQKVRT44vVVbaV4DQ5r4vxFudHEUUAnh03T2zVY3NSlh5rM5metBc39V8HE2G4mnSdi+RVSUmLSVwpU5U/6NkJ8Z1BVMcb/6jkNU5ciZISKAG055QqcnJvLWAFG0XLBbquUvzmk5yI9rpOgUyXm27PXE3m4IPQcmFedWDEOlrdv+ZxXsrlgJwRRcI8f6G34duQ6YV9MCyK6d180dzqAh5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIfSbbOHZEin3t0+K14LoIMfqOFfFDBmkqkUqQ8X3Mg=;
 b=ngeK6Pg169K/EDxKLNfGvgfZsz7r2YVGWbCaASKRJGQ0n+avfv2Ge6bo9xpV83mliXwljenRWu6OcXTHhmaA3PNxaIQbyqpdor0gaR0hjhIbZCMEnl8Z24I7f3yNcb21ouLA1bbpP5oeuJVv9zhiGEXX1tJU8BhlLYtwukpeEZvOOU55r/CSnqiApBUBrX4wlrmpRtaHGhtHNuoVMsqKeiyq5/Iavf24ObFWEZpxbi2vEJL03UXGISUaR4DytaYQNCp62gQZ8wgnxfUr1/u5sbx6DXNWwuAKdvRuUBvxoPp9TealVOWUe4lGboez92Ep7I6wPeanANXmPTQhYuXWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Wed, 26 Nov
 2025 01:09:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:09:39 +0000
Date: Tue, 25 Nov 2025 17:09:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 11/17] drm/xe: Use the vma attibute drm_pagemap to
 select where to migrate
Message-ID: <aSZTUfsJNPHKB3Si@lstrano-desk.jf.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-12-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111164408.113070-12-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW3PR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:303:2a::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 400558ad-db20-4bd7-dcf1-08de2c88796d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OT1pBoKJc9hncF3ovTEb7Dfd9/kH8AA5NDIVAgc84a3ijyJVq6nmdwxwk9?=
 =?iso-8859-1?Q?owdJw4tMV7PfM87EzZMioohNIdx/jd+rwQceXu0D7SStzShbDsIfsO5itc?=
 =?iso-8859-1?Q?SQOm3MshUUEagXkDfdfrgHrXgqnwOkBQK1U2onWNPpI0hHG83+UiyonuZL?=
 =?iso-8859-1?Q?ZP98ZP3qsTR7fuELdiPq5F/9qRDO9paZbx30nr2uOHMBSJTs1zRPtfbsnr?=
 =?iso-8859-1?Q?ZMZRAJDhFviU2i2yoXNp4MjLcaX8wFEs98gPYLiINFzFP7C//g30E/uSVI?=
 =?iso-8859-1?Q?aWpnCAwmf5MeCC+ZjMSYfxHoozjoOUXqrdhs+F9E9oATErxaEX5FK4kxJL?=
 =?iso-8859-1?Q?gr5039ya/UNZeC7Swln/34kEQseJ4uwCRqIs+tI5jE2SLQE+fSw7x9YuVH?=
 =?iso-8859-1?Q?XcYykI8ciBm9bp+tDYM29R33EbvDPskqv1w5Mfy/OYcdpnIs1pVilCC8g3?=
 =?iso-8859-1?Q?Rj+W/jgS0Z4ib0saNGqgk048CKbJV4sATulx7niPR7xwCHs6Az9JocK/4L?=
 =?iso-8859-1?Q?p7ksdQE/Mnvitm5iDtC6zN5kTWnVHjM42ISTACx5c0slt/lNyVmWb0usl1?=
 =?iso-8859-1?Q?KzKrNA97Jk7IZ+rCjhSXZtS2T0Z7vE6/kCa4sQDc9t9lTNIeLtlClg7qwh?=
 =?iso-8859-1?Q?pAVW+wgzJSohplF8LIQGDf23aDG5g0ghFMIFPdG2W9Z06T+F3ly/7DsDKk?=
 =?iso-8859-1?Q?6iyRh/rE3FcFr2Ilevbj3C23z6XrEC3YUyIyKMz6VugVn5UBSqh5UqlItn?=
 =?iso-8859-1?Q?qAcGs2GAXAKzJ/wVUzcxWRFQqf+AQm073bMR+w7jlDuPGUnlqstXXAQLR8?=
 =?iso-8859-1?Q?2Ea1PVkmfF2C098HJDSi2XoEB/MxQ2tPrE5Od2LIRAt7odwfs+scgCMp+i?=
 =?iso-8859-1?Q?58lTmYbRF8RKFF1t9UQ7WZLVRcHFZiexCXe5idZDfQPDFXOtCO0dklX/G4?=
 =?iso-8859-1?Q?4bn0ktiae705WIbFYmHeA4pCzXdBQgp4q2IKbGJfniqtQf7Gz/aasOUgn3?=
 =?iso-8859-1?Q?+UfwRsho/mqzPnUz8Ak2ECx3Whm79FdRx+yl3iMdDQy3K9CqoPKjkXGef2?=
 =?iso-8859-1?Q?03nN0SpAS8GbrW9lbTbD6woaqp1iSiupWctZZX1Gfy+Jf1qPFM/tJInWHM?=
 =?iso-8859-1?Q?2xVusWrpFKkPXb1O9/7YA1Dp3ZItzAWFbT5f0XDyFcYbBjpBJfa06OAZUA?=
 =?iso-8859-1?Q?LIRkviTvSHajw2GXj3gWy19PtyCnGrxHwneorF+JalI+blOnK6zPsnYXsh?=
 =?iso-8859-1?Q?yy36WMS+3ijhJ7nWYgp7qsUBx25ZnJLqeyHdKyXzcQF8kGvcPTuzIdxnKQ?=
 =?iso-8859-1?Q?nmrhXyv5cmsiIqP/YcD0RngLdxKDSNkblR/oPk0bOiUX68Tk89HyPBv5GD?=
 =?iso-8859-1?Q?62+/ojVFLdone4UPRw5Jy9k6omq6mQHGPVBJG9AKZvkuGGQZY6WeD31A49?=
 =?iso-8859-1?Q?w64pLLROFv7/nLBfOL9MEH37/cLIxKZQrjdPj0Xmjh2ndSHl0c7ito5w9X?=
 =?iso-8859-1?Q?1JbVVNthMWk6J0eqjs+2se?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B98pp7MzzXjZcXVCM9SHxo/TTknsJmaTmPs2hn6mAxXgGjDboh1SJWljrs?=
 =?iso-8859-1?Q?2iuQWV7MxlnRiye/cuYn3gpSaKDC4M7a+3aMeHSWNFBW2J2LWz2DJSxRZK?=
 =?iso-8859-1?Q?dDmhBReIwGdHjH9MVrCV1PSsoHw9Obxjdw+o8q73CYI21ED/Kqv4vrtRRk?=
 =?iso-8859-1?Q?eZyp3HPb+26Iqn1QYW5r39gPlR2KFHvbfvaXlDFdShNiKUdqWHI+1ZihRq?=
 =?iso-8859-1?Q?xr/DiZW3FbueclF95jtm0A2OII+ynUt8ACOPmAa0yNRdYYhFN5QIRiBAyp?=
 =?iso-8859-1?Q?9pBwaIO3QvG0dk0+ncrKxQcYRcOIVGoFpAW+tSC8JGnj4+QSd23QkOLEmk?=
 =?iso-8859-1?Q?39jh63zsLZRH5lrJhIB8Vy4kfz7IoQLaX+HiOky4C5qobRjXf1wZbEaKk9?=
 =?iso-8859-1?Q?bxF1+8fUvCorBRjCsFbKYL9+0mCS1mljLX2FJ+GlSuvUmwfNAnTNmWFjzS?=
 =?iso-8859-1?Q?RkHPBOxxOt2cEIhUDANZTP3ZFDFrpVJW4mvADkmhQCFA96Qqy1VI2T6SUA?=
 =?iso-8859-1?Q?soinSl7G0hzq8xenCEWFkihjwyLNHC3a7xj9ycfirJ1uEsXD4W1ItkvN0d?=
 =?iso-8859-1?Q?vqcMEXSqRG9y40TJLJatHVhLWrL6iiYJ2XCIUYYfU7zQqdjbuzeFi4R5I4?=
 =?iso-8859-1?Q?iVvvGbEQuho0Qm3vSeMd6Svw66xaMNRQK/E624sobccm+JMcRUWebScvKA?=
 =?iso-8859-1?Q?Vo5WabWCHx+b+tKnWo1pO7LqviPv19ibevwKl85N9SiasAqt/KISZOeVXi?=
 =?iso-8859-1?Q?6z8yu/CvunoW1QwIfFDV0qmaTMJ0xrG94wTfxV7jAcg/KSo+rOgPuQDwVk?=
 =?iso-8859-1?Q?qMFGOsXc2qvFlInww47tAmUWahh8OfRR+BCJ8HZuHir0xFnsvdr5C7IiWt?=
 =?iso-8859-1?Q?pH+JG2DUe/Lcg1UYLCE3ukvRU/Th+ybWRsjEeSz9nmDO8U3WHeYbGixWmF?=
 =?iso-8859-1?Q?sNxaskLA/ZlSibWZ7YvZptf+8s+HJJO51joxtnEYo7sECegW1Sx9EQ5ebX?=
 =?iso-8859-1?Q?9heQTdPaLq1n1wqGCcWGIjJIH7uzsVg7+2n+q20F4GKqA86QnRqdzmE2m4?=
 =?iso-8859-1?Q?yIRCYmQ141Mj93SE/B70GfRV0TeINN32g9qt53Fq5rpd+ke7osKCKBLRUB?=
 =?iso-8859-1?Q?TTr/ay1gCYEXKpCm9JmjXkc0AsBL+6cbE3xow1xrjG/EhQBDi59PBG6wnz?=
 =?iso-8859-1?Q?g7cW0uZzbJvKOBhf42XZvNztUqtULxpURQ4Lj2fYeUeY7Ca0vH7Qp2Rqho?=
 =?iso-8859-1?Q?JpUn4Fqrleii5TNz9Ui1NKTuUDFlqBEB3VVTiNayw4f6kjVh0J5kUFek/7?=
 =?iso-8859-1?Q?0OTmWZuSHhZA8oqCuyrgK6DpXcRaHsFhVzPZ8BHkhpBg88zwQtUcrx1IrZ?=
 =?iso-8859-1?Q?CObK5/zACkuj0wGh7E9xdaeMbZwyXYzvfFtS/lxhYeTUUgRnMgUi0PdjOG?=
 =?iso-8859-1?Q?1ISxcCv5wwOKOVRdVJkwuBu/PFjWvBTekkUMlyD8cbh2lk0GB7FY1lRuz/?=
 =?iso-8859-1?Q?nmVmPDVfvBKEVIsdkNjBb7Y2oaRFLnJl/Uh3EFQLpNBIdo+r5lfBsWIvRP?=
 =?iso-8859-1?Q?5zx1DH82JYYtt+G6h+Fny66G9A0l3ZCuRsPtVLYt2ErDkQz+/E9D1S+X5H?=
 =?iso-8859-1?Q?QJ97wvnYjHSnso3T1c7lxnT28XwcouoNIScxsOag6Osnmy5p+nmOAfMA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 400558ad-db20-4bd7-dcf1-08de2c88796d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:09:39.9239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZ70oiXRNytxYv+DpBpeMYMTZTy5jzjPh8c/VaCwm83uukn3NdGxKiUzkPqV+x0qRGdwlVan5K13Z44AT0jOlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
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

On Tue, Nov 11, 2025 at 05:44:01PM +0100, Thomas Hellström wrote:
> Honor the drm_pagemap vma attribute when migrating SVM pages.
> Ensure that when the desired placement is validated as device
> memory, that we also check that the requested drm_pagemap is
> consistent with the current.
> 
> v2:
> - Initialize a struct drm_pagemap pointer to NULL that could
>   otherwise be dereferenced uninitialized. (CI)
> - Remove a redundant assignment (Matt Brost)
> - Slightly improved commit message (Matt Brost)
> - Extended drm_pagemap validation.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c      | 86 ++++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_svm.h      | 12 ++---
>  drivers/gpu/drm/xe/xe_vm.c       | 24 ++++-----
>  drivers/gpu/drm/xe/xe_vm_types.h |  6 +--
>  4 files changed, 71 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 4a3853a5cd64..006de141dfa7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -875,13 +875,34 @@ void xe_svm_fini(struct xe_vm *vm)
>  	drm_gpusvm_fini(&vm->svm.gpusvm);
>  }
>  
> +static bool xe_svm_range_has_pagemap_locked(const struct xe_svm_range *range,
> +					    const struct drm_pagemap *dpagemap)
> +{
> +	return range->base.pages.dpagemap == dpagemap;
> +}
> +
> +static bool xe_svm_range_has_pagemap(struct xe_svm_range *range,
> +				     const struct drm_pagemap *dpagemap)
> +{
> +	struct xe_vm *vm = range_to_vm(&range->base);
> +	bool ret;
> +
> +	xe_svm_notifier_lock(vm);
> +	ret = xe_svm_range_has_pagemap_locked(range, dpagemap);
> +	xe_svm_notifier_unlock(vm);

So we had discussed calling get_pages to figure if range was in the
correct location in the previous rev, but this is quite shortcut to
figure out if the pages are in the right location, right? Just want to
make sure I'm understanding this one correctly.

I think this makes a sense. Kernel test robot is complaining here, so
hold off on the RB until that is cleaned up.

> +
> +	return ret;
> +}
> +
>  static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>  				  struct xe_tile *tile,
> -				  bool devmem_only)
> +				  bool devmem_only,
> +				  const struct drm_pagemap *dpagemap)
> +
>  {
>  	return (xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
>  					    range->tile_invalidated) &&
> -		(!devmem_only || xe_svm_range_in_vram(range)));
> +		(!devmem_only || xe_svm_range_has_pagemap(range, dpagemap)));

As discussed when we have a fabric which supports atomics this will need
a bit of rework so perhaps throw a comment or two in places where we
think some rework will be needed.

>  }
>  
>  /** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
> @@ -902,7 +923,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>   * @vm: xe_vm pointer
>   * @range: Pointer to the SVM range structure
>   * @tile_mask: Mask representing the tiles to be checked
> - * @devmem_preferred : if true range needs to be in devmem
> + * @dpagemap: if !%NULL, the range is expected to be present
> + * in device memory identified by this parameter.
>   *
>   * The xe_svm_range_validate() function checks if a range is
>   * valid and located in the desired memory region.
> @@ -911,14 +933,15 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>   */
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, bool devmem_preferred)
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap)
>  {
>  	bool ret;
>  
>  	xe_svm_notifier_lock(vm);
>  
> -	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
> -	       (devmem_preferred == range->base.pages.flags.has_devmem_pages);
> +	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask;
> +	if (dpagemap)
> +		ret = ret && xe_svm_range_has_pagemap_locked(range, dpagemap);
>  
>  	xe_svm_notifier_unlock(vm);
>  
> @@ -1019,22 +1042,22 @@ static bool supports_4K_migration(struct xe_device *xe)
>   * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
>   * @range: SVM range for which migration needs to be decided
>   * @vma: vma which has range
> - * @preferred_region_is_vram: preferred region for range is vram
> + * @dpagemap: The preferred struct drm_pagemap to migrate to.
>   *
>   * Return: True for range needing migration and migration is supported else false
>   */
>  bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> -					bool preferred_region_is_vram)
> +					const struct drm_pagemap *dpagemap)
>  {
>  	struct xe_vm *vm = range_to_vm(&range->base);
>  	u64 range_size = xe_svm_range_size(range);
>  
> -	if (!range->base.pages.flags.migrate_devmem || !preferred_region_is_vram)
> +	if (!range->base.pages.flags.migrate_devmem || !dpagemap)
>  		return false;
>  
>  	xe_assert(vm->xe, IS_DGFX(vm->xe));
>  
> -	if (xe_svm_range_in_vram(range)) {
> +	if (xe_svm_range_has_pagemap(range, dpagemap)) {
>  		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
>  		return false;
>  	}
> @@ -1131,9 +1154,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (err)
>  		return err;
>  
> -	dpagemap = xe_vma_resolve_pagemap(vma, tile);
> -	ctx.device_private_page_owner =
> -		xe_svm_private_page_owner(vm, !dpagemap && !ctx.devmem_only);
> +	dpagemap = ctx.devmem_only ? xe_tile_local_pagemap(tile) :
> +		xe_vma_resolve_pagemap(vma, tile);

e.g., Here would be an example of where once we have fabric atomics a
rework could be needed.

Matt

> +	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>  	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>  
>  	if (IS_ERR(range))
> @@ -1146,7 +1169,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		goto out;
>  	}
>  
> -	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
> +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
>  		xe_svm_range_valid_fault_count_stats_incr(gt, range);
>  		range_debug(range, "PAGE FAULT - VALID");
>  		goto out;
> @@ -1155,16 +1178,11 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	range_debug(range, "PAGE FAULT");
>  
>  	if (--migrate_try_count >= 0 &&
> -	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
> +	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
>  		ktime_t migrate_start = xe_svm_stats_ktime_get();
>  
> -		/* TODO : For multi-device dpagemap will be used to find the
> -		 * remote tile and remote device. Will need to modify
> -		 * xe_svm_alloc_vram to use dpagemap for future multi-device
> -		 * support.
> -		 */
>  		xe_svm_range_migrate_count_stats_incr(gt, range);
> -		err = xe_svm_alloc_vram(tile, range, &ctx);
> +		err = xe_svm_alloc_vram(range, &ctx, dpagemap);
>  		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
> @@ -1481,7 +1499,13 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>   */
>  struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
>  {
> -	s32 fd = (s32)vma->attr.preferred_loc.devmem_fd;
> +	struct drm_pagemap *dpagemap = vma->attr.preferred_loc.dpagemap;
> +	s32 fd;
> +
> +	if (dpagemap)
> +		return dpagemap;
> +
> +	fd = (s32)vma->attr.preferred_loc.devmem_fd;
>  
>  	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
>  		return NULL;
> @@ -1489,28 +1513,24 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
>  		return IS_DGFX(tile_to_xe(tile)) ? xe_tile_local_pagemap(tile) : NULL;
>  
> -	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
>  	return NULL;
>  }
>  
>  /**
>   * xe_svm_alloc_vram()- Allocate device memory pages for range,
>   * migrating existing data.
> - * @tile: tile to allocate vram from
>   * @range: SVM range
>   * @ctx: DRM GPU SVM context
> + * @dpagemap: The struct drm_pagemap representing the memory to allocate.
>   *
>   * Return: 0 on success, error code on failure.
>   */
> -int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
> +		      struct drm_pagemap *dpagemap)
>  {
> -	struct drm_pagemap *dpagemap;
> -
> -	xe_assert(tile_to_xe(tile), range->base.pages.flags.migrate_devmem);
> +	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>  	range_debug(range, "ALLOCATE VRAM");
>  
> -	dpagemap = xe_tile_local_pagemap(tile);
>  	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
>  				       xe_svm_range_end(range),
>  				       range->base.gpusvm->mm,
> @@ -1780,9 +1800,9 @@ int xe_pagemap_cache_create(struct xe_tile *tile)
>  	return 0;
>  }
>  
> -int xe_svm_alloc_vram(struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +int xe_svm_alloc_vram(struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx,
> +		      struct drm_pagemap *dpagemap)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index e99d483e82c2..a0ec173c6bf0 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -94,8 +94,8 @@ int xe_svm_bo_evict(struct xe_bo *bo);
>  
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>  
> -int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx);
> +int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
> +		      struct drm_pagemap *dpagemap);
>  
>  struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>  						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx);
> @@ -104,13 +104,13 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  			   struct drm_gpusvm_ctx *ctx);
>  
>  bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> -					bool preferred_region_is_vram);
> +					const struct drm_pagemap *dpagemap);
>  
>  void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
>  
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, bool devmem_preferred);
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap);
>  
>  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>  
> @@ -276,8 +276,8 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  }
>  
>  static inline int
> -xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> -		  const struct drm_gpusvm_ctx *ctx)
> +xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
> +		  struct drm_pagemap *dpagemap)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 27669f80b7ff..85c2c1dea26f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2332,7 +2332,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			struct xe_tile *tile;
>  			struct xe_svm_range *svm_range;
>  			struct drm_gpusvm_ctx ctx = {};
> -			struct drm_pagemap *dpagemap;
> +			struct drm_pagemap *dpagemap = NULL;
>  			u8 id, tile_mask = 0;
>  			u32 i;
>  
> @@ -2350,23 +2350,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
>  			op->prefetch_range.ranges_count = 0;
> -			tile = NULL;
>  
>  			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
>  				dpagemap = xe_vma_resolve_pagemap(vma,
>  								  xe_device_get_root_tile(vm->xe));
> -				/*
> -				 * TODO: Once multigpu support is enabled will need
> -				 * something to dereference tile from dpagemap.
> -				 */
> -				if (dpagemap)
> -					tile = xe_device_get_root_tile(vm->xe);
>  			} else if (prefetch_region) {
>  				tile = &vm->xe->tiles[region_to_mem_type[prefetch_region] -
>  						      XE_PL_VRAM0];
> +				dpagemap = xe_tile_local_pagemap(tile);
>  			}
>  
> -			op->prefetch_range.tile = tile;
> +			op->prefetch_range.dpagemap = dpagemap;
>  alloc_next_range:
>  			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
>  
> @@ -2385,7 +2379,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  				goto unwind_prefetch_ops;
>  			}
>  
> -			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!tile)) {
> +			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
>  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
>  				goto check_next_range;
>  			}
> @@ -2897,7 +2891,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  {
>  	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> -	struct xe_tile *tile = op->prefetch_range.tile;
> +	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
>  	int err = 0;
>  
>  	struct xe_svm_range *svm_range;
> @@ -2910,15 +2904,15 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	ctx.read_only = xe_vma_read_only(vma);
>  	ctx.devmem_possible = devmem_possible;
>  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> -	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !tile);
> +	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>  
>  	/* TODO: Threading the migration */
>  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		if (!tile)
> +		if (!dpagemap)
>  			xe_svm_range_migrate_to_smem(vm, svm_range);
>  
> -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile)) {
> -			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
> +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> +			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
>  			if (err) {
>  				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
>  					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index ca489aa7c652..392c4caf2a63 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -408,10 +408,10 @@ struct xe_vma_op_prefetch_range {
>  	/** @ranges_count: number of svm ranges to map */
>  	u32 ranges_count;
>  	/**
> -	 * @tile: Pointer to the tile structure containing memory to prefetch.
> -	 *        NULL if prefetch requested region is smem
> +	 * @dpagemap: Pointer to the dpagemap structure containing memory to prefetch.
> +	 * NULL if prefetch requested region is smem
>  	 */
> -	struct xe_tile *tile;
> +	struct drm_pagemap *dpagemap;
>  };
>  
>  /** enum xe_vma_op_flags - flags for VMA operation */
> -- 
> 2.51.1
> 
