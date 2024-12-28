Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D5B9FDA59
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2024 13:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8AD10E268;
	Sat, 28 Dec 2024 12:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="E7mwEjOY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03olkn2012.outbound.protection.outlook.com [40.92.58.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E9710E24F;
 Sat, 28 Dec 2024 12:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evJECFub8S9/lTfdUrqbqUteowpnkgcdHm2qh87tF97wQ/nAj6oPt2oWFuLFl3jU934ITJkb1O6phIhFoLFC2zyHcp75BOcWeTYpeH2UGh9vplPBYeYMLpZzmiwzjdiX6eIGlsXj8EH9EQH7um3dYgCbygUe7S5XzYZDDWbjIIDl8xxjZug6X9Ykbu7P/+WvPCZ6NhCJGlGaPlkTFyrGBdHfze7/nRhuWgE48M/5+podrH/5ux5rBIiPv3FcvKkA47ex1ALv+bP/4p+QM+x5rnJh1lsouJgQXsCm3IDvJPk3X33oaoLyfWgcVPEkBNDIVaAZvvvavIb2Aw5khZlMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9roYW1cN31g3Hrw/hw5BfFX03brIpm3lt4L/VX2GDo=;
 b=acTp0exbPYoP/uT+K+j+sof5jvR4nVWgNUKUTqf105E3HbCq2h3y/+mCC2aXfhJ7yW022qjVeL6BvOzWeNmXBXpO3d1sXtF+JencKGpaDHTVvdBkLo690QEn19rhjWYap7CYu8c5634SfMaWBd/7OQLwST2P1Its5Bjb7FQujax8aqj07owiQvSgb8GYW/NhK1/EGf5oqwKfPC2/lEyQRbvq0mmkF3FuForXhtV0iEGfPW6zL+2CsNoD5eixb+vgMGDReXN/x+cSKFJsLhWrdF8bNPs5zzgULN80UK5kMi5HRtwQ3d1U2CtA0sIt9QLtcFP7tFCg8YCLyU5bS6yWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9roYW1cN31g3Hrw/hw5BfFX03brIpm3lt4L/VX2GDo=;
 b=E7mwEjOYFtNhygqRqNg3Mw0er2twk4DS0bYfLvcyBnrP6FmX76jK3om033wVNgueFhPWj+aKAX7Hl7bevSNwz5Xbb8/JfQLFkpiYcPZPSCRZ4rpS4WJ0emf0ts1antDjVKT0UggHouaCb9fC4lA/t2r5sBBZbZh+S8vzqH1NNWiO8xG2uObfvDqqiIeBCAea+pdOpMthw9zAhl1zdKD5mJjn0dtL+uc74le5s38jfoU2Bpgb0JqPirmIycGVXjUAZViFGtrDuP+TKh/04kK9nqg7e0SL4yVM4FcpdN+z+Q0p6v1QjgomT8CNmy494rx9yPWajv9qJMjt1vjg0ZkqiQ==
Received: from DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ae::7)
 by VI0PR10MB8648.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:239::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.7; Sat, 28 Dec
 2024 12:06:37 +0000
Received: from DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::64e4:38c6:256:36f1]) by DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::64e4:38c6:256:36f1%4]) with mapi id 15.20.8314.001; Sat, 28 Dec 2024
 12:06:37 +0000
