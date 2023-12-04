Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEE480309C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 11:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ACC10E16A;
	Mon,  4 Dec 2023 10:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn2040.outbound.protection.outlook.com [40.92.90.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E12F10E196;
 Mon,  4 Dec 2023 10:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSp0XJVMFER4VhbzkPHrYXGgAMSW1DxNX22JFxa1A5hYiFIaj21iaWA3PE2ksWfUymHDgoGLKpL2PKECUxnO7fiR3Z8UvT3o7q8qorC3ynYkmFf2tadiDgL/AeqR5OqaR7HKHg72nAvAJAFYRFDYpmSFiM0G5fj5XAKhqo62pDuGfK7+yWR5ReV38oz8jgJi2EbdsK8QdP5nAdlp+XYP8VEUVJGuk5cvP4sG+3P7Duh5MgGKw5LVavPel6JGeK1zMDs3JSJtjElmMsK+y0/+wxxZUq0AmkpdiJ2UTISCg6OWmTRud56WrxyMhPgfCWrSLqELedEOhoOCSwGaZujuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S1XkJ12r3tYiK+krXdX8A5bV5jNuPbqBXyZ46qgkd0=;
 b=nGnHyBEUsbE7r/LN/BcGJVCPmhv5OxnJ1aCN4gSgZQahQfEoyP1s0q3KSDYnt9Fv7rD1ym3SZaJxD7rVXo/vgHjIS/11obwldJ+ZmAkfrbB2nIf8b3ScWHrdCSCaEynyrkt9YnaMzPVrxJPF3jFNexAet19QfSqOvJ3GNssgXdgDDTAkvK0rHuvzStYBPUxP0pc7eX53Ju+yYzFp3N3FcgBtFVdhiri9G5yV984bkgLM+Vx8FDKJNSXxnA76aqo++jr51SuFG0dDBLkI2tDaKyXKqvVuYQiUpr73jo/z7rJYaJJdhZzsbs+E2ScOEgnTCNtevTJUlGtzByfxe/ZHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S1XkJ12r3tYiK+krXdX8A5bV5jNuPbqBXyZ46qgkd0=;
 b=oMUnfWDkn9jnV89H2rz+OdZ2eu0sao2KIPcMyAUpUVef6xIG3ZPowoBdEDMkj/+2Gl2HhjfNa7vccPj7f4l6HywjH0u0m5r5d0tl08EuyPgZcd78ydK19aWWet3HY8TStl23s0AmmC3uGzbejIP7Qe0+I1Aea0F/wDuxvCsjjQmu5xa8KQMV8REOQ/6XG+m4w7xhZm/iorbvXPOdZvSau7wlxo07uE7vpJ6E1tK6GFIjvDLeGsGiulEiBoKEgDScNuXt+Gt6C7+K9H8gBV6P9nSCoXAFAnjl0Yt5Oa248Xp47QWHnxKSt+l+jUu9nYmmRPbhi9dLOsqL+e1Qxjy8uw==
Received: from AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:172::24)
 by AS8PR10MB6844.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:25:01 +0000
Received: from AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1fc4:7df9:3d95:eb28]) by AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1fc4:7df9:3d95:eb28%6]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 10:25:01 +0000
Message-ID: <AM7PR10MB392310DEF1A19822E722843D8E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
Date: Mon, 4 Dec 2023 11:25:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel problem with multiseat on one card
Content-Language: nl
From: Gert Vanhaerents <gert.vanhaerents@hotmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
 <AM7PR10MB39234D1B9700492A3D10DB1C8E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM7PR10MB39234D1B9700492A3D10DB1C8E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [EqRXoId7wOjnKdngLk9hTyB03hr9lLCy]
