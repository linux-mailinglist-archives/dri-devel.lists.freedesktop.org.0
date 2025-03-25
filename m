Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12182A70589
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA09A10E59B;
	Tue, 25 Mar 2025 15:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XY0oEOS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C7310E599;
 Tue, 25 Mar 2025 15:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742917841; x=1774453841;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S5sH3CQE3jPCGACfAI735HRjUio1ugiJccA5m5Q4Iy4=;
 b=XY0oEOS1slOURi3zfHTHro75zWbBuGRSgH4pGdDjGL7QQkxKI9qgQpkC
 vuNbEfKphOCuwdh8fZZUcC6h6+TYIMRl44erz3vpi6o/svHIGUYBbcrYu
 FUR5fzRUysa1fyNsC9E9FgTYYrn6eNdwPV1IqKe3idXgtC59hbmzfdpI3
 SK1YyyS1zWQrvqomDYmJ8QDHPliNCajNuwDWXKl6aTCXWgRWsgGCJ67Xa
 q3Nr3L+BHcHlrtXlkcAIp3E4zkxFhOIx1x36g8GZmj2y8rwE+MmYE9fj9
 0F/1rGBYvqzOI1YKRQo+nT5WaITyUdi878eqE8XLzZTCjWfYEsJw9xMPw A==;