Message-ID: <DUZPR10MB826749327D6D88076935B9268E0F2@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
Date: Sat, 28 Dec 2024 13:06:28 +0100
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
X-ClientProxiedBy: AM0PR02CA0162.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::29) To DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4ae::7)
X-Microsoft-Original-Message-ID: <9f0a0af5-b3eb-4bab-821f-b1b6f51023d0@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DUZPR10MB8267:EE_|VI0PR10MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: 2105d92a-a4c9-4665-f41d-08dd27380f8a
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7092599003|6090799003|8060799006|461199028|5072599009|19110799003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFRZazZRR1paVzlLTWJRcW9aNTI5a0tZamRoTnhFTzcxa2hkVjdZMUxFQ1VZ?=
 =?utf-8?B?STJTMjIwNndlaGphaUJYQmgrNzlMSHRMbHVtTWxnMTNaWE5YTUY3NUFyYTBI?=
 =?utf-8?B?c29BdU01WkFRRmZEUTQyeHBoL3FSUndjeDgrQjBhNkM5MnR2bEtJSU9OQnlo?=
 =?utf-8?B?NXZOMU5kcnVsZTBYMUY1UmJMY3cvZFFpMURDTEU0R1NhNEZlRlB4Q0RQb2da?=
 =?utf-8?B?TmhWaG90NnJKcHhPT0M1cWdMc1FPVHFaQkczZWR1bVErWVFaRDNQdnd6OTZT?=
 =?utf-8?B?YnFjNFNjNmZWTFBzRUxPd1U0eUc3NTlFaTFPaWdiRnFGVjdhc3pYbVk5cUJn?=
 =?utf-8?B?dWlFNk5nUEJJUENmc0xydkNyc1VpNmxzQVdBRHRYV1dWUW1FbVpDaFdydVhJ?=
 =?utf-8?B?VE9ERkFPQWxWQWVoc2hkV2RyekRmLzcxbEc2VWZ0MmVGcjN0ZnFlN0M0UGNB?=
 =?utf-8?B?VERVanIreEhHRlY0YkNDalNNeFFFYTMvQnFyWDlwWFNaZHZxa215SEovTlhD?=
 =?utf-8?B?WXZRaWxaMGRIZWo0elhBWllMbWlVYmpMUGZUY3JHZDAzSTFUNldoaEdoRmVt?=
 =?utf-8?B?UXJwMXdtQnRCVWx0TndkcDF6S0RLSUJvVmVLd3NkcUhoTGFwSGxHSVdEZjY1?=
 =?utf-8?B?Uk5HNUxIUlFUMGJuYjhRaXIydVFBL2hOMFlBY0hhK3dpUms3cU96dC9xTmU2?=
 =?utf-8?B?ZHZTSXh2ZnBURjRoM0JRNVZJc3NSclEwbVZ1U3RxK0VjU2t3c244U1NESWxE?=
 =?utf-8?B?eGE5WFc1Z3h0bzBsSmVydVZLUDJiaXh5K1VubnJhZzB4cW5aTkZaY0tLd0gx?=
 =?utf-8?B?T3FGTjQvb1MvZkY2ZXNlVjhVZTZWcVZNZDNUdkMwVEVqcmJjV2JQeHkxZnpq?=
 =?utf-8?B?V1B3TkRGaTg0bW9Gd1E4aEpGYzJZM1FmNkYzSEZ1Zi90alQ1SFZucmpNVksx?=
 =?utf-8?B?b2dNVkR2VmxUWEIxVFF3NVN5TURXM0kwZ0xSRzFaWW41Q1FOZUpFZTU4N2Jj?=
 =?utf-8?B?Z0w2c0F2TVVFOFA1ZEFZTGRFcTVVNERKdG9Vd0lNbzRaODRjelNsTlk5bTFX?=
 =?utf-8?B?WTQ2NUtDSzBCeG9XcldXU28rdERlOXpxUVJlM1JpMzFtREw5WEdoRUV6WEsx?=
 =?utf-8?B?cHR5b2FjdGo3K3QvQjJvNURidXM4QzJqb0s1a1g2ejdJeDlnRWd3amIrZXlj?=
 =?utf-8?B?emVxSWlPSEptRzRQVS9OSVBvZ0RiYm9KYjN3UlVlRCtCSHdvM0lzQ29hejA4?=
 =?utf-8?B?QVFpdFZQcElLSWNVaUcrd0N3ZGpBZzNTSTByZHpXQkUxbS9WemorZTFHekd0?=
 =?utf-8?B?QThzYXE3aWdmN0FtcHI0bWI0Z2xyZlVMTkxOYi9kNUxTK3p6clNaeFhlV3B2?=
 =?utf-8?B?NCtvZm9YakNIWXhBbFVNZ0ZWcVk3cDV5VCtUb2c2am5YaG5jRTJiZVJFRlly?=
 =?utf-8?B?akowSTBjc3JNV05QTXVwc1hPTGNuVnZKd1VNd3FySjI5V0RBYjJrem93TlNI?=
 =?utf-8?Q?0lDEDw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmJoN3dLT3JWajNRUjllMWszaDVYbUlidTdVYlZGcTFmNHh4SlhmVXYyaEl6?=
 =?utf-8?B?dmxHejYwZ2NYVGxyOUQ0aDhhUUJiaEVBdUtkbGpyS1BtOUdPSmpSdVYwc2J2?=
 =?utf-8?B?ZWEvYjBIa2xDdWFhUngxUDNBMG5sdEtXVlBHQVN4R0w2Z0xPUG5EZnMzZXBX?=
 =?utf-8?B?ZzBYN0gyam9Mbm5ybmZsTWRycERJUWNRM3djRzk2T2pKaGJmOG5NUWd3Zy9S?=
 =?utf-8?B?eEsxWjlzeUkvNmpaY01GMm5VS2Ftbmdkdmt4MUIrSHpGZTB1WFBJOVFzUlF5?=
 =?utf-8?B?cW1CdlZ6ZTZpWHJzL3dURFRsUisyRjRBcTBMejlCNHE5K1BVNjQvZFl2Mm41?=
 =?utf-8?B?bDlVQVRSU0pvZURHMXVVU1ZRZmVKcUNjMWdic3pnMFl5TFBuYjNKTi9ha2t1?=
 =?utf-8?B?Z01lVzd6Yk5rck0zWmp3cHMyYS80N2hacURXK1BDdVF3UE9Hc1pVaVQ4MjNn?=
 =?utf-8?B?eXo2SHlrRDVEWGEyZlFPSktiN1k1eHl6ZVpjV0VnUlFFRHFCbzI3Q3lLSGdF?=
 =?utf-8?B?V0hXdkZlNjR2bmlHWDd2cmE1Qk1URXlPU2JLTVF3bE5WRWlTN2k0eEJkRHE2?=
 =?utf-8?B?WW1IZXA1SFRoTlJGZ1FuTklTZEFZR2dPczVsalNRWFdEaWNzVnF3WnRNZ0tS?=
 =?utf-8?B?UWowSXlBbmQxd3grVVdBN1ppMEF2ZUxUZW5PMUtQRSt2US9uTDljTHZZbHpt?=
 =?utf-8?B?VnBwVk5MRmNOZ0s3VmJzS3o3clpkd2w1RlE2NytCQ1pQZTZRb0dRS1pqQmZo?=
 =?utf-8?B?QXRXdWVhSElTRHRiRG9ScC91U3lESllTMDM3ZE84NDF5dzY0TWxoUGtmRTRr?=
 =?utf-8?B?VE16dEczTjdWSWd3U2QyNW5Ia2N1MXhGVnVialJMcWsxdHhvalhSbHNSdDB5?=
 =?utf-8?B?Nkt3TkNYM0dkbzNaeWkycEJ6V3VPNkpOcTU3NVBmM3B1aGFKNXpkS0RhK0oy?=
 =?utf-8?B?cHNFdCtGY1g4bW1hOUhTSmJxb1poN3BHMmF3Z3NvcWZGZzZYSXoycTNVeUUw?=
 =?utf-8?B?eXJrUTZSS0VTcndNMlg3dDlSZ0xVbXVSbTZJOS84RXVOSzJHV3dkaXMzWW9r?=
 =?utf-8?B?ZFh1NTM4Vzd6OVpPV2FLQXFjdkxqY0hsM21ZOEUydjlZdDQ5SWVDL1VJdlhS?=
 =?utf-8?B?YTcvdXVRZGN5QVM1YmlVSGg1V28zZ2NWbGZoN1RaY1dIWnpiVnNlTGZrYXpF?=
 =?utf-8?B?MUlDOW9RY1Jjc1JGc0o5TGo0bmZ2d1FKS21Wdk0vY1A1cE5qVzc2Y3hTVjVI?=
 =?utf-8?B?Nnp3ek0xZDBOUVVtTUZuOUhRRVJuaVNUVzRlMVVuK1pUY3dKb2RycytEOGRG?=
 =?utf-8?B?RGo1K0dDaDF4eVI3RkNveTEweWQ3d1lHVGlJYXpiaHF4U0I5VXVTcElUbUNx?=
 =?utf-8?B?NDFPd2VIdGZ2MzN2Z3ZOVnJ3SHRDYzhyeXFXL2w3NENCcEhEZDBhTDl3Y25Z?=
 =?utf-8?B?amk4bmJDbUo0TVAwcEhWdHY5MmdhNitTS0RWNjd6RWdLL3ptV3VWZ3hVVmZR?=
 =?utf-8?B?MGhuVTZqNHVOUW9sRW9pR0daa2F5TmttYnJBekpuZjlnc1EzK2xtbnFNeHdt?=
 =?utf-8?B?ekRTaFpPNGxDZjUvSHJDc2xIN09zZDVsYWU1bG9LQWVtaEw0UWwzN21ZaldS?=
 =?utf-8?B?c3NJUTVFMlIvaS8wbUs5VXlLZ2JncmFMMmNhNUlKSk5WUlZjL29EY3YvdjZD?=
 =?utf-8?Q?Bh9YCLCIjjTG+JD6W4Qx?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-4359a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2105d92a-a4c9-4665-f41d-08dd27380f8a
X-MS-Exchange-CrossTenant-AuthSource: DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2024 12:06:37.5316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8648
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
