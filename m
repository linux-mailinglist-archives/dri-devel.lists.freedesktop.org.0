Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA4E64DD0F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 15:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC5E10E0BF;
	Thu, 15 Dec 2022 14:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2069.outbound.protection.outlook.com [40.92.21.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547B810E0BF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 14:45:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSBIl69q55yE7MxBFTNMacM2UlGkb2d6vdB8w9NyUyb+QJa+258i7/C7nnPXwLCVzBMnpUSfdk3NbCzylwQF4Al//ecKbtxcApIfC8U4vgWF+gvhz3vFrCco2XM+AXnpnlMzuCnN87RuAkKkhMtvYnTYORRCM5tTT95mUy8pi6fJGuuOTaOwaZvOPZO/3iq74EyWAvxt/vklgVn+hqbyo0Ch9QpVJilkweCIlauWWdy/BFRH2D76effs3ybo2x01SZkRqL+KkoZQ261sqXG1cM8uwio7A3hb3mKQhzvp0ZC6Z6+x5SSjjR33yKBYv9vij7f/q0TtYrKzo2Q59NEnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua1pI0CppFuZtVmHkHj0+kPHGcyAJV/CQUUkChohtE8=;
 b=Njd0SzG/dLsolksoGVuz5L/U89iNeHm2uarmAgh4z48EoSfG6p2c1SohMQ3417/WiR74Sq/B9M7WMbbvNfkTr1Y7cvH7tUzzoJ3ur3kGIjwndkgoiGZHLnP3PYqFAIXqm9yC9SNBTeyZ56ZLd9iT07aD+8yswGj0DGJObiDfUXc+MsNbsBElDY/+SeEmkQtgq/rFnxrSuLBl4k0Gz/FwKi2kWsbQIr2Wh58nJmrJShHcOMnssiVAQNhoz0A/IEhjI3bCqFWik35TK3X29cb3lMY4X7mc35AgPVQhDp+Svhw4yKbz34wtrOuLr+27LNqMOIDlKdFm+s8rcLUZO6WNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ua1pI0CppFuZtVmHkHj0+kPHGcyAJV/CQUUkChohtE8=;
 b=olDudbtAFvF82cBkxOVVpEF12Pk/gt0Z875oF2PjBxFHo7WVL7fKOAbFRV2drEwJnxNEwUnkNN5A7tDGUYWvjgIsf2QKB0DmoGpw0eMutYmjoxJ/abbM9rUAmJk7jAPwDiJp3WrYZxQIeaZLBE0nhtd/Xi21Y1ht7SzBAYhsAcQNg7wvBai7484PNoX/thG4EglH3aAQPL4V6GAHWy5l8lY4QeEsUWRij+ft/Ar2IrmfElgWoZQ2gI/gq6jfFvmpsmSfOJzdFn2PibWHMnioOQ4EyMnNWmTApQlHKEZXH2J290ct5Kn7c6IGYJPb1FmIA2Es636YOAxdh+jSeEKwEw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by CO3PR06MB8576.namprd06.prod.outlook.com (2603:10b6:303:17d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 14:45:00 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::ff4f:2e64:cf70:cc68]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::ff4f:2e64:cf70:cc68%5]) with mapi id 15.20.5924.005; Thu, 15 Dec 2022
 14:44:59 +0000
Date: Thu, 15 Dec 2022 08:44:56 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 2/4] dt-bindings: display: panel: Add Magnachip
 D53E6EA8966
Message-ID: <SN6PR06MB53429788776760E4BDBC55ABA5E19@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20221214180611.109651-1-macroalpha82@gmail.com>
 <20221214180611.109651-3-macroalpha82@gmail.com>
 <CACRpkdY7UArNJ5ZH8f5rx+9aoV_ii=0aE9PCj-6XHCL7Om0+=Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY7UArNJ5ZH8f5rx+9aoV_ii=0aE9PCj-6XHCL7Om0+=Q@mail.gmail.com>
