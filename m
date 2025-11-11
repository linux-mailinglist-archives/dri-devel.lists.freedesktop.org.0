Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E077CC4A343
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4024010E4D1;
	Tue, 11 Nov 2025 01:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/9keVc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B93B10E4A4;
 Tue, 11 Nov 2025 01:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823198; x=1794359198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xrDqACs55GE84yhC3cTxkO+49b3d2eMUulfmyH/0AYE=;
 b=F/9keVc1aM6WgvnKUBR1rog9PdcAv3vBM+ORT4wXkLXw4QRRkXqfLQsq
 ru0Vq1Lqn3cQGmiIJD1XlSKMaJTTuUp+PRH2gM5MJTqWxItAkVOdqy1si
 GpNVbfdN+Od9Zg0L8LvhRP/7xpvruz3bbvZRAAUegcBuWDdSuII8jvuwo
 hygotUZg5BQCekaRo5WpgH/k1Ff+O+4SdggExT3wdoTn+NXXT2bKek9r0
 t3tGhmjW7PNkbAy8N0Poc5k7afERkRvsLOeuwx/6YhY1Kf5hIiNBQKU/W
 BYkmHI43EplFx6WUn59Q7ZWZKyLr5iMIV4/oVpD/QFl3QyGRzwoy4R22T w==;
X-CSE-ConnectionGUID: ArtYp/kLQuO7gRowz+oeZA==
X-CSE-MsgGUID: jglvuRH5RNiMG1qUuSoENg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75493463"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="75493463"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:38 -0800
X-CSE-ConnectionGUID: Kdby+serTEG0gIivwckleQ==
X-CSE-MsgGUID: /yylUDozT+KGgKFee/maRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188460404"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:37 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4TloATKDbDkHZk+HjgR8h/pqG51DoZ4sCY/7QtJbjJ3r9W0jCYgvy77N2L4Fb1kiMrnQifivOMU7nQ87ahzTU6DgjHRHRzVTIBRz1ll5lHoPvNLGGrHAgrSuwHI7SEwgVE+fFTCHaFTsh10OXM69XRmzYbnXIqJv0NRHZr3g5Gc+YCnowBk6Et3Gejy79lzDG/f5iIg2yxvEGi+tEYPQkGs44G/9GyqeHa1acHNNWLhRKPg4UGyXHiMjknbwRNnt59L/mtgweO+fn1AgPDKUrQ8tRniVvSFn9JsH63P2DR1bHYFlOxp5MVfkGYns23ErRaPTefYXv5uvZDMmYLxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8294im0xXfz1hbayPsQiXLJS+lPMDYkWyoQ7u3SaKY=;
 b=JQp+FNOBfM168ICyndOxkjl5vaLKNUq+oc+/fAf98WBKXdo0cxHFBPdO4/ag+YXeB67Qo/NxknJ9oSJcsbejg+HpoImyN0cdU+YC+N2ONKtJHW8PIdcNU82sJhUOxGOJX7Sorj1NLXgKhxOuHgNW9qKgEPKQOUjGgkA57wPh7F7GIisOuej7F1DPuzTHekyshQf0TI9SqzvLpzusdtkMs96UX45sVq7NsBxQwsk6Nq/sWiE7Eayr8xzq31rydoAyuDefUQy5Ocr4OqlB/sAI9lmYQuy5EX/7Z2dvJ+99seT7CNBZa6LK7JOncDbz5GryPfACfuRh5JEisEB0MPtbhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:06:35 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:35 +0000
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
Subject: [PATCH v5 21/28] drm/xe/migrate: Add function to copy of VRAM data in
 chunks
