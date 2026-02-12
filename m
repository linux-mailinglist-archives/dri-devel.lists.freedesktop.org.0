Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNsKAryOjWl54QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:26:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA79B12B435
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1D310E6F5;
	Thu, 12 Feb 2026 08:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nD7rAX65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013050.outbound.protection.outlook.com
 [40.107.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D97A10E6F5;
 Thu, 12 Feb 2026 08:26:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AO2OFkM6XzPxnZwbvorg3tnTjo4ZlQ7TxrPtCKyjIXmaDUkGcxyOx+g1ryTIpQnZFLfZs33aQOBq+Wxg3SYdZY77Ga1Qmaz/2AwlDZlVryTbSjz0YgshcanG1OdK8UQ9qctK7tqEMku6AnrGpAdQc0d6cov8C7A6bBv7NAOI/dqnvRR7t4tdMryZ9PY3atIk21s3Ay7TK5sm1tdOf84e55rRh8JGqBW/HQHFAQmoNJraHX6cnUCHO1SF9/xgEdhHP3LRd1npqMP56ekOdcf6mHpcjtmg95OY5hmhyQWlmc9noLqx0Fe0Z/TXymNmWT9oTujxfFTp9HfgqHAQu2JRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90m5jPhxtCWUXiCfhay7QaOlQ8SICoxGQ7mFzD8NTpY=;
 b=CeDi+s1dq1hNJkjuicT0DFW+L9MY+KAMltgvkC82leEnbDz5/CUA5M+vfHK63p6zsnqOoID+WgjVnHlFKxXH2CYw2GCqcGgh6bRrA/hnPq0J7bQRcycRUL0uHRyixho8vc0Z9xZyBYBKJBjb1IWtr+t5a6umB6PrsrFEKkJEEthxOa3qe9ABacm8pFk4Y59up2WT/PoFUKLa+yWOzkoJ+a0B0dq98bM8YuDj8ZRDfJi4j5b6jvoFxYe2oJx/1UUa1KzNAfOViF0ql/DvLEBwSpDso2/iQn2CCaYxZUBT0DbkT2XdViMQZoziUrV/xv7dQ3YQVEhuBgNQE+zPwpdEAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90m5jPhxtCWUXiCfhay7QaOlQ8SICoxGQ7mFzD8NTpY=;
 b=nD7rAX65CQSghJZdjFew/7nx4WbiTO5U9mqbKkqyv8nhpyE2oO+owRidgsulPecWJyAsOTHXg3rTEtdDF2FbvZ3UqiFWvuj5ycYDHXLqitLsmFjBcI/zGe9G0AV5UUlNpgpQ5ZYFaRgHsJh1Slj1c/MaOjiJ6RoXmQzkZX2tG5S2ZX7j30TEHmOva5ueqw8lfmFL34Cjj6zLAbKLZMtGx73/obddjVyUPaYxxOjPp7eSkC89T6ao5NVOyRevS6lt5FTMxV6czuMlgCe5m676U/oyFv5GNDEWjdmddmQ5xW2g38GLJhrw8XAfz/iJxaMpMrs/LLZ09trAi+g5Qy7pgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 08:26:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:26:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Feb 2026 17:26:18 +0900
Subject: [PATCH v9 1/9] gpu: nova-core: falcon: rename load parameters to
 reflect DMA dependency
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-turing_prep-v9-1-238520ad8799@nvidia.com>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0071.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c9c55f-f1ea-4342-7759-08de6a106aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFA1SlZTY0JUUkpTZUhaTE1vcVlCTEgvQ0tOSXE3ckdvWjd2Wm50QjY4cDha?=
 =?utf-8?B?OWpRa1A3L3ZlM0hpMjFHMVlwRmJqYVJ1aldLbGtJbVpSOFVjU1U2ZkhSWFEy?=
 =?utf-8?B?OEJKT3dvVHp3ajJ5M3VjZWpmRnN2aU9na05xR1BFVGNQcVVEQUwyaU9zSW5Q?=
 =?utf-8?B?QmJ4OTJsVTQ4Z1l0Vjl3ZGdGWUlhR1dJV01HV3ZlS2gxVDNLQU5qcUxjQUFv?=
 =?utf-8?B?dklFWmxaR1lWWHdDSjBCdi84Q1pFaXo5NWI0eFN2MmRQRWtHM3VSVnhqdTVJ?=
 =?utf-8?B?QnlXWjRmYlA5cVZ5Y0w2d0tWZnpPV093OG1xSDQza3UyWlNzWFFGR0x4ajNr?=
 =?utf-8?B?a1ZxMzJ2ZmZvQ2llTTJ4dGJOMVVOYWt5SjZWYm1WQytIMEpvck1ZUElmMzdi?=
 =?utf-8?B?NWlRZXoyb083MEpyanNTRkw5N2h4c1BUTnUzdkw4UmR6eHo4VnBMa3lLc0xj?=
 =?utf-8?B?OUdwS1g4L1FSQnRZZ084QlZadzdiSDBPK2s2ZVdmb3Yxb0JPNlloV0VSLzFZ?=
 =?utf-8?B?WFBtV0hsZUhGeDdudnU3NHEyNW8xSXVLazBsbEszdHdELzJUTzhOUk1MdjJj?=
 =?utf-8?B?K2piMjIxelc3MzlMTkdRdGZhQWJsdmFmNEV0YzdjTVI5c3g3cFNKOXVTTjh3?=
 =?utf-8?B?ZGg5R2JDaXdRUkd5dG9zTWVOaW05cUxQNHdqM1ZWTEk1TzdMVDFLUmdnb2tY?=
 =?utf-8?B?WXRNZXRxS3JESzl6cTN2UUN1Z1NNUmRManpaUnJOejlpYmlGQXNuTXdPT0Jt?=
 =?utf-8?B?SjltWHh2dW9zTUlDWXVDUGxIRUNOcWhOU2I5WjljZUl4cHBwUkRjMzEvRFBL?=
 =?utf-8?B?dVdUZkNZem5lWVRTZG4yWE5Lb0ZLeUFmV3JZTGZyQzBWQXlUZDBkRjE5Q1lz?=
 =?utf-8?B?QkZBemloRkJxTi9LM09XQTFoUXJzWjkyVWVjdWdTTnFBU3UvZ25IVHBkUEhw?=
 =?utf-8?B?M3FIT0U2VThDRlJpYm1rMnc0bGY3VDFXM2RrdGlQcnZEZTY4OW9UVnhVWGdq?=
 =?utf-8?B?dnJ3aWg2enJCMjRkS0hnaUtiOG9qV0d4amowNkRuYUFVNVgyK3Z0b21mTTNr?=
 =?utf-8?B?Wm80OHVILzNubVNjZmVldjNJUytuVHpVbnJ6ZVByVGxZbFpPS1h2UHZQa2pE?=
 =?utf-8?B?T0FoS1FzenJqVVl3dlErcVJUSnlSQWFMVjdsL3dOMkovNE9UNjIxNmtZbkZa?=
 =?utf-8?B?WXhSWmNQRjdWUnRoNHFwSFRWcVZOQTlzUmZDTjI0b1BuZGtrSVdlTW9aa2ZX?=
 =?utf-8?B?SGZCSzZRYVcyd3YvTW5IemRwcU4zM3l0aFRwSldtVlZCMGRoZWdrYmJCSXJS?=
 =?utf-8?B?TXZTVmJZRzBiOHdSbm9PM3owRWZHbHRlaTYzYjAxb2xoSzFwTlA2dWxKNnlS?=
 =?utf-8?B?eVJCS1J1TWtXZTRmOUd4VEd4Q3RLQWFGa2drRkR1d3FEaFVvRktuM0hGclVG?=
 =?utf-8?B?aHk1TnJTY0p3cWlFVDhMd2F6ZWFpc3owb2IxOXpTT3FhcGppNzZ0cEFpOTdU?=
 =?utf-8?B?VmxBY1pNSHVMSGlWNTF3c3krYmZRdUtJQXNKVEVXQXFpeTY3Q3JHVHZHb3Jk?=
 =?utf-8?B?QzlKNWc3b0huQ284N3VjM1ZMZnhqSEd3RFZGSjJzV3o0WFFHWjVRenpHRWhi?=
 =?utf-8?B?RnkvdmR5R2pYQktnSjVzZ2RTUDlBL3VxTWpTNW1iek1peTAzcTFMY1o3dUVw?=
 =?utf-8?B?ZE42RzBFdzluZmZqMXBvbUdZK2lhU1ZpbzdpcitndDl0TTIxTUlqcUFtRGlS?=
 =?utf-8?B?ZnRTalVadlE2azFDM2dUZlZjdG0vL3BWeVJhQmsrS1h0eXh1cnkxVXhPRTF2?=
 =?utf-8?B?NGNCT1ZrOXFxOGF0SGovOVRCZzhMRmo4b0liQkxmNkwzYVQzaHd5c3draEJP?=
 =?utf-8?B?OWxBQ0MzZGlYWEIzSGhLSzBYYW1ZR1JGY0xQWjg1SGtBaXFldG9zTUxDVnJR?=
 =?utf-8?B?MGNzeFlib01Lc0FhQVg4YzllSjhoOW54MzlwQUxxUEdFeTE2R0pFclZYa0VG?=
 =?utf-8?B?MTRuV2dRMExJVzFLRTdYNEt6cnZWQ3RNa0paRDNGZjR0RUVENnpBVU5tTWFO?=
 =?utf-8?B?VEFkMEtQWUlXTlRXalIvM3pMUkl2RCtOTlYzb1I4QVJZLytibjgwZzBFY3BJ?=
 =?utf-8?Q?H2AQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGtoeW9ZK0VUK095RmlIeG5peW5VemthRE40Y2NxaFVoalBFdXpHaEZUK1pU?=
 =?utf-8?B?VHBwNHpPZVRnOHNBanhhbSs3SFVvWGpNS2VZem05VUljZGJuVTdJbHpiK3Jl?=
 =?utf-8?B?YjA2K1RSNkx0emUvbUpUTWdSOEZSaWxjVkwrR2dhVXJDWjU1NGRNUm9oM1Yv?=
 =?utf-8?B?UEJRVlRDY04vVitMTmNEbjZCRFJjL0h6OGNxaW9GK2I2b0wvZkRiSk83ZXdn?=
 =?utf-8?B?MVMvbzRHVENpUjU3UkRZMEJ3ckM1ZHdhZFpyY3RWd1JIeXZ5UG41bGlBK1c1?=
 =?utf-8?B?WlJUSWtLY0JRZzVlVHQxZTZZTmpHWWFsN2t2YzJMR01xa0xUa2hUd0pvZml2?=
 =?utf-8?B?aTRBcUdyNEs4Mm9aclJ4ajF0L3RMZGhzSTkxczlaOWppUjc1a2NySjU3SGZh?=
 =?utf-8?B?VUlUaHhwVUhIb2ZGVHhhNm1vT3ZlS0tmT1lJVDFKWDl6TjVBazNXOTJLdnRH?=
 =?utf-8?B?VmN4OCtONEZvK3lXa1ZhYTVpRUkzclFzVmRkVzJVaEJpYXFoVzhwZjliWkF0?=
 =?utf-8?B?OEdDRFVabXRPbVU3dzc2U2xhdlEzZGpBZmRJdTJuVC9PNHo4alVFWTNQZmlP?=
 =?utf-8?B?dGlINGdycTYzOWNkcHZBOTZKN0RjY0lzeXJoM01oN210TnNGUktqN0pncUxZ?=
 =?utf-8?B?b1NvWVZMbDNmS2VhMm9sOWNiaU9JWUVROGtocXBuUzJmMWFpQ0o0UEFmdlVB?=
 =?utf-8?B?YXc1WkFSM1NIRjJMYkFNcnZBWE5hZnlISWhyMVhYelV1ZUI1MW9zR3Rmc2hJ?=
 =?utf-8?B?VWdiT3dzRmpIQTBhMW95cHlRNnlwR01BWlk2b0N1amZpQ2doM0RCMnByL2dW?=
 =?utf-8?B?dXBTekkrTFFkWFRsaGpLUHVUZ0h3NHpjMDVzSU9keTIxZzJ1QXM3WENwVnhD?=
 =?utf-8?B?eVNmREhNTE5lc1phbCt2QjNNYU9GUkZua3hIYjNYOFVhdXBRQlp4Qm4yYUlm?=
 =?utf-8?B?Vk41Mi9TY1BZaGhEbGtVRldkcms3RXBobkQ1YWd0dGZZNU1aZXUydkNjbDI2?=
 =?utf-8?B?NTcrNFYwOEd0MFlBQWZzYWI0UExReFRkOExSdm9GUXRmOHo2U0toa2pQVFR2?=
 =?utf-8?B?allHWk15N3R6aUF2clk4OXEwV2RJZzNvY005RG5QN3NUSWttbXJzWUlpTnpW?=
 =?utf-8?B?UVBIWk9zeWFEVjVSMGgvbS8xR0huallKRFBpN3N1bGx0ZHdNb3VCeTdjMTBt?=
 =?utf-8?B?U2RUN0VDSnRLeWV6dWk1VWFpazZ0b0ZneVRwQ3FDemFEWEIvUlMzNWFtOHUz?=
 =?utf-8?B?Y0hUdmY3b2swSkMwNVI1UGxldHdkUEtDVjZyZ0ljOWdGK1l6WnExVGtCQk1w?=
 =?utf-8?B?KzQvVXZpWkloYkxaNXdMN2VXRXJoVHR6QUZaVURsQTg2ZlBYZjFoZGJnT01R?=
 =?utf-8?B?NU42UGVPdDhIK1dSWWNnaThGTXV2cDh1a1RkTEhURVo4dzdIUGVVRHg1WW9V?=
 =?utf-8?B?cUtQdzh3ZGdoMnJpdWNZYWdVbFVvVDBwVk0xMEt6N0hwQ3dBL0NiYlNacUJH?=
 =?utf-8?B?S2Q2RjlEaWVkbCtIcHZXdFhWZGxCZzBKNGJ3eWxPdSs4S3ZPSyt0OEdWQks5?=
 =?utf-8?B?TTdKVnZtSzRwdEcxL3N2YTJQN1ArSVFFSW16QzJCQnlITmxPbGRIaTVOMmxV?=
 =?utf-8?B?QjNJUGs1OWxGVDZzKzJPMVJmenp3TW45cXkvYWRnWHdQYjJmcGZkVkx4ajBv?=
 =?utf-8?B?Wi9VcTRGdVJrVkQ2aC9oMGNUZkc1ekZLY3lZcmJyN051a3Z2SHZ6MWxKNU1O?=
 =?utf-8?B?OHRpQzJod3RPKy9VaHo1QXlmK2t6encvNHhOU2FHOFlPVVQrSDY2YmQ3RGUw?=
 =?utf-8?B?dnNRcms5MnpsTWpmQ3lhQVM0Y016aEEyb2dCOUhIVmRlMG8wNlNjZkwyVThr?=
 =?utf-8?B?dy9XTjI4L0FhOUhpZUExZWJET3ZDWkxPOHB2S2ZWak83OHV3QXhOU3RtTHRS?=
 =?utf-8?B?RVc1TDRhV255N1JiVU4yTERUcUlBVjBjaFZDOTJSWGJKVHVSeTFKanBGQ1hX?=
 =?utf-8?B?dkplSXRyaTNIb1dGUXRWelptWGtyWnI0OUQ4Zjd1NU1BUytzRytheU5sVlQ2?=
 =?utf-8?B?WGN0MDR1cHk3MThGSW5ZNVgvOHpGY0hGWEZOYWhwZzhzelU2NEt4b0w4K214?=
 =?utf-8?B?ZnJtNHN1MHFRMEcxdEx2dW82NnJXaWlVZmoycDY3eXJCNlF1cU1LQTlIVmZK?=
 =?utf-8?B?Vi82RDJsbXg5MFRmdTluQndkRjk1OUNDOCtId0wxRVJzT2Jzc3pUL2U2VzN5?=
 =?utf-8?B?RUlmZVdsNjAwTkhHTzB0VGxzWGE0VG50UytBTjY2bmt3QlNZSGdZOEVKQW0y?=
 =?utf-8?B?bmRwVGN1aFlHSVhGcVVTZXNLdFk2c2dIYlV4SzlKMVMxZVFUbXJicUpWaVox?=
 =?utf-8?Q?gWOoofQ6LZYLCzy1/sYd8I/+T/7iw6a+JZf44QJUI4JlY?=
X-MS-Exchange-AntiSpam-MessageData-1: qjaWTUbpH3DYhg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c9c55f-f1ea-4342-7759-08de6a106aa1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:26:27.7280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUfQ7B/UFq4UG2kTVQEnbwzwoFS+6k12SuJusVEdaLRncWU/GE1Kq586Uf0fR1zibqGKlCym6D6rsrDTqN3+JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: AA79B12B435
X-Rspamd-Action: no action

The current `FalconLoadParams` and `FalconLoadTarget` types are fit for
DMA loading, but are going to fall short for PIO loading. Start by
renaming them to something that indicates that they are indeed
DMA-related, and group their declarations together as we are about to
introduce equivalent types for PIO.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 37 ++++++++++++++++----------------
 drivers/gpu/nova-core/firmware.rs        | 30 +++++++++++++-------------
 drivers/gpu/nova-core/firmware/booter.rs | 24 ++++++++++-----------
 drivers/gpu/nova-core/firmware/fwsec.rs  | 12 +++++------
 4 files changed, 52 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37bfee1d0949..85918a03b37c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -327,17 +327,6 @@ pub(crate) trait FalconEngine:
     const ID: Self;
 }
 
