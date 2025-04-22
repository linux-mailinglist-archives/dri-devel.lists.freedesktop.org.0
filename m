Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5B4A97041
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E641310E5F9;
	Tue, 22 Apr 2025 15:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Wyx+L8xR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010015.outbound.protection.outlook.com
 [52.103.67.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD5710E5F9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1WQjf+D14cjSMZqan0mZKhPoYjRDowDo3tfhhRawJPJ88lW/ZT0Oz/bUQcuhUHFxZ5iM+81m+Eud+odFRPuvWiVH2M1TSSxGJYkrQwZxhJKHKX9e4QKUSvn2/Sy5AZ3YSPtO60afMYyJOK17gKjhv32yRXJejiZpjgLCgkLhpMMOZqbeKPZlobT6BkaY3QEpBCxNoMpssQhaA6GiOW1mS4wb8g3fNfIhaJQJ6IEn4dB7JTCLGa8ZvBmCvVm73cjAw2kjBp/W6aHCBmPy8AItc+FBYmuxsWJzFuZhC95fqGhqujzntfoX8XBBcUIuTRDp6ZVZJgT7lrLuCpsKSAQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+famr1cnncFNxpigUJAMCc+1R3El7HHLF98jOMtuOE=;
 b=lodiLywZW7aYxz2EK4ymJ+emhulsfIh6pfx+Q/84kjWsFKF6Ae2+QskeJkHalXQCK5SUN/IRpM/leG/OP2t+F5xz4sxYt6cCCV53ZK8VWvLpeA9eGsCyHgCOQFrnwN7TYdVtkLjdXBsk9dKacM9vcOs/IrPfQaTUTqv7D9s3QAlgbJarmno+9ej5nT+xnNDyCvdmwEdYRaeKU95bwLpeJnKOraeQ6jA+YD2UmXdM6tfoajaNKxM/MVwtpEyazJ1qNQfg6PaFGHDfoYjda8zXHFwWt1xtNZk/U0tMY406o8Ay26uUKigudt13eVrFbCNOfhRyra40++e92XZyVFQcbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+famr1cnncFNxpigUJAMCc+1R3El7HHLF98jOMtuOE=;
 b=Wyx+L8xRQoOJyGTafmIRWAPD8OF8/jLh59PTGocXaqwn/lLoBq4mK+T4N4TIHdPvUmhniw3q/Q0FBDiFaZAqujE5kEfYzC4wOgh4RcoyMe4LH4xrvap9lNcKM1AHlrOd+7w0C/xuH+vfSuYEirt2fvQ9h7UfWfva5sEl7DjSRs+yVMTotqLFzYnHdANQ0Twwm5uMRxH64VNLTEUaI3NcSi3CaO/75pqkk7ju5i/tsn4t+A+x4gOHGs9uWD25MdXfCGU8Yz1AcYrYnYUQrvWuDL33zxGRMiE1S7ycyaGTFEgW5ftGh7S0KA2WiTlJLWrgU7ek5V6PPWAvCMqUgG0/7A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNZPR01MB8140.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:3d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 15:15:35 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 15:15:35 +0000
Message-ID: <PN3PR01MB9597D8AE22D48C7A5D351ABBB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 22 Apr 2025 20:45:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io,
 Petr Mladek <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 netdev <netdev@vger.kernel.org>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
 <aAdsbgx53ZbdvB6p@smile.fi.intel.com>
 <CAMuHMdXuM5wBoAeJXK+rTp5Ok8U87NguVGm+dng5WOWaP3O54w@mail.gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <CAMuHMdXuM5wBoAeJXK+rTp5Ok8U87NguVGm+dng5WOWaP3O54w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::15) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <64ffa686-186c-475a-ada5-5548d03fcdcf@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PNZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e839a6-0491-411d-eeb6-08dd81b087d0
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|5072599009|8060799006|15080799006|7092599003|461199028|19110799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXFHZEZhNnhYOHB4OTVHc0NUSlFyU3JqcGFSNmZRVWlhbDZKWnJoU3VlOWNt?=
 =?utf-8?B?ZXArajIxZjRBMWFJemdqbmcrL09PVjAvTmNudzRJa1NyeDUySVRIRGNaS0hJ?=
 =?utf-8?B?dVdQQmdOaTZOdGlsRm5KYzJ6TUFja3pIeWtieDg5b3VkVW1MdFY4VkU3TjFR?=
 =?utf-8?B?QTFGdVZIYnFIanROMUFQTlJCM2JaYVdxcDhPUStMVUpVSkwvaXpZSlYya2ND?=
 =?utf-8?B?N2s4aXhQWjVtcWFGT0hPcVFqTTlwcTBCc1pZd1pmUGQ3c0tNMThMQjI5K0d1?=
 =?utf-8?B?UW9jUThoT2U3SUJxT041SmI5OXRiZGtqKzdwUithM1Bsd3lXSkZtMEtUY3pl?=
 =?utf-8?B?a3BySEVzaURRNlRDWUpOMEJQTElQbFg1N0M0MEpmRG41SzhqOTRNazkwallR?=
 =?utf-8?B?ZHN2OHFaOC9RcEErNG9PTTJ0eUl6N3MvcUd0ZFlVTFk2SzBjKzNHTFFwZ0Zt?=
 =?utf-8?B?VXMrLzhEblAxbHRUbDdnb1BTMlVCbHNmU0hjT2tHeU9ZNTNPTlJITHZGdTdD?=
 =?utf-8?B?RElFZVNmaENsdkEzZ01MMXpPTGtoaGIrUGtHeW5vbkhybXdmSElwWlByejJl?=
 =?utf-8?B?ZlowT3Z4SXdCSFkveENXanEwcGRLM1d5UUJNbWJDaXJna01uZDF5amoybDBI?=
 =?utf-8?B?NzFWTHVDN1pQMDR2eFBsaFJSTlR6TmlNcmFsOEx5NGJxWGxYZmErQlVFdW9K?=
 =?utf-8?B?YWl2ZStQRzVzNytIaHJQZTRBVTQ0MlhJTURVWldsdC94ZGNwQzAzR255TG4y?=
 =?utf-8?B?WDQ3bzRyVW5VRjlRL0hJbWpBMEJ1aG1GaGRic3JtMW4zYkdjYmJBT1RjZ0hv?=
 =?utf-8?B?anJXOU5NRUJIdTdxeW52TTMvV1ZiVC9wNFdYbXYrTHY1Q20wcUFLYXN3Qm04?=
 =?utf-8?B?dlM0cy9MN0J5NHVBeVQrZy9KVWF0SEFYejNMV2FIbW1TUmxEOUozM1U0Mko1?=
 =?utf-8?B?cFRYYklORXlhcUdsSWk4L3N1RHozWmV4MitOTGFKKzhNa3RBVzBHNFp2cHFj?=
 =?utf-8?B?Zkp4SXdhTGdqeEk5TWhIMVlpc1F5VGFrMFhEcWQ2N3dzZ2hueWRHWjEwVUNp?=
 =?utf-8?B?UXRmMU12THFTTVV2THQrSGhhZnZ5b3JkQXdMMjd2SS9GU3lHV1kxZ2xNTmdr?=
 =?utf-8?B?ajRDUmRRQUttY3hLK2pLdHFhcG9nMnlvZDB2VlpJMnZzTkJiaFdZZmFaNkFj?=
 =?utf-8?B?U2RRano5M25pc0YyWmxMVU9OaXR4dzRaVmVPdXJRbkhOZG8xSlhYdVV4enJa?=
 =?utf-8?B?elpFa2xZdFlJdGlscy9TKzE3N2JKRnJ3czJBRGlXTEw5eWsxeEtsbTArVlhh?=
 =?utf-8?B?SEpyNFM1M08zR09KODBXV29OSjM4QUt5Nk9VT2FCMXV5ejhVRDh2R0NIeFI2?=
 =?utf-8?B?ci9GbXoxTERjZTNUSXJWMEloZ1VpUndPTThRa3BRbnRyZk15anFHSzVVL3Az?=
 =?utf-8?B?OEgzQUdSRXIxZFVlTjVvQlZyWFdDOWlJdk5WdmtkSnFRU0NLL3pnbU1MSXpN?=
 =?utf-8?B?ZWtRUDkvNzlJTTVZalVxbUVPN005eHA4NTVob2E4WFRaL3BZd3JFTkc5UzVw?=
 =?utf-8?B?Y2oxUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzZBdFpsc1dremxQcW5nd29od21HbWtvYzRURklEamVPdU45cHFRalduOUtG?=
 =?utf-8?B?YldhU0dGTGdxRUl2UWtSQU93THZRUzdCZXBVaUw0aXJoUE9Kc2FzUVREMlhy?=
 =?utf-8?B?eGtEZ01wNXc5T24xNG5La25Ddzh3VXRNVEErbThpd2tkcCthRzNWRmFqM0lL?=
 =?utf-8?B?VFlzVmpTV3hmQ2NFeHptU3NodTVDdzl4b2NGYzh4cVROcTJmOHcyZnBhaVlj?=
 =?utf-8?B?Q01xWUtzbk1EL05vdHVhalVFT2tRQmhPTkJ2ZVFmWHI0SERpRjFVODlRQ3cv?=
 =?utf-8?B?RVJRdVhOQVhtVFdydnFzcHlGdks0L1FHZWd3R0dwMUFieEJtNzMwTHExRGpM?=
 =?utf-8?B?YzU3Sk1PNC90WDBtZVJhbnVNaGorSGhRU3N3aDQ5STNia3RJZU1TdkNvZWxl?=
 =?utf-8?B?RVZaR0RHaXBNYUhOUFZWN2V3VExUaDd0TzdxVTR0Z0NPQ0s0Q2VhNnJOTnpZ?=
 =?utf-8?B?azVKZTJ5dXRpbDVIdGhIcStFdUdSZjNnTHZHTkh1ampmd2I1alBMSThoSitQ?=
 =?utf-8?B?M1hYdnF5dDdhZmxxUEc4Yy9qQUQwTGJLRFIvUlozRmxEZS9tZ0UxTVZZR1NP?=
 =?utf-8?B?bzduaGxVVmd2dHI3N0xZSVNLWmQyTENick1Zc0padWJ4RHBQU05DM01oTjFv?=
 =?utf-8?B?QmRZejliMDIvdzM5UUJ1cWsrdG95L2Nja3hEMHd6L1Vobk5uQVp5RFVwS2lE?=
 =?utf-8?B?SWN0RWoxMFpsZEhYMmR2VTNqbW5aRVh1UTc3SGIwbUc4eDZhTFk5UHFsN3cy?=
 =?utf-8?B?TUdocWt3M0FQSG4zRDY3ZmNxSDlVUkxCYU5oTWh0aDB5NnBmSFhTdk1kMU5K?=
 =?utf-8?B?U2dlMDV3dVRaMldjNFdGS2NVRms0QVk1MmVML090RERDODJ2TjgyRGZtOVow?=
 =?utf-8?B?a2xJUzZWeGJNQ2pVMk9rS1BHZHdkWGs5Y3QwRnNvcHFqNzRYZUlkZnpHMnpV?=
 =?utf-8?B?N0hhamVXNjFnemdCdFFXK1Z6R3VGWnBZSFEyVS9od0xJejJBZ2Vwc1k0cElP?=
 =?utf-8?B?TkJPa0l6YnFKOHVDK1pVdkNPV25DYVRIakF3YWxmVkRkRVNsa056dTR5NnBh?=
 =?utf-8?B?Q1psbGh1YjByNS9uRjRKT2Zkc2NpMnJ0bTVxeU5xSEdmQXFxTDErNEFva3Nk?=
 =?utf-8?B?bVpHNzNTaGFVV0ltZ25CV0lsdTZwaFRhMlJPNzJPWjhBK0R3aGJBajJrOFFp?=
 =?utf-8?B?MHZ1elh2NGw3b1NHTml1aGFGdjdBL2djWWZ2Z2Q0bGpyQ25pQUdqVm8veG9O?=
 =?utf-8?B?RWFYclcxTkVLNXIrRDRucEZmc2FyV21NWTY4VmRNdXNPakg2c0pFRmF0Mksv?=
 =?utf-8?B?cTlMQ2dWbG9GYXd0Zlp2YmgvaEpwUGhCMzMzUFd6N0ViRS9pblVUa01LM1NX?=
 =?utf-8?B?OHBsbVoveEVJVER1YU8rNWp1NUFLMmJBY3FkNkVMOEJOUEFubmVDY3ZnU0Zl?=
 =?utf-8?B?M1RodDB1NHBub0REOWxvSU5TWVBYZXZheVIzdGlUZUhXR1JnQTc0UmtHVWYv?=
 =?utf-8?B?bDVEOHdodGhGOHN6V0lpN3MrTnBRSVBuUUtEZ0V6M09yc1o5WTRaeEFsdys4?=
 =?utf-8?B?ZENoZnVuUWprRjFrbmVjOGdoaThzOTFnd29LejlnU1pXaGJnNEZncU4xUUVI?=
 =?utf-8?B?WSs0YWN1VGpWSWJXR3VVWHNramVNa1pjZHoxNldTdlpDZVlPZDFVdjcyWDFj?=
 =?utf-8?B?QTJuN2FUT2wyUno2Y3JMbjRSZ21uaklQN245NG4zVGVLRmhpd25MR2s5aEFE?=
 =?utf-8?Q?qtyxHGpvN3Tx1QqKHg=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e839a6-0491-411d-eeb6-08dd81b087d0
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:15:35.1380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB8140
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



