Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2C0A78C62
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEBC10E740;
	Wed,  2 Apr 2025 10:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITsWM1Lm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2436910E02B;
 Wed,  2 Apr 2025 10:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743589877; x=1775125877;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C4chpCyPg+GsZc7xhYh4WWaB2Evy8tS3+9GkoMKirhE=;
 b=ITsWM1LmufLI0vLePvjPT2mpMWGBYy3Eg3OXZuWXz9raersxwObYhc+2
 E56C4juTh7+j/qd2eyIMJSsBpFIYVZjM8x5EL1TBP8FRsVNscZNOBw0W3
 Zg13Z2PnjIJ9RIoD3IHD1w/18Ry/Qxv3u3D4mg32KjHn4wXVGssxAJfd3
 7XqEBkgRyY3/2E9xq/19W2j1Eta9/qeak64b6dhzj3LcfsCefBb2B0OqM
 zWJzPdrh7TeCeZYbYInaMP30hvc0F1Ut9t66WhxYuKtTzSHQmzYflF2MF
 VOkl99XWhP74KnHeL30PAc8xKt0KhQsg1QL8LeJbtnzUFVA4gds+Lzr2B w==;
X-CSE-ConnectionGUID: 5bumgZSPRfSDHF+CN1Uehg==
X-CSE-MsgGUID: DUaYHuo+TvmfuVknrOMXyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45069498"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="45069498"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:31:13 -0700
X-CSE-ConnectionGUID: WUpQqLpxRyeZlmcSmuWIsQ==
X-CSE-MsgGUID: SD9PfmjNT9W56eukLyRooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="126615613"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 03:31:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 03:31:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 03:31:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 03:31:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQ7pgS5tslDcZ1D9/6+DpLR/qtSkXMhuincZpucbOJmVM0tlrhYjUeEI/Vh3k915ZZkltMA4fH48hBcLALTOiXb5lrKwlUKRdJnlOo9np3iqKep/CURCRGsKm1NJ+PKKK12b46K0lqQcKIrBL2AI6Z2eEy3ue/MGpOmuUmzvsnJeN6kPJ2CrRbSvOQ0zXqHMK10bVyGL17uqOb8vB+Z6d9R6+CArpzNSFYjRWNMrahZdqysUHhTlEVZXUV6Mq7oDB0dbI2A5cnzF3ROUz3kSN6UDP2mMiCB3tfDyHdbPVlJlHWvcokO1mHMFTnkPACXRSFXw7hxbzIRymuCnu5W0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLoh8uhokZ6bcwaCEmmX1hsWiDDd09w9hDsymPVn0f0=;
 b=U6lcOetYhNSV3APFYH7xVtbjce6EQBk+mh6BK95BEkJWoCiBtOY2Z9LBnYgTkU4DoPOukYmLPyMM5oja5xQJQs0kZV+6i3jfw/nTGKggyAdjpdz6sgU4PJefgfkym0GMmujElj6iQtnC/Zj4NoYJSh3fFvSuXLDq9gdZGTLZxGbUIYR6rJ6f67srIPJ3vSiRFVbiMlupAoFtYl50wFwgqrQU6MWDTAKO/W00AQeZN2N4E2ScrLKSRvfziF4fTD7A4XjdJhXfa4NLUaCCVYgkOhjnR5pVpFTO1k6sLk4iliut3hPdGWP6buKNO5o4QVKjhhSVHCKcCWLJjEmiIM9bIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 10:31:10 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 10:31:10 +0000
Date: Wed, 2 Apr 2025 12:31:07 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 4/6] PCI/IOV: Check that VF BAR fits within the
 reservation
Message-ID: <ab3pdsun5a2g3aqquuopr7cghs5trprx4lvbd26mujkp5acabj@e4vaxikjkg2b>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
 <20250320110854.3866284-5-michal.winiarski@intel.com>
 <4959d675-edd8-a296-661c-6a7bd22fbc0d@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4959d675-edd8-a296-661c-6a7bd22fbc0d@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH3PPF4E874A00C:EE_
