Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471818BEEE8
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 23:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6745911269C;
	Tue,  7 May 2024 21:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NO+iMp3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D7E10F5E6;
 Tue,  7 May 2024 21:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715117768; x=1746653768;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ObE8E0A+Y8jaRTE+DWqY4StcxaKIYEDnvDxEc0eAAqs=;
 b=NO+iMp3JSka7fdXdCXnaL4Q7Kv/+pwCapnF4EUxPJUvs6biVQapFvpU9
 zIhXoRHuzGySd+IODFJ1kWSAuGGRQh9R8biM77ulHDPL3zVDo7arkS8ra
 oVaILDhN3Xsm12UbAH1n/7VLo1Cism6Kv11q2SrSNYeFgnQckGchZdMI+
 rIKv9KleYuBz84fpLCr+Wxd7tu0m0BaPzREwZeBcJyiG+4YaWNp5oNgjU
 oHY4Bncw9vDiCLtRyDIqtlgUxWqNB6QehQAqwYzw0LF0gYHtbWh+D8lK3
 aLRAOz8Jz6xd2xDbB1qZ8ShAolOdvhuONvt5q4E3NXfIqNWftRsGU/tdF Q==;
X-CSE-ConnectionGUID: vS7m5dNvTPCxq5VtO3dm3g==
X-CSE-MsgGUID: DFMLIAP7TvSanoUFcZFKow==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10814359"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="10814359"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 14:36:08 -0700
X-CSE-ConnectionGUID: RBBbtDtaQIa1pE5LRrTjLA==
X-CSE-MsgGUID: Bkoeiv9BSUGgJWqf5xZ1GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33144593"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 14:36:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 14:36:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 14:36:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 14:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQtCqHMv/Rvg9tx527ljftoaWFlf+qqPaPifMQ++Oao20zAFHIgSw25KNbfGovn8DMFmHSpciWFZ/Qf4Cg6jItFLfGUpF+CzBtPBjV5sS+s9LfoYseVi+An+rYqRTvd5unuRaNTNtkeVxlFaRm3gM6x6pVi4z/xtQAOT+sjiT0Y54DCteNfChnR1Y07RBmCA3MMMItKSONuqWq4CXlYzhgYLiikZbZ4HMXBtQefSKvX5+pGnWonNSfQaxQ4QZ4a1wMJlWlOdBlrQohAvAb0ixtBwR4sk+j5fq4KriYNj6utIQDVxKH+279Z+jaMCakMRfUOCtGVa/TaClEa3GGRm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2FbPPUDvjvw7qEF1X4a7TYcSUTnozDwn2zL2E+izz8=;
 b=glXrme6oUTP+lLp2HXfax+OjoiHDSf3Slu11oXl21/KJX8GmhYTXpwFgBb0LOcZyU9MWndipdB3bVbfQRZAHPto3JSn40L5qjHQLQPQa45IDVYNktyD0GLNdFr1jU72uc/JmUKc32nFmuNHkahF9t2ufhcUj6hNdvEBQpy8IJaAR+d/U/DmByHIGWv58fFu/gh9H7AMtRg27u8ZyEwA8YB3I8v4/T7IcnIZLnaVMTNwwpIL6oy7oE5qE9yi7+zKNiix05LUELqSo9LsUEteG0GR10tF3HhB1MtDusLjy9N+7mEXq/YVVqsugCv7g30QJhRXgdEurUs8azs09dgnsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6537.namprd11.prod.outlook.com (2603:10b6:208:3a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Tue, 7 May
 2024 21:35:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 21:35:49 +0000
Date: Tue, 7 May 2024 16:35:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 "=?utf-8?Q?Adri=C3=A1n?= Larumbe" <adrian.larumbe@collabora.com>, Rob Clark
 <robdclark@gmail.com>, "Alex Deucher" <alexander.deucher@amd.com>, Christian
 =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, =?utf-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>
Subject: Re: [PATCH v2 6/6] drm/xe/client: Print runtime to fdinfo
Message-ID: <xwp77yi7y3e3f6eyqf3qqeawsv3nh4db4vwmok3pccdddnimce@n7rts73arupp>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
 <20240423235652.1959945-7-lucas.demarchi@intel.com>
 <ed28cb4e-a417-4255-b034-778dbfdaf6ec@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ed28cb4e-a417-4255-b034-778dbfdaf6ec@ursulin.net>
X-ClientProxiedBy: MW4PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:303:83::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 6427ded3-4308-4637-6767-08dc6edda9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u39bENv7o+xAjoywkJhEPVPdly96cTWPEapFr1T7YBk44g2NXMI/8HoLAFVj?=
 =?us-ascii?Q?S4ACUsnYwKJJfaLjSDIOVwwaXiJzsPpqYl+DP/lL/FlKa/AJR0OYa/yxrQnv?=
 =?us-ascii?Q?NQJGrPd5b25o1qOXtSZ1Lb+/7UG0/ICSmZ1Gwxk2AQkGHNFmo4OxrYZ44dtn?=
 =?us-ascii?Q?JEyAQ4yidkmMMr93h20xTLnpOXwx6z4fProsa/Aymhi/E4w0xvluQtgMw+8X?=
 =?us-ascii?Q?/33Z4zGwVDm5J7VZuxkjAiFdVMrRHxMzcUSONgbVsBcXX5tedt1vvBQBxdrj?=
 =?us-ascii?Q?3GSgzvgGYsfvmi8WegZycxtT3l+wZcks/0Zldx8awyht/aDXaq8aYr2MFifu?=
 =?us-ascii?Q?oyT1YpBAytgZMs0pLoRSq3ODI4COmcfmU1IXgdKDU1SW+wqKj8EcbYTh0fI0?=
 =?us-ascii?Q?f20EEdUnmUNtMDz6rnO8q3eQVbH3TsSK7ulyznYE7/nZVA5hUCcDsEZIIW+N?=
 =?us-ascii?Q?NbY8W0Rf5qg7KTmSMrCCSU0whqkigZw46mAuNZvKfWbAkgtRp9U2Tou1oX56?=
 =?us-ascii?Q?9UyBaN96eG+G8TlBkSoGiQUcw9/rvDjmOGK/BR4L4mRzXZ4b32iqmiq3WhGW?=
 =?us-ascii?Q?Ikz225oeGEzbX92JbRv8mO8+wl5JH+zdFf36tjoJYTho05JBt9pB1FJsFhWy?=
 =?us-ascii?Q?qG5ccDRV+QCU0ZBgHUJQGoHYre63WTmAOlxmufXgVCMBuCOzN4ilgnVyGBlN?=
 =?us-ascii?Q?63NINH8/nSjJyw/agCAY3fijOuFDvAMmlndjrc3O97wm0s7i/umYn9Qf5NDK?=
 =?us-ascii?Q?Agte56bEj6KsNlmF5aFq2p2Vm94f8H2KY2Ek9d5g53F/cJ4HZ5ccKGdoCpCr?=
 =?us-ascii?Q?zhyY8h1TIClL6z45MP+6ZshPdfNq6SXwSuqG6wnluNkEiMKDBCLuyvKk56jt?=
 =?us-ascii?Q?Xlf/FTb1fzXS9RpyrA5MtL8KHEWDkhE1jiMNHmA5BJfgp17P+3rw26nnmkVN?=
 =?us-ascii?Q?4pkToNGMKrtVaLH8LDEQlGfzvkucrbX4H323wQCrCfHHLqlFQ8kc9b9K0VNJ?=
 =?us-ascii?Q?kQKl+GY/jXTPK29ofwQ5kBVzATTammgSky26AAg6/maCo1+od3ABzdjdfTxC?=
 =?us-ascii?Q?iXyQZOUb+evo4UppljhVbDlO0dkQOcuxAANNCLraBEw80B3POJfk4OO7wZzy?=
 =?us-ascii?Q?E7NY6ImFmjDgp0gD42HxMTHdDzy8kb8SzrK/9KVUYbXWHvK02NF3r7cd2eH8?=
 =?us-ascii?Q?gHh0UHPyFtDaLutscXe7WNFsGqoAdqJr6dF+NRjEX9Iw0uhU4wJz88TDylIf?=
 =?us-ascii?Q?vO0tRafrbcNc6qARF/Kdy71IFmFOi8wd8vekYlfiIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wawrWPMqvydBYv0hupVB2EmNzca3dJiWsTSy+JbEtLNPIVWk1Um8k2vGO0Ok?=
 =?us-ascii?Q?7SvqZmsOSE0hBtLfY8gMVsocYasNCmBXS7PY4a5JxvkzS7U1w3TpEgALZRNg?=
 =?us-ascii?Q?S4gRar2AMYwP0o1Jd1iyRFhXVPSG0dRY4cPmzZaXXqB3XcsMG+9YkVNQHuv0?=
 =?us-ascii?Q?x0zeGj60bvIlRcdr9SoUz4uLaeZ2axorCeFPmpbJzGoKBtee/mEAp2qjjVvb?=
 =?us-ascii?Q?5JuxZqR6WQEnIb+VAl39l+AhSu9S0NSIW5eyiL9d0LHxOYqQNoIdcxJuFsaX?=
 =?us-ascii?Q?saWdVsg41cbCQtgICvt5kyfz609WP4jXAjtFYcSnUDfdjLCLEMQDrmbYPVja?=
 =?us-ascii?Q?eQKqSRk7uN9scexjahXAuMT0w5pNNw7bUeMfiQ2/6big+prxcYZPPurmXiuF?=
 =?us-ascii?Q?ERZqkTn/Vy6+Wf9qtZAIcq1RIxqRmBUPGxvNXKdgiGwoWB1lU3vY3X+bg7gr?=
 =?us-ascii?Q?lkE44lYUfnLq8R0KoJE3iOSUFK5h+RrpFKZ4a4CuhUSu+QymmI8hyUCnQsmn?=
 =?us-ascii?Q?4O3+CFpgqRkYUe1DHCkneID9OacfuF3tKrFxkSmMs6aEPYp4z0YlSdhYk+Yj?=
 =?us-ascii?Q?hpWANvMDXO4Gh/3LoWg18PpJqJmLWUKuk3xoi/X+uthsmzPhonAl554STZde?=
 =?us-ascii?Q?obsK8OZ2vuWvF/5PBT9VJwFXdWpbFKVb/uxob4uDvsYblEpSThWBcsioFH6Z?=
 =?us-ascii?Q?u8Kdy0PCpkDAZr3tt7j8DhYUGwn0lx+vvaaBvoHWcBicL2mOjEl++5mTeJEb?=
 =?us-ascii?Q?rqcGMPM/Y+S6g7lmlD1U6ZEWwrvqE9LGMm1hygbl6kUCBrSm9/tt9CuDHPOY?=
 =?us-ascii?Q?qJQJnXmI3w6E8O6PFSQWxHROad8B1bPvBnI3C5UF4g0zQa/MWk+OYsAKpCMc?=
 =?us-ascii?Q?1ho21O/Ae86tBcw7nsBIO/+L8Uk4Zq3GOq+w+swFt5ir+GZAFmYV1U83lsgc?=
 =?us-ascii?Q?W9fEP1xbLyt8UF2b2wn3owoNd9o9OuYCbsttj1Qr7TQOCzJjOWO1xHUQtGsR?=
 =?us-ascii?Q?62Ka1Eb9K/9k6jxyCzbMjrVUU4bsyASfm9wwy2cb/yaHu9buoShbeU4YW6Ky?=
 =?us-ascii?Q?3nFnPkJiNe5Ag9iheg4nZPL6yMhyKtp/sMhr5TNNVSYW8hrif/gFgiidBpAm?=
 =?us-ascii?Q?cFT5LbTK2yn7KTDUB9+6EoWUvo9UGJ9Mx6VhIWaWJx+377vUdLIihPj7dNqP?=
 =?us-ascii?Q?ckOzJ0rfpER05XVvMeuFhvIj+LS3b54cz3t7rCR3BFSFQSx+bkXh/SnGLgf4?=
 =?us-ascii?Q?aRrVvLzc5XwwWI28r9eRWKvaNTNDVAc7ohA1382ABK7TBaiggV629Rmr3/NH?=
 =?us-ascii?Q?9GclUJftNbQE7e0wjxCx1wsMPPNTLRVSXUXILHBjQ22oij9qZmAWy9ydMvPW?=
 =?us-ascii?Q?X3nGQ9DA9tSGRiEyFVBLwa7yDZ0AQdAIfMjRhBIFZEBW8dSBa4WFm5xVkWvN?=
 =?us-ascii?Q?Kur0mw2gWKw4njGAaejXTIfu6Ajbh717GFJoN6zWpkrU2zvNrTPByQagM8+S?=
 =?us-ascii?Q?uSGBAfYO5sUb2UDH2PhYwG+wwy0kLeWWLhaHwZci+ZBr8hFS5BwJ8650Bloz?=
 =?us-ascii?Q?c+hlar2cvwrDjr0eG5ZYoLZIGX9Rsnp0SZCRJLmKVV6qhxcePMJGszenpz1f?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6427ded3-4308-4637-6767-08dc6edda9b1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 21:35:49.7145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00OKxy5sy/eFd4XgQQY/nNFsoMi/eRw96Ba8wJ+S5jiEkv/KR+dqD7z9Pku/z5qNsZ6mnMDQUm6p5wFQ1qNPzi7VOkuG6xNimIp0cAPoxg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6537
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

On Fri, Apr 26, 2024 at 11:47:37AM GMT, Tvrtko Ursulin wrote:
>
>On 24/04/2024 00:56, Lucas De Marchi wrote:
>>Print the accumulated runtime for client when printing fdinfo.
>>Each time a query is done it first does 2 things:
>>
>>1) loop through all the exec queues for the current client and
>>    accumulate the runtime, per engine class. CTX_TIMESTAMP is used for
>>    that, being read from the context image.
>>
>>2) Read a "GPU timestamp" that can be used for considering "how much GPU
>>    time has passed" and that has the same unit/refclock as the one
>>    recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>>
>>Since for all current platforms RING_TIMESTAMP follows the same
>>refclock, just read it once, using any first engine.
>>
>>This is exported to userspace as 2 numbers in fdinfo:
>>
>>	drm-cycles-<class>: <RUNTIME>
>>	drm-total-cycles-<class>: <TIMESTAMP>
>>
>>Userspace is expected to collect at least 2 samples, which allows to
>>know the client engine busyness as per:
>>
>>		    RUNTIME1 - RUNTIME0
>>	busyness = ---------------------
>>			  T1 - T0
>>
>>Another thing to point out is that it's expected that userspace will
>>read any 2 samples every few seconds.  Given the update frequency of the
>>counters involved and that CTX_TIMESTAMP is 32-bits, the counter for
>>each exec_queue can wrap around (assuming 100% utilization) after ~200s.
>>The wraparound is not perceived by userspace since it's just accumulated
>>for all the exec_queues in a 64-bit counter), but the measurement will
>>not be accurate if the samples are too far apart.
>>
>>This could be mitigated by adding a workqueue to accumulate the counters
>>every so often, but it's additional complexity for something that is
>>done already by userspace every few seconds in tools like gputop (from
>>igt), htop, nvtop, etc with none of them really defaulting to 1 sample
>>per minute or more.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  Documentation/gpu/drm-usage-stats.rst       |  16 ++-
>>  Documentation/gpu/xe/index.rst              |   1 +
>>  Documentation/gpu/xe/xe-drm-usage-stats.rst |  10 ++
>>  drivers/gpu/drm/xe/xe_drm_client.c          | 138 +++++++++++++++++++-
>>  4 files changed, 162 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst
>>
>>diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>index 6dc299343b48..421766289b78 100644
>>--- a/Documentation/gpu/drm-usage-stats.rst
>>+++ b/Documentation/gpu/drm-usage-stats.rst
>>@@ -112,6 +112,17 @@ larger value within a reasonable period. Upon observing a value lower than what
>>  was previously read, userspace is expected to stay with that larger previous
>>  value until a monotonic update is seen.
>>+- drm-total-cycles-<keystr>: <uint>
>>+
>>+Engine identifier string must be the same as the one specified in the
>>+drm-cycles-<keystr> tag and shall contain the total number cycles for the given
>>+engine.
>>+
>>+This is a timestamp in GPU unspecified unit that matches the update rate
>>+of drm-cycles-<keystr>. For drivers that implement this interface, the engine
>>+utilization can be calculated entirely on the GPU clock domain, without
>>+considering the CPU sleep time between 2 samples.
>
>Two opens.
>
>1)
>Do we need to explicity document that drm-total-cycles and drm-maxfreq 
>are mutually exclusive?

