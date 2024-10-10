Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8805D998398
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 12:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011F810E8C0;
	Thu, 10 Oct 2024 10:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lki1WKg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CFF10E8C2;
 Thu, 10 Oct 2024 10:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728556339; x=1760092339;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=k6FuSgJWVlJs5J+Zi67ZM/VutGM78ik5XQLGqbORcgA=;
 b=Lki1WKg4YbAxOxAAxOb+HFT7vjmzJvBHFAiZcZmtWI0dz8jPlBucqKMO
 gmn4oHqlBnliPvhs3R063AWGiFigfHZVX3bJjJNxEFpFtI1mtuo5/zDqU
 QzPieBRPh7RtgtJ5vocJuEvQec+VZ5s0Kpzez7jgALFzOvnz1eZ6zK9WH
 BNpOfqgNqcOlfHZncc1OzKShP3qrzIYB1Vgh2bOBtK7xr+UVEOc8AjDnF
 T+VQW0hyIqj4JjFp5TrcoZ0AUZRYvDX5xgUfdAqrPakJAPKvrGY4CsGd4
 oSlGUROErPJlYXIyioX4dGt0tSIGIpi5I17EC2Trbykv0PodkoTRR15Np w==;
X-CSE-ConnectionGUID: 9FcdqhI9TyWy0mjb0el+Ng==
X-CSE-MsgGUID: iDoIo525Sf69n7YPEkIafw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="15528405"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="15528405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 03:32:15 -0700
X-CSE-ConnectionGUID: +3KnJhDtTaO3E7zouqqKhA==
X-CSE-MsgGUID: D6QkxObdS4GiQZ4UU+/BBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76464891"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 03:32:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 03:32:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDfEkx+KNivMn7VT8cy43oycw3urHabRJvHHjIqHQZcFWXWOB/+qZvXp8TpJd6pwuH8qHdmUYyPqdKAFvnodTWO0OO9aqt3fssGc4cXQ1baCQh5ki/em6yEru5I5bIhUYYFdYy7W497bqtlYYkEbVLB2zkZydJBYZac2Pc78NWsyP6g8L/QVlC7WwqMkruZWrJLXpCiZThjzNENMFycMmBUfAi0akN62yBFy6jHyyKUXV8wt/HvxVSJ024JFmVYhe2o4QTSwqLcAX716Pre8N88f6EnANJZ4c1ded8LA8TCEoBnCGl1wwQO0j9bwDv3cziUwCTLgBo8y3CX12FMSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDvImW3k0R7R4nAXhPF9Yp/GPKvJHSPSpaJ+oYpQBRw=;
 b=Ino5gc9mda++ZDMXk4j7suGdpveyNTf8l7k6ZbOKDjX25/GJRMCKPruAbt2k7G5P5SBD85AMsOCBXdkn4sGAzPUdpo7hCvu7PmcxyLAZ+VcAWp198z9tSzgcL+Vub8ylFsL70eXNim269pn/3qvEvKdYb9ukaUExqbAmh/jRD3B6GsILYl/Nr7/2cye/w0hQXBPz6ELd6/eFUK1kyA4oOt6vZ4A+oVHEp63Mh400ebFnhSIUUFmdhYTQlos0Tm/jxOahtVoygS+27/WTH6Rqqvt2MEnzOrdGU/E+fzs9cMNneWZkCsmuwd3lDR9UKgnLo0AK9mMUsv7hE8m5WbfYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Thu, 10 Oct
 2024 10:32:11 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 10:32:10 +0000
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
Subject: [PATCH v3 0/5] PCI: VF resizable BAR
Date: Thu, 10 Oct 2024 12:31:58 +0200
Message-ID: <20241010103203.382898-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acfb7d7-f78a-4ace-c0e0-08dce916cc4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmNCT3ZsaTNPTXY2UEx6S3lid2ljY1VQUUVtZXJUSWpnTWxPUHlzNzVQQ2VW?=
 =?utf-8?B?S0dVbW5FblhGM1dnU3JrVjVzc0Exbld2V0RTbkszNGlKTTl0cWJibEoxWXpy?=
 =?utf-8?B?Vnk4USsyeU1WekU3QjdIRWJXSk1SRkdlOG1QQTBzNWRZMkprRDBsdVFNczJM?=
 =?utf-8?B?a0s5UkVYcXpJYjlXN3g1d3VTb0xDc2dKcFdhSEJPbWNoOThMWG1TRFIwVzZN?=
 =?utf-8?B?cG16K0JkKzFNTzZWc01BeEdFYzA0SzEwczQrSnhJeHdsWTFJbytGS1dORTd4?=
 =?utf-8?B?WFpUbkJsa2wxUllPZEdSWDJzU041MzdRQzIzNzFuRWpzZDZPMG5BZ0xzV3NW?=
 =?utf-8?B?Tm5jL3RHNDZjVU5ENGtaT2ZHd1VBN081QlJvS1YzTHlvTjAyV1Nybks4VVpU?=
 =?utf-8?B?cXQrWlFJMEVTUGVUSHVwRkJ6TW5SNnNtWmxXY2lrWVo2QWh3YlZUOVN4ei91?=
 =?utf-8?B?NEVaemhKNW9YWGFXMkk2ZDdNRENiOGxiYm96K0JGWHBYQXpqOVpmZXNuc00x?=
 =?utf-8?B?S21lSDJlSDUwS2w1cXhHZ2g3SHJEVG03RGpWc2pUTUwwVTR6bTVKOUhpWE9i?=
 =?utf-8?B?d3k3Q1R5VEN4dnlqYjUyZ1Z2ZVpKTjh4QVI5K0ZBWDNGbmwyMnlvcXlTd0JS?=
 =?utf-8?B?QTlUVFRXdkhHVE1INmpaTEhxdVdQVlJMUEZnM1BkL3VNVDVUVkZycS9XNzlG?=
 =?utf-8?B?R1FGNDRDTDNCL05ZVmdrdC85clhVR255V0tERGhveFgydVZaWVJ3bktXQ1pH?=
 =?utf-8?B?MkZUQXd5Z3c2Q0U0eHhxaCs5aDQ0SVJySEFRbzVuQVVCdW1ycWF1ZExZSitp?=
 =?utf-8?B?aWNqVmxJb1FlOHNwWFRycUJtaXM3dm5mUml3eHZVbStlcWlYY3lOWjBDZ3FS?=
 =?utf-8?B?NThkZzB0U3ZUWmZLUTFuZFY3bFVmNW5TMHdJalExYWs1OTBrVG4zRG5aT0tQ?=
 =?utf-8?B?UXZTY0N2VUtiaHJtajBLMU50UksyYXZtL3Q5OGRNNGxOVFV5Nm9ZVnk3Skhj?=
 =?utf-8?B?ZjVCUXNnTTlFQU5QSGh5VEZyZldiVm5aWVZjVzJ2VVE0bDFpWjdCNU4wTlZQ?=
 =?utf-8?B?emVLdC9ycCtFcEpKV21Ga3kzTDFMb0JPMzBjWW1MN2VPZTk2S1dOd2V2eHVU?=
 =?utf-8?B?VXFjMGVSUlZTVFNGUXR2NzdyRjd3UFhDODZrU2RUODhhZmZjNE5UOXpWZDAr?=
 =?utf-8?B?c3gwTUJxYWZ0djRTZkxOTGZBOXRTbnJiN0lVOGxpaVVjUFB1Qk9zdDhLZUtR?=
 =?utf-8?B?VkNvWDRvZ0RUQVB4QVVVakdxQ1pQUFZjM2lMVm9teUJsbnNsSlFveTdnbFlR?=
 =?utf-8?B?VVUrUnM2c1BtU1FTbHpuZFA2S05paWNJQm9OcWdkV1VKS1hidGRxdFhmd01k?=
 =?utf-8?B?ZHJ5Q1lrVG1EYzdSNysvOXZMa29OaUw0d3ZSazIyeEtnVExZeWhkSUtlZU5D?=
 =?utf-8?B?Z0RPVTZRZXd3cmtYaVN4WjQ2UURwNE96b0lJakQveEtxeTR6Z1MvVTZ3Smtz?=
 =?utf-8?B?OEVzdVJaM1N2S2w3OGRCbEdYSS9xRlR1aU0zKzJveVREM0xWd0dIMWMzSS9r?=
 =?utf-8?B?a2NXYzRoemgxLzRxbHhOU3pCNUNFTTh0R2lQbk5UMkE1SU9OR0taT1FuZWYv?=
 =?utf-8?B?SFFMUVBQNjYvZy9rUmZkWC8yVlhIRnRUMUlETERkMkUxUTJ5dzlVYjJ6bHk5?=
 =?utf-8?B?ZVZDcndzNEYySlE0dTQxRmJCNDVWN2FXY1hiVlpCKzMxbVV2bEdXRENBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTBrVmtvSVU2ZEFDck5JYWdwMmhqTmo0cGc5MkR2MXdrRzZHVHBrVW1LaCsr?=
 =?utf-8?B?dlhlUCtFWVhBY3cyTUUralZGSUh4bXZmVFVzMkl4OHJtZER3cFlYVnU0eUNp?=
 =?utf-8?B?WjZ4bG8xWTlTL2g4SW1MZGhad1NSUWdqdDlpa0ttSWIxem5Jd0txWHN0ZkEr?=
 =?utf-8?B?YVpPdVFMbnc4U3BPS2ZaRkRnVllERUJaNVM5RXZINWJ5Uk9sMFc3T0ZGemwy?=
 =?utf-8?B?SGJTWVhkOTNWUTFFamJrYTkyUXZMdGs5MCt6aXFCN1RtZXhWTnZ5UjBETXpn?=
 =?utf-8?B?bzJIN1RLOUp4UUM2eXNwN2IyZXV1L2VVV1N5ODIwMkRTMEhwQS9WeUN6RmFl?=
 =?utf-8?B?ZDZXcDVpODNubDBReEgxbkozZWkvTTd4TmN0THVjNTFRcGJUK0ZwK0FBb0xq?=
 =?utf-8?B?eElEVW04Tnk1WHhaNys1QUtZMmU1Y3NudVlFMExHNW1Nak1ReGQyaXZDcEIx?=
 =?utf-8?B?c1E3QnRuQkIyV2QzSFUyaTE3MW1MMTBmeFBuSWp6NklkczJIL09udFpzb0VL?=
 =?utf-8?B?bW95T1ZiUVN3em9pNHZJdGhxMExyTXorSlZvaUJkb0w2MUdteExWZ0dYbFJa?=
 =?utf-8?B?MzdlZXdxQ2VEeEpCU20wc2ZpM1hHeXJjbDNYa2FNMTF6NGo3RVFHZ2FGUE80?=
 =?utf-8?B?dWFkVzVHdExSNjhsd3NCYW5oTlFEOGZ4eWdoUmc0eTRXS210MjVMaVdkSUZ1?=
 =?utf-8?B?OVhLVGRlNlBJTnZZQXBMWGM3dkhmVERtK3h6KzUyZFhYY1IrSWkxRUFmcFBv?=
 =?utf-8?B?WU9zeUhsSkxYSkZmNUdibjlOSEtCeE9MOTBqeWltaGE4Rnl3MlpheWVYZU4z?=
 =?utf-8?B?MVRFa3FIbnp3UC8vdlZRTml2V04rQ3dnMmxrU0RzTGgxZlp5STNEU2VVY0xq?=
 =?utf-8?B?bjhXZFVDTDYzV0wwNndaM25QUytnR2ZvQ0Z6T01VN1VmNDQ1QklxZUVLREp5?=
 =?utf-8?B?UXg2ODk5K2tGTWhhOS9QSU91b0lMMTN1V05kMkZXTUtlRUFmbUtyTUxqZldF?=
 =?utf-8?B?VC90N3V0NFFNWWxtayswVTlaMVlRYlVDZEwvQ2FlcElldGNPME1JUUoxVzB4?=
 =?utf-8?B?blArWEppdEdFUTBmekVQa2V0bHF1Wm9jcFhqZVpvVWoreXdEWGQ2L0xMME5a?=
 =?utf-8?B?N3VhMXhCM3F1bVVGTWNFbm5waUs1Nm1iRmFYNFpQYjNocG00WHcraGYwZ2F6?=
 =?utf-8?B?d0x2Szd0N2JiYnRrRWU0bmFWbWZZWkhaUGNscWc1TXZGZ2pBeTE1eE9LcTBO?=
 =?utf-8?B?SkxldG55UEZPZ1cwekVtSDZUYi92NDJ5OXBPcWpSRzg0Mm9NSitKQ3hiMDZh?=
 =?utf-8?B?TTU4U2FqK2FoSEVjMDNxWFRvQ21ySUpPZEFTQUpFL2FlK3ZRVE9BMkZFQUVu?=
 =?utf-8?B?UFFNMXA1V3ZZZFQxUURFOVh2QnZEdTYzSUhobTdRY1FlRHRndnN3c2VPclJV?=
 =?utf-8?B?cW83MGtFMVJBVWZDcHNPV3hkRitBVTJKWndXRzlPVm5lbEhsaUFObHVrNkRT?=
 =?utf-8?B?Z3V3V1BXdHllYUpxY1hyeTAzU1RjaUZQcmxBNDl5bTF2ckFwLzYraUFCeERF?=
 =?utf-8?B?WUNsbVlXZmdRRUpTVDF4cHlETXBNenRFblk4TENwRVhVMWsyM3VTNmJ1dVIw?=
 =?utf-8?B?UDVtOVRLcUhsQXQ5N3hpMGdCYWtua3loMEtmUlliOVZqbHR4SnNZc2syOVlt?=
 =?utf-8?B?cXdvL3d4QkRGaU9mMGxZQnhSdkFYRlE2Z3NHQlBBbjVnUVhqRkd2cE8yR2dW?=
 =?utf-8?B?cldYekhmenQrbUF5SlNvaTZ0UmkxbGdWUVVxM2JTemo5SEo1ZWZBUlNCK2hx?=
 =?utf-8?B?RTFhYklFRGt2cFNnMmRBT0d1VmlDLzR1RHZvOWZ5N0JBL1c3Wk9SelRuQ01S?=
 =?utf-8?B?OHVHQmhpTFJYUXlhMHhmZXhGUHFwWmNWN2RiVnBXL2EvZEFnOVhRaHg2V0Vv?=
 =?utf-8?B?MGd3d1I1elVsb0xaMUxRNmwxKzZYa3Q4OVNlbDlhdnZoSVEyUnVQSmJxWVkx?=
 =?utf-8?B?b091VXpFOG1RV2cxRXpIWkJla1cvNVlkdjJ0UWt6Yks0cnNwaURhNWp3OHB4?=
 =?utf-8?B?ZVlTeXgxM005VFVScTgyOVVxdHZBRGVaTEhneTgvYUo2cUNyd0NGa1pQNzA2?=
 =?utf-8?B?SUp0by9lTUJZUTkzTWVQVDZ4SGJoRUE4cHYxZ1pLei9PZ2tMNG9VQU0rZWtp?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acfb7d7-f78a-4ace-c0e0-08dce916cc4f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 10:32:10.7268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sizvt1wMGAIaDkYoX73Xa71JbtdcqdK3A/Uu8v918ebvSdq/XN4Gh/28l0s3kaYhAvwOTR8tmvckDO4gXfS2FN1spLtGwYWuTqChP5SfqRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

