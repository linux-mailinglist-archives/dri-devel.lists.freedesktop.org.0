Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5578944E0C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 16:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D65710E98D;
	Thu,  1 Aug 2024 14:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pv36+4MM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA3C10E989;
 Thu,  1 Aug 2024 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722522631; x=1754058631;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hphi8v+RMAorPXq1M+SrSO4FQNcFCKtGDXWbBntc/O4=;
 b=Pv36+4MMunNlWPokqYyXhYP9CgZf+LVpv2tZ5F1OQy5xtiKvqFzTrCtM
 AE141pdh7bc8MNHJUO9/KRDw73GRNg40t7G3EMUAmpE3m70HgP/wB9WmW
 Wf63tPLQ5f5bfP6BaxDo8twF67oMnZGP1f8EncbrUBzg+OK6v2KCQ6Odo
 HWqwRtSXmzA7qhn7cNjN3VSpxZrEQOSY37YFPbElVxHac7wNbWu5gu/AR
 HBEa/HFnyiFtG19IFtPUw3M2/Wg8vIN1wL9ceHCbfZLd1BVeKbgp/1d2f
 mYlOnutapjKux8vsJJF7tLRQWM0aY7IukznnCb8uzls+g1ErxSgTH4jqf Q==;
X-CSE-ConnectionGUID: u3JSK+7GRf6rHi885SoY8A==
X-CSE-MsgGUID: 1psea7VDTzChfRt/hn1aaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31629824"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31629824"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:30:30 -0700
X-CSE-ConnectionGUID: HNM+MAvxQTaELMe5cnKFQg==
X-CSE-MsgGUID: 7iKP82NqSEy0Q1SsZcQ8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55297311"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 07:30:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 07:30:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 07:30:29 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 07:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U70+Uch3Fc75G4lJyavb7YVt2CDjgqvj19JNNLhE/dRutWsqjKbxPYGAb8eSCHoQzgenCUPWTxXOf2SwsvCvQr7GTj0l8D+rOixt+VVgyAZlJYcysb//h106gG43YsN1gcK/qgbgO/BvJ71woCaQCI+KBm/xT8ebtZO7iktfLtwhc5QzHS6p8GZkyhWx8zo4a2TSJP/2piJw0dOfzfiIyJ1i6o549TKO9gOwdes8+YWAMXCFpKmXZ+perB+IJAUMxQkX956DGg12vY+M5ooIhy6qkLZn1qFeaRg8iAtV6EqHlbzT+mz8cXb7F9xPDeH3HHrnANstbTEw05TALQqpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkBol0ASicC0JeRiszstyF06yIsNqV0mPAh2tnDjBhg=;
 b=cvDWfKQydjL2eI2x04qS2edOgA43rK+sccy4b5uC132//MR/yU2R3FmPeB5F//EK8qgsK60+bK3SmSu74tR70ArLfSeyZA1Kk/uaEX+JIYmj/vqa+0iNLRKbWLGsCW6IcOmIYMulf+bC0UhUesS3UbGnW5PKqYwKnnXQET2XnleozQH4HPs0knNlNKFmAp4hofoSmByUTlbL9A93p5gDQ1ep8QsYKkEHKeJsJ6SJJXuHEUAld393aq9Dcn653yBLuhAK+roxqiOi/WscvA6m74Y5AAdCixNj5oRfiI6daSRwlTPSvl2sexQ/YEkZgHY2inu8j9uKZYpU5YxXVA2XwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 14:30:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 14:30:25 +0000
