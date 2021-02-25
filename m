Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F391324931
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 04:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2A76EC0A;
	Thu, 25 Feb 2021 03:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2102.outbound.protection.outlook.com [40.107.220.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FF36EC0A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 03:08:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ion1Jbwaqm4BzgeuFu05uu1VslXE/0uk5OkQsjZbZfgKbQ+igh3UOVrvP/wrvIKSIQ6zd0jFNFL3fXDy5Hmp12dE2OmrKUVt105uluLF+1ev932eCYUNo6zHSHEL2YZ1fMaScke+0UUshzsJjttp0HCUPFp0xK1/v5TMD8awSO+IXcsD6AOZcCrKViLNOeV593q5lHaSo4taP+5re3HPADV0gAlEhyRVOgTy1YyA1kW31LznZgQlGsaHZy202GCKYBe5TAT+T5WFEU+aALGgqwqZy6zpxNX7C5iX2guuNWk9n2vHnt61ZBwA7+whPeRTEoUXpu6EeaHswqJmq4X4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELksIF1wVBOE0l6cDKIolZonccwot6himt/Brh7UMJo=;
 b=OqNMSk4Khwh4PRpbI3baq1yixQTuJ3MzjZHvk2YqU5QfTJCvYro1zNWgdEuTuK2lqT62yqTq16AqE7sAikEPDBu6xTEn0sE0VMYsgbH9M3RZ00w6c5CmjS/CE/iHucuFLpUCL0ge34yjxLj/8XWzHTR4qCfThfKOFCBo2Lc0HNqi19HohjgSBSf3kRGkecf9R4veNSuOb/cPGMWM6m23BF9PYLZGukNxTjWOBD45zL+4H6usZ4fuOgIOsOakgTQt5/MfCW7IiYhi2k2EDzn38NfaV+h00qqDsv7fiKY9FwmwBu9rpp3b8sbQmdEtuvPCGtNqwzekC6Hi5H6tNIhLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELksIF1wVBOE0l6cDKIolZonccwot6himt/Brh7UMJo=;
 b=PuaD6QWRim2ldnTVFsZWESJFDl5yI4PjJgBL/SoEP1VvuQSw1dTu1g1vfvZx7kL2R792PYHZ+7k0t0T9R8/bM7q0m8jV+Zf720QwRVv4WxXhxMqaO7clKaHGf3UNXm1Hvl+rgi/6ULXD0urAEi4gSLKZto8nKZ7LZrzS0Xb64bQ=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4277.namprd04.prod.outlook.com (2603:10b6:a03::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.33; Thu, 25 Feb 2021 03:08:34 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 03:08:34 +0000
Date: Thu, 25 Feb 2021 11:08:17 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v4 3/3] drm/bridge: anx7625: add MIPI DPI input feature
 support
Message-ID: <20210225030817.GA17083@zhaomy-pc>
References: <cover.1611802321.git.xji@analogixsemi.com>
 <49fc9c62026988d7adc2eb7e4d1f6a3bffe0b66c.1611802321.git.xji@analogixsemi.com>
 <CAJMQK-g40fJN_rk2GTe_7tP3cX3+Ud4XbX1Aom4fqM77yY1+mw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAJMQK-g40fJN_rk2GTe_7tP3cX3+Ud4XbX1Aom4fqM77yY1+mw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HKAPR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:203:d0::26) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HKAPR04CA0016.apcprd04.prod.outlook.com (2603:1096:203:d0::26) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 03:08:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: facc23cb-9186-4699-f62f-08d8d93aa2e0
