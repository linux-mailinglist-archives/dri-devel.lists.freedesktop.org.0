Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377AEC363F9
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8673810E78F;
	Wed,  5 Nov 2025 15:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WE9h3uLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F8610E789;
 Wed,  5 Nov 2025 15:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355530; x=1793891530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OlYlqPD0mUhzaT4tUvpyPRCg6EOAvn3rRBvU6YMlGEo=;
 b=WE9h3uLqCaMXIGABnGutSSey9K1dmk3kxqVqtej99diUUOlUPn7WBo+n
 b55klHqt2u499Hyb7iYaDcJcCEPMPctVxzmfR0Ve0bhjHiFhQTnENTTK6
 y/YTBO5gRaxcbewVAfBp7vuPIdwdqYIFurbbMtJZgGNNgwFFNjiyTH+BQ
 jubkIv4wHGnTUEAJLoUaZanJ0AtffNAOK8Fm1n+LsB2blFirJ98Oo8l2a
 QBcwVQ61xTpX4odnaRRB6I7nrxBXfTLD4MQHYVAv+b6VIJVjAYOxH4Er7
 CsB5jKX5VmhZfXCyvaQ35aU09DKC0120hNS32ujWrlHZV7kWMTy9Ibir2 A==;
X-CSE-ConnectionGUID: DA25jSMUT+y/iT/jEhyxKg==
X-CSE-MsgGUID: Gp/x68yjS9+/JatxFHy+cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64387024"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64387024"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:10 -0800
X-CSE-ConnectionGUID: zwd27CNrSyOy2O1lJQVNTg==
X-CSE-MsgGUID: vFViHSESRGuviVOODJ/RfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="186766488"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:12:09 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DI7feAIzUGhpXVtyG7r8J0IMuzBDqeYyphsuTV3cLkr+hgIaZyyU3Wz1bO9Rdi5hfXFVdqT+BNFGa1fPXi42NWRMgxWEZMsPY16ghd9H01z42r/JzPEb9w6aiLOth9eBzWonk+gYcXVAu6rhYVFowow2RbdlJrYjpfK8F9rPz6emCylnliAS0OgVMeV1oC+jNV7kvn1P+VgFDxODehPswHxK/zzy04PGyy+VHmI4WuDIwcnxCMOpgSOT4xf3YTjxtSVYeaxAkcWjj0TzJz6KIUQcyhovcgsHHJ4nom8XUTvozF9czCHpfOswlISGrauWZPeMWXEhmo6bOOlVYCK3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wP+1200fYH5KSHhDAa6WMAPP/fXaHBKYPBF4fDEVFBM=;
 b=cre2UB0AxTq3wCrwd1c9Z1m1E29LH8OEwJfcYr2eYCr2bXI3Nrqi8lIpzljHl9L0OwXGBT+ADfRAntFh03E4TxBji9PHBiwlMzqVa5w9PBbPLg1szUw/2+v6UQ26p/UAQ+Yp37Jxy9EPWtLY8Yts0GMJJrYxJcxYWUDW+Dfq07p2sF/uovmc26oi5tGvAkTG676czkvV8SDEQnw60egtdANGTM6SoF1QizRj+l2ynbF0/C67C8nTa7NwLMhtesg7Z95llkJQDYyraRc8dIMRCyW7a15gJ3eHWMzSsPQoaUfJjZnmxC2ZbwSsFeiEFCYk0hp+5EYrhQk8Rm9niPtglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.9; Wed, 5 Nov 2025 15:12:06 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:12:06 +0000
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
Subject: [PATCH v4 16/28] drm/xe/pf: Handle GuC migration data as part of PF
 control
