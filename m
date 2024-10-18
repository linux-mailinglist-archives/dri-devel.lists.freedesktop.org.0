Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F92A9A41CF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 16:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9665D10E957;
	Fri, 18 Oct 2024 14:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvauidlh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C8B10E94A;
 Fri, 18 Oct 2024 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729263410; x=1760799410;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8pJJlFW1hSBCtZVnqsDyocpcshYFjOVNNrRYxOFD61A=;
 b=lvauidlh2LkNE4qY4yrtsVgDduE56JvcBmtMdc4Xv0Jv+ogk9VcDEv6Y
 Szz+DQ8LtZrrPCdr8yh0tVxFxf17l/ejpM2UGkDnQcAQ6dSygDTwx+D2T
 5y8xiWeWT3TWRmUt7l4+NY418d9meXxAo8rojh6Cv2a4b38yhC4n2XwRT
 goHlZQTX7K9kyny0EiJ9wvm5A6L6SrriangaQyPfMhq5WCQp3hsnnhfht
 cCLMt3q72OENtkUtPeH5C7iwyin6fHwX7CJBkb3+z8TyI9RnmTG7Yt6q/
 5eciStRJqCEnOIy7nzI3rNWsK+eNND46EoGx53w1lvzIPQlEblY31EzGF g==;
X-CSE-ConnectionGUID: QBM/G6gjQpGkyRV+fRW8og==
X-CSE-MsgGUID: aku8H+PtS8287OW6UZoZqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28955439"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28955439"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 07:56:50 -0700
X-CSE-ConnectionGUID: o8KcLbm6TyunkOhcT1yfZA==
X-CSE-MsgGUID: EKxNMsz1Qg+pPcQ4Rty4mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="78939132"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 07:56:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 07:56:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 07:56:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 07:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtCwg9XK46asb7jbBxSedXC19VhJH1Ji9DmCn5ofgYtQZgcENPjATvM/qExlWTbSVwgp9Qd+A7AEdUnUqwJ01VbSAf/KjZMXkzd+Z8yARzUkdMq4iKKxzXH+UZpHlfw3l/wYFXqMI/g4fCNeJU/ujOdYzkjKVXMhSre1iTo4nPydP/aKx4o36iqvi8Sy4eSMK6E3Iyy9iAREJ/cCXao2yj2wcXqrY6eA6i8GegeneA2Lrtht3Kj6lF+A2TlyAhyJDBHSyhTCTdZRr8QRSn5rcywPfggYYte75FICaJ+JvpftK+NYz7uOAETeNTQhneSYm4v34Y6EsgxAwY0OV4P9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrY5nYVp47K3YxZhhn1/0pqe/WVsmeZ6NmqFgHr5zMY=;
 b=BO0s3ge8pYJZn5OM5yHJ71DnAQA4WA8/FzUtwcd1Q6MVFIpUCC3Z0KZIbnwyeWfQtHVbKPzHmsWS/U7gWFIONJKy5rqm0S5sf1ZParS1UkjzRaH72trpZFAzBJ2XYE67bt7kCEPC5ObesacgK1sXUfA+tm2ZHhNxmlaU24Q/rELydxFHS1uNSr2qBazdj7WNZ5s7pSakJbhBJZgIsrzA9bIGncTtSY2/DqjJegWLpD44IeHuCTlSxdSztSeK3NIp0BunAEsJ+XzeGl1MoYQDnygFVELAaBo+eZYdJjuo70lCEygVgG9CqsrPmpGPcz996xKdBUvHDSjrDtr++HErgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Fri, 18 Oct
 2024 14:56:45 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 14:56:45 +0000
Date: Fri, 18 Oct 2024 10:56:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <thomas.hellstrom@linux.intel.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <lucas.demarchi@intel.com>, <tursulin@ursulin.net>,
 <francois.dugast@intel.com>, <jani.nikula@linux.intel.com>,
 <airlied@gmail.com>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <andi.shyti@linux.intel.com>,
 <matthew.d.roper@intel.com>, <andriy.shevchenko@linux.intel.com>,
 <lina@asahilina.net>, <kernel-dev@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZxJ3DJWY9Lsc9Mn4@intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ed8cb1e9-df05-44a7-9088-90b3ee8dce85@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed8cb1e9-df05-44a7-9088-90b3ee8dce85@igalia.com>