X-TMN: [WfsULrF+B9Yc3/ihuyBaN+o1MTDqld4y]
X-ClientProxiedBy: SA0PR11CA0062.namprd11.prod.outlook.com
 (2603:10b6:806:d2::7) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <Y5sy6PCH547Hv69t@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|CO3PR06MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b0d2757-f74b-404b-02d3-08dadeaaf0cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGfri2XOVbtCv8wZ3U4b96B7jW509rzLLLdpI/puDZnbpcH7HNsa67VZAfBFOIY+MavS+t4ektx0aRSBEB+1rRrBT1uclyNxMToOCHuugXXJymjIj3VOUo8ybJe+n3G7LwEFhN5b/3R+r9Tl4Q1kOU/dIAH5Q2IZoHW932XqDF1kyFzuJeVZbzhvIi7VaLEzY+mBaIPf0Y5hHWiFSMI6jJAfMKT9rEh96AvOGa/tIep0O3PGenI6WTzVpYEsuptt2WDBqEphB7xNci3QElXAP9dQAwv3aT7Kt9Fa6nCVYsAjLyPp66m3Zmk4lGOT4E8uLXzsAn5gLgVTJuhF7tUI0y0dlHQ+l2T3/8ILapWuBhKM+TizyFgWFpN0ghh5eUX31Hxrcs4jdehKMiCuckJSDZElydihTYEYJMbCBNMd5xUflJY8JS9iKWUmb8ds0Ipr87h6XdwILJduWi9OvT2Fxjdtl+jQAlnLeU7R1m6/952c0kzZepEPb+ZIuVl67zXxu3UTR8A5pzgskUCDMGgWztenP1Sn+ZiOS1F8JwDizhhjqJujQRwmAqruRVmAF3DO30b3EEyH0hBRcQgIzyXqU0wFAfaXUaHnjlRofffQ0eYOJ5+IYMsNKws/paAc3sqNqmbghJbkz4YYAwbsvuLKiQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Hz1PbMPPqsIGKCQDbeizrOx1ogCfol9jQqudaXM8LPVaYCI7gZp37NubRSl?=
 =?us-ascii?Q?jjlAzKSofI9ACm0jNOwhBde+J0U8wnyPYkHBBAUdPydaOucR2NH5OckpAUm6?=
 =?us-ascii?Q?a04Qdyajed080ZZIgkGZthkoXExpdBe1JGhCr1avXGedNPhe6qAq609B85tl?=
 =?us-ascii?Q?k2nANRWXn7H0arfWRYQaA62JXB9MI5PpphVrH2YsFDk5N0mB7kLwbknOIYaF?=
 =?us-ascii?Q?OkKvOfmF8Nm1DwZYE5uwLCAXI1QTmXE+D8Fhr5XfuLG/A/0tiqkHzNayJLMK?=
 =?us-ascii?Q?SHbWqQplLOi2wraCAFsS44bivmIYuMQA2Hik8T5+wIb1nApHAIP6QLe8iyJ8?=
 =?us-ascii?Q?iiWYleVikT7ZGD6kAJg42inmwigpdn4U1htXiyRyqv/Bdl1JZzkVfwlORPTo?=
 =?us-ascii?Q?UZ2fKTPO7Ja2NATVstbaPfp7P3j0F6h11MkdT55+Xq/WelvFmz2z9li+2sp0?=
 =?us-ascii?Q?j+XHwDamtJhFXAtznxL0oRo5iphf41pagVAxC8pCRNWN2MC02emz0P7Y8/+J?=
 =?us-ascii?Q?nQttYOtZUIVEkJ5aipbznp3m87rWWPl6gGNtZY2xGznWsB9No/iVRMLc2c+M?=
 =?us-ascii?Q?vNIEIuT6u/y+iEq/kkmJgd4Sw0cY+uXNkkxPdk38VlpqN+hCFqSswafcSLi5?=
 =?us-ascii?Q?rZSzMQ7bHQVgDaWeJqkUTtrlvj5qOFu15swi9OU13foe7Qp84T+Ohp6jodu5?=
 =?us-ascii?Q?NGUjN6Ojn0PASIuTxLcsOYuDrunO/9baHlo4SxskTEbnn6Wor2Iutrrs2gCv?=
 =?us-ascii?Q?EtRmD+wv64hDuUBaUZ5AkP2plRUPK7GcgshLb3E5j+Ga/es3cEAqab1oEbeC?=
 =?us-ascii?Q?rL/sH+Di9gQUbiZNP43/hpueUwFlg1km9RpzU6Hq3F4n4QqYglYDpCr1COwo?=
 =?us-ascii?Q?5BHuk+VsdtUCoGqXM41mzpG0QT2sfFgDcMdqt8NLYEhCbtJFFEhbMvasCcnV?=
 =?us-ascii?Q?M6sYF7mQ8rehfG4BWkLNMVFK/IAi93XOQTWH7awTTjEbf6cXbFa+o0SzhmV4?=
 =?us-ascii?Q?m0AWaaoipdveTIcYs3ghy6Xhe76W/ww+/Jr0+tuO1CfO94XlY8LIQ4NfOURv?=
 =?us-ascii?Q?mP+Io8LdIZYPHc9bUWhPEDa6JptJpnpjfezwUawN5FfA7putxFxBk2jCUaj5?=
 =?us-ascii?Q?+s1PjQn1dukkvuv4IKy1BhncxZ2jtns4CSWtp9PkSmQbZBoDbC9uilh3cAPf?=
 =?us-ascii?Q?ORj776yfrdSL+BkgNke+F01bSnbVZRjjc+Gzo+MCR+yN9dYGt9edkGKGT/qM?=
 =?us-ascii?Q?ocmK7oTG485Aq5YGNiBCCW4o6utieF8ExVkeUfSGtA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0d2757-f74b-404b-02d3-08dadeaaf0cc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 14:44:59.9085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR06MB8576
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, Chris Morgan <macroalpha82@gmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 15, 2022 at 09:47:19AM +0100, Linus Walleij wrote:
> On Wed, Dec 14, 2022 at 7:06 PM Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Add documentation for Magnachip D53E6EA8966 based panels such as the
> > Samsung AMS495QA01 panel.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> (...)
> >  .../display/panel/magnachip,d53e6ea8966.yaml  | 62 +++++++++++++++++++
> 
> It's fine to keep this as samsung,ams495qa01.
> 

Would the device tree team be okay with that change? The driver name
itself has changed and I fear possible confusion if someone is looking
for docs by driver name.

Otherwise I noticed I had an outdated version of the dt-schema and
missed an error, so I have to resubmit either way to fix it. The
horrors of upgrading your build machine...

Thank you

> Just mention that it uses the magnachip controller in the
> description.
> 
> That Linux implements this with a generic driver that handles
> all (in theory possible) magnachip-based products is a linuxism
> and does not need to be in the bindings.
> 
> Yours,
> Linus Walleij
