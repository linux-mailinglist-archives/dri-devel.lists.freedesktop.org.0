Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F79FDA94
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2024 13:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18DD10E32B;
	Sat, 28 Dec 2024 12:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="YcXucDcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03olkn2012.outbound.protection.outlook.com [40.92.58.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2992810E16C;
 Sat, 28 Dec 2024 12:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/C+uQwbwNPWCsOM5RrPCnT/rI5L5styjb+1kXjokrLQvSCr+tLn6BnTK8/TGsKorAi6TU8s6ywtdMikn5eHJj9d60D2bQB+Y56CjSh8r3w4CY4ziv6QC4MQHTLlv/RJxhZNeRwrI1K/DaFQJH5ZlDfVcuQVyl7KNRPSQ3ptut1cfyy1GgIvZ9XgWYue13M3sNetI2fcSmCP1xBM6h6bAuqY8+Fevg5fF/6DXC9yuwrCPE9YO8ydqhbC7ZtFc5IDJrZSdMwutaGzGZd/ptR7ERK4Hv12ANsZNfqkSYoubDL4erheHecKW2056ry96VpD7NmjZnheqRA5TZW9VGngDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K93coqnW/CXleUZ0Pm1toyrG25RRLJbg1Qv8hrJyYMA=;
 b=Sa2KyPM7XhTtp+11loVL9Tuz3z0sWieRj6BHbBydClXYUU0xoF9K/d6+RSlcA1lFzuiFxyHqvYAhtnwMwc6X3O/Jq8yfGjegoti1F32/05qFXJ34dWCwtLteGNwhknMXvw7q8FOTIlWUL516D8JNiLgrAbmaDMpWlzg1iggUScdVSPbzgXgOugmqFTtRiW2Nojp/+Lqj+KhRTt7hBNXA+H8FOy3y0W6kyr2FpN7h3nRO5OFt+VZj0Gos1U2wX0fzH9b3BbYOQCuGq3LCoVIPaYOBzhr9Tt1CahnbGyu+chrYKXm/zwH9ZYWnQt99a+NYwQ2EkQxRaSYBT1ODyURsSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K93coqnW/CXleUZ0Pm1toyrG25RRLJbg1Qv8hrJyYMA=;
 b=YcXucDcE4wZ/SEIG4KrcioKxSZtcAcriujkzq0dljaFUKZFRjAUsqP/lGL9dnKsCEpwu4Pe8CrcLbDbGPZlnLebNBFDC+itDcOPyPrQ3fsI8dARV+6cQA4ca+ALMAMlLdy8ETYqrUyfJubV7oS8X1O6rHkEsUyZoCsa9dimgLs45AUjiSjibfjFeI/p7zN+CVJ45bUSdjERWB2LMGI1fegPbz/AYsMnqL5sQ7gkzR9ia+P3yjPrG6Vrhci+RT2FDzz+f6g1w4LN4DnFPrKtYN8gqQav3zKYTveHmZ9rZQyX78udfCcf+KwK+RieVsDzYpEUyF8Uu92cBvuNoCYugew==
Received: from DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ae::7)
 by PAXPR10MB5613.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:243::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.7; Sat, 28 Dec
 2024 12:38:53 +0000
Received: from DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::64e4:38c6:256:36f1]) by DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::64e4:38c6:256:36f1%4]) with mapi id 15.20.8314.001; Sat, 28 Dec 2024
 12:38:53 +0000
Message-ID: <DUZPR10MB82674B5F711950D71C0411B98E0F2@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
Date: Sat, 28 Dec 2024 13:38:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel problem with multiseat on one card - more than 1 user
 simultaneously on 1 video card
From: Gert Vanhaerents <gert.vanhaerents@hotmail.com>
To: Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
 <655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com>
 <AM7PR10MB39235076485E2E3905F422508E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <e046050c7e9be5d4f816d33dd1a9dd50e2de3308.camel@nvidia.com>
 <DUZPR10MB8267520A4F44DA38339969A78E93A@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <DUZPR10MB8267520A4F44DA38339969A78E93A@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0016.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::21) To DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4ae::7)
