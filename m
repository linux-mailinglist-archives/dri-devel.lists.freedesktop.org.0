Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6499E992F93
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98B610E3B6;
	Mon,  7 Oct 2024 14:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUKMsfRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4099610E3B6;
 Mon,  7 Oct 2024 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728311986; x=1759847986;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+zNZ1vRmfPMx4A+oKGARuZCfqO8JfhN52l9OpitK4kA=;
 b=HUKMsfRvhcgIqk3CRPJ4NEzdw/FfmQ4sq2/cQp4H/+UbytYSa6AOaHdX
 j/8URH/BM4r19LMNIhLZXLrO6cotXBLKyx7dFhLFpGliaU4rZNNm6YDol
 SnKHg65UtCxe10GWPgdAAxdx8+RRxai9y2Ba+T49taQwjp2QGqfTLu7/o
 c12WPCXP1pXleo2lzUawmqRSPjf5TgWJZSLzZOZt+ZEkeb0pTyeWcmLjd
 5MOXvXqKtXctGPAwo3401YUPdBiPCc94Vw/0xRkP8ruv2gtPFme2YniWd
 rt2/6G+GuCaewAmEOyleJKd1tMnfhgiP9EHGRmWt3MJ+Dux0X8nmlGyfx w==;
X-CSE-ConnectionGUID: wEt43SI3T8mpdzybw3Bihg==
X-CSE-MsgGUID: 0VDU9ENOQCWI9tRURieKKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38033210"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="38033210"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 07:39:45 -0700
X-CSE-ConnectionGUID: mN+4RQOGTCGUZqA+7ATufg==
X-CSE-MsgGUID: Yahr5nIyTemwTM/Ebh4d6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="79482825"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 07:39:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 07:39:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 07:39:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 07:39:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2BWsde6pivF/yAD8c9ZpZRkplaHzjBXr9vTG8vm07jB8l+cPPGOvUQ2woVOdBLpf8dRMtKNs8RhJL8DMxYDomRUQ5UOcvCUQBjxxgG6LZjIqRMsG1flbrk7T1NhDxBpUhnbFVb2JncL31xFilzmtlj5OFZcyMagkfMbPG6Z+Tbf8FNrr3cvXzYG3JBua8Y7rONW2mcONOgjFA3ifIZhrznzDljF3k9aQ7YFYoasznQvJJDQg9PYwDReHUQwX0rOQ03paprfT5YGBXgGPSeBOZ/IKxG2qc/Fe8MjhYGQWegN4SB6zVaoPQ0n5xw/N+LB5UL3qRGvFjr6906TF2tXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWRhs15wDrALEzIcuJfLbMjW8I83+jHN6Uqw/skKOpQ=;
 b=gtkzqyVDspdlOlwLYTlsLS3Yzn3BIfCXCRBSvjg2IifnopMM/NVP2s+XWsF3q5U1QZCsQBQXTe7wL4CFsf/CU86f7Ey+iVa94B34kRZfeYOLjaxHR7N0XKCx1DHBnu/BCbddQyAJhduxWSn66in0QI1+zHF/jqeFStztTD2iJmjlnYSGXfgbZT0pwmFQItr1psN1BhJjMG7l37be8o7xLIfxCCcBUSD93jfod382kPdzIdavBq/HFT8wiRZpUUhKwmDf5MXi+mvEZZHI3LVtiYNLm/Nh8qrOUTLXzdiJQqi1he1/hEKjiaAvdWwBZupzgCmRtR5rLDXRxhl4RBIKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.22; Mon, 7 Oct 2024 14:39:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 14:39:38 +0000
Date: Mon, 7 Oct 2024 09:39:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
CC: Brian Cain <bcain@quicinc.com>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Maciej W. Rozycki"
 <macro@orcam.me.uk>, Heiko Carstens <hca@linux.ibm.com>,
 <linux-kernel@vger.kernel.org>, <linux-hexagon@vger.kernel.org>,
 <linux-bluetooth@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux.dev>, <spice-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-serial@vger.kernel.org>,
 <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v6 3/5] drm: handle HAS_IOPORT dependencies
