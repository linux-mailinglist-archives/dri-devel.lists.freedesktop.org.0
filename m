Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1EC6BA38
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C0610E532;
	Tue, 18 Nov 2025 20:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="SqikhBTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazolkn19010018.outbound.protection.outlook.com
 [52.103.20.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2363B10E532
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:36:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlSODr3/H+Ex6i8xO4k6my1pa1nsHOKaSknOLGsrQvt1GjDmyMow8TGh2Brsq4S6bCHZ9uQm1Ke8gcCeh3GcMHMOw3AgEfyFTDi34HyfpMEhKpS/j31DJyZCdyfYs2ydyXT2ICsNrg+DCY41vnmPIJIoMmvCQBxgUhlCusnXXreL8PX8sl8menuvZ8wSUWkt6KIm9d9BEaKGhuFG+6uNCvg9+4VL5yPAVkodLAqD0x1Bb4N5ExvWWSG2KENgFNYLiTTAe3dLZ+wb7/YlKBxhtKXZXT6fCB+H3dlrjfKnJvyjyD+Le4c5x//m15xckKU3xCpge2m7WaPzguyx2wuowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPhvKVZqqjxun5rjmL7Pqu5ZdsG+wtUSjUpmra2wNME=;
 b=ISbiWP1bl5z9OJ6JNuaICgKKt6vkARTLSwH2N+ccG0NRSO3AE6t1xbHdg/i9GAWpH621hui+w2SeynFBUEbGlji/Pwxj1uAJmCoWxSVZaHLRQh0CztzQ/8FtaPixcgdQdIxXFliw7/7nQdLacNzLB9qzOLmWg+H/ipWgkVdjKdGQGTLqqDr9km0tp/yRZ9kAIcD6lFYnWo34l0tjFH/9sXEwCAl2jDqiHwJA/qnI5/89JfdkDxyBlEaNypR0OXe3JehbiCRNrzhlTlzn/uRQeul/5y/cahGjyUupOhVBbsHQp/I6w7hUBN30XkaXpX3jsLYLstv59i/xNOMGnYkzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPhvKVZqqjxun5rjmL7Pqu5ZdsG+wtUSjUpmra2wNME=;
 b=SqikhBTuldyMB5Cys7hr7WgWHbvP10NynMaMOL4qZ6BL6B3Prvp2xl5oavD7neUWuoXcI4IPs8LjqpxmkHog7Wa5/FNhEhz/sw51oE0RroLM3RaNkueFfD89tpN7WLRkPItBBt6vXcQRhSyzSOn3T5dD8SICNii2w73v6E+F9Qn4k4dD2mBaUwHZj9Xa4ZEFPWGkGxlq8mtDlETljpIjIbwJQb4LEkzLpqpqbeHnl0aEl2uMeNgXlbE3sdw2XCcutiHcKqEzAJJHVxrR6YZhD0G5SUpkWf/iUIR+bABd5KoTH+dY5XH9Xiw9S+cmDMqRQ09+tG1fCFbTKYifFaghgw==
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com (2603:10b6:805:b::18)
 by SN7PR19MB4816.namprd19.prod.outlook.com (2603:10b6:806:107::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 20:36:13 +0000
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::7ffe:9f3a:678b:150]) by SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::7ffe:9f3a:678b:150%5]) with mapi id 15.20.9320.018; Tue, 18 Nov 2025
 20:36:13 +0000
Date: Tue, 18 Nov 2025 14:36:09 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, tzimmermann@suse.de,
 jonas@kwiboo.se, neil.armstrong@linaro.org, heiko@sntech.de,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
Message-ID: <SN6PR1901MB46548ED8D4BA1184E0EA7DC3A5D6A@SN6PR1901MB4654.namprd19.prod.outlook.com>
References: <20251113192939.30031-1-macroalpha82@gmail.com>
 <20251113192939.30031-3-macroalpha82@gmail.com>
 <avdnpwnxs6cql7eyckdt37szpcf5ztgxlc7juwu6tqj5xxu56a@nrwljig2p67i>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avdnpwnxs6cql7eyckdt37szpcf5ztgxlc7juwu6tqj5xxu56a@nrwljig2p67i>