X-Microsoft-Original-Message-ID: <bc1c5708-6df5-426e-b37a-2140366bafbb@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DUZPR10MB8267:EE_|PAXPR10MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7a8231-87fb-4161-c944-08dd273c9637
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|8060799006|461199028|5072599009|15080799006|19110799003|7092599003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0d5MGFhUU9Gc2V3WUZwSHMzbnBNWWZ2REpyZGFTMHNhU1dacUQ3U3JtQlhC?=
 =?utf-8?B?NksrZ3BoNUxhV3JtTVE2TERPWENhdHJPZXR1eitwS0NHZ2ZjbzJuenpJekdM?=
 =?utf-8?B?TE9tQWZsdnhHWTBtUXdhNGdCMytIbFNCYTVCQnB5WldnSnVaUjc0OVNVUE5H?=
 =?utf-8?B?YWRkTXBseG5NNnRrTTkyeitTRkkzL1BUS1RGRDJmK1dKazg5NTluKzdnSGdw?=
 =?utf-8?B?cFAwVHMrU0ZJcGE3R2RXM093Q0JRc0xmci9qTHhyalRpODJKRnIzVlhnQVRF?=
 =?utf-8?B?TWpyV0JVdllIOFdhbGswa1hscjk0bkVTbU1YV3pXMnFXenpRTmNCd2tOUVhh?=
 =?utf-8?B?aGZYaW42MjA5SEM0amp2ZmZPVUZJU0diZzV1VTcvTFFtRmM1RE1sUFhiQnMr?=
 =?utf-8?B?eWhrUyt2UDFYWHAyL1o0dkpZQ3c0NHFCdDZzTDM0Qk9vdE5TQ1FZSWJPTmhG?=
 =?utf-8?B?UDh2ZG5uY09XOURLcVJMQmpXM2JoQkdtMnQ3RGRKaEpXNGpWc015NlNwK2FE?=
 =?utf-8?B?bS9SM3FUN1NEeFhaOEIyeFJDNmUzUGZuSFJIUXdwMS9SZXFKL0dHcllPTEVW?=
 =?utf-8?B?OHB0ZmlBOUpld2p1K3FJc3MydEl2eTJvTXcwckttaCtlbllSeGhPbDZUZmZI?=
 =?utf-8?B?Z3BaS0hzMkJ6bndXYk9QWWZpTzhUWHJWRm9peFZ1djduTEkzN2Uyc2tGZWJB?=
 =?utf-8?B?d3g1UFJRVTUybnFzcFh3ZVRXZGJacDlDdHdNeWpmeXloOStuZXFsYThIQWZm?=
 =?utf-8?B?KzhrRFVFYnVzZ0U3YnRYb284RzZDUmVGejZFK2lVUGpkNmlQMHQxREhVT21h?=
 =?utf-8?B?dXFGUWJPY3NlVDZqM0o2Kytqa3B3RU9ETjkrQkp5c0xRWnNoWmpvSEJpa0Vy?=
 =?utf-8?B?YTRaOEdUdXZiOEFVM0lvbXNQc3hsdEpMVWlyTWcyUFlaL3d5c3daeTcwK25J?=
 =?utf-8?B?YXlNaXpOZWdVbTFVeUJaV052MFRYZmRIQVh0WFdFTHdqak1NVll5Y1JNZTVR?=
 =?utf-8?B?b0xtMXNtSStrcHNOb043NnkwajJxNXhaUGdxVC9zSitlUkFVU1hCSlV2Z05l?=
 =?utf-8?B?aklGQXNTVGd0U1Y1YTVmMzc5cUlNbXdwLzRqbkZvdnhOMUhxSG55S0drbGEz?=
 =?utf-8?B?RVhwOGRSZWExTkhSVHRSUW9zZy9DVlMzNmgzalprMHRHZHNPczI0WVptU3BZ?=
 =?utf-8?B?c2Jxaklaek5qNGFlSU5UQlY3THVWK0pndzVtSFFuWWRBaTZGNWxtUFhNUGVY?=
 =?utf-8?B?Q1BRTm05YTlVT0hjV09YcFRod3ZjUHhua3RQQVZPOEVIR21Ob1RKeHZzK1Er?=
 =?utf-8?B?Y1QzMXIyQ3lnRWptS0FrdWxvOTU4R3lZZUJobmdqeGFvRE5reVBrd1Y4bVBw?=
 =?utf-8?B?RURxN1BWeFVqT2NIaWVKbXJnU2ltYVd5Z3FXUDJ3cjd4Ris3ay9mWmpIRnJm?=
 =?utf-8?B?T0VVWHRIUTJNQUFBTWVkT2tsSHh5UUtFblJVclNWM3BYMEpCSXp4RjIrbTNB?=
 =?utf-8?Q?XM+w6w=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TytUM3VGcDBnUmdzVnBKQS9mdXJReTMwZzNneWFadmNyUEh2citQUE9NUEUv?=
 =?utf-8?B?cmtlZTVMYWt6TTJ6NW0xMGE4eVF6WHZVbTJZSkYyVi9HUGo3WU5Oc016RVRx?=
 =?utf-8?B?cVVVbGNnU2ptTmdXR2dQS2YwZ1RsdkUrS0VlRDdXZ3VQVUxZL1V6UVIrdU1N?=
 =?utf-8?B?M3VaSHltMnhXV0luR21KQlNyRjFLY3JNUkgxYm0wRnFxU21SdGRMYzV0c1lM?=
 =?utf-8?B?OFhXdjZsZTFVamxtSklwamVrdUw0eEJtaWp3VXhQWkI4WDhMUkhpbnd4VTBG?=
 =?utf-8?B?K1RNRkhBR0RRd0FaQ2NQcWR4VWxCZlZIdGpBT2Ftb3pGamt6NTR3cmUwdHJy?=
 =?utf-8?B?NnZNTktCL2U1SzM5dmd0dnZGbVhybFFvY2FMdHJSbXpweEpFLzFQaFdEM2Vy?=
 =?utf-8?B?bE11Mi9Uc1hZbnY0MWxmcTdNS3Q0ZWlyYVR4dGZkOXg5S0s2R0pXaGtBbVJs?=
 =?utf-8?B?VXQzd3NpR2RQT3dSblVoSUxMZ0g5eXdlY0RJRkpxR3ZodkZVMVdiMGMxcGFJ?=
 =?utf-8?B?TkNQNE1Iak44UlE4SisxaDlBYXdNTDNlTFpDYnVKWVFmelZndmlxVmliMjNi?=
 =?utf-8?B?SzdqRFQ3d1lhcC9iQUhXcG1GWUp1REtJQWdJa3l1UWxIQ0pDOWpLZXlyRzBE?=
 =?utf-8?B?YVRwY21zOVFiTmNTeXNuOWlkQjdwZmVCT0hiRjlERVFYSGRsSXh5V3lpeVRp?=
 =?utf-8?B?UG5IUnpUa1pwZEhrc2tjYWpxY1NhbFA2aTdYVU8zRkloTHJxbndBeWpncm9h?=
 =?utf-8?B?QmNwVmEwb2lHcUN3OGY4SGpNaENBeUEzY09qSlp1V3dMZ05INFk2eStrWVQ5?=
 =?utf-8?B?dkhBNnVPNWhQdmFsTUIyMWJiNEEyZGFmQ0hCaTM4bE9VV0Z0SVlMdDBXZEgv?=
 =?utf-8?B?Tis5ei80WFVEM09ZdzZaSWNLZ3d2UWNjNXlOV0VxVkxHZEdpYlRrODVVQ2dK?=
 =?utf-8?B?Sk5LbFlLQkp0cHpXTmdGR3h1UHVrUUJpVFJoMFVuS0VWRXJ0UEJnTXZOYU1B?=
 =?utf-8?B?RVV1QzRWcXZGaGtrRXhwUnlTeHIwRVJpbHl3aEtnc3d2WHpSUVl1aTN2N0lO?=
 =?utf-8?B?dXJNbzJkMDYxT1U0TlVuQ2cxejR2aGppbG5JSEpzOWFjampNQjlyakttblZP?=
 =?utf-8?B?QzFiZUd6VUJoY2QvZDkzVHlqUWhKeTRFbVBPK3N1VFBSclRyY1FON0F4T1RK?=
 =?utf-8?B?dWdjUGlTZ0hDY0xaMjcweHBkS3pGSDZKVG5mTkNxVmsxbm44ZGJhN2tLN1NF?=
 =?utf-8?B?MnZMU0lta0gvcjB3cW9YeWNQQ3J5cm96UHk3MXlUUWRyVHVVaVFQa1JUZjJG?=
 =?utf-8?B?OVBKd1UrZXNHaTY4WFg5c1kydW5EZXlueStNNGhQSElWdGFPbjlPOGlPTEQ5?=
 =?utf-8?B?WXBBUFUwT2hOV0x3a1p4RzU1OFJqRW9CM1o4dlQyY01hcU1mNHRMd1g3WU5P?=
 =?utf-8?B?WEZGdUNYMnpPcmVPdVN3Rk5pOHIwTGpMTW5wRHF5Z2UyNC95WVJ1NFhDVDRB?=
 =?utf-8?B?ckVDSXQycjJrTU1ibHMvQmpoV2xDb1FIc09WOW9xRTl2VTROZWwyR2d1Ny9s?=
 =?utf-8?B?c29JRExBd0p5ZVlDd2ErbTQzV2J6VWcvU1VsY3pHVGVnd08xdUtEakVYU1Ny?=
 =?utf-8?B?TXcrWkJ6aEdlNlZRRjhraXI5ckhZUTJwSm1wVjE1amVkQ3p3bEY4eURQOVBz?=
 =?utf-8?Q?IBZVl5Z7ArxX8ZHyl3Hx?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-4359a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7a8231-87fb-4161-c944-08dd273c9637
