Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC498929CB1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 09:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CE510E226;
	Mon,  8 Jul 2024 07:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ep8lXNM2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2055.outbound.protection.outlook.com [40.107.241.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D091510E226
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 07:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWgOJVvGVfsh1c1fmjUPehGNTO2y2SQmh4L5pp8Okrp60UXzOytDS4BaMo7JQguhS2nrIuLQF9vl45mekzIg9mK9/KGgIGTLtsKQ2fmEJ6Qit9x4f8JDSxNJibiRNFG45C40cImtdOrei6ldyRUv21r08QtdXJIjkOa6Ey94zBWB0g9jxGGu2keR+esxZzYafspHWNUeyiMe1ZHPm3D5E4Hivu7DK2QLaxNpB0aYhGpPml90ncK1MJEmFTab5hwSar/zT3BUfQ4JkpvOZvx5rgB335xb/tkMpKCM5dLzFZtVAuncqQyd/fji7p0Jbqk1TClCKC+zk4fIpyBDkzQj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVovEa+y2hQqOL6a2KOQwunvrvP8a4LVFfUw/inV9cg=;
 b=ZLsoxmQsFEnYCMFfRRtiz8umbat4FNC0111T+f/XF3Lwf3xXISHCIkPwFToJOC47mSDm/gpzjnJltdyyLWH4piKUemj6iZU3ouUN7/LzBOik30w17RcHq6BSvSnMmDoAGxpAWW9YBwEtsgs3dQaX7w+v+/SNZp2wVGjoku6UMJ688x7zYSaaZOvBObX0tsATnSO4mCpkhqAo8wYFbo7Z+dZ2nJbvXwSVYb6AUA404fCwwNGMi9wmOakuKdaisG3K5ZY43EKNHzbk4NTGMPI1xdkUPPO4R9gu3eesvIgD8mszy1FehwBvY2VrT/SPvhnlhlNMtFLQmwYi9Hdn6tKBoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVovEa+y2hQqOL6a2KOQwunvrvP8a4LVFfUw/inV9cg=;
 b=Ep8lXNM25QUmHquaD9C4iFLh6Lgserf8Mws5RS/q5CgzHYTfbjHESk/9BMu9FOy5m1OA1cllj0Rjl8cZPTfTqHzXifGkI5I1SiAbzq+kgAsjh+u0aqGpH+S8mNtNm7/36E4ZPwJOeIwHlxrtRjXYOBqeEt2IMxmnxPyXuZqJ1yw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9826.eurprd04.prod.outlook.com (2603:10a6:20b:673::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 07:02:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 07:02:49 +0000
Message-ID: <71d49d6e-6f4d-4af5-9dd3-b598a0363d88@nxp.com>
Date: Mon, 8 Jul 2024 15:03:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Add Freescale i.MX8qxp Display Controller support
To: Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705125708.GA73712@francesco-nb>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240705125708.GA73712@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096::21) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: c74dd874-d931-4228-9bec-08dc9f1bfa49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmtOek5jWnZOajAzRDAxa3dSYjM4czhlcWxGQUxCbjRpSVlaZktBcDZpQTIz?=
 =?utf-8?B?aXdnb2JUM1RFcktsYUc3VC9HZklCTUU3eUYxWnp0aWZwa1hSeS9rZ09iYVJJ?=
 =?utf-8?B?dGhNSStFb3JmK0Z3RWdVbUh2MUpWc2w3MVRGRGtieVFQMllIcWcxNytXVFJu?=
 =?utf-8?B?Smp5NzloM3dZd2NJZkdZU0dhL3RJN1c0RzR6eWk2SzA5eitJTUNCUkQ4T0tQ?=
 =?utf-8?B?Ym1FOEhaMSs4RWhlQTVnUmRyejdJOHN5UUduMHo0eHF2VjFwb3NSL2c0eWxL?=
 =?utf-8?B?NmNMcjBEOGM0L2YxZjdKcG1hb1pWMU1mOUxQazdvR0RpMHJPTm00OTl2ZEEw?=
 =?utf-8?B?RFpJVjlodDhON1kwQldpMURZRVk5cEZ0enhYZmhydU56USt1L1IyZ3dhWXlx?=
 =?utf-8?B?NUo3ampGcy8zL2QvSHNmVkNscUNFOGhkd2J5QXI5V2d2L0xna0IvMGJwOTB6?=
 =?utf-8?B?QUo4M0Z4YlpLbzFmY0VjTW42cDlGdEFYenhCb1g1dWZ5ZmRXQWp4T1hodlRN?=
 =?utf-8?B?djlxQ0RlSDc5R0laU1RNN2JBSk5XYW16dHRIYjQ0anBwdW82eUNIcDVCcDRN?=
 =?utf-8?B?b054UE14dlV3YUxRS1FvTXJWbnJRNjgvbVV3ZFlZQ01CQTFadlUwU1hIUDdP?=
 =?utf-8?B?bnhYZ3RZRkVrQStlWEd5L3JsQ1VXbUZ3dFBibHArK05sc0RpOWFJT3VxcTMy?=
 =?utf-8?B?alRLdGdlZ1pHUEhDaWdWQk5TbDVUZkhYTmJnWDJiRWJFMnh6ZnJTbDlrUEVT?=
 =?utf-8?B?eE84NUI4aXU2clRodHN3aWxuSldGUHNLVXpEclQ2OGwzSWhad0t0QzlGbkR5?=
 =?utf-8?B?eDkxU3dtQ1VxNmJUSHIzd09vWG9MT1U4clNWWXRRbWhWVXFMTXQzNkFXTXMw?=
 =?utf-8?B?dXl2Qmp0N083N20wSlUyMjhkZzk3ZC9RdU1XdUFCY04wclNvYkNMcVkxS1h4?=
 =?utf-8?B?ZEhPQVdyTmxlZHlVc3pQYkI1aUUwMFVoejJRMGpuRExSUWRRSkUrS0V1WmdH?=
 =?utf-8?B?a0R2a1BCdTNhaW9xVnVDcVFMdmFybEhJTHFDZVlIOHFSNnl2eGRlKzE1Q1A3?=
 =?utf-8?B?elhyQ21HOEQzVllJMnh6WE84cFJ2d1QrTnVTUU8wRHJSS2JJcTVWbjY3d09n?=
 =?utf-8?B?N2pvQzNNS01GSFJCWW0vMWgvS0Q3Um9XaXNKQitKL24xK1FMWXpJUFBnN0k4?=
 =?utf-8?B?cElRSUJ5bTlJeXdGT2srV3Z0aWo3TUxicUNJRkxtcyt6TFh2TnU1LzBxVVRr?=
 =?utf-8?B?U1NDWDlWU2lMWlFmTE1HV1hndHVtK2ptV0VVQTFWUXZ1ckZjZ3dwTU5MaHdL?=
 =?utf-8?B?SkVlSERHWFNoSVB6bnVCMG85Nm9YY1NiaGdtR0h3dVBUSjB2Q3pNVXcxTThV?=
 =?utf-8?B?WUlZdmt3ZWlCTXExSUdwM3VIRmV0Q2hmdC9QcXFrcUYycXRGOFNzamxaNmNJ?=
 =?utf-8?B?RnMvQUJvM1lYUDBPckh2UWg2UWtNUG5pckdRZ0YwQlZyclI5KzkyN3N4SDZW?=
 =?utf-8?B?cXVCN09FRXRXWkdsNkR0Ung3cEtuNW03ZkhybWFMcHpuUWFrNmZqL0pUbmM1?=
 =?utf-8?B?RDN4LzAxN09CekhaMVREV2Z1Wnp0eEkxV0tDOUM0OGFlcmR3NkFFTkc3VWlK?=
 =?utf-8?B?QVI3WVZRM0k4ajhRdWZUNVVQVGxERDJCWXZaT2pSVmFVMVBqTEtmWWN6REtw?=
 =?utf-8?B?UVUzZEVkcEVwbWpYNVAyNXZKaWdNdC9UbDJJYmZFS0wycFVNRk5NSDcwcWVJ?=
 =?utf-8?B?NTZqcEUydFQvYkdzZ3NLR0Y4VWVRcHpidTBSaWpJNWQxUnJONDY4bnhGMSt6?=
 =?utf-8?B?bmU2NlFiVmVsemZvTi95Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3BMMG1YSm8wWWVncDdvRzhYbWRTSjRJeHQxS2JBZ1MrOXMrWmpLd3V1Tzdh?=
 =?utf-8?B?bndrcThTZEp3Szc1c3FXUHpzOWlrUWNRRDNBS1J4K3Bwa0E3bTJmdzBsSGF6?=
 =?utf-8?B?UGJ6YTljRVNoWXY0QTZCNGhxbVRwRjJLRWptN21raTVsVEJrMzVQQjJKcjdX?=
 =?utf-8?B?Wno4R3BFQWZtLzdNRU5DVkFMS251cW55NzZneWFjeFFUSzVvbFUwa3N0QmE3?=
 =?utf-8?B?dG91dVgzTHBVaUhnaGszTm4xcUNjaGRDVVFRVEZ1bTZqL2pmS3hPVTA3RmJX?=
 =?utf-8?B?OE5sVEtsWHMzZllKeHhsYTAzN0RQK05DTjR2RFpuNG02elRBd05uUDBNZDdx?=
 =?utf-8?B?MXBlS0RCVWdkZ1dpYmt2dG0yc1NWNTRISXlJeGJxckhnQUpOaEFXWHQ3WmFS?=
 =?utf-8?B?K3Uwc01HZTVFZ2U0OGlRdTNzSE9jcU01RTZxK2Y0bmpEMUdzbURxTDYrWENR?=
 =?utf-8?B?K3o5elhaazVQR2ZLWFBzQTc3VGtIQnFkNUlhQ3dGUU8yUFpvYjF5ajI1OEEw?=
 =?utf-8?B?Mk14aE0zZkFFOVNwOFNjQzlwVDlDVVYyUHhXK20rd1loR3FvNUdndzBidGMw?=
 =?utf-8?B?eEU3dDFXNlZURDlQU0RCTjNIYUJqUWFYTC94MDdmMkJPQUMxQW8xVXo5eWNp?=
 =?utf-8?B?UWpoVGRRclI0SWNvVVNJYkVyb3JCaTJ4WVlNWlIzVjI0eXpvdnB4QzZzQTd6?=
 =?utf-8?B?K2dUN2QvMjdBSTJxZU5vVHp5Y2VuYUYxTnZLUWREdHc4WUplYjd5Z2V4ZVEr?=
 =?utf-8?B?Ym9hQTUxSUlDY3dvc1dvUnV2ck4xZHdzQlNaZG1saWJPWGQ4ZVlQRlJBRWJ0?=
 =?utf-8?B?ZzZqL1AxOEhZbjIrVTJjZUJqT3Y3bjFUbFNkZHFadkVSUUUwVW0ySHd3aHZF?=
 =?utf-8?B?VjN3NzRVdFZRb1hoVXNIUDZxc3FHWDhuTkJ0OEdaTHFFQmZyUTNPRjlHNHBn?=
 =?utf-8?B?LzNHUTBDbzFncDRlbFNhR3Yrdlh6c2ZROGFkSk82M0dSR2Q1SzlwQTBZbVFs?=
 =?utf-8?B?NkxQRmJtdFh5QkJueXhSU0VCK0w0eDlXdEVHOWl3cTFDQ1NsdUNlZWRhWVMx?=
 =?utf-8?B?QWtPL1V0QW1WbGlsenhSYW95UUtkRDNKbkR6aWcrdW95dmdnMkZwY2lVdCtY?=
 =?utf-8?B?bnBJZjU2WDMwbnpYRjJlNC9GZ1dZMTVVVWpOVlNYRmZWQkkzaVVGSE54TlNo?=
 =?utf-8?B?ak9YSUl3aER3dFpBMnBFcEdMT3ViVXNlZzhEYUxMTEhjSWtwMVo1WlNOQ24z?=
 =?utf-8?B?ZlRCbDdCUktmdVB5UVc3MDZOSXhtMVlvOHlYNnJUbXhJZWZXYU9hMDNFQjFQ?=
 =?utf-8?B?cXZTRjA2ZzJ4MkRTVVFDSjZuR2QxWmtJVi9SVHI3Q0JLdTU1YTlKNXN3S3oy?=
 =?utf-8?B?WkhLWjNFS2JLckRHbUVJdnZBMkJlRFFkTFBmSFRrN3lzUjNhOGY5TUNxcERO?=
 =?utf-8?B?VkQ0V2hjaGRaZGFPS0ozSzFqOVpNQ3VNVVhjR0M0cVFqVHVzK2srS3RNY3ov?=
 =?utf-8?B?dEh3eFFQY0t6cFZudGpkdlRWTk95VDJUbkpPNThQZFVMbUYzYXh0amY3R1ZO?=
 =?utf-8?B?ZjdmYldUNERxOFVUS0JnQkg0aTlpVCtCU09oaitET1lwV1NCZnlvQzhPdHFk?=
 =?utf-8?B?aEF0ZUZRekRkVHl1azBOWVpRSStYb28vVG90bXFROEwzNVVkSVlhZDdUMUt2?=
 =?utf-8?B?Tm5zaVdyRWhjOGhXUkcrTTI3eXFpSkJ1andSTDRmUEx6RThkM3ZQaitna0JD?=
 =?utf-8?B?cUVRcDV1K3hLYmZkODlLYWJPYytXbDgybTV1K1VVRGJDRFg1TXBkRUlQL2RQ?=
 =?utf-8?B?cVBxTW5WOUE0TEx3NnE2SkRYM0tUcGpodVhrQXl0VkpHOC9tdlJET2Z1TGtJ?=
 =?utf-8?B?V3hVelZROTZhV2pFT0xpY0owZ3VjSlJRb2ZhVWMwejYrK0h2VkhJOVJETWlG?=
 =?utf-8?B?TjRXeDJGTmNqTExKdnZ2aUpqZGFvbGdTSE9nRlVKVGkxTmxPSnh4ZEMzQnR3?=
 =?utf-8?B?Y3F0d2FwU29xaHptTFRFOWYyTkpjbnpwVVJjMWYyNE9QMGVRRk54R056M3RC?=
 =?utf-8?B?VVlhQ2dYUlo4VmQ5bXNqQUJjaUxRVGRBNHhUVXQ1aTJ0QUFYTTBLeDdadzlY?=
 =?utf-8?Q?07Fwr6xNPunKpVQ3tnm69gZct?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74dd874-d931-4228-9bec-08dc9f1bfa49
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 07:02:49.4380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cznZVsUba01TnPeXtFWg1kRCcgcauJ178EnyXla+k1NrT/STsopyZXansVgfj140vF1JJNzIacYM4eC8VUecQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9826
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

On 07/05/2024, Francesco Dolcini wrote:
> Hello Liu,

Hello Francesco,

> 
> On Fri, Jul 05, 2024 at 05:09:22PM +0800, Liu Ying wrote:
>> This patch series aims to add Freescale i.MX8qxp Display Controller support.
> 
> I really appreciate your work here, I am looking forward for a better
> support in mainline Linux for both i.MX8QXP and i.MX8QP.
> 
> With that said, would be possible to add to this patch series also the
> required changes on the DTSI/DTS file to facilitate testing this?
> Worst case you can just add those as RFC / DO NOT MERGE at the end of
> this series when you'll send a v2.

Will try to do so.

> 
> Francesco
> 

-- 
Regards,
Liu Ying

