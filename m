Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC65C363D5
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EF910E76A;
	Wed,  5 Nov 2025 15:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9WiomVy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD0D10E76A;
 Wed,  5 Nov 2025 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355489; x=1793891489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=efv6c3U2961QKtNlUYk58zacG89RCML1gi2ehUucSno=;
 b=F9WiomVywYSODI6VDhIpLtxh87TXJb+suLP9HKYi7NevBANLy1HDXUo4
 DI+e0pL4B/uiqgyv1tTEcJHWulJmOpzNXdBpxHOCMW0G0ul5ldk0vpDbj
 3p2gc1mLKyKlGhKOWg0BTl+u6oE2JdhNhbnMbNAsLD0oYREBf1ijWqse4
 qsGj8o33jBBVakYHETQXQFLZwp6oa9/2isLnMHMgNhJxsKGAHdtTHAd2U
 5kg4G4KWgaSyGZZgIZpOMcblyL5kHve1aUp63RYVpvgHh65/QCmSIDAdQ
 XW28cIfeEIdGkyL7fPckJHxH7c9bXE2mwcDtXCo7yqE08jhUEAfFEwf8U A==;
X-CSE-ConnectionGUID: L6xzP9n2Q0m69b5FXZaPVQ==
X-CSE-MsgGUID: +YVE1DALTzKq2PUebeHhxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74764158"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="74764158"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:29 -0800
X-CSE-ConnectionGUID: lQmK/gCrTpm1yA+KpCvNOw==
X-CSE-MsgGUID: /4flGeIJTdaowUOgV4Q46A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="224725505"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:11:28 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlKPEq39pTNvTXSoFiKtPfFGjVjygDd5GRP7xuOzQDtbEF6tnnar28fPQO8nmw8pnHI3XunSHnpphnRIBkG+arBnI7Q/4ClPLlcqGEvQpt7PDBnDKj2Efl7L84zApbhbD3C8dsXpvZuzOk92cz7/NnrYljjvf1nWmqM0U9c4Kxmle3bM2COQH5R5D3ODR4HHicNvw+ONSl/doVqbMD8QTw39U2gIYvH1zDm+hJJfgqsqnGEyGLC7xqJXKrWjmvqIeivvnkVV7KBg7e01wGb35vVVSPSukdjlJa9Mqng2nluK09WeIuoOD3Gl04jg3ENsQw71y1Hb7OsqdWE5T6hj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lfra+tlBYvD7blmmCXlM90PiYC1zAF+FD2lRtBrxSYs=;
 b=EJ/cYgxnI2LdlJ2fnG4EckE1el43y8zSfgmc4lcFpI6nq4fykfXkzRt5YmqcJ3gTHAd7ZBPOJFuh7JGsdXaBpPXm9hr8QPmEk03/PuNY00y4LNaRzjr3Btwa9FszR3h8A4QDUYoXCQOeAMK/L7h2A1tQVlFy47O+BdMjvouDTcE5HvXKaXRG675AFLG2b9aoKcPoGzVjtmW2niHg+juflmiSsbTbCOpc/VDxMBzA7KSPvdx7+bGSskTapKeN0Ohx3H9qaLltA9FL6FtvnvS0dqtR+/WpyUxRSDkd8kwgfmynupFktKfweqWxydQJymnQlx9Ppv6zxBMXxf24A+iy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:11:19 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:11:19 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 07/28] drm/xe/pf: Add support for encap/decap of bitstream
 to/from packet
