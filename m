Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B9AEAA12
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 00:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9095310E922;
	Thu, 26 Jun 2025 22:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izEynPcS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D6110E922;
 Thu, 26 Jun 2025 22:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750978316; x=1782514316;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=90UIy8Zvd6JI4FSQ9UedSFj/0QqjzStrk9LDWrUukCc=;
 b=izEynPcS/PQoN3yZiQ1dsUn/f5oe07hIrGbFPfQ1YN2WXX0Ht5oYedDA
 K5Q3C2CvvqqYq2i4dniZoV+Fi6So+ohLaSyqoLCoylILOhf17EDreyyMw
 Vn7LlLjbU5H4kpKjAI4twKRAqJSHMcNNl30lv2HCeCoFksjhS//X0cchK
 qKoUIOgQ1MFDiUI9qxaPlEE+myaOuAUT73HgsmgFSCNJvA/5aXo+vyy9f
 ExR/beXUxYPdBTsguvxo1n+lmoPmH4tDOiixpLc7tzG22kRu1zMjSLequ
 Fi1upurTABJgfb8r5MUyMSsiPwb+UxgPGkydBQhjXzDblwjEDi3x/cIdj g==;
X-CSE-ConnectionGUID: 604xEn/1QgS+EC+fTEH3JA==
X-CSE-MsgGUID: NaMTmbozQXaBmm4px829UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64725478"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="64725478"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:51:27 -0700
X-CSE-ConnectionGUID: O1NdjmVgQ3WQ2RrxAbA8Aw==
X-CSE-MsgGUID: GRXpFCmbSg2XmuVV0UzcKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="189837331"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:50:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:50:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 15:50:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:50:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQU3h7kW+03ZAYzV/syrw3LKYBN8zH3IRdVXDmQr2K7vjcvJFiFxRpgCMR+jwZvoim2hcDvCzAFshSLLDPZusrIEkp+p/pkPyHMJsA5SY6b61I+WHlaG1S5tpp/QUItOI0Eh3FJl1o0aTMUP4TQGrQNa4iyBtoHD1FdslUAEvzxRmyfSE2Mr5HaP5wyyBmgD30ZFBDbNn4kiP0E1o5yOOlsAoL3MgYTG5r60bx8Uuo6EbMeaJ04ycRjMtTiNSahum7Cg4t7HFqd0/tWsq41zhuUe0MOHW/ug+2O8a5G6tRBqawY+0HVMtu6xbG/8/stYQKIM2t3gTB67pHWLgP7hKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xUvNY2dzb7LPmwg/ndSbcps24FLOmuMwibCLv0AGv8=;
 b=gtJVK/zuLpbLIaC72ScU3IemLtSb8r0A8Dk6yrdrtjGsL8rRM/8m9y2i7fFRYAacIspgMBblK7arrvalwg44aD79jYdqVmEtxhgvN6VqErmPkUixYl9A8Dos60m9Noi+xgjMyJnCB9jUjgXylZZOQj8q3BHBpBusz8JvaDk6dUBLBl2xsVBBmESHp6vz7Ro70bkY/pzjrJJctw49pMd38lBLrC/h+ji4AVqk1eGXQbK1jbH93HTcPM/qgz1g1FI99DWrypY4Jg02nJT/qmz1USgO3+YH1khM1ymXLBcDZ3zaxdxUVUR5I5TPpxeegrTjCYTCJ5O3qbeq0WLq/g8Eow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 22:50:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 22:50:01 +0000