Message-ID: <3wh4nsirm5kjapft47oe3gaqgzdjwlhzku5lrctb4hhfjxicv3@n2sow3o36chc>
References: <20241007-b4-has_ioport-v6-0-03f7240da6e5@linux.ibm.com>
 <20241007-b4-has_ioport-v6-3-03f7240da6e5@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241007-b4-has_ioport-v6-3-03f7240da6e5@linux.ibm.com>
X-ClientProxiedBy: MW4PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:303:b5::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: 4400597e-0f5f-49d1-db51-08dce6dddf23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vqmlIbzdz7facFgV38gA8q4rzV/Y4pBRXY8J5faRyAvjzzAUuh+nSWWuIQQI?=
 =?us-ascii?Q?Hcj+IhdQIo2pMaZ7/SCd37o2F+CPdohBEpnHvWtzx9G1S3/1sCUHYdE3SRAh?=
 =?us-ascii?Q?qXnoPOuLUnzNje/kPnvaErHK8sW34FbFAELAFCdkbZb7lcQP3UytNFuikXAK?=
 =?us-ascii?Q?ba515WyoLkkKiHzaS6buJO/NN220jJUZ0YCCTR8LRdLw/TAZmunGp5YAK8jU?=
 =?us-ascii?Q?pkyygfrT3L/HS9HrXz+BQl8sUsT5gloFgCuvczlvD0HY+M/gleI+pQRqaXHA?=
 =?us-ascii?Q?KbQhvaVXOD+TSsPZ45ejt8k+Dj8JvY2zB4FBDcLI/6tSlxhW9Ob9zREcbhtp?=
 =?us-ascii?Q?rb9atUVHNnrRMnyQe0lHEMJMtzsl+DQdtQi3scoT3+JuVxaehXVnDDAZv8os?=
 =?us-ascii?Q?tBhIVeH0NhgzVykd0hVjqA8oAIN+aksAdnEyoDileIQwkAbPVc/Gexhdp96Z?=
 =?us-ascii?Q?3qIFHxD3Tg7XFaImWbL06IWiOsMZpyfOpEGi6yhVLtDTuyWPp/uaCH5oMZnS?=
 =?us-ascii?Q?XrasKMiV7J/Nus8mwmDKiUTVYNCvL1l0+fcOW2xki0g48CsXZA2eKXpZAz3d?=
 =?us-ascii?Q?vfUE+9bUxn3zNO+za+Hcvip/pjV+P/Q0YUJ4aysgyszK1RzFFClT+5U1thiO?=
 =?us-ascii?Q?SxyixYeUyhof22nrrC+I39n4wck0GX/t4IJ2EDhldJCQfiVbFzUsxKpPoNFm?=
 =?us-ascii?Q?tFgIhk6PkaFceCk2d7r/U7iwMDCDXvr12mSCRPCcQENSW8KvoGm8y6VHNVa8?=
 =?us-ascii?Q?ab9GNyhXoVCAN37WBSPdkbbAAQ0VJympvQR6oRIjtE+oJUk/P7Q4zDol9LbH?=
 =?us-ascii?Q?Lwg04l1IdadFn7L0pGY9uUpAEWN8b39WQxEtbr/xrUECZLjIe2mhp6yZW0z1?=
 =?us-ascii?Q?CNjEwBCNJRr3xlF/wFAQVYt0qP5F/UesTzj24bcwNFK+469d42j/aGBur/Fc?=
 =?us-ascii?Q?SLq9d3Tdvo5pRuGey/c+nBjhJEa6+XZrsIIUr2JEXx0l6F8wosKhGlPoIyP6?=
 =?us-ascii?Q?rEt8qSWto3GPelOZoFOQQtFH6kp5aB1DT0zxyDFr/GY3QmyY/e5eObvoFrn4?=
 =?us-ascii?Q?kvMOhNYLejlhyxrXzpNhav3CHW1rfm7Y0VGSNswYfK9bHSqJ41gm3mw1zKLP?=
 =?us-ascii?Q?bg7wu4gyRwajQB/E5r/EaKSLrDS3EYpP6DjGumfaPl74VlcFiIZ+RYSI276D?=
 =?us-ascii?Q?IVl++CFlfj54tUdJiovd6e6Qp9aG1BYO5n4mJnXAyQy5NExxRzRNzTBQ+TrU?=
 =?us-ascii?Q?Hj3aAh3lJzOT2TdaUJvCp2IwsZ850Qejmlj549JoQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uCkj1oeoD9ZkvN3ABaAd8PoPrmdNx+MaO0LouagCSMi1Hv+YFF9p8sJhTHty?=
 =?us-ascii?Q?HMUMjqPaBgAxVKBWvSCF2UJNt0KMPGiRB/nYlc17bwQdNTm6byHZ9JGeT29D?=
 =?us-ascii?Q?yK5NYHu6sMHovh3RZYykeej51sCo4An0p171tZOeVOFPDSeg8lMDHdBHATr5?=
 =?us-ascii?Q?YMslf1LHaUjYDIz/7aA1N/sHlbk+GTQA3Sewsd12fqYaS4t3wZyYGXqsegOh?=
 =?us-ascii?Q?P9RJLeT4tfe+de7i1p/G9WQQwseJ3c9PCKqJHPrq53xjALGY+eQdE07KaE7R?=
 =?us-ascii?Q?eIXQb6XUZqI5k/b8SE14mCtVBCsQkxF6ygfIOo19bHH2UHLcussvrZpEd6pb?=
 =?us-ascii?Q?8pVs7sZRS1/kHZaqCE+EkFjasLMyYHcmRTJ95wDAIrVX9obFgvrW9zpfDkrq?=
 =?us-ascii?Q?fQN4CdikdvnFFxjFDOQ+rywFB0790SGY6NzgpHIpMd33Pva1s8L0COk87WcX?=
 =?us-ascii?Q?eqiHlpWZCuG4Ubf/A/7Kdh02OPueYUVPr0cnTvFoxfXjGeAuCalrZ1e5/JlM?=
 =?us-ascii?Q?qomGLTKeJoqYYBc+yrHlXocNsQe5CuAhCD5VF1EchpPvbOn05bhQcePaEEEV?=
 =?us-ascii?Q?HDyL2+RqjxqRLqUBTQb5016IzPJXFiRy27LCaKly/oU+llb9Mi9RxLcbJr0l?=
 =?us-ascii?Q?OJ1Ta4MNTITN8weQ4WoZWIzjdesu3e4BMfgR5dxtNKKwVydciw2Jetq3vTDy?=
 =?us-ascii?Q?NudSEKCNNUmaoNun2/N7acqUyZRLQfB/srlnc7xSqvLKpoUAQlKwx9Lew9za?=
 =?us-ascii?Q?7I9dG6K5rddr7OFJyVJ9rfzAby4HNSb5bM7x4Oh8Q86J2UTE0dv/l7qafc4c?=
 =?us-ascii?Q?phHm9ovy+iSwrt8BYD2qXCLAx8gY6SACwWJcfQE5SFtrs8Bdy+liJpvawdgQ?=
 =?us-ascii?Q?nVdtn6j8hVpEAQm1IG9Us/rDeXFcZ/Rs8vUV1SUJfMQmmKE4SdVnxWNCGpHv?=
 =?us-ascii?Q?pnsTscvaKcKB0f6CUU2ccxG37J6CrFDRx0rdJvJQUcz0ID0Lvp+XEHZICrYK?=
 =?us-ascii?Q?qRFykVsqx7reEw4dD0fkyhJESusa1TNwZeSl2NUhm+e9Fk2MsxuYL3wdHRKh?=
 =?us-ascii?Q?iyliDWJZbDNtcJzhIKiFCCBQd7OEuicrCuzYk8/J+nGdsDT/W9GfDVYZVgKI?=
 =?us-ascii?Q?k2I/eh9tHAuWFNidc7lwKcATjPjbZOZCfrCgMV9O0UB3GOINEjhUUsf3aTZr?=
 =?us-ascii?Q?xb7jMXJm0a3F1fHRJ7Yee2of3uChqsRXxHkjQzmmaPS/S+eJqNvirO2jUmkT?=
 =?us-ascii?Q?q43zbX8nYuxYAI8OmSZRSfApyfdDqRzqk3GcvMYlCo6ko9v4RUQnzByT+g7y?=
 =?us-ascii?Q?uTAJbqCQXyiXBYqAElOJBV0AWWbC4fn2Z3MjlFANl5a23feAh4eId5LKqRco?=
 =?us-ascii?Q?XK6limSwBRd5Fwzb7vzlndOfVWKwipjL1zQigXIPXXgzUzcqWF6J/HxwhZMI?=
 =?us-ascii?Q?0X4+UICS2eZcdORFMQDc1/j0plmao1v3nJpnfbHr+0dW3Sj+bUxs3acIKT3v?=
 =?us-ascii?Q?IFgxpMR5M7GC3vLmxvQfV1EmOU0bVdixNx/Qm6eK8GS4yeQJVrytocoisYJO?=
 =?us-ascii?Q?rZrfB+RWSHwr+PY2mimOXwJOVTqTSdSa/VqzlDtd1n+N3Mm1j9jjA0HYsCPy?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4400597e-0f5f-49d1-db51-08dce6dddf23
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 14:39:38.7501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dK+CvOz2FgGujZEa28vyIH0XcX8pr7NtZdDMc9gTGdTwpdKGpfXloNbO6iTy+8VOq3lEzUB61Jlum+IttYpciUXvOkDO7qslYSp6fhBeuhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5971
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

