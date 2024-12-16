Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C762A9F355E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C9710E6EE;
	Mon, 16 Dec 2024 16:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGmny6Yi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA8A10E15B;
 Mon, 16 Dec 2024 16:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734365339; x=1765901339;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rzqr1SJal7XJmGIwCTrkQHMAqdQYvoQBKLnTht2C/6Q=;
 b=RGmny6Yi2GR961V0vQqFVGyf/uWnkQ3sMn8LzUWUd6As4ipvgZjJl8Vn
 /aRnQmbCebTzttsNyHGER12QTAVQr1XJnzHB6RDLnRjahA8GDk+rR5aOf
 mhKpMgWR4HSr+EH75lHYDxO2iSkV88/C19XTudEC8+gizMlFfguQXEYqt
 4NLcUNA1jwFiaylO+ea5SwzclaZ1wlx5lnRrFRdpVZGXdA0+gz2yz0Jte
 SIP3nfSP214TrLEw9efg7pMYU9LyziC2sUmF/dDiYuEZITtUYmdCKZWmy
 l02de9oNsCNQhYfqSYYuW5o6t9Ot63VVum7ejKlhn/BOI3Z0caXmd8OCp g==;
X-CSE-ConnectionGUID: JHd2PZF1Rl2uV6fqH6372A==
X-CSE-MsgGUID: HR5rVkdTSRKtpPrTJHQYZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="60142951"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="60142951"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 08:08:59 -0800
X-CSE-ConnectionGUID: AHlZPEefSKa6CQ9cRMnPfA==
X-CSE-MsgGUID: 7pWOGDxzSB2JbX5WlyxYVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="97139512"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 08:08:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 08:08:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 08:08:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 08:08:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxV66SRLQDOHUR87etHoUXrtQOkPDgJvihQuq/sN1+1g1C3HFRuJGD1aNuBc9xQUNR/YBc81y5odKok87ZaXHOMaz1dt2tc/yEwPMkP3vy8K1aVjH6YiYKrisYQYEgDDK2iJ7Id8wbPGIuup0xaw3dNwaxuvS/0iiHgpVS7c5tZq5g6D9u/rS/V8GiZjzEQcQzzzOYFvj3i/aKLeGX/FXvokt5Kn481Vx2c/XOUUBC2IfR3egqiBRrJpef+uO6Ph66pFaB0MfK+dvOvnaNhP+dE5BmgusAxEPuxsIPyP+ckhVtNm1NCZRbFdK5lqN5K6BqZgBsOlu44anR68TqqImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ca9XNVy3Xgvx9l9V0A4AFEZdIMrtdYscrE0jElEU76A=;
 b=EizIs7nDja8B4iIVwZILZvFLw95F0L1u4yDBWQJQIVMe0ZdF0RSf/eZ1wgtj5ExF+KBfGrUNKmXukguk8MCId6sR5MNGk5PYW69GjsqzDOHElRwmHbf6I6mOwTiHuV85I7dZ+i/f4uhhyzdLEUPmUYZuE1wQ1+RJSaoCKyJ0XmoRratsLfX4dqeGclJri24YmnLQZ5/5ujEXkLCb8jRipyD9GiOUt+kA/58Q+mDvUS9XUkQvHLGzBPvd+7pwzfuzVe0UWApxXRuoudScP+g+NKTBelEWEgpFsP22PfES2yBOVdPpaxu5QfrMv86vVf/HejfjrfgtmSUpStdAKosrog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7702.namprd11.prod.outlook.com (2603:10b6:a03:4e2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 16:08:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 16:08:55 +0000
Date: Mon, 16 Dec 2024 08:09:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 09/29] drm/xe: Add SVM range invalidation
Message-ID: <Z2BQwiWBMmmozLcc@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-10-matthew.brost@intel.com>
 <12b541d3a1b46434032afc1bcb9ce90428aa24a5.camel@linux.intel.com>
 <Z1nherArkwqT9g0/@lstrano-desk.jf.intel.com>
 <a6a58f606bf76f5c4e398f6053e8d20148f9d01f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6a58f606bf76f5c4e398f6053e8d20148f9d01f.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:303:b7::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 558ab0f4-bafe-423a-244d-08dd1debf108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GRCF5A7KqDHI3S7ZslHXUr6IXczVwFv/DoUtva1obYxENh06DXh6EEcYId?=
 =?iso-8859-1?Q?INNEgJmm0welRCrTD7VngDJfng5nhn53Iv8T02aK32R/ePvvvCVfYqkrjQ?=
 =?iso-8859-1?Q?9x+9iKCi6Q9BHiROdcoZ6V8+zTg/dDxatMdVkqJOAK0Uu0Pho5aQKbzchr?=
 =?iso-8859-1?Q?2rWCbJmOM+Y1ldu7nbNdPXWpbLgvfyfDZ+h3EdkGA5k4ifw/lic60087KM?=
 =?iso-8859-1?Q?5SGDrdo9MaQTJr2r6/PJjwkLSc1DoMnUDoDL/pMCaTMvraKRm/9UoO7lS8?=
 =?iso-8859-1?Q?k7hT/QcL/IxnR7ZvfdGpd7KbtG5gZQ4Q+Jroj5ALpw0oxOGsKMDbuPTTsa?=
 =?iso-8859-1?Q?n5cZ++JzwqK7IhOvweRVY8p6QHIsdAUbxC5Iglj3UScnEPO2EpUfEjNyd3?=
 =?iso-8859-1?Q?OXIVFIFyw3cGKh88mLFgBMdWd55rgpD5fcA1I7vxnkeaeY1vJCoIx4Kcl+?=
 =?iso-8859-1?Q?nR9qxNco2pgxjr8ADBX/IPjPa5Sps4x5WodX19bs7GPYXekSB4YYw595fo?=
 =?iso-8859-1?Q?ptsA9j1Kg8id5WIourIyJWlxW9L5waq2WFI3C5HeGYuKIZiw75ok5dcJmp?=
 =?iso-8859-1?Q?Odp+KjR/IIK3//aNPL5bSyYRBYvAjQm2GwMT2et0V/BitU+DstwvmDfYLx?=
 =?iso-8859-1?Q?RBqkP2/SWuiAJLrfPajhYjw6Kud4tXiimHw+GGpS80TZMpV1S0Er6NQITK?=
 =?iso-8859-1?Q?ciAGCfMaidGQ4cos4CYbPExCnyvdW5HdSswdPti3B28mHcoc7PDMnmjTch?=
 =?iso-8859-1?Q?o5/Hqtkyc72Djv0GBznAsuEH+MpS7jjqJ+gg4HbJVjD0A0yYoPQiNFa2Iw?=
 =?iso-8859-1?Q?RqgDDKQXPVG+rY//GraCteCc7J7pOvgm7/2d9sayxjIlC+p54UndW9gmf1?=
 =?iso-8859-1?Q?FunXOPJ55HN2jBAxdxXPY+BeJGGzUvcpKKYQy9eJmpUtIq21jkYaPbB7oB?=
 =?iso-8859-1?Q?P0bxSA65PMQ6Z81NyX9BAe1c7Ju7JPhFvPXYW5ZUIarIFMo4CdhfvgXOyU?=
 =?iso-8859-1?Q?vGHBCYrPWDpAar1A8OhBmXLDMDVfgjSHomX5eqDx7E+dS7XEY5QCe82cJn?=
 =?iso-8859-1?Q?BGmeudvhHOlD4a1Kz9Z8ToxXrCMFeoroPLNfK4ZLatYeJaiwQHNwLp8WEn?=
 =?iso-8859-1?Q?aP5oX/MzFC+rEZqY1TAu0m3znfYl/r5LDGni2rDuTxDdY2wSuWiXVgzled?=
 =?iso-8859-1?Q?nYleVSwnTIrRMAP2XdWl7n3na8O0ImRbQrXJOMU5vf7lotAAUFfrP7u46t?=
 =?iso-8859-1?Q?wkzbqq2Bmk13IxCBPpp6cCiCOAcJ+sYv/Wdffv9adB7lGp3oW7FDPwEm//?=
 =?iso-8859-1?Q?E4kFhl49PFEskx5Bm+5mKKbqbYfP+CtdmgiMVHc0uIvnusl8mvAsXYMPXv?=
 =?iso-8859-1?Q?5yD3AtZU2JClAJ/37Ho+thIPtdsamECthlewa2g6Nzomdr2iNqnBKhZOEG?=
 =?iso-8859-1?Q?q8Kkr7D/i4luRy+l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FDss4eEf3kop4ggQy0qEnrL3TEKFqcZl0huMhUf9ZPruj0rkAFOoaFm9GI?=
 =?iso-8859-1?Q?OFE7kRssEtFfjQDGVa1mPdcR7zphs2vCUd6jT7lUuAA+bjY5wfaL7c2ztj?=
 =?iso-8859-1?Q?E7eIpvlu7X1vopY3s2g/8eMpxcmKIXI1Dbvk15KeGqNoNo2RKDUGIQbk2e?=
 =?iso-8859-1?Q?IimSSYFaxqVmXgtvicPv9Lk22tjtSal4G+ekYhxpInxC8zUItkXv7y+NO5?=
 =?iso-8859-1?Q?LSaDLUFaUJsKDEWof/FTgO2CdVkdNeQDkdZLz6F1GLqJRhFUo53vAi0Pel?=
 =?iso-8859-1?Q?35Lpgr3AYqza6q2r7tEA5Mxrjenmap7Y+rdeq8f76VlptzhtxXgi5v4mra?=
 =?iso-8859-1?Q?GFUFlUK6fH6WtTI9HPCKX9KDj/4OuDDvP109PFdasFbnRLtEudygPL1+uz?=
 =?iso-8859-1?Q?e6dQsCXUxdAeCUrlzNXRnlYbx2QCOXzGAhhHsfOTv+PntKSyaeDvpSSVRA?=
 =?iso-8859-1?Q?PRXQoJIuTn1PR+x5FTIKtAWfISucu4oXd5xGkrHTBd235vMumGi1ura1vj?=
 =?iso-8859-1?Q?sGquSK8sCOzqaJwm44pi/eR1sKkZ7Bl0XY2EXmJoObzscsMhbzIl8VGXEk?=
 =?iso-8859-1?Q?zXShCN1EcaGUqflBbVtjmuijeGCkLIkTUCI4GFw1oJzwFgnvKmxUxkFcYE?=
 =?iso-8859-1?Q?tc52q+TklRmrVvkdRhPlD84T63Xt3pcfb6kCfJIt5kPqmhEjDUjBz7GA6c?=
 =?iso-8859-1?Q?szWw+atDAQiwAoXly5H03WBir4MLSqx5kkgI3qJ8/WYXAaYUCIG2Mf9ns7?=
 =?iso-8859-1?Q?4QMh1gSObeWa3taMiaXIdJ8LtA7O5XLntXveyziJ9ZcEdFg6IdpaUZSTvq?=
 =?iso-8859-1?Q?IhqxSyza34urykhSy3qF0tty7ylwqW7KLenXcki3gFc8jyKnBPM3pgH1HQ?=
 =?iso-8859-1?Q?A6g3kcUtvfYsjZVUjYeNNg4CppxS6PDi0cIznnozd5/3XDFzRskTD4g4N4?=
 =?iso-8859-1?Q?9gTrLXwz6kkET7ge623vBeV1vEa5tEe9jebWFzGN/ixdbgI0p62KPsMkuq?=
 =?iso-8859-1?Q?v6pAbmyqxEgLhU/Ua6mQNlZuIMTTXkAsRYR6h+t+unzIP/wKYtBvS/q/aL?=
 =?iso-8859-1?Q?WcTulsUoBlxeocIFPZaywByyiNrDDWFX66eGPakj2S2Qtx3XpXkfHWUDNJ?=
 =?iso-8859-1?Q?08RNA1ivSiZ3Gj8G+fYuicQpPz2zxvrEm/nzSFPE7zAp9lu0H99XJviAK8?=
 =?iso-8859-1?Q?06WakWg9uzQ+LnmXRVrfrRJ59SWPgGeUnJY6/bBhA9Q/AtvHxI6rgxFWx6?=
 =?iso-8859-1?Q?pCKr0TbJz0WFu/Z/ahVCH2a824zlNwJFBD7AwKklLy6k28+Pnd64Lzzt4P?=
 =?iso-8859-1?Q?QOzE6mA+CfqvLbdaDFq1B8Ifh9dNN2caWxjdFuqREzbiD5atDkZ4KliMMt?=
 =?iso-8859-1?Q?yXtg3xZo4bruCGcdoSNm+NF3oiallqOztF4wZv90ju4sV+pbCLb+FXvND0?=
 =?iso-8859-1?Q?4wxjllFyGMdGJ3QBfHFP2rzWZSD6OlmRSEBek+kCP19UVTKThmuYm13vdK?=
 =?iso-8859-1?Q?2lV9dtMknU3+cIDDPGtFAvwdIG/dC6c1QNmk+a5OdzyYHe18amTbFMLJRa?=
 =?iso-8859-1?Q?fG4ZasYHa0grZDc3gmhf0OJlbbW0bO4R/FW3FVfLumLJ5bjZHK60Ut4oCW?=
 =?iso-8859-1?Q?BX4MFouDFimeJ1hTcQrn8f6YB2hihOXyYborI5pY5xUCe5GK9ZNNBxNA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 558ab0f4-bafe-423a-244d-08dd1debf108
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 16:08:55.6682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFriCfkUImjxY3Mo8fp+rQMdVt5r7EBZ5xrx71DznCVFirUUOb2cVCOjzXpZAplWNiOD757nq+AtV1N0Tjho4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7702
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