Date: Thu, 1 Aug 2024 14:29:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
Message-ID: <ZqubytFqikzQoKtC@DUT025-TGLU.fm.intel.com>
References: <20240731213221.2523989-1-matthew.brost@intel.com>
 <20240731213221.2523989-3-matthew.brost@intel.com>
 <CH0PR11MB5444E19C7B2423D654F3B2AEE5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZqrQn8BwrVdXtdjG@DUT025-TGLU.fm.intel.com>
 <CH0PR11MB5444838A9E768A2E4D990E24E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444838A9E768A2E4D990E24E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:a03:100::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e7db6e-4d78-46db-88f1-08dcb2367bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h4BuPgIOxqMafA5KXlx/v34wz9u3Eo/Sj22sVR+ogY3J6lriIfM2m4qrx1+M?=
 =?us-ascii?Q?g+vQVIVqJW4TpDM4Na4jMRlUuUBrQl2HFGNt30De0n/mBebVXyMm9jg6StQf?=
 =?us-ascii?Q?bbz78b7LUpHSMCmJ66g+oJpLsbMilVazkTj10P9HegIg8jwXj7g2ami/25DG?=
 =?us-ascii?Q?2bqWxgb67pHsdAr1HlTTG87FgR4B4aV6/y4srsTpXGgsBi+sFY6VejKLG8Jc?=
 =?us-ascii?Q?x1cXznkFt3P+cZFDt7SS+dc4gosghWB2FLAYuHiqi5Zv4VEa59ki3eIGpR1M?=
 =?us-ascii?Q?3OhRCi2JX4WnmROA8hvNE0SgWUccRZTs7aEl/ljXKyjYxugJ9v9Uo0ka5nWj?=
 =?us-ascii?Q?WhdtyOupt2aoJTt+rEw/AJkY1Dgd2rHCk3cUh0gL1DK/aqHl+3iQPA9+KfIn?=
 =?us-ascii?Q?fOFIn1LBk2wXm7bDXjISBE0iFDchR1v5KD7nGCR5AOQJ6/d0WhkbyAEccdRm?=
 =?us-ascii?Q?adeDHZaM4kjW6N48ldidtn6XuHthr/BD8cYrmo/XWftLbiVeEKKXiY6sk0HS?=
 =?us-ascii?Q?zjC28sOMVt/DS5FiHktFRWH1qEeBHaUArWzfD7/6bH0zTcaxJ4Przef1y3+U?=
 =?us-ascii?Q?wk+eBhjLWiWz5e/rzQ9oSxaMN1wIDstcri70m6brOVceLzJDtk4Kj4cc6Swg?=
 =?us-ascii?Q?IwR+W3aCaLHtOhYGPkzJ+iv6HMFGdTdhT80UgsOgnSj73qJscNx/RbbD5IOn?=
 =?us-ascii?Q?pk3zPb49reB5BWr0PsH7Y2ULnsv0wwl5++3Qdj6rLTfuKxjCbZtu/rA1ylQU?=
 =?us-ascii?Q?AbA3z/TrUOvoNMrJYvhNGUzj+zK9o/+M6PfQzmCLJEU/iTdW0ix42oA97ltb?=
 =?us-ascii?Q?yUVIz6HbQEMEy7F4o7FNZts7SMGAF4Rzwo6cTZZFpRaV2PSaQJLBFAw6yRQd?=
 =?us-ascii?Q?1N2izdFMt/9INyckO9Rj61PgSKxJ7SfWnKryhQZBOg+yvgDnBHPsEuQnc29Q?=
 =?us-ascii?Q?IxzM0QOEipmGaI7KThuyuoFc9iJKjP2obxIS2Mccw8EL0gW15cPaGd6f2wEH?=
 =?us-ascii?Q?SIj+suSLhD5BeiIP/PKpF2fns4y/Yw07YcHG9Ca3+1lzhUF2iyCYiQlUsb6H?=
 =?us-ascii?Q?kKBmWh2lUnwM2vyMMkLBx7qxgdRerUkBan/HH8cw3lOdS+/pxEWvZeaGV9S7?=
 =?us-ascii?Q?wwNvCh9yde5E0CVXHEOZbwaIMe/HiuvbucEdI/pP7JHjuNR6j4bxDfWmAemZ?=
 =?us-ascii?Q?KLU5JPwCFa3xrMZm2TK3xKWBSm0JjtzVaImThVpDx5l1iZa5gbve8lRe3jWU?=
 =?us-ascii?Q?mXjK44ZTSEgcslqkQyw9CjMZnSDc491NsOpKOKDBNtApwy52lJFIrvN1DhMv?=
 =?us-ascii?Q?1orJEigxha7/3yAxNJtBCWnk+UvH9tDe97NVTG+NsPOwXQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1EB30x7ITsrazpQ8Jjxxf83yMVoXUj7F+lpYQC1Y5qnmqfe3I4WyC7Vl6+G8?=
 =?us-ascii?Q?LnKXsl1hdX94jsEqZrxZsXBmOKl6Li97I4hB9SwlCilH8RSpRNwajJKlgWHO?=
 =?us-ascii?Q?gqBAWnTaV2ddJ9kruUm2P1Nc+We2VVAVDrYlFdmLwvmB4OJBLcJ4v9TIBI+K?=
 =?us-ascii?Q?3IXwWNVE7nUdLK92wFtATAPcaLs1q+8SffjzMdqiJ6Ckec0y9Od75CfYmrH9?=
 =?us-ascii?Q?hK/yGeccaE1/Cs6xyOMSixmjDGXrXGuCD+EQ+j5uacJUBZmKYTps6RPZEXYt?=
 =?us-ascii?Q?2QB0VmzdcW2nW3n1GocBNZydpeo7iX2oeJ2jHYmU7qiRTRavs3UdX1lSm+ag?=
 =?us-ascii?Q?TOIlzekpc8HSwnEwyocQqkySonipd2KZE2nJm4mOeVqAnuHDXMKbjpf1YqgS?=
 =?us-ascii?Q?sncbXoH1unEhSt0h8HaPoquaoSDE82EkBLs8378XdnTkPwC4QRkFFY0/gJ3U?=
 =?us-ascii?Q?7HZY/w5l1sgF8VOQ2t3qLlfOJAlPE23UaEn4iY9NDIJoU66ub8W+VGPKyUJv?=
 =?us-ascii?Q?bXkPBvEgDwDiIjxtfzyHn0dsCsZaCXAR0CQa5JHUUwhM4VoUUWnt3ItvEBg0?=
 =?us-ascii?Q?ttRZ9fh9ESZgeRZyfg/SASmBj4AVqWDFNOa7e/dk2VXK8kCog2VVkW3n9sRb?=
 =?us-ascii?Q?IHhN/oS9VbytzlkSxnkdwj4gfule8XLjS5jH7HhkIa0P7+WNY55QPScodCY9?=
 =?us-ascii?Q?lsrZfYouyxz/bWJxuHEBrzugT4qpDG1UFfgvwGgkLlzA9hRSjjA6+ZAU7flY?=
 =?us-ascii?Q?0QGXy8IPwLA9DHKTJKNs/UertmnWiFywml9iLg8gOTuA5McRWSZWlX0IHVC7?=
 =?us-ascii?Q?tbSqEDzzaJKT12lwOqIvX6dLTh/cP+egVgzMq5xGJ7w2JGu+EEfwOBalZbdJ?=
 =?us-ascii?Q?YGBC0/7D2UqkcfEpx11tAyfjpYHBlq27ZjhC2hUT+01hR4FMlUwnip9XUORc?=
 =?us-ascii?Q?F8X1uMjw/8khqsU8mN6uyso3IT3LMfRN5cAZnQPbaRiyU5vI3JpQMsm/NhLX?=
 =?us-ascii?Q?nlpYCEwuf3Xffj0KURlIsC4CFYGGIZStN9VrrhgItuX51pBMl1SeCSIpzpaF?=
 =?us-ascii?Q?2UEvaken+pV4rGRZVhvP5jUE2Fk/npRinCz3hDesJRCHbyNyU9b1ZvFBvxew?=
 =?us-ascii?Q?jFSCG0tDuZU7InltWyEE+W1awwQxLc5Qfq4KCjHbelUyLGlliWC2Pu/oXo5i?=
 =?us-ascii?Q?18AjrGAsWVlsvnVt5IbcJdiCXygmUQAdYHPPTTu/gUXW3jbeAeJwriT0nKWj?=
 =?us-ascii?Q?oK6vNQwWJiMoADaLn/DYbieK3gG86tj6Aq5ygJ0fobL/pwLVjOkB2iAjq21F?=
 =?us-ascii?Q?dP5ci094TNFjdm2NkTezdzOBMCNVZrm6Nb1tRL0PdRl94HjYhOhHqeeHv1VG?=
 =?us-ascii?Q?Jj+siyiEuiXv/0Z7WV0/uqK8PR8AMZZxgADxrCo4iubowARzlE6AtvgyB81l?=
 =?us-ascii?Q?4Whv98rWerfGx+L1zhc4Q4cDEJaH3I/Ij/nJMS79y4VGhh/6oBXvuFWV716D?=
 =?us-ascii?Q?sQQPl9toByATn6CJxx8QxLgLQf529xiPtoBBXgo6TzTeFJ1lMiANOAHMWRIR?=
 =?us-ascii?Q?g2v0AtMTIaZw3ruOMm/Mx8b7WIVRS4J3N8sl77eN699Lb0l2LUnePZNEnJ27?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e7db6e-4d78-46db-88f1-08dcb2367bc7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 14:30:25.5577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZYqO5jvtPKvYZvbYVUVx4ym3MgGGMjjDdtMGaa7pde0YKw7NOSPL8K4Zst5HBFSE3QqwJpHJLGqPRUaXBndVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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

