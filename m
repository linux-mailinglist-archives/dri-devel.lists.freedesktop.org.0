Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF9EC22468
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECB110EA7A;
	Thu, 30 Oct 2025 20:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIwsXb9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBA910EA7F;
 Thu, 30 Oct 2025 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856427; x=1793392427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BLqKdgOAL2ZTA1uDazSJn7CALa6C4M+kdCGIDlkl7vM=;
 b=GIwsXb9Su7/0vaTLgnywjAD0j0Ay83lhFaI6yHxKlgwzlrcS4z77C7h5
 WuvAEInGwFtcBIpdRl8xql+ooEfDrN2d4Ss8quh2TpX4d9nFJnvDsq0VA
 s2ueut6fLDCl7aoTRBqXnNATb5EYknn2/Kvv83jeRP02v5zEsAPVH8kHP
 nw5SsFO/jnmgieB5U7CyJRYrkeds6/I+dfIDMSPQT4GiCcbIS5TOgHASp
 ZTJIIv7iysfO2F/I4hMy56zGighkTqbfRzuqK3b/8K3elx7r8JrsIlez+
 oBQniPmckmqvL8xnETL5ehXuqOnzzPNsDfuQRBZjcOlZ7QhJJCLkxYBYj w==;
X-CSE-ConnectionGUID: Fk5m49hTSQyiayp7YM5hJQ==
X-CSE-MsgGUID: QJk/uoHsRtS1DWhn2+zD6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67664344"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67664344"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:47 -0700
X-CSE-ConnectionGUID: SKOnXsAQQHiaFFjs58jcsA==
X-CSE-MsgGUID: LI88G83CR8Kmm21EXGwhdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262738"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:46 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cickK8EQrOujTLdZ2mys+0SkpS2ITJxVfg4or1Pnw+WV2XMFRp8Nk/gmgK/cTvgr4/2hfm0fOyaA7JR/mdGpUXGCgLOfItKI8OKzs6wC29G1rywD/QiR6zcRW+yu+JMOX+PEshKnrlNp0R99aNfHJKIfPAUhgO7VPpgqfoZxkxOhCGF9J7Z5xrxXVObGaaK1HDEODfoV5w7lA86ekjWmpiBE2ee+gtCFMVbq949yxnIt+y4K6rBNcOgiQd4NSHE/OyKvwqV6ee/Wfbf9Ye1LB238f9I8A4ZiV7Tr3IumBushgY/K36YKxadF1EltDoL60vKzkgqWagE4IlvjhBTHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5zNwf3ZJFBAtb9Qs01GxKs0hrgNwFEFzvjyOcUJsUc=;
 b=l7MLpDxda3ePNiulungy1zLixmQt26JJ3OOAVQv1a4H/9sR6XatABHnancdVjTziYd0j/yhfKtFafSUHEnGA4A92iqg1G/6qFPkY2sTcQNcwwElxbxKb+qhMhJ/Ug41eIXjk/EM/m7aVk9Ht1BPn41cMLzqS01GmDfW7psAYeAMT0ixtAr8ramEiW6iiCFHlRwcJtDEg9XvCyLokPhYhaIW+EmkkOaHW1xcAg5fFTHbtXxShVLJhSzFarjK+us8wKb9bRIaxDeVSjDDplv6qaOelZKvCSvMAUNa6BX97ayt7U/6vWI636FcYE+IrfBRFEo4glR5FPe5B8Sqz0sBnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:44 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:44 +0000
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
Subject: [PATCH v3 22/28] drm/xe/pf: Handle VRAM migration data as part of PF
 control
