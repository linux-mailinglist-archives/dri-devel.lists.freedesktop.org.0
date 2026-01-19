Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123F3D3B020
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B4410E342;
	Mon, 19 Jan 2026 16:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="Tz50QeyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022117.outbound.protection.outlook.com [52.101.96.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E4510E342;
 Mon, 19 Jan 2026 16:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMxgSIT3rK1gT4JkhDiGPRsp+exeaiflFl+nDUUXLiuaSzvqw3muaz+RYvd9cP3zbNbE8jdgdMyTaoGRWFlnokPkFbLdDVQSnIWFMK6k9YNsUwiIl0kWtKHYc2HIzrb7WMq7ny4LfcxmuZKAGdl1y7vdx6NQ6j4/KV8rQy05mV/5Aj5UidDe2uuqhnKuXCcQOyn3+F5VOzzbqN50HiQwt3BXrUJjmMc+IS3k7A9XR/Hg53nMtdz/ddeKR3q5RT8MTuXKXxfz3n9AbuHndNlFA7mcjl4fgLuqHeQtiY2c5dWogHrgV3v+OQ+jTeWQnssOMFO/fiXgcwjridtZIZEJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CnMgzvxIqk7kuIo/8Qk3dnl9OKYdjKqFun/L8V+SR8=;
 b=ijyg2+xxxOD4ZclyT5TKcmfyyUxLYLSwtxgkOKcgiprsJxr7afiBQ0O5Fysrd9lb7IhvxxH5ReittO/mdkbrAADyrMwt+VtgwaXvs1GmJ7v+0VmGDCbr8JPPACE9MhtuBGiXNXRZcD0bEVtAp/tYRzjuhhTN2B9tl/zqGbRsUa8TAKg2KcVNtJrjVHNkgVd7uq2s5Lm1RtFDBBOlFH6YT2YE1cgIJR69n0jjQZIYB3Q09qs5bX6UDHsNtRnetT604VPkqxnCRRT2/vI1d7gCXDkWu881MWH8p9TMETMmHgMMx9t0vRz+VtHSsiYB+Rv9Nz1W1ztI7s3tEhFPaCsiQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CnMgzvxIqk7kuIo/8Qk3dnl9OKYdjKqFun/L8V+SR8=;
 b=Tz50QeyFTkx77pGM+Ewb1BREHqI/pCy7xHA+z/D53pokybcZRbcvjhMRDYle9+qX8wRwUxi1DxOW+14FgTITpBZEadNZia23Yvk/WN96ekopYzHGWj1aZ9caGE06tOH4ouqpdG+jpH6Pf+gBez//QXD2hy2l2p9g1tktJ22HkR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5227.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:12:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 16:12:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:12:13 +0000
Message-Id: <DFSP53WPZYOM.2Q8LBRR403QPX@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: derive `Debug` on more
 sequencer types