On Mon, Oct 07, 2024 at 01:40:21PM +0200, Niklas Schnelle wrote:
>In a future patch HAS_IOPORT=n will disable inb()/outb() and friends at
>compile time. We thus need to add HAS_IOPORT as dependency for those
>drivers using them. In the bochs driver there is optional MMIO support
>detected at runtime, warn if this isn't taken when HAS_IOPORT is not
>defined.
>
>There is also a direct and hard coded use in cirrus.c which according to
>the comment is only necessary during resume.  Let's just skip this as
>for example s390 which doesn't have I/O port support also doesen't
>support suspend/resume.
>
>Co-developed-by: Arnd Bergmann <arnd@kernel.org>
>Signed-off-by: Arnd Bergmann <arnd@kernel.org>
>Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>---
> drivers/gpu/drm/gma500/Kconfig |  2 +-
> drivers/gpu/drm/qxl/Kconfig    |  1 +
> drivers/gpu/drm/tiny/bochs.c   | 17 +++++++++++++++++
> drivers/gpu/drm/tiny/cirrus.c  |  2 ++
> drivers/gpu/drm/xe/Kconfig     |  2 +-

as an example:
$ git grep -lw outb -- drivers/gpu/drm/
drivers/gpu/drm/gma500/cdv_device.c
drivers/gpu/drm/i915/display/intel_vga.c
drivers/gpu/drm/qxl/qxl_cmd.c
drivers/gpu/drm/qxl/qxl_irq.c
drivers/gpu/drm/tiny/bochs.c
drivers/gpu/drm/tiny/cirrus.c

you are adding the dependency on xe, but why are you keeping i915 out?
What approach did you use to determine the dependency?

Lucas De Marchi