Date: Thu, 26 Jun 2025 18:49:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>,
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
Message-ID: <aF3OlU36bp3EDzB9@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-6-badal.nilawar@intel.com>
 <aF2CQ_VAT6PSh9Lk@intel.com>
 <e392779f-a205-4085-8663-4cfbbab4bd82@intel.com>
 <aF3Accq8A4zm9Dii@intel.com>
 <c159aa47-1e7c-4cb9-b544-89955100bfb8@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c159aa47-1e7c-4cb9-b544-89955100bfb8@intel.com>
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cddca0c-cf56-4831-cdf9-08ddb503c89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ajn8shEgmQycu8H+grlKao07G13lk2XCw5BlO9Kp1cwGL9gCTCCrdVTv2YUB?=
 =?us-ascii?Q?uSYzPT+h+/qUHMwNNt8LiFeWTcl/wNaTt8oQcZkUNYf1W3oCziSF86clDOTi?=
 =?us-ascii?Q?Y0p7S9ocAXv0m8FfHhjzz7JLMSijh0l4ALtjlHRUP9Osipz5XH9HeM9hsOgS?=
 =?us-ascii?Q?uRDL4X+5zGGhM/JJWjVBVzqF/Hd4dgweIvTYa+8L5WpI6GDT90gkWiBiE5ch?=
 =?us-ascii?Q?pp82sjjeyduKEOXdwzat5nB0ChN3EZOtx0sHrbDqk9lqlDbzA4Uy5tDCbjiu?=
 =?us-ascii?Q?w2/U6CbARq8NnsPpvDPM/NHi/BG9d36E90OeuevuMIUCz6Uz4hx5PnZkbigP?=
 =?us-ascii?Q?MHc70lfgE0l0gHrreQk5+5lsTck9UKk6y7Q3dcUmZk3+fnQBSP+PwyvIrt1v?=
 =?us-ascii?Q?zu+7bOmPn1jZHY9oHaUn1luujoPEt/nSfjnkfOuSoHoUxlK9Bs2W/Vky1PaN?=
 =?us-ascii?Q?MiXF4XIF8Qr7flVrLhNTflyxG20BDd88AeTt6uZZt3Qf/IKCjKWZALL3YLBz?=
 =?us-ascii?Q?L41uiMlQw+hPbLtgQceqmWYgwBD3bsJCz+0TPSq8QwYHm7bmZRMr1MkK9k+d?=
 =?us-ascii?Q?+hB1suvuNYIsn6Y3C7MtNvMZoQOTKdEjvooRh7/adMaUlSM5Wb9VgmUzrrWg?=
 =?us-ascii?Q?aUct5jC+saxFpyqeZh4sRS5jmFIbbfiAYTysqPPY5IDTMYYorxWu1Ib6ndec?=
 =?us-ascii?Q?YI1lCr7IPQ++7Ne4RHURUIjDU7awwDHOqi9kWvwyvOPhzOYDVC0ypRT7wF5+?=
 =?us-ascii?Q?647hVAufHcRVxT6MNUZfEaMH4vxL0J6ejFUijIUD9deZC/ecd6Zeh+dhHiOz?=
 =?us-ascii?Q?SVCKs8TzPXWXkNfhvbJuLMpeCxz2ziRaENQYGwh8pWhdOga+RkCEiowvpnzg?=
 =?us-ascii?Q?8WED/It9M7Jcoir/APs8i2UTVzc07QM3yHWdcR9WTLqAnUwtBdiEqpwMrm80?=
 =?us-ascii?Q?kOWSNJvocYkoZVGhfs6oHd8RKkYsPGtAHrG4lCR0oDITGVFJO9bIlun1rX96?=
 =?us-ascii?Q?6uxrOGob5QTY/qul42uQfccGEgbKhDfCdHSkZ5sRoLiNyCLaaeEaIbDxNcfp?=
 =?us-ascii?Q?F0tXAuDDT6Gp68p2xfhjquDUmfdxCwoPn+A+xvVVT4qRLgYVSR6VpP/ijSuM?=
 =?us-ascii?Q?D/ksm6olEr9LityY5qoOEdJRY/mNzwxWmN9xqMRwWTCXs+/Eyxw6zwI2GoRt?=
 =?us-ascii?Q?lQpUlpNqLdG1JzAcXP0XeV6EhcBAc2t7o1Sohd+t2oeNCGr1CldbLPi+o67Q?=
 =?us-ascii?Q?znp8Jyq3paO+JWz9MqnZW5yWUUi5wPokOnCDQ3mbnJseOeEgFEDs0RI0ONRN?=
 =?us-ascii?Q?R7Gnadithy8wRVUdUaIEfHGZlImq8nP3s0HuZYetr38EjmBC2x4uKef9HmBG?=
 =?us-ascii?Q?nBrBY1gteBtMqQ1O/k3mJ0FbEpQIawTmMjpnh702L0+Hi57lMygPIVDCXZWQ?=
 =?us-ascii?Q?imshPnTKago=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iYz/MZe0VS05mb45cCUkCLww6hfgKP9ELUSG1sFhdPTbBmxyjNuoasXAnAjx?=
 =?us-ascii?Q?8aZUkv8q0EyqD6Br4NMLGWlh4DvYCnlbiH6qAauB2j8956VVtBukMHrOQfWn?=
 =?us-ascii?Q?OQk0WnNRWVGwO7iKq1g2zvhCFVfx2zhSbDBooolemUM4MvtEgjDpWFf/dRqf?=
 =?us-ascii?Q?Tq83mG3TC1SpiGlogMeHX6IYZnyyJ+eU+t2kDN3+zzeIjeEoeoI0k4OFD7dV?=
 =?us-ascii?Q?X3/NI+MpdB0SVUSZ2P0G0ivlc9DrY3nKxxNit3GmoamfdGnkkqyvud+2mjmL?=
 =?us-ascii?Q?4pq3nBTZYiWbCZ1KmGw4HkmoylR9lq8BYoQGAL95tbp5l8IGu3emRcyhahSk?=
 =?us-ascii?Q?a6Ws0Mwpg/Y/nuS9sMSNjmdybb/9fr+0L8HTi65Bdu8HLIUb8JkvJ0r7+eAD?=
 =?us-ascii?Q?M0Ay/qfSGd2wOTNrY4Fxqx8PUK7tPrJTeZ6wqohkg+blx+ZrEfSdqz3HVUMC?=
 =?us-ascii?Q?bXPCdTnxqKlyH9RqdSLHePE4dKZsDn2GE+Dxso2B3N7CIfzA9HP9SI9/QWBw?=
 =?us-ascii?Q?S+j1cHL5URlpy6IEpPn8tdb8S+qpSsQv0L4Pho/485PHZKMrOTLLAs3EL0fD?=
 =?us-ascii?Q?EB6+75bpjJ7njDbni/1KoUizJgsQEdqCrL0Mxq4NitBmABUaeNvS7w8k6Ae5?=
 =?us-ascii?Q?Aa34WpqMEvvDrWqtZwk4LnXqV6+f5v54HJ9O+M8FqOMpg2scmmQyoZPKWFDL?=
 =?us-ascii?Q?UtrvkE1VpbQ29CRHwaq0ik1kt03miibxbeiy2xWFDj0ayAgF4wL44qfwNXBq?=
 =?us-ascii?Q?9zfY18jZ02pKuqQhKxW4/ooEkgGs5DE9qvQPF4JYyevAYj7r6wzPVYkamRN1?=
 =?us-ascii?Q?9XSgEcy2smMEtF5ZhYVVIrbp1HDO3sfsqYuYt99/fnOvqM6HCHHEhqwlX50J?=
 =?us-ascii?Q?3+GoiOA/RKywNyyGx0ay97zAZM5B0cPNuo0RhnRCG+UJoI1doI41fO1hvAfS?=
 =?us-ascii?Q?rfl8M8mHC56ZxpVOZLzPlQQ1bTqFSYEL0dmy5hCbRWjA+rvW56PRmqippqdJ?=
 =?us-ascii?Q?u31UBZxqQnvxV3xHO+iLm1KtPGm9mw0L8V4UCGGF3qpBSnCIJG8tth3ZHEL0?=
 =?us-ascii?Q?/bnhk2HyiwHh/4/NhIttZRS1Dzme6tlk7yGqSvXqtYlqj68pezKw9MBXTbr3?=
 =?us-ascii?Q?hoIABJfapONjWcVoX4zaHKXYv1uOaeEKsNYuKSLgBiq/9ctkhpMA1LeN7Qvg?=
 =?us-ascii?Q?ok7sa09l3r0zXYnS+O1stPedAgMheIJMgf9lNqJWY+gD8PYoK8jrH84IbaQe?=
 =?us-ascii?Q?EKQIpMYNEmEVFrvoZseZeu5F+mNEopkLcAEqFQA4myyhJp+KEtE12Y3FTMqp?=
 =?us-ascii?Q?brGsPaVTqt5eOwWOpLUy1p3HXfs7kuC08V0Mvrut1JQYH1inHNckSR4eefTL?=
 =?us-ascii?Q?7SroEJLnlk9u8XaSoaVAQMhHEfrnONwT0Rao144cLjSARCymGdD65hL1nJXF?=
 =?us-ascii?Q?J2L+dsbwixY7sNP98oacFCp2Ne9/MYeJxZipSf//kKZcTHyLS1lOSMOGUgxN?=
 =?us-ascii?Q?RFnyKXM4QbUSFElhMmbMSEg40cj0qYzVR/+/caD4vwqjV6jFFnR2SNmMLuW4?=
 =?us-ascii?Q?pvwIlShYaYQP+QI1fhagNBMxYWUph+p7iNiIUwhG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cddca0c-cf56-4831-cdf9-08ddb503c89b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:50:01.4160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNG4vlb+hQ3UXsr0NfIYgcLh28oSIwKPyTC59a77Y6W/GbQTzefZInZztZ/SDL5tZGPDr85OEJ+wrvgXPXkNbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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