-/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
-#[derive(Debug, Clone)]
-pub(crate) struct FalconLoadTarget {
-    /// Offset from the start of the source object to copy from.
-    pub(crate) src_start: u32,
-    /// Offset from the start of the destination memory to copy into.
-    pub(crate) dst_start: u32,
-    /// Number of bytes to copy.
-    pub(crate) len: u32,
-}
-
 /// Parameters for the falcon boot ROM.
 #[derive(Debug, Clone)]
 pub(crate) struct FalconBromParams {
@@ -349,17 +338,29 @@ pub(crate) struct FalconBromParams {
     pub(crate) ucode_id: u8,
 }
 
-/// Trait for providing load parameters of falcon firmwares.
-pub(crate) trait FalconLoadParams {
+/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM)
+/// using DMA.
+#[derive(Debug, Clone)]
+pub(crate) struct FalconDmaLoadTarget {
+    /// Offset from the start of the source object to copy from.
+    pub(crate) src_start: u32,
+    /// Offset from the start of the destination memory to copy into.
+    pub(crate) dst_start: u32,
+    /// Number of bytes to copy.
+    pub(crate) len: u32,
+}
+
+/// Trait for providing DMA load parameters of falcon firmwares.
+pub(crate) trait FalconDmaLoadable {
     /// Returns the load parameters for Secure `IMEM`.
-    fn imem_sec_load_params(&self) -> FalconLoadTarget;
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget;
 
     /// Returns the load parameters for Non-Secure `IMEM`,
     /// used only on Turing and GA100.
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget>;
 
     /// Returns the load parameters for `DMEM`.
-    fn dmem_load_params(&self) -> FalconLoadTarget;
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget;
 
     /// Returns the parameters to write into the BROM registers.
     fn brom_params(&self) -> FalconBromParams;
@@ -372,7 +373,7 @@ pub(crate) trait FalconLoadParams {
 ///
 /// A falcon firmware can be loaded on a given engine, and is presented in the form of a DMA
 /// object.
-pub(crate) trait FalconFirmware: FalconLoadParams + Deref<Target = DmaObject> {
+pub(crate) trait FalconFirmware: FalconDmaLoadable + Deref<Target = DmaObject> {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
 }
@@ -420,7 +421,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         bar: &Bar0,
         fw: &F,
         target_mem: FalconMem,
-        load_offsets: FalconLoadTarget,
+        load_offsets: FalconDmaLoadTarget,
     ) -> Result {
         const DMA_LEN: u32 = 256;
 
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 68779540aa28..5beb27ac0f51 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -17,8 +17,8 @@
 use crate::{
     dma::DmaObject,
     falcon::{
+        FalconDmaLoadTarget, //
         FalconFirmware,
-        FalconLoadTarget, //
     },
     gpu,
     num::{
@@ -171,9 +171,9 @@ fn size(&self) -> usize {
         ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget;
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
-    fn dmem_load_params(&self) -> FalconLoadTarget;
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget;
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget>;
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget;
 }
 
 impl FalconUCodeDescriptor for FalconUCodeDescV2 {
@@ -205,24 +205,24 @@ fn signature_versions(&self) -> u16 {
         0
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: 0,
             dst_start: self.imem_sec_base,
             len: self.imem_sec_size,
         }
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
-        Some(FalconLoadTarget {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
+        Some(FalconDmaLoadTarget {
             src_start: 0,
             dst_start: self.imem_phys_base,
             len: self.imem_load_size.checked_sub(self.imem_sec_size)?,
         })
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: self.dmem_offset,
             dst_start: self.dmem_phys_base,
             len: self.dmem_load_size,
@@ -259,21 +259,21 @@ fn signature_versions(&self) -> u16 {
         self.signature_versions
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: 0,
             dst_start: self.imem_phys_base,
             len: self.imem_load_size,
         }
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
         // Not used on V3 platforms
         None
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: self.imem_load_size,
             dst_start: self.dmem_phys_base,
             len: self.dmem_load_size,
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 86556cee8e67..9e4f90dff8d0 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -22,9 +22,9 @@
         sec2::Sec2,
         Falcon,
         FalconBromParams,
+        FalconDmaLoadTarget, //
+        FalconDmaLoadable,
         FalconFirmware,
-        FalconLoadParams,
-        FalconLoadTarget, //
     },
     firmware::{
         BinFirmware,
@@ -252,12 +252,12 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 /// The `Booter` loader firmware, responsible for loading the GSP.
 pub(crate) struct BooterFirmware {
     // Load parameters for Secure `IMEM` falcon memory.
-    imem_sec_load_target: FalconLoadTarget,
+    imem_sec_load_target: FalconDmaLoadTarget,
     // Load parameters for Non-Secure `IMEM` falcon memory,
     // used only on Turing and GA100
-    imem_ns_load_target: Option<FalconLoadTarget>,
+    imem_ns_load_target: Option<FalconDmaLoadTarget>,
     // Load parameters for `DMEM` falcon memory.
-    dmem_load_target: FalconLoadTarget,
+    dmem_load_target: FalconDmaLoadTarget,
     // BROM falcon parameters.
     brom_params: FalconBromParams,
     // Device-mapped firmware image.
@@ -363,7 +363,7 @@ pub(crate) fn new(
         let (imem_sec_dst_start, imem_ns_load_target) = if chipset <= Chipset::GA100 {
             (
                 app0.offset,
-                Some(FalconLoadTarget {
+                Some(FalconDmaLoadTarget {
                     src_start: 0,
                     dst_start: load_hdr.os_code_offset,
                     len: load_hdr.os_code_size,
@@ -374,13 +374,13 @@ pub(crate) fn new(
         };
 
         Ok(Self {
-            imem_sec_load_target: FalconLoadTarget {
+            imem_sec_load_target: FalconDmaLoadTarget {
                 src_start: app0.offset,
                 dst_start: imem_sec_dst_start,
                 len: app0.len,
             },
             imem_ns_load_target,
-            dmem_load_target: FalconLoadTarget {
+            dmem_load_target: FalconDmaLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
                 len: load_hdr.os_data_size,
@@ -391,16 +391,16 @@ pub(crate) fn new(
     }
 }
 
-impl FalconLoadParams for BooterFirmware {
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+impl FalconDmaLoadable for BooterFirmware {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
         self.imem_sec_load_target.clone()
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
         self.imem_ns_load_target.clone()
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.dmem_load_target.clone()
     }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index bfb7b06b13d1..b98291ec9977 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -34,9 +34,9 @@
         gsp::Gsp,
         Falcon,
         FalconBromParams,
+        FalconDmaLoadTarget, //
+        FalconDmaLoadable,
         FalconFirmware,
-        FalconLoadParams,
-        FalconLoadTarget, //
     },
     firmware::{
         FalconUCodeDesc,
@@ -222,16 +222,16 @@ pub(crate) struct FwsecFirmware {
     ucode: FirmwareDmaObject<Self, Signed>,
 }
 
-impl FalconLoadParams for FwsecFirmware {
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+impl FalconDmaLoadable for FwsecFirmware {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
         self.desc.imem_sec_load_params()
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
         self.desc.imem_ns_load_params()
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.desc.dmem_load_params()
     }
 

-- 
2.53.0