Date: Wed, 5 Nov 2025 16:10:05 +0100
Message-ID: <20251105151027.540712-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 289a6d0c-f3a8-4a89-1a8f-08de1c7d92e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2FDeHpBVkU5TG1wblFLU0E0ZS9GQ05ldGprOERWY1FId0JyMzEwWGhEWGlt?=
 =?utf-8?B?ZWswakpSREkvcjlRdGtmYWd4TmNNQUVCeUcvQUpKRDR5TjI4L2N0WjNuOXJ2?=
 =?utf-8?B?bFFDbUgrdEZFbkwxMGo4aGk4dGJHUVdleDVUaDh3bWhsUGcwbldjTmJVMVBR?=
 =?utf-8?B?U0pkbHl6cWxoT3BVUjArb3cxOTdGY2xPUHJ6aEN6eDhNUzZReFprU2tJN21Y?=
 =?utf-8?B?Q0RyT2VFenVvU29mZVhENXp2TWJvVXpKNkFNMURwMzE2eUM4MG1EaTcvU2c4?=
 =?utf-8?B?b3N5ZytoZm9uN3NyYVlYcS9jV2wrZW1DZDZnTlBOck1SS09DbXpkdGg5RFJN?=
 =?utf-8?B?cE9GaEU3eXdLVTlzYTRGY3ZwMDNZcHhsUFlIeGJBOEtlQklYVFFBdUNnamp2?=
 =?utf-8?B?clFZMWx5WXA2WFZjU0JiUWlNQUZ4RDhabW5OdktJeXlVV0JrNE9PL3VQUXpS?=
 =?utf-8?B?UEY2bWJvWVZBKzNKbTVXNjBNS1lQM2ozUzlqWTVobUdkVDVHVVNUUElnZEZz?=
 =?utf-8?B?N0xOb0o5VFlqSUx1N1ZGSXVpTEkrQWxzaHQ0Nm45dHB4RW5jUzNPTExkSzlK?=
 =?utf-8?B?ODRmdDJtZHlYRnVleWVoMGJ1cEdiamlVYWdraVN3eld5dHg5cmtZQ05wcWNT?=
 =?utf-8?B?NTlsUlFVU0tIcStQRHFSRmdQZTdNYTdubll3OVFKQVEwL09Pa3FtVkJleDZM?=
 =?utf-8?B?bGRNTjVDZHhGRVhwb0xLcVB5OUpsRkdVbEVEZkQ0YWJ2Tk05RjBwMldGeURP?=
 =?utf-8?B?aWJRWVQyYVh0MXZpajlndCs4bmFlNW84MWZoY1JTN3IrZGZpaDNURk1xWjNv?=
 =?utf-8?B?SnE2UFN2TkpEeERwcnV1dHoxVlIyN2Nuc1VDZ291dy96UlVmckZBczZzaVgz?=
 =?utf-8?B?cG1kcjlqTUw2alpLYTg1MVhxZTZTcXIvdjdhRll6b0M3ZGJydTNteDRQS0gz?=
 =?utf-8?B?aUY5QTlGcXFBMFVuTTlYR29rT3hjeFcxbUxqVnBxTUtqaU5HOTZQbWtPV1lD?=
 =?utf-8?B?TWxPUktwQXlkNUIxSDdLcDJ2KythYzdlbmVTMGl3MVJMYXB4ZnpGSHo0eDRM?=
 =?utf-8?B?bWp4RmRhaTY1dkplOEZNeWxGYm5OUjFoTFlDRUxjL3ZTU2d0N1VoL01tNWNl?=
 =?utf-8?B?cUpleEhyNWpHclZBdmhmRVNuTDNNUmlvVDBtUWlLUVJNYUQyMWYxRUlPUWJI?=
 =?utf-8?B?RG9WTHh4RDNnbGM2b28rb0hjMHR4UXBYMmJscmU2a3BGYVN5KzVYWGVVOTB5?=
 =?utf-8?B?Wm5NdW5uSHpJTE1LbVRsU0c5V05MTThNSXlwdzlNVXJwQUZVOXVFYTVCRWpW?=
 =?utf-8?B?aTJHdEE5UVA0bmpGYzNzbEwyWTlWTXRvSHBzcjRiNEdHdjl5T1Y0cUdHOCs4?=
 =?utf-8?B?bjdiVzVWVk84TkZmZFFNd3oyRWN6OERha2N5NFRCLzhwVWsvZTlLMmJ1UVN5?=
 =?utf-8?B?a2FkSXB3MVZ1RVlzUnpuMVVJZ2YzYi9pU1NIb2ZyR1hCNW5KOTNvc0E2aGZQ?=
 =?utf-8?B?WWVQdk9kR0xCM0FHNUkvVFFhZ1BPOU9oY3ZHSHZOcjllS294cGVJUHprd2RJ?=
 =?utf-8?B?Z2NSajZCNmQ2M0RjME1iYlZUY2ltRFU2M2RRcjJQU2VqVXZQSW94cmxwRExY?=
 =?utf-8?B?bUxIODBTa3dBdmtmTTNidFNGb0pzOTVtVDBuNkR4NjNtQkNsYWZ6c0VobUF0?=
 =?utf-8?B?WkpWbFB4UUVKRldMc0Y1S2NIY3hGc2hsbkVXREIyMmttUVd3dTYydGsxZjZL?=
 =?utf-8?B?QkFLbE5KWGNza3BNTnB4T0QzSFRNb1hIdFV4TVpSWTkzbWRxdG5KdzBtUGRP?=
 =?utf-8?B?R2l0YUJaYW5CWU9qS21oaVFkVkxUMTBJUmRaSy9id0JkcmVTTSt6STV0RERH?=
 =?utf-8?B?NVJNb3JNRVAxR3Z4aGoySmZVT0k4ZDBwa0VSdWJNYjRCcUkwZzFaczAwOVdt?=
 =?utf-8?B?bUVTZjlGTC9RbjBxbVVRUjlWRTdXUXJsdkQyV0lMZVpQeW9UU1cyTHdCVVJH?=
 =?utf-8?Q?u8JZtAiECOOlcQciN23Zz0GgkQ4zqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEd2bUlJYWpzU2t3bFk0UTRvaEQrRmM4c0wzZXB3YjJWcWQvK3FOdHBOcW1E?=
 =?utf-8?B?dU1nSm85amU4TlM5aWlSY213R2d4cEgyTW0wWXBXRWM4V2k3SmIzcHg4V05R?=
 =?utf-8?B?eXI4U3I2d2pVeTF4dERTRHZ6a3QzcDc0ZTJ0TzF6UldBUWpmd29XcVJDanZC?=
 =?utf-8?B?MXhub3Y2QyszWVRsS1JFRGZid3pwemxUYzU4c3RaVG5UbDF6VXl3cUxLdXZR?=
 =?utf-8?B?UG1IS0RBM29TN2pvOFV2Qkg1ZXlLd1Y2VU9uOFJYZmpaSTJLZkkzS3oranll?=
 =?utf-8?B?MTBHMzZIY2sxT29KdWZ1Zk1oRmF4a3lYU1BuKy9yVmliZGpJK2xGYUY5dCs3?=
 =?utf-8?B?dDNJYlA0cW1FUkxQODJVcGUwN040bnB2QmRVTUZSTExydFEzK2djNUF4eEUz?=
 =?utf-8?B?RXE5bXgwTDVkRmFGTk9oZ1NqekZaSFRxMDlCMkJ4MXhObHBuNVFOS1doWlll?=
 =?utf-8?B?UzNYRTlMTWg4eVB3SXNHQUdpSmxUTXBSVE5EVzFmNkthVTRxZFZ6U2xwUWNj?=
 =?utf-8?B?dG1mOFE5eHh1RWgxNFhEeTAvbE5raEx2WVhoTTlLTFFWWkdGQVoybGhYZzBo?=
 =?utf-8?B?cWNPTE82Sk1IZFdnRzJyZ0FpeEl5ekdYMjExaWpTSmFSU0dJOXpKMnk2UGxG?=
 =?utf-8?B?dGxMWDlnakJMU1dVWkRSUHd6U1d2Y09IYVNoaEZ2UXgzdUR2QWc2c01wNEEx?=
 =?utf-8?B?WHFYOUovdnVHMFV6SlJveFVmaVo4dTdYOHBwTUdXTGdUazdSTWtPcW43TStS?=
 =?utf-8?B?UVdOSFBZUmc1ODUyai9OOU5hQkdVRlFIOGxtZ3dULzRLUGJHLzJBS0lBdlgy?=
 =?utf-8?B?VnhFU3lxS1FWanJpNE9aTEh0NDN6em9abGE4OE5TMlB3aHp6NGdoQzZmU25F?=
 =?utf-8?B?aFo4SlhFc0gyaWhybFd1aUdDeUF3YXQ3LzlHWHRjL1U0akl4d25aRjU4djcw?=
 =?utf-8?B?QWxyM0ZpUDVzZFFmOXAvRDBLdjY2U2doYndZWVlZdXBqZnl5MUo4ZXIvNUJn?=
 =?utf-8?B?TVpPRk5henYwM25UU3htd0JGMk50M0R6akh5bnZ5Z2g1b3hhRFI3K3MySThl?=
 =?utf-8?B?NVdFMHV3a0dTNlluTEVhMXFSWmJqN1VId0FySkxlSDRqNzJRbzYySnZlNmFQ?=
 =?utf-8?B?eEpPTVhQOWVNbG1aZVpMQWFwNEFJSW5FSlZQeCtGVDBBQTZnZ3BIYkRKaEUw?=
 =?utf-8?B?SDZJUWxoVG8rS2NSL294QlFwODZBb0VONHh4ckx4YXEwSGliNlYrN3YzVWc5?=
 =?utf-8?B?OWhJRUF1OVRhbFN5YTg5MTEzTzFBM0ZSRlo0T0ttR1gvOWNjb3FPTzlHNTE1?=
 =?utf-8?B?V1lsR2hJNWt3cUtrMjJVSi9DYlpSZ1ZwcWxNTjNCeWdSMUtDeVE5RDh4MXdu?=
 =?utf-8?B?aUJvY1JINmpzbG9XOWFxclh3QWxxUWJxaTlRTkdEazBCclZiYnRuWVcrZWxM?=
 =?utf-8?B?Uk5JU25rUk1TZmdnbklHUFFIR1l1WTdkSUUwd05aSU1DVUJYUU1MNTAvaEhy?=
 =?utf-8?B?RHI5ZjFkNDlFTmFLN0g2ZUFGZy9nWDZLUEdySFpBWnVPTHNkSHRjQVM0ZVRU?=
 =?utf-8?B?WVhSU25WWkpmN1F4cEJzSjNCM3R1Q0pVRERHdVFYL3hFTnNERlVhb3p6b1pP?=
 =?utf-8?B?dm1JUVA1MUMxZmp1WVZSbmhJQnUzRGs4bE11Qm1ybjA3ZUk1dDRqQnVCUmpO?=
 =?utf-8?B?Z25SeXNuNU5iUDZDTHZqK3YwNVVySVcvUERINmhnTE93NnR4MFNmOGtIVXJx?=
 =?utf-8?B?UEFEZHFxNVhyLzZUeGVxMUszL3lJMGdKdkVmNkZlN3dPUEpKZ05KRVdLU085?=
 =?utf-8?B?c0ZRbERDQmk5akpwVGNuLy9WMm5ZRDREUEpJNWhMdlFtRXlVZW9JZGdhT2l1?=
 =?utf-8?B?Q1QzVE1ob2lOd1g5SFFpZzVKaTQ3aTBFQzJ1UmNhNGdTbjBqQzU3NmY2T2xT?=
 =?utf-8?B?N3pNL3kwN2hqTlExdDhEVDd3LzlxR2k2ZHh2Z1R5TWRYTHRpaGpGUGNJbk01?=
 =?utf-8?B?NXZMWTlJc1dWYnJuRzRERTVNQmVsdUpaMktNZnhRdEFMejd1WmlpYm9maGp6?=
 =?utf-8?B?YVhGdERPOTBxNjR2NDFNazhueitmczVwSFV5Z3ZLZXRtanVsd0F0NFNUMC9u?=
 =?utf-8?B?UDVtMlJlNXhpRkM3dCtJcFE0Q0wyWnBCSVpZRm1POGR4Yi9qZTZuTUVNQzFD?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 289a6d0c-f3a8-4a89-1a8f-08de1c7d92e8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:11:19.6606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WW+ZKwVjBu2sp3ZEW05LqVdvTpdZ1dxpdzAKXH08dLOroeTyhElXpzM/EJH6f84puSvmsVtYobS/tC9ggwnLO0b2EUQMCxcDKbBi50oNPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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