X-ClientProxiedBy: DS7PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::29) To SN6PR1901MB4654.namprd19.prod.outlook.com
 (2603:10b6:805:b::18)
X-Microsoft-Original-Message-ID: <aRzYuVmlvO2KgCgu@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR1901MB4654:EE_|SN7PR19MB4816:EE_
X-MS-Office365-Filtering-Correlation-Id: 336a7350-26d7-430e-4f7a-08de26e21d14
X-MS-Exchange-SLBlob-MailProps: Z68gl6A5j29nppRiBL+t9IooWqUrCzYHddIiby2hEGvt12PJ/v/e/tMSxxItcW8+gHGyxfcC8F93APSq+SbA2ex+/fc9BDgn7uVRCjNEucSTvdbXBDzQemr9MFg6hHg0Za+3Nk5srnGkVhokXvXvx+9T2fRdzLXSTrVwHJtXS16vtOxOkGvn2ro67hVywQvjTez8/mK/Drb+cPnnFayokmU6a62HCzqLhc8fTk3+mnWA8xp2r9w6CQIEm5BXSpJg8JsFAJSlMpSD2gam++A2OE1bPew/YYnG79i3GsDeYH+/Oo4g7e+wM9Cp9hCiXYsxIvEkhXuRJcBJUU/cruXvBqnqxF23q+vWSKcpuUvZZHWii1a/7HTWTALL01xv3Qkd5xBPEPy7AIlkYsZ76f5rRdaOH1QjQ2AORS+EA83spCbIgca+pIPGOvCCC6hVE2SrO5ocjee1f38WhMPmkeldkoqbM098PEHoALy2jVD6RZmdBVH6uD0BhUN0MtY1NBGBpUl2vFbtHMKOCCdtdJAUpkWbb1Jki9qUcIzhvOKhQ39bz456yKO0hw7vQQlh4+MV6dmttFgTcHRLRQvQ3sp8sfthsButBv3RwUoDEFpxfEVLpw3K8hN/KXHtoeBezeMWF7JsZRnCyCU5T9ihkC8CCVgbSirZk2KcuP3yDp9a8Wo10bZIZfBWvIhPU1Md6vXAPVLt0eP6Gzg5q6yza3NuazuyvPdcjHb1vf7MXhRxriTw2vZazVMS1iU+CO7RACj2IWVfEDQzECRp6/nW8xvEtkwDOOhh2zko6VcSXodRe319BzH4Ot1BE9jVkv7zbhdJ
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|6090799003|15080799012|23021999003|19110799012|461199028|51005399006|21061999006|8060799015|13031999003|3412199025|440099028|10035399007|40105399003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V8xMUuy9PllZcmtMTVNg6r+5KbH/k5hdAx9BRowSONcXrj8W6XvstigzoP/f?=
 =?us-ascii?Q?fPg/yCtUwKecIebSXge7gFX8H96HI7PEEBUPwwnKNwxZp83lBls/Tc7oG7bd?=
 =?us-ascii?Q?+VGTha9hHYpiqE1J+BX6J+VkLRmiyoHAUDZQI6Avrz31IGIsrvWXvckVFUS3?=
 =?us-ascii?Q?3yU969wGstTeFV2DikC3mlwE6QBpBW2BsUnmPFHytQGyPZgN8taMT6BLzGRw?=
 =?us-ascii?Q?vndteVe8W/gaJp6g45GtlNqEA8vOZDKHENBV42h0sPEyH2J7glmFqk6eI6GJ?=
 =?us-ascii?Q?TNrsRUiuny+AfrQYigztxGVnTYukpYtSzvUm2ywIqkTfLk+ePUse/r1/Fy1j?=
 =?us-ascii?Q?4uAsloWXOIpDZgg57wUZQPVDT+u9hvcP036YlMXJ3rLTCPWdmObllHZsg9Zq?=
 =?us-ascii?Q?7VxZN9cJkrEJIhS6wVRTe9kvOsPaRCHlzQwhXQ5jzds7U8g92evAdBf2iJgA?=
 =?us-ascii?Q?SdU7dAaq3b0frVjYSOxChCK2s11XnnazaI/Hj3sv26UvuM0EkuOrw8M1nyag?=
 =?us-ascii?Q?JOyMg5ZwNzggRJfseMULf34j1wPlEYug2/ziKrn8lKlgD9m8Psn1xe6hp3qX?=
 =?us-ascii?Q?GRmILwWHmok0GNvapPO+uKyTvpKLz1yg2fu8YlJTtPTtd/nReaarx2pJIXyQ?=
 =?us-ascii?Q?vvEXpZhwuwAVqhLTnxyST9rcfXTgQwqVJSF0fomOEA2N5CdWqsemax3RoXU4?=
 =?us-ascii?Q?Z00Hb+B9B6K5TtghZKFrdT9GSrqv+bgpiq3lqNYIcBM80aCwVnGPP14xFOea?=
 =?us-ascii?Q?1FddLKO9qwcASkRsV7co+9oxBIimda6CCtcblGieKLwLX0PVZqXy6kj7ALlR?=
 =?us-ascii?Q?Fkf9DC9taS01jSjlW0l5iOnYCG2MavqSmoG84wo6gZwhuRjbHkSdSdzsf+Ne?=
 =?us-ascii?Q?R7LzP0nZxbPMeJryeUlLEhbr3qUjE/Xn7QJRjmKdL7vvqpRtlQB8nPBZSwxs?=
 =?us-ascii?Q?gZIuGneR69ZeH4a8qL800FVbzWmngZ59h37P6IrrX3ENyMNf1NR6jpyqHiNk?=
 =?us-ascii?Q?/BwAVvzhtgDG5Oy1RwykgGsLDY+83aNAZK3qDXHx93WJJ98ZuV4wwp0CEZ3s?=
 =?us-ascii?Q?WHwHOI3SE7m1Z3b5ezIe3lLC4nKcbGqB32/10ySqqt5TfVebKKNrkIkgQ6NS?=
 =?us-ascii?Q?+IfcIdyLRJDEZYSClKjpOIhoi4RSVpPmFwXio6/J4uVT0TzkdhCMgj+g4wkX?=
 =?us-ascii?Q?wnkYq981xrXxR3Fd8EI2uHv2oa+1lzZquCvvYflNo5ADcJ1jAijyoZoG+FO5?=
 =?us-ascii?Q?Slh7f1dhLb55AxNeltmoblno6PDz/t7xSXQmBwrpqqSPhcEfTeZ0vvetZn0U?=
 =?us-ascii?Q?B+6wOHUYx1rwGD/TQNCPYJVjItMPlhAz6CsjKArgUfi/kg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LW0dLENgQt/RxCWl45tNx78mJewELx+Hx9+Rw5gQciwyU+bNTLCgcy7MzSy9?=
 =?us-ascii?Q?gCy6kcYgK6sN+wgVCuMpMjSeheOWB2mHYkXoEz55qog+EAz4vZXFvpWvbh/m?=
 =?us-ascii?Q?jewoHq9734Ve2s1aJZQZr69R8RxkrI0LIJvyOYXoYwBuNUgHX56q2kTdF86t?=
 =?us-ascii?Q?EvUBKzFwioNCwRprUMsTvIp+3zSgZj8uMDkPbqWCaSmxAhsyUhG/jtqvw2rH?=
 =?us-ascii?Q?EUboT1wYxAga8Ody8lcFDiZuEes+UqIPKnbYGY/14cWoB7F/z82ivUjnp3YW?=
 =?us-ascii?Q?80MiJl43n1vXf7mUdb4M+l82X2s6gLqluqsG9/7rEnuWtMjsGnAyjyjBxGnX?=
 =?us-ascii?Q?IzfPNa0IWzODzDBt788XLi4wnkYSo7U7t3bbZGohXx5fppM0fOWqO/dCqhFK?=
 =?us-ascii?Q?RjuKQZDcsSONCzUU+N8MTVRZMy4+b6G10c70SLhratvE88C5MqH61wuHSe5T?=
 =?us-ascii?Q?hCfIHyGCeD/Q1paY9buevzan3Uqx1Cc7lynrXFojmbwRa3a5duc2H06DPGCD?=
 =?us-ascii?Q?deT2Kksp4x84pFq92GGJZd4DzS63J0ePpJiUUWfnQXuUqwZNPfRnYSmghX4i?=
 =?us-ascii?Q?JyJ64DWIT5LdiZUQptKIf1s/1dtcnSYpUX+B1auEIUFDFJtFbWI3DMMGTHXI?=
 =?us-ascii?Q?bdrZH9BJ9MSTTNtqqzwfzVkJK+kqf4IiQ83iLgKe/GX3xnvjUI/+mLXc60LA?=
 =?us-ascii?Q?/7MSRiTtZa6XqDRSg6oUOYo3DWBLT/lrqnNJJFsGJLEuHAIDlR1p300IGDzv?=
 =?us-ascii?Q?md4vRY2/zq6/rBXbdBgKIJLbtUvWoIW17XLdnk7zg7FTYC32rPDDyE9aeVQD?=
 =?us-ascii?Q?GpcBXVTpO2I/OWqzJR5g+aFD/de4hzCxfnisLTN6IbeN24cDGmj+NB2EQp8i?=
 =?us-ascii?Q?8cHyv38bOVI5sgyOYIkiIJoYazU6Wwn7Mz4r0RwsA7Dfj9zClrs87ozCglgt?=
 =?us-ascii?Q?PirUtAizsFYApipqWgEIMX7neTuDcEjPH/DcRB2uNtcyINtBySDcCSBBpciH?=
 =?us-ascii?Q?okGiNGQdd5SAY4Ppnr4C1EuRXd7th97yImFnSn22Z+h8sTZ5xEjF/KsNevWC?=
 =?us-ascii?Q?GCbUvfiIiejMOe9YoVUKSe0caZ2BKDrR26KgHSTKI5MtdkE2hd/WPFDXqs9A?=
 =?us-ascii?Q?8evoOQ0PTGaIfjWLZ8uEw8a6i+ZCbMeqISn3VJ0Ou5kZOkQlrzoWro1V4364?=
 =?us-ascii?Q?fvxE1UR9UkByml6iHzQzuwQ5US2uF62f33K/AVHRvwAw4Nq/0mFsWL0eCQde?=
 =?us-ascii?Q?KsrfSfhUl8tH8stSs08UTbhwJ2UAG9t54/gxsWeAmg=3D=3D?=
