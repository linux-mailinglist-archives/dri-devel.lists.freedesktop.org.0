Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F11BA6A47A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF64910E5EC;
	Thu, 20 Mar 2025 11:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="be00nlNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3898C10E5EC;
 Thu, 20 Mar 2025 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742468996; x=1774004996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=L0gnhAy12+pBA8N7aVrR1ppPMpMddCZ1SRv+i8EY6PE=;
 b=be00nlNlpCasOl4ujq21+XDtIUzITljfMRQDiBcnuo4fM/GJZaryDggy
 RaH072z8byVPkAqkOmg2oigghNlH2vlzx6NbIMuPs5evcT19M/IDnJBCC
 J4/aohRFdfbrcROLRfz8U40oU8QSQUE0Q8vouxEze1iWw8lQ8sfe11Yki
 p3W4iazxef+WLEn4DxJeBkzESHSeNeboazUnTrlGx/WKZPNS+YjRDyfxn
 hHODY/J68QP02cJhgUvJ6iE35ffI7ISJFbw5M6YDq+Kk0on17q65pDlM/
 nn5pJBb8WtEdYOXxnAdgUA4JNmKNxNKUgxVpKU106muV4jRruHeAdLcYp w==;
X-CSE-ConnectionGUID: 9U2HgIE8Tda1x7Vq5h9c6w==
X-CSE-MsgGUID: NbwZcxfES1GkoeKUfEBEpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55070867"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="55070867"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:09:56 -0700
X-CSE-ConnectionGUID: VGLe8Q3NTYuf6JlmfIiCLA==
X-CSE-MsgGUID: kwZv40D5RVOWPAgtjfBM2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="146265569"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:09:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 04:09:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 04:09:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 04:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5M5o3qP/1eJsiM54j8efN2kLOncb1WQMJD/7Pdo+kouEHPDvL3yT2RNdpMsuRLQO9vjqf0YyWV56mWYpa7d7s67OQNoDy+GXBnXedG+5XttkHxnkyajTNQWC/Ho9ENpfZb7F+HL9dM7rl//ySIQxYB7R1KZ8vAsbLaTmnrShsg0OF4aojRLs8O0h3LGiAUzAR/m3QmgHgbRuhL/yHp4boNYNftLJFjlMHMEBI0E0yY3uKU8R9WhC5mPunV0uU0AEdbfLCzWgjdktMuDbJ02HN3yWIW/PEUdyLjsQnxxubYSybkZ9ZW1nZL0jC8YHTYE40nw3/PzNGVFlIKgmVfF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkh+RjKXYZuPmliaIxzvKlbcAJ3OTsmXJEDPgMuDqNI=;
 b=iwclHgYoXSPXjgTr6WzQFKewMhFelKJtyyU9i2/gqyACCkeMK+5BkTQm/fQfKbfCQ2aCuzf1N67ZmVBIxIkmAIrTvUta9E8UZhpHai7Bb5aSQiEPDQ/WEYJWKp1w+qqcqCRmiEgHp0kXRjTt9+wxVTa+LiBCNp51tEkTptVaKBbxxEj/3uWfBTqh9ZnI/sbMfrAaDfI8H4rDMMkwmReQvIUUzAGN4toSaF0s6buRsXprxHB4sWLuiKpF1hz+QLlaE0kaYpVRHFdVwjfztH/b2hXZ4sZdtS03ps/Vo3DH4tN4ykjAgfdzdHnA+X3uPEPltBqa8Rr/YEAgCz5sE9uVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:09:53 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%7]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 11:09:53 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v6 4/6] PCI/IOV: Check that VF BAR fits within the reservation