X-MS-Office365-Filtering-Correlation-Id: e249d1fc-4620-4492-de42-08dd71d17bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzNnaTFWaFpFSzdEQzJXY1NwR1VETC9pNHN6NTh6ekFXbm9JbzJOaFY4cnVE?=
 =?utf-8?B?c0lhRzhUWEJObjM1MS9ycDhkZ0xLbm11WUlHb0g2Zm1YMzU1ZXNxSmZkL2Nh?=
 =?utf-8?B?U0Vvb1FzV0Q5RkxCVVJRTVpRcldKUGNBMVgzenIrWUMrSDJ5ckdnMnA4L0M2?=
 =?utf-8?B?QmRLRWkrNEo4dzNPemhYWDFxWHZHN1JPeWJNVmlHaEZuSCtjT0hPNU9OMzlm?=
 =?utf-8?B?QTlZcmdnVmxVZk1vN2ZBelg3T2YyU3NHa1dSZ0ttZG8rZ28rSk1oeGpHN3BK?=
 =?utf-8?B?Vmw4RU1OV0E1SlJPWnVxMSs1eXZkdmxUNGg5bDZZK01xbUo0eVpkMFNDd1U4?=
 =?utf-8?B?NXk4UEtpSDEyZ1NEN1JsNnpacDRLVjBNRTNVUkIzVGFNUTdpd01EMWlYeG1J?=
 =?utf-8?B?TTVRVGtyN0xtaUhJRkxWQzBRODZ5OFJpdXUzd1Q3eUlDRVdwcWVMWTNZZUkw?=
 =?utf-8?B?ck9KekZKY0tpa3NxL0FFNWhSSVJkdUVFSUdoQnUwZE5nd2ZwbEVQd3dDK2Ro?=
 =?utf-8?B?elF6eGdzYVJUVmlGMFlBQXhGYmlobmpVc05kMFVXdFIwQnRDRGlYNnFIQ3Nl?=
 =?utf-8?B?WWFoZE8yZzc2anBOQytrZkZYTFJJbVhjSjFtbjd0RUxnd3pQTmhSVHFZTDE0?=
 =?utf-8?B?ajhjM2pCQ3lWSjFyVDgyTldTRnpRTlJUMHFXaEtoTE9jUXQ1UHlUTGxCRjhy?=
 =?utf-8?B?NE8xN2EzUks1ZncvUkNBNVF0TWx0RmdoeU50RFZxdHd2TTJxOFRFZnVXMjR6?=
 =?utf-8?B?Y2NJVXhqRG1VODJVcGczQXo1UmdncldJbUdGWGg1MzN2S3dXVmhYMFJWSGxt?=
 =?utf-8?B?TndsOEkzVGZMYm9VWUgyblJJNExNUUpzQmtKclN5bXNkTUJpYmdLR1VUQ0pH?=
 =?utf-8?B?VHVhQlNSeWx0TXkwTjhhMGIzVm8xMlBGNGVRVmFOZUlFeE5mUEg4NDNCOVBN?=
 =?utf-8?B?eDBhU0JTWEZjUnVEMHljRXV4a2xWVnNUZy9aeTZiWVUydjYxSkp2M1NEeDFr?=
 =?utf-8?B?NUpRa2xydlBUM2hwUitITzBFNmxNdXNNV3dqejhXbm9zOHVwZXBsbkYxUmlF?=
 =?utf-8?B?cXp6NVBqSVhZN01wQm9BOFptUjNqQWpwaTVwNUdYRGd0bk81S3g2WUVZakVB?=
 =?utf-8?B?bEp0eTBLMFMzUS8wYndKQUJSQk9ONDBFMWFRV3YzNWRjbnhGS3VIckN0UVoz?=
 =?utf-8?B?Wi90c2N1amtadEFiSDd6SFdPOGJ2NHM5ZlVIOStqbWJDVmIxNzAvQU9TWjZK?=
 =?utf-8?B?SVBibDNXUDI5L0Jvc2pKVlpUejZwaU1ycFc3T0EybERDUXQ5T3o2S2xzRVRM?=
 =?utf-8?B?MGhHR3lCaW5EL1crdGFuNXNOdHZkS2FzNlBLRDUvY09UN3hKRE5DMWNEZW92?=
 =?utf-8?B?RkYvV2tkQ2xkU3ZueE9LdDB5eCtOWHp3dU1GYnkwczFhb2F3bmc4MGR3UlN0?=
 =?utf-8?B?dlhCUzZHcjRCL3ZJcjEyaGo1Mm96ODlIaGFLZG54d3JtdjBJUHFVQWRqdzU2?=
 =?utf-8?B?ZEJ2Y1FScFZsM0lUVU9xdERISWs4OSt3S3V6Q0grNXlad29YeTRkajBFSzJv?=
 =?utf-8?B?bDAzRWZPa1VlWVRPVi9GUVZqMUtDUmdtRHR6NTI4eTZYaFZKbmc4cGJ1Nnha?=
 =?utf-8?B?ZVdYN2JGM2ZxN1VuWSt0Y01VVmJMOUwvWllnZHVTbjdDSzdXNHJPQ3UrU0Fv?=
 =?utf-8?B?cnpHek04bm02aHpQaGR5N0UxMTh6OGNwbVNveC9RZ1ppd1VJdUdiNE53K2kw?=
 =?utf-8?B?bXJxSUovbEYvalFJV1g1WjhIYlVaSW9rM2lZQTlJWFkzdjNEZmJsOGhPeHY1?=
 =?utf-8?B?dVJJMGRkNlF4MWNJcllUbzg3OG9weWVzcDJ2aERQYTZKTFo1SjhtL0loTlpV?=
 =?utf-8?Q?vLKiyaAmv5SuT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHA4b2xjZWZTZjQ5SUdUcFAvTXZRWDNUTldCUk95SFQ1OVFPVWt3V0VXeU1y?=
 =?utf-8?B?dzVQekNpMUJRSU4zcTVDb0NTYm9qTXgvT3oyWGR1OWpFYjVaVTYxM3pPY09l?=
 =?utf-8?B?c3NEYXI5Sm1tdGNyZ1NENk1NQkpUcVNWTSsxYWplNjhkOTNyWlJwZ0Fmb2to?=
 =?utf-8?B?WWhzcUtmR0ovQ0sxQzBpQmF4SGtHSGxVanYxRUdja0hncnJxaGNFclBEeXla?=
 =?utf-8?B?RDlLNUVFMXJPeGFpdzR6bG9mUERXMloveUI0SjUwMzA4dTdsMk84Zy9SZzJR?=
 =?utf-8?B?a2pRN3hJc1RyTDhmNDlZajVIYjZ0b2J3VTFrK0QzYnVEcWRGL1I5N2l4akJt?=
 =?utf-8?B?Ui9idmlSSTV1TE45Qm90WkxYOE1GdXp0b0xReUZPMUJNOE16eTYvVVhZY3BG?=
 =?utf-8?B?SmYwVjJNZlRETDE3eWFvYmNxeGI2STNadHpqbEhzM1pWbkFKdUFRdU5vTVBr?=
 =?utf-8?B?Q21STGo0YzBJVS8ySlFFSlpmZFVIbm1DbFhFOFlBb2VQbUl3bzc3bGkxL3Qw?=
 =?utf-8?B?Y1BxdmRXbXFHb2JaN09ZbjVETENpVlp3MmF1VUlPT1F5dUVCazhoOFR1ZXho?=
 =?utf-8?B?ejA0ck9hNlU3enlGcnBlQW96amdHVSthaXRscWdnMzEyRk5IblJXQXcxLzNX?=
 =?utf-8?B?ZzB3Tnd6WXJJVHJLK012L2ttWWlTZ3IwMnNJMTRaTXUwNjhKUk5qV3N1MkpG?=
 =?utf-8?B?VkMvR0pNSEx0YUFwUGtLZUsyUmVtZTBBcjc4SzZoMDcyaCt1Zng3THV2b1Nz?=
 =?utf-8?B?NG8wdXVkOCs3NU5RbGhObS8yNFYvb0doZVNMNFhSMVpXaEtuOXZudFJLa0x0?=
 =?utf-8?B?S3VIbFluOFZMaFVYbC9UT3RmMUFXZHN2OWlxVlU2WWFWVEs0SlA2dXhRWTM3?=
 =?utf-8?B?WXZVNG54MGl5eC9RbW5CTkR3OVJ5c3NzWlZHb015VWRTeGJXWXZDN2cyajBI?=
 =?utf-8?B?VGhsN0NzdWMrNVVPNlBXcEpwemhXNWgwcWJNamQ2Rk92OHZKWElOMW9kdjl0?=
 =?utf-8?B?QkN6bHFWMkkvL0l6d0JkZXNMNmgweXBMdlptTUNBa1NoV2FJak5FSHhCWElk?=
 =?utf-8?B?S0xmcmhlU0lKVzBFc2Y0dW5xWS93MS9zWkxKbzRYTmtMbWk2VkhHalY1dGla?=
 =?utf-8?B?WEQ5YVYwZGFpWHkwS0I3ZFNYWWdoMmQ2aDdmRVYyRFlqUFZiZlA5S0pRVmpU?=
 =?utf-8?B?Vk9lMmd6ZXN4d1o2cWVML3V2NDVhazBLR0tGTUg5RjBac1BSRzRxdVdsNTV4?=
 =?utf-8?B?TElwOXVQdGVrMjJGelhjbm8xYU9mTW9kSVlJK0FrYjhzcEJIdVpsREhRNUNt?=
 =?utf-8?B?MGdwV3VraFg4Sy9OZEFOZVB4UXBHZWdRVVdlckRyY0VrYTN5N1hMK1R1bzdF?=
 =?utf-8?B?QTlRWHJJS2FVMUhLbTVGWGlScjBSakQzQmpzWFVQWXU3MEt4U0JLeFpFSll6?=
 =?utf-8?B?V2JkcmhZK2dZRHIwZzRpNUFaZzUwbnhuMWdZdUpDOW4zQy96U3AwUTZzMndM?=
 =?utf-8?B?UTVCTXJBNWVlZk5oNkw4Smc2ZFJ3ZGw3Vzd2akFnL3hYN3ZIKzRJOXNrVjdB?=
 =?utf-8?B?UXZzRUwrYmgvZFA0V1ZRTWtBaTNCSDBUQmZlSFQ5YVdtNG55MEpvUkRkTkg0?=
 =?utf-8?B?RUcwalQyRitJY1NsaERSUXJhY0FuR0hJSFNjckpaUUJPN2FWd3BWOFJ6aGJz?=
 =?utf-8?B?dzMvelUwSWJma2dYdTAveUp4V1U2enU2N3p3WFRVK3NmeTNLZGJHU3Uvelp2?=
 =?utf-8?B?akgwWFhZZXFZUkFIVVZ4TFo1UDZqOWgwQTgyVXl6THVjNmNrbVhOb3QvVnhJ?=
 =?utf-8?B?Y3RRa1VNNnhmOG1rUXFqcGRqQm50MGVkRCtZekxLa1Q0U1dJUnBQUlAvUGhK?=
 =?utf-8?B?c2pWczI2LzhnSG1GUXJaSVlRKy95VHVab09kQXMwbzJvaGw2bGlRd01uaWp1?=
 =?utf-8?B?dXVEUDVnSHdLSWU0S3hyT3JJQzZrUGZDaHYwcVA0NERvWTVrY01LTjNYYkVh?=
 =?utf-8?B?NVdwbjlCcm1zS0hBMHRxTTlFbnJnSmxYU0tDK2lacS8yelJwdWw4ZGl3eFB6?=
 =?utf-8?B?VTU5NkZLQ1FvQnJZaWJPaDcwdTQ4bUtOcWFLemNHSVhISzB4L2RYSWFTSmoy?=
 =?utf-8?B?dThCR0ZHbTFIaUVvcVlNMmtIWTRZWSt3Qk5ka3ZhNCtRMStNK0lObE5KL1k2?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e249d1fc-4620-4492-de42-08dd71d17bfa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:31:10.1367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvKKVE/OB5aj6crwPYVr6Lh/sYHsZSdCw8QTtN5KO7zgtD4WXx1sMRAglTMPWq4AEQq/v9gc6adwi//cJU2+O5KmpqUjMKJf8EwnCwXs3FM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4E874A00C
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

