Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE9D3AF1D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 16:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB8410E495;
	Mon, 19 Jan 2026 15:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="SPftXbhF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021098.outbound.protection.outlook.com [52.101.100.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB60210E2C8;
 Mon, 19 Jan 2026 15:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPfB/LDCbMGiTR+wjWsGOIuJOHnpt5jVYDXOQO5r/qaWJeL8w7IGFW2WIyTZgD6sgPERmqzzLGidD9NIUzU1vWGzSb6CT8vvvLZWlclSvon0gtkXB39AVfNAQAEcqsz/ARkPzO3sSPfCS28MF0i3HXvB0cBNAYP+okeUwPtNTOXt8FOGpdNJRoWky6hDXOmhUpCspZaG6xjWUgMAdLGISm0KI2jKZ5UUJPebweyfUzV/1Yfdo/on1IVhgES+KMnQpMCbhTyEl++hLaEWWCosOC0wmc26RJlJm8Tgkt5pDf0TqeUvlINNEvBrXxY2qxFuVy6ty3ZTHkh6lIerN4uQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w19hTyu5l62X8WVJphE4787d6gBVaFKN0JMH5GoVejk=;
 b=X1Flh8blK981BKVlEF2E8ROCE9odmjl2vUXsEoyKExPmVNfsvH2SiN11FMdvKlAK33AvKI2UxV5QE/lMoyOW2q8k24or9mU/QeP9oL3PdpmWJ06x/fcL1gX2Op4UtMbLaVuyljxP2uaLnIsUa26UuOZnFVZALGDHbHTX1yDf5xhIovrnnMXQbqxuVFU7AwsnG7gMpxAQQ9yboanNfEkNE/kZRagcA+8O7BKqT2CWJ59hwMs/9LgrSUyNC+kgtiVNt8VwstXLn5xU3GFYhU1ZCbEGYCw/vqWzjYG1hJj1KiC7BIGl8kb1kmXVUAVnW1BKUH4GYPjnp0qpcviQmb1hGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w19hTyu5l62X8WVJphE4787d6gBVaFKN0JMH5GoVejk=;
 b=SPftXbhFdCneVSHGoiSKhD+bWWJMjYitSSBjG8lFBmYJWPoWN62dEsU0P0SNKqBklwakIWwa8oYunHP10MUck7n1wTDm4fqPfNpw4Rqw5Kj85jig0mR2LCEvHT02nTW4+qpF7K0Uf7XWjP3OQ80GciIZ2VkFZpkPY+M6+QInLYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2273.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 15:33:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 15:33:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 15:33:38 +0000
