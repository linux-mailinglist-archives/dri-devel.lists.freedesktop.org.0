Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C018ED3B052
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D19510E4C8;
	Mon, 19 Jan 2026 16:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="ClbQ5ZoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022103.outbound.protection.outlook.com [52.101.96.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9BA10E4C6;
 Mon, 19 Jan 2026 16:19:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExFTxvPM4SQmRmu0OHyNRKAH4lPmWCuQU2jDP42sfj/9VTqZw4O1przmOliKzvYaFN7kJnluykjUaa2sacuQR2olAg5Lt/pDMnAtgWYir4m6/1rqyVwfk1vjYAZCkJLRaEYwUfUcHZg2sUr29u8h7sBhRBwBekoWaZvBnIA7EYBU8pUwC/D0eEZ7NewWOeqp1h3/793AnhaMgPOPrq2EVy4qh1VaEG/1uZExh9fu8vWYQg9fup0BVeULvkrNtHcie4BqVfftYNu/8G9MeQqpJTGvPVc/Hcd4E1MgeAv9k3gSvEODXKzHPfPMamhI/FM/+Q01FiG7jddZ4KghEPI2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkcuxQy4+EUvIwjlk4+DksDj1E7b2APksFea9mnrQyo=;
 b=CF58Cgqab2gV5mNRXX6Hm2u4ODGR3dLT6Vx0LM9Sgsd5L/BJPaHI3QaS/6X+P2N6f5BEe/VnT9RRZZJKaDvP1jl0GHUcZgPk259dNNtgyuwMQPPZpI+eIKmJpZ109ZUTrdynTptKdh8HqhQ4mOZAA51iyS6+u4mpP3CCBHfE1Py9D+5jvD8DeQ2XTLw6guNexuR3ZsFFPGdcly4qU5UWnU/Xwh8w7bCuqRPCWIg81dlFApiCIEsab6xqL0iPep8plG4m1iVdUx+85iQYv6kHv+oQO+hgaAIKwuRIwfvBdO5GseYsVjvaKrRGBU6GmTSHu5qbT8C5egFnGtMmCyio1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkcuxQy4+EUvIwjlk4+DksDj1E7b2APksFea9mnrQyo=;
 b=ClbQ5ZoTyvEGfHorX19x2lwk5ZEd9l0nAY4Ifb7fLUQ+K3qESUB6s694tT3U/okjU3ATMdylwlv8m6F3wxLuvNWawP6XFZdSvO6vDhKdg8ZdEdA1lVZKggK0lK722ewk6aabtCMRXQxOTNk7Jb9eCGTs6xL3eASygTdPtAX+EP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7972.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:18:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 16:18:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:18:57 +0000
