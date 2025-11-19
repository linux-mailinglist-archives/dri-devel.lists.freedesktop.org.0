Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968C3C70A35
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 19:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF9B10E253;
	Wed, 19 Nov 2025 18:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="aJeBTuw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazolkn19011014.outbound.protection.outlook.com [52.103.1.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5BF10E253
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 18:27:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8VzXNXU4I0Us1Vj2fcG0T96+hITFABiGRQpnV+AnINBELrxkz950ToT8K5YWHJMoWlh05nVHHCosyUDTvIF80QpELSdrYoVSDqOj716MJgvvz1PFOEZZ4C7jW9z9uT8so/Xaxor3LhsHEzQzSCcStn5dx92Ev0WoN3gh6GBnSZu1lq9DSsSOOmlpHaLyA6iJYLzJIlZUrVG0jO/V7OYxPMh/I0Olx1zsjSO9Ox0fPGijRIo7p+EjEvWdsfut9GFi34MHhEkZokgFnQKV7Vv68pZxmwYM09T/S3U7UplnubTnROFXCk4gxO0uT6atz/IQK2CAegaOcg756vzbRfrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY75bGIutTV2qE3oNErYyOezuLjlhcyKYe0aPDgQRzQ=;
 b=g3DCZxek/283w+1yrFbLu7F7++F6NNTyxlUbthvmVl3+fuVV+bM5jsCWCj73LoMeiZzbAdFnnHIDUj6e7ys/f+kBQwLxZQJ5VfizKjUCpK2R7qjnBod5XhFJcbOGN+bSTBsRu//cPx8Z5kZ4Tr1pAZVkeeAAzPnxmJlA8OBxZ6t+CeceH6pj26vE/n+y+oP+1Nau9aB7yFoDPCulrp7aN2HEbl4IOK11p44n6DHLAcbdplemsOstCeopGKnr2riaC4G0dty3/ag/X+w2S4gkjubhU81IvtWswcyhPRM9NoNUDzKYM/K5nwuxUhpxgECRF07l7JDj+mtbT9oWAlG/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LY75bGIutTV2qE3oNErYyOezuLjlhcyKYe0aPDgQRzQ=;
 b=aJeBTuw/rYg8zTT0PH6xr/UHFtfp86YlGarn36l+C113DCNpW1f4IxXZZI9iBFkG3CYTNZXagoWKZNI7Xi6gDzW7wOlio6IQg5nm3ItNoKOLCNVVxZb3fceX45fIp0bNHUlhdm1iw9uNGrwN316AeqnySwv6u51bnOPRkUNpkQ8VHAI6YnF4TNzZ48PhJOilIY7sFyT8RtjDoGTKleMkeZBNKP9ucnGiB9KS6b7Gyts5JhNNUquF/nRY+jySofw6ZcR9JArJNVj5AVR1CLi8NUkpSrhvTob3nO7Qld/UOTYC12/C/vIqSsIiepjPQgSZrPRB6Nf/zU9utSftXT1F/Q==
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com (2603:10b6:805:b::18)
 by CH9PR19MB9203.namprd19.prod.outlook.com (2603:10b6:610:2e2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 18:27:27 +0000
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::7ffe:9f3a:678b:150]) by SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::7ffe:9f3a:678b:150%5]) with mapi id 15.20.9320.018; Wed, 19 Nov 2025
 18:27:27 +0000
Date: Wed, 19 Nov 2025 12:27:24 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, tzimmermann@suse.de,
 jonas@kwiboo.se, neil.armstrong@linaro.org, heiko@sntech.de,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
Message-ID: <SN6PR1901MB4654C7B215573639E428B21BA5D7A@SN6PR1901MB4654.namprd19.prod.outlook.com>
References: <20251113192939.30031-1-macroalpha82@gmail.com>
 <20251113192939.30031-3-macroalpha82@gmail.com>
 <avdnpwnxs6cql7eyckdt37szpcf5ztgxlc7juwu6tqj5xxu56a@nrwljig2p67i>
 <SN6PR1901MB46548ED8D4BA1184E0EA7DC3A5D6A@SN6PR1901MB4654.namprd19.prod.outlook.com>
 <hgwfztkwk4qgvefwo2cdedzas3rzlhx6yek6dgldkgaq2jskvw@exxqujjpa6bl>
 <SN6PR1901MB46542ED12EF34220E3119460A5D7A@SN6PR1901MB4654.namprd19.prod.outlook.com>
 <485c4a78-c20b-492a-8c27-07ef63323735@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <485c4a78-c20b-492a-8c27-07ef63323735@collabora.com>
