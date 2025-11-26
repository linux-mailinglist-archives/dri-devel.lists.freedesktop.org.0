Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F484C8B315
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A9B10E6B3;
	Wed, 26 Nov 2025 17:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N13Jpu7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1559E10E6A7;
 Wed, 26 Nov 2025 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764178022; x=1795714022;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=I/9CDuBoAsHT92P0BTv4vJkHpbp8yID/rfdW2lEWh/8=;
 b=N13Jpu7Xj2Bkecx3qvIVnI/3jq842MW3f14M93QbInTzerqVNRGc3Ii5
 JDmc/gRIaVzkwqIetaNIDAr2OzxSQ3hKWTlxbRmiyIIMU6l07FKie97uA
 lMQNK3OVxArWWQ0HIkS3cL26rwcgh4n8kbCcCw/opisSV3n/w522DkNI8
 VgPhOlTwXxZ7uo1K8OlOSVvrAxEAeE+pM3ndC7YoFN6EainWx/WB/ChK2
 LqXYJX3SwUaQqqSIBzkKtWULvtKpUg+z0YD961BgemW/inZLobMyZn5ct
 GqqHziA5SvGR7jZyVLbpBBU2GHPFPG3fY5mdpQtfrFQcKlYMnZv836x3R g==;
X-CSE-ConnectionGUID: zP03C8BFRW+PzVvAesclfg==
X-CSE-MsgGUID: WWpILFQkTpKTSCaC4UQWXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77586140"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="77586140"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 09:27:01 -0800
X-CSE-ConnectionGUID: FPg3IlTZTtGvLJc8jPJQdg==
X-CSE-MsgGUID: Y9MNq+55TA2joQsmSiTb3A==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 09:27:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 09:27:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 09:27:01 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 09:27:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTGp/N+4hwFzh1KpZDx5JC1pHsuzVYFci1a+BS2lZ9QQd/JeuI4qH6s0e2NFsYrpPEsZa1YBbdJKkhXWbk6rAaYVwsOXa2zhZEpGj7l41q8ymJN8jNWOh9mO6vUQsy6WZ6XCyOt1v2hip8I57Fh9Mzc2UOzuiSWGqik/DMbZLa1Z6jb9Qg8iIx8JqkfCf5waintbHzloK6lNWxgtcGL5FYyGEBMGPEwIKfiIZx7d25yod/jNClPLqIFCEQDA4QK0CMhvdHqgQOSRS3HefByOY+VslT0tm/O+MUy6BZi0iTLytW6UyRKsB+jFoJ/YbweCGjGNB8EtMHL8gL+98XqwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAYCtgzAUcXEmnRdnkuS8FFjLJrThhVFJsdAddZuc+k=;
 b=SKgY/EK2frqLXqww3qpEIrikzMqViaD3gORjf7T9ILv2ufv+QPacsp4AUGvYKj/qDwT2suhW12yyAKuj98Gf9YSLqNRItXE5TUTXCF4DDAfd6F2mtAxRCwSeMlDODb6l9d8u/BU0Ish+gwWTvBJdv1y+HlKztcKiTTVarStnYE5OCkOMuXh/h4PHCLwKs9OHN4qSzNoyaMXIPw9QdOx6hkxHwXbrP9hp5TURb4MKEJaoMF9jh44Nx4P7rVqcdFusPDbpi+RyVRB4fjX4TZyM4vc4zipFxjNUs158ZqrFZ/QEEJ7P3Prq9upsFocI0u1SRfaqxyUuZEOb5Sl/b15cew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFB266726CF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f46)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 17:26:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 17:26:58 +0000
Date: Wed, 26 Nov 2025 09:26:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/6] dma-fence: Remove return code of dma_fence_signal()
 et al.
Message-ID: <aSc4XnSv/mQ8A9cI@lstrano-desk.jf.intel.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <48352d7e-5e43-4683-9f00-b77ae571d8f6@amd.com>
 <f74664fdf1cf0adba9a8b19b00db4823ee3f7f1b.camel@mailbox.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f74664fdf1cf0adba9a8b19b00db4823ee3f7f1b.camel@mailbox.org>
