Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA710C363F1
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E3F10E774;
	Wed,  5 Nov 2025 15:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+NXZVmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C78710E774;
 Wed,  5 Nov 2025 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355520; x=1793891520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KFvun3CwV0e5v3FfPo2gz6wgMCVQne05G9cUPUMdK3M=;
 b=n+NXZVmBXmMhautxJGFvaJJ/0KQrdp7JWl6UoFUMk2EB/MuNUB+N022Q
 n7cvhqXJSoNDCKe0SUI8fehBpppgejVbCrcsvHPe9z2IzxpTAZrDP/EH7
 jfOHH0IZF0OPbfV+AuIlSoAx8/n77OirSXf0N4AttLpl+ACS8U63SEXmg
 w8UDCIBpjlGpCduo0xdsgsssRXbuLUuBuvlnr9xnLx6o+4CAefCqX8pR5
 ud9TiXsbCaS+WBqt3goK8nBITRx2DYUrlus91MpEKZjTKzAjES1xiJDdH
 joN86SvCXyjGJBzxL6FTg66hEePe0HrHlz5ya9dVV8v8tLl3gp3fr/7PY w==;
X-CSE-ConnectionGUID: N3FNHSoAShuU/7l/6/XQNQ==
X-CSE-MsgGUID: SVB3NviPRRaJnK5Y6F7CHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64509988"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64509988"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:00 -0800
X-CSE-ConnectionGUID: WMEXA3o7SJGIeGiSeYcD7g==
X-CSE-MsgGUID: iJse3FfdRcqMSk4cjsg00Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="186766455"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:11:59 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.64)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2WOiCiPLIt71EX8EOUW4rkXa4zFqDaBwoA37wqSdKSlPF+g6lzTMbGT5jwyuLzU2WHWh90P8K0muetdiAaziag1o51YZ1SGH/+3XTvKNPfYIXE1JzjQ/a90tcmmOYX7LGk8195MvIykOdkxf542PQl90+jqdMafv6UwObdoEr8qTxuZ6KmMXgOkxq8Udu/gZsLePIqiMRcAXtPlak9dPqk1Mf59Rawf+LyIjel+z7OSqN+zazpl5woncSpkpdN+V18aS2fdFSNLPKyXWfIGx0w8LcUv5Z3yfahsHyKNJ/D/SVELfjqKps8Q1kS1qMotZpe+ggAs3KZRFBxD24o3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DRH/u6HI94Oh9hLIpmar3qj53eCCfsuHj764j0K+MU=;
 b=Gg7pLjmZqeDKQhi/UEgu8Atv9sD2kBdOSw7RMEYH5MnXRMWRaiPI9+WZ5E55b2TMD+6k+vQ3fbbBjRbJWTe8ykoLsAWdKlnVRoHlBaMZM9HuF1ejyzX+6f0/D1F54z5E6ClALIkolAimDLvvZu43F8SHTsydCKEYORvFY7vlXiYmArWWKXMhJiujaqy6Q2iMt99UsK+C+48CJZjyEkmw/krDHTpWr9aaJLJtnaEcHpT3oxqPc8MZhPzWp7r3ZSQ2/SPmMneuh/Mpq1RRg2n5ovA93emZMtNdw+WF5dV0Q/Cf+PXZolkPaILbp2KJY0Y7kJ1H2KU0ND1vcDiMZm43aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:11:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:11:56 +0000
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
Subject: [PATCH v4 14/28] drm/xe/pf: Don't save GuC VF migration data on pause
Date: Wed, 5 Nov 2025 16:10:12 +0100
Message-ID: <20251105151027.540712-15-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 67871cf2-dc36-4fdb-ce35-08de1c7da919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3c4cEZYKzYzZnAwK2x5V2xUY1IybEVrclhndXZjdkpKaWZCekJXWUJmWkRL?=
 =?utf-8?B?Y3M1cHBwWncrcm9QbU5OMEEvZFBMQXIzVFBkQzE0S29JdjFldGV5eisweTdl?=
 =?utf-8?B?ZlNhV1RIV0t3MFhBbkxndHhUMm5DdlBQWUhsUXQ0c3hoWmIyOVBBZk51MUc0?=
 =?utf-8?B?UUdhOFlmSkUyeU1wYURVMS9BVGpnQWg2SFZtc1ptckEzRUlsTkljc3BUWGxq?=
 =?utf-8?B?SVJ5dG5uZUh3MTV6NmlvYjZVM0JHQlgrZG9xcGtOQXBDSko2VVBaZlBydktl?=
 =?utf-8?B?SER1V2QzOFNPMDYrcStHZFk1QUt0dVFGRGJVblROcXJWNXVGZmhMS0l2eFI5?=
 =?utf-8?B?MFpWSTJqNWU5NjByc3NVQzlWQXdwOTAyb01sSDMrY1o5Yk8wTWpBTlhKTXY2?=
 =?utf-8?B?TlhISVg1SDhPbE9FSWVvWlJYTGROSzBTSG9LKzJJeFNQRWZUQzlsSmpiSXZT?=
 =?utf-8?B?YTRJanVWZ2dvVEVUazZIWWtRSjhlQlNvczlDdnl6VGFRQ0ZaYzF4b0pHdFBi?=
 =?utf-8?B?eUlvTHZwazRoOWJjNTFQampTVG9wTUZTMHUwb3NNV0VCaXBIamRnN21hdDRo?=
 =?utf-8?B?eWQxelhmR2NlUWkrZDhnekNZdyt3KzZqejRSVTZQcUtqY2lhcThvTGRxYnNK?=
 =?utf-8?B?c2M3WHIvQmJCRDh0dXlLTFZEYjFjaThLVlNLL3dCQUg5QTBPajhUU3psN2hQ?=
 =?utf-8?B?bXNGdStJZG5aeGdUTG5uS3BzRG5OWE52SWk1TDZIUE9CcTdja3F1MDFHM2Nw?=
 =?utf-8?B?RkF4RWFMUDVOWGlmTGUwanpxZmZWMnRDSFBSN0p1aW1uaUZBaDBTdGRZa3FB?=
 =?utf-8?B?aDJ6Rnp6VWNibThaa1ZiNEY3WElnbkttY1RmYzc0ZFRQZVljWENOT1BDN1V4?=
 =?utf-8?B?WlVZVVN2RzVtVVpNQkZ0VG5nc2huWDJxYTFHRzQwMldBeVI0Ukw0ZGRpWTZK?=
 =?utf-8?B?NzQ1NUdzSDMvTW5lN2dHZ2J1MTV6NGhMTkM4NFY1L1hqUFM0azdNR3ZmOFRT?=
 =?utf-8?B?eFZVMGpvTUF4WFd1ZFF3TjMxa21UdDVkUmJSSXdlVHZUc3pBQXIrZFRZMi9x?=
 =?utf-8?B?ZnMzU2cycDJsMUZYQW5uSFgyYjFXSWgzRnJZRk5vNU1RaDhqMENNeUd0Qm0r?=
 =?utf-8?B?R3hRMEp3MDIyMlVTN05JZzAzVmVQaGhjNVJ4YWVOeXZ4dGRNZ1FveE5aTSsw?=
 =?utf-8?B?S0R1MkQ1L2tpVnUrR3lORkRPY2pSenRtVUZid2drS3hwQ0VibGo1OVVFY0lE?=
 =?utf-8?B?OE11dHNtS0NXZkUrYkhUUlpvY216NTdFUlQvVllWWmxJWkJkejhJc05WSFRW?=
 =?utf-8?B?WHpPV3kyLzB3eTQyZzZQU1plRVVNL0Rmc1gra1dJdHZXZGlXRCtrZ2dLckFC?=
 =?utf-8?B?MTVsYzJrc2xDSTRnTHAyeVh5VXVMZE9jdCtTK3VHSHdkeEVnZlY2UmI5anFx?=
 =?utf-8?B?R1kvcGRBVStLS1FxRkpCMXZHMkxSZ05menkraTM2ZkhsMVN6ZDZsWXRXWFRK?=
 =?utf-8?B?WnhvRDRvZDRMQkZrM2hncm5oSjRRcW1waXhZanhyR3BXVVFFL2lheVlWQkdq?=
 =?utf-8?B?L0xwTTV0QWwrVFFiNk1Ra0dpQUJBNXZQZndhakR5SndVRmd2Z1pQN1NrUDQv?=
 =?utf-8?B?b3Fzd0JhdVBKNytsUDlhZHZxYm9LMFBtcE5VWTMrY29lMFB3aGR2N2hCRGYr?=
 =?utf-8?B?aXQ0WUNFMEpaQ2tLTU1mTFJQNTVkOGpWYzJZa3F5dk5hT3QwWmVoY25YRFFx?=
 =?utf-8?B?VHo4Q2V3OStValNOQWRVSkMwVW5Nc3F4RTkyemF1SWhvSzNtM05yb0U2QWNw?=
 =?utf-8?B?Sm1McU9SVEluTWFyRFFsUkRKc29rdllzUk1HaWRzTFpVaDVBWEpBNXJnMHVB?=
 =?utf-8?B?d2hQbzFodmhRcXJCbXVMVlNCQW5mZzdVRmFEK3V2UzVBSGF3d3V1cnFrbm1q?=
 =?utf-8?B?RUFUMzZsd290T1d3RFNVZW81YVhoOGYwRVBHNGlsSXUvNnBUbXgyb3htYW1i?=
 =?utf-8?Q?4Yc4vJ8oId03vNWz8yzfOLhCW7HL1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUxkM24yQkpsdWdzRDY3aklvL20yNTk3OUFqc016YmNMNkxxdDlKTklmR3Qr?=
 =?utf-8?B?QU1SY25GRTRXMGxZbjdGdDUxeTlTVG16L09LMzVLSmZFMm00Sm9HWjlLSXlC?=
 =?utf-8?B?cEhZeGNMb2k0aTMxZmNOUjkwNzBlL1IyamlQaHFFNERVV05zMXZibmxXbGFh?=
 =?utf-8?B?UmN0V1U3R1FNL1VWL2ZHaERvR1UwUkVtb29tQmxnZ09Zb0NPRFV2RjhhRG1K?=
 =?utf-8?B?aVhxUnprYVBSWWtwS0JNWEdkOG4vd0hzYjFjWXFuVmZlVWZBdlBHTkwrRU1Z?=
 =?utf-8?B?S0dXR1pLa0dSRENzYUlZL0lDb09pN3AvN2Z0T3FhKzIyOU1HUm5NUTB4Nkow?=
 =?utf-8?B?eXp1SWhSQnJnUzZZMUdxa0NwbHVDenBSemtwZnpjZlZERUNXWDkrTWI0UVdS?=
 =?utf-8?B?UDZHdll1bUlOL2xLY21TcER4U09LOHVKeFR5WXd5aTJra1NFRWp5ZmxINUJK?=
 =?utf-8?B?STJ5K0h5cklDOExhOTh3R2ZKa05YajVpSGw1TnZiSzhNVDd6UVF1Z0g5ajFO?=
 =?utf-8?B?a25OcVpoaUgwdkREMzN2amRyUHVueWowODA3NDhwTmFJdy84MkdiaG9HT3ht?=
 =?utf-8?B?eUhnVVkySjREbUdxZm5UaVhMc2s0c3MxZEpqRjd2N0dzak1wQVI5L0prMGww?=
 =?utf-8?B?QkxaUUFHdmtJaEtkckpXUzVyQk1Vbyt4cjdhaUtpVWRlZWxaU1grZnR3WTNi?=
 =?utf-8?B?T3YvUEtZM3MyTXJPdjFjcFhTdVc2bEhBV2dYOWhDVUpHU0dUNS9IYS9UTWVY?=
 =?utf-8?B?b25JOElzRVFNc09JaktJa2lET0hjcy9nSEVkZHRyNXV0MVRDRHlJeGhiVVFw?=
 =?utf-8?B?SWo0VGxlbjB5SExHdlJidlJIc3o3WUlnWHFOVmxhTnZ1MkwxU2pqS2EzRktw?=
 =?utf-8?B?eCtsNGc4dzFyUk5XRFVBUndvbWZ4cVQzWVR6TWQ3ZmRkN3MxMzlBZjhyWEdC?=
 =?utf-8?B?L3h0RHlLdDJIRFdnbEZsMWJOSHZYbXNwMTdwbHFEcGdBZXFJL2FDSUlqVEZ2?=
 =?utf-8?B?ekJkZk5ua3BLalQ3b0pvblozT1ZWWnpvOUZiQ3g4WjY3aEdwQWwzdXdTbDgx?=
 =?utf-8?B?QitvcXhCTEtNeTJUMlNzcWVRMExiV3QvR1I3ZE5yVFVONmp3U0pKS3FYbitz?=
 =?utf-8?B?Sy96R3d4a2dmU0JhZlVEOGlFRGhBMU1aRVZKQyszRUhlK3VHMWJqNTF1NFdV?=
 =?utf-8?B?cnhxeElyQlA0RmFjakxDcnVFM0t0T1NKR0ZXRkZyUzZ3Rm1JYmpqSWIydmpI?=
 =?utf-8?B?MjRQSHpwRk0zckV0dDB2bkZKTTE1b3ExYjZnRHBoWUdmamVxMzZRQWxDUVNm?=
 =?utf-8?B?QWVMWDNUUXNPbEt0M0Y0MkQ5S2tIcVhYU3ZKcS9xemJkRWlJVURrVjY4cHhl?=
 =?utf-8?B?WjVPZ3c4YWJsYWszdzZIbFJtOU81ZVhKdk5ZRjZYeVVxRFNmbm1pcHVJNlVk?=
 =?utf-8?B?R0FJdDVpVnVuc3krdVNSVVgwS2ovUytPaVlIYm9rZmduREdVNTFDNTVkenZv?=
 =?utf-8?B?eXV5M0pHRUovazlmRE5od2dnQW1HZmtNYW96S2xNekhLSXdTckJlaVlMdTU5?=
 =?utf-8?B?OFkxZjRMVURtNFBSZDVoZXp0VHRTTTVRM2RTMVUzaVlkUUlrb3Z3MDRNeW5I?=
 =?utf-8?B?eU81aktHQS8zVFRRanR4T1pydHBYWVZOcVVmOGxJLzBGRHR4RUxrbDVEYWwy?=
 =?utf-8?B?K09rbWtNWWlsTUVZNDFwdVdlUjk0NUY4MnZwRmQzQ3ZKVWlndEdJZ2kvdjll?=
 =?utf-8?B?WnowWG9QOTY3ZHVxWE5EVkRUMnlDL3JwT24ySTdCbDdpVjRYQzZ0Q3IxRW12?=
 =?utf-8?B?MTBxOVpnMWY3MFJPTGJiQ2RGVmpBWkpLQzMwemljN28vYmJqc2d0WXNrT2lL?=
 =?utf-8?B?NXE4Ny9LTTNjajVTNTRUcWF6bzVnMENsK2VubVZTS2NjZWZPWjNkUGJTejBP?=
 =?utf-8?B?dlVwTmg0eG5TR0Rzd21rVERDYlo4eTNQRDJqQ1ZvVHoxUkhkY3lBT3NpRXlK?=
 =?utf-8?B?c1o5Ny9FWU1xanVYUXZaU1BjamJKSFlLbkptUHdoajRYSE8yNWpzd0FQZnFj?=
 =?utf-8?B?L0gveTZKNmV2RDNNUWJMNGJZZUczQ2hDNHZ3c1p4c2g3Yk1LZ0N4ZVVsQmlS?=
 =?utf-8?B?YWhlTCtnOHpveDJ2N09DOHpwSkdHaW9HSEVDdTRmcWgrNXdKRTV5aDR6TVJC?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67871cf2-dc36-4fdb-ce35-08de1c7da919
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:11:56.8561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcGF/gTQwqeuc8twWcabHCFfnNRX6z/k4gptYYCpBANNODTnwuDjdnCepvBKX2/BO3ayp6dE75A9R5wuJwfsQagv6hIF5ZCtsPw+tMzh00c=
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