X-MS-Exchange-CrossTenant-AuthSource: DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2024 12:38:52.9698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5613
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

In the meantime I have contacted everyone who could have something to do 
with it:
Kernel groups
System D
Nvidia
And gues:  Everyone says it's not their fault.

But we don't give up. Linux is such a beautiful and solid system. Why 
would it work with Windows and not Linux?

Our analysis has now discovered that the problem does indeed come from 
the kernel. The kernel does not allow several users to access a graphics 
card at the same time. Indeed, to use it, several users need access to 
the graphics card at the same time.

Can this simultaneous access be allowed by the kernel after all?
Or can the kernel be adjusted so that this would be possible?

In the meantime I am also working with a multiseat company to search 
together for a solution for multiseat under Linux. This company is 
working on creating an easy and user-friendly program to work via a 
multiseat with Linux, and they have already a high-selling multiseat 
program for Windows. The intention would be to create a program that 
works like some multiseat programs in Windows: install, drag mice and 
keyboards to the right screen, restart and it works as multiseat.
But such a program is only interesting if it can work for different 
users on 1 video card. For example, for a multiseat of 6 users you need 
3 video cards with 2 outputs each.
For now the programmers has a good béta program, but with the 
restriction only one workstation on one video card, but then it's not 
interesting at all.