X-ClientProxiedBy: MW4PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:303:8f::35) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: 645f0193-4c11-490b-e4af-08dcef851556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FCMaIJ80iW1K5y1+8bpP5esyUW3Pg6tuo2QQUbU24I40M0uYTtgaOkqP6+?=
 =?iso-8859-1?Q?rf/hHobl7O08fqlIhAZVCfGEAzWyD9JOJHeYN5mPybUU2ujfaPivTw2Ib3?=
 =?iso-8859-1?Q?3nKvomvEK8KjRuza/OSMjdo53Y3lqFJS0ZqPu2BFEx+/Kjp6KrBo4Vnu/K?=
 =?iso-8859-1?Q?XaOsAvY9/oEWMZfdDkfNBQHs+Do8rTHFcd7LAahSuUliIt/7WVBrS8kjKT?=
 =?iso-8859-1?Q?nieutm5WT1Q2DDW0Adk8eeP8JHOiecRN+/PAebkyJN1yMD+YmqFHwfSK90?=
 =?iso-8859-1?Q?ONXod58A80coVMXdkryBBXX/48jECSnTY//dfenv+G3D5MGfNcpLy6ZTgW?=
 =?iso-8859-1?Q?/JU1FSGZATKqUTxlMieekEl6aCbALWGJPTgs+wkZLKuRXuJA46Y85JQKtA?=
 =?iso-8859-1?Q?10FUONEMNI7QSJGBVrmcPgoa8q6PYpzHf1wmnO1MD6yyv1FuKuBi6pkhZB?=
 =?iso-8859-1?Q?sRmM4BzkmWY+2/ihTWkjOPxH39BvzxtY9acVgFpq5KPV8DyzJK4F/BRJ77?=
 =?iso-8859-1?Q?gm7fThK3FwiYeOrV32cRDsDEfDN4Z97E/9YZg1Y8h3/SBewUPWVEeifQEz?=
 =?iso-8859-1?Q?ioDqgQTBzQIX0wmNjBAbsOLsM9xgv8aBguIkyclzuBZWfyLuYlnrFN4OZ5?=
 =?iso-8859-1?Q?4xyoHbmOcS43Mw5tD8iMzxaqGvzHqEuSSHocC1tiAIbXxBYKrrztcJtrg6?=
 =?iso-8859-1?Q?naUgZU3oYs4SHpNiowMlFfx8RJkT99ScCMIQmd/GpcMpN2HOElNpOnP6kQ?=
 =?iso-8859-1?Q?wFyQSsuDpY1jM7mwvrQKI17ggo6IWpmaVc7+MU1YhcnM2pSX9nP1fa4Ktg?=
 =?iso-8859-1?Q?2IZSAUpNAhG88To1sIL8i35SGq1W65Ru+8lLsGrD8aMuhNh+uOWPN/q1mr?=
 =?iso-8859-1?Q?3gNmBt0GTxAI/e/q2sNGSO15yovspnJqGt9EsEBHJqOo1c9j8otr8iK2+O?=
 =?iso-8859-1?Q?mhyrEd+/n7Vr01oI8P8n6yIUvlTv//dIclGB/EWra5xX3XuO45DzFBjesS?=
 =?iso-8859-1?Q?fTKKKjEj42fHRG0fbMzDK2fVWo22OyP9xE8JLEQXgfZAXmMoP6BEo4Xep2?=
 =?iso-8859-1?Q?YiXUyra74Eh6tn6iw1itpEg1p7Xicyx/Il0boUahVvdYVfI2UI01QD+PjO?=
 =?iso-8859-1?Q?mJPUg24fgUBRWyLtFn6+ctZwbaxq1JfcaFOgwtnzuKmhVaHOkjfyVEgCzj?=
 =?iso-8859-1?Q?uiuEyClQ+Exsze3GMZIau+LX80EcbPucYnHNUuaOUqJosQ+lQEytBUVzeX?=
 =?iso-8859-1?Q?dCg0tsjP4kHgKKweyREzkVYRCbdVv/JcTZ8SUmu3WXp8011NpfJ6U0yGnc?=
 =?iso-8859-1?Q?QGbL8d0oYEyC7TAP41yb05jFmkT+CAUpTOwQx0Wgw5ExB6mIRXigr8ctUS?=
 =?iso-8859-1?Q?NZdCStpaoB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?slPN+V7EcSDOpfxGKWJu9c+E5u03TJAv+GXh2Tbyc3eQa3q1bexU9El+59?=
 =?iso-8859-1?Q?FYtcpr1UjXYpWnQPiAL0eSQNyyXjsQ/VRLdmxVyHMvPTybejSe2n4XPLpF?=
 =?iso-8859-1?Q?PhY5Ak/ELK2yZ21NtlvyQYUMy1owp7syZzthZprslV5Mne5AbSTFLR/lor?=
 =?iso-8859-1?Q?pI5na/8SPBAbszZ8ReXTbkMBYTwZObFQHrQaWHD7SieGxdyEoVgXoi1E1/?=
 =?iso-8859-1?Q?t/hi8SpPoxUduTJePt/8P6wEgyPIRgZKN0xcdYpZ8vGn90URPySgtJ2UHV?=
 =?iso-8859-1?Q?5yLz5zr/BbKVUlWu63jszxSL0xWDItBbShbDsKmn3gda9cbY8sWMcpUKzK?=
 =?iso-8859-1?Q?a3qeQNIoct0Fh0mmUy2lc0i0q9tHFnYH+m8js2r8/8CK/hNrit2sRP13w6?=
 =?iso-8859-1?Q?PKy40kioHXNHmtMmt/reG4bE8U1NPnb4RXCcvqTv8S1ZCC4bu3ohLbJUGP?=
 =?iso-8859-1?Q?x3sCz0fQiT80PEGVPUM+mSs8YFAD1laAfkVkOKRXqJLoE1SYswZccAGq6q?=
 =?iso-8859-1?Q?BcucCHWHtAxSTwuVYK4mPdz3FfgpP08m1p1l9gtKeJwjVWsmNQ+uT9ewp7?=
 =?iso-8859-1?Q?K5cA4hPTvnKMCYyJ9k7AKeg5V+qd7rKWUwAtAud1a52YywRXTL4qwDG1Ve?=
 =?iso-8859-1?Q?4FjJEyR+BmMsIWrdwmDhyhPs67XQOpxKzXaFlzDREhPig70e7439FG4Hdi?=
 =?iso-8859-1?Q?8P0vq32V97zTubItMib2HFJ92SP7ixptLRg/V9BOmARf6PAXVSlxDelNNb?=
 =?iso-8859-1?Q?/CB8jpvjAcUjKxHCvDCnuVfvCi2hkz+qtRdWlcIi1QEUF9ce9+BMcwhyls?=
 =?iso-8859-1?Q?geD8XJexB6aB/VuI4DJjiqEXk0bFKydD3uue92/hVtnKZIlNVCThhoO+Gf?=
 =?iso-8859-1?Q?sxl/4MunoOfVSFHAy7Nv8JoecoaCngp4HqSEdIonzjTNGA6AzlFrolrvCw?=
 =?iso-8859-1?Q?3c1+lSPG5qTdBZ2rd21vO8wgS9JdGGg+EGr6InHS45k2iUuVZhgLVhoHbi?=
 =?iso-8859-1?Q?4n1iIKXyuUHWkvbXyjkeAtQzJxA6LnM8QgtaslUE1oKVYmKFReeS2Xwxm7?=
 =?iso-8859-1?Q?RaorHcF2CHqQSG0GKvPnxYzfiQkt7gTxeJjPgRpQHAHX5UNixazftz1BCX?=
 =?iso-8859-1?Q?6FvV3YHyQORPXBTm+Ylk0ozK1i2F+Yq/n+peE6SKkgazR0BmFXNX0GR6qZ?=
 =?iso-8859-1?Q?1RTj7soJyqqF+iPWmpqGf9vg53rtpLobTi7mPouCWh/xFbIb6iljF/QNj6?=
 =?iso-8859-1?Q?d/JZCCkkMom2LUnaZL0qBGD92fqAB4jqBtTdSPx7NFxiia/q6Vj1FijVT1?=
 =?iso-8859-1?Q?flvKHnHlvrJl9RMCklQLmT0YV/lAbqvZzpiB6OVxJiSczpTys93RHAl/94?=
 =?iso-8859-1?Q?x7RWOfcz4wgEbqu5pc2ryeiVOn8Nk7Q2prcBWi8tpDntfqRpVsWoJA/ipe?=
 =?iso-8859-1?Q?FSGSzxZEtCjAB3XxvKH+megUrxD71L5vwhZAlgQnAxOCHGEf/5rwqiq/Yz?=
 =?iso-8859-1?Q?nc9xOJoHOFt7pM4pH0T8/464fzI2tHEpy8iVUUuZRXRu79P60EU4g/6J8h?=
 =?iso-8859-1?Q?75SKXsd1oUCR9n4HtW/jy15LFmPCu/eN9qoBoXQ68gC+SSJ1ezPdmdW0rd?=
 =?iso-8859-1?Q?MfYCZgg+DNQiYbJh0R34Y9QdOoFTXozAuhg0t3PQKxGkQ5J//801/o5g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 645f0193-4c11-490b-e4af-08dcef851556
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 14:56:45.3528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygeufVOJo5MgL6NMkiFzahCsj2NmWDXsr82ighIHew3aO9VAANbBzn6fIQUWU/dPTbxa7aKHB+8Yl5mm+druMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
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