Date: Thu, 20 Mar 2025 12:08:52 +0100
Message-ID: <20250320110854.3866284-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320110854.3866284-1-michal.winiarski@intel.com>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0178.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::35) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f7e26c-30fb-4e4f-23b9-08dd679fbd3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHltRUJQL3FSL3pINGlDQTNBY1laVnljL2hHRmt2dUtvZEUyZllUQk1JeWVK?=
 =?utf-8?B?UnVxOG5XK1FoaVNTd2RGSTNoTHZlSXZhb0xsTERVMm9UYlFMdFdUWXlmK2k4?=
 =?utf-8?B?SzhOdjI4NlAycnVJL3MvdHUxVmQ3MVZsSnRiLy9adTBwTU9hQ0lsVmlrdG9V?=
 =?utf-8?B?Y1FVdzd1TGR5a0o1a1VONmNieDF3NnB3Tm1OS0R5V0M4N0xySkRGQk15cXhP?=
 =?utf-8?B?QktBUnhtVTk3RkpqaWEzT2FUY2dyOFE1ZllYT3F1QitSVld6WEtTa2dYcEY3?=
 =?utf-8?B?eGVqeTcwVlAvWnNrK3ErbnhvMlRUWDA1bHBtclVEYXJTVEdDNDZ3NnFXQUV0?=
 =?utf-8?B?ZnliV3hDU3dlektGNG9UejJ4RlpDVTkyODJXWjdTUWJCcFhoZVBrTGFPYU5x?=
 =?utf-8?B?ZjBrZ2JENWVvSTlzUHluL1NCRXgxZHQvVTBsSkpWekNRSUFLVWNFbzBIUXFk?=
 =?utf-8?B?a1M4WlZMUUlaclM1OVk2K1I2QTNvaENUTXJ1WjU4blpDWDJPUGRXTXk5bjVm?=
 =?utf-8?B?K1F5K1BLMTN4ZVFrVzlWMnNhSFRYdHA0SG9DdmI4UFFMNjVqMCsvd1UxTHRL?=
 =?utf-8?B?Q01XRHJLREF2MXpRcWxwdkNZOVJrNXNsWGdhaitPYmZBQnIxTWJmWHBXeHBs?=
 =?utf-8?B?UXZPYWh4R0VIaFRkdHNzb09VY2xzN1NYV1pIZk1Qbml3cjBldm44ZVVGanBZ?=
 =?utf-8?B?Qk0zNWc3MjRNV20yOGoxcnVjL21hT0VaYVRLR0kvZ1JxeEZQZ1BRTlRISEVP?=
 =?utf-8?B?NHV4VVpUVjJhYUx2K3UyVHNlMDVialY2U3lScExOSDZOYkErU2dNWVVqQmcw?=
 =?utf-8?B?SWIwMGNPQjVmYVFjYkF2ZDQ5Mm1IQlNLWjFjZnhEWmlXTFlBOTRXUHBFUktz?=
 =?utf-8?B?L3JQV1hEdWhxaGFrVTN1bWVQRUsvbk45L3RnUDBTTkxpYXNGelNvSjlFdERH?=
 =?utf-8?B?Znc1Y1Z0SURpZ2pHSGZZc3dnUHJJMzZZL2dlTHUvZllQRXNuZGo3eVIyaHFk?=
 =?utf-8?B?K2taVkZNUjhnWW9KMkJ5RTMwcEROdUhsNXY1akZNd3lyY2pDdnhiQ0o2V3RP?=
 =?utf-8?B?bkVvb2tQR0xvRVhZK0x0ZHdISXowTlE2R2VOcVd2dWlyUVlyd3JBNklsNE11?=
 =?utf-8?B?c0xhM2kzWjVFNEV4YTVZOHlrY2FLMmk3NVFIbkQ0T3c2bVJBd2d5c0JqVEFL?=
 =?utf-8?B?RndPM29abkxCVFNzVGhXcXFORjROMmtERk44OWpZZ292cTl1d0oxWGxsa2lW?=
 =?utf-8?B?Z2JWL21RY2VmdjZVbm9TYllwY1JUSjkvc0pKVEsvTnRFeWVWWGxCVzIxWk9q?=
 =?utf-8?B?R3B3c3ZLTnpWL216NHZOaXVMbERGcW1SQVlKaDZyOEVZeDB3ay9MSDk0OHJF?=
 =?utf-8?B?Rm5VMzBJQnJnanVNSFdGd2pCWk8vdy9TUjFTU2x0ODloS1g0aW0veWdMR0k2?=
 =?utf-8?B?cUU2L0d6bFlHcnpxZlRRMVFLeXEwUkNZT0E1bzZDdEhqVTZNbWV3cndjRmwz?=
 =?utf-8?B?SjZodHVBd1hac1Qwd2RoemhsVFB5SmJ5UW5BT1lGSzdrMmdYN0VVbzZuY0lR?=
 =?utf-8?B?V045VUkvdHlxaUVVSEV6Z0lXQUlDNS9JNTg4dlUyVEFyYUJNaXhvZmprbDly?=
 =?utf-8?B?MGgraHVXTEdlYTBzNU5GSWsybElPeG1yeTlzdWFxTWtSUUZ1R01FNmIvVC9M?=
 =?utf-8?B?QlFoN2lqK2NsZ0JHVnJCSnYremdhcWxTOTlRZ1A5ak85TitlNFcxUVJmV2hp?=
 =?utf-8?B?UjFubzhzeU9VL3dyMmorWm5DNU9mNFZlbmROVjdDdERTVmNEYWlQSXpOOWlh?=
 =?utf-8?B?cXEwRGZyS1ArYkNoUjlQMWRDNm5RWURiN0pIUGF4SXlXNEdVbDk5UGlBSWp6?=
 =?utf-8?Q?8h89TmnRzXMN2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elEvMmNSaVd4L2c3ZjNvd2lhNm92dk14cUlKcFVMNEE1aWxUUnBGTE5GVCtC?=
 =?utf-8?B?WFpoMUJxdDRNRHBsZCtuZjV5eHVqWVI4MGdBcnRla3BMZzFuSHJOdjZ0VGpG?=
 =?utf-8?B?eDNmRWNkY1AxVUN2LzVMZTIwM2hvZ2RhRGkyZUVhZnk3dWh4K0QwUXo0czcv?=
 =?utf-8?B?d0VrTldxUXppQk1aVk1vQ1YveFZDYWFydUxqM3orNTZaU3NyNVZLVlhxU2pa?=
 =?utf-8?B?SHd3dkJlNWE4NFU2UmdxRHJoRkJjR2JHK2x2MDJQSkRCOWx4cnRsVG1rK1Rh?=
 =?utf-8?B?My9jSjFteGRnRjB6STZKZ3JRdjdiMjJUbG5WdXhTQkVyWG9kN0RZck5jU1dk?=
 =?utf-8?B?RkFJOGZBR1V5MEdmQU5jVjNxcmd3YW8vUk94TGRWVEpqeHFEZ0VFbTE2c3d6?=
 =?utf-8?B?RUhMT0NSOVEza1NqWFMrVURRSUdQZERmWlR5emdPRCtTSC9tc25mcTJoem0x?=
 =?utf-8?B?eUUxWis0S0RiLytEQ2VyaEhnTXc1Y3VBUFNwU3dlb0ZYMTExSHVpYWhqL1Jz?=
 =?utf-8?B?TUo3TFRkNmkyTEdoYXdoR3NPZHJxYWlvVlNYVzhucUVSQzdQdk1WR3JjSkhT?=
 =?utf-8?B?RTZYMXEzcFpUdS9qaVFkdEF5UE5EbUV4bzF5S1VSZDZJUG5CZmlFZTNhMlJ1?=
 =?utf-8?B?ZkFjYldPdEg2UEVkUGlBYzRHZGxUOFQ1b3RYanJ5Y0t0Q1MxUWlUNCtrNGYr?=
 =?utf-8?B?OXBKQlpNRXFuTkFqWFhrcFJUdzQ0dVZ6aEZTblJSeHNlVXIyMDNuWnRMZm55?=
 =?utf-8?B?UmYyMDZmQXBlOG96WWJzVU8wMWpiOFVMY2JrY3phRm4vcEJUVzR3cEVWa1dk?=
 =?utf-8?B?UWlOdXN6TUpiWm5HbkVMZHVucWFMWjRuUm5IM2s3Y1RIZHBJam1JSWlyall0?=
 =?utf-8?B?R1RXSnZ3ZllubklIVDczckpNMnVNRFFxS2NGUE5EQ0g2OXRlRHpwcElsQ1ZS?=
 =?utf-8?B?UDNsZWVObWZsQ05Yc1JGb1dFbmkzMW1kemZJenlGNTJ6T1JOUmVvRzdLU0xk?=
 =?utf-8?B?Q1h6enpkWW1pQWRKc3hjQTRrKzRwNStjNUU3MVNBTVd2UUdjUnpYSWEyNUJy?=
 =?utf-8?B?bFpSZWtScWpBT2VnWVhUSGVVWCsxNWdYc1RLd0NlMEtJZkw1ZWtTMk1HdjJ3?=
 =?utf-8?B?RFIyOGJKbmRoK3RoWWVGSUZFTDJZcDdhOFFyNEtJdEt1T0NOVGhNL0pDVTJU?=
 =?utf-8?B?YVpjK0UwUzNZM1FTaTB0eG1uL0J5M2NwRkJNbW05c3dDb1lSMlNBSml4YjNI?=
 =?utf-8?B?WG81K0dNOW5PaU8wZkZMVVd5RGp4c2tUTXhYWDlMWmlRdmpya0FlUnZzUXlT?=
 =?utf-8?B?WEZmS3hSR0NveUFLOFJ4U3NPRkF0OW5kQThaZ295MjU1czZtcW5mVmFuU0Zo?=
 =?utf-8?B?TU55ZXNQTU81dFdXdlVKeHdyRFNnMldtQkRXMHRVL05LVWlqQS9ZSkhXSHl6?=
 =?utf-8?B?QUVPR3dPZmVqUGlheTdsTHA3S0pCd2hTbVU2VnR6VVYzejgrTEhRWW05T0dJ?=
 =?utf-8?B?ZDdHYkpoK2QvRk1vY2lpUEhvOVZzaG5UakFleUhOWU9jcTVqLzI3NU9aR1Jp?=
 =?utf-8?B?SUVOUldpY0dTVldEQXNJODNZSWZSTnJiVGRLbWZ1dFBxNElyVXIxR0hOQUNZ?=
 =?utf-8?B?QWRsKzAzYTNVL2dnYzJrVksxS0tWamVORVdKVGFNbk8rNit5ZFBWRlV0bVhN?=
 =?utf-8?B?N092bkpNOGVwLy9VaFJQQTV1Yy9vY044dkx5UkNjTlpRTGtWUHVvQ3g3RjlK?=
 =?utf-8?B?b29LRklUbTQ5MFovTWozMGlmaXhQWk1NeUZ4UHZxSWZkMDQ4azVJS1M0Qkly?=
 =?utf-8?B?RDVxMm41MHhkRTFzQ2pka1pEdGY1UjZ0TmFobENVZ0g3S1Ardy9RUjFINGZ0?=
 =?utf-8?B?eW9sRVZFdWR3Y0kxTVhtWWJLdnFLby9hT0QvQzd5SVhWLytsbmFyMSsvektQ?=
 =?utf-8?B?VFBLejhEZmlTMWMvMW1EUWQ4TE95TW1nTEl6eldlTUQ3TFIwd0hwaDB5K3hz?=
 =?utf-8?B?ZGIzTjRHUmZhL0pKakt0Z0F3YmV0TEJ3dXQ0b2d3KzNDbExIbzVvUGg5cURO?=
 =?utf-8?B?SGlQK2h1V21yUlEwckhnUWNuT2pVcDVyRGlxRzgrNUZFRjJVdG45RERMVWgx?=
 =?utf-8?B?aXJETVltdFd4WlJBaWlhZWRpTnlLenl2V1FTKzcyZlRNYkFSV2U1ZnN3RDJZ?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f7e26c-30fb-4e4f-23b9-08dd679fbd3d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:09:52.9937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXiyvWT3hufNEGwzikadGM+8V2nDqa6pf3AbN1ef7fouTkKDyeO4I3RTpjNqniGsIkE2uTj8RjiGuaNu4d4gAGEYfo4kBXMUvGunt0UVJIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
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

When the resource representing VF MMIO BAR reservation is created, its
size is always large enough to accommodate the BAR of all SR-IOV Virtual
Functions that can potentially be created (total VFs). If for whatever
reason it's not possible to accommodate all VFs - the resource is not
assigned and no VFs can be created.

The following patch will allow VF BAR size to be modified by drivers at
a later point in time, which means that the check for resource
assignment is no longer sufficient.

Add an additional check that verifies that VF BAR for all enabled VFs
fits within the underlying reservation resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index cbf335725d4fb..861273ad9a580 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -646,8 +646,13 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		resource_size_t vf_bar_sz =
+			pci_iov_resource_size(dev,
+					      pci_resource_num_from_vf_bar(i));
 		bars |= (1 << pci_resource_num_from_vf_bar(i));
 		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
+		if (vf_bar_sz * nr_virtfn > resource_size(res))
+			continue;
 		if (res->parent)
 			nres++;
 	}
-- 
2.49.0