Op 15/12/2023 om 10:59 schreef Gert Vanhaerents:
>
> Op 4/12/2023 om 15:11 schreef Timur Tabi:
>> On Mon, 2023-12-04 at 09:51 +0100, Gert Vanhaerents wrote:
>>> OK  i will report it to nvidia. But with the nouveau drivers it's 
>>> also not
>>> working. Are you sure it's not a kernel problem?
>>> Because according to systemd it would be a kernel problem. 
>>> (personaly i am
>>> also thinking it's a driver problem)
>> Unfortunately, it's not easy for Nouveau to debug problems with GSP-RM.
>> However, if the problem exists in the proprietary driver, then Nvidia 
>> could
>> fix it.  That would then lead to a new version of OpenRM that Nouveau 
>> could
>> use.
>
> I have contacted Nvidia and now i can see the outputs such like this:
>
> ─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
>           │ [MASTER] drm:card0
>           │ 
> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-DVI-D-1
>           │ │ [MASTER] drm:card0-DVI-D-1
>           │ 
> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-HDMI-A-1
>           │ │ [MASTER] drm:card0-HDMI-A-1
>           │ 
> └─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1
>           │   [MASTER] drm:card0-VGA-1
>
> But the problem is now the same of with the Nouveau driver. When you 
> do this:
>
> loginctl attach seat1 
> /sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1
>
> For the seat1 (the VGA d-sub output for seat1 and the other HDMI 
> output for seat0) and of course the mouse and keyboard.
>
> When you do this, all the graphics outputs are on the second seat 
> (seat1) and not anymore on the first seat. So i need to move only the 
> VGA output to seat1 and not all the outputs.
>
>
> The problem is that linux can not start 2 or more window managers on 
> one card (even if you don't need a multiseat, but use only one mouse 
> and keyboard).
>
> So how can i fix that i can use more than one window manager on one 
> physical graphics card? (without Xephyr or something because they are 
> to outdated and works not good).
>
> I have tried with: Linux Mint, Ubuntu and Debian all the same problem.
>
>