On Mon, Dec 16, 2024 at 11:01:23AM +0100, Thomas Hellström wrote:
> On Wed, 2024-12-11 at 11:01 -0800, Matthew Brost wrote:
> > On Tue, Nov 19, 2024 at 02:56:12PM +0100, Thomas Hellström wrote:
> > > On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> > > > Add SVM range invalidation vfunc.
> > > > 
> > > > v2:
> > > >  - Don't run invalidation if VM is closed
> > > >  - Cycle notifier lock in xe_svm_close
> > > >  - Drop xe_gt_tlb_invalidation_fence_fini
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  17 ++-
> > > >  drivers/gpu/drm/xe/xe_pt.c           |  24 ++++
> > > >  drivers/gpu/drm/xe/xe_pt.h           |   3 +
> > > >  drivers/gpu/drm/xe/xe_svm.c          | 205
> > > > ++++++++++++++++++++++++++-
> > > >  drivers/gpu/drm/xe/xe_svm.h          |  13 ++
> > > >  5 files changed, 256 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > index 79c426dc2505..92923947a12c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > @@ -19,6 +19,7 @@
> > > >  #include "xe_guc.h"
> > > >  #include "xe_guc_ct.h"
> > > >  #include "xe_migrate.h"
> > > > +#include "xe_svm.h"
> > > >  #include "xe_trace_bo.h"
> > > >  #include "xe_vm.h"
> > > >  
> > > > @@ -125,18 +126,17 @@ static int xe_pf_begin(struct drm_exec
> > > > *exec,
> > > > struct xe_vma *vma,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > -static int handle_vma_pagefault(struct xe_tile *tile, struct
> > > > pagefault *pf,
> > > > -				struct xe_vma *vma)
> > > > +static int handle_vma_pagefault(struct xe_tile *tile, struct
> > > > xe_vma
> > > > *vma,
> > > > +				bool atomic)
> > > >  {
> > > >  	struct xe_vm *vm = xe_vma_vm(vma);
> > > >  	struct drm_exec exec;
> > > >  	struct dma_fence *fence;
> > > >  	ktime_t end = 0;
> > > >  	int err;
> > > > -	bool atomic;
> > > >  
> > > > +	lockdep_assert_held_write(&vm->lock);
> > > >  	trace_xe_vma_pagefault(vma);
> > > > -	atomic = access_is_atomic(pf->access_type);
> > > >  
> > > >  	/* Check if VMA is valid */
> > > >  	if (vma_is_valid(tile, vma) && !atomic)
> > > > @@ -207,6 +207,7 @@ static int handle_pagefault(struct xe_gt *gt,
> > > > struct pagefault *pf)
> > > >  	struct xe_vm *vm;
> > > >  	struct xe_vma *vma = NULL;
> > > >  	int err;
> > > > +	bool atomic;
> > > >  
> > > >  	/* SW isn't expected to handle TRTT faults */
> > > >  	if (pf->trva_fault)
> > > > @@ -232,7 +233,13 @@ static int handle_pagefault(struct xe_gt
> > > > *gt,
> > > > struct pagefault *pf)
> > > >  		goto unlock_vm;
> > > >  	}
> > > >  
> > > > -	err = handle_vma_pagefault(tile, pf, vma);
> > > > +	atomic = access_is_atomic(pf->access_type);
> > > > +
> > > > +	if (xe_vma_is_system_allocator(vma))
> > > > +		err = xe_svm_handle_pagefault(vm, vma, tile,
> > > > +					      pf->page_addr,
> > > > atomic);
> > > > +	else
> > > > +		err = handle_vma_pagefault(tile, vma, atomic);
> > > >  
> > > >  unlock_vm:
> > > >  	if (!err)
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > index 39357e829b6d..282476c4edbd 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -20,6 +20,7 @@
> > > >  #include "xe_res_cursor.h"
> > > >  #include "xe_sched_job.h"
> > > >  #include "xe_sync.h"
> > > > +#include "xe_svm.h"
> > > >  #include "xe_trace.h"
> > > >  #include "xe_ttm_stolen_mgr.h"
> > > >  #include "xe_vm.h"
> > > > @@ -829,6 +830,29 @@ bool xe_pt_zap_ptes(struct xe_tile *tile,
> > > > struct
> > > > xe_vma *vma)
> > > >  	return xe_walk.needs_invalidate;
> > > >  }
> > > >  
> > > > +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm
> > > > *vm,
> > > > +			  struct xe_svm_range *range)
> > > 
> > > Kerneldoc.
> > > 
> > 
> > Will add.
> > 
> > > Here, (and I saw Oak also commented around this some time ago)
> > > ideally
> > > we should make xe_pt.c unaware of vmas and svm ranges, and in this
> > > case, use the same xe_pt function for both.
> > > 
> > 
> > See some of other comments, agree we should do in a follow up.
> > 
> > > 
> > > 
> > > > +{
> > > > +	struct xe_pt_zap_ptes_walk xe_walk = {
> > > > +		.base = {
> > > > +			.ops = &xe_pt_zap_ptes_ops,
> > > > +			.shifts = xe_normal_pt_shifts,
> > > > +			.max_level = XE_PT_HIGHEST_LEVEL,
> > > > +		},
> > > > +		.tile = tile,
> > > > +	};
> > > > +	struct xe_pt *pt = vm->pt_root[tile->id];
> > > > +	u8 pt_mask = (range->tile_present & ~range-
> > > > > tile_invalidated);
> > > > +
> > > > +	if (!(pt_mask & BIT(tile->id)))
> > > > +		return false;
> > > > +
> > > > +	(void)xe_pt_walk_shared(&pt->base, pt->level, range-
> > > > > base.va.start,
> > > > +				range->base.va.end,
> > > > &xe_walk.base);
> > > > +
> > > > +	return xe_walk.needs_invalidate;
> > > > +}
> > > > +
> > > >  static void
> > > >  xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update,
> > > > struct xe_tile *tile,
> > > >  		       struct iosys_map *map, void *data,
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.h
> > > > b/drivers/gpu/drm/xe/xe_pt.h
> > > > index 9ab386431cad..5f333eeedf5c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > > > @@ -13,6 +13,7 @@ struct dma_fence;
> > > >  struct xe_bo;
> > > >  struct xe_device;
> > > >  struct xe_exec_queue;
> > > > +struct xe_svm_range;
> > > >  struct xe_sync_entry;
> > > >  struct xe_tile;
> > > >  struct xe_vm;
> > > > @@ -42,5 +43,7 @@ void xe_pt_update_ops_fini(struct xe_tile
> > > > *tile,
> > > > struct xe_vma_ops *vops);
> > > >  void xe_pt_update_ops_abort(struct xe_tile *tile, struct
> > > > xe_vma_ops
> > > > *vops);
> > > >  
> > > >  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> > > > +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm
> > > > *vm,
> > > > +			  struct xe_svm_range *range);
> > > >  
> > > >  #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > index 57b740367843..b2bc259978c4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -5,18 +5,188 @@
> > > >  
> > > >  #include "drm_gpusvm.h"
> > > >  
> > > > +#include "xe_gt_tlb_invalidation.h"
> > > > +#include "xe_pt.h"
> > > >  #include "xe_svm.h"
> > > >  #include "xe_vm.h"
> > > >  #include "xe_vm_types.h"
> > > >  
> > > > +static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
> > > > +{
> > > > +	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
> > > > +}
> > > > +
> > > > +static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
> > > > +{
> > > > +	return gpusvm_to_vm(r->gpusvm);
> > > > +}
> > > > +
> > > > +static struct drm_gpusvm_range *
> > > > +xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> > > > +{
> > > > +	struct xe_svm_range *range;
> > > > +
> > > > +	range = kzalloc(sizeof(*range), GFP_KERNEL);
> > > > +	if (!range)
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +
> > > > +	xe_vm_get(gpusvm_to_vm(gpusvm));
> > > > +
> > > > +	return &range->base;
> > > > +}
> > > > +
> > > > +static void xe_svm_range_free(struct drm_gpusvm_range *range)
> > > > +{
> > > > +	xe_vm_put(range_to_vm(range));
> > > > +	kfree(range);
> > > > +}
> > > > +
> > > > +static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range
> > > > *r)
> > > > +{
> > > > +	return container_of(r, struct xe_svm_range, base);
> > > > +}
> > > > +
> > > > +static u8
> > > > +xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct
> > > > drm_gpusvm_range *r,
> > > > +				  const struct
> > > > mmu_notifier_range
> > > > *mmu_range,
> > > > +				  u64 *adj_start, u64 *adj_end)
> > > > +{
> > > > +	struct xe_svm_range *range = to_xe_range(r);
> > > > +	struct xe_device *xe = vm->xe;
> > > > +	struct xe_tile *tile;
> > > > +	u8 tile_mask = 0;
> > > > +	u8 id;
> > > > +
> > > 
> > > lockdep assert?
> > > 
> > 
> > Sure.
> >  
> > > > +	/* Skip if already unmapped or if no binding exist */
> > > > +	if (range->base.flags.unmapped || !range->tile_present)
> > > > +		return 0;
> > > > +
> > > > +	/* Adjust invalidation to range boundaries */
> > > > +	if (range->base.va.start < mmu_range->start)
> > > > +		*adj_start = range->base.va.start;
> > > > +	if (range->base.va.end > mmu_range->end)
> > > > +		*adj_end = range->base.va.end;
> > > > +
> > > > +	/*
> > > > +	 * XXX: Ideally would zap PTEs in one shot in
> > > > xe_svm_invalidate but the
> > > > +	 * invalidation code can't correctly cope with sparse
> > > > ranges
> > > > or
> > > > +	 * invalidations spanning multiple ranges.
> > > > +	 */
> > > > +	for_each_tile(tile, xe, id)
> > > > +		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> > > > +			tile_mask |= BIT(id);
> > > > +			range->tile_invalidated |= BIT(id);
> > > > +		}
> > > > +
> > > > +	return tile_mask;
> > > > +}
> > > > +
> > > > +static void
> > > > +xe_svm_range_notifier_event_end(struct xe_vm *vm, struct
> > > > drm_gpusvm_range *r,
> > > > +				const struct mmu_notifier_range
> > > > *mmu_range)
> > > > +{
> > > > +	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
> > > > +
> > > > +	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> > > > +	/* TODO: Add range to garbage collector */
> > > > +}
> > > > +
> > > >  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > > >  			      struct drm_gpusvm_notifier
> > > > *notifier,
> > > >  			      const struct mmu_notifier_range
> > > > *mmu_range)
> > > >  {
> > > > -	/* TODO: Implement */
> > > > +	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> > > > +	struct xe_device *xe = vm->xe;
> > > > +	struct xe_tile *tile;
> > > > +	struct drm_gpusvm_range *r, *first;
> > > > +	struct xe_gt_tlb_invalidation_fence
> > > > +		fence[XE_MAX_TILES_PER_DEVICE *
> > > > XE_MAX_GT_PER_TILE];
> > > > +	u64 adj_start = mmu_range->start, adj_end = mmu_range-
> > > > >end;
> > > > +	u8 tile_mask = 0;
> > > > +	u8 id;
> > > > +	u32 fence_id = 0;
> > > > +	long err;
> > > > +
> > > > +	if (xe_vm_is_closed(vm))
> > > > +		return;
> > > 
> > > How do we ensure we don't race here? Are we sure that all dma
> > > mappings
> > > and all PTEs pointing to the range is gone at this point? Becase
> > > "They
> > > will soon be gone anyway" isn't enough.
> > > 
> > 
> > I think this is to prevent touching PTs which are being destroyed in
> > parallel which resulted in kernel explosion, so I think we need this.
> 
> IIRC, the pt structure change is committed under the notifier lock when
> unbinding, which means that a racing pt zap shouldn't do any harm and
> just have the commit phase re-run?
> 

It is destroying the PTs in xe_vm_close_and_put which can race with the
notifier.

> So if we follow the 
> 1.) take vm->lock : waits for existing binding to complete
> 2.) mark vm closed : inhibits future binding
> 3.) unbind page-table
> 4.) Remove notifiers
> 
> We should be ok?
> 

