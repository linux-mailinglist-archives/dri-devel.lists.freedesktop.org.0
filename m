Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA04F814503
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 11:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B567110E9D1;
	Fri, 15 Dec 2023 10:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04olkn080f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::80f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CE010E320;
 Fri, 15 Dec 2023 09:59:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOGl2IZ9AjoH/lgQdzwL07RmzjdcOTqgdmVLgKP3NtmAGneog2kl+fmlfFjr+tFK7sR9p6hlsoFiLJjqc47OvN3X3sRAlDMPeBUkaYdLZEPwzKz0Ibx8bAvP7VoRnYrr/tV0gi/FdmnSBTnBN/ZABJt+mCltpnYqCdp4KN+cRaf6bU+Q71T52dGVFi+FxgMYWAoIJW2cAmXJlZLO7cZODV4loujUQg5rCSXrzbKg0izvAKnT44TMTZYqvMsnAQeEDRiQjP3TuEzJjzuVcD8Bvrzt726ZoC3f7C9r+E2pQRdMediZYUY/oWWcwP+4/nsnsWkbwpH+HD09DUwk5BsurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiU73NIN1lvCWdMVrKnNstqLDp7/niE9mrXFSgWiniE=;
 b=TZ+hBCZrpGY6IJ6Dn9/5DDaOja9+K+5P0G64Bj5NIWk0CjVtMwQBehF652cQ1NLAGRDJ1dV/9aOI3dFXRr+mv7P/1d0n/tly+wLP5zbKUCGqEJqGZbG7+5t6lDQQ3CLjaiFDt5YCXlRRPH1ova5r26DaPxZ1PAdttUa2gatBqUQnOkJynh+uJU9qETboxMGG4VYMdzpxO1YvlOaedIJFeGlUEdISVq6tvJA4qnRnIqhHbRVdB7dO0XTpQm4RSCpl/Vmta8PAGGm3SWuGsQHGg/jiNMwgeVawAD+KCo51L+gfRmlWBr8sr/kwD0QnX4XhDJfEhhJAR8uhOyKiPPltlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiU73NIN1lvCWdMVrKnNstqLDp7/niE9mrXFSgWiniE=;
 b=DYTeMV8mWsGJ8oaHGBYp/UAeGzBQZGKAgzYaAKe4/ryFIwt5i6RN5fuC05WBI3s0V8pIPpdA5CuZSvVoe78tkR+f0uhAUh7zYcsecB14a2PAsobD68ooY6PN/5l4miUlTsCajyoBx3KSqOeW0qrt6FIAOPN/ztmycCPQP6UIOBIb5HyGqQvN3XpPow76BhaZELcmFPzHIxH4psFWQSfs2Dr34q+vedTAadx2bg02h9oKmqTmk+xjSiPOPRZPjTYsFSJevCtK9SkM9Vqz0L0MKzFCy1moSltt+pgizZiytCMQZcwz/MCRFENVNtRjjq0gNcFdWcbJPv+wQMBGQfhejQ==
Received: from DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ae::7)
 by DB9PR10MB6738.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 09:59:56 +0000
