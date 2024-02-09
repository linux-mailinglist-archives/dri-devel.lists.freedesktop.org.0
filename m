Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D0E84FEF8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 22:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CED610F1E9;
	Fri,  9 Feb 2024 21:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="sdrX9jgK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazolkn19011002.outbound.protection.outlook.com
 [52.103.14.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8196D10F06F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 21:35:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=my9kXwtO1n554SEmX5TEmB5yqgk7/fMVfahzdtfNY1FculgCHN6nMAvBX2uYp1tYU2e94IpAHMrpVTv9lbK9k1cYkmJ+gd3oDTKnBlJe12ZtWWfhd/Jsz/UgW1/dPl9f77M2B/6RJclLvKjaiyk3Wr6cYjJsyIfrWGIzqlnYfhwb9SQwIavG2geemztZOBaegwvrdTCiUOsiiiLhj0KPg20LuG+kGCJtE9/85INAjW7FBWoywMcIOJJhCMAlFXO1Zp0przU2ID7+Yx0zy6HRGwrfdf2MPlFnq/dSfSYlmKF5EpVz2bP/M1tt1bXD9TU4xpL5nvXeAb2HwaYSvs+N3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEOGCecCY8n/RqacamwVLLJ17JC9pMmWaFFTqwLoXc8=;
 b=OjbiNyHS/sQTz7Cs25VWJfz0HhTKuvhvC80ss4k1YBChoXuBiT/CWtt9CFyB8C/G88AJTIZpGRHsa5i6mhWEpJo/sxNlq+sn8kjQcJq+qd7AzIConPBfgGYrAAjanPYMGvubqQwIHjCNekTY1PEgeJMpOJbvGVymLM1jnW8rOOx8W24ZCIt/EnhJO8ADLWJm/8nS4enkeSf4PDtivkncQQwIxgMfXw3sIzhqXj0K3/x4hNr/O7Fsovl00VZjvRC5j/6Z1QT+BKbeBq8Mg3xH8FRes7JnU9ueO63CA7j3dB8ekiGpTYniUhqOsvh8NBVu6EVsogSOHuyu9vqAvEG2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEOGCecCY8n/RqacamwVLLJ17JC9pMmWaFFTqwLoXc8=;
 b=sdrX9jgK0/yfZYu6HEre9NshMLrLq3Ia3JbNUUR3h2zf0gwB7se1uhhGofirRgRiZIhRIF10CsMbP/b0PbY5pqwGDdzfzg3nP0BgMJ96eOLAgUdulQa2XJV+Mx2c8SdtG44zUolPUx5gOPAQRcRDXrsWBMkC6qnmMkQXzqWluN+xxYIOMMCiwAShb8nR+o/kinbaaSAk52yYWtnyxH5IlG+AyPufSkjDvGqFOYTo0fGOzvrs2xO8fWH8keA9uPAH1IEv8F6oqpoVMOXBbOkp85D620vcsBD8wWgI+gWSGmeRmAiOYux/Lpk0hcrPiJ8avxitdQsnv/oA2K+MzHBrcQ==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 PH0PR05MB8090.namprd05.prod.outlook.com (2603:10b6:510:99::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7270.27; Fri, 9 Feb 2024 21:34:58 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::7592:72b0:48c8:ec43]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::7592:72b0:48c8:ec43%5]) with mapi id 15.20.7249.032; Fri, 9 Feb 2024
 21:34:58 +0000
Date: Fri, 9 Feb 2024 15:34:54 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Ao Zhong <hacc1225@gmail.com>, Purism Kernel Team <kernel@puri.sm>,
 Ondrej Jirman <megi@xff.cz>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RESEND 1/1] drm/panel: st7703: Fix Panel Initialization
 for Anbernic RG353V-V2
Message-ID: <DM4PR05MB92294706259FB96A7A899C30A54B2@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240128021048.6059-1-hacc1225@gmail.com>
 <20240128021048.6059-2-hacc1225@gmail.com>
 <ZcX5ljSCc7nyr_NE@qwark.sigxcpu.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcX5ljSCc7nyr_NE@qwark.sigxcpu.org>