X-Mailer: aerc 0.21.0
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-5-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-5-dc7b42586c04@nvidia.com>
X-ClientProxiedBy: LO4P123CA0264.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db19a2d-b8f7-4d94-6f2e-08de5775821c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlR6Y3BaWWtHV0Q5dG5EMFZqWEFEYWY0TElSazJWZmFHS3FXWVE2UjJuLzBa?=
 =?utf-8?B?MjRkeDdmTmFDcUIrQU9XOFBNNnBaNVgwQ2IyaHR4TExrTWd2RTdYRE1KejF2?=
 =?utf-8?B?d0hyMFd6U2F1UnJCSUl2aHdIb3hFY0pHRm8wOGU4VEFRL0dsRmNOdG1sek9q?=
 =?utf-8?B?V20xRlM2K0M3WUxKbTVLM1FRK0Y0OENmK21FSmJ6RHBxSjNPcVVodVFrQVh4?=
 =?utf-8?B?RTBWcS9LR0pSaElsdzNPempUb2QwUFh1Q2t3NDhZUFB5eUtZQlhjc3VGN0lz?=
 =?utf-8?B?ZURtMU0xRC85KzFXcXdBRVJpaFpqcm1zTGt3VS9veFIwY1VTaGpvZnhMUWJT?=
 =?utf-8?B?MHdJTnQ5RlJERVhteTVFWFFET2k2aUFncVFoQWhvOEdVWUMrZGdSd1poZTdS?=
 =?utf-8?B?Z21uSmVmaEVSNXZMcWErdXpuTGtWNWxrd3JtdTV5TjJ3Z05yUDg4YzN3Qlp6?=
 =?utf-8?B?SGFCdnRBZFRRcVJVazRlTGRKaTIrNnRSZnJuOURyZ1dENjZHaVkzOUhKVUZr?=
 =?utf-8?B?S0ppald3T0k2bXlIcWMxaG9xd20zQVdIaHZHMkJIcThuMEJSR2NOVzI2Rndy?=
 =?utf-8?B?bTB2Q0pncjFabldLdVFHd3R4UFZ2NGF3TW9vZHB1Ti9vbzhtZSs2bUF3LzJ2?=
 =?utf-8?B?RGdNYU52U25rL1hKYlhRTHNBUGswU2VjTjlNZy9mSGVPN3hkUUozSWFEQmVt?=
 =?utf-8?B?QzhsaTVuZEFqUFozNXBwVGkyN3ZXem5ETlVDcWNVemZQcWNVanhRWVhYekEy?=
 =?utf-8?B?L1lUKzlmUERjQnIyYXRDamRaRzN1RytuYU9MWTZMZ1ZxUDNvNnpUZ1dqRlhB?=
 =?utf-8?B?Ym9HRy9PcEFHbUx3V3FxdWhOUzMzU0NQenBZNDlaek9sblVRMTAydmQ3RjBq?=
 =?utf-8?B?SWg1UHA4aWsyMEl5M2YzRVBCT0JJa3N3N3NnWjJkQXdCMUtEaDRMaWlFQ2R3?=
 =?utf-8?B?a20rK1VWZ1EyeWwveFhBQzhlbFZFanNRMU9CYVJmYTZCcnZoamhHUXdtSWpJ?=
 =?utf-8?B?Yys4ckZLNmZvN1M0V2hDeGQwRGQ1dFFZcEFoR25NVjdqb0xySGo0TWphSDl3?=
 =?utf-8?B?ZURtRm9xV0VjWndNekJiU3FhNGxuNnQ5dmM0Mm94RG5za2d6R3JWRElzTzVL?=
 =?utf-8?B?WEpyUWlKTjJFajdyak91YWUyRU45R3RSY3ZpNzRISC8vK0J3UFVRWUU2NVZi?=
 =?utf-8?B?aVJaeENZZEd1V1hGNjQ1VXpXd0hHMVFvcjkzeE1UdGMyc1J2MFpjVytob0Zk?=
 =?utf-8?B?Mk5kL0lvNEtGOWN1TDgyZitBT1pBaWZ4RGMyVGltRzh3ZWx6RlAxczJOdS9Q?=
 =?utf-8?B?dmltYWdnMUFucHB5bFZ4K1pML1prbGZKUk5uMzdmQ081T3BlYit0WkdienA3?=
 =?utf-8?B?RFk2aGo4NzBIcnh1R1pibGxJdExOcUJBWTE1aE1NUUFTUzJzZjcvSjAyUEtp?=
 =?utf-8?B?OFcrN2xTL00vZkxWV0MybUd1ZEtYRW1zRUlMQ3hCSXdQNEZiWHAxY3RPMjIr?=
 =?utf-8?B?bG5ZR1loaThHN3ZyLytQOHdTWUowRVR6a25yVmEvelVwL0trcmkzTW9Tc1lQ?=
 =?utf-8?B?Z3hyVDU3OTVERWlDakFVWWNManp5RVRIZTZhV0lybWpFaFNjVjZsSGY1NjV1?=
 =?utf-8?B?L1FGWjlTTFo2MFZKaEt5eEx4MlJSZEJTeXd4KzhFckZ0aUtBVHZiUU8rTHRy?=
 =?utf-8?B?dmlJNUppdWcrRFJOSllSU290bHNVZDIwY0t0QlhMNjhzdURKYWpzYmFrNzZr?=
 =?utf-8?B?dTZNSjd3Wno1ZnFzRmtlNkxJVmZOcFM2a01zUXcrSTdZekk3bjh0aHlZazBE?=
 =?utf-8?B?bGpNU1BqUEJjMDRxQllNWVFQaGNWSGliODlGNEw5MGExZk01cktwdThlL25D?=
 =?utf-8?B?d1RyOTNxcmdyN2lXcGxXOWhWK0phUFdxdWtpWjcvQ3pQM1l1WWhzWmFFaXhT?=
 =?utf-8?B?WmE4SjZMM0ZyQldmZVFqVEJ5MmFGbG92K3hnek0wZDVqRVU5MVdaNFp3V3Rw?=
 =?utf-8?B?dWhTa29veDQ2TDZkUHkyaC9XTXNqdTBxMW40REZHVVo1VGZVM2lxRHJKWFdH?=
 =?utf-8?B?R2dHdDR3V1Jmd0FPL3hWZ0FOcFd0NmRhYVJacnFlQXcrOUVvVnNIMzBNczJI?=
 =?utf-8?Q?RUss=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE00UkVyQXljdVpWV01qZGdOY1V1a3VoOXFpbExTWC90MDVWd3ZHRUJpcE9D?=
 =?utf-8?B?SGIwY1hESHgrN2s1Ly8rbVFxZzY2ZDNCeUdrazNWY0lEeWtSWVNHa1NnWGp3?=
 =?utf-8?B?V1l1RW1VYVlMOGtrNm01WUdndTJKQWVCMjFmUXFwQUxUZkl5MkZvNi9KT3lq?=
 =?utf-8?B?SVl1NWJmZ284WlU0SHZHUFozVmxQcWt4TnJaZ3pkZTFWTEtLVUp4blVqWTZT?=
 =?utf-8?B?bVA2NVpNWCtXcC96U0NldFIyM3o2aForSmYzY293S2hnTm9Zc255bkpnYTlZ?=
 =?utf-8?B?VUtSUWplblVLb09EeFl3UmczanVUbUU2Zzhra0RiV1JKWXdYN1BBK3B6R0tk?=
 =?utf-8?B?TzZReW1COGpZcVdvVThyTWJENjZhcU5LdDA0TWM2SWEvSmx5b3hZSGZVOTVQ?=
 =?utf-8?B?T0cvV0crTmxEVVQ3V041L2ZXeW5DR0hxN3Jtcm1vRzZ5Mm5uWHpTOGkrQTlT?=
 =?utf-8?B?VDBWdHBPb0lpaWh2NlVxRmhIVzFDVVFXQitPOStQZDhyMnZUWnRJTndnWGRT?=
 =?utf-8?B?dU80RFlySU5kQmpVbXAwOXFobldUL0lCOUppaFVNWFVlSmVLZ3A5U1F6UlBV?=
 =?utf-8?B?bkYxdXFmckV6bDNCNWo3OGFQZEpTYXB4MTNkYmlvd1IzVnNYajVwTmFFZDR4?=
 =?utf-8?B?UnI0U1gxWXowRUJnNDkzOEJEUk9BaUMyY1FhRlpzTkFvUU9CT2RjQ2JjWFgy?=
 =?utf-8?B?amVxT2t2VGp4L3RaYm5YYkllaVNTVlRTNlZzVUxVRnRLM2RMZDBtaStEbE5k?=
 =?utf-8?B?T2xDY2Nic2NDWWNSekQ0R1FweHMyUFlDNEhSaXBkN1dMUWl5UW5ZN2duOXRr?=
 =?utf-8?B?SVRoRW1uS2NpYy9oRjV1cThYeFVYUVNSMGpTWkN6Nmo0aUEvYy9nSjZoc3Nl?=
 =?utf-8?B?NWNLdW5FZUFHQWNCMXpiRGV0Y3hKMll0RmVMK28rQWhVa3VBOU9odElSMWoy?=
 =?utf-8?B?T2Z3ZUtiU1hBdi9FWXlpWVJlcDFYVC8yY09VV2dSaEc2TzhwZmFUWnJuN0x5?=
 =?utf-8?B?Q2NoZzM5ajBlQ2R3OFNRbkE0QjgrOGlVVGUrR0dXcVhIc2VmVXNxZWJnZmU2?=
 =?utf-8?B?U1pkOEdxeDl6S2o2eFV0SmJCVWd5N0J3MGRrT0FMVlFGRVJqTWh5cVhiM1ky?=
 =?utf-8?B?QzBkRXFjZmdTMXlWbEZYeU81Nm5kWjVoYU9sNERFSVNuQXJJRzkzWlNWOUxw?=
 =?utf-8?B?eHNpWGlTbTRqQzBHcys1QmtBU3RUOEh1Z3ZRb1owS3NkVlBjUFAxa2VnRVhr?=
 =?utf-8?B?NGtESTM2RUNLWm5DR2t1aW1TbkN6RmdRUjFzQ1Mzdy9QeGJnSWpLWjIrWDVU?=
 =?utf-8?B?b1pFUFg2Smx6SFhIVXJkdndaRzFQMjF5UFViS3hkandlZEJieEF3TzREQWMy?=
 =?utf-8?B?RXhLdFNaVkxxVXZlc1FqbkpjYi9hUXpNUmtuWGRhenh0L0ZzYm80WGpLUVJI?=
 =?utf-8?B?TTYybHdLbkg4cWNDZzZSMzFhVGIwdi94bjlDZ09oYi9LM0RMWU9PR0FtQUsx?=
 =?utf-8?B?S3Y5YTNSWXJjQll4bUIrNGM1Vng3R1J1L0trVWVZRGtiVWUyT1Q2dGVhcjlI?=
 =?utf-8?B?MlRTSG1nRmRQdHRPV2IweFlLbDU1ZDBJbEU3NGszNC9ya2IzcTQ0Q3k3S0NG?=
 =?utf-8?B?WHY0UzFkcVN3MisyZGRST2hwUDFMa1grQmgvQ0s3SDZsc2dsSHNxb2pCTFpy?=
 =?utf-8?B?TjEra3dKK1Z3eHVJUEZpQUVENHRkQU5ndmJzNk5zbTNyTkp3c01TVE9ENTgw?=
 =?utf-8?B?SkcyNGVJUkFSUDFMTVRob2cwRUhOcFN2MEhBaEVLTkxsS3U5VmgxR0xtS0wv?=
 =?utf-8?B?aXZsblhHeUQ3SW1oZGFtOERQTmRoRlM5K0RmNTV4L3d0UUI1aGxFMVRIV0lI?=
 =?utf-8?B?bU1WNTgzQWdsd2lwU2NTeTBiN2lHcDN4T3RsS3p0NXh6b2xEc28zeVFuam12?=
 =?utf-8?B?RVhHU3dTTGdIUE1wVEJoeHRxUGMyS1doS0c3VEhXWmxyQmVBUVR5RXc0bHRB?=
 =?utf-8?B?SUg1RkV0ZU1wbGZ2ZnhqV0drSldjd1FGalRRSUtxTXY2SjFxNGhudjRJNWta?=
 =?utf-8?B?MHQ1bTNTQmJ2RCtzalhZeEJ2SGxXK2xlZVdJMHVYYkoxMExOLzlBNThwdGRU?=
 =?utf-8?B?ZEVQNnNtSmZweG5sLzN3RXhnSHdlcFpJNG5wVjNxS2orNUtEVUZwZGxDcmRY?=
 =?utf-8?B?T1pFcUROMmRyWkk0cVlYemNvRFN6Ymp2Q3l3cklUaTl3VEUvNnJ1N2kzVS9L?=
 =?utf-8?B?U3U1bjhSSkVLNVJXNVlibEUwMG14QzVjS1NRaU9HK2h1Ulk2ZlNxeVZ6dlU2?=
 =?utf-8?B?cmMvNHRIdE1QWDB5ak9TOU81VENRZzYwRzdiamlXbk5KQjY4WUx4dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db19a2d-b8f7-4d94-6f2e-08de5775821c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:12:13.9509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /B9ufjsHMtldFlj751KRjYmxx24Zjl4E0ea/FH9KyK/DCOSfQv2OpcwPbxmtX7soZIFNJxD+nxj16xUG29Mx7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5227
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
> Being able to print these is useful when debugging the sequencer.
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/fw.rs        | 10 +++++-----
>  drivers/gpu/nova-core/gsp/sequencer.rs |  1 +
>  2 files changed, 6 insertions(+), 5 deletions(-)