Add debugfs handlers for migration state and handle bitstream
.read()/.write() to convert from bitstream to/from migration data
packets.
As descriptor/trailer are handled at this layer - add handling for both
save and restore side.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c          | 291 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.h          |   6 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  35 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 121 ++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   5 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
 7 files changed, 472 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index 2cdcfb2073d00..220c36c52e99b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -6,6 +6,45 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_sriov_packet.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+#include "xe_sriov_printk.h"
+
+static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+
+	return &xe->sriov.pf.vfs[vfid].migration.lock;
+}
+
+static struct xe_sriov_packet **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.pending;
+}
+
+static struct xe_sriov_packet **
+pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
+}
+
+static struct xe_sriov_packet **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.trailer;
+}
 
 static bool pkt_needs_bo(struct xe_sriov_packet *data)
 {
@@ -127,3 +166,255 @@ int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data)
 
 	return mig_pkt_init(data);
 }
+
+static ssize_t vf_mig_hdr_read(struct xe_sriov_packet *data,
+			       char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+
+	if (!data->hdr_remaining)
+		return -EINVAL;
+
+	if (len > data->hdr_remaining)
+		len = data->hdr_remaining;
+
+	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
+		return -EFAULT;
+
+	data->hdr_remaining -= len;
+
+	return len;
+}
+
+static ssize_t vf_mig_data_read(struct xe_sriov_packet *data,
+				char __user *buf, size_t len)
+{
+	if (len > data->remaining)
+		len = data->remaining;
+
+	if (copy_to_user(buf, data->vaddr + (data->size - data->remaining), len))
+		return -EFAULT;
+
+	data->remaining -= len;
+
+	return len;
+}
+
+static ssize_t __vf_mig_packet_read_single(struct xe_sriov_packet **data,
+					   unsigned int vfid, char __user *buf, size_t len)
+{
+	ssize_t copied = 0;
+
+	if ((*data)->hdr_remaining)
+		copied = vf_mig_hdr_read(*data, buf, len);
+	else
+		copied = vf_mig_data_read(*data, buf, len);
+
+	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
+		xe_sriov_packet_free(*data);
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+static struct xe_sriov_packet **vf_mig_pick_packet(struct xe_device *xe,
+						   unsigned int vfid)
+{
+	struct xe_sriov_packet **data;
+
+	data = pf_pick_descriptor(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_pending(xe, vfid);
+	if (!*data)
+		*data = xe_sriov_pf_migration_save_consume(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_trailer(xe, vfid);
+	if (*data)
+		return data;
+
+	return ERR_PTR(-ENODATA);
+}
+
+/**
+ * xe_sriov_packet_read_single() - Read migration data from a single packet.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_packet_read_single(struct xe_device *xe, unsigned int vfid,
+				    char __user *buf, size_t len)
+{
+	struct xe_sriov_packet **data = vf_mig_pick_packet(xe, vfid);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return __vf_mig_packet_read_single(data, vfid, buf, len);
+}
+
+static ssize_t vf_mig_hdr_write(struct xe_sriov_packet *data,
+				const char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+	int ret;
+
+	if (len > data->hdr_remaining)
+		len = data->hdr_remaining;
+
+	if (copy_from_user((void *)&data->hdr + offset, buf, len))
+		return -EFAULT;
+
+	data->hdr_remaining -= len;
+
+	if (!data->hdr_remaining) {
+		ret = xe_sriov_packet_init_from_hdr(data);
+		if (ret)
+			return ret;
+	}
+
+	return len;
+}
+
+static ssize_t vf_mig_data_write(struct xe_sriov_packet *data,
+				 const char __user *buf, size_t len)
+{
+	if (len > data->remaining)
+		len = data->remaining;
+
+	if (copy_from_user(data->vaddr + (data->size - data->remaining), buf, len))
+		return -EFAULT;
+
+	data->remaining -= len;
+
+	return len;
+}
+
+/**
+ * xe_sriov_packet_write_single() - Write migration data to a single packet.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
+				     const char __user *buf, size_t len)
+{
+	struct xe_sriov_packet **data = pf_pick_pending(xe, vfid);
+	int ret;
+	ssize_t copied;
+
+	if (IS_ERR_OR_NULL(*data)) {
+		*data = xe_sriov_packet_alloc(xe);
+		if (!*data)
+			return -ENOMEM;
+	}
+
+	if ((*data)->hdr_remaining)
+		copied = vf_mig_hdr_write(*data, buf, len);
+	else
+		copied = vf_mig_data_write(*data, buf, len);
+
+	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
+		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
+		if (ret) {
+			xe_sriov_packet_free(*data);
+			return ret;
+		}
+
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+#define MIGRATION_DESCRIPTOR_DWORDS 0
+static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet **desc = pf_pick_descriptor(xe, vfid);
+	struct xe_sriov_packet *data;
+	int ret;
+
+	data = xe_sriov_packet_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, 0, 0, XE_SRIOV_PACKET_TYPE_DESCRIPTOR,
+				   0, MIGRATION_DESCRIPTOR_DWORDS * sizeof(u32));
+	if (ret) {
+		xe_sriov_packet_free(data);
+		return ret;
+	}
+
+	*desc = data;
+
+	return 0;
+}
+
+static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet **data = pf_pick_pending(xe, vfid);
+
+	*data = NULL;
+}
+
+#define MIGRATION_TRAILER_SIZE 0
+static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet **trailer = pf_pick_trailer(xe, vfid);
+	struct xe_sriov_packet *data;
+	int ret;
+
+	data = xe_sriov_packet_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, 0, 0, XE_SRIOV_PACKET_TYPE_TRAILER,
+				   0, MIGRATION_TRAILER_SIZE);
+	if (ret) {
+		xe_sriov_packet_free(data);
+		return ret;
+	}
+
+	*trailer = data;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_packet_save_init() - Initialize the pending save migration packets.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid)
+{
+	int ret;
+
+	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
+		ret = pf_descriptor_init(xe, vfid);
+		if (ret)
+			return ret;
+
+		ret = pf_trailer_init(xe, vfid);
+		if (ret)
+			return ret;
+
+		pf_pending_init(xe, vfid);
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.h b/drivers/gpu/drm/xe/xe_sriov_packet.h
index 2c5a49897d763..03ab8edd99374 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.h
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.h
@@ -27,4 +27,10 @@ int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
 			 enum xe_sriov_packet_type, loff_t offset, size_t size);
 int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data);
 
+ssize_t xe_sriov_packet_read_single(struct xe_device *xe, unsigned int vfid,
+				    char __user *buf, size_t len);
+ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
+				     const char __user *buf, size_t len);
+int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 8d8a01faf5291..87205f0505ad0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_sriov_packet.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_printk.h"
 
@@ -165,6 +166,10 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
 	unsigned int id;
 	int ret;
 
+	ret = xe_sriov_packet_save_init(xe, vfid);
+	if (ret)
+		return ret;
+
 	for_each_gt(gt, xe, id) {
 		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index e0e6340c49106..4ca86ff4b7dae 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
@@ -132,6 +133,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
  *      │   ├── vf1
+ *      │   │   ├── migration_data
  *      │   │   ├── pause
  *      │   │   ├── reset
  *      │   │   ├── resume
@@ -220,6 +222,38 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
 
+static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+
+	if (*pos)
+		return -ESPIPE;
+
+	return xe_sriov_pf_migration_write(xe, vfid, buf, count);
+}
+
+static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+
+	if (*ppos)
+		return -ESPIPE;
+
+	return xe_sriov_pf_migration_read(xe, vfid, buf, count);
+}
+
+static const struct file_operations data_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.write		= data_write,
+	.read		= data_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -228,6 +262,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
+	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index ed44eda9418cc..4e0ca2fd7fd77 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -10,6 +10,7 @@
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_sriov_packet.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
 #include "xe_sriov_printk.h"
@@ -53,6 +54,15 @@ static bool pf_check_migration_support(struct xe_device *xe)
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
 
+static void pf_migration_cleanup(void *arg)
+{
+	struct xe_sriov_migration_state *migration = arg;
+
+	xe_sriov_packet_free(migration->pending);
+	xe_sriov_packet_free(migration->trailer);
+	xe_sriov_packet_free(migration->descriptor);
+}
+
 /**
  * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
  * @xe: the &xe_device
@@ -62,6 +72,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
 int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
 	unsigned int n, totalvfs;
+	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
@@ -73,7 +84,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
 	for (n = 1; n <= totalvfs; n++) {
 		struct xe_sriov_migration_state *migration = pf_pick_migration(xe, n);
 
+		err = drmm_mutex_init(&xe->drm, &migration->lock);
+		if (err)
+			return err;
+
 		init_waitqueue_head(&migration->wq);
+
+		err = devm_add_action_or_reset(xe->drm.dev, pf_migration_cleanup, migration);
+		if (err)
+			return err;
 	}
 
 	return 0;
@@ -154,6 +173,36 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
 	return data;
 }
 
+static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
+				struct xe_sriov_packet *data)
+{
+	if (data->tile != 0 || data->gt != 0)
+		return -EINVAL;
+
+	xe_sriov_packet_free(data);
+
+	return 0;
+}
+
+static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
+			     struct xe_sriov_packet *data)
+{
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	if (data->tile != 0 || data->gt != 0)
+		return -EINVAL;
+	if (data->offset != 0 || data->size != 0 || data->buff || data->bo)
+		return -EINVAL;
+
+	xe_sriov_packet_free(data);
+
+	for_each_gt(gt, xe, gt_id)
+		xe_gt_sriov_pf_control_restore_data_done(gt, vfid);
+
+	return 0;
+}
+
 /**
  * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
  * @xe: the &xe_device
@@ -173,6 +222,11 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	if (data->type == XE_SRIOV_PACKET_TYPE_DESCRIPTOR)
+		return pf_handle_descriptor(xe, vfid, data);
+	if (data->type == XE_SRIOV_PACKET_TYPE_TRAILER)
+		return pf_handle_trailer(xe, vfid, data);
+
 	gt = xe_device_get_gt(xe, data->gt);
 	if (!gt || data->tile != gt->tile->id) {
 		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
@@ -182,3 +236,70 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 
 	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
 }
+
+/**
+ * xe_sriov_pf_migration_read() - Read migration data from the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_pf_migration_read(struct xe_device *xe, unsigned int vfid,
+				   char __user *buf, size_t len)
+{
+	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
+	ssize_t ret, consumed = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &migration->lock) {
+		while (consumed < len) {
+			ret = xe_sriov_packet_read_single(xe, vfid, buf, len - consumed);
+			if (ret == -ENODATA)
+				break;
+			if (ret < 0)
+				return ret;
+
+			consumed += ret;
+			buf += ret;
+		}
+	}
+
+	return consumed;
+}
+
+/**
+ * xe_sriov_pf_migration_write() - Write migration data to the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_pf_migration_write(struct xe_device *xe, unsigned int vfid,
+				    const char __user *buf, size_t len)
+{
+	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
+	ssize_t ret, produced = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &migration->lock) {
+		while (produced < len) {
+			ret = xe_sriov_packet_write_single(xe, vfid, buf, len - produced);
+			if (ret < 0)
+				return ret;
+
+			produced += ret;
+			buf += ret;
+		}
+	}
+
+	return produced;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index d48ff2ecc2308..dbf8094900df8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -20,4 +20,9 @@ struct xe_sriov_packet *
 xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
 wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
+ssize_t xe_sriov_pf_migration_read(struct xe_device *xe, unsigned int vfid,
+				   char __user *buf, size_t len);
+ssize_t xe_sriov_pf_migration_write(struct xe_device *xe, unsigned int vfid,
+				    const char __user *buf, size_t len);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index 3177ca24215cb..7396c86a6e0f8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/mutex_types.h>
 #include <linux/wait.h>
 
 /**
@@ -23,6 +24,14 @@ struct xe_sriov_pf_migration {
 struct xe_sriov_migration_state {
 	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
 	wait_queue_head_t wq;
+	/** @lock: Mutex protecting the migration data */
+	struct mutex lock;
+	/** @pending: currently processed data packet of VF resource */
+	struct xe_sriov_packet *pending;
+	/** @trailer: data packet used to indicate the end of stream */
+	struct xe_sriov_packet *trailer;
+	/** @descriptor: data packet containing the metadata describing the device */
+	struct xe_sriov_packet *descriptor;
 };
 
 /**
-- 
2.51.2

