Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF59C11F9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 23:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3455E10E228;
	Thu,  7 Nov 2024 22:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PO5DfP04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BA810E228;
 Thu,  7 Nov 2024 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731019790; x=1762555790;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fDoCUSwlgqNKLc/HK54eDGvKp7QYSr+P1x/nWnGoeus=;
 b=PO5DfP043dg+nvMjQRej8xu9S1WlsFtExSEmQ/AZ/HKK8JEatosuu7O2
 Xmya+ON9ywnEQ4ocemU+XY794Jmjjv/EcnmwuLeprs0UdG5LbcW3FxU3H
 jraAi8fCg3EGOTUY4fAC16nWxx+1PiB+ih3MElFNN7/UZp20meY35yTqV
 X8gjzzAN+ugnSGB1G8b5zmi2L3lkpWIik7M/bvc0K/wfyZJjeCEyrh3qd
 m0Fb7/jI17Ed0flpFI3WqAVgnc0wZPmljMZfbjamHJK++MI3x3bKZbgNE
 pkf3KKIu/fZIQOBJSCPkkp3sKFTKkMXPINRayROQYKroqrTZ36xy50A6o w==;
X-CSE-ConnectionGUID: MvKzCIXvTP6eEE5H+UuTvg==
X-CSE-MsgGUID: 1FCX9bfwS3Cr8DRE9FHB+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31050756"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31050756"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:49:46 -0800
X-CSE-ConnectionGUID: q1gH6pcPTHmVVb8fde8a1g==
X-CSE-MsgGUID: OnCygkFESTyfjwQWMeS5bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="84883270"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 14:49:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 14:49:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 14:49:44 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 14:49:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2PoKMY783Whh3IcMVT/IZixoHk3rONwnndA2Yp7aiNGO04ohNy2tlsBgWJEOg8q+ybCaP/owuJ6mToi+/uYRm3zuX+M9l6rEn/sRORUl+8PLRaI4cVbn3l2brfoTZ9nJk1A1l1PEWyLj9ITWRnKB3CLfMMGCeM68FKEOXOg5oPCalsBpv9+uWaKAvj7nxvsB0qYknTe1tPqLZRDNUMm2u7G4vNSbhvcbxfMJcLKhhNOJV+SdXKQEwXJj0/ALyJH2AQPzxXHsFH7BC1u5w+Z10FEk57TPvrs5M7CQtadwiH9KYHz6rxNVj9i7qe64H7l26tLDFkOwxKuVxj1CPTQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58OzcucVp/kHOjZiyKhE4iuGVJMucx3zZFStvwnq0tI=;
 b=ERPtSwWzPIQ2URABzUCFqh36j0e8omttGsA4dxWsOGr5g2Y5h22hqi5zzQ3132RxnR153m2uJj7tR/xku7kAZWtKFxbFrp8O8vfeNCumfjkJOvJoE3IZaMDKGKVzwY5HE9zLyNaORtUrvR79mGpBYWKEzmqBLAT2AEvSI9fYpYEPJ9axOMnqk3L6sY5Uv3gF1q9WQPPtOPgwGkyDiUPr6CmJSghYyzrpNeOspUquNyFs5qBAHvHoZkSi4nVPKDzChxLpJRBe82pxrhfYJaxD/W5cStWQVrmXz1NL6f/VHL6xguDHFNVusYpV77HRSu68/4mnsVn5dYwPUXdKWQs8Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB8202.namprd11.prod.outlook.com (2603:10b6:8:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 22:49:42 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 7 Nov 2024
 22:49:42 +0000
Date: Thu, 7 Nov 2024 17:49:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/10] mtd: intel-dg: wake card on operations
Message-ID: <Zy1EAIPEaY8Wlh-h@intel.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-7-alexander.usyskin@intel.com>
 <Zx-mPQSHXv5Teq_j@intel.com>
 <CY5PR11MB621157335FFB1089F49CEF8B954A2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CY5PR11MB6366EF9CA6552ADF6E01A557ED4B2@CY5PR11MB6366.namprd11.prod.outlook.com>
 <Zyk5kueKlusKlwqM@intel.com>
 <CY5PR11MB636622B23A3646D58A70A920ED522@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY5PR11MB636622B23A3646D58A70A920ED522@CY5PR11MB6366.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0289.namprd04.prod.outlook.com
 (2603:10b6:303:89::24) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 48090505-e6d4-46c5-ecf3-08dcff7e77d9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?UAKxrfNxLz1MufIrSLw16GLMdpWLZNrDJ5w+S2JyomW/jbt5pl1gHb20Vp?=
 =?iso-8859-1?Q?gYhYOsyU6bii9wyOvMsaE5QYoNhU1HKhohpPS3AnVkVPRjSmf3+ha1D7fI?=
 =?iso-8859-1?Q?OlGN1mmpqQzaftOIWepprR/DjEYnrsVNY+BH67/phESgz59a0lmLEbYYKo?=
 =?iso-8859-1?Q?MQsvA6qChPVTsmqikA7BSu9byomv+lYcv5DSjVzZ2m0XQgbabErK6uwWuX?=
 =?iso-8859-1?Q?ZZKYfCMIrO+B/NYHSRKopGnTEW/SrajepTwqejVMbDQ8AARbrnz881xtxt?=
 =?iso-8859-1?Q?Z5I2uKTG2XT1ys5PiHyF3LRXjPG2RXKbsuQ9iU8qhHdFbo33evR1ISvOmk?=
 =?iso-8859-1?Q?ZEDzUl6hu5bRO31JdOTsTPdOW26MaOxyZj5HOo9Jv10lNNeCteC71yEEjF?=
 =?iso-8859-1?Q?VKJmkwIzPLzXs3aJDI0DUwB2WfR12EEbTCBn44jTY1psDvr+X3CLNn0hGn?=
 =?iso-8859-1?Q?HSaAX/O/qvOUIsySr+y1mkzq7da66H9bNh6oDIh+kIYVaJmDg5V3Y+lT6H?=
 =?iso-8859-1?Q?U5cXkPf5YTiDSPAvbqCAHY3x3NZn3K2VQgBiz7lQmGFfsLO2PTZM01mwxh?=
 =?iso-8859-1?Q?WHK8dGW9HmQKSaGg4mBivHNCOeXuFmx+pnBcZfkKfeGmpwenorGHG4dP3/?=
 =?iso-8859-1?Q?BSp4DumzvA8JVymXxUfm08kMW/vDI7hyDs3dwiu7d0fnkAYYp4anHKK8JE?=
 =?iso-8859-1?Q?tZh+aK0HaRSeAWuNn1D23HHUrNwJnNJjLGZgSR6i43FyYnOl4dMw3AmDZ7?=
 =?iso-8859-1?Q?kMahqM/oALkppgU81Y/eDOCbuq4xHw97FYV+4SVotxMU9Cy2dtGSxCboi7?=
 =?iso-8859-1?Q?S6mETIm+OCgsj5lEWqrZEROlefBbdAdT9U8GO+AniKUm0PJx32HPfmzXNj?=
 =?iso-8859-1?Q?ox5T1Azum65a7p/IEZBPm/BxjVTP41SK8rjNSNAG+IiJhM9H9PNH/z1fP2?=
 =?iso-8859-1?Q?2gusjDGuuEJNGDe/qnYZbx5/PtEFLIJeJRvih2MvbujIsguVmHOTcW9FcQ?=
 =?iso-8859-1?Q?+nscnMTWt4khC01395ehzuguVTOo5rzJWMw/acAZBK7RXi4xR9WCbXe88M?=
 =?iso-8859-1?Q?znlfsv14XlCAYv2S61ZQFX0JKn9szXC9jfbPvTZlbQtIGvvcFMgPgwc28v?=
 =?iso-8859-1?Q?z6RmAJ3+aFhQkskJRMHqpuOatFAzswPpQ2I8SBeWX4bcM9h3YsePhM4MtQ?=
 =?iso-8859-1?Q?TC8AKBo7NQfZcfmRkZGMH56gTjE5iUgZBu4mofS/C7IhdohJDXcJu65e+M?=
 =?iso-8859-1?Q?h9P+jatmQeZZYiq7lUrdFrtX8ihqPcdQBZamfW+m++o5s4qO5RxV+xGPnQ?=
 =?iso-8859-1?Q?wpw5b34zx4+0q4mfbJidGu9TVj1ze9+hYhby4fLn1x2ENluM5eGXsWrKSo?=
 =?iso-8859-1?Q?OQUQFsHgNm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?L2/5NBlx5pP1/9FQAGy9RGBz2jjByLd/jXUdK+/NjnDnbVHwXkSmEVtGKa?=
 =?iso-8859-1?Q?6Sq1uFV9hoaBk38caui5+KNVUpbMODy9N6dYVrcDBsrLuwQXTGKDsch2lJ?=
 =?iso-8859-1?Q?LkW1EKriKIKSe0Z3oldgRxvvia/olo9qF8w8Q09Uu1C+nyotIBT/Ry/7AI?=
 =?iso-8859-1?Q?/WVXjf4o6xJkZEvy9t2BRFrW31bK6NT6CjCX2nwfhp81N+SJkoMSWPrD8E?=
 =?iso-8859-1?Q?XWtgZisVx9zTcchTvGhtMlEGkzFMTrJh14Lg5/7mBeDcqMoxd+QP4Inly+?=
 =?iso-8859-1?Q?ZTF3VxUFZZwVbdPWNoM/nFuPVCkR+69ejU+wfDdXzG+RDTjOfDnASyuh8F?=
 =?iso-8859-1?Q?d+dQ4Q1FgzkbNY57Eevk208T+wq27KEKTOPst48B4sjL0beXAkb8hYhIKV?=
 =?iso-8859-1?Q?/orUjkE5JyULSyuWTOVtlWABNvJk8d4oEZvrrboKN/S/e/VgNXDZmIOFvy?=
 =?iso-8859-1?Q?XyvcT2M+0PH06f8p0WNxZmjQdJU8X4/lCWXjkpqSMoGmAgM0/x4cL5Q/e0?=
 =?iso-8859-1?Q?Rx9ChH1nih25jRiFTR+jxhoDv1EdnvSxcD7J78garGS27A8jiy8id5+G7F?=
 =?iso-8859-1?Q?ObSkofwCMdi8EFgiuJTv/H4V6+obMvwWXT/juEJItb81uEJ9iQ4MIXj7w2?=
 =?iso-8859-1?Q?Wulx4YUyojDMYBboaH1xm3i+Pyd1sZsNCvsghiBOFggnoPXPo3LQpqEuct?=
 =?iso-8859-1?Q?xMP+3T5Zom7Pz/ulIWgScagnn3xMEhZfPR/GisYSpZuDtLXyFm98hgYXbX?=
 =?iso-8859-1?Q?SoC5tBoEAN/Z2tT4WzCnExoHxcXYCDnPwDpqpEazMdukflKeiO5Nrvv0TN?=
 =?iso-8859-1?Q?sjh9z5xlaUJCeHO648+byCtCbxOhpeKXJSl1/5fu7FfGAc5ePuEUJBdaAm?=
 =?iso-8859-1?Q?9/RQnSHcZPVxXKdPqIIcWV7A450Kx4kwniOejiHwX44tKYvzRF29PjeT4Z?=
 =?iso-8859-1?Q?b4TxDuPKJd44tyva+cTru1D4WKe8TnxwOpLcrH7DxyeJdX7KnhsqXFNb8o?=
 =?iso-8859-1?Q?sQJlsir2WrVSinNeuMynAWpqPT6QwTJ4Dd/sSJlKHzG+x5zMf7MAVhXgJE?=
 =?iso-8859-1?Q?2OsEehvcsDRX9XQADd+Yxj+s34afJCZJxWnL/pqeAR6XzGPbjZ7BfHGCXv?=
 =?iso-8859-1?Q?dL4gJSgRsnvuksMT2ODbhkThgiYYYjPB3N2BgXAp0pKJI9Gw2MJhUu77+2?=
 =?iso-8859-1?Q?fCvSdF+IPfnNrary9DVCBg55ElysKbPvCSVCpiEtDCx3KRONZ89IkQEuic?=
 =?iso-8859-1?Q?MdEtytC8BGOrZ3CaSt9zWDiw8QT2ebzebwAeM/bL+aKVjNTXWqrBqacSKW?=
 =?iso-8859-1?Q?0/EoeLbgXd7fYRn0yuh7BgU+3VUdsCIUBZ629kyoq7AsqvZ1DDa+xe5niq?=
 =?iso-8859-1?Q?P6AFF0yFYjpK0/X60yADI9mIJ/fWhVHXMeXkrzrxIWVXFxygP3sF4Y18c0?=
 =?iso-8859-1?Q?FLwalzX/dI8ORuJBU0fnVfHWIL7zK4dNCjXdQtGkV7t3ynBSJRZE3x5oK+?=
 =?iso-8859-1?Q?P8dkLNnGZ5WhGmPEl8QiZYTn3F044PiFbywDMcUg3kcHEVoeAJQs1I+z6F?=
 =?iso-8859-1?Q?RDjuq/WBjC/Sa+eZbVu6fJ2bBh8xvb2myjOpWjSy6pBn+6uirZlZovj+Kc?=
 =?iso-8859-1?Q?yT82UaVWpoX/WwE2Orz2APdeZjk55v91AhgCeAd04XJaeh6z2t3UwMMw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48090505-e6d4-46c5-ecf3-08dcff7e77d9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 22:49:42.3934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahd52+EpCTyDPchy7InF8cPOYU/WUG3bQsNptOt8CycNuYc6MDnLV+FenaQ80Dh9HrKezQwwY8FDHj/ZDOln8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8202
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