X-CSE-ConnectionGUID: 18UdntPgSZeTtjRWyjLacw==
X-CSE-MsgGUID: XtCwTFQxQVWDAQ31kIKwKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69532487"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="69532487"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:50:30 -0700
X-CSE-ConnectionGUID: ORneGE8hQ8S85dvoLlAFiA==
X-CSE-MsgGUID: dfeVjcgXRASssd+J9u2N6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="161633766"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 08:50:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 08:50:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 08:50:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 08:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lH7sfUPJ+bJflVz5W57/9kmdCWtwnuGELAESwwVkP3MqEpwMAsK/hhpviOslhcUiBh6SsjjhNNytvxWvR96De+rnip9Wn3DYLYkt50wnjArmnAYyAEgCPUTtcja9v5y8wvI7dRB1EwAEe3/IKu4Z74A2KS/KyaptJu0mhsMbhb5YEFgM0pT3QJOhQGlLtzsGsB5zcV+AAJnV/Rdtd9OSJvyubIpNt8Xveco4dvpzzpHe8qz+i+MIonqgCPh++U07NfBX6Wx96SXEgE2BxbgP5tC8y5mPF7Ka4c/eynx1vnbh1hKzqY+TPPF0dHrtCY4EJtmoZuXykEYKORztVJPrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOI1BvIH9Othdci+oX1qGZplLByK+PdD81il+N6hJb4=;
 b=jAY4PjjyPi4+TsxQGnedXW/ImlSgDdExOndjKAXv0D5m29ynDKQ8S+xcSXeXm/I3/quhCX+w+u3pFIXx7Q7+eWQlxhT9CLFG5kRFttbeisyVigLHRThPp3aYt+VnVEORR5loFLxUgqxH4DTzSVeqAzO119udgw9VpzWrI7dVO71ND9d3+/fDzF80DzHlwC+x9kXhf5o5kkqA+iV4W7GJkTIG9Eg8FAxJsvDkwLHy00ysqh61mRa+HElvTlF8r6XF17JnjdqXha0SepigUx7kDd+8kneyRX8t69tdG5PLrOXG6u09GG3609hvJTq1n5oScPS0ls2K+LGjXwYyuD1/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6181.namprd11.prod.outlook.com (2603:10b6:208:3c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 15:50:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 15:50:26 +0000
Date: Tue, 25 Mar 2025 10:50:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, Arshad Mehmood <arshad.mehmood@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Avoid duplicating CCS mode workaround
Message-ID: <6yb4pwizyh4x4yemxukznkeugau4x4ukor56rqesdabb2cyvd4@vntkfiq7u2lr>
References: <20250325120137.1302748-1-andi.shyti@linux.intel.com>
 <174290746252.1245393.5239853097693701739@DEV-409>
 <Z-K9EKc3v3rYdZhK@ashyti-mobl2.lan>
 <67d46monf24hohzznjfzlbuwslcd2b6b3kce6gn55co5izpave@q3ae33cawecp>
 <Z-LOTSaCEItvtSq1@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z-LOTSaCEItvtSq1@ashyti-mobl2.lan>
X-ClientProxiedBy: MW4PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:303:b9::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ea20e9-4f89-4e65-5ada-08dd6bb4c2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NLQ4zxJtoa7bc8w+FP6joZKAYdx9zECgQNUY4QIggqEeYdUYL8up9yZPtJa4?=
 =?us-ascii?Q?AYHSLMtq4Ag2L81lxbzJISagbwRfj8dpSeMNu/6hy5H61wexUQvv8Y84lThY?=
 =?us-ascii?Q?LuH4EkFdk9eHEMEfZGSsK45r6utOXdz43R8lzZaSfgexlZWZ8fwySKS4meZg?=
 =?us-ascii?Q?TObVY0+pzBN9iqEoG1iKcClVdd1ieGXEDEYVPu1CI5R8GVfcTpdyV5MHuDR5?=
 =?us-ascii?Q?MfwiVUXkcHrjLBUqRbvikeyOb7z6C17NgfedlxyNbfUY9I6kkHtAQibBcQtU?=
 =?us-ascii?Q?pDxituDfQt3TnSeimoH6OlY1Rl4TO/7TyOdhv4Pfypvpzhzr8GluHl8RsFdn?=
 =?us-ascii?Q?Z0O0uzd4weULsoDQ/MeEPgDhZafksVa6CFz3521bsoNfWwb7psqBpn/+BXHi?=
 =?us-ascii?Q?xFy/no00riKwJ/n8VFiuRDRoRORjIErgLzgvyRscpyw8G/jWT7++9c6DoBu0?=
 =?us-ascii?Q?L4kO6QtS5ziOhXWFk5pR1TGBCzRQXFWTGKzzvasg604jB2Ud6g6XsmMMPL+p?=
 =?us-ascii?Q?oA0eSc7x8se0Kmkh5xnRK+BLt+h8j6lZo6Bv7iTmWkdh2WDRfXeA8/3K/3CS?=
 =?us-ascii?Q?cJtL+VliqTJXOie7alucq8mqiOw8r/YFv3PKJ1pSP350L2/9BVLewN18Nyv/?=
 =?us-ascii?Q?cIVh9rSQjFeecNvB7NUWYfX9jm4aBu5GFsR300keNXOks8pdG06SPkGVNB0S?=
 =?us-ascii?Q?vGnPR6O0rQ8xOmJAckvvoDkm6O4UaGsmcJPq5/XvcqAS2zIzQmSDQDHEG9OS?=
 =?us-ascii?Q?rEeFq+oFn/6otmZ1Fb5OcrvfdZM2/jV/hUt3+wlMDwxWX5eIju8FjN/0q5iI?=
 =?us-ascii?Q?5inazOEaJ/CzbFUpbPGUINMEZHMP39c8ymWUbcXYDpcEiLFFgibQEvybXAed?=
 =?us-ascii?Q?EHmTOxUqm/d+Cl7Fid5wQUntnFnODv8CM072MZ+wOujpo3JdBJ1j6dLs/Svy?=
 =?us-ascii?Q?Eu9WrwsFUSaNtzrBYUOhoTYeSrsfBpTSVwHc6QMqsJbZJ0EQ2Sjwi8OZTawQ?=
 =?us-ascii?Q?FJvGSFE+gTDfPMh7jZh4+A2+r1n9+WF0ndEURk4aF4i89vI6D63YNYzGuqq/?=
 =?us-ascii?Q?JpXH5MZrS9vTa+/0xdxFjI0L5hskPeIAga+EoFDYNtZp6gLVg3E9rvFH60hI?=
 =?us-ascii?Q?4YXAFf/reJhiVcOfdmtJndBfEWOgDEDvOfkFNVX9iTnFgrckFKgUDeeX+BPF?=
 =?us-ascii?Q?pXgfNlB0v/+6ulHLpgdqWOONTFp9bxZmcxMVSjCO08AS617TCFmKr4ksaeyZ?=
 =?us-ascii?Q?LPN5oeWb48ivix06uuLLG+QVpSjlFUXR7kdJg9E71fWgixlmaWBtV+QFeN11?=
 =?us-ascii?Q?4ugcFGLLla31DETM0dXyIhC9MLhPA3tSPdUqIFeHgYanGsbAiKLGYadMbowk?=
 =?us-ascii?Q?SVMhFc3Wkp32TLC9ig4T+becZ5YEgXA/5F8ByCnkj16+2/L6cM6MYhdUeUUR?=
 =?us-ascii?Q?VmarkWk1qbA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZX0/bD6R7E0L6azyqMHjSECV6GfadrPozrAjX291XbAO21dAg4Qghoj7oKBk?=
 =?us-ascii?Q?88NnfY29U5U6ZQ7+v1JO5R/B6jX3eZhLnPWb2HmUA9XeppM+1HhNttU2RlBQ?=
 =?us-ascii?Q?9ahUF0UfjhqT4TutbAVMcE1YXR7TRGmqtIBIMNDkKTnCSYj0Tfaw2sXNGvZ0?=
 =?us-ascii?Q?CW0QaneEsHzK0MN1iHm3CKw9MzNDKDjyjT0Wr1krIMT6TeUqXFCcmcQlfkLr?=
 =?us-ascii?Q?j1q/XEZ4+/1slnH2JU2bjmO41qnYSvuu88WHDqArvUQpgckIvVZc4bBhwH3i?=
 =?us-ascii?Q?fSrGDxNnhtdArFG6ZjxQA+2xLLEtCpNPLutstlua6BqUkqD/2L6ZAHJlz3ap?=
 =?us-ascii?Q?6Vm5BkyKNnd+Akr38PlieDS7cMuPf5wD0StunbF8or55j/j9f5Ry1CcesJV7?=
 =?us-ascii?Q?2uwIcIzDN+di3gKtEaxSK58sF/cGAEFB/yyUqGxHRGTNJ0eK/UgBYVe8VirP?=
 =?us-ascii?Q?zCKtq8RaeASFevQeTnkvfAG69M4zByrdJpNWkHrtd7EIEwqFNlIihB6Jpmj1?=
 =?us-ascii?Q?vhOjs6Imm4WkOQ88PaBzG6rIliEMiHmU5KVRmUzpHsaGHXsAfMRuaesNeogo?=
 =?us-ascii?Q?C8tZuJ6HF3mmDaFLAV8754MM+JO5YBZsFlOCGi7v+6IXhfX90wLvEVljgqMj?=
 =?us-ascii?Q?5OYBrlshJJdIIBOixWD6r6FBn317Lt5J2Wy6WfmOG4LXYH8UCoBDRIUlDvyt?=
 =?us-ascii?Q?uIJZ2ltZjiMNkIZZF1N1t1oGH9G9aOha3UoII3x0RW4XQ/4kRezwyHJqw7xT?=
 =?us-ascii?Q?7kL+Xbhl78YRshn7V2EtPLuOyqi1cj9UNr4iGrmpWBp/7eXKfdfTufJWyt0U?=
 =?us-ascii?Q?P52ko3Kd4ocxEFfM/7SFI2q6kZDS2G6wb542DsNhUytebEp4qnp6xlHx5vq9?=
 =?us-ascii?Q?4KgSGr3VNW72qbjNL1bk1twplHOEHSq7/4RrFDezTx+SbR1QRlYHCNW8Fctu?=
 =?us-ascii?Q?tJRwbGvX25ucnVwnrACLXDSl7uXrwwjTgy+tq9+CSq5+Oi518DW4onDAogvU?=
 =?us-ascii?Q?gsNsVAYy/k4V54trdFgzZLV5JY7alhvruXvjbAHP619BP0sHvjI+AZjdXuLC?=
 =?us-ascii?Q?xXiEVYafntzzh1+2ij09Zp6mTNONnQJuGv4Aa/Lqu9Zt1fEo3xoCxgTeImWN?=
 =?us-ascii?Q?P739wqEZIjg8mgwKvW3lXShhrQ63gz/q9bK5JELAIr8RJVZqdyNpVfAVto5W?=
 =?us-ascii?Q?JpbRGMCtE3A7ljSL0slVXV0O/0lmUum5DZoOHngK+QDAJufwY3a1R3rrxCRH?=
 =?us-ascii?Q?YPRqS/CluGHEvy0oOiEkiptrLJuu4cpRdLTxK40IJBh+NUr3Pag7pWkKxxrI?=
 =?us-ascii?Q?Ae5EiBHYIOHYB1oE364qs6r40otUwN3JvKxxIOw844rVoUIohaI158PP6G6Z?=
 =?us-ascii?Q?yKYqbZX73ZikwoaAD9X2SqMvtdNlGBaW/1o1orwUAkR075lU8En2X3DnjgcV?=
 =?us-ascii?Q?Sg+LUaDZLEmzbPyqS5wN95iS+g81Vsr6WqM1TnAdCS4NCu1Y5ETi/dq3jBJs?=
 =?us-ascii?Q?+PJgJOkg5mCLRM0xuKgl32qiKq9czHpBVphTfWhmflTJaGjykQJkKJYXuhxX?=
 =?us-ascii?Q?X8OtbKXYEw/iZ1qFcUjAlI6T2j9RFDk2kNDRQGrKtEmol+1tJl2nrN4mX4BK?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ea20e9-4f89-4e65-5ada-08dd6bb4c2a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 15:50:26.3314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJp8WdXwawmDArppIcRhY9rkAKjxlY8ij4+h7gs4p/UcQDANBHxMpn8XF+asER7n04pRSV6z5uOj8rPBQBCfQfksmFiX8asRkLvMAJltpDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6181
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

On Tue, Mar 25, 2025 at 04:39:57PM +0100, Andi Shyti wrote:
>Hi Lucas,
>
>> > > > @@ -2897,7 +2897,9 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
>> > > >          */
>> > > >         if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) {
>> > > >                 general_render_compute_wa_init(engine, wal);
>> > > > -               ccs_engine_wa_mode(engine, wal);
>> > > > +
>> > > > +               if (engine->class == COMPUTE_CLASS)
>> > > > +                       ccs_engine_wa_mode(engine, wal);
>> > >
>> > > FIRST_RENDER_COMPUTE is meant to only be on the first engine of either
>> > > rcs or ccs (which share certain register domains), one engine.
>> > >
>> > > It looks like that was broken by
>> > >
>> > > 	commit 1bfc03b1375244f9029bb448ee8224b3b6dae99f
>> > > 	Author: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> yep, my bad.
>>
>> > > 	Date:   Tue Mar 19 23:03:03 2024 -0700
>> > >
>> > > 	    drm/i915: Remove special handling for !RCS_MASK()
>> >
>> > Aha! So the logic here[*] breaks the meaning of
>> > I915_ENGINE_FIRST_RENDER_COMPUTE, becasue, other than PVC, we
>> > forgot that we have DG2 that needs the special check that uses
>> > !RCS_MASK().
>>
>> no, that would mean a DG2 without render engine.
>
>OK, I don't know the history, I thought that the idea was to
>remove support for PVC, the only multi-CCS machine that once i915
>supported other than DG2.

the problem is not about having multiple compute engines. The removal of
PVC meant we don't have any platform left without render engine.

>
>> The previous check to enable I915_ENGINE_FIRST_RENDER_COMPUTE was:
>>
>> 	if ((engine->class == COMPUTE_CLASS && !RCS_MASK(engine->gt) &&
>> 	     __ffs(CCS_MASK(engine->gt)) == engine->instance) ||
>> 	     engine->class == RENDER_CLASS)
>>
>> i.e. if render is fused off, it enables it in the first compute engine.
>> Otherwise it enables it in the render.
>>
>> And assuming we don't have platforms with render fused off (which still
>> holds true as far as I'm aware), that became:
>>
>> 	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
>> 	    __ffs(CCS_MASK(engine->gt) | RCS_MASK(engine->gt)) == engine->instance)
>
>The difference is that this applies in two cases: it's true for
>the first CCS we encounter and also for the only RCS. Arshad

yes, this is the same thing I said in my reply:

	It was supposed to mean the same thing... but doesn't as engine->instance
	starts from 0 for each class.

>noticed that we end up applying the workaround twice.
>
>So the !RCS_MASK(gt) check is still needed.

I don't think the !RCS_MASK() makes sense - you are checking for "do we
have any render engine?" when we always do and it's always 1.
All platforms supported by i915 have 1 render engine.

>
>Alternatively, as Matt suggested, we could assign
>I915_ENGINE_FIRST_RENDER_COMPUTE only to the RCS.

yes, that's what I said, but the reply here was cut short:

	Just checking for RENDER_CLASS and eventually even removing the
	I915_ENGINE_FIRST_RENDER_COMPUTE flag would be better. See
	https://lore.kernel.org/all/20240314205746.GG2837363@mdroper-desk1.amr.corp.intel.com/#t

Lucas De Marchi

>
>I have a slight preference for the way it was done before because
>it make the logic clearer.
>
>Thanks,
>Andi
>
>> It was supposed to mean the same thing... but doesn't as engine->instance
>> starts from 0 for each class.