Message-Id: <DFSPA9Q49Q4W.2SUC6IX1II9V2@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 10/10] gpu: nova-core: gsp: use available device
 reference
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-10-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-10-dc7b42586c04@nvidia.com>
X-ClientProxiedBy: LO4P123CA0645.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: d40d06dd-ae0f-42bd-7feb-08de57767339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWJJc2NRUC9VWWYzWjRsZDJNN2hRQ3VvWVdQdTFtdUhsdTdNTFJKRmZXUzBM?=
 =?utf-8?B?bm9Pb0REVGw1L2xuZGprbk9mRmpudm9SOUVKSWtrVERJaWhFNG9jNVYyZXRZ?=
 =?utf-8?B?UFBQZHlzWnRMaWtwOElsM1FORTZ0dHdmVTg1eHJEZGJZREd4SUtXQjdaaG1K?=
 =?utf-8?B?VC9jMlhQeHIybGNmSVk3ejRFR3VNQTRhVjE2MExXdHNIZFhuOUlkTlp3cmlz?=
 =?utf-8?B?c1QzdW11cHhmTUlNVjJzN3FpUVF5b0JlWHlXNWQzM0c5ZldxOHFmS1B5cnMv?=
 =?utf-8?B?eXhTK1FINktzdFQvWE1PL25CekVPaWt3MHFrVnQxdUZiMVdUMEhZY0hSRU9s?=
 =?utf-8?B?WC8rVksyL3Rjd1ZIVGlzcnd3L3BCTkxBbTVwWTVsT2xZQ2NJdzBVZVhNd01r?=
 =?utf-8?B?eDdRR3J1dmtpcXh6emF0eU00bUN3MTYxN2t5NTdCdUNtenBtM21hVU8yd2to?=
 =?utf-8?B?ZVA3UDJkMEQvU0Y5L0hEQ0RxV1o2c1pZenZKd1dBUG5DT3craXRmejBCR1RV?=
 =?utf-8?B?ME1TWUNJWXBsaC8rYldac3ErVHJWTUlvWk83M1FZYnpiUEJlcFkrY1ltYUMy?=
 =?utf-8?B?bnB6T3dtNGNlT2R1NkNjZWRqKzFSempNN1dmT2N6QjlPd2Yra21JeVJKU3Ni?=
 =?utf-8?B?dk1WVy92RC9qNlp4SWVQSDluNXJUdUxRNndzWndQY0FaRTZDcTREUUQ5MjhD?=
 =?utf-8?B?SDV0akpacnVRQmRvcnI4TThKaEJQdmZyRWo3aGp1bUpzU0FFSVd2eHZMUS9N?=
 =?utf-8?B?ZGtoUVFycW1uV1IyTUdtMURuUUFQcnpVRVhOQm1CcjQyblRVQ3daQTR6bGpG?=
 =?utf-8?B?U1JZS0d2RXdUNzh5WUF3ZWc0aXgvVVhNaDB4RDBjMncrbkM3MlFXMC9xR0gx?=
 =?utf-8?B?Tk1adlNQckNLSEhTYkw5Yk9ZWEtNaVgrR1hiS0hvd2paT1dBWEtkOVA3MHBz?=
 =?utf-8?B?cENVLy96Y2U2T0xBODZNOWVZdTdMcldWZVd3VDJrYlF6NkN0TXZVa08wcHlv?=
 =?utf-8?B?Y0R1NTBmc045cjBkYWJvb3RoVW53ME9wMnU5bURYUWFJNjRKMmVIdWxta2lq?=
 =?utf-8?B?NEdIVTFxRFh0ZkVtYy9yV1VnZUo2RWtxdGQyMElkc01UUlVZaktRVnEzWHps?=
 =?utf-8?B?c2hkbVVvd1BQWjN3UmdINjBzczlDemtCK0UwQWh6NFlVVXlKUmdDZGdjSFNQ?=
 =?utf-8?B?T2g4RlR4S0FiVHdjRVg2dk1zNklvV0dEZkl5ck8vM0VlcnhVY0M2RDNFeWN4?=
 =?utf-8?B?SkdHc1VDb3VXN1JoRm9wNTJ2eU5RdVk5c2dJYWgwbElKMlpBeStyNU9xVjhI?=
 =?utf-8?B?RlErV3lNdWpKTUhKSDRTWXRuZnVhVHFXUk5XeGdBK3B2QlJYejlkQUJQdmpL?=
 =?utf-8?B?RHVreEtTZFB6SGJXN0pYVFVnVXpBQ2JhdUtJZkMvWUJrTVF3NXNCMCtPMitH?=
 =?utf-8?B?dSt4UlAyaXB5elo4aGYrY2FTYnJKTnNYVVBpUCt6WTVPWTN3SVd2SFdCMmtU?=
 =?utf-8?B?eEJNQWZEZUVUV2pYNGowbnMwYkFJM1FnT0Z5K3N0Z3lKZWU2MEp4S1R6bldh?=
 =?utf-8?B?ZWNhVXE1aHBTTFJXZWxKdksyM0ZFODFCYWx5N2NqR3pWUEtNQlQ0N1c4eHRO?=
 =?utf-8?B?RHE1RDkwQWR0VGdUUGhNRzlrSk1tMm1PNWlLQkdmZUx1ek5jTWpjWjdMQlB5?=
 =?utf-8?B?TnBWVmh4OXhjZzcwQ3JYdi9SK2xXVFloWGdpUkk1S2xFOThRREZGcVUySDRL?=
 =?utf-8?B?V1YrelNJWWlCaGd6Y3Y3a3dkL3pmcE5oaHg4MHlnODRsazRrSFlXRTBoLytL?=
 =?utf-8?B?NjdJdHJzVEs5TElETXN4c1hsWlpudU5SREc3aWFOUmlhVExnMHRMeDFWNG5H?=
 =?utf-8?B?V2ErczgveDdQb0xZWi9GeW9Pbi9hRGNzanduU2l2NHVpNityUHpUSXV0alJ1?=
 =?utf-8?B?dnMzOFkxTXpmclh3dERNV0hkaXlaQU1XTHdXVVIvSVdOTkliSGduaFA0bG0y?=
 =?utf-8?B?V0ZFaGlTNzJ5cjNSYTRTSzNZcVJ5bmpiQ2tQOVhjTXlWS0VDaW51YmxPYUlk?=
 =?utf-8?B?TmNiQlRzQzRxVmprTW04dFZZUi9xUmtTaDdzaFQyQlJNY3EyTW1hZDlLWlB1?=
 =?utf-8?Q?d8ME=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlU5NjJwT2UzRWtaNXlUaTdSdlhVL1I3WmJYMHY3cFhCMkwraTJMUVUwTytw?=
 =?utf-8?B?UWpoY1pka3M1Q00wMHdiZFVLYk5VUy9mNE1COVlGMlIyRjluWmJPNi9RL0sw?=
 =?utf-8?B?RFk0U1A1QzlJeXZGUHZVUTZBSlY1K3dvSlB5bFh4bGZNdGtoOGU2R2ZEVmk4?=
 =?utf-8?B?MGYyZjlSNGpsNkhDUUxWcTBvYSsrajI5MnJ0bzB4ZlpyWmcvcXBIa1BhRHFQ?=
 =?utf-8?B?MEp0bHovaDFTWkxaV1VKZk9jMGMxWlZHcmlFRWpWT2p6NmdYMlBMdUtXODlG?=
 =?utf-8?B?Z2VTeXFUSTQzaisvR2Z6cmRhTkRzNk5kS2luZUZ1SlB1OFJ2Z0RURlF6MURD?=
 =?utf-8?B?SUtJTjJTUS9TU0RtUENEcFJkZkxVeHBjRHNOZWErUk1zcjVLYWVHUkdBZU5V?=
 =?utf-8?B?anp3cEdkL0NtM0UycEZVNVZYT2FZWWFTTVNXczZpbjNnQkh1NEFnNzhBeEpz?=
 =?utf-8?B?cDhjaFZHRXYveE5PNmlZb0xRTXVPL3pXMTJkbjduMTV3anIzZ2kvM3p0eDFE?=
 =?utf-8?B?WWxORkwzckN3bW5DQ2FqWHdiR3hSY0hHYkxGU2szS1JEZG85Z3lqbjhadG5l?=
 =?utf-8?B?MVRvMVhOem96WW16ZTBIRnN0dmRVVmRTdnVkZFRhTE8za1R1VXNiRWFQMksw?=
 =?utf-8?B?MCtsS3g2bEdHOGU0a1Z2amJ4YUQyZzkvM1l3eEkraDJSUk5USlFjb3hRbGNL?=
 =?utf-8?B?WXVWQmEwN1FsSDhMVW80TDdlRWdGbk1ocEE1TllFTU1HOVAvaGJ4ZGRoOVZt?=
 =?utf-8?B?VWNUK0dKRmZHUERMYlZGMzBDU2FBTnBVamZPdHZoZWFaUCs4aVhXZEZUdEFy?=
 =?utf-8?B?TmVOVHFKNTBDRWtDekJ4S2Z5cmNtQkg0VmN0THJVcHk0VStIaUEzazJEdHVi?=
 =?utf-8?B?QzdGVWczY0Q3Nk15a2ptTVd2UXdIZ3hjbkhRSkZwQjRkc1M2Vk9FQWRlTXRX?=
 =?utf-8?B?eVd2c0t0ZGtLNExmY1Z5L3ZMREVNZXlIRnliSWFuZDc2MXB4MXdzWWxaclF1?=
 =?utf-8?B?UzRIajF4bjNCRDFDRjRHb0ZnaWwyNCtIQURYVk1JZytjcnVFNFgvV3NFTjRv?=
 =?utf-8?B?RjhKLytDTGR4RTJsdGNBK0xHNzdpUmFtaGtKTWRyc0xicWc0eTcvbXNuYU1x?=
 =?utf-8?B?Tk5Cekx6dXhLWTdOeUVFZGFSQ1dlOEN5Zjk0R2tvS0tMQ1crUjZRckRKQmFF?=
 =?utf-8?B?b0dKTWlid2VITm5BRHhLRjBSdEl2RFlDdEdxaVBwVlhRSUpueHM2SHdCeURO?=
 =?utf-8?B?dyszV3U3eGpTNk95VEpHaStDTWlURmhaeWI5QWZFL2hmODFxNldvb0VjcExY?=
 =?utf-8?B?aXlqbWR5dllDRi8rOEg1WEMyUVJXYnp0YmMrZ2hDZms1UVFmL01id3JIdjRL?=
 =?utf-8?B?WkNrd0tTR3lkaUZIdEN6VDNHemVUZFdwWGdyUGxpM3ptUlpSMmE2YzJtbDJB?=
 =?utf-8?B?a0JXeCtTL0huRkI4Y0kxU2NiT3cvQ3RzM3lKdmY0bHkwUTlIWXZ2cWpaRnEx?=
 =?utf-8?B?KzRubHR5VVMzd2tYdWIzbHBiZHBiT0hQTlpDQ3JlRjAzM3JBalZiZmlVb05N?=
 =?utf-8?B?M2RzL3ZOeUNqMExUdXR6UHMzWlZ4WVhBUFpPYXJnN3JqNjBNQVZKYVVEMFd0?=
 =?utf-8?B?bHJ0MG1pN3I4ZjJMQThOQzFnU0tHc2xDeXlCWlhaYXhxMU9iOFBYSlZyclN6?=
 =?utf-8?B?b3Q2eE1sajNxSHpkcWFqOTFpUFA1N2FQbVBWN2c4UWRrVU1QWkowVlpUV1Jl?=
 =?utf-8?B?U0VzUTBiS0Zvd21tWmtsekNtQWwzai84R3FaYzhUNWorM3pqM0xxRkU1cWZL?=
 =?utf-8?B?d0xsb3RBSDNTdDB2LzBvZXNwWjQzTGd3YVo5RWVINXlkZDcrK3hBNTRiMHJR?=
 =?utf-8?B?M0JaNk9NTDJvWHNSbWpIazRpUmhHaml6M0IxNGxLMTVkZ1ZIN1NBTWl3V0FS?=
 =?utf-8?B?bWVraVYvUmw4THVsWWZCdHpHclp1cWR0bmpQMFFhRGU2NkV2RHJFYzJ5ZWY0?=
 =?utf-8?B?WUkrUUpqaWRWY25iWGFuR2w5QndYYzZ0RktMelVtNGpoY0dpT1B3eXdBUW0w?=
 =?utf-8?B?eUl4UlhBU1h6ZVFtNkpwYktsZm1pNk1rM3lYM0tzZU1LdjcyNGlSU0dlS0pI?=
 =?utf-8?B?MTJkVCtaMkZBNytCM3pWTXdTTmlDc01CVTJSbXlmaWJJVEFJbWNkYTR2VEo1?=
 =?utf-8?B?bFdlRENtdlRtMHVBQTl5TFlNbEN3OHNTVHZNVFhvQm5IbjRwM2E1dzRsVEZI?=
 =?utf-8?B?ZnpmM04vbkozRDZ5RWtvZVZhTnNrVmVETldMUHZaV0QySzZKUWlkWGNoZHhW?=
 =?utf-8?B?Y2s3emZiOHNYL3ZNd29zTUZodmo0elpwM0lrOHBIeXErY1lSVGJFdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d40d06dd-ae0f-42bd-7feb-08de57767339
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:18:58.4626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rZUUd5rvtLHmEW1wHl3nBIb616wQf289p/G50zIaBa93Ts/saMSd/ZWSsuiWtgcgssUE88fRV8opdYm8HPqeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7972
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

On Tue Dec 16, 2025 at 4:27 AM GMT, Alexandre Courbot wrote:
> We already have a regular reference to the `Device`, so we don't need to
> repeatedly acquire one in this method.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/boot.rs | 32 +++++++-------------------------
>  1 file changed, 7 insertions(+), 25 deletions(-)

