Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484B4A58A7F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 03:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E20A10E0E4;
	Mon, 10 Mar 2025 02:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDWGxh4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D953910E0E4;
 Mon, 10 Mar 2025 02:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741574321; x=1773110321;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3dpgAO+EH6ZARUguFQ8lSmA34O5JhIEqyvgLTt7Zvn0=;
 b=dDWGxh4hSOYMj7M8tfd9N/9r73nlvoFx8UMA+7ga8DxT8ll2l9yIdMt6
 5ViiECKiypHAc9foIk+n25cpsr9ATsoRaiDe/3Ebi9Nnjfpfy4QTMEh1M
 aIOSqNLv3K8sWUmTJYD+kwtJjp9OAibt5+HeoSire4KTl+p5wzKmAtoeh
 aWCw5aj1jixnN9kdQZ9hROPWEwmkGhH7B+wI76O4reVZZN+VXZMucaghy
 sbEf1SUMJUzeis2cMefIjVlLis4nxMy6OFILQkG2QRbf/rO6cDj7pe9U6
 1Vncq3m8TMDejy3MqzXCPX2zRak515TVkazMSGZhdiuK+wC67p8WUoA4s A==;
X-CSE-ConnectionGUID: 7V1es1axQZOdJ0mBvAzbEA==
X-CSE-MsgGUID: ldVBbm5YRZW7bYpln497Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46201538"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="46201538"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 19:38:40 -0700
X-CSE-ConnectionGUID: YUuo7Jk2S46xVKpZhZA4Ag==
X-CSE-MsgGUID: 9SnmcEmgQHOzOZ28vJ+29A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="150635877"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 19:38:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 9 Mar 2025 19:38:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 9 Mar 2025 19:38:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 19:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njQ0fts1nfnCcqpa4rbCy38X0r26IJGs2yRtNUT3+JO5IOtHbteNXCzBusWzdpiTIVG584ikhlG/yBfWG5nK9b37Fgxn2W0lHz1aB42gQnh2VJ1t/5KO+Kp7hy7fLaVZaXKc5lGklZcVfen6S/3KwJrGyTztWvEApj8vgENXkbpjsntoeA001MWIuwv2q8E9o3cHqJ7WlmVJhioXA9zq4/8w71JNjyMtKsjNQ9NobBvz6t7BhVEsUkFDEEXPyaJaR8+4TbWRm7FAjqZjI/cg8bbcGTD0kDDOYGPpceVnMM+qTu54hKg756s5Xl1JlSsdg0tDOves6HlITgnwNgqE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3hwPOEFNl69Jcz3PngyFwW4VKDIwpW5uIpxOhl9kj4=;
 b=hQ4a1z6QqPBK3aZ2zqH6fBFkbqOT7P4sJwRuYwPkI6XIz/lqjkSw7JgBVSnyX4pHVea7eUkqDus61kE3F+QA12sYNm/c5Aq1fnOYY+dY3yanMCnTmmrFMxP50jz4u0S664RQWULyMgZyX4DG+6yjNzYy53LabMFgK85pkku1LLq98oZ4hwAIaXCTvPMSCxdYOO0HG7RDJ9IFiyuLvtC8Z5tZsaRdoWcEs//K2TznpC/fIpc8+K5LLvDMhjS4jcn/ojUkPOY5JtS0tcgWrYZyATqN7NOPd/Mm5jHxIwfTUO6aS6lmrVELz/GmG0CKDHLRQ1Bk1RBVmToAVKQuZsYGnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 02:38:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 02:38:36 +0000
