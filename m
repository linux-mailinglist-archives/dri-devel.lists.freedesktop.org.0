Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE76B585CF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 22:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D30B10E550;
	Mon, 15 Sep 2025 20:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8MbblxM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC2010E049;
 Mon, 15 Sep 2025 20:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757967308; x=1789503308;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IEy/6ruFcmknOfocE0f1TDE4mU32Vltl/dL0pNh2D/k=;
 b=A8MbblxM8lsZ9tgj8genR1V94g2pSDCxdDPiBNJybCanoxJhpS9a7B9/
 R8OlUHyvlKveG99fRw1ClH41kTQnE0V3w64hzHQWvWLakIz692hgRbDr5
 dbezmjp7MWwU0fZlMM6D8GaNjezJeUD+Ugdjq1lS3VsqUK1aRTnHbiCL8
 pb0Xrv4RiN8Z5EksduPZkh6oxvzelINok6w7gq7+bsS8j17LtUsX6F6uF
 58wO/tCi0z5H3WYujJ3SMTnSzIRlZiG8k+cdoKbVq0GK14sewnLVyXvnP
 uQWaFoscV+pZqssPdW/Ch98cYMu2/ZDiwMniX71hZ7J0tymMAkX5IFmrk g==;
X-CSE-ConnectionGUID: 8kfn8SdNRruYl7GWxSzo8Q==
X-CSE-MsgGUID: XPuIm9C7Szi2Ur8y6xVwaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60381706"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="60381706"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 13:15:07 -0700
X-CSE-ConnectionGUID: FSsEyURuTKu2lI8ncw7wvg==
X-CSE-MsgGUID: r308R/Z4R4+IknUg0bcjLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="173873791"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 13:15:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 13:15:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 13:15:06 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 13:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qshC2kuesaODU7mDEntBgkD9O8fnAlhIJdxjssSpUJ2dXjA+IaZqlcy7O5Wc1RapD1rmb3ALrsUAPXoPT+K4XSITDxIEqZptiZxvVALw8vH6znkAQYzlg3wKbgCGvyn2DMUqB1QfSI0PHjNah2o8DwRap8YBN5mfWkgDI0i/r3F2SklaheBKjFFKuHYTzSmPCKnkYobPXUNXuzyMiADdml4TzDVPuU2dVY8FLpkUPJlXd9i6wi4JLE0CS8dC1W7i51tu2zaxkrJYHJ1LO8G2j9vIeOOoEhGLoN7sUJ3dlNu+oqGjGk2Iso1O3M3+8xJDICv+8R4VVLk4nF1wjadDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+BNvpDiP8ypGtEhXHCaGu1QnVFjd42AjW/588lEosk=;
 b=j4BQPT75xAFRyuDOWXSCsx0DNASW2sjyTSsImx78tPg4hgKZpCwHQgPIi9MqxtXGPKlHv6+HeCpwUMABtQupPj1lXVQT88In3y4k3FqkibG90A5AzSofC/6dJ84Im/vH39yOq0WlVk+ezzjCCgGRnDqC2XvUHtBpe20VepUB4MOVj2AeujC7KIh+OaalTUe/T6v19jgWncg+6rJ7/RZYqG3/0iIlcBg9Os4FPW4GoL85P4v4aR7NpeTEZEaq6lLUUJWsLIV+nvkUWqgtPeTIi1sRUtV6ZH6sWbZr51KKX5k3fg05GlZq+qwEQFDpUjOa+o0CzdlqJkJd2atIeY4rVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPFE26A71A1E.namprd11.prod.outlook.com (2603:10b6:518:1::d58)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 20:15:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 20:15:04 +0000
Date: Mon, 15 Sep 2025 16:14:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "=?utf-8?Q?Micha=C5=82?=
 Winiarski" <michal.winiarski@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>, David Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, ?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Michael J . Ruhl" <mjruhl@habana.ai>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 09/11] drm/xe/vram: Use pci_rebar_get_max_size()