X-MS-TrafficTypeDiagnostic: BYAPR04MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4277C008EFE49EBB0CA653A8C79E9@BYAPR04MB4277.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3djl8/Dc+2/cXNIjxgpfMCTKHrwOJCN5rA+azJK24wqqbF0I71Xj6NbUUaLhSUIgyOhcf026RfQ/WxGPSCGYRRJW58X4vfV0ULeDn02EzRrF/286AO+ur1MrQx2qABPexrp7R3vEyNqEgHYqUXOboSo/jc0Qq7h5MK+5ElaeOLE3pxlsT0Jt9SyMatKGyUROnvyPzLgqqlCxqovC46+5hoNbNApftSvGwCTBK1Wbr5WMhf9xRRJHpKTYI2rOzJgfFhCs5UwPv78NciFMzBxZe4DR/q1VsDLPShuAX/nf8eK8MIgj8mMIYrpkRestVwaii6e/pYRVlfhc6iL7i0ZckFGq5NXMTKWQiOaUv2zSrSlWtiT83e+VYSn2rjsPWybOcX/CfMyz8MZewvt9p4Fko/8oKpi2HD5uLXqFFRTbwnSNsEe9G//qp0sCpyX6T9BfXpSMuRpE0dNC+V3Iap415ubOc/U3eNTqtMHLuCXXAgxS+4ZA/vabfPHQC2CzTyZoNiDQFiIor8lR4+e5ozVK49Kqr7sy2EpiM6gAWGibTFc8a94bov6NbzjJ3GyelQplAfHkS3/H3RWYEcQ39VQlwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39840400004)(136003)(396003)(366004)(346002)(53546011)(6916009)(6496006)(26005)(86362001)(16526019)(8936002)(33656002)(55016002)(478600001)(52116002)(186003)(66476007)(83380400001)(33716001)(54906003)(8676002)(956004)(7416002)(9686003)(4326008)(6666004)(66946007)(5660300002)(316002)(30864003)(2906002)(66556008)(1076003)(16060500005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OKNAkgnushtzEvY3+eCsQ1YAVfndQI1dGcuWTiAeGLjLPZhQZEb8z+SNCTUs?=
 =?us-ascii?Q?BvALZqjrjhBPIKdxKB/lyRtZxXu1jw8GYv2BJRCWe82Krb6z9PstwBem/qbg?=
 =?us-ascii?Q?vZcuaN9pgBpU9g9hp1HdMSRvY/YmPZXKHJfTKr+5HxlAkS2e1opLZodYRTqf?=
 =?us-ascii?Q?T7iSJuIoIqb6QFzOBxZOVAfjOQHNwpykSKf5KVZGmw0HaE/Uei0Ps/w52tUs?=
 =?us-ascii?Q?b4i8aELFc+G8qTkKxms2EUBWY1VLUmKPbfgpR8amFL8dsJkxl3lIb1dxmVRV?=
 =?us-ascii?Q?2xHI62e7l0wHMmRTWonB/Qoh0wQj4KzNeqEJQSk84FpZHlRM5mNoqWs02eI8?=
 =?us-ascii?Q?dMzVI03uHe4FLMtxD7yr9OaD/1ZX5cQYr0Dqxrm3m7WaniWCNHcOJzwOk+J1?=
 =?us-ascii?Q?Vj1Z9dVIs9tp1L2B4hKETujts66d/ZFT68tzRxWqOnqm04NMQqdAxI6CCalr?=
 =?us-ascii?Q?kvawTMkVr+k79GOq2caDzaqzMthjvC4DKPoqI2qC/G3m+wk6OwU9Z8Vi241u?=
 =?us-ascii?Q?0jGhzTkRIgdOYHtLxzEMuV7rXLYCpqK/bCWmgi4DE15taWWqIhD7wEDRcMs9?=
 =?us-ascii?Q?frZmop3Es0NrSktY0Ay5UbHIifa7wcrtbgABu6NG93RFJCe20IcOQspvNN4y?=
 =?us-ascii?Q?z98Sx3fIOArX9QUzXAW37NzgMDF7jrHFqRE/IdBNAFk2SnPuar03QEyr0iMm?=
 =?us-ascii?Q?rvbB84lHUoDgsLkgxXyQSmeNMRr67HhXEIRbeC5Eg3QfNoFwYKjFa3KbbMo6?=
 =?us-ascii?Q?WGL1QjgGht+/Nms7yYsAU7pIbVQ4ed1HQsHk2M1Xct7/x104HEa4SfPXGeEB?=
 =?us-ascii?Q?8tpXWGdyfTdNMC2Ahuv32oyVdg36myNLLfPpfJTgD1lhaRDdwAYFfOR+ezKo?=
 =?us-ascii?Q?nBtKyEpWP0Ik3H/yPjfC6EeNJ68Ge8r39swhRGUGugNgttvlncgUbzuWw0Lk?=
 =?us-ascii?Q?7n2gwLDpc5uxrqw771QMFItCgqgKybwqhnupWnHSAcrvBA2h2AwM/eWZExfQ?=
 =?us-ascii?Q?rdHCdhqbf2QonSljc97HLYvfZO9haci2N9RBu9v62ovoQv35r6CdyLHuo1KX?=
 =?us-ascii?Q?DgTU6bDc3fiZH14egAfLBArfFAetocwv7zQOGdPclHBrGQQr2rmWh01DhyXI?=
 =?us-ascii?Q?FatX43Jv/qu99XgjiiLiqoe5NlGPjiFlcIm+Vw3uFA1W/956h7GT5YX/vAVS?=
 =?us-ascii?Q?PA6IN0Q+FRUiRJpXtpbjdPn3bGwkfIyMHipV8nWvYxdWF7twZYyB1styeHLa?=
 =?us-ascii?Q?cIyZEAjauUClzgxyBb5d4R6yftxV0CFfozF9nodOrsB2+yl66gjsbaMa5NIX?=
 =?us-ascii?Q?U/U1uB8BMU+m5Q2WkAqD5oDa?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facc23cb-9186-4699-f62f-08d8d93aa2e0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 03:08:34.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3m61hKLZaSelEcjyEIFX2G0dSXHfSQXMGGw5ywUnl64cyIMjXz5JRzf+6tYwSSGmDIwGOsvz/9CFTWu84vBdiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4277
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi, thanks for the comment, I'll change it in the next serial.