Date: Thu, 30 Oct 2025 21:31:29 +0100
Message-ID: <20251030203135.337696-23-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: a021d9de-9c56-4bd0-3231-08de17f39efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bExCM1hKekNrL2R0K1FpQVZONEswbGRUNSttSnBBbFBLeW01YXVkZ1l1SldZ?=
 =?utf-8?B?K05ib2c1bnJYK3NHaEpWQ2FudzRjT0pIN0VqM21QNGVGelB3UjQrd3JyLzV2?=
 =?utf-8?B?N1FSSEpoUTN1dGNaT0hSY1J5TmJyMUxhQ0JYTjBKNW84ZGVHeGxzcmlaYU5K?=
 =?utf-8?B?UGxZZGJpdUwrcXBXRGF0UFBMQjZITXJzdTA3em9WMlZmQis3NmNCOEtya3JH?=
 =?utf-8?B?TmpZaDhxM3lwZ3dqK3VUQi9UOWJBQUNxNGNleXZTd3J6aU9UdmJ3QzcvQWVj?=
 =?utf-8?B?SW1MN3VPRzI1L0RYOTQya2dwRFpUa282T1FKM3dHamJLUmJVbFhuUWJGUlk4?=
 =?utf-8?B?MW5vZllQMmtsWmR3ZWFiUTF0SFZKYmloMmVoZGtUbWdhemFrOFE4UlRaaUw2?=
 =?utf-8?B?UnQyRXFBQndYc0lVQzI1ckZmUHVpUVFMaGJUQkx6c1FSZ1dWS3Q4VlZmekU3?=
 =?utf-8?B?cGdIbDJuNmVOVkJlYzRWUVJJakJ3S1locWRCRHFaZStWR3JLQkRsdFd3SlFS?=
 =?utf-8?B?RWd4OWU5RHdwYWZheHVjT2tiZ3ZMZVFGditHMDE5UktOcVhESlVkZjZldlNM?=
 =?utf-8?B?M210TXdUMmsvV2E5MGwzZFlOUUVXQXNxSys1bS8yd1J3bVRBSldCSUR2NHox?=
 =?utf-8?B?N1ZhbjZRWkNWQlc3aXVsWDJTTzhXUVVHOXlrcnQra2ZwUE1ScWtRajhwR0tq?=
 =?utf-8?B?RVczaWF6dUJOY1Fsck9ybTZQM1pCMkVsQ1MySnV0VXkweXNDbGtRR1RMN0w4?=
 =?utf-8?B?UG9qNEEyRklMUkg1SHE1dVRQRWJDcEhRcHNpMTdFY0Z4VDFGN0JWVFNXdmpI?=
 =?utf-8?B?elF5SHlVUHJDc2l6aDEzQ3Z6K3JHZmgxdWhMcmtVaHNUbkN1ZG9QNUF1Sm5M?=
 =?utf-8?B?VnY1bTlnd1FmRG9jSDRueXlWOGljZDZZY09KdkRudEZSMWRCa1F0VGQzeWV6?=
 =?utf-8?B?clF3ck8vclZZbGYza3VwUFZMUmpEcmM5Si9GeDZwUzZaZGViTUhiOWRLdVhL?=
 =?utf-8?B?S25nMkhCQVRvb3JGcnhySWRZdWJaWXZsRDJHYWdRamRGTkhHWlVRQWo5eVRB?=
 =?utf-8?B?Q1I5U1QrZUtDWUZUbGFxMzVCSkhpSzVheHQzR3BVcWFhR3ZGUEtxbjJUSERt?=
 =?utf-8?B?LzFmaVhoSm9OMXJjbitBdFFoUGlhOXZHakhuTnI5RVpVckFtcXhmMTF0QlVv?=
 =?utf-8?B?cExvNWRrZzNXeSt0VDhyUGNxbWtPdEwyS3V2MHpoZjQ2bUZnOTNnU3JHUGtl?=
 =?utf-8?B?WGN2WlhsaXl4Kyt5VmFyK3ZPQ0hwYmZwamZMTFA3eFNtNVBJVTBhMktuRHdD?=
 =?utf-8?B?K0cvbk02SGVwMVJOODBBd1E5VmtucWpoQVpLUkxqbHVtcWdYR1ZSM0ZRWUhJ?=
 =?utf-8?B?SzRYVVllQVRkT1JSYkFsakVkZnpVWWpUVml5RFdGbldTU0xwMDVvT2pWVlJs?=
 =?utf-8?B?aTZaaFVsQ0tXLzhGYWxRRURVZDNFdCtudGJYOXFYR2VxdVJGMWZ3Q3ZxQk80?=
 =?utf-8?B?WWF4ckJGMkNwU25FYVp2Mm5sc3VZcFJTanE3YW1sK1dLcXNobUpCd2FTVWxK?=
 =?utf-8?B?ZnA1Z1B3cC9Ub24xTW03NWV1TnhhTXY5NGdOVmdhKzMxMzdBWmc2SDdVbDFq?=
 =?utf-8?B?emllcit5c2RhNU82TkxFWEp4TGNlbjNUcG41eXgwb1dkV0RNVDdWTTNYait1?=
 =?utf-8?B?TEh0bVNnT2JFWk1sa3hkYjdrQkdIclVpdnJNWklSZGZKTjcxUGd5MHlxVCtR?=
 =?utf-8?B?RUQ5YmhadFpoQ25xSXNFcHpldEUwNjZGajRYYXcrTVNqd3JsaDRTaG5NbFl3?=
 =?utf-8?B?eHprWjZ1MjRNM25jdDhZanRQV2l3ZmF2RW9zTHlUN1EyYS9YY25aMG5mOXlF?=
 =?utf-8?B?YzhFM09tOUEvWUdRUVpTSSs1eXIxM3haOUQvTFZKelJYV3pLSmFwNWJWOFFK?=
 =?utf-8?B?NjBtc0t3Y2hIKzBsakMya2g2RG02QSt1MEx0N0lkYlhqdEVrQkcybFBBOWVi?=
 =?utf-8?Q?5Ui9JMDtiflugV7w/tiv0m4xwsofC8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0gxYXRsNFVTcWc2MjMwWURPeFhjR3Q0MmorZzRpRnlMcm00dDh1QUZwVU12?=
 =?utf-8?B?VEtnZG9uNEVqOUFCQktLdUZaai9XZkp4dnNiWTF3Zk1KSWs2Y1IyT1gyTTRB?=
 =?utf-8?B?NW92ejBnM09lRFRWTDdwNWhxUmFaL1NGeFlRRU9YR3YwaFN4bWUwSlJNNy9p?=
 =?utf-8?B?cVorZkVxYXpSMjQrRDI2WFRVMTVCK0s2aldsMlZ4Wll1bExNanhtNCtxOFdl?=
 =?utf-8?B?REtySlJXdElYaG1LeGlmVUU0b09kU3luV3dtWWdQVU9GeWVtMjdrUm5QZ2RB?=
 =?utf-8?B?Tm04Y3JLZ001MjBINlpKa2poUE5uMThRd2c3S2hLZ0RaN25MMklmbXltcWFM?=
 =?utf-8?B?NkJ4OHZzQTlBdkZWd1dEUHlDeThuS1B6U2o2d1lzamRKbk9qdUV4OElXdjZP?=
 =?utf-8?B?U1hWLzdWSk5VMFk5dkg3MWI2SnRzODNDcmIydHRHMFhmb2FEUnNOYmlSYmRs?=
 =?utf-8?B?Zllmc0F3YWRweDA5N3YvVnB0aUVDTE9UWm1MTVBJTU5UNjZLNzFJN05id0dh?=
 =?utf-8?B?QjJ3ZTBUb1l1eC9sc3ZER0pIcXJSMEh2V0RweW9RT2RWU3RGNjhLSU11SGxC?=
 =?utf-8?B?TnVLME1rbmZnNmsvM3N5czYwWUhaWThSSVkwNkhvNURqUVNYbVRuNTV3azVr?=
 =?utf-8?B?cVJmZm1VdjNQUHp2dFhOWHFjaG5rbUVkNDNKSTJPSVJIQ1FKa2NKVm9RcGFE?=
 =?utf-8?B?MjNCNGIwSDNmOUxLTDlBc2FmU2R5aFVOeFB0NXh5dU01SGVuTDZobXBkQVJE?=
 =?utf-8?B?dFBtUzF5bkFUdnBnVXJJZmI2TDMwcWdxc3h6UnZkamIyUjBaMWRGTTNYSkhm?=
 =?utf-8?B?NEo0ZkVLUnVBRHRPTGRjSlYwUmh0REZQVTVRMkFZaFZEbHVJeGl4c1RsMHBy?=
 =?utf-8?B?NlREeDF6MjlZU1BydmdsaU9xMDZDSm5wZ2IveGs2WXpQZWtUWkQ2N2hCT3dJ?=
 =?utf-8?B?aFNaVWFrcitGYmJ6UjMyaEhwaDJGaEUrV1RadXhMVDlIMGhtZFAxaU9paFBT?=
 =?utf-8?B?cXJtN0JoYmNOWkEzN3p0eWVwTEwzRzRoL1pZekVNN09nSFFoRmVRUzhLcnFT?=
 =?utf-8?B?Vk5RUDlEZ0dFcnAzYXRYM3VHTFBSNTZWUFB1T1hHODJ0NEp1c3NWb3drOVlF?=
 =?utf-8?B?ZU9YNlg1MUFlbWNmZnE0V09iRGlidzdRZE1TSWNKaUdNQ00rMTJVL3hHUllZ?=
 =?utf-8?B?NGloQi8vRGFTWFZYUnJWdXplWWlMdXlpbDJRRzlpMVJTRGlVajM1YVYwQ0lr?=
 =?utf-8?B?ZFFnbG5Pd1htMEZtRDlNSm5yRzg0MXdHdjZ5VWhISUJvdU9Ea0x2K3RvdlNl?=
 =?utf-8?B?R0N6V3hNNnpla0RQdnh3eithMHBDS1pvZ1YrSW1Bb04yQzB0Wlh2NFVWUzRx?=
 =?utf-8?B?WUN6aUM2N0dpb0FRTnlIWlFoaEhXcjNzY05pbWF2VjRVU3crb2FubDBHeDJK?=
 =?utf-8?B?bnN5UHo1aHR3Q0xSUTNZdElDK09sRGRDOE5SN21MaERpRGZwNm4zZjFLZjZN?=
 =?utf-8?B?RzRsNzgwQ0ZVaWZzWm9jclZkczIySG9GVmRVbjNRajV3UUtXaUlLem9TakpN?=
 =?utf-8?B?aHZWUHkzSTlxUHJBbHR2MmFtblJmOSs3OWRGRkpESERjdFdoNEVtMlNUME5M?=
 =?utf-8?B?aVpwVEtrclZwT0xWU3ZVQTdMdWtaTjJQMk1BM2pQNG1NOGV2b2RGT0w2Sk51?=
 =?utf-8?B?bEdlRDlYVVJHRyt2eXVObUFDWGJGbWx6Z2J2NVFjeW5XSURldjNIVk9YWWh2?=
 =?utf-8?B?SytTNUtGbnJpVjlZMnc5bHJ6MDVIRytVVHB6UE5xcEh2Qjhab1hyTmhNcTJU?=
 =?utf-8?B?R1JueklWS0xQaU9kQ3BmNlVxV2djZERiMWJyS3ZTQi9BbDQxNXIwdkh5dEd2?=
 =?utf-8?B?b3NlazlHU21hS25ickZ4SzRiOVgwSXo5VWJld2t4MjBaWEswMGMwbmxjLzh3?=
 =?utf-8?B?ZUZXd2VwSjhRQ2RUblhMNmtaWnliL3BPWUdvYkFOcHFjZmZJWFFVcXhXTzhw?=
 =?utf-8?B?aGV4YVZnMzVSUFo4bkdVN1ZKQTNCN051R0lDVWJ1Z2tMUmhpZTA5RklpWkdi?=
 =?utf-8?B?UTk2VDRsK3J2RWVGR1NCQ1VLNVorNnQyZ0h1UDg0ek84MTUyY0JWMnBtaXYx?=
 =?utf-8?B?R2oxOGFKcHBlZTZxVFVkalNKVlNQOVIweVdzRFhEWGxwMEROTTJxK0MxUXNX?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a021d9de-9c56-4bd0-3231-08de17f39efd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:44.6778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wEVIoO0B4WjijU7xoREnT9R/2bhtU6UqUnKdQi5weS3rPKIROVCDb0glTstwbigRyIAzoE8sp+f5xeZ/KgZE1TvkW6RW9peDQhUaXlPVpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