On Thu, Jun 26, 2025 at 03:38:18PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/26/2025 2:49 PM, Rodrigo Vivi wrote:
> > On Thu, Jun 26, 2025 at 02:27:50PM -0700, Daniele Ceraolo Spurio wrote:
> > > 
> > > On 6/26/2025 10:24 AM, Rodrigo Vivi wrote:
> > > > On Wed, Jun 25, 2025 at 10:30:10PM +0530, Badal Nilawar wrote:
> > > > > Load late binding firmware
> > > > > 
> > > > > v2:
> > > > >    - s/EAGAIN/EBUSY/
> > > > >    - Flush worker in suspend and driver unload (Daniele)
> > > > > v3:
> > > > >    - Use retry interval of 6s, in steps of 200ms, to allow
> > > > >      other OS components release MEI CL handle (Sasha)
> > > > > v4:
> > > > >    - return -ENODEV if component not added (Daniele)
> > > > >    - parse and print status returned by csc
> > > > >    - Use xe_pm_get_if_in_active (Daniele)
> > > > The worker is considered outer bound and it is safe
> > > > to use xe_pm_runtime_get which takes the reference
> > > > and resume synchronously.
> > > > 
> > > > Otherwise, if using get_if_active you need to reschedule
> > > > the work or you lose your job.
> > > The issue is that the next patch adds code to re-queue the work from the rpm
> > > resume path, so if we do a sync resume here the worker will re-queue itself
> > > immediately when not needed.
> > ops, I had forgotten about that case, I'm sorry.
> > 
> > > Also, when the re-queued work runs it might end
> > > up doing another sync resume and re-queuing itself once more.
> > I believe it might be worse than that and even hang. This is the right
> > case for the if_active indeed. But we need to ensure that we will
> > always have an outer bound for that.
> > 
> > > However, in
> > > the next patch we do also have a flush of the work in the rpm_suspend path,
> > > so maybe the worker running when we are rpm suspended is not actually a
> > > possible case?
> > that's the kaboom case!
> > 
> > > Also, thinking about this more, that re-queuing on rpm resume only happens
> > > if d3cold is allowed, so when d3cold is not allowed we do want to proceed
> > > here we can actually reach here when rpm suspended.
> > no, when d3cold is not allowed we don't want to re-flash the fw.
> > We just skip and move forward.
> 
> My concern was about the first time we attempt the load in the d3cold
> disabled scenario. If we've somehow managed to rpm suspend between queuing
> the work for the first time and the work actually running, skipping the
> flashing would mean the binary is not actually ever loaded. Not sure if
> that's a case we can hit though.

