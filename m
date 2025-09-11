Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3502DB52CAC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 11:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1144810EA54;
	Thu, 11 Sep 2025 09:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bRHEK/35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D12610EA52;
 Thu, 11 Sep 2025 09:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrQdda6znwGZhDtyQ4xA+i3R7pkbEMQQlpPGBSkN94YF9jx4gX9SseMTR78dTb/pOHrVeH3ux/PFBbnmHSWL4YvgtzgkYm+QogEl52QFtSkYhB5ThcwI7eebNAPottz38E3NjGdIlz0ZPDZOgPG+dCzzKjTDsvAnPhNtVXyRlWLhRWW32kN1AAmLD3TzFnoRTuNg/AbX0D+tfjZ88PUCEkEupAawqh1jJiKqab8ZX4lDPoZbLq07u2fsh9j0h5/r9xSMlnMtT/u/WJP28SYEbC/f64bJXYAI+PGu/YdmViuKQH00+iNLdtmKaVAm/5r1SoKwue1zFooA5rRJWtafOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dqPdxBDFE6loLC8n3xCtNYTNMfXGVrkboerY4Nn8Vg=;
 b=RG6gUEssP4ljn61TKBCrLxJXEODKX6rXStIZBxTW9jeOcsnrcs4ljulcWmhYPjl5ospsqvzBKoE4zXRb9JHAC83U5UjR1GXJ2C5kzA/l8te/Crp8jOStkAmgcosBSH1/2nODCZf2V7UKWbrUCEyzMHdYu2K++Owlo/D4Z51HxctD1Awe+nh1xriY8+lq746Pzfrp8NVEj/mPFv5EFErZuvtzZWTuXwFbwE3lWiHitg3JSGr0FwOhX4uV6hkv86SOcL0Zy4hV0syMbGZWsybjjl3p0scsuUPhhmEhtkB2Bb8lIM277+SXsmQmTy9J0eUB/s2sNbU9vD42H6gPzplsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dqPdxBDFE6loLC8n3xCtNYTNMfXGVrkboerY4Nn8Vg=;
 b=bRHEK/35Soj+xydSTvxTgskGZ3qn2hg4N4xiZXyq4MpF8v2bQhldhczR9l6OPvho/deslTk/Te8S5GJpT0+eyc+CXNQVxLR73/3NnZz+sWLV1SN71DoM14GXF3kvVlNYomErNoBsV4plqR8gtHxtg54cEMsKRUUHqGKvD179TOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6155.namprd12.prod.outlook.com (2603:10b6:930:25::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 09:08:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 09:08:51 +0000
Message-ID: <a07e33ac-85f8-4b5e-a700-032d7667cccd@amd.com>
Date: Thu, 11 Sep 2025 11:08:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] PCI: Improve Resizable BAR functions kernel doc
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
References: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
 <20250911075605.5277-5-ilpo.jarvinen@linux.intel.com>
 <97f8d4a7-6897-4fe5-878c-c04a887cce62@amd.com>
 <20c3a5f5-fa15-3889-3f56-20726aa3925b@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20c3a5f5-fa15-3889-3f56-20726aa3925b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 702dbc14-8152-417c-0f72-08ddf112d328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0xONEZQaWJEU3EyV1A1TmZITnI4MEdZN0ZIRUZaZVFaZWo4NGxxN1htSVFq?=
 =?utf-8?B?S3N1YkxLT21CYjlSR3dwcXU2MFFTZWMvQ0liUlNlUnhKNTVjb213S09oUGJt?=
 =?utf-8?B?U2F2Yy9yaUpDRmlMUkFBMTI1NGh1Q3VON2M0Wld4Umg0UjZVVVFFblAwVWZo?=
 =?utf-8?B?RCsyUnFiS2tlWVZKZjRVM1hDeERiRXNSR2J5RENTUDRidXdUb05sMkV0QUJ0?=
 =?utf-8?B?a0tDZWtqR3FBRXYzclRQOEZ4dEVpVFAwWURCWmFzSUY3Ry9BdGZIUi9DamJa?=
 =?utf-8?B?NGdFdWdkSXRSeEdzQ1plYUxXK1BBMk9mSERuak5vYW1sMXd2cGFhUWxDbzdS?=
 =?utf-8?B?amExcGlqc2d0VVFTWFRGOXNhSEoxWXhiMUpxa1pFWXpZOCt1MU1EcEVDNHFN?=
 =?utf-8?B?cjQ1MDdKZnVSM0VlYXk3T255MzV1NERNQ0dkRzRhMW1Tb1FCZGFGOVBqUFc3?=
 =?utf-8?B?eGRXdkZQbEo4dFBWOU4zVXNaeUtrc2pvdnBMUTJVR2hHcmhCUXRPdzNWT3VZ?=
 =?utf-8?B?WUtCSWtIVS9pRVppQ3FCZVNjTGlaSDhVcE5QWW9VV2RLb2NYY3lVcGhlcHFO?=
 =?utf-8?B?SUZzMmtrSjZvczg1ZDRRamZ2cWZSVW5GRUdvQ3c1Wk9LT0pUYTNRM3RtSEJS?=
 =?utf-8?B?SVh5bzdTVnlOUE43YXh3NVhEYmoyOHp6K1gwRkpsR09zcFVMU1NwMWhLYVF1?=
 =?utf-8?B?VVJrQktWWS9VUm5pa1dGczcrZWVtQ1ZKUllWZ1JWTmQxMUhXaGxBNmpPSkQ5?=
 =?utf-8?B?cFJrQlBoQ25YcUtKK3NoekRldTZaMkl2OWF1OUVsdVlZWEl6UkVwZFpUK0RE?=
 =?utf-8?B?bFlTYTk3RkF4QU14OW9mRnlYWG1HeGJFd0RDaDJSU0hlQ205c2NRUXZFMjFu?=
 =?utf-8?B?S0lGamZGVTFoR0lkSnRRV3dWYXBjNXJLNmltWGhFVnF0dVVFZ3pQZTlSSjdH?=
 =?utf-8?B?SmV3T0orS28wWFF0c09zc1doaDlaN3B0Y1N2dTh1M0hlSjdJeEZGNWM4emVJ?=
 =?utf-8?B?TFpuTWZ5amxISmxyQU1rU2Uyb3EySzltQkVudDlyNTdpR3ZMcTdvdm9UeHl0?=
 =?utf-8?B?eGVKRHIvTjRVcnNacnpiN3hPc215Uk5DaTZUekFWV0xob0t0bzV2WWUvYThR?=
 =?utf-8?B?aXN1WlJZYWV4dDRLakdoS3dMeEk3empmcWRDNFhNalBuM1dsZFNGRFlzNDE1?=
 =?utf-8?B?WWtOdThvTlRJbHoySS8xQmZ2cmxBTEl2UVpkT1drYStMYy9FbHE2MHFDQ0h5?=
 =?utf-8?B?aU4xaldXQXJWcUpqUmR6MnNWT2MyNVoyc1lHejBOeXQvOUZOK3ZwMFdhY3hu?=
 =?utf-8?B?WkFhemJoRktuZ2lSUDRMb0FZNHYrTnN2MmEvejBXdTFkUk00SUJKeFBENFVp?=
 =?utf-8?B?VzVFS3JBSmlSdlBLY1YxYjIrYzhoR1RFMGVBZ3hqNEFiWkdGcWNzMmFMU3FM?=
 =?utf-8?B?S2JnOVpWcERpS0VoOUNrK1JYZEd4YkZCWW1sZC93YlhGbkVGKzM5Z3MweitE?=
 =?utf-8?B?Z3NXaDZjWmQwa2xpcmVtNEdGTVQxSEl4dzB5aHJoRFhrdC9hSm9rZzRlRWRn?=
 =?utf-8?B?TFQrQkF5eURWamQ3Z2wvK3d2aEI1YUo2V1BVcU5lb0VJMUtFNWVRT1lVYXFD?=
 =?utf-8?B?REhxLzZacXRJY1BrV1F6WlYrYkxsekV2ZXc5N1BNY29FWFZkQTU4T0ZIZXRU?=
 =?utf-8?B?VU0vTUVldkxIRXk4VWNDMmRXZGNFdU9iMlpkSzVnS1ZxNEdLMDdzcDh0aEo3?=
 =?utf-8?B?UFFFM3AzOUx1alk1MGlJMERlaEJBbCtpcktOdkp6eTA4L2ZiZ2xVWkpvbHlD?=
 =?utf-8?B?OFVFeFlVMFlVWlRPd1hKbFVNUUhRbmRibk40amhLbDYwS0ZXdFRTU2RSb1lE?=
 =?utf-8?B?MWd1OXNQRFBaSW5sRVdSbU53OWd3NzFvWEpJRUh2Mm5yQU91ejYrbFQ4Mkhj?=
 =?utf-8?Q?d9UdirN7DE4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUFhbGppeThkK3ZSQ3BEK2RwN0psdTZiWVJRNmNxSXFxMDFhRDNTYjNESXlw?=
 =?utf-8?B?K2Y3Tld6QmRYdzhxbkxQVTk4bHJ6SFhXSEFzNkZvNVR3TzRNdFd6TWRnL1Uz?=
 =?utf-8?B?a1o4YnhabXoyNnBKbmdCRzlyd2VOUVhFKzcrNlJMa0w1bGVwSVRQYkhDSVFs?=
 =?utf-8?B?Rnc1V1UvYTJmdmJMcTlxM0YwM3dmYk9ZZFVtRHJLbE0rM1RRQThOK2RUSWhF?=
 =?utf-8?B?THd3TGRPMWFheFJSa3U2S1lvYW9uNm11ay9JdWtCbVlpdVh0KzJqdTBGQk5t?=
 =?utf-8?B?RWV2NlN0WEl1b09zeCtIYUoyVDNLSjFoY2pnRmY5R2NkblJjRTNreU5JSTQ5?=
 =?utf-8?B?K3BvTXVvOWFrZDFXK2NIQ2YwenU3MFN3Y3VlNmRENG0zQUlPanhTRjd6QXBF?=
 =?utf-8?B?OFI4N081K1BUZk4rZ05OTVhJR3hBTHdwdXMwSGE1QzZTb3B6SnhoTU00cFc3?=
 =?utf-8?B?T1lSV3ZYTzRhbEc1M2toL3JWZzVvNnRlbE05ZEpTb0twaW5SemJKRWplci9z?=
 =?utf-8?B?QjVaVFlDQng1TjRaR0xJY0U4UEI1aUNabXFzMGc3d1dBdFAydU5aUkVWUERR?=
 =?utf-8?B?aERWZjNGbnUyM0huVjJjR1VDYjVKNVdUb1JxRUR0Y2NwRngwcFJyZmNVbCtx?=
 =?utf-8?B?b1NFcDVxNVVicG1BcWN0SEVMMFhVT2VtNlJjZ2hlZUtQZCtIRFY2T0F5MXBC?=
 =?utf-8?B?QVZBY0ViTjhYOWxFQTAzcWNyU3g2T3pSdC9qSnBrWFhOUXlHeWhUMjU1WXFr?=
 =?utf-8?B?aWJUNi9Ed0MwWUtBWnNBY0U4czM4NEJjZG9yRzZ6NERsM2dzQzdnNEE2dUow?=
 =?utf-8?B?QnRScFFjQ2MzdHA5L3lZclRqWmQ3ZkdCSWVsTXJ6Zkh4SVpoMjFIY21GQ3RP?=
 =?utf-8?B?clp2Q0RUNHhjVlNXTFNvaXZ0d3dvdVlRSzRNV2kwcjRkS1pMak8vYm1aZ0lQ?=
 =?utf-8?B?SjhHOUhuYUNBOU1HWnRpYUFocmlCTHVmbWcyMDk0L0M0WHN5RkwwY21nWjFZ?=
 =?utf-8?B?dndSUFVDQzVpWGhxMnZtQ1c2OFpJSzZJTXN6MGNlbzhSKzVISnZpZEw3dEo5?=
 =?utf-8?B?dXJua3BlRFJtaWVxVHZ0aHI2SitrVXVGTmJBYllLZ3VDQmF2NkltQTRxVEd3?=
 =?utf-8?B?OEQ2K3ZEaEUwaS9HOWZDWlRmZ2FGUmlGVE9sQW80dWRaWSszYUZLejFkbG1U?=
 =?utf-8?B?MURTWGhJT3g3aG5haG5ma0NSRGRFNmdkNVh3NVhjT0MrdE1ESWh3UVpicjZR?=
 =?utf-8?B?bG5JVHFmSW9leUxFM1ZYTklDRHFFV3dnUWdFL3kxbEI5a00zUzljb3h2WnY2?=
 =?utf-8?B?ZUFUeDZ4UHI2K2dXcEs4Rk9OdkJ4NWFHOUNqY0dkVlUwejRibWlqbFBkczlP?=
 =?utf-8?B?bXljYjA3RUI1bU0xMExUbmY1SWc3L1VPQ3lPd2pibjhtWno2QXR1Z1hma1Ir?=
 =?utf-8?B?ZVp3TVFRL2NOd0xQcmtjNC9JYzFlTE1xUWFqc1RaZXAwSEFIMjBwTURyT3h0?=
 =?utf-8?B?QVlLWTJwY2EyUmdvb1J2SFJVUG1paHFtUXZtSWNCSkJiR003ajRUcUVMYkdE?=
 =?utf-8?B?Z09oSHBmRmhoTUxNbE9XcDBwTHVlZW1aMGV5WFpXN21GM005dWJXWmYweVUz?=
 =?utf-8?B?T3ZnRDZaRk84SEppM2U0K21TRnEwdmszR21HelVFU0hvTFJhTnFROWNLcm1U?=
 =?utf-8?B?eUgzcjREa1JQTTIrT3cyOU9QWG9yNFEzSEJzZFBxQ3ZnVzAwYlpoeDJxYXRx?=
 =?utf-8?B?Sk5MMTZZS3Q2K1lTR3RKRkRnVjZnRU1saFNSSjFPTmxVSHcydTFtQisyaXlo?=
 =?utf-8?B?WWhvV0ZjR3laUER4Wk8vc0ZMNXVuZjhqaEtxS05UV0hpRmFGWTAzYzY5TzBt?=
 =?utf-8?B?bGdCcjJ4YS84UUdRUHZMRlM0SWpJVUxFbzlYeml5WDRhR2Y1VEtHQURGYkNz?=
 =?utf-8?B?SDVJVHdnQ3grWVVNMjdKMTJDelpiM1ZHalY2bHAyamZnbmJZVStjeDJyUVU0?=
 =?utf-8?B?YThBNHNLRzRqMVBJVjZNeXBURVRYK0hMeVRCRGRXMm9Rd1BOZnB0amEzR2Fx?=
 =?utf-8?B?TlpwbXk1UGd4bFRkSTR2RGhtdk0rR2ZYNXo5NTJrQWNrTUhBZlE0STVtcFlx?=
 =?utf-8?Q?9PKcip2XCxcu6w6nLnf3MfS+w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 702dbc14-8152-417c-0f72-08ddf112d328
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 09:08:51.3056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MT/cpK4lXkRIZpgJk+pMdy7GI/qrkTXy5M1/qgVZV61nfMzDLlZ0ui4fPNoq1XLB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6155
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