Date: Wed, 5 Nov 2025 16:10:14 +0100
Message-ID: <20251105151027.540712-17-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c7f371-c717-4421-824f-08de1c7daed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXFEOXo3V0ZOakNjdTJFOWZGUm9maklXZFMvZFMyTHNDaFRTU1Z6djFqY3lh?=
 =?utf-8?B?Z3JzbUhlNDgra00xaXV4WnFiQ3pCdWcveTBRQmRocHpsUEE0ckxqMHMxWExt?=
 =?utf-8?B?WU5LaWJSc0d3NGFIcDk2di81NkR5Z3UySy8xTmJQT28xRUhxVmtON3ZCR3dP?=
 =?utf-8?B?dkxFSFdZa2szeXRsOUxuV0haK1BOTmtJSEJPU0JQVnpCMEgyTFN2ZXpHTkJP?=
 =?utf-8?B?RG9PUkFoUElqOEVZeEZsaGZ0N0pnb0VzM3ljQ3MvbTBjZFFlbXRqR0E5R01h?=
 =?utf-8?B?SFRSM3FIbEdKaWg2MUZlRGdpN0tyMGNCekdadnRqTFkzU3JNS3BDakYyS0dC?=
 =?utf-8?B?Q01ZandLcGZQNk1rYWU0MEt4cll1Q01XZlZrR2pKR1ozdmR6dkp6bytOVW5S?=
 =?utf-8?B?TncwMWVscHUwdU9jaFR4cGRrVEk5OGtIcHhzdWszVmFXUDlKMzFqWUJkTmd0?=
 =?utf-8?B?citpMmFVLzhoSS9mb2pkeU9JaTdRaHJGcitUK1pycjhObHRVcnNZdjlHQ2JG?=
 =?utf-8?B?VHREYzIvUDhqQ21oRU1SZUhRa0R3Q05JVVhxRWNiQTUyK1BZM1FCd3JFNEFr?=
 =?utf-8?B?Q2cwYjUxM0xva2tNWEpvZ3FCcTVsLzl0bWRxOHFkandSNk5vamtpNUNZRkt1?=
 =?utf-8?B?UGdFUkJWQWI0R0NFUzNRWTJPQStIaG1HYklLSzh5bkVqNXhTSzZLaUxHaXBE?=
 =?utf-8?B?MFNGbURHZEhSKzg0NEs1c2ZHaDliQW41bmlHMldxem5NajNvQU5EY2ZRQjAz?=
 =?utf-8?B?TnB5cmVKc1FsUGtVVFRycGxVNHZka2UvdytkRi9KL2dlVmZWYnpEVWJQcnkw?=
 =?utf-8?B?VlZJUjBFeWc3MHVpc1hGK1dYMlFLTzNVZzRkWGIvSS9qRU11cUxIUzAyb2Zv?=
 =?utf-8?B?R0pvck5HMXhEUTJTRVBxaDZRM2phZnBqVEYvb09aQTdaOWVhNW93dGthU1gv?=
 =?utf-8?B?OGYwQXJ2R2lWTEs1eTBtampPdjVURC9pUHF3ZE9ZSzZaMU8zTkI0bzI0WkNZ?=
 =?utf-8?B?TkxKNE5ydUFITTFzdXc3blZ4dm5qeUpDU0VFSy9ZSHhTL0tWRTg0TkJYYU9J?=
 =?utf-8?B?QjVGM3gxbWNCVjZKc3RNSU9EOEtSbjM5OUh3RUVraFFQUVZ5NnF0ejFRVWtG?=
 =?utf-8?B?SStEVW0yVnE4eDVXc2c5ZlJkMjh4cTdkbnlmWUhJZmRDTzdrN3pyQUQ3TVhV?=
 =?utf-8?B?RGoyZGE3czlObWdEOElreFhZUzZKSnFFTlZEUVU3bDJNc2sra0tIVDFGNjlT?=
 =?utf-8?B?bGtUQ3dqbDNTVGcyZXRHK1NtM1M3K3lRYk1rNnBlaDRQd0xhMXhPbncwTjJy?=
 =?utf-8?B?WnRCU1pWRWJIbzBsd3VaRmtRRC9pMGNVNTlGUURSYnRqTVk2VEZ5ZityMWg3?=
 =?utf-8?B?bEVLb0lrRFA2enZqTFJ2dkNLeGFlOTd3N0pHN205d1NQazJ1b3JFd25IVVJX?=
 =?utf-8?B?K0szbmpNb1pvb0Z5Uk9GcVhVQWViWGRWR0VmRitMVnFNTjQ2WUxDZ2t6cnho?=
 =?utf-8?B?RmJDbi9jajJUN0VDQ2Y0RS91OG5ldGh5cEVlZW96WEpKenp0UTV0UmJPcTM2?=
 =?utf-8?B?SkJUNzFBSUtYYStocmczVGxSQy9DOFBRaXR4WU01T0UycWV4UUVVblVQZU4w?=
 =?utf-8?B?RFdOeG5nQ3p5Y3FIRTNweUVyQXBmbHpibHkvdDZuaXRzdk5uWVlWR0FtZElh?=
 =?utf-8?B?NjQraXZZZEhXQTFxL2RUQS9DR3I3Q3Mra3hqeGI4UTRseGdXS2pkTE93bThj?=
 =?utf-8?B?SE92UkUwTXVXODQ3TU5ST0EzaW8xdW9uWU4rTGIya1NMeXlHcVRqdlBGK3My?=
 =?utf-8?B?V3Q2dE51R2hNaklPekp5Wmo5MTZJRWFaekZkZCtZTjZXSm1ySFRybmhvV2p1?=
 =?utf-8?B?RjRNeEh2WXlVNU43MjN4eUFGUitwbUNzL3Z2eTFjdmtKNHFxZ3I3ZVRCY3pk?=
 =?utf-8?B?MWp5eERoYmpraEZDeDJPaDFrOGxNbXZ0cEM3RHFsa0Z6QWIxeWRvazQ4WlYr?=
 =?utf-8?Q?iRGnyQz5/0yrcOY8UL7eNdaQHdG1u8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U09JdGgrcldFN1BnNEVrK2JzWGZMTGJ3blJOT3hHcWN1bTVrbFVtdEcxUStm?=
 =?utf-8?B?bEpENldvUWtmbGZwWXl2K0VzakxubmlueVFlRmJ5N1JSSUFvQ2FGTGN5NGcv?=
 =?utf-8?B?QVBWRDF4N0IrN3VYSktZV2g3VG9mSmFCWlFyMjB2Y0pzbTlJREpZSTg3TzNX?=
 =?utf-8?B?d3dFcWMvN21TNDRUYURZdGhsdlJaM3NnVjF5M3ZkcVorWVU1SndXaWZXWkVy?=
 =?utf-8?B?dGowL3FZMlZUbllIZVVFc0xHd2JFYURmWFhnZEYwZHExWGRud2V4Z1E0ODdF?=
 =?utf-8?B?SXArOE9XbGdHNFcvdVNHKys5Q1Z6MEkwS3o2dDhrSm9HdTc5NG1GMG9OLzg0?=
 =?utf-8?B?WGZZL21OWnVrNmQ2ZDVsM29Ba0loc0JhL1NtN2tldGZpTU9pSE12TTV3SEQr?=
 =?utf-8?B?L0xNMGRFZHBuR3lEc2V5UCtCYjJEK3FyN2VjdlVKMUZObXBzK3N2Y2JzdUx4?=
 =?utf-8?B?SzVxbTNnTjVaL1hpMEFncUVaelgrWXNEZld1bExVWlVUYldqRE1zNDRVbE5N?=
 =?utf-8?B?U0pBRDQxb1lIVVJuVEVMZ0w2QzVETXVLc2FrNW5Vc3pTTCsvTFBUTG5vVElW?=
 =?utf-8?B?eXN3MkNSNHU4MGdySHhBalNmb1Zzb0ZabE0rWnE5TVFuT09KOVI5eTBwbWlE?=
 =?utf-8?B?UkgwL1BDbGpPWTBtejFOZlNVdjRmQ3VUS2pXUlVrWDZBNld1TFRkUW90UWxt?=
 =?utf-8?B?MXNWSVk0bFNXUGxEcE1KeXc4Z1JITXhGY3E0SDBPMi9QUTFqQnJTeERuOFRY?=
 =?utf-8?B?RFF3YmxWVGVyOG0zQkxXYzZ4ZVA5bis3N1UxSU9lN3RqWGFnUUxUYTFZSEJj?=
 =?utf-8?B?V2pINXR4RmcwUEhWN1NmWjFzdWxYOHNwWVlWUExiNmVBdXNiREtBd0RWemV3?=
 =?utf-8?B?U05tbEY4Vk1UQ2JKL1d5U254MnZ4R0s2WEZCMENHcnVKSXExZ2tKQXVtSkdI?=
 =?utf-8?B?c2tORUduVXA0RVV2b21QWk5UbHlUbUp5V2ZnUUloUTRleHBzWnZsYk5zeFNX?=
 =?utf-8?B?SE14cTFlOXpjS2F0bDhKbzJjRmZrdVhxMWtlb3BTNHhCU3ZvMVdNbEt1cWRt?=
 =?utf-8?B?d28zU2s4ckxIWlRHU0hSeXhHd2g0RW15M1V5ZjRZTjVnb25SeHNRRVJvbzJ0?=
 =?utf-8?B?RFhSMVlIYk4raUlUMTVRaXRqWnVDZjZLK21QbVRTNjI0a1JyK3ZxZmtXS3RD?=
 =?utf-8?B?UjZIRFB5K0NUblFYT0Yyb0hJNXJndWJIaFdJMUNIUmx5STN2MCtHTENkSnhK?=
 =?utf-8?B?WXlIa0FOVFZ4WjQxRzlLek8rYUs3RE9mVHlXd0JjdktyMVFBMWRyV2hkWEcw?=
 =?utf-8?B?ZVp4T2JtUVdaamw5Z1FpcVI3UTEzQkU2Q1ArUitVNCtkdnpIc1Jra0ZUL0sx?=
 =?utf-8?B?cUVIZlk3MHdLVmhEL3RMTWF1Z1ByVU43T1RPVWp2OTVzUjZ3VCtOZWlZOUNz?=
 =?utf-8?B?a0xZVUFjZjV5dnRwOTVUUVltVXdsR21nSGdlRWU5QVllbjkweHNyU2QvWFI0?=
 =?utf-8?B?TCtqZFJLWTJoTjNGUk1aaDBQK3NxQ1I5M3ZzS1hCUEIwWVBxREsvaDQ0SmFi?=
 =?utf-8?B?SUcxcWswV1JYZlIycXZwWVVPN1ZMTURLQk5vK3kxZlFpMks4OVpQVTB2cnNK?=
 =?utf-8?B?eWd0VnhTVXdQYkJmVXZ5cUpIRlJ4aE5SbjlpS1RjM0JMUFlmandqeWNkYWdP?=
 =?utf-8?B?d0RqSE5YQUlhcjF6WDhheXk3cStEVXFteGZrWUZRUWtFYTVRSEVyb3BwdGhL?=
 =?utf-8?B?cExKVlNVWFRSTzFMN2lRS1dhdERqYWdHTnNRT1hvbWpOSk1pRkp4R0Qra2Ir?=
 =?utf-8?B?UWwyR3ZYM3Erc3JkQ0ZGMWJldW94My9naHZVU2tzQ2dQUkRzNXJKdWk2N0xQ?=
 =?utf-8?B?Q0RldDJ2SG9ZcDNDOVVwVitJdnR6T0N0amJqdHZOUVNkanN1U1RGc0tUKzR0?=
 =?utf-8?B?Y3NPakxjQUZhUGdPemFoUUF2SEhndHNCNU0zMitncXRHbCs1UHY3TzBma1hS?=
 =?utf-8?B?eFlJMS9BZUR1c0tQSnlUeHViRmtBMUdIY20vSHpqWS9RbGhvVFUwQ2VsWlV0?=
 =?utf-8?B?U21EWmJGN2d4cmtwU0lpZ2FqOUltSnNTbUlMeXo0VXNMN2tNSnhnNzlJczFD?=
 =?utf-8?B?NEhHRkRUVEh1a2drRTB0SUhqZDhpVjFBMnFtUlQ0OExNUlRLNUhVcE1tSEhq?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c7f371-c717-4421-824f-08de1c7daed8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:12:06.8096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BU3Iz8oDJ3ng9kbePeMI6xAngyMq+iWV2Xciw707YB01KpVsgWEOb8l04Y6osetz8qpQgjCJph+Zii2dcdPjIhFudrykXbYjo03hz4T1LQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