On Thu, Oct 17, 2024 at 04:16:09PM -0300, André Almeida wrote:
> Hi Raag,
> 
> Em 30/09/2024 04:38, Raag Jadav escreveu:
> > Introduce device wedged event, which will notify userspace of wedged
> > (hanged/unusable) state of the DRM device through a uevent. This is
> > useful especially in cases where the device is no longer operating as
> > expected even after a hardware reset and has become unrecoverable from
> > driver context.
> > 
> > Purpose of this implementation is to provide drivers a generic way to
> > recover with the help of userspace intervention. Different drivers may
> > have different ideas of a "wedged device" depending on their hardware
> > implementation, and hence the vendor agnostic nature of the event.
> > It is up to the drivers to decide when they see the need for recovery
> > and how they want to recover from the available methods.
> > 
> > Current implementation defines three recovery methods, out of which,
> > drivers can choose to support any one or multiple of them. Preferred
> > recovery method will be sent in the uevent environment as WEDGED=<method>.
> > Userspace consumers (sysadmin) can define udev rules to parse this event
> > and take respective action to recover the device.
> > 
> >      =============== ==================================
> >      Recovery method Consumer expectations
> >      =============== ==================================
> >      rebind          unbind + rebind driver
> >      bus-reset       unbind + reset bus device + rebind
> >      reboot          reboot system
> >      =============== ==================================
> > 
> > 
> 
> I proposed something similar in the past: https://lore.kernel.org/dri-devel/20221125175203.52481-1-andrealmeid@igalia.com/
> 
> The motivation was that amdgpu was getting stuck after every GPU reset, and
> there was just a black screen. The uevent would then trigger a daemon to
> reset the compositor and getting things back together. As you can see in my
> thread, the feature was blocked in favor of getting better overall GPU reset
> from the kernel side.
> 
> Which kind of scenarios are making i915/xe the need to have userspace
> involvement? I tested a bunch of resets in i915 but never managed to get the
> driver stuck.

2 scenarios:

1. Multiple levels of reset has failed and device was declared wedged. This is
rare indeed as the resets improved a lot.
2. Debug case. We can boot the driver with option to declare device wedged at
any timeout, so the device can be debugged.

> 
> For the bus-reset, amdgpu does that too, but it doesn't require userspace
> intervention.

How do you trigger that?
