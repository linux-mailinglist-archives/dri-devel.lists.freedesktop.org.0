Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B067583D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 16:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D802910E114;
	Fri, 20 Jan 2023 15:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2017.outbound.protection.outlook.com [40.92.41.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5CC10E114
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 15:13:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7Em6qxMtrcfTDbW0MMax6DJBsW9HmEJ8Cyy74DyFGezzm9df6XPKafZaHDNKfalF5Hz6oIEYF8SCR6OESufw9AjsWeXwaHS7YW5mRlI6GS/NB5M2f9v8BeyEnpQe2GkIEKHsVTum3S+/LpLlICX5jlyLX0VLDINOXazm4uvtDRkM19MGcBI0C4XiT5pFviymVqp9OJQBJVP+F4iDMajsdAxyu0AIzn4nTcqWjL9hM84hfxqKC24NBnugTXre61fdb9aTMSitzCwTCfzcqBxufkJ1BaS84jIEfEB2xxlcS9Ou/LFOpCjOBqT7eNdMEpO8IT8EbVkeJQHKRIkz24VSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5jfMJIQ1c/FJr4Uaq22BkUMmn2Lt6icYyEyhnHQBoE=;
 b=hfvP081inmQRaFmGRYLyao2dvibeZbIivx5a1QO4KjNeu/9qN3nAlTDusIUa5epRxNUk/OHxKXnssF9b70wzktkoAUFSVgkmTWMibKvZGWJQG93j8F9VaLSnhwyF3rgCvjUmzGECTr1Xt8jyl4wM7OiTcehZsgos+jmhGLqEnwgfsCZu644oNrWI4eAwljYU/HEFMCCT8Ow7fyOE0PqdxNJYPIro3cX/adl4JtehQdTCFIC4Z5sLVSCc3Clx6FhyciyUSkOFm4tu769t0RSj5qY//VI3AtNHQo3iY3YJAxU/ltdYvJ/pJCOVtL4eH7T5TZdBwJUqpTuHpXExm0o3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5jfMJIQ1c/FJr4Uaq22BkUMmn2Lt6icYyEyhnHQBoE=;
 b=MtUTkglyi2x+G0kr46I7XVV26aO0Ay2J57ZdhgRNrxTAsjM0y80nQF+wx8Q1uGFSqDOe/DL+ZESqZKLZt5a1get3sSMKtTWm91XSd83dRn4D123pJTf00J3TH/xKU0N9rzDVZ4zLMS3fF0fnfy45pnW1bSgtfShINcquo3frfAE3VfIG65z8npfntRo3sEZikNOlD2p1+mT4i7HbXLP/IBd7s3Vh0iH1AoZWWEhk4Ju6VctUYDLsncVpQurrOe4gfxvEp3tRB03ttgj1jFaqBP2dNZ+hZeNSWVecGw99pFXbThOukbu2/EF9VL5YjuWdrYDz8jYPt0/F8gy9M+ssPw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SA2PR06MB7513.namprd06.prod.outlook.com (2603:10b6:806:141::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 15:13:24 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::ff4f:2e64:cf70:cc68]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::ff4f:2e64:cf70:cc68%5]) with mapi id 15.20.5986.018; Fri, 20 Jan 2023
 15:13:24 +0000
Date: Fri, 20 Jan 2023 09:13:20 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
Subject: Re: [PATCH 2/2] drm/panel: st7703: Add support for Anbernic
 RG353V-V2 panel
Message-ID: <SN6PR06MB534266FFAD4BAF52A4253D51A5C59@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230119230415.1283379-1-macroalpha82@gmail.com>
 <20230119230415.1283379-3-macroalpha82@gmail.com>
 <Y8pZqPH0rDSfxhVr@qwark.sigxcpu.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8pZqPH0rDSfxhVr@qwark.sigxcpu.org>