On Tue, Nov 05, 2024 at 07:17:53AM -0500, Usyskin, Alexander wrote:
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Monday, November 4, 2024 11:16 PM
> > To: Usyskin, Alexander <alexander.usyskin@intel.com>
> > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Deak, Imre
> > <imre.deak@intel.com>; Miquel Raynal <miquel.raynal@bootlin.com>;
> > Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> > <vigneshr@ti.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Thomas
> > Hellström <thomas.hellstrom@linux.intel.com>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
> > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Jani Nikula
> > <jani.nikula@linux.intel.com>; Joonas Lahtinen
> > <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>;
> > Weil, Oren jer <oren.jer.weil@intel.com>; linux-mtd@lists.infradead.org; dri-
> > devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 06/10] mtd: intel-dg: wake card on operations
> > 
> > On Tue, Oct 29, 2024 at 11:24:36AM +0000, Usyskin, Alexander wrote:
> > > > -----Original Message-----
> > > > From: Gupta, Anshuman <anshuman.gupta@intel.com>
> > > > Sent: Monday, October 28, 2024 5:02 PM
> > > > To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Usyskin, Alexander
> > > > <alexander.usyskin@intel.com>; Deak, Imre <imre.deak@intel.com>
> > > > Cc: Miquel Raynal <miquel.raynal@bootlin.com>; Richard Weinberger
> > > > <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>; De Marchi,
> > > > Lucas <lucas.demarchi@intel.com>; Thomas Hellström
> > > > <thomas.hellstrom@linux.intel.com>; Maarten Lankhorst
> > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > <mripard@kernel.org>;
> > > > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
> > > > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Jani Nikula
> > > > <jani.nikula@linux.intel.com>; Joonas Lahtinen
> > > > <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>;
> > > > Weil, Oren jer <oren.jer.weil@intel.com>; linux-mtd@lists.infradead.org;
> > dri-
> > > > devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; linux-
> > > > kernel@vger.kernel.org
> > > > Subject: RE: [PATCH 06/10] mtd: intel-dg: wake card on operations
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > Sent: Monday, October 28, 2024 8:27 PM
> > > > > To: Usyskin, Alexander <alexander.usyskin@intel.com>; Gupta,
> > Anshuman
> > > > > <anshuman.gupta@intel.com>; Deak, Imre <imre.deak@intel.com>
> > > > > Cc: Miquel Raynal <miquel.raynal@bootlin.com>; Richard Weinberger
> > > > > <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>; De Marchi,
> > > > > Lucas <lucas.demarchi@intel.com>; Thomas Hellström
> > > > > <thomas.hellstrom@linux.intel.com>; Maarten Lankhorst
> > > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > > <mripard@kernel.org>;
> > > > > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
> > > > > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Jani Nikula
> > > > > <jani.nikula@linux.intel.com>; Joonas Lahtinen
> > > > > <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin
> > <tursulin@ursulin.net>;
> > > > > Weil, Oren jer <oren.jer.weil@intel.com>; linux-mtd@lists.infradead.org;
> > dri-
> > > > > devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; linux-
> > > > > kernel@vger.kernel.org
> > > > > Subject: Re: [PATCH 06/10] mtd: intel-dg: wake card on operations
> > > > >
> > > > > On Tue, Oct 22, 2024 at 01:41:15PM +0300, Alexander Usyskin wrote:
> > > > > > Enable runtime PM in mtd driver to notify graphics driver that whole
> > > > > > card should be kept awake while nvm operations are performed
> > through
> > > > > > this driver.
> > > > > >
> > > > > > CC: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > > > > > ---
> > > > > >  drivers/mtd/devices/mtd-intel-dg.c | 73
> > > > > > +++++++++++++++++++++++++-----
> > > > > >  1 file changed, 61 insertions(+), 12 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/mtd/devices/mtd-intel-dg.c
> > > > > > b/drivers/mtd/devices/mtd-intel-dg.c
> > > > > > index 4951438e8faf..3d53f35478e8 100644
> > > > > > --- a/drivers/mtd/devices/mtd-intel-dg.c
> > > > > > +++ b/drivers/mtd/devices/mtd-intel-dg.c
> > > > > > @@ -15,11 +15,14 @@
> > > > > >  #include <linux/module.h>
> > > > > >  #include <linux/mtd/mtd.h>
> > > > > >  #include <linux/mtd/partitions.h>
> > > > > > +#include <linux/pm_runtime.h>
> > > > > >  #include <linux/string.h>
> > > > > >  #include <linux/slab.h>
> > > > > >  #include <linux/sizes.h>
> > > > > >  #include <linux/types.h>
> > > > > >
> > > > > > +#define INTEL_DG_NVM_RPM_TIMEOUT 500
> > > > > > +
> > > > > >  struct intel_dg_nvm {
> > > > > >  	struct kref refcnt;
> > > > > >  	struct mtd_info mtd;
> > > > > > @@ -462,6 +465,7 @@ static int intel_dg_mtd_erase(struct mtd_info
> > > > *mtd,
> > > > > struct erase_info *info)
> > > > > >  	loff_t from;
> > > > > >  	size_t len;
> > > > > >  	size_t total_len;
> > > > > > +	int ret = 0;
> > > > > >
> > > > > >  	if (WARN_ON(!nvm))
> > > > > >  		return -EINVAL;
> > > > > > @@ -476,20 +480,28 @@ static int intel_dg_mtd_erase(struct
> > mtd_info
> > > > > *mtd, struct erase_info *info)
> > > > > >  	total_len = info->len;
> > > > > >  	addr = info->addr;
> > > > > >
> > > > > > +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> > > > > > +	if (ret < 0) {
> > > > > > +		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > >  	guard(mutex)(&nvm->lock);
> > > > > >
> > > > > >  	while (total_len > 0) {
> > > > > >  		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len,
> > > > > SZ_4K)) {
> > > > > >  			dev_err(&mtd->dev, "unaligned erase %llx %zx\n",
> > > > > addr, total_len);
> > > > > >  			info->fail_addr = addr;
> > > > > > -			return -ERANGE;
> > > > > > +			ret = -ERANGE;
> > > > > > +			goto out;
> > > > > >  		}
> > > > > >
> > > > > >  		idx = idg_nvm_get_region(nvm, addr);
> > > > > >  		if (idx >= nvm->nregions) {
> > > > > >  			dev_err(&mtd->dev, "out of range");
> > > > > >  			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
> > > > > > -			return -ERANGE;
> > > > > > +			ret = -ERANGE;
> > > > > > +			goto out;
> > > > > >  		}
> > > > > >
> > > > > >  		from = addr - nvm->regions[idx].offset; @@ -505,14 +517,18
> > > > > @@
> > > > > > static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info
> > > > *info)
> > > > > >  		if (bytes < 0) {
> > > > > >  			dev_dbg(&mtd->dev, "erase failed with %zd\n",
> > > > > bytes);
> > > > > >  			info->fail_addr += nvm->regions[idx].offset;
> > > > > > -			return bytes;
> > > > > > +			ret = bytes;
> > > > > > +			goto out;
> > > > > >  		}
> > > > > >
> > > > > >  		addr += len;
> > > > > >  		total_len -= len;
> > > > > >  	}
> > > > > >
> > > > > > -	return 0;
> > > > > > +out:
> > > > > > +	pm_runtime_mark_last_busy(mtd->dev.parent);
> > > > > > +	pm_runtime_put_autosuspend(mtd->dev.parent);
> > > > > > +	return ret;
> > > > > >  }
> > > > > >
> > > > > >  static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from,
> > > > > > size_t len, @@ -541,17 +557,25 @@ static int
> > intel_dg_mtd_read(struct
> > > > > mtd_info *mtd, loff_t from, size_t len,
> > > > > >  	if (len > nvm->regions[idx].size - from)
> > > > > >  		len = nvm->regions[idx].size - from;
> > > > > >
> > > > > > +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> > > > > > +	if (ret < 0) {
> > > > > > +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > >  	guard(mutex)(&nvm->lock);
> > > > > >
> > > > > >  	ret = idg_read(nvm, region, from, len, buf);
> > > > > >  	if (ret < 0) {
> > > > > >  		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
> > > > > > -		return ret;
> > > > > > +	} else {
> > > > > > +		*retlen = ret;
> > > > > > +		ret = 0;
> > > > > >  	}
> > > > > >
> > > > > > -	*retlen = ret;
> > > > > > -
> > > > > > -	return 0;
> > > > > > +	pm_runtime_mark_last_busy(mtd->dev.parent);
> > > > > > +	pm_runtime_put_autosuspend(mtd->dev.parent);
> > > > > > +	return ret;
> > > > > >  }
> > > > > >
> > > > > >  static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t
> > > > > > len, @@ -580,17 +604,25 @@ static int intel_dg_mtd_write(struct
> > > > mtd_info
> > > > > *mtd, loff_t to, size_t len,
> > > > > >  	if (len > nvm->regions[idx].size - to)
> > > > > >  		len = nvm->regions[idx].size - to;
> > > > > >
> > > > > > +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> > > > > > +	if (ret < 0) {
> > > > > > +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > >  	guard(mutex)(&nvm->lock);
> > > > > >
> > > > > >  	ret = idg_write(nvm, region, to, len, buf);
> > > > > >  	if (ret < 0) {
> > > > > >  		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
> > > > > > -		return ret;
> > > > > > +	} else {
> > > > > > +		*retlen = ret;
> > > > > > +		ret = 0;
> > > > > >  	}
> > > > > >
> > > > > > -	*retlen = ret;
> > > > > > -
> > > > > > -	return 0;
> > > > > > +	pm_runtime_mark_last_busy(mtd->dev.parent);
> > > > > > +	pm_runtime_put_autosuspend(mtd->dev.parent);
> > > > > > +	return ret;
> > > > > >  }
> > > > > >
> > > > > >  static void intel_dg_nvm_release(struct kref *kref) @@ -722,6
> > +754,17
> > > > > > @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> > > > > >  		n++;
> > > > > >  	}
> > > > > >
> > > > > > +	pm_runtime_enable(device);
> > > > > > +
> > > > > > +	pm_runtime_set_autosuspend_delay(device,
> > > > > INTEL_DG_NVM_RPM_TIMEOUT);
> > > > > > +	pm_runtime_use_autosuspend(device);
> > > > >
> > > > > something looks strange here...
> > > > > on the functions above you get and put references for the parent device
> > > > > directly.
> > > > > But here you enable the rpm for this device.
> > > > >
> > > > > If I remember correctly from some old experiments, the rpm is smart
> > enough
> > > > > and wake up the parent before waking up the child. So I'm wondering if
> > we
> > > > > should only do the child without the parent.
> > > > Agree parent can't runtime suspend ind if it has active child.
> > > > Let this driver have it's own get/put routine instead of parent.
> > > > Thanks,
> > > > Anshuman Gupta.
> > >
> > > I need to wake DG card before the MTD device is established to scan the
> > partition table on flash.
> > > Thus, if I move rpm down to MTD device I should enable and take parent
> > (auxiliary device) rpm anyway.
> > 
> > That's the part that I'm not sure if I agree. if I remember from some
> > experiments in the past,
> > when you call to wake up the child, the parent will wakeup first anyway.
> > 
> The child (mtd device) does not exist at this point of time.
> To create MTD device, the partition table should be provided
> and it read directly from flash that should be powered to do read.

I don't understand... you have the mtd->dev at this point... this is
the one you should be touching, not the mtd->dev.parent... even at the
probe, but moreover on everywhere else as well.

> 
> > > Considering above, is this move is justified?
> > > Also, MTD drivers tend to enable parent rpm, not its own one.
> > 
> > What other drivers are you looking for reference?
> 
> drivers/mtd/nand/raw/tegra_nand.c
> drivers/mtd/nand/raw/renesas-nand-controller.c
> drivers/mtd/maps/physmap-core.c

I see they getting pdev->dev... not the parent...

> 
> > 
> > >
> > > - -
> > > Thanks,
> > > Sasha
> > >
> > >
> > >
> > > > >
> > > > > Cc: Imre Deak <imre.deak@intel.com>
> > > > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > >
> > > > > > +
> > > > > > +	ret = pm_runtime_resume_and_get(device);
> > > > > > +	if (ret < 0) {
> > > > > > +		dev_err(device, "rpm: get failed %d\n", ret);
> > > > > > +		goto err_norpm;
> > > > > > +	}
> > > > > > +
> > > > > >  	nvm->base = devm_ioremap_resource(device, &invm->bar);
> > > > > >  	if (IS_ERR(nvm->base)) {
> > > > > >  		dev_err(device, "mmio not mapped\n"); @@ -744,9 +787,13
> > > > > @@ static
> > > > > > int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> > > > > >
> > > > > >  	dev_set_drvdata(&aux_dev->dev, nvm);
> > > > > >
> > > > > > +	pm_runtime_put(device);
> > > > > >  	return 0;
> > > > > >
> > > > > >  err:
> > > > > > +	pm_runtime_put(device);
> > > > > > +err_norpm:
> > > > > > +	pm_runtime_disable(device);
> > > > > >  	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> > > > > >  	return ret;
> > > > > >  }
> > > > > > @@ -758,6 +805,8 @@ static void intel_dg_mtd_remove(struct
> > > > > auxiliary_device *aux_dev)
> > > > > >  	if (!nvm)
> > > > > >  		return;
> > > > > >
> > > > > > +	pm_runtime_disable(&aux_dev->dev);
> > > > > > +
> > > > > >  	mtd_device_unregister(&nvm->mtd);
> > > > > >
> > > > > >  	dev_set_drvdata(&aux_dev->dev, NULL);
> > > > > > --
> > > > > > 2.43.0
> > > > > >
