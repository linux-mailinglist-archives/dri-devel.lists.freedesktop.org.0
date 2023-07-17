Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639977568CE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 18:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ADF10E00B;
	Mon, 17 Jul 2023 16:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ED710E00B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 16:15:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E482561151
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 16:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8DEC433CC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 16:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689610513;
 bh=cTIeRwKfe8SZCSsmgRHRfVv6mnuPDHEfbJo8TvnYUBI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XcZmHjhzp7kg2LVoH/dhylXfIhbTfsxEdXipAg4MmTlEO9MlzGfpFvjghlZHLaYTG
 YA31sUFgU4FQ0MLWhWlZTued+NzmoFJAnqpKIsrJNQhMkbxgk0bHtuQV8Zey8Idint
 T2XIMDg5RECPds/H6A676iioKTiAQfD2f+D5iKrgVQnEUy5l73UeMNbzLJLsgLWRJJ
 S121s/VQEIZeFL3JD0bEY469LM2xAVBBtgdYBcl+KJgGzBlxV5yboGP9odxdSrjVN7
 LhB4vgfyltqyv79ScCBv2Rru9xmVwun4QtUnbz/iROFXnwIT1bGq9nC3axHPu4aiLu
 IfLMpKcszU1Pw==
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-55b22f82ac8so3665262a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:15:13 -0700 (PDT)
X-Gm-Message-State: ABy/qLbc/9uX8raxr1qhw1FUPWg4AY3t3VjDnzQHo0QUl8aRdOhfImVG
 /0MqOOfXc180VES1JELqZvFXs2vH/CrzQc8QzZ4voQ==
X-Google-Smtp-Source: APBJJlEnwB88rDj3b6Rjo8lFAIYTmaKarIFpsR+RliV6ibSVqrL/c2TPjcHMkFSkpDDYYyBqU0SYNzrXQW/ad3xmag4=
X-Received: by 2002:a17:90a:43c6:b0:265:780e:5edc with SMTP id
 r64-20020a17090a43c600b00265780e5edcmr13787767pjg.10.1689610512437; Mon, 17
 Jul 2023 09:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230712065728.2378496-1-wenst@chromium.org>
In-Reply-To: <20230712065728.2378496-1-wenst@chromium.org>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 17 Jul 2023 18:15:01 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5ADVQnk0V51hz2P8D1NWWjzenihxyMtuofPqXjMUF-7g@mail.gmail.com>
Message-ID: <CAN6tsi5ADVQnk0V51hz2P8D1NWWjzenihxyMtuofPqXjMUF-7g@mail.gmail.com>
Subject: Re: [PATCH v12] drm/bridge: Remove redundant i2c_client in
 anx7625/it6505