Date: Tue, 11 Nov 2025 02:04:32 +0100
Message-ID: <20251111010439.347045-22-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: e52e0189-87a4-4a8c-051b-08de20be8f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anVNclNoYzgrS29UWHQrbGdaYTd5MWN5NE5ybnJ3RWVpRmo4MktUdE5qNTR6?=
 =?utf-8?B?M25MbE1SMU5PbGJiL2ptL1RST2xUNDBmZVQ5dm8vRXVHUWVpZDY0enY0cldU?=
 =?utf-8?B?SlozUUUvekQ3azR4K1B5TGRISHB6TFowTXE5RzR1VENHNVA0aERhVFdhR3RT?=
 =?utf-8?B?TloyYThUdjVIQkZtYmNTWXNnU2lUanA0UHozVTFESVBSM2Y3akVZUlgreEdI?=
 =?utf-8?B?SExhTm5JK0gyK3ovaThyVVBXQUpocW1rRUxXWGxZUGNwMHVGc1IxL1RWY3R1?=
 =?utf-8?B?amVOZ29aSndHTE9sNlRhNFZjN1dYVlRaUm9BelF6NnpXZ2dIK1NPQzRUTVg5?=
 =?utf-8?B?MDNkN0JURklCTjNRbmFTb294WnpUT3lSZTkvaktjcmtkb01YajZWbm5mNDgr?=
 =?utf-8?B?OXdGaFBIZ2tBaksyeUE3Y0RFVkIzTGM3blNWaW9KZ3hBZTA3RGYzOEFBNjRz?=
 =?utf-8?B?NXhiOU56dU8vMDVtdHlsbzV1ZjBJS3R4c1NWbHBVMEdtVlJsMHh2R2RNVmd5?=
 =?utf-8?B?a1IraGs0VzYrN3cxSk5tZ1YzUStyZHRPcmpmK2kvMnNRcU43YkVra1E2Y0x5?=
 =?utf-8?B?NFIvZlVwcm9iWm9LQ2VRMzlWa1dSZlcvWkVYOHVkd3E0a010UTBXWnBIZzZi?=
 =?utf-8?B?MHFHUFRMSjVmNjJEaWU1c3BEUjBtZVhqMlJ2aGhlc1hNMEFiYjNNNEUzY2ZX?=
 =?utf-8?B?Q2N6NHFOWEh1OUJSTzdkRFNVVlQ5Y0tTYXNUSnNDR2JLQmJpRjdPTElxcWEv?=
 =?utf-8?B?cnUxdmhTTUZkZlIwSGNIVEFqWURWbTdvWjRNRFhtLzc0YVZDdFZuR3RRNjZO?=
 =?utf-8?B?b1R3WjNGQStnZXZ1YWV5QTc1QnhjWmtSQi9KVk91M2NKd0d1aE5ZUGZzVlVn?=
 =?utf-8?B?UFk1aEQ2RktOd2RDSDJYYzVoSWdFUWJNQmNKQzU0b2VldFl3R2Jndko0cXR3?=
 =?utf-8?B?SW45TW1ZNGxSRDJzWXBXcmZNRm1tM3dkSWpYQjlLSUlMOUZtaDlieHI1KzBh?=
 =?utf-8?B?OHR6VHlQZkJaWjNVL1FraFI1UUZaYW9Ub01DODdUb1llNHRKQ0RucmQ1d3ho?=
 =?utf-8?B?THNWTkF2cDZZcWx1Rk5BRHNyQzF5RGEwTjZibUZXcU9CQ2RubHJWZzg4c3BL?=
 =?utf-8?B?SjBoZHRndXdKQVNvYjRONmdiR2c5ZTRoYVZ5cjVLQTlGTkQ3N0o2VWhZdk5y?=
 =?utf-8?B?K0xrVDhGdklqZDFXRXZJcU5TS2l0U1krMFk3UGt3T1lXU2grMjNpOVQ1SlBq?=
 =?utf-8?B?YllubUQ2bTdaYTA5N1I0a1g0eHhMejlsVXpPMEdqZnB4TnB1bGxXdlZYSE5r?=
 =?utf-8?B?cTRBNDdFL2YwNVFMbGNGTXQvejF5MFg1RVhvM2lpUG4vNGhwNXBSajdIZW1v?=
 =?utf-8?B?aUZDQ08zRzFVdGQxZkpldU1DdUNNNHlkUDBIZXh4aW9ISHd5SUtJWVcvQ1BH?=
 =?utf-8?B?K2xWUTREdk85S2FnWXI0djZFTkhJWVBsV2tIWlI0SGQrc1lzUzBCTGhhdFVG?=
 =?utf-8?B?SGxDMUd0bkt3SEFFTkZLMWloVTJTR1ZOM1JyNVhHQ3BWNFNxSUxGNzdOZmxR?=
 =?utf-8?B?Yi93UXFFalpNaUtIQjZHbzdtWGM1bEF1TGYzRTJuelU5YzYzQnZ5aXlsQVFP?=
 =?utf-8?B?WkIycFl4aGNpTnZSM3hETWJ5QnhLYlpveDBGdkNDRFF6Q2IxejY1bTExQlE1?=
 =?utf-8?B?bFcyRzFWVVpIR21RaGMrRXVHdFlXL2NDTDlaU2JDSTNxQ3hGcDd4TlZyMnZz?=
 =?utf-8?B?cVUxTWdZTlRvT29PbFlSWXE5bTJKSXJaK2FOd2xtS1ptMEJJbVZPQ0ZnTlI1?=
 =?utf-8?B?YWVBaE0wM2F1K0VVSTVvdzhCVUx2WGVGbTR1RnQ5VjNRVDB2U1B6d0FCNlhV?=
 =?utf-8?B?Uk9VYUUzNGVNMXp0cU1UamhGbWpqekRjTm80UzMxK21KcnpmcDl3UGRIeWNB?=
 =?utf-8?B?NGhDdTZHNnN5TW80SFcrZDRTL2JmalpNaHNqUkN3bE0vTWx6SFNTVUh5TnBL?=
 =?utf-8?Q?NAurG2PY/Wfr7t86UtoZ6u6T9MO0bU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmZPSHA1MVhFdy81cU9Oai9kcmkwS1VndTNaZG1jT2tZOHhpWUd2SWxtdWZw?=
 =?utf-8?B?U1VsOFlQUXBtSFhQRVZGaEJNMG1odDcwMXZTajBBVnVXM1RmQXQrRjhla3pZ?=
 =?utf-8?B?MzNqandYcEFRNUJiYmFwVW0wUFVDVm4ra1FjdUNaMVliZUMzemIwWnRlaDFp?=
 =?utf-8?B?ZnFLUDM0YzVUSm53QStXTFZxUWJtOXNNVVBYMlRCZVVzMDgvOFVDWWRQcTJR?=
 =?utf-8?B?dmZYb0w0b2djcHM3MWhFUFU2RjF4ZHphenROYzNqVisxWi9ueFh1eGRmZlIw?=
 =?utf-8?B?bGhKUmZVcm11UkxRSWkva0IyZ3FYZDRTZHhULzdFZjNNTUJ4YzQ4V3c4SHl5?=
 =?utf-8?B?Kzhkclgwd0ZnSHpDL1Z2YVlQTmpvQUhTb0grMVRCTTZlajhnQ3QrbU02NVZE?=
 =?utf-8?B?VFlzSldJQ0kzbXdTZGF4SW5xazR3SUFrZGFYOFNPUGVaT2FrOTB6T0U1dnFa?=
 =?utf-8?B?SXZiZCthRDNhRFo0NkUzNU52UmROTzJCS2pJcDVPanVoM3VTQjdSaTlxcHBi?=
 =?utf-8?B?RENzTk1Nb1RqWDN0NjdvQzJLd0dMVmp2bEhNMWEvVzQveTE0RitjenppVGZK?=
 =?utf-8?B?VGc3TmRYQXFaRkNIa2l1Z284WlFSZ2lCbjFGVEgyTlpaOU9OSjkzeGdlYWl6?=
 =?utf-8?B?VGNQS2Z2MUY1dUpOQytZdGVCQVFWZThjeEhLaEhwamd6NGV5c3lMc2xWT3k1?=
 =?utf-8?B?TkRWRjhtSGpJZkpYclpWTTFMK3pnaWVRYnBjK0pUaVRjQVJNbklYdWxkZ3hj?=
 =?utf-8?B?ODdVMXpGQll1a1dUNDY4R3c0TXlCL1BDdXpPRE9vR05YYnFMb2NzOFV1RVVK?=
 =?utf-8?B?SUFSemdYYnk4RyttVkw5UmhJR0RLbWxwekM2U3NWbnVoTXByN0RNR2xiWUI0?=
 =?utf-8?B?YUsxdU11UlNYYmdvaklnY1BlSmdmSnFxTmdjZ0NzY056NzZoaGtQZXpkMFdw?=
 =?utf-8?B?ZjlXTTg4bkcrcHBRc0VKcWhyQ3FsaTdEdjlQbEVUK3h6LzdNdnZDTFpEZzNB?=
 =?utf-8?B?NDlpbThzSUZZUVE3ME9IOTJERWVwaDg1alczY2lLVXdSdldNK0hGRXRZbFlp?=
 =?utf-8?B?bGo5UDJuYTlHakxNOGU1cmNCZFJDWHIreU1LazA0Qm44Tk1BVi9TdldpZTdr?=
 =?utf-8?B?ZE1qcDVlVFlvTGI4ejNubUVpY3Rqd2N6aDN5MHJENlM1THhWK3VWTnhabGVL?=
 =?utf-8?B?MVFSTmxjOEN3RXlWTU1CTUUyNTJ3Wlk2Ti9OUFlsYmZTckZPZkFIRSsyUktR?=
 =?utf-8?B?MERnT3MyeVJtU0tVZmx2UGdNWTFid0pxeEJ5SjVQbjlpSlBWcUVEVlZGbnFU?=
 =?utf-8?B?WGtXQjlvZzdyMlNHR3VqVTBDbGx3N253SUhtYnROYjM1VVo5VC80eEl3S205?=
 =?utf-8?B?TWFMN2JHRDNNMFE4R1drbUtKV3VpQlFTRlJZaVNSMnFqbnQ5K1FHa3BUMFRF?=
 =?utf-8?B?eXBGMFNMZ243VDZ5UDFaVGVSU2w1UElGRnJQQTVvK2dqQ1ZWWjdHZW0rdVUw?=
 =?utf-8?B?dXFEVlJDMDkycThBbUt2UldaT2IwUTdFbmNlNlYyZkt4UWNpUTdBZVVES2ta?=
 =?utf-8?B?VUNqSEVMWkkvWnRmR3c1QzFNdzZRWjNZQjFoelZDMldEOUx6bHI5V2c0UDZO?=
 =?utf-8?B?d2taSnZFelI3UzVPVUdxR25sV1c3MlkxTUVpTzRpcE1ZcGpEekZpNG9UM0Zh?=
 =?utf-8?B?UmlRbEtlVTlCRGc3VjdUZ2Radmg1WjQ4ZmtUc3NzMnZXWStIaExnbnVXRDV1?=
 =?utf-8?B?cUtFczNRc2t1L2tBNUQvUzhmSUtrbGsydStDY1pISWFaVTljUEdIY0twQkl1?=
 =?utf-8?B?YmFqL2FzVGszcVFJMkV3UFVSMkE2U25mc0ZieEhlUGdFMzUwekJMYUJHTWwz?=
 =?utf-8?B?NS90eGgwaldTUitGRUdGN1RJYklHb0p0Wm80TEJWaFF4cys5SldpaUxjakRm?=
 =?utf-8?B?TUJrTUp6YjFNRzRxa3doYlJiaWd5bWQxUUVTMGVibG9VaGh6NEpzemVoTHVP?=
 =?utf-8?B?am4vYkV2eWJJTDVPeUViUUZyYzZWRGQydmR1K0Y4dStiT3J1aENNbEpRKzZy?=
 =?utf-8?B?anNpL1Y3bE8ycVpObkwvWk5CT3ZlMnVtTG1JTnNwejJCb2ZlRmpVcmVJTmhv?=
 =?utf-8?B?RlJTeWNTc0gwZnh6MENwNXBxYnlVa1FydjVoVElTeWZ6dTJjckhmSTBjSG1i?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e52e0189-87a4-4a8c-051b-08de20be8f52
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:35.4561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsqVfrBsfF3BeS1vx1XRYLQwBGIArX0Bu8aeOHUOr4z4WWybMeQ66S5SHxPHw3wTNBl/ODcvv6Xsyb7lHajbRnp5eCnC4YSPJyzaYxI0BLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Introduce a new function to copy data between VRAM and sysmem objects.
The existing xe_migrate_copy() is tailored for eviction and restore
operations, which involves additional logic and operates on entire
objects.
The xe_migrate_vram_copy_chunk() allows copying chunks of data to or
from a dedicated buffer object, which is essential in case of VF
migration.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 128 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h |   8 ++
 2 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 5003e3c4dd170..2184af413b912 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -29,6 +29,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_printk.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
 #include "xe_sa.h"