In upcoming changes, the GuC VF migration data will be handled as part
of separate SAVE/RESTORE states in VF control state machine.
Remove it from PAUSE state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 39 +------------------
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 -
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 25937592bc42f..5e8b6929a827d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -183,7 +183,6 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SEND_PAUSE);
 	CASE2STR(PAUSE_WAIT_GUC);
 	CASE2STR(PAUSE_GUC_DONE);
-	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
 	CASE2STR(SAVE_WIP);
@@ -453,8 +452,7 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
  *	:       PAUSE_GUC_DONE                          o-----restart
  *	:        |                                      :
  *	:        |   o---<--busy                        :
- *	:        v  /         /                         :
- *	:       PAUSE_SAVE_GUC                          :
+ *	:       /                                       :
  *	:      /                                        :
  *	:     /                                         :
  *	:....o..............o...............o...........:
@@ -474,7 +472,6 @@ static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE);
-		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC);
 	}
 }
 
@@ -505,41 +502,12 @@ static void pf_enter_vf_pause_rejected(struct xe_gt *gt, unsigned int vfid)
 	pf_enter_vf_pause_failed(gt, vfid);
 }
 
-static void pf_enter_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		pf_enter_vf_state_machine_bug(gt, vfid);
-}
-
-static bool pf_exit_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	int err;
-
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		return false;
-
-	err = xe_gt_sriov_pf_migration_save_guc_state(gt, vfid);
-	if (err) {
-		/* retry if busy */
-		if (err == -EBUSY) {
-			pf_enter_vf_pause_save_guc(gt, vfid);
-			return true;
-		}
-		/* give up on error */
-		if (err == -EIO)
-			pf_enter_vf_mismatch(gt, vfid);
-	}
-
-	pf_enter_vf_pause_completed(gt, vfid);
-	return true;
-}
-
 static bool pf_exit_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
 {
 	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
 		return false;
 
-	pf_enter_vf_pause_save_guc(gt, vfid);
+	pf_enter_vf_pause_completed(gt, vfid);
 	return true;
 }
 
@@ -1983,9 +1951,6 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_guc_done(gt, vfid))
 		return true;
 
-	if (pf_exit_vf_pause_save_guc(gt, vfid))
-		return true;
-
 	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
 		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
 					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 0bee910bdf07e..6027ba05a7f2e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -28,7 +28,6 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE: indicates that the PF is about to send a PAUSE command.
  * @XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
  * @XE_GT_SRIOV_STATE_PAUSE_GUC_DONE: indicates that the PF has received a response from the GuC.
- * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
  * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
@@ -71,7 +70,6 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
 	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
-	XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
-- 
2.51.2