On 22-04-2025 04:02 pm, Geert Uytterhoeven wrote:
> Hi Andy,
> 
> On Tue, 22 Apr 2025 at 12:16, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> On Tue, Apr 22, 2025 at 10:43:59AM +0200, Geert Uytterhoeven wrote:
>>> On Tue, 22 Apr 2025 at 10:30, Aditya Garg <gargaditya08@live.com> wrote:
>>>> On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
>>>>> On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
>>
>> ...
>>
>>>> Originally, it was %p4cr (reverse-endian), but on the request of the
>>>> maintainers, it was changed to %p4cn.
>>>
>>> Ah, I found it[1]:
>>>
>>> | so, it needs more information that this mimics htonl() / ntohl() for
>>> networking.
>>>
>>> IMHO this does not mimic htonl(), as htonl() is a no-op on big-endian.
>>> while %p4ch and %p4cl yield different results on big-endian.
>>>
>>>> So here network means reverse of host, not strictly big-endian.
>>>
>>> Please don't call it "network byte order" if that does not have the same
>>> meaning as in the network subsystem.
>>>
>>> Personally, I like "%p4r" (reverse) more...
>>> (and "%p4ch" might mean human-readable ;-)
>>
>> It will confuse the reader. h/r is not very established pair. If you really
>> wont see h/n, better to drop them completely for now then. Because I'm against
>> h/r pair.
> 
> I am not against h/n in se, but I am against bad/confusing naming.
> The big question is: should it print
>   (A) the value in network byte order, or
>   (B) the reverse of host byte order?
> 
> If the answer is (A), I see no real reason to have %p4n, as %p4b prints
> the exact same thing.  Moreover, it leaves us without a portable
> way to print values in reverse without the caller doing an explicit
> __swab32() (which is not compatible with the %p pass-by-pointer
> calling convention).
> 
> If the answer is (B), "%p4n using network byte order" is bad/confusing
> naming.

The answer is definitely (B). As far as bad/confusing naming is concerned,
I'll let vsprintf maintainers decide. As far as usage is concerned, %p4cl
is used in appletbdrm and %p4ch is used in to be upstreamed soon smc driver
by Asahi Linux.