Message-Id: <DFSOBKDE06Y8.13IHB8U8T0AET@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>
Subject: Re: [PATCH v2 01/10] gpu: nova-core: gsp: warn if data remains
 after processing a message
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-1-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-1-dc7b42586c04@nvidia.com>
X-ClientProxiedBy: LO4P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2273:EE_
X-MS-Office365-Filtering-Correlation-Id: dacd7ad9-4a37-49fc-abe9-08de57701e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDhxNmtNcFpZM2xPZnYxUmoyRGU4eWFrMDJBUGx4YzFadlZUdVRQdGZ4aXZt?=
 =?utf-8?B?YXdiYURJTDhSSnpMc3FNdnhYS0w1TEFheDByWlc4dHlCelhJS0xUR2NGMHZ2?=
 =?utf-8?B?azFMY3Y5MFVlUk54Y2FIbDhmL25FM2tGSUIveGJYS2I2WVdLcjRiYWxEUld2?=
 =?utf-8?B?ZXlxejRpRnBuLzNwTlR6WFUzeC9oVmV0Rlc5d3FCY2xOWHd3c21EeDlNcUZa?=
 =?utf-8?B?R2VYZSsvQWtzTHV5SUFmQTlRZEtSczdObXFkTjJQQmhIUmNDRjNRZk1CTnFj?=
 =?utf-8?B?eUVhRmVSMXY5ZmpDVjFOb01SeTNHNkdJWFRSU0grZUVKamIzQkpTMlRHcHAx?=
 =?utf-8?B?QS94MWtOaktxNFR5bnBKdGdDWmR5OHJyQ1N6UW8vMUdFc3JzQ1hRYytxdkFz?=
 =?utf-8?B?d05lRFRPV0x6UTJNcTVQNkRlNHRxQ2tGRE5TYnQrcCtSc0ozRm12U2RjVGty?=
 =?utf-8?B?RFcvNTNZeVR2RW5GaEs5TUo2MVZZZ3NOZDJ6TnU2NVlMei9iY2QvQVozeFBG?=
 =?utf-8?B?ZVN0WWJDR0xYdkNIUkJNbGJIVEhpWEJjbzIrd1lGSklzTnY4VEROM3NISFY2?=
 =?utf-8?B?dTJJcTBQaWpTRm80NG9VWFpyK0FRSXUzYmNmQU1FbjNVVFo5dlFOV3ZWOWx5?=
 =?utf-8?B?QjgyTGhHaTFkSkZGbG5ORjFrek52ZmhCajJpeHkzOFNxQlRxZFhPTE9KS1Rp?=
 =?utf-8?B?b0dLbFlldXhySVlXdTN0azhyK3hLMEd0SjdpVmVPVnJvNVFwWk1kaXVXeFFu?=
 =?utf-8?B?UGc5cnhKU21wVFNYdzZkTHVGcjBWWGN5K3gwUTNCWHVEVG9xYzZaYi9KaW1x?=
 =?utf-8?B?RG01UEFkeUg4TVpEd2pSZUFuYmo0V1pINkNDejI2SHJGMkIyRjVzQ1c3T0RK?=
 =?utf-8?B?aWE1aXUzYnlESlN1TlJGT0lMcDBjL3drR3Z6QitPUDRKSEtlRW1YZHl3S3Uz?=
 =?utf-8?B?UFkvTS93NXlmaDBVdEloY0gvYjRRODRBbXN6Q0x4dWdLVXNzS2M3bURoTU1I?=
 =?utf-8?B?VjM1czhtZW14KzRhcXp6Z1FrcUF4SUx0N0lhQmZzMzN4UFcvbVd4U2pkWFZV?=
 =?utf-8?B?aDNqR1l0ekpsNmd4WmhxV2FYNDBtU0JWSllXTWJNbG9nUkRqS3MwS2pldXpG?=
 =?utf-8?B?a2x1MUI3eFVBRlBjSDNaRnU3K2E3akRSMi9MOVRkVE5yQzFoQjBaNFFSeHJp?=
 =?utf-8?B?bU4rcHZJb2JLZ3M4N2F0ODg0a0ZvOVBGbHVVZ2ZPeXZ0YWZyWFVpTG00OUxs?=
 =?utf-8?B?ellHOTNVd2JqMnVtR2g4TnFpZGZsci9ZQjZrMCtDZy9paGdTeUpqWlBBTVp0?=
 =?utf-8?B?OVRWNHlzcXRWM3l6WitLN0ZWaFpFTTBEOXd6cXRyZ1h4YWx2OFN1K1VrOXZ4?=
 =?utf-8?B?OFNCRyszMmxqTm9XY3U3N2g2T1BrTjdOZ05YSFl1Vkh3TExPS1JzRXJxSStv?=
 =?utf-8?B?Y2dseVlXL2Q5YzNOU3JMS2FvTmNpUU5oQS9pVWRoU2xUZWVPM05vL0p2UVVW?=
 =?utf-8?B?K0NGa2JqWG5zWlE3aEs5d0h2Mk5RK1VXdVN3ZUdnTnBjUkd0cGR6QUNtMkNa?=
 =?utf-8?B?cVVuRDJTUTFhT0NjbmRVVXFneFFQZ1d0NC9mWFgrYy81UWszWDF4L3BETmZI?=
 =?utf-8?B?K1hvN0FpaHEzb3BJUysxUWpvZHl5eERBa041MEtrT2xuQVVPVDhTSC9YY2Vq?=
 =?utf-8?B?R2VLckQ0VmVjYldjNkt6WlBMUk1JYndFSThYNDJBYjRNQ1J3QlkxWHMzcTc5?=
 =?utf-8?B?WEdVV01EL0tBdFhCSFo2QU44NEFLaWxiQ2ZYd2c3NW5MQWx3RitPQThybXhB?=
 =?utf-8?B?TllpYkRnWHpOZEVFUEdqWENxTVdSbm9YWUdmZDBKVFBuM20zeFc3RWNKd29h?=
 =?utf-8?B?TmJNZnN1NkhyU0NqZ1pBWlFncHFseVFERW5nb1djSjJzdkFvSUxrRXVSbFBk?=
 =?utf-8?B?RW1qYU40eXFNWVBzMExraDJIWGVpZWpTZFlVQVhqRDBwWmZhMW5xTk55Q0lT?=
 =?utf-8?B?aHlrZ2FGV0R5ZVV0NmdaK01MY3BReTVZaTRSUkNkZWZodFJVR2lDRTAzS0x6?=
 =?utf-8?B?dG1yZCtkV0s3OEpWdkFIQnRlZFF2dDRDRzcvRzh4NWhBYS9kVU1DQ3FyNWhF?=
 =?utf-8?Q?2XNA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2dnZ3JFb2JrQ0EwaWtLd3M0YWlRZ3RmRVoxRTVRR3pLVS9hMXVTVzFWYVEy?=
 =?utf-8?B?UFBLaGQ0VHRxdHdYUm9ZdlA2R2x4OGIzeHdQM2o5VE1JVzNyU0xyOU5oTzd6?=
 =?utf-8?B?T0x5bkIzWkVhbUdOdHl6cFdmOWliMEJpYjFMWGw3WWxKYjg3UmNuQXB2eSsr?=
 =?utf-8?B?Mi95N0hVK3h0eDVKV0I2a2JSKzNSbHBUMWdvMWhEQ3FsMTZIUFh4V0JYUExD?=
 =?utf-8?B?WFYxTms5bzZCb3pieER4Um9PWTVMb0hrNzBGY1pBOWhyd25sbW1PVEYvOHBB?=
 =?utf-8?B?dGNWbWNXTDBwSG5NcS9lT01mWG5XUTlIQUFqMlA2T1hLNUlpZVhVa1AvWFp4?=
 =?utf-8?B?b3JwR2lnNVRWeUd4Sk0zVXplVHhzTVFqSXQvcmI5d2xzeTMxZzR0cy9qcVBy?=
 =?utf-8?B?YlliZGhReFh4cU9zbnFqRnNyRy9jOVFoMzVuZERoR0lBZ3B2NjU4SmhrVGJm?=
 =?utf-8?B?WHd0bEl5QzZHckdiaFdBWWpYMkxnZkhIZllTd2pnalZXeXdiR3VjSDZZK296?=
 =?utf-8?B?V2tXeFQxTFFkNEk1S2cySmV1K2l0RDFpZHJyOERGaktqR0l4bUp0WDhyRDhH?=
 =?utf-8?B?eFdIL0ptSUk0N242dW4raFNPdVFxN21CVGVtVVZZendlQ1U4blB4N1hPeVJV?=
 =?utf-8?B?ZVc5eXJWZkpnUDFYdThDWUZjWm51Z3g2SVFHK251cXA5alhjREMvTXNYaUZG?=
 =?utf-8?B?VU9zcTh2K3lESVRJN0p4Zk1aTVkyeFY0R3hMV0JrYjNpVlpZNTFoejlmYUZX?=
 =?utf-8?B?SnRKejMzeDM5Z1RYWEt3L203dFF5b1NYdWNvcjRsMDNvVEhlYXpuOGI1TTdj?=
 =?utf-8?B?cHFuSGUwVk0vcWVHZHFFVWtlejRTREFOZTVsZlN2M21QRnVzREF1WHR5bFVF?=
 =?utf-8?B?ZVNqbkpaeEhjQnBkdUZ1TDlnRXoybEk5NWFzellyM3ZSbThUbE56QWZkMDZt?=
 =?utf-8?B?N0VCVjRRWGNUejhYRXFkeHhwd1A1Q2ZmVXVaaGNaK3J1dGhqaE11REpZSTZT?=
 =?utf-8?B?RnZDMzhhelBRZENaNmwxYVlwZTNrZnZIQi9ISkRvNVlRbVA0RDl6WDcvR0hX?=
 =?utf-8?B?V05tRFFteFlMVlgwNmMvOVM3YUZmeVdIc1lmMVozdVBUalFRVm50ekpoZXBN?=
 =?utf-8?B?YWlQYmw0Umd6ajNBSlluYnl0ODFaVzRnU3FXRkdLc2dRYTZpTDFOTFhYTHZn?=
 =?utf-8?B?eHhKTUJpS3R6SnFwazBQTGljanJ4YlVCMUJIQnIvTDVvUG9Ld21GbDJ2TktB?=
 =?utf-8?B?eisvTFF2STFTZWFJR1hGbWJ1Ym1OdVU2eFhZNitvSW5JdmZObDhNNndvd1NU?=
 =?utf-8?B?QTZPSElheUExNyt5UWVkS0N5YjNHYklMTXYveWtHbnhWRnhnQ0NMTmVNZXV6?=
 =?utf-8?B?ZFRTYm1zYkRoQmg3czJpUlRzQzNqZmlpRWVkWW0vTFZnSUl3b0ZCVkxoQita?=
 =?utf-8?B?ZlNrZ3d4MDdydDB1N0R0K09TS3hTUkdhSTRKTjNZNi9rZjRUc3pEQ2RuMGhZ?=
 =?utf-8?B?Z2oyNDN6dVBkSXZnR0YxVElkeTZ2UEF1QjJDV1pSZzRXTUJISHZRTjZDSmNT?=
 =?utf-8?B?L003UDhuRDZmUmJXWDRhQjZGNVFjcURhNWVMOGw4cWV3TnJvbDZsQUNBR1FE?=
 =?utf-8?B?NGo2aDcrR0pmYzFkZ0lueVRKUDR4L2VUNmI0cnV4UU9FdVZzV0RUU3dRS3Iv?=
 =?utf-8?B?bVpGZjk4TUFDYnBYZ2s1YmZBVFFSZmRncVRQVG5CS0ljZ0RRU0RKWmo5aHB0?=
 =?utf-8?B?YmdWWDlnUDJoVlhVQkZrZVBwaDVjdmN4YzN6ZmZkYmRlNlB5RGZ1TTQ2MWRG?=
 =?utf-8?B?WEM0OVB4cEVCcWJhQUVud0EzVm9RN2RuTG1KNlZtVUVlaUd1K3pQV1NaMkIr?=
 =?utf-8?B?TkltVkpEVEZpMlhsRW9USGh5VDBvMnlsci8xTXdjN0dVb1JYckdYeDNKZzJJ?=
 =?utf-8?B?VEthdG1Nb0xVZ0Y5Qm1QRU1hRVhWZzFmZUxwbCtzcnkrbHd6Vkc4eVlFUEJQ?=
 =?utf-8?B?TGp3NkgvQW1UWlZZMCtFRTRrcnF2dEthZ3Vjb05ZdjJjQ1hJT01FMnphUE1u?=
 =?utf-8?B?c2hwdnM5VHM4VmhTMnFnaTY0azAzTGdNWVkydjVkdmlKYnFOWituTmJ4MGJk?=
 =?utf-8?B?TFpTc1d3MGZYOG96dHNaVTZHQ0FSWml0ODhhZk9sczhmUGpQV0F4Q3RCQWIx?=
 =?utf-8?B?M2hneGx2by8vV0REaDBweXJ5R3hRUG4wREg5R0Q5Z2NZTnNGVDRORjhnUk16?=
 =?utf-8?B?L2g0ZkJSYTJNc0ZCLzg5R095dG5Ucm93bmQwcDcrSVdwRHpKd3NIUEthRTFB?=
 =?utf-8?B?S3RqZmRoYUNielQzN2o2VzFOMWNLODdUTGkwTjlBNXZIbWFacUh2UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dacd7ad9-4a37-49fc-abe9-08de57701e33
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 15:33:38.8704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: basBzr6Qlm0vYJ3/SQSWjF5YRrmuGQ6afdcyFtPlRhoJ0ygobthGxBQ1EqsyjzYvJs8A6Ae5cKHhBMIA4QPF0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2273
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
> Not processing the whole data from a received message is a strong
> indicator of a bug - emit a warning when such cases are detected.
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 7985a0b3f769..f0b7ac1ee759 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -661,7 +661,17 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut se=
lf, timeout: Delta) -> Resul
>              let (cmd, contents_1) =3D M::Message::from_bytes_prefix(mess=
age.contents.0).ok_or(EIO)?;
>              let mut sbuffer =3D SBufferIter::new_reader([contents_1, mes=
sage.contents.1]);
> =20
> -            M::read(cmd, &mut sbuffer).map_err(|e| e.into())
> +            let res =3D M::read(cmd, &mut sbuffer).map_err(|e| e.into())=
;
> +
> +            if res.is_ok() && !sbuffer.is_empty() {
> +                dev_warn!(
> +                    &self.dev,
> +                    "GSP message {:?} has unprocessed data\n",
> +                    function
> +                );
> +            }

You can also do

    M::read(cmd, &mut sbuffer).map_err(|e| e.info).inspect(|_| {
        if !sbuffer.is_empty() {
            // ...
        }
    })

This does feel like something that would look more elegant with try blocks.=
.. I
hope it'll be stable some day.

Best,
Gary

> +
> +            res
>          } else {
>              Err(ERANGE)
>          };