On 11.09.25 10:59, Ilpo Järvinen wrote:
> On Thu, 11 Sep 2025, Christian König wrote:
> 
>> On 11.09.25 09:55, Ilpo Järvinen wrote:
>>> Fix the copy-pasted errors in the Resizable BAR handling functions
>>> kernel doc and generally improve wording choices.
>>>
>>> Fix the formatting errors of the Return: line.
>>>
>>> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>> ---
>>>  drivers/pci/rebar.c | 29 ++++++++++++++++++-----------
>>>  1 file changed, 18 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
>>> index 020ed7a1b3aa..64315dd8b6bb 100644
>>> --- a/drivers/pci/rebar.c
>>> +++ b/drivers/pci/rebar.c
>>> @@ -58,8 +58,9 @@ void pci_rebar_init(struct pci_dev *pdev)
>>>   * @bar: BAR to find
>>>   *
>>>   * Helper to find the position of the ctrl register for a BAR.
>>> - * Returns -ENOTSUPP if resizable BARs are not supported at all.
>>> - * Returns -ENOENT if no ctrl register for the BAR could be found.
>>> + *
>>> + * Return: %-ENOTSUPP if resizable BARs are not supported at all,
>>> + *	   %-ENOENT if no ctrl register for the BAR could be found.
>>>   */
>>>  static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
>>>  {
>>> @@ -92,12 +93,15 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
>>>  }
>>>  
>>>  /**
>>> - * pci_rebar_get_possible_sizes - get possible sizes for BAR
>>> + * pci_rebar_get_possible_sizes - get possible sizes for Resizable BAR
>>>   * @pdev: PCI device
>>>   * @bar: BAR to query
>>>   *
>>>   * Get the possible sizes of a resizable BAR as bitmask defined in the spec
>>> - * (bit 0=1MB, bit 31=128TB). Returns 0 if BAR isn't resizable.
>>> + * (bit 0=1MB, bit 31=128TB).
>>> + *
>>> + * Return: A bitmask of possible sizes (0=1MB, 31=128TB), or %0 if BAR isn't
>>> + *	   resizable.
>>>   */
>>>  u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
>>>  {
>>> @@ -121,12 +125,14 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
>>>  EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
>>>  
>>>  /**
>>> - * pci_rebar_get_current_size - get the current size of a BAR
>>> + * pci_rebar_get_current_size - get the current size of a Resizable BAR
>>>   * @pdev: PCI device
>>> - * @bar: BAR to set size to
>>> + * @bar: BAR to get the size from
>>>   *
>>> - * Read the size of a BAR from the resizable BAR config.
>>> - * Returns size if found or negative error code.
>>> + * Reads the current size of a BAR from the Resizable BAR config.
>>> + *
>>> + * Return: BAR Size if @bar is resizable (bit 0=1MB, bit 31=128TB), or
>>
>> This is a bit misleading since there is no mask returned but rather the 
>> order or in other words which bit of the mask was used. 
> 
> Thanks for noticing this. I'll removed "bit" x2 from it, does that fully 
> address your concern?

That works for me, yes.

Regards,
Christian.

> 