X-TMN: [d2MwCuQ2vsBTMq6ayykX/J+T5zFjkcKK]
X-ClientProxiedBy: SN6PR2101CA0020.namprd21.prod.outlook.com
 (2603:10b6:805:106::30) To DM4PR05MB9229.namprd05.prod.outlook.com
 (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <ZcaafjRSl93YQKBE@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|PH0PR05MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: fb93492a-a947-403a-6954-08dc29b6f686
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GMJhy1TalsuOgui4jhmIAoSMk9sTtuXhQ7kjtMt/pEMFqoSIN71JJmsLcNrY/moLu8jxCGNwBxG1kKiO/ELN97TSN1VyZXShEfKj1l0jlS4lBLFelPX5EJc3GBdZcMwnMqaMVHSYq5OYkEkCVOkxP+n8viTA/wnQzKpjH7b96f5MDihIpUs1vmkWa8sPBz1ywcH3bdYHPfQt8RPYeHgA0oLRqkpEFnz3G5x1ttIVs2UgCXh2H/LVJtXeZ++Sc9hkV0L+n6zsku2LnAzLVMwtQWhNJrDBILqmT3XuMwkg+Us84ZoA51bcbD9rJ3sDcVBEM7K7yD2s6CDlOqPXbTEiMaudRBA61gM2YnrlBKqlJjQ1H9ZcxYED9OiS4QfE4bT49V9GuIf4/Cwazhbetg2EGtX8Vtcfkoa1jmzmCPw2pWDclYASDj+9+MEZbX3HzOb3O0ER4p6v8XcNeEHTsq8rbk56TgvJ0AyzspPGgGwkIu7xLoPJjZjJp34L8/FgKLV+bSBp0yNvw9QLVboFo0w5LsuFLpS9NohfEgh/PWC9EQWn3T3QcX09ypA3/8zCAWFt
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tzh7ZW445Hojc3lycGHAwDkY6UQAVIneiZ4ztrB6SqN9qvG28sgL6NGdF5?=
 =?iso-8859-1?Q?kkIPPzh16LxBcn+Mld0IXHOTxoPe0gnfIFQIUoJV3xx2EnQkAkTsPagrf0?=
 =?iso-8859-1?Q?Qx7s2zkLLLBKWFWK9ZXpx+zXp6G0ZSOrSTEuFRpqr24jbULG/6nco+N0xu?=
 =?iso-8859-1?Q?07M2aHLSw6b9ldat+Z2nXQanwt+pnUlWhuor3xeSqyIdlLxX3GCxI2ibNo?=
 =?iso-8859-1?Q?KP2jgaWVScn3e1SwY56TpY1qUtzw5hrmaXbnLjGG9R/A44bR9cKoYmKUAh?=
 =?iso-8859-1?Q?m2aizKNyLeyACjfsox+exuiFtnpmaKrWAtjMNZsPgL1DKEAvspR/30KZ8A?=
 =?iso-8859-1?Q?ng7+H3OwiGpiCWCTJGUPzXWqTAq/b3q79R/cCkNbqttdmrqhRD7yzdK2v8?=
 =?iso-8859-1?Q?7DqOKPx3hg9eTixjZ2Xhj1c1finUxn/PoyQoXdvToonC3rYSapkoXNtUZz?=
 =?iso-8859-1?Q?f9VHINFuv7nsLigEI/aeskBrrz5QFThklvCieEjurzPeBtibTe2dU7tLYy?=
 =?iso-8859-1?Q?1kYTbsSovWz4EO9sem7/YbLdE3n9R0tOUUMx15sk50iiSyotiaxWK84a+f?=
 =?iso-8859-1?Q?d1fJ8tXu9vOhfGBpsihSU8bLUQZ2OiYhPfzs2VHkt5+QxPDt6iCPtBorDc?=
 =?iso-8859-1?Q?/iuUNgZjClpsZmcrPPq95mDcXMCx2uxSKbw6B9Gx9hW4UZ+RcAObKd5rpl?=
 =?iso-8859-1?Q?pHpzTwtOzPXiGZH4bXM8wsEoiaxlIW3z+jP8vRQ+Mv+gNsn96ILxdWoCM+?=
 =?iso-8859-1?Q?h0o+uzWH2Z62INd7BwmFZkqyjsXMlLkZn03pDtQBlp5tSszfpvUU993HEQ?=
 =?iso-8859-1?Q?cjAPgu6OLHZ6x/ilzf0HBlehhJSNHi7ihJre6IJktfwEwLqOmKb6JYwKSO?=
 =?iso-8859-1?Q?Mi+Ne1p/ChppESO0cErorXfKZSKDXd3PZ4aJCf6jtbG/Z86jQU+0ZI0Fge?=
 =?iso-8859-1?Q?DEK9zN1T6gW2B4TaqLTfTQiXqBJGdwED2a0KWDfkLWNUiiI9r/w2tQp76M?=
 =?iso-8859-1?Q?ZPHXBaJk2mMfxsObjo4ZOr8ZgPlGB2GeCicLwXUSSOxkwOeonRx3Xl5iZz?=
 =?iso-8859-1?Q?aJs93VxfwWcL8+qk1z5ta+QphDGXdyE5o9hcHH9SN1l1Xdz1qcjp+sQDXc?=
 =?iso-8859-1?Q?Z2iaBfxt2EJr9dyBQtnhFJKg/Iye6xB5l+bPMX/uFHRxcMHDGt7+rvuZpF?=
 =?iso-8859-1?Q?mUL4kzmCOLdClkdUW4seDVUSdhaXpgOq8P803tCv1DBHfwsVtIY/qMAB53?=
 =?iso-8859-1?Q?0w37HY9eirfTHA37HkYEQ4ZJByulzn4qj5NWo3H+o=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fb93492a-a947-403a-6954-08dc29b6f686
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 21:34:57.9644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8090
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

On Fri, Feb 09, 2024 at 11:08:22AM +0100, Guido Günther wrote:
> Hi Ao,
> 
> this doesn't say why that was changed but your cover letter
> has that information:
> 
> > After correcting these parameters by referencing the
> > device tree in JELOS (which uses the BSP kernel for RK3566), the panel
> > started to work properly.
> 
> Can you add that to the commit message and maybe add an URL as
> reference please?
> 
> I've added Chris to the cc: list. He submitted the original rg353v2
> and we don't want to break other devices. Chris, do you have any means
> to check these values?

I checked. I'm not sure exactly how but when I fired up the most recent
kernel this panel appeared to have problems with the init sequence as
defined. After making the changes from this patch series it seems to be
back to normal. So these changes appear to be needed for existing
devices, and I'm not sure what could have caused the regression...

Note the previous settings did still appear to work, the panel just
took much longer to start working after the init sequence (as much
as 20 seconds on cold boot, clearly indicating a problem).

Thank you for the fix!

Tested-by: Chris Morgan <macromorgan@hotmail.com>

> 
> Cheers,
>  -- Guido
> 
> On Sun, Jan 28, 2024 at 03:10:48AM +0100, Ao Zhong wrote:
> > This patch resolves the issue with the panel initialization of the
> > Anbernic RG353V-V2 caused by incorrect parameters.
> > 
> > Signed-off-by: Ao Zhong <hacc1225@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > index b55bafd1a8be..a346d6c3d283 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > @@ -357,8 +357,8 @@ static int rg353v2_init_sequence(struct st7703 *ctx)
> >  			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
> >  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
> >  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
> > -	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
> > -	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x7f, 0x7f);
> > +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x26, 0x62,
> >  			       0xf0, 0x63);
> >  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
> >  			       0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00,
> > -- 
> > 2.43.0
> > 