On Thu, Aug 01, 2024 at 08:00:21AM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com> 
> Sent: Wednesday, July 31, 2024 5:03 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; maarten.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
> > 
> > On Wed, Jul 31, 2024 at 04:22:03PM -0600, Cavitt, Jonathan wrote:
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> > > Sent: Wednesday, July 31, 2024 2:32 PM
> > > To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > > Cc: maarten.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Subject: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
> > > > 
> > > > Useful to determine size of devcoreump before writing it out.
> > > > 
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > It seems this patch prevents us from copying strings into the data field if the data
> > > field hasn't been initialized.  I'm not certain if it could ever be uninitialized at this
> > > point, but I recognize it as good practice to check just in case regardless.
> > > 
> > 
> > That's not the intent. The intent to call the print functions with NULL
> > data so the printer can calculate the size of buffer required to print
> > out all the devcoredump data.
> 
> So if iterator->data is NULL, you want to NOT copy into it?
> -Jonathan Cavitt

Yes, exactly. Run devcoredump printer with NULL data to get size, alloc
data based on devcoredump printer offset, run it again with a valid data
pointer to print.

Matt

> 
> > 
> > Matt
> > 
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > -Jonathan Cavitt
> > > 
> > > > ---
> > > >  drivers/gpu/drm/drm_print.c | 13 ++++++++-----
> > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > > > index cf24dfdeb6b2..a1a4de9f9c44 100644
> > > > --- a/drivers/gpu/drm/drm_print.c
> > > > +++ b/drivers/gpu/drm/drm_print.c
> > > > @@ -100,8 +100,9 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str)
> > > >  			copy = iterator->remain;
> > > >  
> > > >  		/* Copy out the bit of the string that we need */
> > > > -		memcpy(iterator->data,
> > > > -			str + (iterator->start - iterator->offset), copy);
> > > > +		if (iterator->data)
> > > > +			memcpy(iterator->data,
> > > > +				str + (iterator->start - iterator->offset), copy);
> > > >  
> > > >  		iterator->offset = iterator->start + copy;
> > > >  		iterator->remain -= copy;
> > > > @@ -110,7 +111,8 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str)
> > > >  
> > > >  		len = min_t(ssize_t, strlen(str), iterator->remain);
> > > >  
> > > > -		memcpy(iterator->data + pos, str, len);
> > > > +		if (iterator->data)
> > > > +			memcpy(iterator->data + pos, str, len);
> > > >  
> > > >  		iterator->offset += len;
> > > >  		iterator->remain -= len;
> > > > @@ -140,8 +142,9 @@ void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf)
> > > >  	if ((iterator->offset >= iterator->start) && (len < iterator->remain)) {
> > > >  		ssize_t pos = iterator->offset - iterator->start;
> > > >  
> > > > -		snprintf(((char *) iterator->data) + pos,
> > > > -			iterator->remain, "%pV", vaf);
> > > > +		if (iterator->data)
> > > > +			snprintf(((char *) iterator->data) + pos,
> > > > +				iterator->remain, "%pV", vaf);
> > > >  
> > > >  		iterator->offset += len;
> > > >  		iterator->remain -= len;
> > > > -- 
> > > > 2.34.1
> > > > 
> > > > 
> > 