Hi,

Resurrecting an old series [1], now that we have an in-tree user for it.

For regular BAR, drivers can use pci_resize_resource to resize it to the
desired size provided that it is supported by the hardware, which the
driver can query using pci_rebar_get_possible_sizes.
This series expands the API to work with IOV BAR as well.
It also adds the additional API to allow extending the VF BAR within the
original resource boundary.

Thanks,
-Michał

[1] https://lore.kernel.org/all/20211215141626.3090807-1-michal.winiarski@intel.com/

v1 -> v2:
- Add pci_iov_resource_extend() and usage in Xe driver
- Reduce the number of ifdefs (Christian)
- Drop patch 2/2 from v1 (Christian)
- Add a helper to avoid upsetting static analysis tools (Krzysztof)

v2 -> v3:
- Extract introducing pci_resource_is_iov to separate commit and
  use it elsewhere in PCI subsystem (Christian)
- Extract restoring VF rebar state to separate commit (Christian)
- Reorganize memory decoding check (Christian)
- Don't use dev_WARN (Ilpo)
- Fix build without CONFIG_PCI_IOV (CI)

Michał Winiarski (5):
  PCI/IOV: Restore VF resizable BAR state after reset
  PCI: Add a helper to identify IOV resources
  PCI: Allow IOV resources to be resized in pci_resize_resource
  PCI/IOV: Allow extending VF BAR within original resource boundary
  drm/xe/pf: Extend the VF LMEM BAR

 drivers/gpu/drm/xe/regs/xe_bars.h |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c  |   8 ++
 drivers/pci/iov.c                 | 141 +++++++++++++++++++++++++++++-
 drivers/pci/pci.c                 |   9 +-
 drivers/pci/pci.h                 |  27 +++++-
 drivers/pci/setup-bus.c           |   5 +-
 drivers/pci/setup-res.c           |  37 ++++++--
 include/linux/pci.h               |   3 +
 include/uapi/linux/pci_regs.h     |   1 +
 9 files changed, 213 insertions(+), 19 deletions(-)

-- 
2.47.0