X-ClientProxiedBy: SN7PR04CA0158.namprd04.prod.outlook.com
 (2603:10b6:806:125::13) To SN6PR1901MB4654.namprd19.prod.outlook.com
 (2603:10b6:805:b::18)
X-Microsoft-Original-Message-ID: <aR4MDJCHorrhPPmp@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR1901MB4654:EE_|CH9PR19MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: f9946900-c562-4051-5336-08de27994ace
X-MS-Exchange-SLBlob-MailProps: znQPCv1HvwUhM6k1QWx02acDuEqXpbI52HRrPky5OzFLQncbZEHhh88L27Y7O4+lzXEfsywYH+LHcdbkEvhE/AQCIQRfVUtrCeo/fHG6OU7xIEyugvGV2KinVp0pU4DvhcK2UPbgHizINb0Bw3iDNjTwctIVIKSVjLNy8FWs3VVwrGbLG8U7fC8N9LM78jSA+H5FfMJg5/eLwD40c/O1yrk2lAmIAjQ4udzEZid2gZArz8O0+JUgp+/VZ6f8GlacE9SZw6ogFhM8urWsxUZqTUhJXVoZBLdz8UEuJxW5OGTAwdmZLwACk1G/osOYgTK9PFZpL+SijEY+fgLQ3lhntNRzQkudI6hHBeExwXm965kCNjppMXqKri1I2IpXLTLrrHruTdS77qLesV4GcIE1ga5X4M1nj0lfMzCeAaWWBozs8bXeDYMAxwMWZgy+pMmUpgyH/RPg30RKrLDXKyoq5c+rNQbkMmh1Q79V0OUFgfA/3DQfK7lW1c1E3v9sdcv948hzb3zlJbuHcnQSrlnKb9fe6A7xd/0zVndHH17OS5kMmrwICeTaqmaOyroqEHkqjiBvNj4sj7ThDN8heUaiTeE9CD83bEMlTlDPIfaC7zH0oJOXmFzcL3Flg48PLHnecn/qlV8LCV+/idAGdLB7arRnStvo69xlRG6u2G/utnXbCzaA2etnHVp5Hs/Kdd/TGXQsZ2yVW/4c/ResDxDoVla+c8/GccdLcOFuOVFCAGeoWLXaT24qN2mudr7L7Cq3/7Oik+JIFO4=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|21061999006|8060799015|19110799012|23021999003|15080799012|13031999003|51005399006|461199028|12121999013|6090799003|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PTLtUZMdAxQbWnve5HpmCjjhU41e6hxiUGUxLQzCw3eCYl6sr1PoSxrjlqnk?=
 =?us-ascii?Q?nPT8XdvqqJZgMI33EjaqYhS5e5d7Q64DTkfrRKqU/fpK6lTm7pEXnEzfNBhp?=
 =?us-ascii?Q?Y+7YihMi3jJA2Apc6q7cn0J7jR22FC/PuiylUTk7f00zGJR6FLQnJjoXqU86?=
 =?us-ascii?Q?8DPa40Aaw1znL6SYwvoRd9I7tSFW/3X5zj/X3UeLXgmQ6+SOMZxJ6pzVpzlZ?=
 =?us-ascii?Q?Ox5vqVdNIElAFp7qYnDNOum/xqXwKA2FnQipn4nirFKAMnyH6/N0HeP55KfV?=
 =?us-ascii?Q?LkMvRfcznXRWqIjz8oyFCnOef26N+QKOCM7rwQAzO/Nc1i0/dLi4QJoQy+6e?=
 =?us-ascii?Q?C2fpVW4P0dakGpqmtYUXQjRSegAEALZdtH04PaMV0qL/ig7EVmodGzjSP55f?=
 =?us-ascii?Q?7VriA7F/85krKK5hotsWvMC9iSuiMW1g056b3z98GVA9CI1oGK/yUnCEBZD6?=
 =?us-ascii?Q?aOU5P4qadpWsBKRj6+lL9Kl00B2hBH/bF00DM++ziIUvENyjhfJuL49Wxgzf?=
 =?us-ascii?Q?Uyx/YS/5Cv32hevnr6b0qmMjjEGGL3YOl3arBtvyAQFnLMTnAWYCW8CfnWSo?=
 =?us-ascii?Q?7XmHAilz+arRq9UVzNUtK2PatqCcONbxmbVFZ7dOXWorKHn/giX+5eraRczu?=
 =?us-ascii?Q?bVlXxLndRao4HczURxigUyvspWHhnD9YQCWJkDcsWXSbXhM5TUnM5Ut5nUUu?=
 =?us-ascii?Q?s2OHKpnNDRy6HrYYRzcSsuvjsm5YdhHg9SlCZd8sHbQlZLHo6YmgUeQcw7xG?=
 =?us-ascii?Q?XfXavhnFamJ058Rio1VpMutLfPRRk3gVXJzl8Gd0lHG4e00hKNWRsY56rfk/?=
 =?us-ascii?Q?608pF/8VxN0ZkkUWIcPJLIMap08jbp8mLmfoIpJnqaj8Ny4iFtvIeAMMhgJt?=
 =?us-ascii?Q?Oys7QO+omzgnMH1/o0aoDRVD4G4baS1dbqNwVnaRyHa2L3ZDm0OgGLHGeIjL?=
 =?us-ascii?Q?ZxYyG6wZw23YC6lhowT7f26J3Qshz15PWYRKg9hQPhEe/UG2SU95Z+3qle4Q?=
 =?us-ascii?Q?p45/1tIszDaFLtbCyndZj05NM1cLkD0mFhpyefbgQeqBjVO/cIMMg97E4EVI?=
 =?us-ascii?Q?FZxi0xlLnaeNisUXu9a0Dj4GffQgBjtPTF/sZOJonFL1f8SQrObJ+QbfUm2D?=
 =?us-ascii?Q?SLPkUlDWwNoJybuATluhzUutPIWOLeDZCR1aZbGvsSXqJZkzxCF0rY3M2z05?=
 =?us-ascii?Q?+QWBEpZFXIxh6VhRI6m20A1mXzowZQrHsmHupyAASJMEEzfa5YkZFoNAIKb4?=
 =?us-ascii?Q?HD/VXtUG0hHMuLmzEEWvIinIwM7VQxiVpAdWs3sPdcnelcdPHyH3MJVQcUG/?=
 =?us-ascii?Q?ZDQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cx9sWH96CiMRD+lys13BiQMwTCsbVxumao/bj4c3aySvHSaHM20Z8xMzlWkP?=
 =?us-ascii?Q?AxbALb6oVCXcfjBDLyhch7t4XQfRUaYYZqdahq2lAF9Gdq/lEnxy2iJ0XA/v?=
 =?us-ascii?Q?QQhJBVhBP+18aZtJBc54pU4aqrHkDOvLQ/VhXhbvnvCpILzMn+8ZCm3l22Ne?=
 =?us-ascii?Q?l3ULdFDY8izNF/sP/NGfaPQyB3azz5xSMrNP7QxWgXAJgoJkF7kpSd6nKi80?=
 =?us-ascii?Q?hiMM77O7mL4/xPiHVrxeju7KGFX7dxZUKydqRccYnW5bzjFP02cSiq+MkbQn?=
 =?us-ascii?Q?awgdPJ4okkggSRVqDf2fCi0HNSKlUprDso4g2Do257y/hzWel1Vz9mAe48+i?=
 =?us-ascii?Q?XKFOvAsqeK2r5q0f3J6yrnsMLBxDXssJPU0mFkYf6h0HbloB/uRBZFHGRzCv?=
 =?us-ascii?Q?kBpbFAjDdj7+9LSOW3iKRoqSNKUWHjCMrgcfgsGIGJA0fjBIRHj4LOXeJ8YN?=
 =?us-ascii?Q?KUrTd2SkR7s0gI7X08dMKNCOBcATpS7+cuZGxaf+jQTxencH7g8NOX3HhSDz?=
 =?us-ascii?Q?t/yu/e7k+nq6aW5j4y3VkmaOcQz77N2Ds6caiNTQjrzq31WpDAr5ccTP99+x?=
 =?us-ascii?Q?MKtMmnSBwoWETuTxt3jf8dGj31A+uWD5WpWJw4OJB3zywW1y7INOC/yVt9Ah?=
 =?us-ascii?Q?bDZdl/rq5O03NUn26CcjszPCJ0CIlDsnZ8uuLC/A/Z+zS1zQGhpCSnIoYKpt?=
 =?us-ascii?Q?Qc3ccfKeb1TzsQQPcfd7FOhSIZdTfRWINqDJkZxUrycB1775KHkzsz7mqxl/?=
 =?us-ascii?Q?NExP0mWHl1WrVA9RyN2M6s4EOzIwvX9cyW4ghqTVBNBd5WykV0/6iG5U1HT/?=
 =?us-ascii?Q?JdIt1W0aiYQYMUHGM+OFgjgSw7UQxiYmuWkCYeqzErsaa/F48HvHzdb8NVKD?=
 =?us-ascii?Q?Vwgox/B8onf/YMJ6LZZI5dmJJOevBS2yg42G9gxD6uij2n3hzynYV8bKJuk5?=
 =?us-ascii?Q?7vad1tcJWXPcl+wRysbQD9Cbg+HcVxkBK03trYra8DAE+Rlb6/rfYq/LWnCh?=
 =?us-ascii?Q?UTbC44a9GOie5Tsz+L73/vg8Hx0YpqvJiQAESjayML71S9TVOjSUSrJopIL3?=
 =?us-ascii?Q?G85JOBVSjrZZmK9OgoIGKNurlSrQs+7H+z5svpX6XtV5b2QawngBaXRFGWTi?=
 =?us-ascii?Q?WtascVWtTrWG5z211jyUeyeu0H2eCHQDE6edoLk1L410hJUtvq/OzXLk1Xzq?=
 =?us-ascii?Q?o0C2kHYHr8r71mPQevneeCAtuqMguJ3wjNJm+K0icf/u4n9ZsblHOmpuOmmx?=
 =?us-ascii?Q?3xZZ5VsDMzWvLQJpzdhj5/PwjOIJtp/9EbZzftkMmA=3D=3D?=