Date: Sun, 9 Mar 2025 21:38:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
CC: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] drm/gpusvm: Fix kernel-doc
Message-ID: <dp5brgwgzo4to3tsgecul6ifxzm377bt3nkhm5l47h5gzxczai@mzgjvvhdm7jd>
References: <20250307-fix-svm-kerneldoc-v2-1-03c74b199620@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307-fix-svm-kerneldoc-v2-1-03c74b199620@intel.com>
X-ClientProxiedBy: MW4PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:303:83::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 43cf3893-8673-4b18-7411-08dd5f7ca845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?R50xoSS1ElEs/4lJb40O+Dt0Y7SUcFAjY/FEye3WuY0b6+8gKLeO8GswdY?=
 =?iso-8859-1?Q?ABUd45f/NJ+LszJvxp/8ynIsBNokwE1/1/DMWqXaZRQr91v5LNmktmhHRl?=
 =?iso-8859-1?Q?CteuZusGpeU7ytm2T0acZ/VknypmhqKfveYBI6xjqHvO90JmjxYsFvGgRU?=
 =?iso-8859-1?Q?YY/YrLhilEvol9k2wCuVpbrvBFVs94qup5B+1etoLbf+gL4yiMaNAn1wJB?=
 =?iso-8859-1?Q?6euiPAtsoryS83LIq5fOZRtyHCjaL+82xvkZwFC5/sJxy6YbF+1F2hIybQ?=
 =?iso-8859-1?Q?EA7kBTChgDhbhcHlkcNJSNMNQ9ID5p26dvPouem05H5NULAMtcLzsXU9oY?=
 =?iso-8859-1?Q?AL/1YGOtnr74Xydxc84fcT42fX7UXjCfL8xqKYcFZnmb25eNBvsBGrBYiw?=
 =?iso-8859-1?Q?anGZvLEARLCOnKk2095DbP8MJxiAoaPLnjx7T49r00Da8CTALdKjj7gccF?=
 =?iso-8859-1?Q?EQWRyB8a/Oak6kAxAbY2Uhkd8VKz8JAnIXoCR05hRR8iDkeHnu9gCDre1A?=
 =?iso-8859-1?Q?9Fh2kHMuKvgwZfVrfhykizXvUoUJjY0+OgaA+W9j2fMDv4jsaiZA7D8ecV?=
 =?iso-8859-1?Q?C16yuM1wdbOnbImCofYVcEF4cUnyJXB1GcqsaYqaIJNTvxasKOt0lYseLj?=
 =?iso-8859-1?Q?lS08JjnIlyL47zJuAGkr1Qy3C6XKZxeG6IiAH/Pzot5LnTLfmTrrfQiF7z?=
 =?iso-8859-1?Q?Lrnsq13Ew7XSz1IAqm+qqdNvN/BwIcyk8ChJqO0G/iG+kTs/YlJVeBdvYC?=
 =?iso-8859-1?Q?JRTEVWUis7OCK1oGeV4o9AzUYQnqZmTeAmkbAjd9jItstCvHpngFnZT8Ai?=
 =?iso-8859-1?Q?mbBcY+b73n6keyHaokTIa+1BkU2xXHnXCvy+/sEmXglUEUuc0UANGKoCzF?=
 =?iso-8859-1?Q?E+9PEB/HUE/85EvxCaFp5mhFK63AQG6Pk0r/3iQ8ASRmiGo6ro+IfmGNPZ?=
 =?iso-8859-1?Q?XKFgyJxjPZpkvfpAHKnnQoULxQ/qxDthXLY9qbJ+zq6qM2TGpbJfLVDaHJ?=
 =?iso-8859-1?Q?1qkwJSMOfCnqq6gdxBc36Io/9GwkSQe+IcwZmwb52zz4mzFO9d04PGC4rl?=
 =?iso-8859-1?Q?2GYBs9naWrCDNTaX5/TwnLg20AyQSM2eOWiqDImcmJLavBIXDaNSl8EnVV?=
 =?iso-8859-1?Q?fVaBdrGrOBL1nRQRAz/7hA8bI+EIXlAZwxiB9Fls9v3LuIlJCFs3na4GNY?=
 =?iso-8859-1?Q?82hiCsTwz32O8lzYvLHeaGX6CkHatCyaExSVe+3xrZu0Y6aPJZOb3uvPK1?=
 =?iso-8859-1?Q?yJhAaLD2jvHp/86T5REsN4y3cE2yE1ZArc1Mj83M7AbrWlJ/ABND2LWoIm?=
 =?iso-8859-1?Q?ulrGKGnhWY9l09sJff1xxdVaxt60qM0OWVcm+YDaCz2KaXnGDwapnsxCrv?=
 =?iso-8859-1?Q?z770QMSafmAiB0pbXJyiGP0MLAn5TTdcK1RvDBNIbkfKY/HhQK9p9cMXdR?=
 =?iso-8859-1?Q?N6ljYHljT5l1XBp6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ImZUgVnkKn8WLW3HddCDJoTaCluyRo1/GhGaUfIK8WFLhAeLyI6oHUdGhA?=
 =?iso-8859-1?Q?poZBSxyR7pQcyzAC748fFe5B0FGS5dJaGt6DHgY7dfkoUaoXhD1I6WNj/w?=
 =?iso-8859-1?Q?sjMV5xipmHaGYTR5fb3GM5rgr96WedoF0+0NmG3VLf7XnBe8/fVxaJFRgQ?=
 =?iso-8859-1?Q?Ms/bX+l/FqdeLrHdRUADtox+nfCXJHuNzffpltZBCLG4Egr2nYT1L2rp48?=
 =?iso-8859-1?Q?IKe87BvJM256BDlycmMphb4MwSEj2jqRrBisq5vPCM5hwLuHPWF08kn0H/?=
 =?iso-8859-1?Q?qfmjiQ6K7XUSgpqEFVm6AjaB7LF52kTTfyggr7O7LbmEo9D3mx3zPMPZQb?=
 =?iso-8859-1?Q?QisW1HHkTF0IWCUhfHJsDDm5Pdl41OF/nIRjHowPSMnZaY3/QDJ3eBEwVh?=
 =?iso-8859-1?Q?ZP4PbaDut2K6TD9U7/txWRtpNy804/03wa7lpadhw9QydU1qPbvkV3RJYn?=
 =?iso-8859-1?Q?SmC9SNNMOjw33NfIUxzTqBW3uWzq8yjddPY9MMqmi3Aj1GraFS64dNQtSY?=
 =?iso-8859-1?Q?kgyhek7hH/GzkK+Wxt6p1UwsZQLU224egcGCBnr9D3HDZXKWF0rKJE58lG?=
 =?iso-8859-1?Q?JnOoJMvORftXolZSTvgfB57ZdA9hnqQaZd15DgjcOjS8knmKk4/G7TY7zT?=
 =?iso-8859-1?Q?uUcldparbw0XBVTkNg9+zjv+R4pxL9/GrxD/HQ5JrPc7XQ1e17WRs9yBGO?=
 =?iso-8859-1?Q?QYlI1VcSVCJBfBCOACZ1QeCDH/dLbuzW2nfz2kRcm5Hfx8AxtRJpw8j07d?=
 =?iso-8859-1?Q?3ZLhO3TTC1qI8REtn80pcCJS3pPO1sRxNPuB1zMWdASJKmIQfNdW21Sf2c?=
 =?iso-8859-1?Q?B+UpQuFj+i6mCA2Zjqg3BSuHatktjx2v8UAjqtHR6IL6W/5NkrMDwiU5PW?=
 =?iso-8859-1?Q?3buZRmZTKLk08/K4ZTJx0NCpKSNfuMytmF/NsAPJJJnf4yjOi6H8P68rj3?=
 =?iso-8859-1?Q?evLgZnJfnEsZTEw/VDSz39upduw7TKBSQmUHvbkp6RGaNbtcKagGWihcCq?=
 =?iso-8859-1?Q?zOz5dZJ2nowhMSyuMnmv7Q1b23inHaLPwN4EEbGWKa/ysR9UcQiuec3rY3?=
 =?iso-8859-1?Q?XgJ6W1xS/nlGcq0j2i54wWJw0aKs9FYPruDfBwHSbpjy/T9ipAuREZkoen?=
 =?iso-8859-1?Q?sBL+hPYuS406qPlU/ElmMrUe7dx7scnfnVRCbcy9V3vP35XOEBVQ/cKRYN?=
 =?iso-8859-1?Q?vbrvPK9mkgVHw6XWQnx8Y0af2dcJEDhod5eVQLPQJQU2GeVv4aQTiljfAY?=
 =?iso-8859-1?Q?RSl5zkcYC8+iuQOPpn2+JQY7xog1FldaQrIrQKGRxUG2xKVAYJvKCBhFz9?=
 =?iso-8859-1?Q?k+PDrUGMEpZziE1y004k31S6mqgvYzXSPVVMRjn1QNRm02dOtzHIcSd1+6?=
 =?iso-8859-1?Q?1ZyMTU6y0eUmV92tBePqvHGhAhG+1C8YlGjzwXPB+gmJD1FyA21BwjbzzI?=
 =?iso-8859-1?Q?DzeyfU7h1Nw5lpSJQRzjzVyBL+fxFvwEDSfeeksTlTB2ZElOs7jbEEuxl6?=
 =?iso-8859-1?Q?eJwB881rTtFz6jrgTIBZS4Ou1H7pK9Tj4C3MIe3SLJMpErbUusmR6aL50N?=
 =?iso-8859-1?Q?t3GouINW0ob6XSOANHImcB7gjH3MLsansxbA42cz+4c7UuNfag83wqvOZH?=
 =?iso-8859-1?Q?SfWDk7eKeVUuL2ssPINrfXi8T/siwpD0g2oEQaaSKSU8yifNkmhEW7Sg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cf3893-8673-4b18-7411-08dd5f7ca845
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 02:38:36.2153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/rsaZ2cM2Wlu1VKyQOw83FydtXetIAIOaAMQJUOb1wMDvhw+3iyJhvnkwH27F5223IDiNHiCGbb5Juyekxk5LXEm1l4No4O9yHAjarnSA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
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

On Fri, Mar 07, 2025 at 05:14:28PM -0800, Lucas De Marchi wrote:
>Due to wrong `.. kernel-doc` directive in Documentation/gpu/rfc/gpusvm.rst
>the documentation was actually not parsing anything from
>drivers/gpu/drm/drm_gpusvm.c. This fixes the kernel-doc include and all
>warnings/errors created when doing so.
>
>Cc: Simona Vetter <simona.vetter@ffwll.ch>
>Cc: Dave Airlie <airlied@redhat.com>
>Cc: Christian König <christian.koenig@amd.com>
>Cc: dri-devel@lists.freedesktop.org
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>Closes: https://lore.kernel.org/intel-xe/20250307195239.57abcd2d@canb.auug.org.au/
>Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

applied to drm-xe-next

[1/1] drm/gpusvm: Fix kernel-doc
       commit: 4da1fb61e02a783fdd7eb725ea03d897b8ef19ea

thanks
Lucas De Marchi
