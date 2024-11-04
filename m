Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EDD9BBFE0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 22:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB29810E0C8;
	Mon,  4 Nov 2024 21:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m27iS6Tk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC6E10E09E;
 Mon,  4 Nov 2024 21:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730754975; x=1762290975;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Tk4zKQ/4+B9bX2uGySQ/1EraDuKIJKLJni4838F4L5g=;
 b=m27iS6TkQ/KISBc11K255DCPeP1p/jXAoooImTw+f2FT7LRHFW7GHzRn
 zAE2AOipxBV9uLuX6/MW5AEMOWYOe4jV9ho4dbQH/96T0+AnhXWiSbNdk
 s79zuSsajCl4PWm7vqRltJ86yuEoa1w7ILl+EBXpWVX7eHdNEvVuYfD46
 K71wc0hYpFTUxDXy3vVi9RCkgeck7w0h4Tb8MTUMnwyaa19VmsmnS0dwO
 dfLd3kc12tqg6z80hmiBIhJwkN4M7mJPcqhC/5V6+D12uErvqTtVZHKm7
 cUhJb6yOL8lacXNZd716Kcx9HvU4nVGvC1kenK3VVavEH55/trQW9AZvb A==;
X-CSE-ConnectionGUID: u0SgzP7YRVSGQatbpEgv4w==
X-CSE-MsgGUID: endUHsmwTG+OJFIh1GqllQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30252584"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30252584"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:16:15 -0800
X-CSE-ConnectionGUID: vmILx2BbT2WmZ6iUWBYBLw==
X-CSE-MsgGUID: BBKX70CkS+64qZ1IMR2xVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="88919447"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 13:16:14 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 13:16:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 13:16:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 13:16:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKNR3eWQQOqMBRIWEzR028E5MQVx4ZGNMX1QHmTqTZUUUQ5Akbj55tdQK+bq5Epq1u0NdwiTZ15lNiHV0yWs0ejIPDLiJ7W61/iEPuaZfBZOEYE7fgoVkwWaZgs1CUhz+xyoqUrd2+VyTKm2rRkh8UHqSH+xzbmP3Iir888UQL46Ccw1q1Lp4mPBp7TT21JTp8HaAwcdTkvTN1R1qhEIC9eLqwD39m8/bfAAE5hE5lz7I+m81HY0gsnHo/lsmwfrd59kh/APDoEEpYSQQH7ElRO0acjbG9lYyzcYmy2bibWGFmOG15XMIYbD1w9cQ8HNDUCr5ororRZAVMJN4aZ3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSBNH0ucXgw1MsGLS9K2/u8rzG1PEB5PzbucfivQ8IQ=;
 b=GNSbSIRfbd2K/VAxwkuAKOlJCv1NmBeM6Aiw80HkgmdZQZS6xCRsGX8vIx9V+iMRbt+qw9ykNYQ6pWSbdWZ1U5xRJeiWZ/iCLopGSQ+bgY8NYJwc+TdLbtCoYAGS8M14EJl/WN1ukrYZxQC5C8lS9grnshKGGrDZ5uNz4CV+gnOA6M9BXK19FlBbL2odgJIDV9kTznh3Aq2XnlSnCQGOqcJRvTQiJsahzFBpkZzlZYgkJihpBn+GFPZFWzssdo3nHCb62XyiI23IGklb/L7g0GouFDRAVuwrU50AEZUSPR587CeADqnvnIZanCYJRA6ypURls6ER7K77lUI+3YZHMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 21:16:10 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Mon, 4 Nov 2024
 21:16:09 +0000
