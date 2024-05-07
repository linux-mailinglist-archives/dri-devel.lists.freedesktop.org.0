Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020798BDD40
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 10:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EDF10F0EE;
	Tue,  7 May 2024 08:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="gARkynM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2113.outbound.protection.outlook.com [40.107.20.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FC110F0EE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 08:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFnvZOSczVuRvQZrKu7Kgu5bOUomTOLRkt+klsiiYRioP6Vzs9IuRX/7Ru271ARbccAv8Apok5A0Z47930iQN9IDjGfStKm/OTzKYmQIiEOEBVJMGWPIaDuzggtEjsaQgCmLjbozPFCH2uP3Pp05JEqtbhe64142zp3Qqtuq7HkmUxaZyVZbbOG9cgVPrrrRQ1PxtHOMe/Z2vTxV4a9GeoE21SlWwd3uJd/ji4VBLfgoVliZScjPJNayPdoktHnpmx9P0uibqycHc9jt2krxGPiyTXCuZHytntRl3qnLsLjg5Na7WFDzrvDGwsd4c0I9cqUNiV2vnMmaB/9lRmaCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hABu3hwzC2laDHUSolrFA9iZUiJqYiewSWbQckfrd4U=;
 b=f2vmOv6buwvOa9w8EkH3aNUMWyFrtA6mJf53ysG3NXVDANCVXYUmeeHjkL628LyxgkAI7WWpEe/3xdflFOSnkpXDrS/NYjEIaV2hAAMQbKRXMbVv6+rbrfHjFIp+rSeL18N2mB4SqVDrazm5SV+mIvbzXX3pJ/IziE/K5v4+JXn5LLAoK03RPZ7B57tYkKlu/Zgr9UsnBsNHrRD3Hd3kugW1ji8WXlvY1Gr+HjZZciInQul0mY0Yb1UtKQvVcoRwV5yWW/OPFc66uXUf7V6icO2w1sI/g17KucoPwJkNfyPg4G0genJ4imfBHBae9iH+xDLtw/x+/MDGvY7BLEh30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hABu3hwzC2laDHUSolrFA9iZUiJqYiewSWbQckfrd4U=;
 b=gARkynM9EbsunGys3j0NvF3a/vOhe2q3pbw6LMA8VKsppsORzsSsxIFRrRJGGdm0jiUl0uEzmZ8s1sfU6TRp/nCWbpjK+ho7p5gRRPDTuDMfHZxyQ01Xx/x6NgfjowoCkWLoKtQFiZoRquVGL+q2AZ5DYljhJrgBtRcpdWxwm2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB6433.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:56c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 08:40:37 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 08:40:37 +0000