@@ -1210,6 +1211,128 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
 	return migrate->q;
 }
 
+/**
+ * xe_migrate_vram_copy_chunk() - Copy a chunk of a VRAM buffer object.
+ * @vram_bo: The VRAM buffer object.
+ * @vram_offset: The VRAM offset.
+ * @sysmem_bo: The sysmem buffer object.
+ * @sysmem_offset: The sysmem offset.
+ * @size: The size of VRAM chunk to copy.
+ * @dir: The direction of the copy operation.
+ *
+ * Copies a portion of a buffer object between VRAM and system memory.
+ * On Xe2 platforms that support flat CCS, VRAM data is decompressed when
+ * copying to system memory.
+ *
+ * Return: Pointer to a dma_fence representing the last copy batch, or
+ * an error pointer on failure. If there is a failure, any copy operation
+ * started by the function call has been synced.
+ */
+struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
+					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					     u64 size, enum xe_migrate_copy_dir dir)
+{
+	struct xe_device *xe = xe_bo_device(vram_bo);
+	struct xe_tile *tile = vram_bo->tile;
+	struct xe_gt *gt = tile->primary_gt;
+	struct xe_migrate *m = tile->migrate;
+	struct dma_fence *fence = NULL;
+	struct ttm_resource *vram = vram_bo->ttm.resource;
+	struct ttm_resource *sysmem = sysmem_bo->ttm.resource;
+	struct xe_res_cursor vram_it, sysmem_it;
+	u64 vram_L0_ofs, sysmem_L0_ofs;
+	u32 vram_L0_pt, sysmem_L0_pt;
+	u64 vram_L0, sysmem_L0;
+	bool to_sysmem = (dir == XE_MIGRATE_COPY_TO_SRAM);
+	bool use_comp_pat = to_sysmem &&
+		GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe);
+	int pass = 0;
+	int err;
+
+	xe_assert(xe, IS_ALIGNED(vram_offset | sysmem_offset | size, PAGE_SIZE));
+	xe_assert(xe, xe_bo_is_vram(vram_bo));
+	xe_assert(xe, !xe_bo_is_vram(sysmem_bo));
+	xe_assert(xe, !range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size));
+	xe_assert(xe, !range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size));
+
+	xe_res_first(vram, vram_offset, size, &vram_it);
+	xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
+
+	while (size) {
+		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
+		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
+		struct xe_sched_job *job;
+		struct xe_bb *bb;
+		u32 update_idx;
+		bool usm = xe->info.has_usm;
+		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+
+		sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
+		vram_L0 = min(xe_migrate_res_sizes(m, &vram_it), sysmem_L0);
+
+		xe_dbg(xe, "Pass %u, size: %llu\n", pass++, vram_L0);
+
+		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
+		batch_size += pte_update_size(m, pte_flags, vram, &vram_it, &vram_L0,
+					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
+
+		batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0, &sysmem_L0_ofs,
+					      &sysmem_L0_pt, 0, avail_pts, avail_pts);
+		batch_size += EMIT_COPY_DW;
+
+		bb = xe_bb_new(gt, batch_size, usm);
+		if (IS_ERR(bb)) {
+			err = PTR_ERR(bb);
+			return ERR_PTR(err);
+		}
+
+		if (xe_migrate_allow_identity(vram_L0, &vram_it))
+			xe_res_next(&vram_it, vram_L0);
+		else
+			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram);
+
+		emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
+
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+		update_idx = bb->len;
+
+		if (to_sysmem)
+			emit_copy(gt, bb, vram_L0_ofs, sysmem_L0_ofs, vram_L0, XE_PAGE_SIZE);
+		else
+			emit_copy(gt, bb, sysmem_L0_ofs, vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
+
+		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
+						 update_idx);
+		if (IS_ERR(job)) {
+			xe_bb_free(bb, NULL);
+			err = PTR_ERR(job);
+			return ERR_PTR(err);
+		}
+
+		xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
+
+		xe_assert(xe, dma_resv_test_signaled(vram_bo->ttm.base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP));
+		xe_assert(xe, dma_resv_test_signaled(sysmem_bo->ttm.base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP));
+
+		scoped_guard(mutex, &m->job_mutex) {
+			xe_sched_job_arm(job);
+			dma_fence_put(fence);
+			fence = dma_fence_get(&job->drm.s_fence->finished);
+			xe_sched_job_push(job);
+
+			dma_fence_put(m->fence);
+			m->fence = dma_fence_get(fence);
+		}
+
+		xe_bb_free(bb, fence);
+		size -= vram_L0;
+	}
+
+	return fence;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
@@ -1912,11 +2035,6 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
 	return true;
 }
 
-enum xe_migrate_copy_dir {
-	XE_MIGRATE_COPY_TO_VRAM,
-	XE_MIGRATE_COPY_TO_SRAM,
-};
-
 #define XE_CACHELINE_BYTES	64ull
 #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 9b5791617f5e0..260e298e5dd7f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -28,6 +28,11 @@ struct xe_vma;
 
 enum xe_sriov_vf_ccs_rw_ctxs;
 
+enum xe_migrate_copy_dir {
+	XE_MIGRATE_COPY_TO_VRAM,
+	XE_MIGRATE_COPY_TO_SRAM,
+};
+
 /**
  * struct xe_migrate_pt_update_ops - Callbacks for the
  * xe_migrate_update_pgtables() function.
@@ -131,6 +136,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
+struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
+					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					     u64 size, enum xe_migrate_copy_dir dir);
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
-- 
2.51.2