Date: Mon, 4 Nov 2024 16:16:02 -0500
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
Message-ID: <Zyk5kueKlusKlwqM@intel.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-7-alexander.usyskin@intel.com>
 <Zx-mPQSHXv5Teq_j@intel.com>
 <CY5PR11MB621157335FFB1089F49CEF8B954A2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CY5PR11MB6366EF9CA6552ADF6E01A557ED4B2@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY5PR11MB6366EF9CA6552ADF6E01A557ED4B2@CY5PR11MB6366.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW2PR16CA0067.namprd16.prod.outlook.com
 (2603:10b6:907:1::44) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 9714216b-2d16-4d23-2678-08dcfd15e6f8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fCEMAy5SAdFFGdN3l9gWEIlE0bBOvVIU0RBv8EYwYLstOMPNk4+FQIaMTS?=
 =?iso-8859-1?Q?C0a7UToeSgMwRECAIbqb2ogvqyoCqcRTUtOI3MHWLi2skJeyaaqMhcFfYK?=
 =?iso-8859-1?Q?9tAo1wxURgXYVsNTVkyQ3uyjQBdkV9O2bZdBmllnXftSrk1Ht0JK/8xarD?=
 =?iso-8859-1?Q?RYc8s/3OmHp6CjTdR3L685pcEnWyQ+Bck3j/Ke6FoMokI0udgqkpZAmUYv?=
 =?iso-8859-1?Q?o/luoL8QvbZPjFoi4g9j6M4Ac+wUUrhvGMfTOlL03jrfsOzu9tuJ9a1eXN?=
 =?iso-8859-1?Q?o/58ob5nYvaI0sKWMcuVtuhuclDdqs1E0Je/I3Sl5I1Fk8E3fPFtNLcntM?=
 =?iso-8859-1?Q?p+zORBXBMvvaEVSn4WVw+ceGOPLAAZ73sw8F9krwp4xudhShc2376/dIcJ?=
 =?iso-8859-1?Q?Ps4MAVbSH9ZjijqFcqWOswH2NdOCVGRk5EE/ZUiUXJX1br49Lyz5HjbCOK?=
 =?iso-8859-1?Q?e9YnhsbkRoJAIm9kxM0FotYW4fjPpHSnMc1W5QsyjIXrt5ukV+kEtDi+uJ?=
 =?iso-8859-1?Q?kz7pN/0M4mDqM5FlSE16xRpcczt3dsKrBIKt9LtNnnDH/3SELeeO52cGB0?=
 =?iso-8859-1?Q?gj69mibiaFIIIUDhhoxrIaOr6kLdk8aMSlN7IV/BjKCx5Y42u14ZBq5N/X?=
 =?iso-8859-1?Q?oN9QjAJN/oSbXKCzFnacKnc++koHJl4p9SaAyvXBB4zFWMdMCLOk3b1DoL?=
 =?iso-8859-1?Q?ChZt5eLk1KuoljSpdjhpjeXdEEvPfQ1LYwrucONdxIwdP/U/xps0jsJysa?=
 =?iso-8859-1?Q?6KDBaf1HBOlLA7/yodDuS8/wKjLoQD2xgd0bGPnDFqBX9nV9lBmnXZIkxJ?=
 =?iso-8859-1?Q?vKjE9ouQo0lW9igUweBiAe55hQPRmnnXxECUOFs0BgTNF0YUx+kxYZDbd1?=
 =?iso-8859-1?Q?ujpdWqBdoT3fvwbRYP9tFy+31XM3Ywr4nN92JfhaZN+gsEvEH+1WN/lD0Z?=
 =?iso-8859-1?Q?90oh/fNAklpWTS8UblaLgVBij4kG7GwQe9nYNSYCaycjAIYVINb2vH3WTu?=
 =?iso-8859-1?Q?+JS/3dmVPWRIEC7KKUi7FXDBuuvQtqfADHeCkjJqJxotnnF4630byNu2Jy?=
 =?iso-8859-1?Q?iS/x1dxTXrm9too8AE/p/+mcr+SzeUhDY4jJT3FdtJBG43OqGZbq91xk1a?=
 =?iso-8859-1?Q?B5Z3OskUmwkR08JV/keG0q8Z1OD1L3wWiwLsg8sS2Yas/VunYIFsixml/Y?=
 =?iso-8859-1?Q?qIMO5H035imBx9t/tds/eAUDW7AA5BeUyVzHNYlFJQkcBubjwcNaE1p1Jq?=
 =?iso-8859-1?Q?gemUXSYJQUHJ9Yop2T0LyFtfZROhaoFxiitAOGQ8lqp8SmQtNWTlgWbFfc?=
 =?iso-8859-1?Q?4TmBuWBpdAMSHb6ATfhDENhJ6YTkXMpur6BS4P09mGCl2Cx9YRd94dvVYQ?=
 =?iso-8859-1?Q?ezRZ+tnE9n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g+/5EydQXBIjWmfuIB2M7wkasOYh5GykcxQAwdTCowQSNuszlYWWF8v1dW?=
 =?iso-8859-1?Q?SVjK+cCO8ySRl50lD+ju45tMsAS7tMvD6LSRz17TAVrdp4xQ+JIlwCdB01?=
 =?iso-8859-1?Q?g8oHvgJmIaI5fWgNV27MFjjRAbr0Fk1NHVj1hN+fo83IsvctpPHAlTgrJx?=
 =?iso-8859-1?Q?iB0ZoWJwtgDQh7Sg9WmSQm6DZ182rIPREt0IQGWKfKZa5LpueXNmtIbY6c?=
 =?iso-8859-1?Q?JanBgJ6DHZVmQvOOwIE4s6+lhZv9/4xb7KoGfubxmRdbFBVlJH3wEKWe3D?=
 =?iso-8859-1?Q?jgeA0Cc30deBakPKrQ873vpWowmhN6csw844HPKzGk2c1m4D+9hX//DkwA?=
 =?iso-8859-1?Q?wN7IsoHKYOPfvrVU8HynmZnX19UAqJSgF3Ht3v0a3jc4aw0UTSpy9i08ei?=
 =?iso-8859-1?Q?DNP3sRViC9OxLxalrL5d6CWOJLSPhdorI5HrukiH+Hu2w1nZCTQofgHrt2?=
 =?iso-8859-1?Q?T43CckZl543K9RMNIT8mabwkBbzHkCzxGYrxAGaprE9378BTJn0TQLDvxo?=
 =?iso-8859-1?Q?y5qFJ84HStzfrMUZAxBLvabo1kF83NR9VCeb6kG47VqeeRIpS9fNHtXeRo?=
 =?iso-8859-1?Q?d7ZsdPB5X1T1jCgAycTbMYpuKz0EcqjjTuI81T8+x7YXfRISvaXSTclTwf?=
 =?iso-8859-1?Q?u1ha+/MW2deFWhDqbso/i+yxHH0ywh6HzYBsEdyjNhnK+Q9Q3wQ8ZVKa2g?=
 =?iso-8859-1?Q?LCoU+ExY60/0BzGsd7+5vXIClBlJatAn1zsGYqRMdWI7Y0ElWx6Ff1T51/?=
 =?iso-8859-1?Q?7AGgNbKmnQ+Rlx850b3zK0UHQIzGtuVMD7DuPnE55sfiLPdr/eFosyembc?=
 =?iso-8859-1?Q?lVlgTzBrJMskgkkYtzbt35n0/3/cY3ISjDnyCHQErnjrNV3Uq0ijKpG6H9?=
 =?iso-8859-1?Q?x6X1NcnusT6LHbi9XyYaaSQ15BnGNAsIAfI70fP7GHOiAuvQdVCqjRUj/d?=
 =?iso-8859-1?Q?eLb0IsGfmPg448RRKTLXI0veIspX68hD6uqHVA9Ga3cdU6SAdMCrMCupgy?=
 =?iso-8859-1?Q?bAaYHlkDTdzTSkVeVuqjEnjmVTd+e+T/eTK6UIAgD5dhHGcBZJnQpGq+Mf?=
 =?iso-8859-1?Q?nKqgI4/Sw7hIjtkCsOy798N3GNlrBhwgygPJmUSwW10MoPnhaZrpd++K5/?=
 =?iso-8859-1?Q?/CcHIB1N3SA3Vm5XJ/i3/PgTYxeOpxPHFyynnTk3XzPKSen+14kxuss2T2?=
 =?iso-8859-1?Q?iaz+nOIMRJdHxHzR22H1eYDYNz4qwvxgPC9F+891AqfBfJuthtHdDMhprm?=
 =?iso-8859-1?Q?/bhAa/zL8NwVyxNIu714fHuNQLBNnAYXVIu9YQqy3NBbhfsFB+BujK0HOz?=
 =?iso-8859-1?Q?wwa1IwVu/ZMMPjiF5TZYol4+0a5pydEL6JBWceZY4ONZ8019iApchZuKIr?=
 =?iso-8859-1?Q?/JjBFtJ67OetK34t9kgP/M77sK1ghnh0u8IfPpLGZc3bETN8ClEEnjqK9u?=
 =?iso-8859-1?Q?Ey/0B0Y9JyMzGnObywdgQrpkDfZdn9KL2teKP3WxVgxP0AYdlFbUFkr58Q?=
 =?iso-8859-1?Q?DkGrBiQ0NUJFFexZUH+HyE1oj0VXdoJlT5YYX8ArioJjJVQTDjvpDQFODA?=
 =?iso-8859-1?Q?CYEFbaRqO31gl9dDK2PjMNJpPLsViuodX/TiwA1UC2K44c4pMMgaWgc9MY?=
 =?iso-8859-1?Q?NJ4fLtq4XDQX/MgM6UjKFvPkttPymDiPxObMztiVchhqr2xw0ktaWGNg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9714216b-2d16-4d23-2678-08dcfd15e6f8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 21:16:09.7312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hG4mTrqtwy4uYyOb9pQbpl4qBPaBMu9Gpg5p5AAvvuybdy97a/0mPj6jE9YmLpRKhqLKR0xXZ7091lABAOPlRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7471
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

