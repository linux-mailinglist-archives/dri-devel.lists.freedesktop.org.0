Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94336A2A148
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D1D10E447;
	Thu,  6 Feb 2025 06:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9vSP4ja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6C210E160;
 Thu,  6 Feb 2025 06:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738824268; x=1770360268;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dlpSgMlsLfLUGzenHzqAT46vLI46hugqdl42WG7YPEA=;
 b=J9vSP4jalZWF8MG8OK1D42uzz/TQland2EnU6S0xgdY1ie/kYon4aIed
 k8zGcSza66en/qNpp8rZFQczFEca3JjGwGR+JKsuG/c3dIxsj0kIC9HEm
 ZRywqID3RyHVY2OroHy10Pca5SZJCk5FO5P5wCG5yNdz5nm9yFq6FJEOh
 eIiGxVTtfeL65lv7rA54g/J2U8fclyp6jiNXAGRd7poUAXElDf8YKqF5D
 gqNbJEIjsuxUUDyKB6xro/vlbXfervqNo70W3sWY5uXQXSboGnpd8DgwM
 15PCLCARzIrnn+3paOhBKnbYyhWummdIwHsU5o9pK4dTH61neU/qGzvCY w==;
X-CSE-ConnectionGUID: vI2bGcfEQleT9oaOFQSCqw==
X-CSE-MsgGUID: w5U61CaoRdGBZxfNwzYgEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42252261"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="42252261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:44:28 -0800
X-CSE-ConnectionGUID: JCdNf0J2TAKClfFeuJJqlw==
X-CSE-MsgGUID: n/gyeABCTHK2MR1Gy8HuzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="148323760"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 22:44:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 22:44:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 22:44:26 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 22:44:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=In+IbJCz7G6QXx9lBwk1prS9hfT7lBJHkA1l2Id0O/BOYRCr0Dc/ulO0GffV44mbfmONXwWDxmG/sSx4OPP4mgpanmdKFN1go9nW3t6uToc3K2rg9ACZJQCkyM6PQd7wo3pBpwhiqnOCWjcJjjFfiBOIXC6nOitT01KRLGSROl9xZvBd17oEerBTZKFW5O6kcfxUlwa8kTD+v/JyDpQKCYnYYs9D+YkkUZiMQpoFuh6agOFMLFNx+fNrltVOJPxnjPe2a3ZFxa2uUaRUzFVV12yQ//mZSMA09I25kO+/r249lPFAgLkawIH7Q9oalJvw4MjosCyPdlfwwGceWZ5fCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVbDbVqkImIx9shWmkrzuGyF0GembOb6w/6RtbthLo0=;
 b=tJEwXONEj0AQ5G1WD/+UJnIALDNBUsmB+qvALrbMIJ/1jhCBToSoCwAqj4dCehpAz4eBZz54UyP13R6EaiMrq+O4Wcw3MsOkbh+gueVwrAXvZWweKdq5HxsEiW2tqC3o4BcOljKkQXV7DaqEIhgHl7AYhXotZp5OspcTduZJXITkoIa8NtMs4CyAK8CWcqBHyt6sX2loBm4M3fpwJhAAvf/Exe6LVFENuqB3XAbvxK4RW2OX2N8m6Jqvl1rs2XhFTz7zaRQEp25nBajg92eN875oloQI+IbVGxyxA7SuJVozWn/FXBI8/EiZmDqxO1EgxRKKTuKoqKzqS+0pIWV1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 06:44:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 06:44:04 +0000
Date: Wed, 5 Feb 2025 22:45:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>, Danilo Krummrich
 <dakr@redhat.com>, Philipp Stanner <pstanner@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC] drm/scheduler: Remove mention of TDR from scheduler API
Message-ID: <Z6RabijQPbaPDIjn@lstrano-desk.jf.intel.com>
References: <20250205111427.8043-1-tvrtko.ursulin@igalia.com>
 <76739b4e-a1e8-48f9-b547-69b1e2a2504f@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76739b4e-a1e8-48f9-b547-69b1e2a2504f@amd.com>