Received: from DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::651:ac68:2cdb:49f0]) by DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::651:ac68:2cdb:49f0%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 09:59:56 +0000
Message-ID: <DUZPR10MB8267520A4F44DA38339969A78E93A@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
Date: Fri, 15 Dec 2023 10:59:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] Kernel problem with multiseat on one card - Wil be more
 than one window manager on one card
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
Content-Language: nl
From: Gert Vanhaerents <gert.vanhaerents@hotmail.com>
In-Reply-To: <e046050c7e9be5d4f816d33dd1a9dd50e2de3308.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [Mpof9r8j6eSeeas/Y7h5pJyqXgLjdQ3d]
X-ClientProxiedBy: AS4P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::11) To DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4ae::7)
X-Microsoft-Original-Message-ID: <d0e7f742-a980-4d3e-92f6-58700907ebb4@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DUZPR10MB8267:EE_|DB9PR10MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e4f1ee-e102-44d4-5a14-08dbfd549703
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sr/f25hLW2rxYoudzAdRbqIDdXlw9i6mSgn7daWrUsnOLLRCAUSKZQL8oI/VqXkeO3/fgv+P/0mAVMEyOIvoMjOBOLlppnUrUgW9dSFmEm0iUeAIjJSWH4yqjLr2t0hsYRuyGjcGoi7L8mQujHEme8N5ky0GljaFPPodsCnmvKSjaz9VzXwiEj18TN41zKqRZo2YQf2/iZt5LXdsT4ISRY0Wz1AAe5Sh9qfReam1godRjzYQczbvHuNPBY0kb2k0adyP2ETBrcO7TJ6Fhe+CWuvHz4eYhzOZ+k7MohaYsciie3CaA6+4LrzJLLJeyWjVSM2FKoekL8hNLLqLpqXcdebzWei0dT2GURbV4yNXC9B1XzQExYPqQ4BV6apu/0b/QC1jduvSoV5O00U1Si7TRou9FYndralDd55ikG0URG1esG3jWKzGixZz+BjVSpID5ufBuwHXzWvTSdm2XRpK8Bkr4GEN3HX6CgqFmijDRNiplWMhPuUQtKX4jywfU5Yl49PC/muDPes6gJB9AlSznEmL5Hz9CiUcoUqmOisFhKss6DSL5NvJhYB/WYGb+7BB
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NC9SMk42NTRDWG1XOHIyMUtSVU5GaFFxbGhUVzhsVEk2VnVjcFJpTFRFdXdh?=
 =?utf-8?B?OFlTRnFHS1JQWUs0bk1LZTJLdTdPUWFVMmx5bjNsSDRGQ3RYVlBiRHBiem5E?=
 =?utf-8?B?S0hiVktWZnN5eUYyZlZPdXF0aUJ3ZXdGVURnZVh3VWJpNkFYNXMvNFhVUDNr?=
 =?utf-8?B?VU41WTJZSkYyR2wwT1dPUHc2VWpTdFFqOHZKQ09tU3RRWml5dnpRQUdWblhX?=
 =?utf-8?B?MDYzNyt4WDRXandqcG1QdVRkUG0rRkFSajVCV0RUUGE0bGdkR1k3TVBKWmN0?=
 =?utf-8?B?N1MyclZNMFZyZC9sR1VWaExzcFdCRUVkcHhUQ0FEZm1GUzAxUjJ5L3NUNUlS?=
 =?utf-8?B?cmlDbEUyVFZkL0dKQ3lvZWlXMlFxN1pWTGFDd1VCZmZUaWNLY1FsTnlMUFFG?=
 =?utf-8?B?R0ZRUmh1VHVRanEzdnA2bGhJNERUVlBBRTlOZUY0L0V4SUhEZlh0U0RnVmg4?=
 =?utf-8?B?WW01cWRscmkyTTVaNDV1dm1NKy9tOVBiM1I5OXowYjA5aXJPWHFwbU44U0N6?=
 =?utf-8?B?eXpLNTZMMlZnQkVrbWd5VmJmdVJyL05CQUk3VDA1N0d6cjFYZnBLRGFIUjkw?=
 =?utf-8?B?RWJBdUNzSmR3cmlnWnZ4NFNZc05MVU1RcGRUeTkwV1dGVjl2dHdGZVVwemQ5?=
 =?utf-8?B?ei9zemM0WnpWc2QyMFUrbHlUd2NHQU5jM3k0QVduakMwSzRMdTZQc1diYXhu?=
 =?utf-8?B?d01SYnpNWE9CSTdUSlljeE00V21DSlIvVFF0QlJDRTBKVGtNV2w2ekxMTWRs?=
 =?utf-8?B?aVdXTWVzQ2dudzJZYTdBRU4zdUlYV3JHdXNPenlPQktRTnlXU0RiQjZBdHg1?=
 =?utf-8?B?NzZYWm1wT3dyaDc3Z0hrNWJEY3BOWU5RWHBqQ2c4WDZTZG1jcVFyczZHTGE1?=
 =?utf-8?B?NkRyRytJczdCekorWGhCNmI0MXpXYU4zQ3VlSmdlVnVzQ0dvTW1Mck5qMCtX?=
 =?utf-8?B?RE9XOVEveDRUdFhJR09QcVdEV1JITGFkOFdMM1BTY0JCRW1oaVMzdFU2SlEr?=
 =?utf-8?B?b1hDSnJSQjNZYis3Vy9ldW9nc0d5aVRRNHFSa2M2NWYrVzRBQ3Q5allzUnEw?=
 =?utf-8?B?UzRFOVNna1NlcjNFODl1MlFlQmpYWWluUVRrSWpWaVNXVi9RNjMwc3hFaFpj?=
 =?utf-8?B?SXhPKzQ0bVpPNVVXUGF0ekNjOTBuQjhmUk96TDlVNU05WGdTNUQrLzFTek9X?=
 =?utf-8?B?SWprTzYwY0hURHo3Z0FmWmhHMkptcExETnBDYnlza1FhbHRsR3M2a3ErWUph?=
 =?utf-8?B?RWtiL05ZQlYxMnFPd1NJb2tUaytrMU1ZdFVKSzZVUktMS0lsN2cxdVcvWE8r?=
 =?utf-8?B?SkVneElEM3RmY1krOW5GbWlockt1OFhEbUQra25QZkQrdm9aa3J1dW04UlZW?=
 =?utf-8?B?MExRS2xzTUV1Rkhxd0VRTzVxendQaWFDVXhuN3Y3Uk5zdUFGbEJqUlBQcERQ?=
 =?utf-8?B?MlJ0b0dyb2Mxdkh3c1FSNTAwQm03eVFGZHRWZHRDcklFV2oyQ2xvOS9IdXdE?=
 =?utf-8?B?eTl4eUlNTTNkcG9nY21ta1BoaGNIS3BIRUdKbjk0SWhIdklLVjR4SFVTOWFq?=
 =?utf-8?B?Wmk0bUhPK1YyaHUxNnE0MW5Jbnh0eGNKNlVLSWdDZFVyV2hpMm1weUMzeGlU?=
 =?utf-8?Q?H1Fz9ovoBMTkK6Sb6pDjrmQYtHVYelCYC2egaHtlkvFU=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e4f1ee-e102-44d4-5a14-08dbfd549703