On Tue, Oct 29, 2024 at 11:24:36AM +0000, Usyskin, Alexander wrote:
> > -----Original Message-----
> > From: Gupta, Anshuman <anshuman.gupta@intel.com>
> > Sent: Monday, October 28, 2024 5:02 PM
> > To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Usyskin, Alexander
> > <alexander.usyskin@intel.com>; Deak, Imre <imre.deak@intel.com>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>; Richard Weinberger
> > <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>; De Marchi,
> > Lucas <lucas.demarchi@intel.com>; Thomas Hellström
> > <thomas.hellstrom@linux.intel.com>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
> > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Jani Nikula
> > <jani.nikula@linux.intel.com>; Joonas Lahtinen
> > <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>;
> > Weil, Oren jer <oren.jer.weil@intel.com>; linux-mtd@lists.infradead.org; dri-
> > devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Subject: RE: [PATCH 06/10] mtd: intel-dg: wake card on operations
> > 
> > 
> > 
> > > -----Original Message-----
> > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Sent: Monday, October 28, 2024 8:27 PM
> > > To: Usyskin, Alexander <alexander.usyskin@intel.com>; Gupta, Anshuman
> > > <anshuman.gupta@intel.com>; Deak, Imre <imre.deak@intel.com>
> > > Cc: Miquel Raynal <miquel.raynal@bootlin.com>; Richard Weinberger
> > > <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>; De Marchi,
> > > Lucas <lucas.demarchi@intel.com>; Thomas Hellström
> > > <thomas.hellstrom@linux.intel.com>; Maarten Lankhorst
> > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > <mripard@kernel.org>;
> > > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
> > > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Jani Nikula
> > > <jani.nikula@linux.intel.com>; Joonas Lahtinen
> > > <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>;
> > > Weil, Oren jer <oren.jer.weil@intel.com>; linux-mtd@lists.infradead.org; dri-
> > > devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; linux-
> > > kernel@vger.kernel.org
> > > Subject: Re: [PATCH 06/10] mtd: intel-dg: wake card on operations
> > >
> > > On Tue, Oct 22, 2024 at 01:41:15PM +0300, Alexander Usyskin wrote:
> > > > Enable runtime PM in mtd driver to notify graphics driver that whole
> > > > card should be kept awake while nvm operations are performed through
> > > > this driver.
> > > >
> > > > CC: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > > > ---
> > > >  drivers/mtd/devices/mtd-intel-dg.c | 73
> > > > +++++++++++++++++++++++++-----
> > > >  1 file changed, 61 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/drivers/mtd/devices/mtd-intel-dg.c
> > > > b/drivers/mtd/devices/mtd-intel-dg.c
> > > > index 4951438e8faf..3d53f35478e8 100644
> > > > --- a/drivers/mtd/devices/mtd-intel-dg.c
> > > > +++ b/drivers/mtd/devices/mtd-intel-dg.c
> > > > @@ -15,11 +15,14 @@
> > > >  #include <linux/module.h>
> > > >  #include <linux/mtd/mtd.h>
> > > >  #include <linux/mtd/partitions.h>
> > > > +#include <linux/pm_runtime.h>
> > > >  #include <linux/string.h>
> > > >  #include <linux/slab.h>
> > > >  #include <linux/sizes.h>
> > > >  #include <linux/types.h>
> > > >
> > > > +#define INTEL_DG_NVM_RPM_TIMEOUT 500
> > > > +
> > > >  struct intel_dg_nvm {
> > > >  	struct kref refcnt;
> > > >  	struct mtd_info mtd;
> > > > @@ -462,6 +465,7 @@ static int intel_dg_mtd_erase(struct mtd_info
> > *mtd,
> > > struct erase_info *info)
> > > >  	loff_t from;
> > > >  	size_t len;
> > > >  	size_t total_len;
> > > > +	int ret = 0;
> > > >
> > > >  	if (WARN_ON(!nvm))
> > > >  		return -EINVAL;
> > > > @@ -476,20 +480,28 @@ static int intel_dg_mtd_erase(struct mtd_info
> > > *mtd, struct erase_info *info)
> > > >  	total_len = info->len;
> > > >  	addr = info->addr;
> > > >
> > > > +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> > > > +	if (ret < 0) {
> > > > +		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > >  	guard(mutex)(&nvm->lock);
> > > >
> > > >  	while (total_len > 0) {
> > > >  		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len,
> > > SZ_4K)) {
> > > >  			dev_err(&mtd->dev, "unaligned erase %llx %zx\n",
> > > addr, total_len);
> > > >  			info->fail_addr = addr;
> > > > -			return -ERANGE;
> > > > +			ret = -ERANGE;
> > > > +			goto out;
> > > >  		}
> > > >
> > > >  		idx = idg_nvm_get_region(nvm, addr);
> > > >  		if (idx >= nvm->nregions) {
> > > >  			dev_err(&mtd->dev, "out of range");
> > > >  			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
> > > > -			return -ERANGE;
> > > > +			ret = -ERANGE;
> > > > +			goto out;
> > > >  		}
> > > >
> > > >  		from = addr - nvm->regions[idx].offset; @@ -505,14 +517,18
> > > @@
> > > > static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info
> > *info)
> > > >  		if (bytes < 0) {
> > > >  			dev_dbg(&mtd->dev, "erase failed with %zd\n",
> > > bytes);
> > > >  			info->fail_addr += nvm->regions[idx].offset;
> > > > -			return bytes;
> > > > +			ret = bytes;
> > > > +			goto out;
> > > >  		}
> > > >
> > > >  		addr += len;
> > > >  		total_len -= len;
> > > >  	}
> > > >
> > > > -	return 0;
> > > > +out:
> > > > +	pm_runtime_mark_last_busy(mtd->dev.parent);
> > > > +	pm_runtime_put_autosuspend(mtd->dev.parent);
> > > > +	return ret;
> > > >  }
> > > >
> > > >  static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from,
> > > > size_t len, @@ -541,17 +557,25 @@ static int intel_dg_mtd_read(struct
> > > mtd_info *mtd, loff_t from, size_t len,
> > > >  	if (len > nvm->regions[idx].size - from)
> > > >  		len = nvm->regions[idx].size - from;
> > > >
> > > > +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> > > > +	if (ret < 0) {
> > > > +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > >  	guard(mutex)(&nvm->lock);
> > > >
> > > >  	ret = idg_read(nvm, region, from, len, buf);
> > > >  	if (ret < 0) {
> > > >  		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
> > > > -		return ret;
> > > > +	} else {
> > > > +		*retlen = ret;
> > > > +		ret = 0;
> > > >  	}
> > > >
> > > > -	*retlen = ret;
> > > > -
> > > > -	return 0;
> > > > +	pm_runtime_mark_last_busy(mtd->dev.parent);
> > > > +	pm_runtime_put_autosuspend(mtd->dev.parent);
> > > > +	return ret;
> > > >  }
> > > >
> > > >  static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t
> > > > len, @@ -580,17 +604,25 @@ static int intel_dg_mtd_write(struct
> > mtd_info
> > > *mtd, loff_t to, size_t len,
> > > >  	if (len > nvm->regions[idx].size - to)
> > > >  		len = nvm->regions[idx].size - to;
> > > >
> > > > +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> > > > +	if (ret < 0) {
> > > > +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > >  	guard(mutex)(&nvm->lock);
> > > >
> > > >  	ret = idg_write(nvm, region, to, len, buf);
> > > >  	if (ret < 0) {
> > > >  		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
> > > > -		return ret;
> > > > +	} else {
> > > > +		*retlen = ret;
> > > > +		ret = 0;
> > > >  	}
> > > >
> > > > -	*retlen = ret;
> > > > -
> > > > -	return 0;
> > > > +	pm_runtime_mark_last_busy(mtd->dev.parent);
> > > > +	pm_runtime_put_autosuspend(mtd->dev.parent);
> > > > +	return ret;
> > > >  }
> > > >
> > > >  static void intel_dg_nvm_release(struct kref *kref) @@ -722,6 +754,17
> > > > @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> > > >  		n++;
> > > >  	}
> > > >
> > > > +	pm_runtime_enable(device);
> > > > +
> > > > +	pm_runtime_set_autosuspend_delay(device,
> > > INTEL_DG_NVM_RPM_TIMEOUT);
> > > > +	pm_runtime_use_autosuspend(device);
> > >
> > > something looks strange here...
> > > on the functions above you get and put references for the parent device
> > > directly.
> > > But here you enable the rpm for this device.
> > >
> > > If I remember correctly from some old experiments, the rpm is smart enough
> > > and wake up the parent before waking up the child. So I'm wondering if we
> > > should only do the child without the parent.
> > Agree parent can't runtime suspend ind if it has active child.
> > Let this driver have it's own get/put routine instead of parent.
> > Thanks,
> > Anshuman Gupta.
> 
> I need to wake DG card before the MTD device is established to scan the partition table on flash.
> Thus, if I move rpm down to MTD device I should enable and take parent (auxiliary device) rpm anyway.

That's the part that I'm not sure if I agree. if I remember from some experiments in the past,
when you call to wake up the child, the parent will wakeup first anyway.

> Considering above, is this move is justified?
> Also, MTD drivers tend to enable parent rpm, not its own one.

What other drivers are you looking for reference?

> 
> - - 
> Thanks,
> Sasha
> 
> 
> 
> > >
> > > Cc: Imre Deak <imre.deak@intel.com>
> > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > >
> > > > +
> > > > +	ret = pm_runtime_resume_and_get(device);
> > > > +	if (ret < 0) {
> > > > +		dev_err(device, "rpm: get failed %d\n", ret);
> > > > +		goto err_norpm;
> > > > +	}
> > > > +
> > > >  	nvm->base = devm_ioremap_resource(device, &invm->bar);
> > > >  	if (IS_ERR(nvm->base)) {
> > > >  		dev_err(device, "mmio not mapped\n"); @@ -744,9 +787,13
> > > @@ static
> > > > int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> > > >
> > > >  	dev_set_drvdata(&aux_dev->dev, nvm);
> > > >
> > > > +	pm_runtime_put(device);
> > > >  	return 0;
> > > >
> > > >  err:
> > > > +	pm_runtime_put(device);
> > > > +err_norpm:
> > > > +	pm_runtime_disable(device);
> > > >  	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> > > >  	return ret;
> > > >  }
> > > > @@ -758,6 +805,8 @@ static void intel_dg_mtd_remove(struct
> > > auxiliary_device *aux_dev)
> > > >  	if (!nvm)
> > > >  		return;
> > > >
> > > > +	pm_runtime_disable(&aux_dev->dev);
> > > > +
> > > >  	mtd_device_unregister(&nvm->mtd);
> > > >
> > > >  	dev_set_drvdata(&aux_dev->dev, NULL);
> > > > --
> > > > 2.43.0
> > > >