As video-interfaces.yaml not exist in drm-next, I'm waiting for 5.12-rc1 to
apply to drm-misc, then I'll upstream patch v5.

Thanks,
Xin

On Wed, Feb 24, 2021 at 05:55:39PM +0800, Hsin-Yi Wang wrote:
> On Thu, Jan 28, 2021 at 11:10 AM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > Add MIPI rx DPI input support
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 326 ++++++++++++++++++++++++------
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  20 +-
> >  2 files changed, 285 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 04536cc..628ae43 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -150,18 +150,18 @@ static int anx7625_write_and(struct anx7625_data *ctx,
> >         return anx7625_reg_write(ctx, client, offset, (val & (mask)));
> >  }
> >
> > -static int anx7625_write_and_or(struct anx7625_data *ctx,
> > -                               struct i2c_client *client,
> > -                               u8 offset, u8 and_mask, u8 or_mask)
> > +static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
> >  {
> > -       int val;
> > +       int i, ret;
> >
> > -       val = anx7625_reg_read(ctx, client, offset);
> > -       if (val < 0)
> > -               return val;
> > +       ret = anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > +                              AUDIO_CONTROL_REGISTER, 0x80);
> > +       for (i = 0; i < 13; i++)
> > +               ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > +                                        VIDEO_BIT_MATRIX_12 + i,
> > +                                        0x18 + i);
> >
> > -       return anx7625_reg_write(ctx, client,
> > -                                offset, (val & and_mask) | (or_mask));
> > +       return ret;
> >  }
> >
> >  static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
> > @@ -195,6 +195,60 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
> >         return 0;
> >  }
> >
> > +static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
> > +                                u8 addrh, u8 addrm, u8 addrl,
> > +                                u8 len, u8 *buf)
> > +{
> > +       struct device *dev = &ctx->client->dev;
> > +       int ret;
> > +       u8 cmd;
> > +
> > +       if (len > MAX_DPCD_BUFFER_SIZE) {
> > +               DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       cmd = ((len - 1) << 4) | 0x09;
> > +
> > +       /* Set command and length */
> > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                               AP_AUX_COMMAND, cmd);
> > +
> > +       /* Set aux access address */
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                                AP_AUX_ADDR_7_0, addrl);
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                                AP_AUX_ADDR_15_8, addrm);
> > +       ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +                                AP_AUX_ADDR_19_16, addrh);
> > +
> > +       /* Enable aux access */
> > +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +                               AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> > +
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
> > +               return -EIO;
> > +       }
> > +
> > +       usleep_range(2000, 2100);
> > +
> > +       ret = wait_aux_op_finish(ctx);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> > +                                    AP_AUX_BUFF_START, len, buf);
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "read dpcd register failed\n");
> > +               return -EIO;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int anx7625_video_mute_control(struct anx7625_data *ctx,
> >                                       u8 status)
> >  {
> > @@ -219,38 +273,6 @@ static int anx7625_video_mute_control(struct anx7625_data *ctx,
> >         return ret;
> >  }
> >
> > -static int anx7625_config_audio_input(struct anx7625_data *ctx)
> > -{
> > -       struct device *dev = &ctx->client->dev;
> > -       int ret;
> > -
> > -       /* Channel num */
> > -       ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > -                               AUDIO_CHANNEL_STATUS_6, I2S_CH_2 << 5);
> > -
> > -       /* FS */
> > -       ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > -                                   AUDIO_CHANNEL_STATUS_4,
> > -                                   0xf0, AUDIO_FS_48K);
> > -       /* Word length */
> > -       ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > -                                   AUDIO_CHANNEL_STATUS_5,
> > -                                   0xf0, AUDIO_W_LEN_24_24MAX);
> > -       /* I2S */
> > -       ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > -                               AUDIO_CHANNEL_STATUS_6, I2S_SLAVE_MODE);
> > -       ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
> > -                                AUDIO_CONTROL_REGISTER, ~TDM_TIMING_MODE);
> > -       /* Audio change flag */
> > -       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > -                               AP_AV_STATUS, AP_AUDIO_CHG);
> > -
> > -       if (ret < 0)
> > -               DRM_DEV_ERROR(dev, "fail to config audio.\n");
> > -
> > -       return ret;
> > -}
> > -
> >  /* Reduction of fraction a/b */
> >  static void anx7625_reduction_of_a_fraction(unsigned long *a, unsigned long *b)
> >  {
> > @@ -410,7 +432,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> >         ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> >                         MIPI_LANE_CTRL_0, 0xfc);
> >         ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > -                               MIPI_LANE_CTRL_0, 3);
> > +                               MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
> >
> >         /* Htotal */
> >         htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > @@ -595,6 +617,101 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
> >         return ret;
> >  }
> >
> > +static int anx7625_api_dpi_config(struct anx7625_data *ctx)
> > +{
> > +       struct device *dev = &ctx->client->dev;
> > +       u16 freq = ctx->dt.pixelclock.min / 1000;
> > +       int ret;
> > +
> > +       /* configure pixel clock */
> > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                               PIXEL_CLOCK_L, freq & 0xFF);
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                                PIXEL_CLOCK_H, (freq >> 8));
> > +
> > +       /* set DPI mode */
> > +       /* set to DPI PLL module sel */
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +                                MIPI_DIGITAL_PLL_9, 0x20);
> > +       /* power down MIPI */
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +                                MIPI_LANE_CTRL_10, 0x08);
> > +       /* enable DPI mode */
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +                                MIPI_DIGITAL_PLL_18, 0x1C);
> > +       /* set first edge */
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > +                                VIDEO_CONTROL_0, 0x06);
> > +       if (ret < 0)
> > +               DRM_DEV_ERROR(dev, "IO error : dpi phy set failed.\n");
> > +
> > +       return ret;
> > +}
> > +
> > +static int anx7625_dpi_config(struct anx7625_data *ctx)
> > +{
> > +       struct device *dev = &ctx->client->dev;
> > +       int ret;
> > +
> > +       DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
> > +
> > +       /* DSC disable */
> > +       ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +                               R_DSC_CTRL_0, ~DSC_EN);
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "IO error : disable dsc failed.\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = anx7625_config_bit_matrix(ctx);
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "config bit matrix failed.\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = anx7625_api_dpi_config(ctx);
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "mipi phy(dpi) setup failed.\n");
> > +               return ret;
> > +       }
> > +
> > +       /* set MIPI RX EN */
> > +       ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +                              AP_AV_STATUS, AP_MIPI_RX_EN);
> > +       /* clear mute flag */
> > +       ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +                                AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
> > +       if (ret < 0)
> > +               DRM_DEV_ERROR(dev, "IO error : enable mipi rx failed.\n");
> > +
> > +       return ret;
> > +}
> > +
> > +static int anx7625_hdcp_setting(struct anx7625_data *ctx)
> > +{
> > +       u8 bcap;
> > +       struct device *dev = &ctx->client->dev;
> > +
> > +       if (!ctx->pdata.hdcp_support || !ctx->hdcp_en) {
> > +               DRM_DEV_DEBUG_DRIVER(dev, "hdcp_support(%d), hdcp_en(%d)\n",
> > +                                    ctx->pdata.hdcp_support, ctx->hdcp_en);
> > +               DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP by config\n");
> > +               return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> > +                                        0xee, 0x9f);
> > +       }
> > +
> > +       anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
> > +       if (!(bcap & 0x01)) {
> > +               DRM_WARN("downstream not support HDCP 1.4, cap(%x).\n", bcap);
> > +               return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> > +                                        0xee, 0x9f);
> > +       }
> > +
> > +       DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
> > +
> > +       return anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
> > +}
> > +
> >  static void anx7625_dp_start(struct anx7625_data *ctx)
> >  {
> >         int ret;
> > @@ -605,9 +722,13 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> >                 return;
> >         }
> >
> > -       anx7625_config_audio_input(ctx);
> > +       /* HDCP config */
> > +       anx7625_hdcp_setting(ctx);
> >
> > -       ret = anx7625_dsi_config(ctx);
> > +       if (ctx->pdata.is_dpi)
> > +               ret = anx7625_dpi_config(ctx);
> > +       else
> > +               ret = anx7625_dsi_config(ctx);
> >
> >         if (ret < 0)
> >                 DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> > @@ -688,8 +809,7 @@ static int sp_tx_get_edid_block(struct anx7625_data *ctx)
> >         return c;
> >  }
> >
> > -static int edid_read(struct anx7625_data *ctx,
> > -                    u8 offset, u8 *pblock_buf)
> > +static int edid_read(struct anx7625_data *ctx, u8 offset, u8 *pblock_buf)
> >  {
> >         int ret, cnt;
> >         struct device *dev = &ctx->client->dev;
> > @@ -992,8 +1112,9 @@ static void anx7625_chip_control(struct anx7625_data *ctx, int state)
> >
> >         if (state) {
> >                 atomic_inc(&ctx->power_status);
> > -               if (atomic_read(&ctx->power_status) == 1)
> > +               if (atomic_read(&ctx->power_status) == 1) {
> >                         anx7625_power_on_init(ctx);
> > +               }
> >         } else {
> >                 if (atomic_read(&ctx->power_status)) {
> >                         atomic_dec(&ctx->power_status);
> > @@ -1051,6 +1172,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> >                 return;
> >         }
> >
> > +       ctx->hpd_status = 1;
> >         ctx->hpd_high_cnt++;
> >
> >         /* Not support HDCP */
> > @@ -1060,8 +1182,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> >         ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> >         /* Interrupt for DRM */
> >         ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > -       if (ret < 0)
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "fail to setting HDCP/auth\n");
> >                 return;
> > +       }
> >
> >         ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
> >         if (ret < 0)
> > @@ -1080,6 +1204,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
> >         int ret, val;
> >         struct device *dev = &ctx->client->dev;
> >
> > +       /* Interrupt mode, no need poll HPD status, just return */
> > +       if (ctx->pdata.intp_irq)
> > +               return;
> > +
> >         if (atomic_read(&ctx->power_status) != 1) {
> >                 DRM_DEV_DEBUG_DRIVER(dev, "No need to poling HPD status.\n");
> >                 return;
> > @@ -1130,6 +1258,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
> >         ctx->slimport_edid_p.edid_block_num = -1;
> >  }
> >
> > +static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < ctx->pdata.dp_lane0_swing_reg_cnt; i++)
> > +               anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > +                                 DP_TX_LANE0_SWING_REG0 + i,
> > +                                 ctx->pdata.lane0_reg_data[i] & 0xFF);
> > +
> > +       for (i = 0; i < ctx->pdata.dp_lane1_swing_reg_cnt; i++)
> > +               anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > +                                 DP_TX_LANE1_SWING_REG0 + i,
> > +                                 ctx->pdata.lane1_reg_data[i] & 0xFF);
> > +}
> > +
> >  static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> >  {
> >         struct device *dev = &ctx->client->dev;
> > @@ -1145,9 +1288,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> >         } else {
> >                 DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
> >                 anx7625_start_dp_work(ctx);
> > +               anx7625_dp_adjust_swing(ctx);
>                      ctx->hpd_status = 1;        is missing here
Already move it to anx7625_start_dp_work function.
> 
> >         }
> > -
> > -       ctx->hpd_status = 1;
> >  }
> >
> >  static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> > @@ -1224,20 +1366,69 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
> >         return IRQ_HANDLED;
> >  }
> >
> > +static int anx7625_get_swing_setting(struct device *dev,
> > +                                    struct anx7625_platform_data *pdata)
> > +{
> > +       int num_regs;
> > +
> > +       if (of_get_property(dev->of_node,
> > +                           "analogix,lane0-swing", &num_regs)) {
> > +               if (num_regs > DP_TX_SWING_REG_CNT)
> > +                       num_regs = DP_TX_SWING_REG_CNT;
> > +
> > +               pdata->dp_lane0_swing_reg_cnt = num_regs;
> > +               of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
> > +                                          pdata->lane0_reg_data, num_regs);
> > +       }
> > +
> > +       if (of_get_property(dev->of_node,
> > +                           "analogix,lane1-swing", &num_regs)) {
> > +               if (num_regs > DP_TX_SWING_REG_CNT)
> > +                       num_regs = DP_TX_SWING_REG_CNT;
> > +
> > +               pdata->dp_lane1_swing_reg_cnt = num_regs;
> > +               of_property_read_u32_array(dev->of_node, "analogix,lane1-swing",
> > +                                          pdata->lane1_reg_data, num_regs);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int anx7625_parse_dt(struct device *dev,
> >                             struct anx7625_platform_data *pdata)
> >  {
> >         struct device_node *np = dev->of_node;
> >         struct drm_panel *panel;
> >         int ret;
> > +       int bus_type;
> > +
> > +       anx7625_get_swing_setting(dev, pdata);
> >
> > +       pdata->is_dpi = 1; /* default dpi mode */
> >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> >         if (!pdata->mipi_host_node) {
> >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> >                 return -ENODEV;
> >         }
> >
> > -       DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > +       if (of_property_read_u32(pdata->mipi_host_node, "bus-type", &bus_type))
> 
> According to previous patch, bus-type is added in endpoint node
> instead of remote node (dsi), so this part should be:
> 
> struct device_node *np = dev->of_node, *ep0;
> 
> ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> of_property_read_u32(ep0, "bus-type", &bus_type);
> 
> I modified it based on this patch:
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index f682b530dbfb6..343cc0bf785f6 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1541,10 +1542,10 @@ static void
> anx7625_unregister_usb_two_ports(struct anx7625_data *ctx) {
>  static int anx7625_parse_dt(struct device *dev,
>                             struct anx7625_platform_data *pdata)
>  {
> -       struct device_node *np = dev->of_node;
> +       struct device_node *np = dev->of_node, *ep0;
>         struct drm_panel *panel;
>         int ret;
> -       int bus_type;
> +       int bus_type = 0;
> 
>         anx7625_get_swing_setting(dev, pdata);
> 
> @@ -1555,8 +1556,9 @@ static int anx7625_parse_dt(struct device *dev,
>                 return -ENODEV;
>         }
> 
> -       if (of_property_read_u32(pdata->mipi_host_node, "bus-type", &bus_type))
> -               bus_type = 0;
> +       ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> +       if (ep0)
> +               ret = of_property_read_u32(ep0, "bus-type", &bus_type);
> 
> 
>         if (bus_type == 5) /* bus type is Parallel(DSI) */
OK, I'll merge it into next serial, thanks!
> 
> 
> > +               bus_type = 0;
> > +
> > +       if (bus_type == 5) /* bus type is Parallel(DSI) */
> > +               pdata->is_dpi = 0;
> > +
> > +       pdata->mipi_lanes = of_property_count_u32_elems(pdata->mipi_host_node,
> > +                                                       "data-lanes");
> > +       if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > +               pdata->mipi_lanes = MAX_LANES_SUPPORT;
> > +
> > +       if (pdata->is_dpi)
> > +               DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
> > +       else
> > +               DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
> > +
> > +       if (of_property_read_bool(np, "analogix,hdcp-support"))
> > +               pdata->hdcp_support = 1;
> >
> >         ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
> >         if (ret < 0) {
> > @@ -1300,9 +1491,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> >  {
> >         struct device *dev = &ctx->client->dev;
> >
> > -       DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
> > +       DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> > +
> > +       if (ctx->pdata.panel_bridge)
> > +               return connector_status_connected;
> >
> > -       return connector_status_connected;
> > +       return ctx->hpd_status ? connector_status_connected :
> > +                                    connector_status_disconnected;
> >  }
> >
> >  static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > @@ -1330,7 +1525,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
> >                 return -EINVAL;
> >         }
> >
> > -       dsi->lanes = 4;
> > +       dsi->lanes = ctx->pdata.mipi_lanes;
> >         dsi->format = MIPI_DSI_FMT_RGB888;
> >         dsi->mode_flags = MIPI_DSI_MODE_VIDEO   |
> >                 MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> > @@ -1376,10 +1571,12 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
> >                 return -ENODEV;
> >         }
> >
> > -       err = anx7625_attach_dsi(ctx);
> > -       if (err) {
> > -               DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
> > -               return err;
> > +       if (!ctx->pdata.is_dpi) {
> > +               err = anx7625_attach_dsi(ctx);
> > +               if (err) {
> > +                       DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
> > +                       return err;
> > +               }
> >         }
> >
> >         if (ctx->pdata.panel_bridge) {
> > @@ -1478,6 +1675,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> >
> >         DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
> >
> > +       /* No need fixup for external monitor */
> > +       if (!ctx->pdata.panel_bridge)
> > +               return true;
> > +
> >         hsync = mode->hsync_end - mode->hsync_start;
> >         hfp = mode->hsync_start - mode->hdisplay;
> >         hbp = mode->htotal - mode->hsync_end;
> > @@ -1786,8 +1987,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >
> >         platform->bridge.funcs = &anx7625_bridge_funcs;
> >         platform->bridge.of_node = client->dev.of_node;
> > -       platform->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> > -       platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > +       platform->bridge.ops = DRM_BRIDGE_OP_EDID;
> > +       if (!platform->pdata.panel_bridge)
> > +               platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> > +                                       DRM_BRIDGE_OP_DETECT;
> > +       platform->bridge.type = platform->pdata.panel_bridge ?
> > +                                   DRM_MODE_CONNECTOR_eDP :
> > +                                   DRM_MODE_CONNECTOR_DisplayPort;
> >         drm_bridge_add(&platform->bridge);
> >
> >         DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > index 193ad86..127081e 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -141,12 +141,20 @@
> >  #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
> >
> >  /******** END of I2C Address 0x72 *********/
> > +
> > +/***************************************************************/
> > +/* Register definition of device address 0x7a */
> > +#define DP_TX_SWING_REG_CNT            0x14
> > +#define DP_TX_LANE0_SWING_REG0         0x00
> > +#define DP_TX_LANE1_SWING_REG0         0x14
> > +/******** END of I2C Address 0x7a *********/
> > +
> >  /***************************************************************/
> >  /* Register definition of device address 0x7e */
> >
> >  #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
> >
> > -#define FLASH_LOAD_STA 0x05
> > +#define FLASH_LOAD_STA          0x05
> >  #define FLASH_LOAD_STA_CHK     BIT(7)
> >
> >  #define  XTAL_FRQ_SEL    0x3F
> > @@ -347,11 +355,20 @@ struct s_edid_data {
> >
> >  /***************** Display End *****************/
> >
> > +#define MAX_LANES_SUPPORT      4
> > +
> >  struct anx7625_platform_data {
> >         struct gpio_desc *gpio_p_on;
> >         struct gpio_desc *gpio_reset;
> >         struct drm_bridge *panel_bridge;
> >         int intp_irq;
> > +       int is_dpi;
> > +       int mipi_lanes;
> > +       int hdcp_support;
> > +       int dp_lane0_swing_reg_cnt;
> > +       int lane0_reg_data[DP_TX_SWING_REG_CNT];
> > +       int dp_lane1_swing_reg_cnt;
> > +       int lane1_reg_data[DP_TX_SWING_REG_CNT];
> >         u32 low_power_mode;
> >         struct device_node *mipi_host_node;
> >  };
> > @@ -371,6 +388,7 @@ struct anx7625_data {
> >         atomic_t power_status;
> >         int hpd_status;
> >         int hpd_high_cnt;
> > +       int hdcp_en;
> >         /* Lock for work queue */
> >         struct mutex lock;
> >         struct i2c_client *client;
> > --
> > 2.7.4
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