X-OriginatorOrg: sct-15-20-9115-0-msonline-outlook-15bf1.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f9946900-c562-4051-5336-08de27994ace
X-MS-Exchange-CrossTenant-AuthSource: SN6PR1901MB4654.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 18:27:27.7464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9203
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

On Wed, Nov 19, 2025 at 07:49:23PM +0200, Cristian Ciocaltea wrote:
> On 11/19/25 6:24 PM, Chris Morgan wrote:
> > On Wed, Nov 19, 2025 at 10:02:23AM +0100, Maxime Ripard wrote:
> >> On Tue, Nov 18, 2025 at 02:36:09PM -0600, Chris Morgan wrote:
> >>> On Tue, Nov 18, 2025 at 09:46:04AM +0100, Maxime Ripard wrote:
> >>>> Hi,
> >>>>
> >>>> On Thu, Nov 13, 2025 at 01:29:38PM -0600, Chris Morgan wrote:
> >>>>> From: Chris Morgan <macromorgan@hotmail.com>
> >>>>>
> >>>>> Add support for the dw-hdmi-qp driver to handle devices with missing
> >>>>> HPD pins.
> >>>>>
> >>>>> Since in this situation we are now polling for the EDID data via i2c
> >>>>> change the error message to a debug message when we are unable to
> >>>>> complete an i2c read, as a disconnected device would otherwise fill
> >>>>> dmesg with i2c read errors.
> >>>>>
> >>>>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> >>>>
> >>>> You must also disable any mode using the scrambler when there's no
> >>>> hotplug interrupt available.
> >>>
> >>> Is there a simple way to do that? I'm not seeing any references to
> >>> scrambling in the current driver.
> >>>
> >>> Should I just limit the rate to HDMI14_MAX_TMDSCLK (340000000)  under
> >>> dw_hdmi_qp_bridge_tmds_char_rate_valid() if using EDID polling? A
> >>> document I found online from Synopsys [1] claims that scrambling is
> >>> used by default at rates above 340 (if I'm reading it right) and used
> >>> opportunistically at rates below 340.
> >>
> >> Yep, that's what you should be testing for :)
> >>
> >> Maxime
> > 
> > Thanks, though now that I dig into it I'm a bit more confused on the
> > best way forward. It looks like for today the driver is hard-limited
> > to HDMI14_MAX_TMDSCLK because scrambling isn't supported. I'm assuming
> > it will be at some point, suggesting that we *will* need this in the
> > future. Is it sufficient to just add a comment there noting we need
> > to check, or should I add a check there (that does nothing today)
> > to ensure when we do support faster rates we are ready?
> 
> I plan to work on upstreaming the scrambling support soon.  Adding a TODO
> comment would be enough for me to take care of the rest, but I'll still need
> your help to get that tested, though. :-)
> 
> Cristian

Okay, I'll add a TODO there to make sure that we put in special handling for
when we have scrambling enabled, then when you have patches ready I can test
it.

Thank you,
Chris