X-ClientProxiedBy: MW4PR04CA0275.namprd04.prod.outlook.com
 (2603:10b6:303:89::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3924da-04f2-4a98-defe-08dd4679a5d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?24FwWuxNZNS9tgvC0Kg9mDtN63BfXJ7I0tSx0bS1LdDv+B+6SIW6GzRw5w?=
 =?iso-8859-1?Q?rvCiaGhL/IwZJUwRAZG4msyTML1KmipnpKCBj6aJdW+TMnlU9TwoJj8iMY?=
 =?iso-8859-1?Q?vkixwJ5joStK9/LDFqyFCoKJglEaClzJmaKbwgN/+eIXSWq2oXsBTD6HVT?=
 =?iso-8859-1?Q?ai6WyAiCua+nJ2zKvQx2C52LlfL5a/FdmNMURFVwFUTlZh3YawuRxp8yJ+?=
 =?iso-8859-1?Q?qL+D7RzC/1wm7SPOdgs5NXKEP5+Qq01elwmfm9ywsvymUo3JfuOORrJfzX?=
 =?iso-8859-1?Q?hfq2CF48wQIMi+St+flXTjf9GfV9G5nMMj7MgmumzAqmUOVwt4RWICiwpI?=
 =?iso-8859-1?Q?yN8PYQi8O2S+JFyp545Er17hbXTzco+Cy52+a3DUNRzP1GzZpEXltQcsi4?=
 =?iso-8859-1?Q?lWgtCz285ee3e4CTMrm0rEE0LRAD5daR9KlWJ1fypa0FVGJkNsnuVbGbqH?=
 =?iso-8859-1?Q?JeMu5NuNwFMFvUH1SrP7NQGM/ywFr9rSSd5uq1UbcgeAXcp8xawFYASj+i?=
 =?iso-8859-1?Q?JQiFSmrZMp1+LrNSOTeyHMDhFlWsCPHm8LmHIiWekhO2dWhve4YcIQYCmm?=
 =?iso-8859-1?Q?JPG8Rw+NJTwOX65vZ5gT+5kqGCXWzdMQf+lCDkRHQaDAGGvDIAYazueR79?=
 =?iso-8859-1?Q?VFEnoxw4CDdfeyE+Xps6QmT7DAYwfeXgmTTtSNuJKTOrGi2foKzEc82ThA?=
 =?iso-8859-1?Q?DDXSukS/FVFOOIdX+igBSC9x78IY7h8vak3XNIWoPosRXiqc8PrAxWybSA?=
 =?iso-8859-1?Q?6pBwBp9AwAW2FOC7xiQtf0xgUn/RAcvoa07YXhF2+l8c52E51AJpWE/HgD?=
 =?iso-8859-1?Q?lea0tqehtGn3N8QgraFB2VUfCG2jazgBKpGBUVynkWBJqHdgFPwYTIG9b4?=
 =?iso-8859-1?Q?mk1Tb56VsoIbPddAVMvDdGd6oBsBOjxQVndfXI2htGwyonWRYwmTFTstpZ?=
 =?iso-8859-1?Q?i6HC+lgyZpI/Y4cUp5f0o5JA4mxijw/AfjYCCodfufYoCQ3xb9QlArlNfR?=
 =?iso-8859-1?Q?D+kOhcnwt4a1llHz8ldhERaegRtR6E6KnuYQWTfSDhUrRFHkGeG9A/JMQJ?=
 =?iso-8859-1?Q?N0zhIMwmX+IHal7QQfoPqAfKUsqSFcxfh7jKDgQrefe9etqqL3ze3wChE1?=
 =?iso-8859-1?Q?n+BK+AC8PKvQDgVmEd7Gb19whQzlvRA5CnxnW2QnAePatDdwEh+9ubzqlN?=
 =?iso-8859-1?Q?06fAGNLfAmEWEj1njfKYBxGTzzMvAlHTb5UhY6bqbOWjUpCXOn1RZneyb3?=
 =?iso-8859-1?Q?lGlwI5oMzZEl9iL9IT+1EfuOrKa59Q/hiS5LLC+QlbHKylpFqzPm5T9HLP?=
 =?iso-8859-1?Q?TIf06SoDxIHmGZajY0ujmxrOZAaF89DdUDeUryB+zQJTxKlCPsjnMgAbDH?=
 =?iso-8859-1?Q?EFGkoQIjHbgQEc557G/qfu1P08iYf1a039qdMud1hlXJx4r0LRVDxAGELL?=
 =?iso-8859-1?Q?TJkFpjA1GR3zYh27?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RvddVSFUT/fVwOIRtIdaqTV7JK24MldAV1OLkBOxHwVD5ma6qgnq90g/Ce?=
 =?iso-8859-1?Q?nvf3tlZhj/8HIl6+EDE5s70ZTfflUaqPhsLdc7lS/jN5Umpi3buWjibTV8?=
 =?iso-8859-1?Q?odZ7N1RNOnUEVzwpWEEhCd6gx+pq6SDA4MErjvolXjl2P8Ly6XRy31TSKc?=
 =?iso-8859-1?Q?dO905eHUVlcATgG6hBHxKbEEvseA02gVBatvokMz17qbm2i8QYDxSbANY5?=
 =?iso-8859-1?Q?k62FP96t55VWvNbKhRmZO9r3SXb8XcWN0uQ8VOnRUJnW4Enz3YdGv8TOIw?=
 =?iso-8859-1?Q?fYzTBm5UxpiWfWCAwC94l/xEsPo/tFjfUV9hEFqlyP9+C7UYQUiXAI0TCQ?=
 =?iso-8859-1?Q?3dxQLSiOFmhcPPzUL7ibxeAL5GCZoDt+XFT9x3jMJ37JcPY1CN4ceJR+rj?=
 =?iso-8859-1?Q?CY0bZqhnmRwxX1eRYPyYCiBCpt9YyoL3WYdP3M1PpRdiA+OUZtiyqNaCPL?=
 =?iso-8859-1?Q?HIyEBM/bGkrG50Bi/hD8SDizWYu0/C/qDe2dTSzhf86t/lb4oeGvFVvPOY?=
 =?iso-8859-1?Q?Fw7PGwDf0sfzf4RYKDaJtjPgbOEEVpA3vanCqtHFKGUsVd9scGdMmrf8Yi?=
 =?iso-8859-1?Q?SsNJa2CT9ZEZHZjnQuAd3dTCeHUq+p9jZd2tn5oKK5gGQ43HAjTtiwXpn5?=
 =?iso-8859-1?Q?2hOV+n44Dstt+bqHhAp/nrYH04+B3kyqRG/7i7oOGj6dl509row1ElEaY0?=
 =?iso-8859-1?Q?rK3bxemFwmqUqsYnqdDap0CvtH6Pjhi14S7Jt0NV6RAynhnouLFtCtzCSU?=
 =?iso-8859-1?Q?8yNMqFE+EId/ATiqS0W/r8/iqDlne2mqKuFpjYiDM3iNMWSiVaJ6pCTXSY?=
 =?iso-8859-1?Q?o+e7ZVYkzJWpElo0HoSsDsVnT4aystEgptbbZzZNftvzvicaR8S0idAgI3?=
 =?iso-8859-1?Q?URDq/CEGZXbL2hL4mJlDFpYUlBQWl6aW6w2AxcCS+RzZsuLTYT95ZYyy1T?=
 =?iso-8859-1?Q?iO93SAAbkp57K7sP9kzYZg1eaghl9PxQmDeasFmdAUVgTy06DGncaSRRHo?=
 =?iso-8859-1?Q?pqZH8H/+CTiGuGaoSAtGPTv/rLAiQam0BY45AYEYH9cZERua5WpG0z6voY?=
 =?iso-8859-1?Q?ihZAsxO3EofjyQKn7NOxRU7jHOlbzsvxvtYKYGDOQrK0ASWqlsXj4t+dST?=
 =?iso-8859-1?Q?z3I7V/EAOr9pgeTfnv1DXh22o168mA02/+r3Qym1IzUo7ZaAiyQy+Szl84?=
 =?iso-8859-1?Q?bfBhBAnam3yowoRK2Po0zkLTunnSyf/ToDKQlJOGgUgcyyM3tJv25a4/pE?=
 =?iso-8859-1?Q?oJ7g4gs2VUuywVD6qReCj/awypqxtafScNESKDXBAnbSGXlywdsTEs/Xa4?=
 =?iso-8859-1?Q?/v7SKF1zeOU8f8haCxl4j0lSd+xWxiVL4NQbvoqxAt1g8MaIzrnSnlQTfS?=
 =?iso-8859-1?Q?VFRe0LFhftdbLcWxa6uFSHI5PpbVZP7w2Q6chMdTyjxjC4BpGQIvm8j3lu?=
 =?iso-8859-1?Q?NjNmI3/SzNrXW+q273/jOa1iaAiQmrTHutpVCTwMLp6EeZaW1gSTTZ6424?=
 =?iso-8859-1?Q?bmnayICjOthn53SnvvRsdkadc+eOm9SWRHV/eZMsKcu/DhIKpt9zsU+kSH?=
 =?iso-8859-1?Q?JjYbO8Quco4Opi8c3FzAcHDXQ8NECWnE87Er81O0LZYFerSe1vu4AuI0AN?=
 =?iso-8859-1?Q?yuOxNwXlWIy9hOC0TOp7AqK4RfU6FDQWcajFNXcVSowQga1P2wq871Ew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3924da-04f2-4a98-defe-08dd4679a5d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 06:44:04.4873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8hyeMs5J/yOdOmVGKpMEmnuko7AP3ls8x0kK5nlxOcXPw/BS5rUhsy7UOk955F/wgOTKwZQn9NxRTWjMtfd6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
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

On Wed, Feb 05, 2025 at 01:44:48PM +0100, Christian König wrote:
> Am 05.02.25 um 12:14 schrieb Tvrtko Ursulin:
> > Christian suggests scheduler should not use the term TDR because it only
> > can do basic timeout detection on it's own, not the full blown timeout-
> > detection-and-recovery (TDR) as the term is generally understood.
> 
> There is even more to the term TDR on Windows than
> timeout-detection-and-recovery.
> 
> For example it includes a certain signaling of errors which works totally
> different on Linux.
> 
> > Attempt to rename it to a more basic drm_sched_trigger_timeout.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Suggested-by: Christian König <christian.koenig@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Danilo Krummrich <dakr@redhat.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Philipp Stanner <pstanner@redhat.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > ---
> > While doing this I have however noticed the pre-existing drm_sched_fault
> > API sitting right below drm_sched_tdr_queue_imm() added by
> > 3c6c7ca4508b ("drm/sched: Add a helper to queue TDR immediately").
> > 
> > It does not appear to be documented in the kernel doc why is the
> > newer API setting sched->timeout permanently to zero, or why are
> > both needed and what are the considerations to use one versus the
> > other. Perhaps Matt can clarify as the author of the newer API.
> 
> Oh, good point. I wasn't aware of that duplication.
> 

The newer API in Xe is used when we ban a queue to flush out all
remaining job's on the queue - even ones yet to be scheduled. Unsure
how the old API is used in other drivers but it doesn't work for Xe's
use case.

Matt

> Regards,
> Christian.
> 
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 32 ++++++++++++++------------
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.h  |  4 ++--
> >   drivers/gpu/drm/xe/xe_guc_submit.c     |  8 +++----
> >   include/drm/gpu_scheduler.h            |  8 +++----
> >   4 files changed, 27 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index a48be16ab84f..b01792fe6141 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -433,7 +433,8 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
> >   	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> >   	    !list_empty(&sched->pending_list))
> > -		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> > +		mod_delayed_work(sched->timeout_wq, &sched->work_timeout,
> > +				 sched->timeout);
> >   }
> >   static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> > @@ -444,20 +445,20 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> >   }
> >   /**
> > - * drm_sched_tdr_queue_imm: - immediately start job timeout handler
> > + * drm_sched_trigger_timeout: - immediately start job timeout handler
> >    *
> >    * @sched: scheduler for which the timeout handling should be started.
> >    *
> >    * Start timeout handling immediately for the named scheduler.
> >    */
> > -void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
> > +void drm_sched_trigger_timeout(struct drm_gpu_scheduler *sched)
> >   {
> >   	spin_lock(&sched->job_list_lock);
> >   	sched->timeout = 0;
> >   	drm_sched_start_timeout(sched);
> >   	spin_unlock(&sched->job_list_lock);
> >   }
> > -EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
> > +EXPORT_SYMBOL(drm_sched_trigger_timeout);
> >   /**
> >    * drm_sched_fault - immediately start timeout handler
> > @@ -469,7 +470,7 @@ EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
> >   void drm_sched_fault(struct drm_gpu_scheduler *sched)
> >   {
> >   	if (sched->timeout_wq)
> > -		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
> > +		mod_delayed_work(sched->timeout_wq, &sched->work_timeout, 0);
> >   }
> >   EXPORT_SYMBOL(drm_sched_fault);
> > @@ -489,14 +490,15 @@ unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched)
> >   {
> >   	unsigned long sched_timeout, now = jiffies;
> > -	sched_timeout = sched->work_tdr.timer.expires;
> > +	sched_timeout = sched->work_timeout.timer.expires;
> >   	/*
> >   	 * Modify the timeout to an arbitrarily large value. This also prevents
> >   	 * the timeout to be restarted when new submissions arrive
> >   	 */
> > -	if (mod_delayed_work(sched->timeout_wq, &sched->work_tdr, MAX_SCHEDULE_TIMEOUT)
> > -			&& time_after(sched_timeout, now))
> > +	if (mod_delayed_work(sched->timeout_wq, &sched->work_timeout,
> > +			     MAX_SCHEDULE_TIMEOUT) &&
> > +	    time_after(sched_timeout, now))
> >   		return sched_timeout - now;
> >   	else
> >   		return sched->timeout;
> > @@ -517,9 +519,9 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
> >   	spin_lock(&sched->job_list_lock);
> >   	if (list_empty(&sched->pending_list))
> > -		cancel_delayed_work(&sched->work_tdr);
> > +		cancel_delayed_work(&sched->work_timeout);
> >   	else
> > -		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, remaining);
> > +		mod_delayed_work(sched->timeout_wq, &sched->work_timeout, remaining);
> >   	spin_unlock(&sched->job_list_lock);
> >   }
> > @@ -541,7 +543,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >   	struct drm_sched_job *job;
> >   	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
> > -	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> > +	sched = container_of(work, struct drm_gpu_scheduler, work_timeout.work);
> >   	/* Protects against concurrent deletion in drm_sched_get_finished_job */
> >   	spin_lock(&sched->job_list_lock);
> > @@ -659,7 +661,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >   	 * this TDR finished and before the newly restarted jobs had a
> >   	 * chance to complete.
> >   	 */
> > -	cancel_delayed_work(&sched->work_tdr);
> > +	cancel_delayed_work(&sched->work_timeout);
> >   }
> >   EXPORT_SYMBOL(drm_sched_stop);
> > @@ -1107,7 +1109,7 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> >   		list_del_init(&job->list);
> >   		/* cancel this job's TO timer */
> > -		cancel_delayed_work(&sched->work_tdr);
> > +		cancel_delayed_work(&sched->work_timeout);
> >   		/* make the scheduled timestamp more accurate */
> >   		next = list_first_entry_or_null(&sched->pending_list,
> >   						typeof(*next), list);
> > @@ -1325,7 +1327,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   	INIT_LIST_HEAD(&sched->pending_list);
> >   	spin_lock_init(&sched->job_list_lock);
> >   	atomic_set(&sched->credit_count, 0);
> > -	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > +	INIT_DELAYED_WORK(&sched->work_timeout, drm_sched_job_timedout);
> >   	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> >   	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> >   	atomic_set(&sched->_score, 0);
> > @@ -1395,7 +1397,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >   	wake_up_all(&sched->job_scheduled);
> >   	/* Confirm no work left behind accessing device structures */
> > -	cancel_delayed_work_sync(&sched->work_tdr);
> > +	cancel_delayed_work_sync(&sched->work_timeout);
> >   	if (sched->own_submit_wq)
> >   		destroy_workqueue(sched->submit_wq);
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index c250ea773491..3fd728b1bfd6 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -44,9 +44,9 @@ static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
> >   	drm_sched_stop(&sched->base, NULL);
> >   }
> > -static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
> > +static inline void xe_sched_trigger_timeout(struct xe_gpu_scheduler *sched)
> >   {
> > -	drm_sched_tdr_queue_imm(&sched->base);
> > +	drm_sched_trigger_timeout(&sched->base);
> >   }
> >   static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 913c74d6e2ae..968709fd6db4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -778,7 +778,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> >   		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> >   		xe_sched_submission_start(sched);
> >   		xe_gt_reset_async(q->gt);
> > -		xe_sched_tdr_queue_imm(sched);
> > +		xe_sched_trigger_timeout(sched);
> >   		return;
> >   	}
> > @@ -807,7 +807,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> >   	if (xe_exec_queue_is_lr(q))
> >   		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> >   	else
> > -		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +		xe_sched_trigger_timeout(&q->guc->sched);
> >   }
> >   /**
> > @@ -986,7 +986,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
> >   		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> >   		set_exec_queue_banned(q);
> >   		xe_gt_reset_async(q->gt);
> > -		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +		xe_sched_trigger_timeout(&q->guc->sched);
> >   	}
> >   }
> > @@ -1144,7 +1144,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   			xe_exec_queue_get(q);	/* GT reset owns this */
> >   			set_exec_queue_banned(q);
> >   			xe_gt_reset_async(q->gt);
> > -			xe_sched_tdr_queue_imm(sched);
> > +			xe_sched_trigger_timeout(sched);
> >   			goto rearm;
> >   		}
> >   	}
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index cf88f2bd020f..666968cf505d 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -494,10 +494,10 @@ struct drm_sched_backend_ops {
> >    *                 finished.
> >    * @job_id_count: used to assign unique id to the each job.
> >    * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> > - * @timeout_wq: workqueue used to queue @work_tdr
> > + * @timeout_wq: workqueue used to queue @work_timeout
> >    * @work_run_job: work which calls run_job op of each scheduler.
> >    * @work_free_job: work which calls free_job op of each scheduler.
> > - * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > + * @work_timeout: schedules a delayed call to @drm_sched_job_timedout after the
> >    *            timeout interval is over.
> >    * @pending_list: the list of jobs which are currently in the job queue.
> >    * @job_list_lock: lock to protect the pending_list.
> > @@ -527,7 +527,7 @@ struct drm_gpu_scheduler {
> >   	struct workqueue_struct		*timeout_wq;
> >   	struct work_struct		work_run_job;
> >   	struct work_struct		work_free_job;
> > -	struct delayed_work		work_tdr;
> > +	struct delayed_work		work_timeout;
> >   	struct list_head		pending_list;
> >   	spinlock_t			job_list_lock;
> >   	int				hang_limit;
> > @@ -571,7 +571,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >   				    struct drm_gpu_scheduler **sched_list,
> >                                      unsigned int num_sched_list);
> > -void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
> > +void drm_sched_trigger_timeout(struct drm_gpu_scheduler *sched);
> >   void drm_sched_job_cleanup(struct drm_sched_job *job);
> >   void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> >   bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
> 