so userspace has a fallback mechanism to calculate utilization depending
on what keys are available?

>
>2)
>Should drm-total-cycles for now be documents as driver specific?

you mean to call it xe-total-cycles?

>
>I have added some more poeple in the cc who were involved with driver 
>fdinfo implementations if they will have an opinion.
>
>I would say potentially yes, and promote it to common if more than one 
>driver would use it.
>
>For instance I see panfrost has the driver specific drm-curfreq 
>(although isn't documenting it fully in panfrost.rst). And I have to 
>say it is somewhat questionable to expose the current frequency per 
>fdinfo per engine but not my call.

aren't all of Documentation/gpu/drm-usage-stats.rst optional that
driver may or may not implement? When you say driver-specific I'd think
more of the ones not using <drm> as prefix as e.g. amd-*.

I think drm-cycles + drm-total-cycles is just an alternative
implementation for engine utilization. Like drm-cycles + drm-maxfreq
already is an alternative to drm-engine and is not implemented by e.g.
amdgpu/i915.

I will submit a new version of the entire patch series to get the ball
rolling, but let's keep this open for now.

<...>

>>+static void show_runtime(struct drm_printer *p, struct drm_file *file)
>>+{
>>+	struct xe_file *xef = file->driver_priv;
>>+	struct xe_device *xe = xef->xe;
>>+	struct xe_gt *gt;
>>+	struct xe_hw_engine *hwe;
>>+	struct xe_exec_queue *q;
>>+	unsigned long i, id_hwe, id_gt, capacity[XE_ENGINE_CLASS_MAX] = { };
>>+	u64 gpu_timestamp, engine_mask = 0;
>>+	bool gpu_stamp = false;
>>+
>>+	xe_pm_runtime_get(xe);
>>+
>>+	/* Accumulate all the exec queues from this client */
>>+	mutex_lock(&xef->exec_queue.lock);
>>+	xa_for_each(&xef->exec_queue.xa, i, q)
>>+		xe_exec_queue_update_runtime(q);
>>+	mutex_unlock(&xef->exec_queue.lock);
>>+
>>+
>>+	/* Calculate capacity of each engine class */
>>+	BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
>>+	for_each_gt(gt, xe, id_gt)
>>+		engine_mask |= gt->info.engine_mask;
>>+	for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
>>+		capacity[i] = hweight64(engine_mask & class_to_mask[i]);
>
>FWIW the above two loops are static so could store capacity in struct 
>xe_device.

yes, but just creating a cache in xe of something derived from gt is not
something to consider lightly. Particularly considering the small number
of xe->info.gt_count we have. For something that runs only when someone
cat the fdinfo, this doesn't seem terrible.

>
>>+
>>+	/*
>>+	 * Iterate over all engines, printing the accumulated
>>+	 * runtime for this client, per engine class
>>+	 */
>>+	for_each_gt(gt, xe, id_gt) {
>>+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>+		for_each_hw_engine(hwe, gt, id_hwe) {
>>+			const char *class_name;
>>+
>>+			if (!capacity[hwe->class])
>>+				continue;
>>+
>>+			/*
>>+			 * Use any (first) engine to have a timestamp to be used every
>>+			 * time
>>+			 */
>>+			if (!gpu_stamp) {
>>+				gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>+				gpu_stamp = true;
>>+			}
>>+
>>+			class_name = xe_hw_engine_class_to_str(hwe->class);
>>+
>>+			drm_printf(p, "drm-cycles-%s:\t%llu\n",
>>+				   class_name, xef->runtime[hwe->class]);
>>+			drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>>+				   class_name, gpu_timestamp);
>>+
>>+			if (capacity[hwe->class] > 1)
>>+				drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>>+					   class_name, capacity[hwe->class]);
>>+
>>+			/* engine class already handled, skip next iterations */
>>+			capacity[hwe->class] = 0;
>>+		}
>>+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>+	}
>
>More FWIW and AFAICT, could just walk the "list" of classes instead of 

xe_force_wake_get() is per gt, so the alternative would be... loop
through the gts to get all forcewakes, loop through all engine classes, loop
again through all gts to put the forcewake. And we also need to consider
that an engine class may not be available in all GTs... example:
vcs/vecs in MTL and later, so we need to track it globally across GTs
anyway.

>the nested loop with skipping already visited classes. Assuming in xe 
>there is an easy way to get a known present engine for the 
>gpu_timestamp it would be flatter and less code.

from the device we can get either tile or gt. To work with the
hw_engines we have to look inside the gt.

Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>+
>>+	xe_pm_runtime_get(xe);
>>+}
>>+
>>  /**
>>   * xe_drm_client_fdinfo() - Callback for fdinfo interface
>>   * @p: The drm_printer ptr
>>@@ -192,5 +327,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>  void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>  {
>>  	show_meminfo(p, file);
>>+	show_runtime(p, file);
>>  }
>>  #endif