To: Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 8:57=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> From: Pin-yen Lin <treapking@chromium.org>
>
> These two drivers embed a i2c_client in their private driver data, but
> only strict device is actually needed. Replace the i2c_client reference
> with a struct device one.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v11:
> - Rebase onto v6.5-rc1
> - Converted one more instance in anx7625_attach_dsi() introduced by
>   1464e48d69ab drm/bridge: anx7625: Prevent endless probe loop
>
> Splitting this patch out of its original type-C mux patch series [1] to
> get it merged. This is a cleanup that is not strictly related to the
> rest of the series, and that series is still undergoing dicussions about
> the design.
>
> [1] https://lore.kernel.org/r/20230331091145.737305-7-treapking@chromium.=
org
>
>  drivers/gpu/drm/bridge/analogix/anx7625.c |  98 ++++++++---------
>  drivers/gpu/drm/bridge/analogix/anx7625.h |   2 +-
>  drivers/gpu/drm/bridge/ite-it6505.c       | 128 +++++++++++-----------
>  3 files changed, 114 insertions(+), 114 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index e93eba89d5ee..51abe42c639e 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -206,7 +206,7 @@ static int anx7625_read_ctrl_status_p0(struct anx7625=
_data *ctx)
>
>  static int wait_aux_op_finish(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int val;
>         int ret;
>
> @@ -233,7 +233,7 @@ static int wait_aux_op_finish(struct anx7625_data *ct=
x)
>  static int anx7625_aux_trans(struct anx7625_data *ctx, u8 op, u32 addres=
s,
>                              u8 len, u8 *buf)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int ret;
>         u8 addrh, addrm, addrl;
>         u8 cmd;
> @@ -426,7 +426,7 @@ static int anx7625_odfc_config(struct anx7625_data *c=
tx,
>                                u8 post_divider)
>  {
>         int ret;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         /* Config input reference clock frequency 27MHz/19.2MHz */
>         ret =3D anx7625_write_and(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITA=
L_PLL_16,
> @@ -476,7 +476,7 @@ static int anx7625_set_k_value(struct anx7625_data *c=
tx)
>
>  static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         unsigned long m, n;
>         u16 htotal;
>         int ret;
> @@ -574,7 +574,7 @@ static int anx7625_dsi_video_timing_config(struct anx=
7625_data *ctx)
>  static int anx7625_swap_dsi_lane3(struct anx7625_data *ctx)
>  {
>         int val;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         /* Swap MIPI-DSI data lane 3 P and N */
>         val =3D anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, MIPI_SWAP);
> @@ -591,7 +591,7 @@ static int anx7625_api_dsi_config(struct anx7625_data=
 *ctx)
>
>  {
>         int val, ret;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         /* Swap MIPI-DSI data lane 3 P and N */
>         ret =3D anx7625_swap_dsi_lane3(ctx);
> @@ -656,7 +656,7 @@ static int anx7625_api_dsi_config(struct anx7625_data=
 *ctx)
>
>  static int anx7625_dsi_config(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int ret;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
> @@ -688,7 +688,7 @@ static int anx7625_dsi_config(struct anx7625_data *ct=
x)
>
>  static int anx7625_api_dpi_config(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         u16 freq =3D ctx->dt.pixelclock.min / 1000;
>         int ret;
>
> @@ -719,7 +719,7 @@ static int anx7625_api_dpi_config(struct anx7625_data=
 *ctx)
>
>  static int anx7625_dpi_config(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int ret;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
> @@ -764,7 +764,7 @@ static int anx7625_read_flash_status(struct anx7625_d=
ata *ctx)
>  static int anx7625_hdcp_key_probe(struct anx7625_data *ctx)
>  {
>         int ret, val;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         u8 ident[FLASH_BUF_LEN];
>
>         ret =3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> @@ -814,7 +814,7 @@ static int anx7625_hdcp_key_probe(struct anx7625_data=
 *ctx)
>  static int anx7625_hdcp_key_load(struct anx7625_data *ctx)
>  {
>         int ret;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         /* Select HDCP 1.4 KEY */
>         ret =3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> @@ -842,7 +842,7 @@ static int anx7625_hdcp_key_load(struct anx7625_data =
*ctx)
>  static int anx7625_hdcp_disable(struct anx7625_data *ctx)
>  {
>         int ret;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         dev_dbg(dev, "disable HDCP 1.4\n");
>
> @@ -863,7 +863,7 @@ static int anx7625_hdcp_enable(struct anx7625_data *c=
tx)
>  {
>         u8 bcap;
>         int ret;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         ret =3D anx7625_hdcp_key_probe(ctx);
>         if (ret) {
> @@ -921,7 +921,7 @@ static int anx7625_hdcp_enable(struct anx7625_data *c=
tx)
>  static void anx7625_dp_start(struct anx7625_data *ctx)
>  {
>         int ret;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         u8 data;
>
>         if (!ctx->display_timing_valid) {
> @@ -954,7 +954,7 @@ static void anx7625_dp_start(struct anx7625_data *ctx=
)
>
>  static void anx7625_dp_stop(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int ret;
>         u8 data;
>
> @@ -1019,7 +1019,7 @@ static int sp_tx_aux_rd(struct anx7625_data *ctx, u=
8 len_cmd)
>  static int sp_tx_get_edid_block(struct anx7625_data *ctx)
>  {
>         int c =3D 0;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         sp_tx_aux_wr(ctx, 0x7e);
>         sp_tx_aux_rd(ctx, 0x01);
> @@ -1041,7 +1041,7 @@ static int edid_read(struct anx7625_data *ctx,
>                      u8 offset, u8 *pblock_buf)
>  {
>         int ret, cnt;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         for (cnt =3D 0; cnt <=3D EDID_TRY_CNT; cnt++) {
>                 sp_tx_aux_wr(ctx, offset);
> @@ -1072,7 +1072,7 @@ static int segments_edid_read(struct anx7625_data *=
ctx,
>  {
>         u8 cnt;
>         int ret;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         /* Write address only */
>         ret =3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> @@ -1127,7 +1127,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx=
,
>         u8 i, j;
>         int g_edid_break =3D 0;
>         int ret;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         /* Address initial */
>         ret =3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> @@ -1234,7 +1234,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx=
,
>
>  static void anx7625_power_on(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int ret, i;
>
>         if (!ctx->pdata.low_power_mode) {
> @@ -1270,7 +1270,7 @@ static void anx7625_power_on(struct anx7625_data *c=
tx)
>
>  static void anx7625_power_standby(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int ret;
>
>         if (!ctx->pdata.low_power_mode) {
> @@ -1300,7 +1300,7 @@ static void anx7625_config(struct anx7625_data *ctx=
)
>
>  static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int ret;
>
>         /* Reset main ocm */
> @@ -1320,7 +1320,7 @@ static void anx7625_disable_pd_protocol(struct anx7=
625_data *ctx)
>  static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
>  {
>         int ret;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         /* Check interface workable */
>         ret =3D anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
> @@ -1366,7 +1366,7 @@ static void anx7625_power_on_init(struct anx7625_da=
ta *ctx)
>
>  static void anx7625_init_gpio(struct anx7625_data *platform)
>  {
> -       struct device *dev =3D &platform->client->dev;
> +       struct device *dev =3D platform->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "init gpio\n");
>
> @@ -1406,7 +1406,7 @@ static void anx7625_stop_dp_work(struct anx7625_dat=
a *ctx)
>  static void anx7625_start_dp_work(struct anx7625_data *ctx)
>  {
>         int ret;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         if (ctx->hpd_high_cnt >=3D 2) {
>                 DRM_DEV_DEBUG_DRIVER(dev, "filter useless HPD\n");
> @@ -1458,7 +1458,7 @@ static int _anx7625_hpd_polling(struct anx7625_data=
 *ctx,
>                                 unsigned long wait_us)
>  {
>         int ret, val;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         /* Interrupt mode, no need poll HPD status, just return */
>         if (ctx->pdata.intp_irq)
> @@ -1492,7 +1492,7 @@ static int anx7625_wait_hpd_asserted(struct drm_dp_=
aux *aux,
>                                      unsigned long wait_us)
>  {
>         struct anx7625_data *ctx =3D container_of(aux, struct anx7625_dat=
a, aux);
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int ret;
>
>         pm_runtime_get_sync(dev);
> @@ -1525,7 +1525,7 @@ static void anx7625_dp_adjust_swing(struct anx7625_=
data *ctx)
>
>  static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         /* HPD changed */
>         DRM_DEV_DEBUG_DRIVER(dev, "dp_hpd_change_default_func: %d\n",
> @@ -1545,7 +1545,7 @@ static void dp_hpd_change_handler(struct anx7625_da=
ta *ctx, bool on)
>  static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
>  {
>         int intr_vector, status;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         status =3D anx7625_reg_write(ctx, ctx->i2c.tcpc_client,
>                                    INTR_ALERT_1, 0xFF);
> @@ -1593,7 +1593,7 @@ static void anx7625_work_func(struct work_struct *w=
ork)
>
>         mutex_lock(&ctx->lock);
>
> -       if (pm_runtime_suspended(&ctx->client->dev)) {
> +       if (pm_runtime_suspended(ctx->dev)) {
>                 mutex_unlock(&ctx->lock);
>                 return;
>         }
> @@ -1737,7 +1737,7 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_a=
ux *aux,
>                                     struct drm_dp_aux_msg *msg)
>  {
>         struct anx7625_data *ctx =3D container_of(aux, struct anx7625_dat=
a, aux);
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         u8 request =3D msg->request & ~DP_AUX_I2C_MOT;
>         int ret =3D 0;
>
> @@ -1763,7 +1763,7 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_a=
ux *aux,
>
>  static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         struct s_edid_data *p_edid =3D &ctx->slimport_edid_p;
>         int edid_num;
>         u8 *edid;
> @@ -1799,7 +1799,7 @@ static struct edid *anx7625_get_edid(struct anx7625=
_data *ctx)
>
>  static enum drm_connector_status anx7625_sink_detect(struct anx7625_data=
 *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>
> @@ -2008,7 +2008,7 @@ static const struct hdmi_codec_ops anx7625_codec_op=
s =3D {
>
>  static void anx7625_unregister_audio(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         if (ctx->audio_pdev) {
>                 platform_device_unregister(ctx->audio_pdev);
> @@ -2044,7 +2044,7 @@ static int anx7625_register_audio(struct device *de=
v, struct anx7625_data *ctx)
>  static int anx7625_setup_dsi_device(struct anx7625_data *ctx)
>  {
>         struct mipi_dsi_device *dsi;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         struct mipi_dsi_host *host;
>         const struct mipi_dsi_device_info info =3D {
>                 .type =3D "anx7625",
> @@ -2078,7 +2078,7 @@ static int anx7625_setup_dsi_device(struct anx7625_=
data *ctx)
>
>  static int anx7625_attach_dsi(struct anx7625_data *ctx)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int ret;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "attach dsi\n");
> @@ -2104,7 +2104,7 @@ static void hdcp_check_work_func(struct work_struct=
 *work)
>
>         dwork =3D to_delayed_work(work);
>         ctx =3D container_of(dwork, struct anx7625_data, hdcp_work);
> -       dev =3D &ctx->client->dev;
> +       dev =3D ctx->dev;
>
>         if (!ctx->connector) {
>                 dev_err(dev, "HDCP connector is null!");
> @@ -2131,7 +2131,7 @@ static void hdcp_check_work_func(struct work_struct=
 *work)
>  static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
>                                           struct drm_connector_state *sta=
te)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         int cp;
>
>         dev_dbg(dev, "hdcp state check\n");
> @@ -2176,7 +2176,7 @@ static int anx7625_bridge_attach(struct drm_bridge =
*bridge,
>  {
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
>         int err;
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "drm attach\n");
>         if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> @@ -2220,7 +2220,7 @@ anx7625_bridge_mode_valid(struct drm_bridge *bridge=
,
>                           const struct drm_display_mode *mode)
>  {
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
>
> @@ -2241,7 +2241,7 @@ static void anx7625_bridge_mode_set(struct drm_brid=
ge *bridge,
>                                     const struct drm_display_mode *mode)
>  {
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "drm mode set\n");
>
> @@ -2287,7 +2287,7 @@ static bool anx7625_bridge_mode_fixup(struct drm_br=
idge *bridge,
>                                       struct drm_display_mode *adj)
>  {
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         u32 hsync, hfp, hbp, hblanking;
>         u32 adj_hsync, adj_hfp, adj_hbp, adj_hblanking, delta_adj;
>         u32 vref, adj_clock;
> @@ -2405,7 +2405,7 @@ static int anx7625_bridge_atomic_check(struct drm_b=
ridge *bridge,
>                                        struct drm_connector_state *conn_s=
tate)
>  {
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         dev_dbg(dev, "drm bridge atomic check\n");
>
> @@ -2419,7 +2419,7 @@ static void anx7625_bridge_atomic_enable(struct drm=
_bridge *bridge,
>                                          struct drm_bridge_state *state)
>  {
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>         struct drm_connector *connector;
>
>         dev_dbg(dev, "drm atomic enable\n");
> @@ -2446,7 +2446,7 @@ static void anx7625_bridge_atomic_disable(struct dr=
m_bridge *bridge,
>                                           struct drm_bridge_state *old)
>  {
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         dev_dbg(dev, "drm atomic disable\n");
>
> @@ -2460,7 +2460,7 @@ static enum drm_connector_status
>  anx7625_bridge_detect(struct drm_bridge *bridge)
>  {
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "drm bridge detect\n");
>
> @@ -2471,7 +2471,7 @@ static struct edid *anx7625_bridge_get_edid(struct =
drm_bridge *bridge,
>                                             struct drm_connector *connect=
or)
>  {
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "drm bridge get edid\n");
>
> @@ -2496,7 +2496,7 @@ static const struct drm_bridge_funcs anx7625_bridge=
_funcs =3D {
>  static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
>                                               struct i2c_client *client)
>  {
> -       struct device *dev =3D &ctx->client->dev;
> +       struct device *dev =3D ctx->dev;
>
>         ctx->i2c.tx_p0_client =3D devm_i2c_new_dummy_device(dev, client->=
adapter,
>                                                           TX_P0_ADDR >> 1=
);
> @@ -2631,7 +2631,7 @@ static int anx7625_i2c_probe(struct i2c_client *cli=
ent)
>
>         pdata =3D &platform->pdata;
>
> -       platform->client =3D client;
> +       platform->dev =3D &client->dev;
>         i2c_set_clientdata(client, platform);
>
>         pdata->supplies[0].supply =3D "vdd10";
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/=
bridge/analogix/anx7625.h
> index 14f33d6be289..5af819611ebc 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -458,7 +458,7 @@ struct anx7625_data {
>         int hdcp_cp;
>         /* Lock for work queue */
>         struct mutex lock;
> -       struct i2c_client *client;
> +       struct device *dev;
>         struct anx7625_i2c_client i2c;
>         struct i2c_client *last_client;
>         struct timer_list hdcp_timer;
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index 504d51c42f79..6c2fcd8b8780 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -404,7 +404,7 @@ struct debugfs_entries {
>  struct it6505 {
>         struct drm_dp_aux aux;
>         struct drm_bridge bridge;
> -       struct i2c_client *client;
> +       struct device *dev;
>         struct it6505_drm_dp_link link;
>         struct it6505_platform_data pdata;
>         /*
> @@ -524,7 +524,7 @@ static int it6505_read(struct it6505 *it6505, unsigne=
d int reg_addr)
>  {
>         unsigned int value;
>         int err;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         if (!it6505->powered)
>                 return -ENODEV;
> @@ -542,7 +542,7 @@ static int it6505_write(struct it6505 *it6505, unsign=
ed int reg_addr,
>                         unsigned int reg_val)
>  {
>         int err;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         if (!it6505->powered)
>                 return -ENODEV;
> @@ -562,7 +562,7 @@ static int it6505_set_bits(struct it6505 *it6505, uns=
igned int reg,
>                            unsigned int mask, unsigned int value)
>  {
>         int err;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         if (!it6505->powered)
>                 return -ENODEV;
> @@ -580,7 +580,7 @@ static int it6505_set_bits(struct it6505 *it6505, uns=
igned int reg,
>  static void it6505_debug_print(struct it6505 *it6505, unsigned int reg,
>                                const char *prefix)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int val;
>
>         if (!drm_debug_enabled(DRM_UT_DRIVER))
> @@ -599,7 +599,7 @@ static int it6505_dpcd_read(struct it6505 *it6505, un=
signed long offset)
>  {
>         u8 value;
>         int ret;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         ret =3D drm_dp_dpcd_readb(&it6505->aux, offset, &value);
>         if (ret < 0) {
> @@ -613,7 +613,7 @@ static int it6505_dpcd_write(struct it6505 *it6505, u=
nsigned long offset,
>                              u8 datain)
>  {
>         int ret;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         ret =3D drm_dp_dpcd_writeb(&it6505->aux, offset, datain);
>         if (ret < 0) {
> @@ -626,7 +626,7 @@ static int it6505_dpcd_write(struct it6505 *it6505, u=
nsigned long offset,
>  static int it6505_get_dpcd(struct it6505 *it6505, int offset, u8 *dpcd, =
int num)
>  {
>         int ret;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         ret =3D drm_dp_dpcd_read(&it6505->aux, offset, dpcd, num);
>
> @@ -643,7 +643,7 @@ static void it6505_dump(struct it6505 *it6505)
>  {
>         unsigned int i, j;
>         u8 regs[16];
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         for (i =3D 0; i <=3D 0xff; i +=3D 16) {
>                 for (j =3D 0; j < 16; j++)
> @@ -682,7 +682,7 @@ static int it6505_read_word(struct it6505 *it6505, un=
signed int reg)
>
>  static void it6505_calc_video_info(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int hsync_pol, vsync_pol, interlaced;
>         int htotal, hdes, hdew, hfph, hsyncw;
>         int vtotal, vdes, vdew, vfph, vsyncw;
> @@ -926,7 +926,7 @@ static int it6505_aux_wait(struct it6505 *it6505)
>  {
>         int status;
>         unsigned long timeout;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         timeout =3D jiffies + msecs_to_jiffies(AUX_WAIT_TIMEOUT_MS) + 1;
>
> @@ -1141,7 +1141,7 @@ static int it6505_get_edid_block(void *data, u8 *bu=
f, unsigned int block,
>                                  size_t len)
>  {
>         struct it6505 *it6505 =3D data;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         enum aux_cmd_reply reply;
>         int offset, ret, aux_retry =3D 100;
>
> @@ -1201,7 +1201,7 @@ static int it6505_send_video_infoframe(struct it650=
5 *it6505,
>  {
>         u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
>         int err;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         err =3D hdmi_avi_infoframe_pack(frame, buffer, sizeof(buffer));
>         if (err < 0) {
> @@ -1231,7 +1231,7 @@ static void it6505_get_extcon_property(struct it650=
5 *it6505)
>  {
>         int err;
>         union extcon_property_value property;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         if (it6505->extcon && !it6505->lane_swap_disabled) {
>                 err =3D extcon_get_property(it6505->extcon, EXTCON_DISP_D=
P,
> @@ -1382,7 +1382,7 @@ static void it6505_enable_audio_source(struct it650=
5 *it6505)
>
>  static void it6505_enable_audio_infoframe(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         u8 audio_info_ca[] =3D { 0x00, 0x00, 0x01, 0x03, 0x07, 0x0B, 0x0F=
, 0x1F };
>
>         DRM_DEV_DEBUG_DRIVER(dev, "infoframe channel_allocation:0x%02x",
> @@ -1411,7 +1411,7 @@ static void it6505_disable_audio(struct it6505 *it6=
505)
>
>  static void it6505_enable_audio(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int regbe;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "start");
> @@ -1446,7 +1446,7 @@ static bool it6505_use_step_train_check(struct it65=
05 *it6505)
>
>  static void it6505_parse_link_capabilities(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         struct it6505_drm_dp_link *link =3D &it6505->link;
>         int bcaps;
>
> @@ -1557,7 +1557,7 @@ static void it6505_lane_count_setup(struct it6505 *=
it6505)
>
>  static void it6505_link_training_setup(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         if (it6505->enable_enhanced_frame)
>                 it6505_set_bits(it6505, REG_DATA_MUTE_CTRL,
> @@ -1708,7 +1708,7 @@ it6505_step_cr_train(struct it6505 *it6505,
>                                         FORCE_CR_DONE);
>                         return true;
>                 }
> -               DRM_DEV_DEBUG_DRIVER(&it6505->client->dev, "cr not done")=
;
> +               DRM_DEV_DEBUG_DRIVER(it6505->dev, "cr not done");
>
>                 if (it6505_check_max_voltage_swing_reached(lane_level_con=
fig,
>                                                            it6505->lane_c=
ount))
> @@ -1785,7 +1785,7 @@ it6505_step_eq_train(struct it6505 *it6505,
>                                         FORCE_EQ_DONE);
>                         return true;
>                 }
> -               DRM_DEV_DEBUG_DRIVER(&it6505->client->dev, "eq not done")=
;
> +               DRM_DEV_DEBUG_DRIVER(it6505->dev, "eq not done");
>
>                 for (i =3D 0; i < it6505->lane_count; i++) {
>                         lane_voltage_pre_emphasis->voltage_swing[i] =3D
> @@ -1820,7 +1820,7 @@ static bool it6505_link_start_step_train(struct it6=
505 *it6505)
>                 .pre_emphasis =3D { 0 },
>         };
>
> -       DRM_DEV_DEBUG_DRIVER(&it6505->client->dev, "start");
> +       DRM_DEV_DEBUG_DRIVER(it6505->dev, "start");
>         err =3D it6505_drm_dp_link_configure(it6505);
>
>         if (err < 0)
> @@ -1854,7 +1854,7 @@ static void it6505_reset_hdcp(struct it6505 *it6505=
)
>
>  static void it6505_start_hdcp(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "start");
>         it6505_reset_hdcp(it6505);
> @@ -1882,7 +1882,7 @@ static bool it6505_hdcp_is_ksv_valid(u8 *ksv)
>
>  static void it6505_hdcp_part1_auth(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         u8 hdcp_bcaps;
>
>         it6505_set_bits(it6505, REG_RESET_CTRL, HDCP_RESET, 0x00);
> @@ -1923,7 +1923,7 @@ static int it6505_sha1_digest(struct it6505 *it6505=
, u8 *sha1_input,
>         struct shash_desc *desc;
>         struct crypto_shash *tfm;
>         int err;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         tfm =3D crypto_alloc_shash("sha1", 0, 0);
>         if (IS_ERR(tfm)) {
> @@ -1948,7 +1948,7 @@ static int it6505_sha1_digest(struct it6505 *it6505=
, u8 *sha1_input,
>
>  static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input=
)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         u8 binfo[2];
>         int down_stream_count, i, err, msg_count =3D 0;
>
> @@ -2012,7 +2012,7 @@ static int it6505_setup_sha1_input(struct it6505 *i=
t6505, u8 *sha1_input)
>
>  static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         u8 av[5][4], bv[5][4];
>         int i, err;
>
> @@ -2045,7 +2045,7 @@ static void it6505_hdcp_wait_ksv_list(struct work_s=
truct *work)
>  {
>         struct it6505 *it6505 =3D container_of(work, struct it6505,
>                                              hdcp_wait_ksv_list);
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         unsigned int timeout =3D 5000;
>         u8 bstatus =3D 0;
>         bool ksv_list_check;
> @@ -2087,7 +2087,7 @@ static void it6505_hdcp_work(struct work_struct *wo=
rk)
>  {
>         struct it6505 *it6505 =3D container_of(work, struct it6505,
>                                              hdcp_work.work);
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int ret;
>         u8 link_status[DP_LINK_STATUS_SIZE] =3D { 0 };
>
> @@ -2128,7 +2128,7 @@ static void it6505_hdcp_work(struct work_struct *wo=
rk)
>
>  static void it6505_show_hdcp_info(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int i;
>         u8 *sha1 =3D it6505->sha1_input;
>
> @@ -2162,7 +2162,7 @@ static void it6505_stop_link_train(struct it6505 *i=
t6505)
>
>  static void it6505_link_train_ok(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         it6505->link_state =3D LINK_OK;
>         /* disalbe mute enable avi info frame */
> @@ -2181,7 +2181,7 @@ static void it6505_link_train_ok(struct it6505 *it6=
505)
>
>  static void it6505_link_step_train_process(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int ret, i, step_retry =3D 3;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "Start step train");
> @@ -2219,7 +2219,7 @@ static void it6505_link_step_train_process(struct i=
t6505 *it6505)
>  static void it6505_link_training_work(struct work_struct *work)
>  {
>         struct it6505 *it6505 =3D container_of(work, struct it6505, link_=
works);
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int ret;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count: %d",
> @@ -2267,7 +2267,7 @@ static void it6505_remove_edid(struct it6505 *it650=
5)
>
>  static int it6505_process_hpd_irq(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int ret, dpcd_sink_count, dp_irq_vector, bstatus;
>         u8 link_status[DP_LINK_STATUS_SIZE];
>
> @@ -2331,7 +2331,7 @@ static int it6505_process_hpd_irq(struct it6505 *it=
6505)
>
>  static void it6505_irq_hpd(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int dp_sink_count;
>
>         it6505->hpd_state =3D it6505_get_sink_hpd_status(it6505);
> @@ -2393,7 +2393,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
>
>  static void it6505_irq_hpd_irq(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "hpd_irq interrupt");
>
> @@ -2403,7 +2403,7 @@ static void it6505_irq_hpd_irq(struct it6505 *it650=
5)
>
>  static void it6505_irq_scdt(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         bool data;
>
>         data =3D it6505_get_video_status(it6505);
> @@ -2418,7 +2418,7 @@ static void it6505_irq_scdt(struct it6505 *it6505)
>
>  static void it6505_irq_hdcp_done(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "hdcp done interrupt");
>         it6505->hdcp_status =3D HDCP_AUTH_DONE;
> @@ -2427,7 +2427,7 @@ static void it6505_irq_hdcp_done(struct it6505 *it6=
505)
>
>  static void it6505_irq_hdcp_fail(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "hdcp fail interrupt");
>         it6505->hdcp_status =3D HDCP_AUTH_IDLE;
> @@ -2437,14 +2437,14 @@ static void it6505_irq_hdcp_fail(struct it6505 *i=
t6505)
>
>  static void it6505_irq_aux_cmd_fail(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "AUX PC Request Fail Interrupt");
>  }
>
>  static void it6505_irq_hdcp_ksv_check(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "HDCP event Interrupt");
>         schedule_work(&it6505->hdcp_wait_ksv_list);
> @@ -2452,7 +2452,7 @@ static void it6505_irq_hdcp_ksv_check(struct it6505=
 *it6505)
>
>  static void it6505_irq_audio_fifo_error(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "audio fifo error Interrupt");
>
> @@ -2462,7 +2462,7 @@ static void it6505_irq_audio_fifo_error(struct it65=
05 *it6505)
>
>  static void it6505_irq_link_train_fail(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "link training fail interrupt");
>         schedule_work(&it6505->link_works);
> @@ -2470,7 +2470,7 @@ static void it6505_irq_link_train_fail(struct it650=
5 *it6505)
>
>  static void it6505_irq_video_fifo_error(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
>         it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> @@ -2481,7 +2481,7 @@ static void it6505_irq_video_fifo_error(struct it65=
05 *it6505)
>
>  static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
>         it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> @@ -2498,7 +2498,7 @@ static bool it6505_test_bit(unsigned int bit, const=
 unsigned int *addr)
>  static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>  {
>         struct it6505 *it6505 =3D data;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         static const struct {
>                 int bit;
>                 void (*handler)(struct it6505 *it6505);
> @@ -2550,7 +2550,7 @@ static irqreturn_t it6505_int_threaded_handler(int =
unused, void *data)
>
>  static int it6505_poweron(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         struct it6505_platform_data *pdata =3D &it6505->pdata;
>         int err;
>
> @@ -2599,7 +2599,7 @@ static int it6505_poweron(struct it6505 *it6505)
>
>  static int it6505_poweroff(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         struct it6505_platform_data *pdata =3D &it6505->pdata;
>         int err;
>
> @@ -2633,7 +2633,7 @@ static int it6505_poweroff(struct it6505 *it6505)
>
>  static enum drm_connector_status it6505_detect(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         enum drm_connector_status status =3D connector_status_disconnecte=
d;
>         int dp_sink_count;
>
> @@ -2694,7 +2694,7 @@ static int it6505_extcon_notifier(struct notifier_b=
lock *self,
>  static void it6505_extcon_work(struct work_struct *work)
>  {
>         struct it6505 *it6505 =3D container_of(work, struct it6505, extco=
n_wq);
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int state, ret;
>
>         if (it6505->enable_drv_hold)
> @@ -2739,11 +2739,11 @@ static void it6505_extcon_work(struct work_struct=
 *work)
>  static int it6505_use_notifier_module(struct it6505 *it6505)
>  {
>         int ret;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         it6505->event_nb.notifier_call =3D it6505_extcon_notifier;
>         INIT_WORK(&it6505->extcon_wq, it6505_extcon_work);
> -       ret =3D devm_extcon_register_notifier(&it6505->client->dev,
> +       ret =3D devm_extcon_register_notifier(it6505->dev,
>                                             it6505->extcon, EXTCON_DISP_D=
P,
>                                             &it6505->event_nb);
>         if (ret) {
> @@ -2759,7 +2759,7 @@ static int it6505_use_notifier_module(struct it6505=
 *it6505)
>  static void it6505_remove_notifier_module(struct it6505 *it6505)
>  {
>         if (it6505->extcon) {
> -               devm_extcon_unregister_notifier(&it6505->client->dev,
> +               devm_extcon_unregister_notifier(it6505->dev,
>                                                 it6505->extcon, EXTCON_DI=
SP_DP,
>                                                 &it6505->event_nb);
>
> @@ -2772,7 +2772,7 @@ static void __maybe_unused it6505_delayed_audio(str=
uct work_struct *work)
>         struct it6505 *it6505 =3D container_of(work, struct it6505,
>                                              delayed_audio.work);
>
> -       DRM_DEV_DEBUG_DRIVER(&it6505->client->dev, "start");
> +       DRM_DEV_DEBUG_DRIVER(it6505->dev, "start");
>
>         if (!it6505->powered)
>                 return;
> @@ -2785,7 +2785,7 @@ static int __maybe_unused it6505_audio_setup_hw_par=
ams(struct it6505 *it6505,
>                                                        struct hdmi_codec_=
params
>                                                        *params)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int i =3D 0;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "%s %d Hz, %d bit, %d channels\n", __fu=
nc__,
> @@ -2869,7 +2869,7 @@ static int it6505_bridge_attach(struct drm_bridge *=
bridge,
>                                 enum drm_bridge_attach_flags flags)
>  {
>         struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         int ret;
>
>         if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> @@ -2933,7 +2933,7 @@ static void it6505_bridge_atomic_enable(struct drm_=
bridge *bridge,
>                                         struct drm_bridge_state *old_stat=
e)
>  {
>         struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         struct drm_atomic_state *state =3D old_state->base.state;
>         struct hdmi_avi_infoframe frame;
>         struct drm_crtc_state *crtc_state;
> @@ -2989,7 +2989,7 @@ static void it6505_bridge_atomic_disable(struct drm=
_bridge *bridge,
>                                          struct drm_bridge_state *old_sta=
te)
>  {
>         struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "start");
>
> @@ -3004,7 +3004,7 @@ static void it6505_bridge_atomic_pre_enable(struct =
drm_bridge *bridge,
>                                             struct drm_bridge_state *old_=
state)
>  {
>         struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "start");
>
> @@ -3015,7 +3015,7 @@ static void it6505_bridge_atomic_post_disable(struc=
t drm_bridge *bridge,
>                                               struct drm_bridge_state *ol=
d_state)
>  {
>         struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "start");
>
> @@ -3034,7 +3034,7 @@ static struct edid *it6505_bridge_get_edid(struct d=
rm_bridge *bridge,
>                                            struct drm_connector *connecto=
r)
>  {
>         struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         if (!it6505->cached_edid) {
>                 it6505->cached_edid =3D drm_do_get_edid(connector, it6505=
_get_edid_block,
> @@ -3086,7 +3086,7 @@ static const struct dev_pm_ops it6505_bridge_pm_ops=
 =3D {
>  static int it6505_init_pdata(struct it6505 *it6505)
>  {
>         struct it6505_platform_data *pdata =3D &it6505->pdata;
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         /* 1.0V digital core power regulator  */
>         pdata->pwr18 =3D devm_regulator_get(dev, "pwr18");
> @@ -3128,7 +3128,7 @@ static int it6505_get_data_lanes_count(const struct=
 device_node *endpoint,
>
>  static void it6505_parse_dt(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>         struct device_node *np =3D dev->of_node, *ep =3D NULL;
>         int len;
>         u64 link_frequencies;
> @@ -3333,7 +3333,7 @@ static void debugfs_create_files(struct it6505 *it6=
505)
>
>  static void debugfs_init(struct it6505 *it6505)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       struct device *dev =3D it6505->dev;
>
>         it6505->debugfs =3D debugfs_create_dir(DEBUGFS_DIR_NAME, NULL);
>
> @@ -3375,7 +3375,7 @@ static int it6505_i2c_probe(struct i2c_client *clie=
nt)
>
>         it6505->bridge.of_node =3D client->dev.of_node;
>         it6505->connector_status =3D connector_status_disconnected;
> -       it6505->client =3D client;
> +       it6505->dev =3D &client->dev;
>         i2c_set_clientdata(client, it6505);
>
>         /* get extcon device from DTS */
> --
> 2.41.0.390.g38632f3daf-goog
>

Can I request another rebase on drm-misc-next? It is not applying
cleanly at the moment.


Rob.
