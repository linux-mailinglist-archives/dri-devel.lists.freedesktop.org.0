Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE0AOL97gGnE8wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:26:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33508CADDB
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE2810E401;
	Mon,  2 Feb 2026 10:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FTaIRIKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013051.outbound.protection.outlook.com
 [40.93.196.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E02210E401;
 Mon,  2 Feb 2026 10:25:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwBEHPKkMDe9SFqzrSsh53rlVfKAuHp9pg2CkcXm6K/Fx6F3nLsWemQqv31efRS2RnIEjZCjtcOVyeYFVWqy5SiMzV9EyxALe8wK2YcjPVgL82w1IUjMaUpxca2Rmxx2GSB9+3IuHl9LyzFgFapTuYvROOsjJwg+MZn8x57TsB8A47wGQLC3gADisGbbq8xFWwbp4p9xS+8ygI6C1Vb3DGe74i40Gy7b1ynBYLUvgVftnS+i1Bn7EVyHQ7uRGWSZvR7JY4lK4F/sIxzoBfNauBZ1un/F+twJ1feknFCckolq2dWBmbv4gY12jVFOkCaFMz2KGaPEnS1drbntTa2SeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhhmpSd9nZaUHDthIlw8BWAr9QRQuEUIZKjFX5+T9ic=;
 b=NPGYymYVJD2u95Nwx/d8e5Ys8jdzJfy2NR+bIWAO6vIu3OsOi1E7HuNoFFPkvG8OYHhcrYPJZM0U9/DwS2olXLEFl6PlPtvSxmEcFAPRhMMk3BSrQlGaNgbPlC9F1QrewwfZ3H+WSfgZfl6yFNsqZo7YfRYrx7uW/L0q7ucw6yoht0afsKavPBdoGTAlXEnkvijyzxCJTEMmkGMATLTOej0Ghj68PZzrCVg5+vYONGZQdP8wpvbVtTE6+SNXR9XRI1Tvd4zv3JRTxi4gmTvwcBMPitlVILfeVq1Bs3mFqu7wa8VfVlfjesHD24MaL9MB9DDxQa76FKzx17FGQt2j/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhhmpSd9nZaUHDthIlw8BWAr9QRQuEUIZKjFX5+T9ic=;
 b=FTaIRIKA6mQ33uwmVFZYzzZlOyOkvhtGBAkH/0ikT7jhaRIL0xz8IG0NqR/V4YaY/rDN/4GsAhvzmha6wWM7s69J3va6HKdjzRi7aaNn6Dz48J68OyyhgDbZqW2nXk4NhaFR0vzxzwW56Fzq09j8O56gFoHalF0qoblX9wbeH+nB3vWF71LFfmdDETZd4zhexEu7TWYpruGzFvilx3tYtHOC+q5qc5KgwwWUVxRLoGdW0wkgmihFiOz70YSR+R85ollEmPh6NWMFkKKYqFIvbR7vdkNNd3IAdrJAosl9doUHYLkL9hafYkDV9br/yKQgIz3utSlNF+sgtErIgFFJFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB8007.namprd12.prod.outlook.com (2603:10b6:510:28e::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 10:25:54 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:25:54 +0000
Date: Mon, 2 Feb 2026 21:25:49 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
 intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-mm@kvack.org, 
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <ymg5yawktqtw7vfgt77iciqzxhjlsnqrwnjx3xmkflbjqbmq5s@jcxzcymqq2af>
References: <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <aX+oUorOWPt1xbgw@lstrano-desk.jf.intel.com>
 <81b9ffa6-7624-4ab0-89b7-5502bc6c711a@nvidia.com>
 <aX/AgHAZ7Tl4iOua@lstrano-desk.jf.intel.com>
 <lbqqmohxpeynsrunbdyvod2fm4tinzq5coueh2mq6weubste5x@y4f5weqvwszg>
 <f48e3d818c6e20d6ea7a7fbd6b1741f25df17a78.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f48e3d818c6e20d6ea7a7fbd6b1741f25df17a78.camel@linux.intel.com>
X-ClientProxiedBy: SY5P282CA0045.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:206::12) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 130e6eae-005e-46b5-a30b-08de62457259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFQxYzYxd25UZlJGRnJDYVhLeXRFQW1SNEplSnZWVi8xMSs1VWd6WGNXOFUw?=
 =?utf-8?B?YTY2cHB0UVVDdUhJUkpITVpDVTBLMWxDUWw0aUJrR3pKaXplV3MvaGxRQTdP?=
 =?utf-8?B?NzcxR0l5MUFCZ0ZISWhUdm1EU0hSOWdHTFlqWEVDRk5ock5tMmFLWlg5U0xK?=
 =?utf-8?B?QVdaM0hJMm5uYkVlZ1dLeFNUUDIrNk85czZVbDc0Ukd6bG5pQ0lEV3FrMmVT?=
 =?utf-8?B?bDNCMHRNQ1IzS0NtdDA4QVk1dGtVZXNmaHpQYnFJamhlTDduTkZacFZxQ1Av?=
 =?utf-8?B?TGIyTG9jdUVIa0thc244Z1RyOHkxUjlRT2JMQ25lWktVTGt4VFJGemd3YmVv?=
 =?utf-8?B?QTVseW92OE5YaFBUNXpzcmlUZ3hRL21sRnZ2VHQxVUVNUW5SWUdmSnFTSGpI?=
 =?utf-8?B?bzBYTXpDQUFTWGIvdEhPQXgzcGgxdFJBdm82YmdHQ08vTXlBd3drVHJuK01Y?=
 =?utf-8?B?Rk1OUmpaajd2V2pNK3VtYWY0bUF5ZGJlQVlPdDBVMzBadk9YTUFkc2c5VEhT?=
 =?utf-8?B?bWtDdjdmczF0WmtQT0hpZ3EvN0tnNTZvdlI5NGQ3bk5KRlJPa1Y2ZG12N0ZD?=
 =?utf-8?B?L0RPSGI0NG03alBreE4vdnFTa2Z1bjFuZndScnVxU3cvZXBZdFBpd1E2ci9J?=
 =?utf-8?B?dlNzZVpxVnZUZUU5UURYKzhkUHNUNmlwMlMyS2IyMnpqdklrc3RLNkUxVXlu?=
 =?utf-8?B?WklQbjVjRzd1bkJjcXU1Q0dVNFhXOElQUFlvQllKa2srUThOcjhvMXk1YUlj?=
 =?utf-8?B?c0RNbHRkaXhBV3pqR3hBK3I5eUk2ZnJBbXhFRUxleUxnUzVLc2R5djJGZ1pU?=
 =?utf-8?B?Y2lzUFYyZDZUUE9hTVFncTV1T2NwUGY3YXNYUlNkMlZ1NGs4WjN1WldReGZh?=
 =?utf-8?B?VWlXZWs4b24wbVR6SXdzdXFacDhlbGFROHl1dmh1R0JDaDZtcitVdnVJaUtE?=
 =?utf-8?B?SG0xTXJZckpXTzh0aVNUbE9sMjAvUnlCQkQwVU5aSXFlb283K2pCQThQSXd6?=
 =?utf-8?B?VEJyN0N5V2d6S3h0M3NKSzZhUXQ2c2VZQ0g2dzZZdzVJeE8ybHFqM2RRSTVR?=
 =?utf-8?B?aFBlVEFPaHJjS01jTTA3RW9aQ09hYzZmaDl0R01jRUo0MWJsaTNneFpyRldv?=
 =?utf-8?B?K3dHcVJpdzdDZ04ycDdBWVhuZ2I2dmRRTTN4VFQxU2hlQjMyOGp3RytvbGlR?=
 =?utf-8?B?OWxUb3dlNGVsTkpYSDl2VVpvM3U3dXdFTEZISGlCTVZJTVYySWhmbTlzRzBv?=
 =?utf-8?B?T2l6L0ZMSmRlUU9nSU9GVWppek9GQjNwLzRsUktJZXB1S2FVNnc0UjZVSDls?=
 =?utf-8?B?RVRYSGVZL1FiSlN4cDM0bnZ0UkJvOUVWT0I1RlBMUTBJL21sdU9vQUVSR1p1?=
 =?utf-8?B?elV0TjhOL29CQVAyU0lySXJTNm9uQmtKTWtKQ1NwcmV0RHdlRC9NUTZaZ0RM?=
 =?utf-8?B?Y016Uzk4S1Z3QlhVWElObk5xTWRHQlZ0L1BWSE02S2hCUW9pMTFGYW91cmxo?=
 =?utf-8?B?bE01QjVxcVROTklmTUc5bXBFcFZZQllDblVDMC9XZzE1YS9mdjN0RWwzTkd4?=
 =?utf-8?B?K2ZqK0x6TlRCV2dHNE8yK3ZJdGR1SDdPRHBKYThUZ2NLTFVMMlVESEhqWFFV?=
 =?utf-8?B?WXdwUEtlblVVTFo0R3RvT3pNK2kzWWhaQi9zdC9xNmhGdHBhQldjNE9YK3V4?=
 =?utf-8?B?dWFBRk5WY0lTWTk5dkRHaVZ1aFhVQ056WUxaZitpcXZveGlFanNJam0vbkpz?=
 =?utf-8?B?REVqNUd1OHhaalc2R2xyaUVFaTZFK3V4b2R3QmZGTXpzblM3MTRVWHUzdDZK?=
 =?utf-8?B?T3ZXS1l6d2tPK2h5V0FGVVBYMkRKZHVGejd5Vkx0NVQ5V05PY1Z5VXZJUDNy?=
 =?utf-8?B?R1o2R25vcjdxNGsvejRmblZUeTI5elRNMjhYaDRnYVdPamcreXRGd1BuTktI?=
 =?utf-8?B?RUlSeFdsQ3RhSStnbWx0Z1dhMWppSkNvMUNkcmlWQml4SkNhajVzb2hGQlhK?=
 =?utf-8?B?aGpkODJJRnMrcFgrNHJQWnNvQmpUQXZxYVd0YkRZcmJvejN3eGhZeVhMQlpn?=
 =?utf-8?B?QUd6Wmp1TVJuNDlqcHgxRFBhVGNwRmdFNHRVT1diUCs3Q3RvV1R3Y01INENI?=
 =?utf-8?Q?eKCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0I2MVRiVXdtVjlFK05sZGw4YVJFaEttWElDdFVqNzhrclFQWFFkb2pJaVN2?=
 =?utf-8?B?aUN2WWtwZnY2Q0c2cStvRDEvSU5NVmFkVVFZRXFEa0tSVUNxYUEvUW9GOUxt?=
 =?utf-8?B?ejlmWklFWGl4UWxVN2RKVHlFMURTR3ZJNnVZa1R2WXU0dWNUVHJheHVKZjZW?=
 =?utf-8?B?Z1BMMEFvUDAyWi85d1dTL0hjTFU0RkhmZVIvSXZ0cjVqTlVQWjQyWTFqUTdm?=
 =?utf-8?B?c0FUZ2FoME8zcUJKU0p5TTlWOFVnNUtkbVJBN1Q2VnlOa2xoS25aYWl1R1Jr?=
 =?utf-8?B?RHRzODhjNE4xMnVpUGNrM2NmRGVmVHNocUNXN2lYYmp5RmYzeG53bERDMFFi?=
 =?utf-8?B?U2tldUVoQ0diQmNXYm1IWHQ1LzMvNkpndis1bENTQVJSK0xxc21WOHhFL01H?=
 =?utf-8?B?SFM1SWJjVlJkbFk4NFRZaTRVM3d0bjVRTUJOZGc2TXNTTXA5V01EUUtuQTNF?=
 =?utf-8?B?d0RJRmZ5bURrbVEvSG1DckdHOUQyZzAwY2JxbGlqMi8wL3E0cGNtRWtIdDdS?=
 =?utf-8?B?aDdZRTdTd1ZIVjBWSkJjaU5yY1dKUmFEeXpzbWJIRXAxL0krejU3ZDk2T2tq?=
 =?utf-8?B?Z1RzelZHREdEcDQySVlOS2cxb1lKdFl3T1QxU0JxV29qTXhHREFnSTNyd0tG?=
 =?utf-8?B?Ti9VK1F3MlpBdGUzQThBTmJkWmdUdkZNalJQRjB4OUNHbHJoV0l2ZzRrTnh1?=
 =?utf-8?B?c2xoVEFnZUVkb0R1MExFeUZnQnZzZ2tBYVc3a1B3NzNpVXBzVDBJajIyZ3c4?=
 =?utf-8?B?VVNlRWFZRkhjRmZPalVnUzRrQS82TjhmNHcxeGpZMHlGMjBwNTBoUXlaL0Nl?=
 =?utf-8?B?aWlsazhUaWM3NnZIc1kzZUdoVndPMVAyU0VISjBoQTNOV1g1T0hDamF1RXN0?=
 =?utf-8?B?Z0dmU2ZrWVJmcmJsNkNHVmRSSGlEMkUxdzlkdnVqaVpueCtxZEV4NEd2R2tC?=
 =?utf-8?B?bCtUcWk5aWVETnppbTJyYXp2VmtwSlM2dnk0U2piZGtPRGE4aENBU2ROZlhD?=
 =?utf-8?B?emNQbXU5Y002dEMzN2x6VXIra2xnVUN5eW5SeWQyT1hrQnVmWFg5eWxIdTIr?=
 =?utf-8?B?OHNYejZ4MS9Xa2l5YUFGVi8vc1hRcXBmcm9JSmlsRVZoaVkxeGw4aXY2cWpk?=
 =?utf-8?B?Ty9kN1hINEFwOG0yalpHenlNV3Vld2hKTzFmUllINUh1UkNNYXdQeU9aZHlr?=
 =?utf-8?B?dW9HaGJTUjVOQ2gxVmphRWpSQzZkdUZSWEV1eGlHUUlEOTJZU0dRby9jbWh4?=
 =?utf-8?B?YTEzNjMyTFNnWmlFT2pwclgrZlcxSHVGTFNjd3VLaWZZOW10U21PQnJ4SVlK?=
 =?utf-8?B?aVNYTGZYaGNTNmJyYjU1Y2l4eForakVxeDg0c3d6MmZqb01RUU41SHNBc2N2?=
 =?utf-8?B?aTBuYUNxRk5tYWYxTkVOVmQvVStaWXFwaVZONE9CdzNsR0d3S1I0aXNTSmE2?=
 =?utf-8?B?cXlKdzNlbFBMdnZaaGkrRzBYWVd0VWt4WDB1b3d0bjRwOGY4cUxuU1pYVVZt?=
 =?utf-8?B?ekY4ODlEOGFITXpveWQ0dDI4bXdsNzBKUWduZ0JVSEs5NllOeUh3SmtabUxn?=
 =?utf-8?B?OGpTVFI4T3hBWEVBYXF5MEdtbk1yekh4ektYSytCU3hTQm5EVlUycUtpVHRH?=
 =?utf-8?B?V2x6aG1HTWltZnR1cTZXakZUUEtuZjdFZDc0Tk1rN2lzdkNmQUN3WW5FdTYx?=
 =?utf-8?B?ZVBZdkg5ZmhqVHhRTjN6RGFhRm1yMXNuY05ncStKSU9JS2tLTnIyR29UR3E3?=
 =?utf-8?B?ZVlROVVHVWwveG5QdllyQkx2ZWxMRENlS0hCWHpSQ054NU02MnkwM2twSVFi?=
 =?utf-8?B?Z2t6UTlKQ091WDlGZFEwU0kzUkkrUEd6anB1RXdmeW5KMDF2TWVZQjdFVjhl?=
 =?utf-8?B?dzNpQ0p6L0pKaXF2NWdpQTR0U3Vyd3BMWnpYSXV1NVZPd0JrVU16MjByUlNn?=
 =?utf-8?B?WlFrSW1lOVV0NklXSkVBRmM1MW02KzVQc3dXZ3JDRlVNOTRQaGx6TnFrSWxk?=
 =?utf-8?B?bnpvMFJXSWNIbVJiVXQ3ZVd5TStVZGRGUjFBaDRNUHQ4dk4wRFkzaFV2TUFj?=
 =?utf-8?B?YnF2a2t6WmhjNFJ3U2VSbHhMb2h3NEJsMUl4SXpBd0c0eWI1eVNYNHd6K1h0?=
 =?utf-8?B?WHVTMWlMMkRzR3U2TzZVVFZ0dlFTTzRkcExLNDVqWkxGK2trZ3RzcnBrRGJv?=
 =?utf-8?B?L1lNU1JIWFQxQ2VudGhJNGY2U1VmSExlRlo5RkQ2SXNadjRlZUp6RTJCcXdH?=
 =?utf-8?B?Ulp2clgrMnJJRERySldVbU5yWDVMNmh4TzVYR3VmbCtRUTI5RCtJNTRRRnZW?=
 =?utf-8?B?M3JvZEtHZlZtMGQwTmNoQ1duMTJZd09qV0ZMNWVwTTNnMzVHZ3dKUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130e6eae-005e-46b5-a30b-08de62457259
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:25:54.5609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKlMrZ/QHomd7HKHk4nojCUrk+E+3/b2PL9WubTYQm2ctCWWEzhGUxy6p0chKRerKCrwcLmM2BIapqD/zQbVVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8007
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 33508CADDB
X-Rspamd-Action: no action

On 2026-02-02 at 20:30 +1100, Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote...
> Hi,
> 
> On Mon, 2026-02-02 at 11:10 +1100, Alistair Popple wrote:
> > On 2026-02-02 at 08:07 +1100, Matthew Brost <matthew.brost@intel.com>
> > wrote...
> > > On Sun, Feb 01, 2026 at 12:48:33PM -0800, John Hubbard wrote:
> > > > On 2/1/26 11:24 AM, Matthew Brost wrote:
> > > > > On Sat, Jan 31, 2026 at 01:42:20PM -0800, John Hubbard wrote:
> > > > > > On 1/31/26 11:00 AM, Matthew Brost wrote:
> > > > > > > On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellström
> > > > > > > wrote:
> > > > > > > > On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
> > > > > > > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > > > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellström
> > > > > > > > > > wrote:
> > > > > > > > > ...
> > > > > > > I’m not convinced the folio refcount has any bearing if we
> > > > > > > can take a
> > > > > > > sleeping lock in do_swap_page, but perhaps I’m missing
> > > > > > > something.
> > 
> > I think the point of the trylock vs. lock is that if you can't
> > immediately
> > lock the page then it's an indication the page is undergoing a
> > migration.
> > In other words there's no point waiting for the lock and then trying
> > to call
> > migrate_to_ram() as the page will have already moved by the time you
> > acquire
> > the lock. Of course that just means you spin faulting until the page
> > finally
> > migrates.
> > 
> > If I'm understanding the problem it sounds like we just want to sleep
> > until the
> > migration is complete, ie. same as the migration entry path. We don't
> > have a
> > device_private_entry_wait() function, but I don't think we need one,
> > see below.
> > 
> > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > index da360a6eb8a4..1e7ccc4a1a6c 100644
> > > > > --- a/mm/memory.c
> > > > > +++ b/mm/memory.c
> > > > > @@ -4652,6 +4652,8 @@ vm_fault_t do_swap_page(struct vm_fault
> > > > > *vmf)
> > > > >                          vmf->page = softleaf_to_page(entry);
> > > > >                          ret =
> > > > > remove_device_exclusive_entry(vmf);
> > > > >                  } else if (softleaf_is_device_private(entry))
> > > > > {
> > > > > +                       struct dev_pagemap *pgmap;
> > > > > +
> > > > >                          if (vmf->flags & FAULT_FLAG_VMA_LOCK)
> > > > > {
> > > > >                                  /*
> > > > >                                   * migrate_to_ram is not yet
> > > > > ready to operate
> > > > > @@ -4670,21 +4672,15 @@ vm_fault_t do_swap_page(struct vm_fault
> > > > > *vmf)
> > > > >                                                          vmf-
> > > > > >orig_pte)))
> > > > >                                  goto unlock;
> > > > > 
> > > > > -                       /*
> > > > > -                        * Get a page reference while we know
> > > > > the page can't be
> > > > > -                        * freed.
> > > > > -                        */
> > > > > -                       if (trylock_page(vmf->page)) {
> > > > > -                               struct dev_pagemap *pgmap;
> > > > > -
> > > > > -                               get_page(vmf->page);
> > 
> > At this point we:
> > 1. Know the page needs to migrate
> > 2. Have the page locked
> > 3. Have a reference on the page
> > 4. Have the PTL locked
> > 
> > Or in other words we have everything we need to install a migration
> > entry,
> > so why not just do that? This thread would then proceed into
> > migrate_to_ram()
> > having already done migrate_vma_collect_pmd() for the faulting page
> > and any
> > other threads would just sleep in the wait on migration entry path
> > until the
> > migration is complete, avoiding the livelock problem the trylock was
> > introduced
> > for in 1afaeb8293c9a.
> > 
> >  - Alistair
> > 
> > > > 
> 
> There will always be a small time between when the page is locked and
> when we can install a migration entry. If the page only has a single
> mapcount, then the PTL lock is held during this time so the issue does
> not occur. But for multiple map-counts we need to release the PTL lock
> in migration to run try_to_migrate(), and before that, the migrate code
> is running lru_add_drain_all() and gets stuck.

Oh right, my solution would be fine for the single mapping case but I hadn't
fully thought through the implications of other threads accessing this for
multiple map-counts. Agree it doesn't solve anything there (the rest of the
threads would still spin on the trylock).

Still we could use a similar solution for waiting on device-private entries as
we do for migration entries. Instead of spinning on the trylock (ie. PG_locked)
we could just wait on it to become unlocked if it's already locked. Would
something like the below completely untested code work? (obviously this is a bit
of hack, to do it properly you'd want to do more than just remove the check from
migration_entry_wait)

---

diff --git a/mm/memory.c b/mm/memory.c
index 2a55edc48a65..3e5e205ee279 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4678,10 +4678,10 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 				pte_unmap_unlock(vmf->pte, vmf->ptl);
 				pgmap = page_pgmap(vmf->page);
 				ret = pgmap->ops->migrate_to_ram(vmf);
-				unlock_page(vmf->page);
 				put_page(vmf->page);
 			} else {
-				pte_unmap_unlock(vmf->pte, vmf->ptl);
+				migration_entry_wait(vma->vm_mm, vmf->pmd,
+						     vmf->address);
 			}
 		} else if (softleaf_is_hwpoison(entry)) {
 			ret = VM_FAULT_HWPOISON;
diff --git a/mm/migrate.c b/mm/migrate.c
index 5169f9717f60..b676daf0f4e8 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -496,8 +496,6 @@ void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
 		goto out;
 
 	entry = softleaf_from_pte(pte);
-	if (!softleaf_is_migration(entry))
-		goto out;
 
 	migration_entry_wait_on_locked(entry, ptl);
 	return;