Connect the helpers to allow save and restore of GuC migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 27 ++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 71 +++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  8 ++-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  5 ++
 4 files changed, 93 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 5e8b6929a827d..198bf0c93a4c8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -853,6 +853,20 @@ static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
 
 static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 {
+	int ret;
+
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_GUC)) {
+		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_GUC);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -891,6 +905,7 @@ static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
 static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_pf_migration_save_init(gt, vfid);
 		pf_enter_vf_wip(gt, vfid);
 		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_queue_vf(gt, vfid);
@@ -1078,12 +1093,20 @@ static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
 static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_sriov_packet *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
+	int ret = 0;
 
-	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
+	switch (data->type) {
+	case XE_SRIOV_PACKET_TYPE_GUC:
+		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
+		break;
+	default:
+		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
+		break;
+	}
 
 	xe_sriov_packet_free(data);
 
-	return 0;
+	return ret;
 }
 
 static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 6e2b076065f3b..676205e04487b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -176,23 +176,10 @@ static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
 	return ret;
 }
 
-/**
- * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
- * @gt: the &xe_gt
- * @vfid: the VF identifier
- *
- * This function is for PF only.
- *
- * Return: size in bytes or a negative error code on failure.
- */
-ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
+static ssize_t pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
 {
 	ssize_t size;
 
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid != PFID);
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
-
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
@@ -279,12 +266,19 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 {
 	ssize_t total = 0;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
 
-	/* Nothing to query yet - will be updated once per-GT migration data types are added */
+	size = pf_migration_guc_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -331,6 +325,53 @@ void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
 		xe_sriov_packet_free(data);
 }
 