X-ClientProxiedBy: AS4P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::16) To AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:172::24)
X-Microsoft-Original-Message-ID: <93f79670-bc25-44fa-b829-60efb7820d72@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR10MB3923:EE_|AS8PR10MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: b17ecebc-3e71-4c38-54dc-08dbf4b34599
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: etDJT3BT74Ag4Mq1HqNubnnj3pB3VQ0lxP/y61h+MI5BMLtRLk0FpShIQiBXPH0edOfjC5qRfBuzlT2jehq9s2qgP2bvU7ZNALfaezjZhlrOMowMOy1yHjBRT4H6oNgII8gE8XagtsnSXTUrnLjqTZKL5dOIh8KYzudH7MLJTH9IuA8tFh/nMYGRQv54JjFf6YmTE26rMG0UUhRZg0FMDIeOL3BsN+Iyx3OdPJSaNjF0nwqK3uyzTH+l66vLGwiSCAHZZen/oXIdQ7IKbTJ4dE8fMifSeurplmaI7BP1j0KTK2RaBwcjcg7HjW1F9RzVbEeYOqr3APzT1k0fybJH1+daau0ru6OsCiRrWMMkpz3YtodkVxVEtDA9nB1DkrYNHQqjeKUvPUctfr2PV4wBKGRJl7i+5ffWIzvFjaX6XOtuOOygTdur1ppXWmOMEvgPsWFgSgY7VeBzQ+CQW3rXSkYXep7hsPNu8uoS+wyON939JFb2101O+MJHaapnRxOnd0fQ+k0ZpL0A93lZiZpsZ5d1Dqp+6e1HFiab0AM0WMmf1IKU0YxP/yaoyrR2C3q3opwRQ3vO7p6r1g0YoD4/XT6sZkL+2SZ+of97rBicEhY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkxFYk5HbVJYWjBGcWdSN1hkclBDbjY2NS9KSFB6K3hKMnJEYnlMN0k2YTBw?=
 =?utf-8?B?OFBmQWcvVWZzd1BSNy94WlpBYUl0dnlqRnpJRE01WmJMOTVFamk4aWxPOWM1?=
 =?utf-8?B?cXA5cXQ4b1FXSmFsQXVGb2tVeFI3WUNjL2dpd0VMYXNVekJINW8zSm5xa3Fv?=
 =?utf-8?B?R3RXWVk5Z2xycjFmQ3JGQmtqS3UxREdid2FwRTI0Rk05WW5NV0NKYXBSNUJ3?=
 =?utf-8?B?eStPN2JmZjQ2R1pDVm1tcHlQVHJlVVh0Z2NIUFFWdzlMT0tQbUVLazhmbVdM?=
 =?utf-8?B?ejh3UmtYTWZmNjNQZDF2MWRhNHJVY09lSXR5c1RXRmZsWFFrVjh3b0lOM1JF?=
 =?utf-8?B?R0N6WFFHQWllckJhb3U3OEgrUWo1ZFFGRE9rNFZyWFpRWU0wa2dldGlnemtv?=
 =?utf-8?B?a0RHdzZWMlhySTJhSzNLZGJCczJYNDVIY29Nd2w2ZEdBNmRlT2VTTTBQSS9Q?=
 =?utf-8?B?NXNCUW9sdFAyV1JlRUZwdHB1ZlVhaXNwMmNhaDJpODlGOWZBczZPL05CSlky?=
 =?utf-8?B?ZFZkYmFoSStzVDBRUlEyZTEybUp6K1BWVEhBY3R6NVE3Skk1cndueUFyMjdy?=
 =?utf-8?B?eFlsYzJFeTBGK3kzMzhLNHIxOGdITWs5RFJTSVUvTERZZWFMMzVNbi9ybEMv?=
 =?utf-8?B?Q0hDcW5PZ1FCaGQrODZWVGVyYkdqT3prNlhad3ErRnVhNlJ4WDZDS2VkSENC?=
 =?utf-8?B?NWZPY2p2ZXpWUVpua0QrWDlLVSsrRXc0emRkMUt4ZEFOTEtTVDkxcXBubnQy?=
 =?utf-8?B?VHNUOHNsaFBrcTJQMFJvTFVWdFVRZ1FCcFJKeld4ZldCNmVuU1N5a2ljL2x1?=
 =?utf-8?B?eFlpcEZjVys4Y1NzR3RrQi8xMlRWWGh4K2ZqSXpRREJCN0Z3bkgwSUNPdGlE?=
 =?utf-8?B?LzZ0aldSNlJHRTB2cVRDYkVHQzVjQ0IvRVg4dWZKK000L1J1VGRzL2RCVmxZ?=
 =?utf-8?B?MUFTVGdGYldHQTM0a1pHdVlLWjBIaU5GeHZlWUJOUW9NV3l0T0kxZlZSb0ty?=
 =?utf-8?B?K3pKQk9oRnRJODVXb00zVVN4T2JCNCsxVGNaSWhuQTZsdVVBZkttaDhNYXhI?=
 =?utf-8?B?ZFh6emFjUHc2TVVNR2MvVzArbVAwYnlGZmpJMy9NUkp5ZVN1cDBBUitzYjgx?=
 =?utf-8?B?Z20raFY2RTJDOUxaWE5xMTRjMjR5QjBBa1BkRmFwVnFLUCtreHd0aWRqQ0Iz?=
 =?utf-8?B?T1MwT1BmZnEwS3MrcXM1N2JBd1lPaE4vU0k0dms3VThIcG56Q1ZnRXk2YlFH?=
 =?utf-8?B?Y25NUUNaTmZTSGp4Q2lUUFhrek5PMHVqaXRiK0hJdVhDRXNwL0N5WWtBTDRF?=
 =?utf-8?B?UFlLOCtTSWJQU1lsbDRuMmM5bnNPYUV2ZldhbDdncXlaRHA2NDZFSWkvYmxB?=
 =?utf-8?B?Qngyd2hQblRWSUpiRFhEUTdEdHJLUmlTNHVMWGlDbEo5UnBzdU5CYTZoTk1a?=
 =?utf-8?B?OEpVVkxGMmlYWS9QbDFWem5PalV4eTFFdUlqME5HMTVmSjRsL08wSHRnUiti?=
 =?utf-8?B?VmFHdldURGhKcXFsSzdLS3duSUZKNkx0bTc2TTlQMHllYVBiVjVNclZKck5m?=
 =?utf-8?B?aFRuaXRkVTNubG1XQTR3ckNWeHNGS1dIbjVSVlFETm9HRTBLd2kvdzlVVC9a?=
 =?utf-8?Q?+VuSk1h665XGHemJTJWk/CctQ8oR3I8Y22PktBjIR8PY=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b17ecebc-3e71-4c38-54dc-08dbf4b34599
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:25:00.9926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6844
X-Mailman-Approved-At: Mon, 04 Dec 2023 10:39:24 +0000
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