X-TMN: [TB3EbAdXvzNsDqCgaec3kblNdWUYuo0S]
X-ClientProxiedBy: SA1PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::26) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <Y8qvkN5lYSRSfCyt@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SA2PR06MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bcb4a79-6799-4f22-72fc-08dafaf8df74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KS8Gtzn+Z6O5cRBhSyQQXHsQ7oJDaKfs/b0ZoeZceDKxOtC7UWDNLx6gAPvGIeDo0d2HpYdbrUhbFrVQ2nRqSAcx9P3lZc8OxYgp9OPUNEsmAfo5tiSgpOU3plpUTZDlDtCT2gdu3lV0cne0ynDwhRYavio11MsV2n+r/R8Kr0NpxgslipLbwws8YBnrOfA0ExNEGfeo+3ooiXXjVo4SOZnpKBBi5U/egkuBcu7VePA+Qy8Qa6d3XGiJ/Xq4lpH92ev9u5hyYZpYa8m2CRS1bC+e8a72z2TJJxsayHPPRfatp4aB+W0zR9M6Dtp/1RBBod1p0aZUKn6Fl22TWi9gxg/cWAzZCu/IFYLAZry7XfK48D0kmrfjYZc2m0eKU0Bu6UeCgI38Fc8vGMSv8P3wT+cNBQnlO+IYpCcS1Nt+q0xk02xmBnyt9aYDLRUU13JyOuMAk/Jk4gRVKK2CTjdKceoSFMnVJkyt09N/jcg4P17MtTkyAXpR3DCTt8L2OfMgUShfCVrfqrKXXUcXfFXgoEo3f7IuG9Ytx0mSh/GqUVrGKNgG+vrl+uNcS+2YudzyZSWmHxrTRaI1e4FjvXIngJYv54l1/GMqkjog+AOGBQvf4F818kW1fhr0XxTY+ZV3pd8ldvU0IW+6IJOHHOXIwA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hrSBP7sAjvZ7L7pZ01fZYK7INNBPHp51zSsGamSfDD3/47xfAtwFLp/psm?=
 =?iso-8859-1?Q?7v2cExXZ/Iv/urppckDRT0M/w1rbdgTLckVrV3tF/flEU2iIQpUwCAG+Tf?=
 =?iso-8859-1?Q?6+rbEGT33he1US1RDp5Pcn/rfpZpYLJy/0rHBIQx3mEk/seCci+UYVOX+0?=
 =?iso-8859-1?Q?fqk+Hkh4YofEdOsi3WgeHFTNq0PEAqwdp6r30nsJHUIKzLSdzYIKYyYDMc?=
 =?iso-8859-1?Q?djOyhptAnDfvmGRaG0aSWo88fdiJxV6tdMVG9DzxfqOzAuECtHVRrZf+sS?=
 =?iso-8859-1?Q?kBUklwrqxm2rRzCgFxo7WgeU5O/4NCJJS+l+b+gDixAzzbX+8Ws7x2C7Cj?=
 =?iso-8859-1?Q?dwSFAUOkNA1odRgDbbMgreCgQ3IK1cd2SCwxaniAoUuNwgnMuSf4DBdQky?=
 =?iso-8859-1?Q?NUVyxRnYHEu+PnCzfRzwEFjzhqbyqE0mdhu5m9dTRYieUPFdASsY+WjWDt?=
 =?iso-8859-1?Q?YTBJ7V9OCGaCkI0T1BA1Vb6YRrIZmNt1aJ+4fSIx8HBjD5oOZ7XKgijKnL?=
 =?iso-8859-1?Q?CzbigraFEqmZrZ4dELpsQ606LcssoR/zk75th5xvWErI/wtSwYjxkSQdNO?=
 =?iso-8859-1?Q?ew2zU/Cvmp8ErVEwJMuvLgBsrXAGfI3P6X2zK4YoVS6vteWxdMb8IyrRLf?=
 =?iso-8859-1?Q?WcqIudErNOu+hFbxBiWlXwaoXLNyUNC7Zg0eo7kcWeTUtYAkWZs6AdpLtL?=
 =?iso-8859-1?Q?rsdRgGngiDkKtsjc2XMvXWjFBmcBH2nLrW3jM+KRHufr1eY07gIVVRhrmV?=
 =?iso-8859-1?Q?FcHh6kknJgNHbo/mKfzu4rIRaucUaHtKpo56UzrtflQyTtJjN7wiaW1qdk?=
 =?iso-8859-1?Q?u/Ig29dhglV2MECkDp8tmVfsJJBs7JK7SeqcST3bX3og/EtIBY3SuO7eG2?=
 =?iso-8859-1?Q?k6bBE/qRbfCx4+nm6pRyt1qEjwwFs6rB5qBwDPPEupriY5mTCN8q+01EpY?=
 =?iso-8859-1?Q?h+PHRftr5OKBAhV9/HtWwrpR78EiFuU/03tq0+2Tp6PQduM77cuH9rBYP+?=
 =?iso-8859-1?Q?sfXDdRjxb/D0wV5KmFIRe8EuPXJf/yCX5Mp3bgzvYBwc8AFeVmmsFoW+uJ?=
 =?iso-8859-1?Q?sl/GrAJ+vnbNkf/TSDVI5Si8pnE3CzXfLBoruWg6dQAUiZNNfI3CVal9T7?=
 =?iso-8859-1?Q?bCov+KOX7qStnajVFf2SVafenUI2xcmfUUV1mmaRXyjhbsmnyCsbAIFeAm?=
 =?iso-8859-1?Q?A3ACvxgvsWweCJHYXHJxtfxXWJkTg/H2CyAEo1JdXMggfAE9jeC+w7ktOq?=
 =?iso-8859-1?Q?A3HdeHR3uth1RxY9voH8EAm4hrPKQQySGqThS1D75L0CLAzqJsfA4tK9L6?=
 =?iso-8859-1?Q?zzo/J23JBjmjoVYilnPParHPwQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcb4a79-6799-4f22-72fc-08dafaf8df74
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 15:13:24.5223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR06MB7513
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com, kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 10:06:48AM +0100, Guido Günther wrote:
> Hi,
> On Thu, Jan 19, 2023 at 05:04:15PM -0600, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > The Anbernic RG353V-V2 is a 5 inch panel used in a new revision of the
> > Anbernic RG353V handheld gaming device. Add support for it.
> > 
> > Unfortunately it appears this controller is not able to support 120hz
> > or 100hz mode like the first revision panel.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 102 +++++++++++++++++-
> >  1 file changed, 99 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > index 86a472b01360..2ed0cdfa86de 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > @@ -28,6 +28,7 @@
> >  /* Manufacturer specific Commands send via DSI */
> >  #define ST7703_CMD_ALL_PIXEL_OFF 0x22
> >  #define ST7703_CMD_ALL_PIXEL_ON	 0x23
> > +#define ST7703_CMD_SETAPID	 0xB1
> >  #define ST7703_CMD_SETDISP	 0xB2
> >  #define ST7703_CMD_SETRGBIF	 0xB3
> >  #define ST7703_CMD_SETCYC	 0xB4
> > @@ -41,12 +42,15 @@
> >  #define ST7703_CMD_UNKNOWN_BF	 0xBF
> >  #define ST7703_CMD_SETSCR	 0xC0
> >  #define ST7703_CMD_SETPOWER	 0xC1
> > +#define ST7703_CMD_SETECO	 0xC6
> > +#define ST7703_CMD_SETIO	 0xC7
> > +#define ST7703_CMD_SETCABC	 0xC8
> >  #define ST7703_CMD_SETPANEL	 0xCC
> > -#define ST7703_CMD_UNKNOWN_C6	 0xC6
> >  #define ST7703_CMD_SETGAMMA	 0xE0
> >  #define ST7703_CMD_SETEQ	 0xE3
> >  #define ST7703_CMD_SETGIP1	 0xE9
> >  #define ST7703_CMD_SETGIP2	 0xEA
> > +#define ST7703_CMD_UNKNOWN_EF	 0xEF
> >  
> >  struct st7703 {
> >  	struct device *dev;
> > @@ -266,8 +270,7 @@ static int xbd599_init_sequence(struct st7703 *ctx)
> >  				 * ESD_DET_TIME_SEL = 0 frames
> >  				 */);
> >  
> > -	/* Undocumented command. */
> > -	dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_C6, 0x01, 0x00, 0xFF, 0xFF, 0x00);
> > +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETECO, 0x01, 0x00, 0xFF, 0xFF, 0x00);
> 
> Thanks for catching this! Would make sense to split that into a separate
> commit. With that fixed