+static void pf_migration_save_data_todo(struct xe_gt *gt, unsigned int vfid,
+					enum xe_sriov_packet_type type)
+{
+	set_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_init() - Initialize per-GT migration related data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ */
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+
+	migration->save.data_remaining = 0;
+
+	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
+	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GUC);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_data_pending() - Check if migration data type needs to be saved.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @type: the &xe_sriov_packet_type of data to be checked
+ *
+ * Return: true if the data needs saving, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_save_data_pending(struct xe_gt *gt, unsigned int vfid,
+						enum xe_sriov_packet_type type)
+{
+	return test_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_data_complete() - Complete migration data type save.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @type: the &xe_sriov_packet_type to be marked as completed.
+ */
+void xe_gt_sriov_pf_migration_save_data_complete(struct xe_gt *gt, unsigned int vfid,
+						 enum xe_sriov_packet_type type)
+{
+	clear_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
 /**
  * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index fd81942bfd7a2..1cba651b521fe 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -10,12 +10,12 @@
 
 struct xe_gt;
 struct xe_sriov_packet;
+enum xe_sriov_packet_type;
 
 /* TODO: get this information by querying GuC in the future */
 #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
-ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 					 struct xe_sriov_packet *data);
@@ -26,6 +26,12 @@ bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
 
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_migration_save_data_pending(struct xe_gt *gt, unsigned int vfid,
+						enum xe_sriov_packet_type type);
+void xe_gt_sriov_pf_migration_save_data_complete(struct xe_gt *gt, unsigned int vfid,
+						 enum xe_sriov_packet_type type);
+
 int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
 struct xe_sriov_packet *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 75d8b94cbbefb..9f24878690d9c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -16,6 +16,11 @@
 struct xe_gt_sriov_migration_data {
 	/** @ring: queue containing VF save / restore migration data */
 	struct ptr_ring ring;
+	/** @save: structure for currently processed save migration data */
+	struct {
+		/** @save.data_remaining: bitmap of migration types that need to be saved */
+		unsigned long data_remaining;
+	} save;
 };
 
 #endif
-- 
2.51.2