Message-ID: <aMhzwm_66EOOvtmv@intel.com>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-10-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915091358.9203-10-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0045.namprd11.prod.outlook.com
 (2603:10b6:a03:80::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH3PPFE26A71A1E:EE_
X-MS-Office365-Filtering-Correlation-Id: 736e9340-fff4-4407-b7db-08ddf4948e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LSl58aotOSoAH41ixB5yyu4pzvemhBtGQXt3igaG1g4J1aSkCqhfgtnYwq?=
 =?iso-8859-1?Q?dOY2As5OqX25tahKR+9JDxbRGw+scNXP+QBFe7yeZMxYLacbnbL4tQuIU8?=
 =?iso-8859-1?Q?VUr2j8L5BPg01KLv2tzpyHAPQVWRvf7dKmdnZ3zaGD70o8Ch9/WlHsUgA1?=
 =?iso-8859-1?Q?Af8XTsLzuHHhCcAMOhTrgQs90bsV0SDfncZFxq89mJmY2DfCX9ZTl7Yrjm?=
 =?iso-8859-1?Q?qv3ic07MhVHcQGKOi/Bh+K9EhsBMgyG+kcad9Tz58mcWk8cP9YxCHmId3x?=
 =?iso-8859-1?Q?koWypwnt8wmL/VTPT63ae59pg1co3EGVEEzNrPg5IRiL8aRajRrNpE7R1y?=
 =?iso-8859-1?Q?JxwQ3XHc6Lx0xmi8d7VibzX4nZH1fYo9jVKPQFbXgeINeyG/gGTv6r6zLI?=
 =?iso-8859-1?Q?IFiYbe5ibOGluuG+XB2/Dnmx/3KWCGU8aJPfSgFDa++AXxzOag8KAVC81T?=
 =?iso-8859-1?Q?QT8nH2rtXTaTAfeQ9COwP/44tEuGme+2RmYLgc7ZIRQb2ij6Oyanco/iN6?=
 =?iso-8859-1?Q?BCzf1beCbpNa2w9G/tgDn1NVQm2kK35uc7LR9xMWzBp3mMfp2c3sG3zyQn?=
 =?iso-8859-1?Q?MGJTE+WSCG7i3Ax7TW3H6rFphjlP+XWfIvxN7HZIvwEaq30uSMOIb3pQeb?=
 =?iso-8859-1?Q?1BJdkXyL7/vZfFyD7O7/54GXEf0vtEbJIDbVC/Xz014584zykYQ3NjQjaF?=
 =?iso-8859-1?Q?hHXxed1rHzH9y6joP1nFLa3DSchDHaaLRDQJ4C93Yxe5NTnuzHQszPu2Fm?=
 =?iso-8859-1?Q?zjW/p1w6/TpVlbnbL+sEWRY9hlQV7Q7kBOIkiOjN9Af7l54DRtzd12iXK/?=
 =?iso-8859-1?Q?5v9j0nwGzdxgoZAbpJTsFGaaAo6IaPOtRrLAKF0WXo1liBfP/E50NCaZxZ?=
 =?iso-8859-1?Q?mBLklU6MPykEW0IZm4xZkN+RzOIM6wQ+CDNQ3NBL3MhBDSuvLDZKnBeUbq?=
 =?iso-8859-1?Q?Pf4fER8vOXIte/pLD+L6Pk4zVMI5GLnheXacaQHESkwwcCV5SSeweJroJW?=
 =?iso-8859-1?Q?rmZcKMwrEYi2QSWqjPfr0VEt24ErgUZR7RHeLx/kQtZ1VSyz2MlwBB6Bgu?=
 =?iso-8859-1?Q?nLamq/2H8MSNZbVCXH17kX6ckWadoClG4OGsesyGSSopmH5dkU1Nmsa3Bx?=
 =?iso-8859-1?Q?X/PRr/0tvh4bVt9K5LW5U6x+ug789Je4arw/ftZ/1/ZHAOLE6lf/yifo72?=
 =?iso-8859-1?Q?A8jTBhgs8n3jh4DtkAS93753RLrmnZwGqWTYNQANIH808/AC5M6Qa2F3dy?=
 =?iso-8859-1?Q?cySSZlAurF53ZkmHwzBldNaVfiLdpGphjua7z1BWsrHd46odz37KGREfm5?=
 =?iso-8859-1?Q?XAJmkUzFKh2RLllhSkIwlF/+BM4CSN6x/IrlFer1IUFRFkGcz+EijFD/dp?=
 =?iso-8859-1?Q?DZ3e0hgdOFEZbSKiPgkICaAkXZxm+BCi8J4ZZUBzHwmwCyyzDz2Z2S0h5X?=
 =?iso-8859-1?Q?dxYKe5Lk5Qcz7gJxBXAJ7X7Xlx9P4tnkojeXd+rX4E0Ixybvj8N0W9XCTr?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VDaslYfVo/RhmEq72XbfGWQLbWgftCLbDDU6p5VLF+GY8zYUK/3yG5hkOX?=
 =?iso-8859-1?Q?5QuMn4Nz5omoMkv8QLS+QjG4N4dIzATvuqd8+ReGXS15tDtK6D6ITK0USO?=
 =?iso-8859-1?Q?teLfc+pDGhIF1d97aMVpOABiMYfxoIujmgFiBBDP7ELfalOSe4+aEB+P+k?=
 =?iso-8859-1?Q?lCqMHjBxgNbZKdRhzPP5GGVsxrW60FF4Gw1og1NAXoxvB3w3as2VoAQnNb?=
 =?iso-8859-1?Q?X11/XTRB36PF0kc+Eof+gqTFXTzqOSpnL8HcE/I2HL4wongjzHaxGU9ngw?=
 =?iso-8859-1?Q?FnnSbC6Jn6cr7JWv4qMzc0MDrY+3cWQc66S9SHGJwlSpDf6zKiwX1wLkWo?=
 =?iso-8859-1?Q?4+5qHk/23+acoUS3fecRR30fsLX0C9kgXN0e4KISuPC/mrB3bkYMTjlKky?=
 =?iso-8859-1?Q?vEmsoGTkijf+Dz6s2q5fsKZXf2+VGmuFWQZrEEWHmqTKPstSZqhENGMvnY?=
 =?iso-8859-1?Q?djTtfMX+TNr4d9O6pcoYJq6s85i2w7rOstU2cCKY6x6rnTJ1Sc7ENvOD6s?=
 =?iso-8859-1?Q?fQP5Pys74Wm32x2THsBJnwodKqpEXP6mKAev6jez3WgmuJTr+4OFlaQYZF?=
 =?iso-8859-1?Q?5xrHq3YFVjuMicfXBs3tinjbncJjCXko2okOfm/d3BLiWsoj9xoOLbdAde?=
 =?iso-8859-1?Q?Ag1YUAK9z8WXKAaGLGdn8FteZZHItoOanuwdIo4HG5qpsn5C8cC/+WemWy?=
 =?iso-8859-1?Q?yaUzp9aXgHrG7PF12TZlb9TLiCPe909iL1O78pK9mxrm1MKv5pu6BOvUjZ?=
 =?iso-8859-1?Q?WFXRorafPc8VI9E/QXXnx4CinZTWPrYPCUz2nl1w1AW7D/ek+i8Y6XkOd9?=
 =?iso-8859-1?Q?DTYBdIMcuRl7FRw+WbKqsUQkvNcDAWEh+V+b+aXUrZnFxf+VgoRpvUK1uy?=
 =?iso-8859-1?Q?7RwymYd4o++IkazR71k4jV24MBJcsqug3VEoY7T6dMQ6asakVpwxqvR/gl?=
 =?iso-8859-1?Q?Ty5efSK8r35lcJrR93ablRWudGMqW3dKJqjQqTTQhawT2994HWH3KMsfFR?=
 =?iso-8859-1?Q?4oKmWShPw1kQdrc32GO0kfycJxrGK2uFcQvkjmyuHSH0LnKUYskZZr27fS?=
 =?iso-8859-1?Q?drgM5cMhdxOSUESdoyI1aDsBnnDGT4+IOWL23QnhyReXDQaMbbCl6irWVr?=
 =?iso-8859-1?Q?s6jWtxzKKyGcqPZmlNzbJeRIytek0O4EC5vndoHV7RfhDnG7rWKxdEm800?=
 =?iso-8859-1?Q?/606Pu19h5tXxbEiVwS59rqt4p1CmhZZOekrf6S4njJQcKLY+eek6PdUcC?=
 =?iso-8859-1?Q?UWlO789kDccn8ejaHfr2OzDfHEcVB7iEVH6KEpj9OF5K26bvp2hnQE2fT7?=
 =?iso-8859-1?Q?xBBqPeGcMK/aNwC5ZqAtXn9vZ1eKRN5WQE8YvDQr9OLJrSmn1ehCfcRkM7?=
 =?iso-8859-1?Q?ghtHOqP7xiNYuDwQ/u6qMQg5rGXqnhKlglS2ofE/WpH2xszAT/DLeFeZMK?=
 =?iso-8859-1?Q?7WqUrtdiZ1NEvyXZcCeBTKlhHdR3aTjlvnIZE7CCQnocMgepEuUGnMCGAP?=
 =?iso-8859-1?Q?nAi+YhHFlG5VAMP7qBSpWzMphxlQJ7dDVpyKhrAahnRdcWu8rpjU9+dxlC?=
 =?iso-8859-1?Q?JVOJrXUGDy4q+I06mO22wMAt9E7dGfvafwMWN6ZfZJuBE5XJtWkrQblcD4?=
 =?iso-8859-1?Q?tI3499O54Kj4dymsx+thl2QksVSLAk3S6x6/tekA2tjX7xwkwC6OJlNQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 736e9340-fff4-4407-b7db-08ddf4948e66
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 20:15:04.0510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /m4uEt+qDz9EmEDMnPctsaGXV7hHmky1oyXhaCFCoM1Z+sISmVAXO4k8ZiuXfhM1wDDOmXVPnxvp6d7WSvnuYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE26A71A1E
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

On Mon, Sep 15, 2025 at 12:13:56PM +0300, Ilpo Järvinen wrote:
> Use pci_rebar_get_max_size() from PCI core in resize_vram_bar() to
> simplify code.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Acked-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/xe/xe_vram.c | 15 +++++++--------


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

to get this patch merged through any other tree

>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index d4fbd7f74255..ca02744fb369 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -54,16 +54,11 @@ static void resize_vram_bar(struct xe_device *xe)
>  	resource_size_t current_size;
>  	resource_size_t rebar_size;
>  	struct resource *root_res;
> -	u32 bar_size_mask;
> +	int max_size, i;
>  	u32 pci_cmd;
> -	int i;
>  
>  	/* gather some relevant info */
>  	current_size = pci_resource_len(pdev, LMEM_BAR);
> -	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
> -
> -	if (!bar_size_mask)
> -		return;
>  
>  	if (force_vram_bar_size < 0)
>  		return;
> @@ -77,7 +72,8 @@ static void resize_vram_bar(struct xe_device *xe)
>  			drm_info(&xe->drm,
>  				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
>  				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
> -				 bar_size_mask, (u64)current_size >> 20);
> +				 pci_rebar_get_possible_sizes(pdev, LMEM_BAR),
> +				 (u64)current_size >> 20);
>  			return;
>  		}
>  
> @@ -85,7 +81,10 @@ static void resize_vram_bar(struct xe_device *xe)
>  		if (rebar_size == current_size)
>  			return;
>  	} else {
> -		rebar_size = pci_rebar_size_to_bytes(__fls(bar_size_mask));
> +		max_size = pci_rebar_get_max_size(pdev, LMEM_BAR);
> +		if (max_size < 0)
> +			return;
> +		rebar_size = pci_rebar_size_to_bytes(max_size);
>  
>  		/* only resize if larger than current */
>  		if (rebar_size <= current_size)
> -- 
> 2.39.5
> 