I can, if you would prefer. I just thought it was trivial so I wrapped
it up in a single commit. I had a newer revision of the ST7703
datasheet on hand that had that command documented, but unfortunately
not BF or a new command I added EF. If a new commit is preferred I'll
resubmit early next week.

Thank you.

> 
> Reviewed-by: Guido Günther <agx@sigxcpu.org>
> 
>  -- Guido
> 
> >  
> >  	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
> >  			  0x74, /* VBTHS, VBTLS: VGH = 17V, VBL = -11V */
> > @@ -355,6 +358,98 @@ static const struct st7703_panel_desc xbd599_desc = {
> >  	.init_sequence = xbd599_init_sequence,
> >  };
> >  
> > +static int rg353v2_init_sequence(struct st7703 *ctx)
> > +{
> > +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> > +
> > +	/*
> > +	 * Init sequence was supplied by the panel vendor.
> > +	 */
> > +
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETAPID, 0x00, 0x00, 0x00,
> > +			       0xda, 0x80);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP, 0x00, 0x13, 0x70);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF, 0x10, 0x10, 0x28,
> > +			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
> > +			       0xf0, 0x63);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
> > +			       0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00,
> > +			       0x00, 0x00, 0x00, 0x44, 0x25, 0x00, 0x90, 0x0a,
> > +			       0x00, 0x00, 0x01, 0x4f, 0x01, 0x00, 0x00, 0x37);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x47);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR, 0x73, 0x73, 0x50, 0x50,
> > +			       0x00, 0x00, 0x12, 0x50, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER, 0x53, 0xc0, 0x32,
> > +			       0x32, 0x77, 0xe1, 0xdd, 0xdd, 0x77, 0x77, 0x33,
> > +			       0x33);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETECO, 0x82, 0x00, 0xbf, 0xff,
> > +			       0x00, 0xff);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETIO, 0xb8, 0x00, 0x0a, 0x00,
> > +			       0x00, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCABC, 0x10, 0x40, 0x1e,
> > +			       0x02);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0b);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA, 0x00, 0x07, 0x0d,
> > +			       0x37, 0x35, 0x3f, 0x41, 0x44, 0x06, 0x0c, 0x0d,
> > +			       0x0f, 0x11, 0x10, 0x12, 0x14, 0x1a, 0x00, 0x07,
> > +			       0x0d, 0x37, 0x35, 0x3f, 0x41, 0x44, 0x06, 0x0c,
> > +			       0x0d, 0x0f, 0x11, 0x10, 0x12, 0x14, 0x1a);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ, 0x07, 0x07, 0x0b, 0x0b,
> > +			       0x0b, 0x0b, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00,
> > +			       0xc0, 0x10);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1, 0xc8, 0x10, 0x02, 0x00,
> > +			       0x00, 0xb0, 0xb1, 0x11, 0x31, 0x23, 0x28, 0x80,
> > +			       0xb0, 0xb1, 0x27, 0x08, 0x00, 0x04, 0x02, 0x00,
> > +			       0x00, 0x00, 0x00, 0x04, 0x02, 0x00, 0x00, 0x00,
> > +			       0x88, 0x88, 0xba, 0x60, 0x24, 0x08, 0x88, 0x88,
> > +			       0x88, 0x88, 0x88, 0x88, 0x88, 0xba, 0x71, 0x35,
> > +			       0x18, 0x88, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00,
> > +			       0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +			       0x00, 0x00, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2, 0x97, 0x0a, 0x82, 0x02,
> > +			       0x03, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +			       0x81, 0x88, 0xba, 0x17, 0x53, 0x88, 0x88, 0x88,
> > +			       0x88, 0x88, 0x88, 0x80, 0x88, 0xba, 0x06, 0x42,
> > +			       0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x23, 0x00,
> > +			       0x00, 0x02, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +			       0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_EF, 0xff, 0xff, 0x01);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct drm_display_mode rg353v2_mode = {
> > +	.hdisplay	= 640,
> > +	.hsync_start	= 640 + 40,
> > +	.hsync_end	= 640 + 40 + 2,
> > +	.htotal		= 640 + 40 + 2 + 80,
> > +	.vdisplay	= 480,
> > +	.vsync_start	= 480 + 18,
> > +	.vsync_end	= 480 + 18 + 2,
> > +	.vtotal		= 480 + 18 + 2 + 28,
> > +	.clock		= 24150,
> > +	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +	.width_mm	= 70,
> > +	.height_mm	= 57,
> > +};
> > +
> > +static const struct st7703_panel_desc rg353v2_desc = {
> > +	.mode = &rg353v2_mode,
> > +	.lanes = 4,
> > +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > +		      MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_LPM,
> > +	.format = MIPI_DSI_FMT_RGB888,
> > +	.init_sequence = rg353v2_init_sequence,
> > +};
> > +
> >  static int st7703_enable(struct drm_panel *panel)
> >  {
> >  	struct st7703 *ctx = panel_to_st7703(panel);
> > @@ -615,6 +710,7 @@ static void st7703_remove(struct mipi_dsi_device *dsi)
> >  }
> >  
> >  static const struct of_device_id st7703_of_match[] = {
> > +	{ .compatible = "anbernic,rg353v-panel-v2", .data = &rg353v2_desc },
> >  	{ .compatible = "rocktech,jh057n00900", .data = &jh057n00900_panel_desc },
> >  	{ .compatible = "xingbangda,xbd599", .data = &xbd599_desc },
> >  	{ /* sentinel */ }
> > -- 
> > 2.34.1
> > 
