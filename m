Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD6C801101
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 18:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E0D10E8EC;
	Fri,  1 Dec 2023 17:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2101.outbound.protection.outlook.com [40.92.40.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4C810E919
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 17:18:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3biYDSTXSn2VZ158+BGTTZA5khuVj1kh0GPUnAxQNvfyZMm90loD4dp70LLg8zQweO0z8pe0SdJDCMTQR6/ScPe/do0QDVNYGgfH+OFBurGgwJTqex/EQ/9TJ82xhTAadh3IJRpZAohinFp3MAC2wTfZIJrILRwQhyjVRYQUPYEX3wScT+FrRDDu82+j66Qj4zNTZUu/mTLfIdUzgNwa+Ny/dzA5wBmem8NfSrScVc7AKYxYUowXaJ7TKUZE/L/0iki45zjlgGOS/S5AyBrH78hqxXCxsnJ5tTUhhfetp4VMy05Kmvu2ba4VREx1Sxi8gLcbxwElGjY32UdrMAo2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9HQacYxeSMBYpsGk3lAZDejcu8xr9ZdiZbH7KTMJyE=;
 b=L1mmEU5yXmJMbPSYyJHg/IZ4e1FXkbkTEjayA2xLhwtIi/sx/44iAwbWqh6D1w0Y4+ahPJr5ntlkTzQR5Bn47ALGsCC8exWoA1+rb7SqBMvShV0xOQF6dYmUDXFQQvTTRnSSNzanohDkd/ZjJljK/7op3STlv0lXJjRd1zx50iTYYsmSyTkjS5OdAOL5orj88u617uO3Ewfn7Rgu9L1O6rgN7YQUF7RVWCDAThAF4/uObfDZ/ZWCeWUZcrEpaA/bsutb/knw68ISkaj7ga0MEIre2xACM5jVoL11oxnIRRYya799jWyGhCpryZxNq9vo5ElGpc2G2bvnPrx9VLZTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9HQacYxeSMBYpsGk3lAZDejcu8xr9ZdiZbH7KTMJyE=;
 b=HSmOVFBi8QgBOh2cZLRz6LRGlZoaQPsLju949xvMmdqN8ktR1ubjfuF5xRIS7e90jIcegxs9ecD0tfVRRpWRpZbaRPtgRXfSG/IJK0uWIWDKpwyzmPaD9nKLQQ66Br9a227oyf5FovKX7Xbr02C7+bMgnqn90XVwCT29GaJnbp4RLD00U4GB8xcT7/go/yxq7ampo0LHVaQBwebaK7YRB8SY8ikNEQn9AiYQZLQAjnOg7X+04nGRmlQjrpvt5zhZDrLBGdFilGn6ZDruXqWZ/1FCPd0PV6iVU+7WsbaBfhcKCfDW6NdbYJIqgipYacA0Dr8s22BBduPawPBjJ+cQzQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by MW5PR06MB8906.namprd06.prod.outlook.com (2603:10b6:303:1c3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 17:18:23 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834%2]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 17:18:22 +0000
Date: Fri, 1 Dec 2023 11:18:18 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: 20231130155624.405575-7-macroalpha82@gmail.com
Subject: Re: [PATCH 6/9] drm/panel: himax-hx8394: Add Support for Powkiddy
 X55 panel
Message-ID: <SN6PR06MB53428549B09E09187E5057DFA581A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231130155624.405575-7-macroalpha82@gmail.com>
 <f8ae78a0-f329-457a-8a53-b1725f9e2e20@gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8ae78a0-f329-457a-8a53-b1725f9e2e20@gmail.com>
X-TMN: [RAA/6pYnbj9BcmAxAvaSnPZMzlIHEK7Q]
X-ClientProxiedBy: SN7PR04CA0189.namprd04.prod.outlook.com
 (2603:10b6:806:126::14) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZWoVWpL3U1q/1ZtP@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|MW5PR06MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 651b9758-de59-4a8f-7f4a-08dbf29184b2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8vRhSCbTRSpz/Le+26UC9MywPUHTWumvVsIfJfRFdI3PerESjI2gl8WR+0EiOLyORlABdgMnjZa5boWeIOKKX+TRqHnPG9AL48aGZ5DDr90+oBM4tYql5ySWM9ndoecTA3UkoHSe4yeqlUN7QaGM3wKcv9f8sceQznSx6dwbc3bI765/x6m7DC2NeN+9lurRCdOaLxGFoB0LoVvujXV1eGI2uHdLaVahA7vTI8Ft3DsQvIeQrko6DFN/e677iDx3k/sKotS5gy5SstbP8ADaA9X86USKswGSJ9mdFRLUOXMHByzPdSTIxFHVpiwdUGjQZFYgDKba+d0ztSS4R+3uxXEk+N+X69eoWCAzKB7YpIirksMJAAM3qpnqWoZImalpSTpaO7ru9odzFXIyHYKxqswQSgEL07VLNXp7AXaAGUHTe33JeHsfp5q4EUtI/hDvSwo9/f5MIQqSzyVOPPIEzhgyTjQXLNHflG4bHIQ6fZYq5aSdkJp7tmtq8b6VZW2e/PvJ63fkyFon707j+R5IP3i5QAEy+FhgSAcNbmEJtMtgZaXzlrq3nF16neKGdActSBMHxhkH7ROf+VHFnmjfOzNti5Z8IG/pDRPa4VHCVPE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ypbBZBrjaPxTCDJjUfByoD3G/2HnaQLtykKBu6Ynl0HxqpI5kHMcrJMrf1?=
 =?iso-8859-1?Q?Ho+TDuVNtyXv4RYMBQtwAW7aFHjqiGMenVKEyQFpK1lQp+zeFMlptls4/l?=
 =?iso-8859-1?Q?VgmiC6K5URFNEma6/y3OlQB0vnqjRhFYP1FV5JvL0cLJ5V76fbOK+xDvKu?=
 =?iso-8859-1?Q?rl3DPXjc2RfL70+tu2+SKKoq4DJcBKzsaqolL4rkpAE1tKbwCOqUlmx2GQ?=
 =?iso-8859-1?Q?bI6Z0vvvRz/7IxI4U0aWW76quoDIFTmyCqD/82NdYY2Aw4W+ddHFIaZG0H?=
 =?iso-8859-1?Q?YGOdto4fz9L6vxJxW92SP6PovVrDdi80Y5aFq5Y6+l2tlfgAXRqCoQ04lb?=
 =?iso-8859-1?Q?mgdtjZmMBgphFYPn0pCgQEmaqorXKxsWKv6n4gcftrNVegFL+cRWpmlldp?=
 =?iso-8859-1?Q?8sTEMf+pO+KUC2o/RGU+fssnuc353S109gcFhf0KDgKNsZeMGpbP5XESXm?=
 =?iso-8859-1?Q?e3t0P/hnXgXPog//f8Z5RAITCtQ4qJd20D63IZpynSa8V1BYcHoqNujUp8?=
 =?iso-8859-1?Q?K9QtXk5zWkaChpgPla8onmxapF92OC4zPguHcGmqQJHV3whgm2FBRJa5PO?=
 =?iso-8859-1?Q?6UwHaecDtJ0r8CJrrRT0MbpS9ws5uVIdk9kxY8P5VyGWbItOuivfRe8nmP?=
 =?iso-8859-1?Q?m9ALCmvsjOvlIlQs3AZfRgHbQXCCH0OUqi8zxHwjjaNbqS8W7I5NQH13MQ?=
 =?iso-8859-1?Q?ghvdPuMF/TxT6eGccbKllQGgMSloj2lYMn2ibdwMEbqUAWvZpXr0fV2ll7?=
 =?iso-8859-1?Q?6f870N2Lfb3fIzi5pLM1OOGyFZBqAJbzv0KWQ8pYj6CwyXO+zdd5GBB2ae?=
 =?iso-8859-1?Q?1r9TH6ICDE6ZenbXmQD/GBXt6NhRsmXWxP2XrZ/Qf6kN7xL+k27Wld7SNC?=
 =?iso-8859-1?Q?I76yfvBJmsxIaDoejgDCBQmJL/rMgAUCcwJowtUnTrcEk4Rb2/2njACgRb?=
 =?iso-8859-1?Q?rcpez58NC4mOJxv3hCJY75Lr30rZlQZvh5vl105PdmVDg3+vQ7uwLvULMD?=
 =?iso-8859-1?Q?X4pFs13svVvrsd3eSGZmarZI3rSD+jJrAAyXyLxKqeDr2WZ51c1erAyTx5?=
 =?iso-8859-1?Q?rmcWRk3vaFLcZONhVWS6GT08KprnaYFz4LtUvXCUQPbSnVOHA+jst1+qJE?=
 =?iso-8859-1?Q?J5DsKLgYyy0+2aBhzQXzgsZItgKPaF0GzdkyclLe3++SO8qV78fFx9wSq6?=
 =?iso-8859-1?Q?s+q/QraoomsiON0eWoKsQkr+fNk5rphMO6Fne6l7lI5RvfmGZF2hOPpeat?=
 =?iso-8859-1?Q?ZOds6bXr4vBvy7me1gtCQJAwgdOPygqt4e5a2eynE=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 651b9758-de59-4a8f-7f4a-08dbf29184b2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 17:18:22.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR06MB8906
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, macroalpha82@gmail.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org, mripard@kernel.org,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 09:19:40PM -0600, Kendrick Curry wrote:
> On Thu, Nov 30, 2023 at 09:56:21AM -0600, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Add support for the Powkiddy X55 panel as used on the Powkiddy X55
> > handheld gaming console. This panel uses a Himax HX8394 display
> > controller and requires a vendor provided init sequence. The display
> > resolution is 720x1280 and is 67mm by 121mm as measured with calipers.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-himax-hx8394.c | 137 +++++++++++++++++++++
> >  1 file changed, 137 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> > index b68ea09f4725..4807ab1c10fe 100644
> > --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> > +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> > @@ -38,6 +38,7 @@
> >  #define HX8394_CMD_SETMIPI      0xba
> >  #define HX8394_CMD_SETOTP      0xbb
> >  #define HX8394_CMD_SETREGBANK      0xbd
> > +#define HX8394_CMD_UNKNOWN5      0xbf
> >  #define HX8394_CMD_UNKNOWN1      0xc0
> >  #define HX8394_CMD_SETDGCLUT      0xc1
> >  #define HX8394_CMD_SETID      0xc3
> > @@ -52,6 +53,7 @@
> >  #define HX8394_CMD_SETGIP1      0xd5
> >  #define HX8394_CMD_SETGIP2      0xd6
> >  #define HX8394_CMD_SETGPO      0xd6
> > +#define HX8394_CMD_UNKNOWN4      0xd8
> >  #define HX8394_CMD_SETSCALING      0xdd
> >  #define HX8394_CMD_SETIDLE      0xdf
> >  #define HX8394_CMD_SETGAMMA      0xe0
> > @@ -203,6 +205,140 @@ static const struct hx8394_panel_desc
> hsd060bhw4_desc = {
> >      .init_sequence = hsd060bhw4_init_sequence,
> >  };
> >
> > +static int powkiddy_x55_init_sequence(struct hx8394 *ctx)
> > +{
> > +    struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> > +
> > +    /* 5.19.8 SETEXTC: Set extension command (B9h) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
> > +                   0xff, 0x83, 0x94);
> > +
> > +    /* 5.19.9 SETMIPI: Set MIPI control (BAh) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
> > +                   0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
> > +
> > +    /* 5.19.2 SETPOWER: Set power (B1h) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
> > +                   0x48, 0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71, 0x57,
> 0x47);
> > +
> > +    /* 5.19.3 SETDISP: Set display related register (B2h) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
> > +                   0x00, 0x80, 0x64, 0x0c, 0x0d, 0x2f);
> > +
> > +    /* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
> > +                   0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86,
> 0x75,
> > +                   0x00, 0x3f, 0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01,
> 0x0c,
> > +                   0x86);
> > +
> > +    /* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
> > +                   0x6e, 0x6e);
> > +
> > +    /* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
> > +                   0x00, 0x00, 0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08,
> 0x10,
> > +                   0x08, 0x00, 0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a, 0x02,
> 0x15,
> > +                   0x06, 0x05, 0x06, 0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10,
> 0x07,
> > +                   0x07, 0x0c, 0x40);
> > +
> > +    /* 5.19.20 Set GIP Option1 (D5h) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
> > +                   0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04,
> 0x05,
> > +                   0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25, 0x18,
> 0x18,
> > +                   0x26, 0x27, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> 0x18,
> > +                   0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20,
> 0x21,
> > +                   0x18, 0x18, 0x18, 0x18);
> > +
> > +    /* 5.19.21 Set GIP Option2 (D6h) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
> > +                   0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03,
> 0x02,
> > +                   0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20, 0x18,
> 0x18,
> > +                   0x27, 0x26, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> 0x18,
> > +                   0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x25,
> 0x24,
> > +                   0x18, 0x18, 0x18, 0x18);
> > +
> > +    /* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
> > +                   0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47,
> 0x56,
> > +                   0x65, 0x66, 0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d, 0x98,
> 0xa8,
> > +                   0xb9, 0x5d, 0x5c, 0x61, 0x66, 0x6a, 0x6f, 0x7f, 0x7f,
> 0x00,
> > +                   0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56,
> 0x65,
> > +                   0x65, 0x6e, 0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99, 0xa8,
> 0xba,
> > +                   0x5d, 0x5d, 0x62, 0x67, 0x6b, 0x72, 0x7f, 0x7f);
> > +
> > +    /* Unknown command, not listed in the HX8394-F datasheet */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
> > +                   0x1f, 0x31);
> > +
> > +    /* 5.19.17 SETPANEL (CCh) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
> > +                   0x0b);
> > +
> > +    /* Unknown command, not listed in the HX8394-F datasheet */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
> > +                   0x02);
> > +
> > +    /* 5.19.11 Set register bank (BDh) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> > +                   0x02);
> > +
> > +    /* Unknown command, not listed in the HX8394-F datasheet */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN4,
> > +                   0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> 0xff,
> > +                   0xff, 0xff);
> > +
> > +    /* 5.19.11 Set register bank (BDh) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> > +                   0x00);
> > +
> > +    /* 5.19.11 Set register bank (BDh) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> > +                   0x01);
> > +
> > +    /* 5.19.2 SETPOWER: Set power (B1h) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
> > +                   0x00);
> > +
> > +    /* 5.19.11 Set register bank (BDh) */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> > +                   0x00);
> > +
> > +    /* Unknown command, not listed in the HX8394-F datasheet */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN5,
> > +                   0x40, 0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
> > +
> > +    /* Unknown command, not listed in the HX8394-F datasheet */
> > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN2,
> > +                   0xed);
> > +
> > +    return 0;
> > +}
> > +
> > +static const struct drm_display_mode powkiddy_x55_mode = {
> > +    .hdisplay    = 720,
> > +    .hsync_start    = 720 + 24,
> > +    .hsync_end    = 720 + 24 + 4,
> > +    .htotal        = 720 + 24 + 4 + 20,
> > +    .vdisplay    = 1280,
> > +    .vsync_start    = 1280 + 8,
> > +    .vsync_end    = 1280 + 8 + 4,
> > +    .vtotal        = 1280 + 8 + 4 + 8,
> > +    .clock        = 59904,
> > +    .flags        = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +    .width_mm    = 67,
> > +    .height_mm    = 121,
> > +};
> > +
> > +static const struct hx8394_panel_desc powkiddy_x55_desc = {
> > +    .mode = &powkiddy_x55_mode,
> > +    .lanes = 4,
> > +    .mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> 
> > +                     MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET,
> 
> 
> It looks like a mode flag is set twice. The line above should be this below:
> 
>                          MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,

Thank you, you are correct. I've since fixed this and it caused the
image on the panel to shift slightly, so I've had to adjust the
timings somewhat. I'll fix this with the V2 (I'll also have to add
a new clock frequency for the PLL_VPLL so we can run this panel
at 60hz).

> 
> 
> > +    .format = MIPI_DSI_FMT_RGB888,
> > +    .init_sequence = powkiddy_x55_init_sequence,
> > +};
> > +
> >  static int hx8394_enable(struct drm_panel *panel)
> >  {
> >      struct hx8394 *ctx = panel_to_hx8394(panel);
> > @@ -419,6 +555,7 @@ static void hx8394_remove(struct mipi_dsi_device *dsi)
> >
> >  static const struct of_device_id hx8394_of_match[] = {
> >      { .compatible = "hannstar,hsd060bhw4", .data = &hsd060bhw4_desc },
> > +    { .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
> >      { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, hx8394_of_match);
> > --
> > 2.34.1
> >
> >
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