On Wed, Mar 26, 2025 at 05:11:04PM +0200, Ilpo Järvinen wrote:
> On Thu, 20 Mar 2025, Michał Winiarski wrote:
> 
> > When the resource representing VF MMIO BAR reservation is created, its
> > size is always large enough to accommodate the BAR of all SR-IOV Virtual
> > Functions that can potentially be created (total VFs). If for whatever
> > reason it's not possible to accommodate all VFs - the resource is not
> > assigned and no VFs can be created.
> > 
> > The following patch will allow VF BAR size to be modified by drivers at
> 
> "The following patch" sounds to be like you're referring to patch that 
> follows this description, ie., the patch below. "An upcoming change" is 
> alternative that doesn't suffer from the same problem.

Ok.

> 
> > a later point in time, which means that the check for resource
> > assignment is no longer sufficient.
> > 
> > Add an additional check that verifies that VF BAR for all enabled VFs
> > fits within the underlying reservation resource.
> 
> So this does not solve the case where the initial size was too large to 
> fix and such VF BARs remain unassigned, right?

Right - and in my opinion VF enabling is not the right point in time to
try and salvage the PF resource resevation.

-Michał

> 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/pci/iov.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index cbf335725d4fb..861273ad9a580 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -646,8 +646,13 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
> >  
> >  	nres = 0;
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > +		resource_size_t vf_bar_sz =
> > +			pci_iov_resource_size(dev,
> > +					      pci_resource_num_from_vf_bar(i));
> 
> Please add int idx = pci_resource_num_from_vf_bar(i);
> 
> >  		bars |= (1 << pci_resource_num_from_vf_bar(i));
> >  		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
> > +		if (vf_bar_sz * nr_virtfn > resource_size(res))
> > +			continue;
> 
> Not directly related to this patch, I suspect this could actually try to 
> assign an unassigned resource by doing something like this (perhaps in own 
> patch, it doesn't even need to be part of this series but can be sent 
> later if you find the suggestion useful):
> 
> 		/* Retry assignment if the initial size didn't fit */
> 		if (!res->parent && pci_assign_resource(res, idx))
> 			continue;
> 
> Although I suspect reset_resource() might have been called for the 
> resource and IIRC it breaks the resource somehow but it could have been 
> that IOV resources can be resummoned from that state though thanks to 
> their size not being stored into the resource itself but comes from iov 
> structures.
> 
> >  		if (res->parent)
> >  			nres++;
> >  	}
> > 
> 
> -- 
>  i.