X-MS-Exchange-CrossTenant-AuthSource: DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 09:59:55.9562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6738
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


Op 4/12/2023 om 15:11 schreef Timur Tabi:
> On Mon, 2023-12-04 at 09:51 +0100, Gert Vanhaerents wrote:
>> OK  i will report it to nvidia. But with the nouveau drivers it's also not
>> working. Are you sure it's not a kernel problem?
>> Because according to systemd it would be a kernel problem.  (personaly i am
>> also thinking it's a driver problem)
> Unfortunately, it's not easy for Nouveau to debug problems with GSP-RM.
> However, if the problem exists in the proprietary driver, then Nvidia could
> fix it.  That would then lead to a new version of OpenRM that Nouveau could
> use.

I have contacted Nvidia and now i can see the outputs such like this:

─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
           │ [MASTER] drm:card0
           │ 
├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-DVI-D-1
           │ │ [MASTER] drm:card0-DVI-D-1
           │ 
├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-HDMI-A-1
           │ │ [MASTER] drm:card0-HDMI-A-1
           │ 
└─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1
           │   [MASTER] drm:card0-VGA-1

But the problem is now the same of with the Nouveau driver. When you do 
this:

loginctl attach seat1 
/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1

For the seat1 (the VGA d-sub output for seat1 and the other HDMI output 
for seat0) and of course the mouse and keyboard.

When you do this, all the graphics outputs are on the second seat 
(seat1) and not anymore on the first seat. So i need to move only the 
VGA output to seat1 and not all the outputs.


The problem is that linux can not start 2 or more window managers on one 
card (even if you don't need a multiseat, but use only one mouse and 
keyboard).

So how can i fix that i can use more than one window manager on one 
physical graphics card? (without Xephyr or something because they are to 
outdated and works not good).

I have tried with: Linux Mint, Ubuntu and Debian all the same problem.