X-ClientProxiedBy: MW4PR03CA0308.namprd03.prod.outlook.com
 (2603:10b6:303:dd::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFB266726CF:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f1c478-fa70-4e17-7386-08de2d1100ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rzGudqG1AUUKDMKsHlGhpTGw28NVHtKtfqpsQybB3iXmfEp9TLMz7cZsqZ?=
 =?iso-8859-1?Q?zjW41ETAJOTTBzeK9LXRSH1NENaIjTHBOFvhYCN1cHk0c50fl9wO+YM0Ke?=
 =?iso-8859-1?Q?UK37I3EtPtKs8bjOkehKqdcMryWa0++gwOS0q147c8y/tXwyr1fqYkPBnc?=
 =?iso-8859-1?Q?TRTdEZIl5Quhiql9XJDB2FtvYseXJj3onPkk9AgtKdZud4OtbdXKK6VO6i?=
 =?iso-8859-1?Q?CMJ/yeYM97RFoO9HH+IzZWAq/aowpZB+buixTxv5MonXMu2ynlCxzCkd3g?=
 =?iso-8859-1?Q?+NVaFYnKfPeV6tkM/GOFSy/lKdRPmux44g2dcH7XCej2QDfEcu+OYpE38A?=
 =?iso-8859-1?Q?M8eY7ieSpPQL2O1SW0V7/8gSD+6k+OxqzKoVvdVfamqpGr3Bbw9fE9Zf61?=
 =?iso-8859-1?Q?klUPvfvgiOcKP4mPK/30UKZrEl6Fb39bS5CNOSuAqPgX0XqKPDs5oGz3uL?=
 =?iso-8859-1?Q?na4aVRVXpVd1IeGayfT21HmDKEoS1Bsy9qBhYIjVpLjPbWWs1ZJEDFuSUe?=
 =?iso-8859-1?Q?5aIZcXxX+KwPzZlHaCaQEiD17YiAT39JJGsBqLYXgvCOU9nH9sozqlNNeb?=
 =?iso-8859-1?Q?5pOyl7qFe/JOYhcdgB68fkYRuQQreYMNPG2iCZRfUhsX9vFa4XyVYcUKqx?=
 =?iso-8859-1?Q?7TEqTONSlrq9cLyZonCNaRMv4mdTC6emsRGGEfmSc+UuGJBp+EKQJxVFBj?=
 =?iso-8859-1?Q?5weh1fC6NlmFKplp09AG1AUjplgvz8ThEm+mLGG/h0oyLH6DYWAToxTHkg?=
 =?iso-8859-1?Q?7aYmCmKoYKHqbc2EBd/StmCw8o42/Yxa72TN47FHR6+Xt3obM3PSMOJGFt?=
 =?iso-8859-1?Q?9ekXEudO7Rv2GiXgwc1uVT2Au+d7UXQaGHYilpGDYFUqR52ShoEOwfxTn+?=
 =?iso-8859-1?Q?zOPwoyZXO5La38EqYYUEEexNyoDWvC/fBCxTHnEIf7+9HAuYKqvv01xpwC?=
 =?iso-8859-1?Q?Yg/8uMeIN7ENGIBYkgIXHfraJ39ESA3wKxSGuGxlL+BaI8yTHp8/ixoO/K?=
 =?iso-8859-1?Q?+GperMYz2Mb1HYXZID2M+9D5q2UUQjDyFY6bjRZRC3XacogNDulOFMlggf?=
 =?iso-8859-1?Q?2q+ySWPSWskeNPskMpxHnqcAejcHs8O2UH3BncL5VI5F/i87KYieeguF90?=
 =?iso-8859-1?Q?Xx+JK73FMzp5d4hZcj/42wMVyex0i/MjZ0ikbLuwchvQt9ZT9tRix0T7Jg?=
 =?iso-8859-1?Q?zQG4vdYcqhniJIxOx+fXcGAvKOR3v6ggcozddhktjDUYHDjq1Y6Nu93it0?=
 =?iso-8859-1?Q?sHuvJA44g4Bbt1M9Sgn50NAiqs1C9gq9oBPi/l4kGL1PNQoGD+51kkFCvX?=
 =?iso-8859-1?Q?snoXpLjjtc0fFOASLaNM3pSf3WQbiRXmLK3sraNIqfWv1coHtoV2jqIJoM?=
 =?iso-8859-1?Q?pd2rWfo8PvkQnMzsbKIZNnUaNohAonfDuFFVk6MAGOAt1+yCu71lsWYghq?=
 =?iso-8859-1?Q?KVLoTw2tRumDoxvl8DSN6l4ECtx9X7vz03DvvQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LFv7XTVzuJR26U+tllEcdyneOI/Gwis8okO0qIY5sl6AVz/rmVxi5sEix6?=
 =?iso-8859-1?Q?QWWzMXgQ4pVbVVEsehaEFYWDBmBOi80N0T14IXQ1iGKnaovb3jXInRMY+P?=
 =?iso-8859-1?Q?d/DTBtebwRvaW+1thDo1e3jj+sX32vnb2d+/G3wuP9y1eVqSv8OdL24gPa?=
 =?iso-8859-1?Q?NLXa4+MPub+5PHREZ6kEf+zwOhnXi2qafgWQAmu+pOZuFuMnjO+biPtmyV?=
 =?iso-8859-1?Q?74yOzDsmC8UzdIPg6n05NEErawnVE0BhDBPgfhucenrezvTKsTsHrZeMDb?=
 =?iso-8859-1?Q?LKWNLqkONpbrRJ1rIRlffTOqBhS+4iDK3ESwgbTzKq3SuefqM8uDn0JUPT?=
 =?iso-8859-1?Q?u2KXm4UduK5MyJFK3BIgNVLiFDs0pdvt5xwmbTHB5nRKpmnCzyMoDvray/?=
 =?iso-8859-1?Q?ccNJw3qfJs/oRsL3Vw2uM5hTp3kbwn5SOHDKIv0RCX1aTNzJIV82G1QpbZ?=
 =?iso-8859-1?Q?aKtW3OnXUgcyIaY8ZTJOGlhf2/LDI0YC+nS6URyH2JHDOslJHDQyBQ31pr?=
 =?iso-8859-1?Q?OPxWYlylEx5OmvH1H7QQyVytr8Iw09B1NgrDeZo8D6a3sIWUK5XR3A1Z8H?=
 =?iso-8859-1?Q?3ROnVALPIV4T/UEmNjtePMAyaZ3wQKjjqk0Z8szAJ7chHt+Zcrs9nmeCbi?=
 =?iso-8859-1?Q?VAJeoDRtSqrM+PeZeR7gIBV28+Q9qjfqRNKUQyPrPu04piGIVKpNcMcepY?=
 =?iso-8859-1?Q?t/2DwGC/CBVd5Tk4/hgrznqIKFz6xCVFWJGZaR78e+Kb9JqZ8xxjEM9EOF?=
 =?iso-8859-1?Q?/nYX/oRfauWiWELXZGTMGwLU9sCZT+nCb40EeW2TOFlWOBMh9cKwfGlyd1?=
 =?iso-8859-1?Q?XaLHtCeuF8g+BpHvPv+GoKDs805wGDEUAZmo5rXvOFrA0sAKpoQo1CTUp+?=
 =?iso-8859-1?Q?dN0DcvxNHMZLJvuJmoCjH4p1D0OSw9XGSp5nh94Jheb09SsfiEQTmTng4n?=
 =?iso-8859-1?Q?o8MK8DifZ2CqMyI97X0yGfl0yUx07KS5y/nDWPq6cZzK1y2yZ3TQXYASUI?=
 =?iso-8859-1?Q?q3uEEjZcKYzGSURH0hP5iHDrpP/BPHTw0kiMznVeRo1pJfMMIjNrhoJSuD?=
 =?iso-8859-1?Q?zolk8UhYhChlvb4cbADGH8snzGNAu0u68f9VEVmQNlUchiObJMegDfL9j3?=
 =?iso-8859-1?Q?D7sis1xU1KhtW4bqLu4RS//mundcrjvF/gP6KvNtqjys0TRWFaX1SU98Av?=
 =?iso-8859-1?Q?dtPr1mfvgomUcafSPUP0lsfcFj+o59vobh515hCEozNaMIyYdq1imsOrpE?=
 =?iso-8859-1?Q?YLk1BcW1lORkeyTgTU2QzK/NSME6jOId4SRZxgYRKyHR1ujjsK4uEOdYpd?=
 =?iso-8859-1?Q?sPogGRKvc91Fjho6Al760Q3fMg9cvBTWkqq8H6DUyBmuf9hVBbMHHNKSsi?=
 =?iso-8859-1?Q?T8xHl39F/35XLtQB47Vzi2uW8fR6e5EfploDAOohwb7GLguKs8vsW6v9ru?=
 =?iso-8859-1?Q?PYVqD8cz6p7uc7XkZmr3+7I64bynVTimDhb46qYzBmf8LBI3GLXal3uxw/?=
 =?iso-8859-1?Q?cQLi7TDcZTKmmvuDaMWB6GK1l/7JoAsEZgaVPhl9gPdfJpbQL9e3RxsArd?=
 =?iso-8859-1?Q?u+gtcQfp5pg8PUqJTfEVfJ+t4AvDD4OC5zx/OiVq7yIcj4G9xy+koIA2Cv?=
 =?iso-8859-1?Q?M1q0tYq5pd2mdZF/vHX/tPazk1YPPsDL8MkLvVFC/OznKMfa8KHZM5TQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f1c478-fa70-4e17-7386-08de2d1100ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 17:26:58.7734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYiCrURNvd+D7BGwo7WTyau7fXAFbv/OVUd2mUfF0icPr8nki6u0Jni7ofnz/L244/e3q9jjhZQ5lfX2Koj77w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB266726CF
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

On Wed, Nov 26, 2025 at 03:09:26PM +0100, Philipp Stanner wrote:
> On Wed, 2025-11-26 at 15:02 +0100, Christian König wrote:
> > On 11/26/25 14:19, Philipp Stanner wrote:
> > > Barely anyone uses dma_fence_signal()'s (and similar functions') return
> > > code. Checking it is pretty much useless anyways, because what are you
> > > going to do if a fence was already signal it? Unsignal it and signal it
> > > again? ;p
> > 
> > Reviewed-by: Christian König <christian.koenig@amd.com> for the entire series.
> > 
> > Please push to drm-misc-next or leave me a note when I should pick it up.
> 
> Thx! I can push it. Let's wait a while to see if some of the other
> folks have sth to say.
> 