X-OriginatorOrg: sct-15-20-9115-0-msonline-outlook-15bf1.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 336a7350-26d7-430e-4f7a-08de26e21d14
X-MS-Exchange-CrossTenant-AuthSource: SN6PR1901MB4654.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 20:36:13.3854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4816
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

On Tue, Nov 18, 2025 at 09:46:04AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Nov 13, 2025 at 01:29:38PM -0600, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add support for the dw-hdmi-qp driver to handle devices with missing
> > HPD pins.
> > 
> > Since in this situation we are now polling for the EDID data via i2c
> > change the error message to a debug message when we are unable to
> > complete an i2c read, as a disconnected device would otherwise fill
> > dmesg with i2c read errors.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> 
> You must also disable any mode using the scrambler when there's no
> hotplug interrupt available.

Is there a simple way to do that? I'm not seeing any references to
scrambling in the current driver.

Should I just limit the rate to HDMI14_MAX_TMDSCLK (340000000)  under
dw_hdmi_qp_bridge_tmds_char_rate_valid() if using EDID polling? A
document I found online from Synopsys [1] claims that scrambling is
used by default at rates above 340 (if I'm reading it right) and used
opportunistically at rates below 340.

Thank you,
Chris

[1] https://www.synopsys.com/blogs/chip-design/hdmi-scrambling-higher-data-rates.html

> 
> Maxime