Connect the helpers to allow save and restore of VRAM migration data in
stop_copy / resume device state.

Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  15 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 213 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   5 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   2 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   3 +
 5 files changed, 238 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 7cd7cae950bc7..de0f63610e780 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -880,6 +880,18 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_VRAM)) {
+		ret = xe_gt_sriov_pf_migration_vram_save(gt, vfid);
+		if (ret == -EAGAIN)
+			return -EAGAIN;
+		else if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_VRAM);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1095,6 +1107,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
+	case XE_SRIOV_MIGRATION_DATA_TYPE_VRAM:
+		ret = xe_gt_sriov_pf_migration_vram_restore(gt, vfid, data);
+		break;
 	default:
 		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 5e90aeafeeb41..7ccd43545fdac 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -19,6 +19,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
+#include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_migration_data.h"
@@ -505,6 +506,207 @@ int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
 }
 
+static ssize_t pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!xe_gt_is_main_type(gt))
+		return 0;
+
+	return xe_gt_sriov_pf_config_get_lmem(gt, vfid);
+}
+
+static struct dma_fence *__pf_save_restore_vram(struct xe_gt *gt, unsigned int vfid,
+						struct xe_bo *vram, u64 vram_offset,
+						struct xe_bo *sysmem, u64 sysmem_offset,
+						size_t size, bool save)
+{
+	struct dma_fence *ret = NULL;
+	struct drm_exec exec;
+	int err;
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = drm_exec_lock_obj(&exec, &vram->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+
+		err = drm_exec_lock_obj(&exec, &sysmem->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+	}
+
+	ret = xe_migrate_vram_copy_chunk(vram, vram_offset, sysmem, sysmem_offset, size,
+					 save ? XE_MIGRATE_COPY_TO_SRAM : XE_MIGRATE_COPY_TO_VRAM);
+
+err:
+	drm_exec_fini(&exec);
+
+	return ret;
+}
+
+#define PF_VRAM_SAVE_RESTORE_TIMEOUT (5 * HZ)
+static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
+			      struct xe_bo *src_vram, u64 src_vram_offset,
+			      size_t size)
+{
+	struct xe_sriov_migration_data *data;
+	struct dma_fence *fence;
+	int ret;
+
+	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
+					   XE_SRIOV_MIGRATION_DATA_TYPE_VRAM,
+					   src_vram_offset, size);
+	if (ret)
+		goto fail;
+
+	fence = __pf_save_restore_vram(gt, vfid,
+				       src_vram, src_vram_offset,
+				       data->bo, 0, size, true);
+
+	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto fail;
+	}
+
+	xe_gt_sriov_dbg_verbose(gt, "VF%u VRAM data save (%zu bytes)\n", vfid, size);
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_migration_data_free(data);
+	return ret;
+}
+
+#define VF_VRAM_STATE_CHUNK_MAX_SIZE SZ_512M
+static int pf_save_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	loff_t *offset = &migration->save.vram_offset;
+	struct xe_bo *vram;
+	size_t vram_size, chunk_size;
+	int ret;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	vram_size = xe_bo_size(vram);
+
+	xe_gt_assert(gt, *offset < vram_size);
+
+	chunk_size = min(vram_size - *offset, VF_VRAM_STATE_CHUNK_MAX_SIZE);
+
+	ret = pf_save_vram_chunk(gt, vfid, vram, *offset, chunk_size);
+	if (ret)
+		goto fail;
+
+	*offset += chunk_size;
+
+	xe_bo_put(vram);
+
+	if (*offset < vram_size)
+		return -EAGAIN;
+
+	return 0;
+
+fail:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Failed to save VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_migration_data *data)
+{
+	u64 end = data->hdr.offset + data->hdr.size;
+	struct dma_fence *fence;
+	struct xe_bo *vram;
+	size_t size;
+	int ret = 0;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	size = xe_bo_size(vram);
+
+	if (end > size || end < data->hdr.size) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	xe_gt_sriov_dbg_verbose(gt, "VF%u VRAM data restore (%llu bytes)\n", vfid, data->size);
+	pf_dump_mig_data(gt, vfid, data);
+
+	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
+				       data->bo, 0, data->hdr.size, false);
+	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto err;
+	}
+
+	return 0;
+err:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Failed to restore VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_save() - Save VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_vram_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_restore() - Restore VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_vram_mig_data(gt, vfid, data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
  * @gt: the &xe_gt
@@ -544,6 +746,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = pf_migration_vram_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -602,6 +811,7 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
 
 	migration->save.data_remaining = 0;
+	migration->save.vram_offset = 0;
 
 	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
 	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GUC, &migration->save.data_remaining);
@@ -611,6 +821,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
 	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_MMIO, &migration->save.data_remaining);
+
+	if (pf_migration_vram_size(gt, vfid) > 0)
+		set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_VRAM, &migration->save.data_remaining);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index b0eec94fea3a6..85b43b2cceb73 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -25,6 +25,11 @@ int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_migration_data *data);
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data);
+
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 9f24878690d9c..f50c64241e9c0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -20,6 +20,8 @@ struct xe_gt_sriov_migration_data {
 	struct {
 		/** @save.data_remaining: bitmap of migration types that need to be saved */
 		unsigned long data_remaining;
+		/** @save.vram_offset: last saved offset within VRAM, used for chunked VRAM save */
+		loff_t vram_offset;
 	} save;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index c2768848daba1..aac8ecb861545 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_printk.h"
@@ -171,6 +172,8 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
 		return ret;
 
 	for_each_gt(gt, xe, id) {
+		xe_gt_sriov_pf_migration_save_init(gt, vfid);
+
 		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
 		if (ret)
 			return ret;
-- 
2.50.1