Well, the first time will be triggered during the probe, while it is
active. But we need to trigger without delay... But we need to think
how to ensure this will start running before the probe is finished and the rpm
is allowed.

Or we create 2 different workers, one for probe and one for suspend. :/

> 
> Daniele
> 
> > 
> > My bad, sorry for the noise and please keep the if_active variant in here.
> > 
> > > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_late_bind_fw.c       | 149 ++++++++++++++++++++-
> > > > >    drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
> > > > >    drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   7 +
> > > > >    3 files changed, 156 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > > > index 32d1436e7191..52243063d98a 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > > > @@ -16,6 +16,20 @@
> > > > >    #include "xe_late_bind_fw.h"
> > > > >    #include "xe_pcode.h"
> > > > >    #include "xe_pcode_api.h"
> > > > > +#include "xe_pm.h"
> > > > > +
> > > > > +/*
> > > > > + * The component should load quite quickly in most cases, but it could take
> > > > > + * a bit. Using a very big timeout just to cover the worst case scenario
> > > > > + */
> > > > > +#define LB_INIT_TIMEOUT_MS 20000
> > > > > +
> > > > > +/*
> > > > > + * Retry interval set to 6 seconds, in steps of 200 ms, to allow time for
> > > > > + * other OS components to release the MEI CL handle
> > > > > + */
> > > > > +#define LB_FW_LOAD_RETRY_MAXCOUNT 30
> > > > > +#define LB_FW_LOAD_RETRY_PAUSE_MS 200
> > > > >    static const u32 fw_id_to_type[] = {
> > > > >    		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
> > > > > @@ -31,6 +45,30 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
> > > > >    	return container_of(late_bind, struct xe_device, late_bind);
> > > > >    }
> > > > > +static const char *xe_late_bind_parse_status(uint32_t status)
> > > > > +{
> > > > > +	switch (status) {
> > > > > +	case CSC_LATE_BINDING_STATUS_SUCCESS:
> > > > > +		return "success";
> > > > > +	case CSC_LATE_BINDING_STATUS_4ID_MISMATCH:
> > > > > +		return "4Id Mismatch";
> > > > > +	case CSC_LATE_BINDING_STATUS_ARB_FAILURE:
> > > > > +		return "ARB Failure";
> > > > > +	case CSC_LATE_BINDING_STATUS_GENERAL_ERROR:
> > > > > +		return "General Error";
> > > > > +	case CSC_LATE_BINDING_STATUS_INVALID_PARAMS:
> > > > > +		return "Invalid Params";
> > > > > +	case CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE:
> > > > > +		return "Invalid Signature";
> > > > > +	case CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD:
> > > > > +		return "Invalid Payload";
> > > > > +	case CSC_LATE_BINDING_STATUS_TIMEOUT:
> > > > > +		return "Timeout";
> > > > > +	default:
> > > > > +		return "Unknown error";
> > > > > +	}
> > > > > +}
> > > > > +
> > > > >    static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> > > > >    {
> > > > >    	struct xe_device *xe = late_bind_to_xe(late_bind);
> > > > > @@ -44,6 +82,93 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> > > > >    		return 0;
> > > > >    }
> > > > > +static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> > > > > +{
> > > > > +	struct xe_device *xe = late_bind_to_xe(late_bind);
> > > > > +	struct xe_late_bind_fw *lbfw;
> > > > > +	int fw_id;
> > > > > +
> > > > > +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> > > > > +		lbfw = &late_bind->late_bind_fw[fw_id];
> > > > > +		if (lbfw->valid && late_bind->wq) {
> > > > > +			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
> > > > > +				fw_id_to_name[lbfw->id]);
> > > > > +			flush_work(&lbfw->work);
> > > > > +		}
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +static void xe_late_bind_work(struct work_struct *work)
> > > > > +{
> > > > > +	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
> > > > > +	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
> > > > > +						      late_bind_fw[lbfw->id]);
> > > > > +	struct xe_device *xe = late_bind_to_xe(late_bind);
> > > > > +	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
> > > > > +	int ret;
> > > > > +	int slept;
> > > > > +
> > > > > +	/* we can queue this before the component is bound */
> > > > > +	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
> > > > > +		if (late_bind->component.ops)
> > > > > +			break;
> > > > > +		msleep(100);
> > > > > +	}
> > > > > +
> > > > > +	if (!xe_pm_runtime_get_if_active(xe))
> > > > > +		return;
> > > > > +
> > > > > +	mutex_lock(&late_bind->mutex);
> > > > > +
> > > > > +	if (!late_bind->component.ops) {
> > > > > +		drm_err(&xe->drm, "Late bind component not bound\n");
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
> > > > > +
> > > > > +	do {
> > > > > +		ret = late_bind->component.ops->push_config(late_bind->component.mei_dev,
> > > > > +							    lbfw->type, lbfw->flags,
> > > > > +							    lbfw->payload, lbfw->payload_size);
> > > > > +		if (!ret)
> > > > > +			break;
> > > > > +		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
> > > > > +	} while (--retry && ret == -EBUSY);
> > > > > +
> > > > > +	if (!ret) {
> > > > > +		drm_dbg(&xe->drm, "Load %s firmware successful\n",
> > > > > +			fw_id_to_name[lbfw->id]);
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	if (ret > 0)
> > > nit: here you can just do "else if" and drop the goto.
> > > 
> > > Daniele
> > > 
> > > > > +		drm_err(&xe->drm, "Load %s firmware failed with err %d, %s\n",
> > > > > +			fw_id_to_name[lbfw->id], ret, xe_late_bind_parse_status(ret));
> > > > > +	else
> > > > > +		drm_err(&xe->drm, "Load %s firmware failed with err %d",
> > > > > +			fw_id_to_name[lbfw->id], ret);
> > > > > +out:
> > > > > +	mutex_unlock(&late_bind->mutex);
> > > > > +	xe_pm_runtime_put(xe);
> > > > > +}
> > > > > +
> > > > > +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
> > > > > +{
> > > > > +	struct xe_late_bind_fw *lbfw;
> > > > > +	int fw_id;
> > > > > +
> > > > > +	if (!late_bind->component_added)
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> > > > > +		lbfw = &late_bind->late_bind_fw[fw_id];
> > > > > +		if (lbfw->valid)
> > > > > +			queue_work(late_bind->wq, &lbfw->work);
> > > > > +	}
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >    static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
> > > > >    {
> > > > >    	struct xe_device *xe = late_bind_to_xe(late_bind);
> > > > > @@ -99,6 +224,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
> > > > >    	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
> > > > >    	release_firmware(fw);
> > > > > +	INIT_WORK(&lb_fw->work, xe_late_bind_work);
> > > > >    	lb_fw->valid = true;
> > > > >    	return 0;
> > > > > @@ -109,11 +235,16 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
> > > > >    	int ret;
> > > > >    	int fw_id;
> > > > > +	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
> > > > > +	if (!late_bind->wq)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > >    	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> > > > >    		ret = __xe_late_bind_fw_init(late_bind, fw_id);
> > > > >    		if (ret)
> > > > >    			return ret;
> > > > >    	}
> > > > > +
> > > > >    	return 0;
> > > > >    }
> > > > > @@ -137,6 +268,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
> > > > >    	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
> > > > >    	struct xe_late_bind *late_bind = &xe->late_bind;
> > > > > +	xe_late_bind_wait_for_worker_completion(late_bind);
> > > > > +
> > > > >    	mutex_lock(&late_bind->mutex);
> > > > >    	late_bind->component.ops = NULL;
> > > > >    	mutex_unlock(&late_bind->mutex);
> > > > > @@ -152,7 +285,15 @@ static void xe_late_bind_remove(void *arg)
> > > > >    	struct xe_late_bind *late_bind = arg;
> > > > >    	struct xe_device *xe = late_bind_to_xe(late_bind);
> > > > > +	xe_late_bind_wait_for_worker_completion(late_bind);
> > > > > +
> > > > > +	late_bind->component_added = false;
> > > > > +
> > > > >    	component_del(xe->drm.dev, &xe_late_bind_component_ops);
> > > > > +	if (late_bind->wq) {
> > > > > +		destroy_workqueue(late_bind->wq);
> > > > > +		late_bind->wq = NULL;
> > > > > +	}
> > > > >    	mutex_destroy(&late_bind->mutex);
> > > > >    }
> > > > > @@ -183,9 +324,15 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
> > > > >    		return err;
> > > > >    	}
> > > > > +	late_bind->component_added = true;
> > > > > +
> > > > >    	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> > > > >    	if (err)
> > > > >    		return err;
> > > > > -	return xe_late_bind_fw_init(late_bind);
> > > > > +	err = xe_late_bind_fw_init(late_bind);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > > +	return xe_late_bind_fw_load(late_bind);
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> > > > > index 4c73571c3e62..28d56ed2bfdc 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> > > > > @@ -11,5 +11,6 @@
> > > > >    struct xe_late_bind;
> > > > >    int xe_late_bind_init(struct xe_late_bind *late_bind);
> > > > > +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
> > > > >    #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > > > > index 93abf4c51789..f119a75f4c9c 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > > > > @@ -9,6 +9,7 @@
> > > > >    #include <linux/iosys-map.h>
> > > > >    #include <linux/mutex.h>
> > > > >    #include <linux/types.h>
> > > > > +#include <linux/workqueue.h>
> > > > >    #define MAX_PAYLOAD_SIZE SZ_4K
> > > > > @@ -38,6 +39,8 @@ struct xe_late_bind_fw {
> > > > >    	u8  *payload;
> > > > >    	/** @late_bind_fw.payload_size: late binding blob payload_size */
> > > > >    	size_t payload_size;
> > > > > +	/** @late_bind_fw.work: worker to upload latebind blob */
> > > > > +	struct work_struct work;
> > > > >    };
> > > > >    /**
> > > > > @@ -64,6 +67,10 @@ struct xe_late_bind {
> > > > >    	struct mutex mutex;
> > > > >    	/** @late_bind.late_bind_fw: late binding firmware array */
> > > > >    	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
> > > > > +	/** @late_bind.wq: workqueue to submit request to download late bind blob */
> > > > > +	struct workqueue_struct *wq;
> > > > > +	/** @late_bind.component_added: whether the component has been added */
> > > > > +	bool component_added;
> > > > >    };
> > > > >    #endif
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> 