Yea, I think you missing a few locks but yea probably something like you
describe works. I have already coded like I describe below in my
previous reply though - next rev is likely to posted in the next day or
so. I think either works but what you suggest is likely a bit of
larger rework.

I'm thinking really we should completely rework xe_vm_close_and_put as
it is a bit of a mess and we have just continually bolted on things over
time without a ton of deep thought on what we want the flow to look
rather just get stuff working and move on. Would it be ok for me to open
a Jira for this rework, I can take ownership, and do this rework in a
follow on series?

Matt

> /Thomas
> 
> 
> > 
> > How to prevent a race? How about on VM close we invalidate the PT
> > root?
> > I had patch at one point which did this. We'd still have dma mappings
> > too but I think if need to we can safely dma-unmap the pages if the
> > VM
> > is closed too. Thoughts?
> > 
> > > > +
> > > > +	/* Adjust invalidation to notifier boundaries */
> > > > +	if (adj_start < notifier->interval.start)
> > > > +		adj_start = notifier->interval.start;
> > > > +	if (adj_end > notifier->interval.end)
> > > > +		adj_end = notifier->interval.end;
> > > > +
> > > > +	first = drm_gpusvm_range_find(notifier, adj_start,
> > > > adj_end);
> > > > +	if (!first)
> > > > +		return;
> > > > +
> > > > +	/*
> > > > +	 * XXX: Less than ideal to always wait on VM's resv
> > > > slots if
> > > > an
> > > > +	 * invalidation is not required. Could walk range list
> > > > twice
> > > > to figure
> > > > +	 * out if an invalidations is need, but also not ideal.
> > > > Maybe a counter
> > > > +	 * within the notifier, seems like that could work.
> > > > +	 */
> > > > +	err = dma_resv_wait_timeout(xe_vm_resv(vm),
> > > > +				    DMA_RESV_USAGE_BOOKKEEP,
> > > > +				    false,
> > > > MAX_SCHEDULE_TIMEOUT);
> > > > +	XE_WARN_ON(err <= 0);
> > > > +
> > > > +	r = first;
> > > > +	drm_gpusvm_for_each_range(r, notifier, adj_start,
> > > > adj_end)
> > > > +		tile_mask |=
> > > > xe_svm_range_notifier_event_begin(vm,
> > > > r, mmu_range,
> > > > +							      
> > > > &adj_start,
> > > > +							      
> > > > &adj_end);
> > > > +	if (!tile_mask)
> > > > +		goto range_notifier_event_end;
> > > > +
> > > > +	xe_device_wmb(xe);
> > > > +
> > > > +	for_each_tile(tile, xe, id) {
> > > > +		if (tile_mask & BIT(id)) {
> > > > +			int err;
> > > > +
> > > > +			xe_gt_tlb_invalidation_fence_init(tile-
> > > > > primary_gt,
> > > > +							 
> > > > &fence[fence_id], true);
> > > > +
> > > > +			err = xe_gt_tlb_invalidation_range(tile-
> > > > > primary_gt,
> > > > +							  
> > > > &fence[fence_id],
> > > > +							  
> > > > adj_start,
> > > > +							  
> > > > adj_end,
> > > > +							   vm-
> > > > > usm.asid);
> > > > +			if (WARN_ON_ONCE(err < 0))
> > > > +				goto wait;
> > > > +			++fence_id;
> > > > +
> > > > +			if (!tile->media_gt)
> > > > +				continue;
> > > > +
> > > > +			xe_gt_tlb_invalidation_fence_init(tile-
> > > > > media_gt,
> > > > +							 
> > > > &fence[fence_id], true);
> > > > +
> > > > +			err = xe_gt_tlb_invalidation_range(tile-
> > > > > media_gt,
> > > > +							  
> > > > &fence[fence_id],
> > > > +							  
> > > > adj_start,
> > > > +							  
> > > > adj_end,
> > > > +							   vm-
> > > > > usm.asid);
> > > > +			if (WARN_ON_ONCE(err < 0))
> > > > +				goto wait;
> > > > +			++fence_id;
> > > > +		}
> > > > +	}
> > > > +
> > > > +wait:
> > > > +	for (id = 0; id < fence_id; ++id)
> > > > +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > > > +
> > > > +range_notifier_event_end:
> > > > +	r = first;
> > > > +	drm_gpusvm_for_each_range(r, notifier, adj_start,
> > > > adj_end)
> > > > +		xe_svm_range_notifier_event_end(vm, r,
> > > > mmu_range);
> > > >  }
> > > >  
> > > >  static const struct drm_gpusvm_ops gpusvm_ops = {
> > > > +	.range_alloc = xe_svm_range_alloc,
> > > > +	.range_free = xe_svm_range_free,
> > > >  	.invalidate = xe_svm_invalidate,
> > > >  };
> > > >  
> > > > @@ -36,6 +206,11 @@ int xe_svm_init(struct xe_vm *vm)
> > > >  
> > > >  void xe_svm_close(struct xe_vm *vm)
> > > >  {
> > > > +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> > > > +
> > > > +	/* Flush running notifiers making xe_vm_close() visable
> > > > */
> > > > +	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
> > > > +	drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> > > 
> > > Calling mmu_notifier_read_begin() ensures that nothing is
> > > invalidating
> > > on the range. Probably a better choice.
> > > 
> > 
> > We'd have to call that on every notifier rather than just cycle the
> > lock, so with that I'd prefer to leave it as is.
> >  
> > > >  }
> > > >  
> > > >  void xe_svm_fini(struct xe_vm *vm)
> > > > @@ -44,3 +219,31 @@ void xe_svm_fini(struct xe_vm *vm)
> > > >  
> > > >  	drm_gpusvm_fini(&vm->svm.gpusvm);
> > > >  }
> > > > +
> > > > +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma
> > > > *vma,
> > > > +			    struct xe_tile *tile, u64
> > > > fault_addr,
> > > > +			    bool atomic)
> > > > +{
> > > > +	struct drm_gpusvm_ctx ctx = { .read_only =
> > > > xe_vma_read_only(vma), };
> > > > +	struct drm_gpusvm_range *r;
> > > > +	int err;
> > > > +
> > > > +	lockdep_assert_held_write(&vm->lock);
> > > > +
> > > > +retry:
> > > > +	/* TODO: Run garbage collector */
> > > > +
> > > > +	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm,
> > > > fault_addr,
> > > > +					    xe_vma_start(vma),
> > > > xe_vma_end(vma),
> > > > +					    &ctx);
> > > > +	if (IS_ERR(r))
> > > > +		return PTR_ERR(r);
> > > > +
> > > > +	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
> > > > false);
> > > > +	if (err == -EFAULT || err == -EPERM)	/* Corner where
> > > > CPU
> > > > mappings have change */
> > > 
> > > s/change/changed/
> > > 
> > 
> > Yep.
> > 
> > > > +	       goto retry;
> > > > +
> > > > +	/* TODO: Issue bind */
> > > > +
> > > > +	return err;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > index 376e86876a11..c91c5f538024 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -6,14 +6,27 @@
> > > >  #ifndef _XE_SVM_H_
> > > >  #define _XE_SVM_H_
> > > >  
> > > > +#include "drm_gpusvm.h"
> > > >  #include "drm_pagemap.h"
> > > >  
> > > >  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> > > 
> > > Not used yet
> > > 
> > 
> > Will remove.
> >  
> > > >  
> > > > +struct xe_tile;
> > > >  struct xe_vm;
> > > > +struct xe_vma;
> > > > +
> > > > +struct xe_svm_range {
> > > > +	struct drm_gpusvm_range base;
> > > > +	u8 tile_present;
> > > > +	u8 tile_invalidated;
> > > > +};
> > > 
> > > Kerneldoc
> > > 
> > 
> > Will add.
> > 
> > > 
> > > >  
> > > >  int xe_svm_init(struct xe_vm *vm);
> > > >  void xe_svm_fini(struct xe_vm *vm);
> > > >  void xe_svm_close(struct xe_vm *vm);
> > > >  
> > > > +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma
> > > > *vma,
> > > > +			    struct xe_tile *tile, u64
> > > > fault_addr,
> > > > +			    bool atomic);
> > > > +
> > > >  #endif
> > > 
> > > Thanks,
> > 
> > Thanks,
> > Matt
> > 
> > > Thomas
> > > 
> 