Message-ID: <c20b59a1-4aba-4c68-b2b0-5cb4a0281540@kontron.de>
Date: Tue, 7 May 2024 10:40:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
To: Adam Ford <aford173@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, marex@denx.de, aford@beaconembedded.com, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org
References: <20240211230931.188194-1-aford173@gmail.com>
 <CGME20240211230945eucas1p1863deb244ef4fdc68825ff01d082e270@eucas1p1.samsung.com>
 <20240211230931.188194-2-aford173@gmail.com>
 <6fcfe1bb-a1e9-4d7c-aff7-e572bcdf5d31@samsung.com>
 <CAHCN7xJRgW4Y3YML+tToPw1TgA3o158XCEUcb9p-S+nvDWgzRQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAHCN7xJRgW4Y3YML+tToPw1TgA3o158XCEUcb9p-S+nvDWgzRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS8PR10MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cadc207-90e2-408e-922c-08dc6e715e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXZuWmRYM2ZaSHV4aDVyejFjbHZSOTAzNmdhK3FEenRqWUEyVnAwSUlzSUpK?=
 =?utf-8?B?QU5ySWhoSkVjcTBYMDRhMjdxcWJRSmVhNFBkb3hBaktjQ2NRejhpWGovNFpM?=
 =?utf-8?B?c1pHeVVIVHBONmZqNGd3QWszaWlOdEc4dnREaHNVdWZhSzVjN3hvOHI4czJo?=
 =?utf-8?B?RTgzbk9yZnhoT1JTcWhkTFQvaHUyZXJnZzNGUUFQWE5oNE5ONWR5bUZyMC9x?=
 =?utf-8?B?STlBM3ptbWlBV3dkbytRQlpnUXdrUXpDTnF1WG0vREg4NEZ5TkZFL0xsQlE3?=
 =?utf-8?B?TnZJbXV6SjlQSkx2RHViWUljUG5hTHl1UGxJcDlucnhiTjlIN1FHRXV6ZFdr?=
 =?utf-8?B?eFBFZVhzYnhiNXl3aGYvNUIzSlNrdHFnaTBoaUhBckxpWVBFVTl5ZTJ3Ym80?=
 =?utf-8?B?RTFOam9Kay92UzI5Qml6ZVNtK1BidGtzVFdtWEF2VEJrMHVUQXRReGlHeXk5?=
 =?utf-8?B?TVNjTXpodUJGUlEyS3lIM3o5VTZ2bTZTTUNjRW9QYjNGVHZHczBWc1lUNGhC?=
 =?utf-8?B?YlgxK1FGZW83clhPdjFQVXgvK08xVzdKN0RDZXZJREhOKzM4M1M1TFNHVVFW?=
 =?utf-8?B?alNTOXN2blJOUFY3Und6RUpqM2hXKzVQbWRLZDRBTGdsRzNSWXhXRHkwK1pV?=
 =?utf-8?B?cTRIamIxRE80aXpsQ1VHT2NpeUhPNTZNWkF4bnpnVURoaWJlS0QzTjFzRzQ0?=
 =?utf-8?B?Vzdrb0JhOTcwM0ozSjV2ZkNjTEwrM1l0TVpLREFsdUtxM2JvQ0ppdldnclp5?=
 =?utf-8?B?R3hYZXpUZE1lWG9PRFlDMTJ4dlQ2Z29QNzgyeXk0YUVIUUpGNEJUOFY5aGds?=
 =?utf-8?B?dW9QMVNscDZDT25zWW9SaC9QSHdXMnNBOEE5cDNmL0d3Zk9jQ2xIdGR6ZTVt?=
 =?utf-8?B?elkweUNENHZxQWpYTnJCc3VZVEMwZlZHMno3RU5LSThnOU1WUWF6UG1qUzZy?=
 =?utf-8?B?bUlSRVhURDVvWmorYk9jemFKWnZkVzVuQTgwNGlNYWRBdnMxcVhqSkJVZE5o?=
 =?utf-8?B?dXRhVDlETXk2M3ZyNnFPcjcyWDQwK2tYdHA3R2o2eHptM3NFZUh5MjNacjRq?=
 =?utf-8?B?dU5xWXdSWWl5ckZnZmhabXNENWF2ZGJRclUwejNwd3FzdmRwd1VwK3hWcC94?=
 =?utf-8?B?bE9iY3BDZm1iR2RzSFd0a1dkbTZuNEVhZkVpbHJNejVpeTFpK0FWeVZEbkxT?=
 =?utf-8?B?SnRLc3VVOTBHMFVZNnpvSHJWZVFWQ0lneTN3eWNWTHZWT1hocEVvTXlPZHcw?=
 =?utf-8?B?c1pSa3k5YjU2SnE3dWx2ZDVwUGh2UVI0aVBMOW1oeFQxTEljTjdDZ2R0REp6?=
 =?utf-8?B?L2ZMS3FKUkdUNFoxSU9xZkRyYjFtNkdRd01ncDN3VlpBOENRcTZNRzZ1Z2Fr?=
 =?utf-8?B?UnR1T0srWmd4K0UzYklKTTJhTkZMQXdTdHRlREJaV2tWdW5KeU5yQlA3YUJE?=
 =?utf-8?B?OC80WlV5dmFuNXRob3c4TDMxRUx4Vk9tY3IrNUtFL2oyVXUxdTE0OE1tcE04?=
 =?utf-8?B?Z0NjVWdLYzMxbWNZTzVYWG5udGZEc29KRTkzazdzM2ZlMWR4Uzg5VlNCOWJO?=
 =?utf-8?B?TWpPMUU4N3RFY3c0cTRUeDhKN0hwVmN6aHZSa1lqZW5uYjVpcmM0eVlSRnBv?=
 =?utf-8?B?RTFvbFBhV2g5MnJrT2tEMXpDdmVDV3FxUXAzSWdEOHdmdERJTkNPU1gzTGVt?=
 =?utf-8?B?K0ROMk92VXAxMU1PazZ2dTRTbUlTWUdyaWZvWGNDM2xOaWpPTFdWeW1nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE9iMEJESVpWT1dDQ0kzc1pjS1JyZEFNalpKdzdYSVVmUDFKR1NwZCtDZVYr?=
 =?utf-8?B?bjlBZ09vYmR1T0NkdFh5blVScjFaeERsNWNJNUp2c0xGMzFSYmVYMWliSVBs?=
 =?utf-8?B?TDVRaHkvQkJCaDIrT1JzalNuOHRzVnYxbytnWktjZlVDWklOcFh5WDd6a1dW?=
 =?utf-8?B?WjZrNStNV1FVUGRnZi91STRBREhzQkRWeDZMNjNDQU9xZ3FZTHZ4ZXFaYjli?=
 =?utf-8?B?WHNEQTU4UXlVNWJjckhJZEgxZEs1OGhFcXdwNGlBcUw0Q3RocXd0SEpUL0NV?=
 =?utf-8?B?Tkt5QWh6dENWZFB6OCtkcXh2SExXeS9xM05LNnRhWnIrQWVGbXY3YkVQSS9w?=
 =?utf-8?B?UGNGUW5PVmRRc2VtUThKYTU3NlFLbEk0RGtaamF3c0d0UUI0T01UUzhTcWE5?=
 =?utf-8?B?RVZzbmV3QitseVVselNmNkRnUWV6K0ZvVGJ2L0w1dUY1b29tSmhSRFV2c0J0?=
 =?utf-8?B?LzBVaGRpRldBUm9iZkhVYktDRnBLRmVSL05ON1E5MVNQd2w2ZWszQUpuUUd0?=
 =?utf-8?B?YS9ERUgyaFBKcERFVTM1YlNDNlJrSDh1TzRlTFd5dDBzUXdDSmc4eDlMZ3di?=
 =?utf-8?B?UEJiVnVuRU5MZXo3ZVNKTFpldCt0UHdCb3BQNGg3dmVtZTJhb2E4OEE1K0pk?=
 =?utf-8?B?dmd3T3FKS1J1Nk5FK2pseXdrcFRmQ09pVHNrN0pPb1gvNEZpNXVDWTRMRzlI?=
 =?utf-8?B?L2JKWU9LVXVoZU1HL28rVVdueTc1K1Zzd1YwVENXUkorQ0dyOXFwUitTYU9k?=
 =?utf-8?B?Rk5JWWtSUDl4cWJKOGZqUWorbnNrbFZFVktTTXhPbFZ3WE45SmFyMkRRejg0?=
 =?utf-8?B?cGlaUGFwOXNTSVcxT3pUKzUzSldWeTJIZ1h3TGFtejRDcTJLZTZaaDB6QkJ4?=
 =?utf-8?B?S1V2MnNBKzk2em5EcWVFTXRpZGZvWjZjM0kwN01HWFB4RzRKRVJpbnBSd1ll?=
 =?utf-8?B?RnVDRU50ZDJoNE1ORG1halVlRUpVTmM5WEdNeUhRWWtaTXVZbm5LckVnME11?=
 =?utf-8?B?U3JqMU41QWtSSkxPenYzVzB5S2hxcGREaTN4dldRaVN2ZUU5b3RrK0U3MThv?=
 =?utf-8?B?c2s5ampVaXJlRU9ST2tHeVhzd0UvVENlVzl5TG0xV2tVWm41MkJhbUFZWkNI?=
 =?utf-8?B?RFVuS1NMb1M1OStjTmw0cWN0RzMwVGxabEh4bFJRL2xKYk5aMXBiVXBqa2Iv?=
 =?utf-8?B?NjdPcVJlQ0k2RGdJSUsvcGI4R3lGTjRQdURRSFRQaTROL1BoNExDVkNHN0FU?=
 =?utf-8?B?cUJqaDl0Q2h6Y3BKUXBKNnNqNkEvcG5Md2lNZjVSWXFYSnkxTUFIUml4dTE4?=
 =?utf-8?B?U1lLS0VRclRPUHBFR3M4U00xMndwTDZuUFRwK3BsbWYxUEo5eDZRQmV3aUNO?=
 =?utf-8?B?cnNQNHdFSUZzVXZvc0c2bXQ2eVFSVnNtMi9ldlZxTlViWnJlR2hDUWptYmMr?=
 =?utf-8?B?OTZsNXkxU1FwVHFzaS95WmRTS0lHSy8rMjc4dTFDVWd3T1p5VlI3Qm5wem9U?=
 =?utf-8?B?SGNEWm5wWjFxN1hxejFHWkdIeHhhM0I1NWlVVUpoYUhXendUZzF0bmVpRnVU?=
 =?utf-8?B?MkZQOHFzOGttM2s2WkdoQXM4QjVMTUJmcmdWdjROdlpCYjdzcE5FcnZXMmdQ?=
 =?utf-8?B?MDQrVGFFM2dzQlczTDN2QmRqbDdZQWVoN0xrcEQ1ay9ZR29nQmRqTU9tb2Fp?=
 =?utf-8?B?SGlnSS8wUWwzeHdyV2tXdEQ5NEE4akI0QjVjL0x4a1BWS3VsU0pXTjJzNGRz?=
 =?utf-8?B?YWVmVWxkbEd5L3J5RERmckhpeXlrdmdHeUgyZWpzaGtqQ3NreEVyeUJvOGtj?=
 =?utf-8?B?dzNxb2pZYnNRcnhTQmwwb3JEZEFyOGh1OVVBblVHcG5MVy9acDNlTkwvVlNr?=
 =?utf-8?B?OFlSVWJaVjd6YXdoU1UrRENzenYyY0Y1Q3hEamJoYzBUNi92RE5LYnlGa3dr?=
 =?utf-8?B?K3JRcTFoeHQ0YlI5UFJHbURHRWVUZlFqSEJFWU42a0Zhd1Z6RUVEeXZPWmxs?=
 =?utf-8?B?R0pTNHIvakhGNjVzeGt2QVlJTjB6Q3NFbXk0Ny82MXA2OXlWaDJrMjVJcExi?=
 =?utf-8?B?LzljWDRsRUcyTGVrVUlVWWhFVmVFNm52Y0xRUGJVV0ZNSTNhdjNVWG1rejF0?=
 =?utf-8?B?NVRLLzB6cVdiNGU1c21TZGk5SGdTTkllclNaRUw5akFtdkdrRDVyWHZxNENh?=
 =?utf-8?Q?Peib/3HCwbJ1+dUPiyrhx2M=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cadc207-90e2-408e-922c-08dc6e715e59
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 08:40:37.4101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbidwtegzkDU/vEz3zqKtOB3JdoZ+yZs26qz5/MFezJHEhflp2qwjbSH3AjNX0bm0J28wSl0jzUCJeSdxVxqOxkACHoH8vGGluKz7xD4hYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6433
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