>>> Hi Kernel list,
>>> I'm the IT person of a school, earlier we used multiseatcomputers 
>>> for the
>>> school, i have maded with a XGL implementation and it works fine but 
>>> not so
>>> fantastic. The school wants that i build new computers but the XGL 
>>> project
>>> is too outdated so i can't use it anymore.
>>>
>>> How can i make a multiseatcomputer with more then one user on one 
>>> card with
>>> systemd? I have asked already to the makers of systemd but they said 
>>> it's a
>>> kernel problem.
>>>
>>> With Systemd loginctl and the nouveau drivers you have this:
>>>
>>> ─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
>>>            │ [MASTER] drm:card0
>>>            │
>>> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-DVI-D-1 
>>>
>>>            │ │ [MASTER] drm:card0-DVI-D-1
>>>            │
>>> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-HDMI-A-1 
>>>
>>>            │ │ [MASTER] drm:card0-HDMI-A-1
>>>            │
>>> └─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1 
>>>
>>>            │   [MASTER] drm:card0-VGA-1
>>> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/renderD128
>>>            │ drm:renderD128
>>> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/graphics/fb0
>>>            │ graphics:fb0 "nouveaudrmfb"
>>>
>>> So it will be:
>>>
>>> loginctl attach seat1 
>>> /sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1
>>>
>>> For the seat1 (the VGA d-sub output for seat1 and the other HDMI 
>>> output for
>>> seat0) and of course the mouse and keyboard.
>>>
>>> When you do this, all the graphics outputs are on the second seat 
>>> (seat1)
>>> and not anymore on the first seat. So i need to move only the VGA 
>>> output to
>>> seat1 and not all the outputs.
>> Do you expect that GUI output is on both seats?
>
> I want the result that i have one seat (seat0) on the VGA/D-sub output 
> of the graphic card
>
> a second seat (seat1) on the HDMI output of the graphic card
>
> and a third seat (seat2) on the DVI output of the graphic card
>
> In theory it should work with the following:
> loginctl attach seat1 
> /sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-HDMI-A-1
>
> loginctl attach seat2 
> /sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-DVI-D-1
>
> But when i do this all the outputs will be used on seat2 (because they 
> do all the outputs automaticly to the latest attached seat)
>
>
>>>
>>> When i install the proprietary Nvidia drivers, i have the following:
>>>
>>> [MASTER] pci:0000:08:00.0
>>>            │ 
>>> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
>>>            │ │ [MASTER] drm:card0
>>>            │
>>> └─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/renderD128
>>>            │   drm:renderD128
>>>
>>> ─/sys/devices/platform/efi-framebuffer.0/graphics/fb0
>>>            │ graphics:fb0 "EFI VGA"
>>>
>>> So no VGA, DVI or HDMI items.
>> Then report to the GitHub tracker [1].
>>
>> Thanks.
>>
>> [1]: https://github.com/NVIDIA/open-gpu-kernel-modules/issues
>>