I think you have a small bug in patch #1 [1]. Also Intel's CI [2] is
complaining, it would nice to figure that out too + get a clean(ish) run
ahead of merging.

Matt

[1] https://patchwork.freedesktop.org/patch/690505/?series=158108&rev=1#comment_1268421
[2] https://patchwork.freedesktop.org/series/158108/

> > 
> > > Removing the return code simplifies the API and makes it easier for me
> > > to sit on top with Rust DmaFence.
> > 
> > BTW, I have an rb for embedding the lock and I'm now writing test cases.
> > 
> > When that is done you should be able to base the Rust DmaFence abstraction on that as well.
> 
> Yeah, thank you, that will actually help since I was in the process of
> solving the same life time issues in Rust.
> 
> I will give your series a review ~tomorrow, too. Or should I wait for
> v4 with the tests?
> 
> P.
> 
> > 
> > Regards,
> > Christian.
> > 
> > > 
> > > Philipp Stanner (6):
> > >   dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
> > >   amd/amdkfd: Ignore return code of dma_fence_signal()
> > >   drm/gpu/xe: Ignore dma_fenc_signal() return code
> > >   dma-buf: Don't misuse dma_fence_signal()
> > >   drm/ttm: Remove return check of dma_fence_signal()
> > >   dma-buf/dma-fence: Remove return code of signaling-functions
> > > 
> > >  drivers/dma-buf/dma-fence.c                   | 59 ++++++-------------
> > >  drivers/dma-buf/st-dma-fence.c                |  7 +--
> > >  drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  5 +-
> > >  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  3 +-
> > >  drivers/gpu/drm/xe/xe_hw_fence.c              |  5 +-
> > >  include/linux/dma-fence.h                     | 33 ++++++++---
> > >  6 files changed, 53 insertions(+), 59 deletions(-)
> > > 
> > 
> 