On 25.04.24 22:30, Adam Ford wrote:
> On Thu, Apr 25, 2024 at 4:19 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>>
>> On 12.02.2024 00:09, Adam Ford wrote:
>>> When using video sync pulses, the HFP, HBP, and HSA are divided between
>>> the available lanes if there is more than one lane.  For certain
>>> timings and lane configurations, the HFP may not be evenly divisible.
>>> If the HFP is rounded down, it ends up being too small which can cause
>>> some monitors to not sync properly. In these instances, adjust htotal
>>> and hsync to round the HFP up, and recalculate the htotal.
>>>
>>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.MX8MM with HDMI monitor
>>> Signed-off-by: Adam Ford <aford173@gmail.com>
>>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Thank you very much for testing!
> 
>>
>>> ---
>>> V2:  No changes
>>>
>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> index 8476650c477c..52939211fe93 100644
>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> @@ -1606,6 +1606,27 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
>>>               adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>>>       }
>>>
>>> +     /*
>>> +      * When using video sync pulses, the HFP, HBP, and HSA are divided between
>>> +      * the available lanes if there is more than one lane.  For certain
>>> +      * timings and lane configurations, the HFP may not be evenly divisible.
>>> +      * If the HFP is rounded down, it ends up being too small which can cause
>>> +      * some monitors to not sync properly. In these instances, adjust htotal
>>> +      * and hsync to round the HFP up, and recalculate the htotal. Through trial
>>> +      * and error, it appears that the HBP and HSA do not appearto need the same
>>> +      * correction that HFP does.
>>> +      */
>>> +     if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->lanes > 1) {
> 
> Frieder  &  Marek S,
> 
> Marek V is proposing we eliminate the check against the flags and do
> it unconditionally.  If I send you both a different patch, would you
> be willing to try them on your platforms?  I don't want to risk
> breaking a board.
> I used the check above from the NXP downstream kernel, so it felt
> safe, but I am not as familiar with the different DSI modes, so I am
> not sure what the impact would be if this read:
> 
>  if (dsi->lanes > 1) {
> 
> Does anyone else have an opinion on this?

My test only covers hardware with the ADV7535 which sets
MIPI_DSI_MODE_VIDEO_SYNC_PULSE. Doing the test without the check for
this flag won't make any difference in this case and it's therefore not
worth repeating the test.
