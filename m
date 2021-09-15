Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C740BC9B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 02:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6646E871;
	Wed, 15 Sep 2021 00:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554276E871
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 00:28:02 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id k65so1900050yba.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 17:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JiLT+49OKrK2C2/qa866n5hX+0DduxXnlJxyWKK5B8c=;
 b=ZemiIMxs7I+MBWj3oAODJfDEASZEtijU+vLTbCgj4STix0kDXIQc3FAAtjvAWVKkZJ
 e6EBrU2fWi8lHgJUUY8ncVmxpBnKrOjhXJa75Tf/50RKHpMLuEuIwg4Vx62RjPWsKgpU
 GHQk8QQ+wqU4DqDFFeuSpDwSk4nIOeLiYvPBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JiLT+49OKrK2C2/qa866n5hX+0DduxXnlJxyWKK5B8c=;
 b=t641Xay4XvZlSZi7PrFJAv57+JZjhc8rMim+AzIW9wpa+f6mQ47RGJQ/KzIsN27p42
 kYYfFfBR6I9Rmi3mZZpnOmyKdF5nsb7HJi/JJsgSAkzVbe5RH/LMtCxWZ2hiSE9y7R/p
 iBpoz8beNdroZyc5FT2C3b8CbDrdQwBfTVjYu3Owq+I1SXBr5hZ8dtS15dNryjKW1Lsu
 PaHvOb4a4kqLzgloEQmWquRJlWQ3dI6/c89hQFAX6PtmTueG7VEUBe6WNsdCR33fl0Ru
 A8Cz10u8IuUAPHLL74drg1b+sepfzFvCHmr35hWxcP/+E0Tm5shvl/vxgyav0iouvafb
 23/g==
X-Gm-Message-State: AOAM532dyzbxCrLdrL5Vl43xWDKV6ub0Hcfa8GNQzJVDN3gPmpBQEhn3
 SnlHbE9ImNfSqWV9FtDawO1FQGMeOhqXwEXNYmJv4A==
X-Google-Smtp-Source: ABdhPJwX9xudv+VtXzVaFJL66VcMDpoaaMxUO4tka1CfwOJZojhoegjEbRtz+5d07d09q4meg5Bc963jx7GFoIoZ3Jo=
X-Received: by 2002:a25:6d08:: with SMTP id i8mr2432075ybc.100.1631665681370; 
 Tue, 14 Sep 2021 17:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210913143255.RFC.v2.1.I8ad7a535bb18a1f41f3858f83379beedb397a9db@changeid>
 <20210913143255.RFC.v2.2.I2f55fee564b0008908d8a25a8825117119c80c4a@changeid>
 <CAD=FV=UGicZhuZHmc8asQU6kGgGGg+nZDqKPJ5QOc5tH3eBf9Q@mail.gmail.com>
In-Reply-To: <CAD=FV=UGicZhuZHmc8asQU6kGgGGg+nZDqKPJ5QOc5tH3eBf9Q@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Tue, 14 Sep 2021 17:27:50 -0700
Message-ID: <CA+cxXhnqOjRah_K5OoTE1SN8u5WK0WkLkZwsaTiFoBVijaVw_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Doug Anderson <dianders@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi

On Mon, Sep 13, 2021 at 4:43 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Sep 13, 2021 at 2:33 PM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Implement the first version of AUX support, which will be useful as
> > we expand the driver to support varied use cases.
> >
> > WARNING: This patch is not fully verified by hardware. But as AUX CH
> > is not implemented for ps8640 driver until now, the patch shouldn't
> > cause any functional regression in practice.
>
> Thanks for the heads up. NOTE: having this patch posted to do early
> code review is fine, but fair warning that I don't think there'd be
> much benefit in landing until the patch is verified more.
FYI - I've verified v3 patch with real hardware.
So this WARNING message is removed accordingly in v3.

>
>
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Handle the case where an AUX transaction has no payload
> > - Add a reg polling for p0.0x83 to confirm AUX cmd is issued and
> >   read data is returned
> > - Replace regmap_noinc_read/write with looped regmap_read/write,
> >   as regmap_noinc_read/write doesn't read one byte at a time unless
> >   max_raw_read/write is set to 1.
>
> What about if you set val_bytes? I think you just need to set that to
> "1" and it'll work?
I think val_bytes is already set to 1 as we set val_bits to 8. See:
map->format.val_bytes = DIV_ROUND_UP(config->val_bits, 8);

>
>
> > - Register/Unregister the AUX device explicitly when the bridge is
> >   attached/detached
> > - Remove the use of runtime PM
>
> I suspect runtime PM will need to be added back in at some point since
> AUX channel needs to be functional even if the bridge hasn't been
> "pre_enable"ed.
Thanks for the reminder.
I'll leave it to the follow-up patches.

>
>
> > - Program AUX addr/cmd/len in a single regmap_bulk_write()
> > - Add newlines for DRM_ERROR mesages
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 156 ++++++++++++++++++++++++-
> >  1 file changed, 153 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index 1b2414601538..3b28e992bb3e 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -13,11 +13,32 @@
> >  #include <linux/regulator/consumer.h>
> >
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_dp_helper.h>
> >  #include <drm/drm_mipi_dsi.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> >  #include <drm/drm_print.h>
> >
> > +#define PAGE0_AUXCH_CFG3       0x76
> > +#define  AUXCH_CFG3_RESET      0xff
> > +#define PAGE0_AUX_ADDR_7_0     0x7d
> > +#define PAGE0_AUX_ADDR_15_8    0x7e
> > +#define PAGE0_AUX_ADDR_23_16   0x7f
>
> nit: my manual calls the above "SWAUX_ADDR". Can you add the "SW"? I
> know it doesn't look pretty, but matching the manual is really nice.
> Similar with other commands below.
Fixed in v3. PTAL.

>
>
> > +#define  AUX_ADDR_19_16_MASK   GENMASK(3, 0)
> > +#define  AUX_CMD_MASK          GENMASK(7, 4)
> > +#define PAGE0_AUX_LENGTH       0x80
> > +#define  AUX_LENGTH_MASK       GENMASK(3, 0)
> > +#define  AUX_NO_PAYLOAD                BIT(7)
> > +#define PAGE0_AUX_WDATA                0x81
> > +#define PAGE0_AUX_RDATA                0x82
> > +#define PAGE0_AUX_CTRL         0x83
> > +#define  AUX_SEND              BIT(0)
> > +#define PAGE0_AUX_STATUS       0x84
> > +#define  AUX_STATUS_MASK       GENMASK(7, 5)
> > +#define  AUX_STATUS_TIMEOUT    (0x7 << 5)
> > +#define  AUX_STATUS_DEFER      (0x2 << 5)
> > +#define  AUX_STATUS_NACK       (0x1 << 5)
> > +
> >  #define PAGE2_GPIO_H           0xa7
> >  #define  PS_GPIO9              BIT(1)
> >  #define PAGE2_I2C_BYPASS       0xea
> > @@ -68,6 +89,7 @@ enum ps8640_vdo_control {
> >  struct ps8640 {
> >         struct drm_bridge bridge;
> >         struct drm_bridge *panel_bridge;
> > +       struct drm_dp_aux aux;
> >         struct mipi_dsi_device *dsi;
> >         struct i2c_client *page[MAX_DEVS];
> >         struct regmap   *regmap[MAX_DEVS];
> > @@ -117,6 +139,114 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> >         return container_of(e, struct ps8640, bridge);
> >  }
> >
> > +static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
> > +{
> > +       return container_of(aux, struct ps8640, aux);
> > +}
> > +
> > +static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
> > +                                  struct drm_dp_aux_msg *msg)
> > +{
> > +       struct ps8640 *ps_bridge = aux_to_ps8640(aux);
> > +       struct regmap *map = ps_bridge->regmap[PAGE0_DP_CNTL];
> > +       unsigned int len = msg->size;
> > +       unsigned int data;
> > +       int ret;
> > +       u8 request = msg->request &
> > +                    ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
> > +       u8 *buf = msg->buffer;
> > +       u8 addr_len[PAGE0_AUX_LENGTH + 1 - PAGE0_AUX_ADDR_7_0];
> > +       u8 i;
> > +       bool is_native_aux = false;
> > +
> > +       if (len > DP_AUX_MAX_PAYLOAD_BYTES)
> > +               return -EINVAL;
> > +
> > +       switch (request) {
> > +       case DP_AUX_NATIVE_WRITE:
> > +       case DP_AUX_NATIVE_READ:
> > +               is_native_aux = true;
>
> I think you need a "fallthrough;" here.
Fixed in v3. PTAL.
>
>
> > +       case DP_AUX_I2C_WRITE:
> > +       case DP_AUX_I2C_READ:
> > +               ret = regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
>
> Why not move the regmap_write() out of the switch statement? Also: you
> store the "ret" but you never check it. You should handle the error.
Fixed in v3. PTAL.
>
>
> > +               break;
> > +       default:
> > +               ret = -EINVAL;
> > +               goto exit;
> > +       }
> > +
> > +       /* Assume it's good */
> > +       msg->reply = 0;
> > +
> > +       addr_len[0] = msg->address & 0xff;
> > +       addr_len[1] = (msg->address >> 8) & 0xff;
> > +       addr_len[2] = ((request << 4) & AUX_CMD_MASK) |
>
> Instead of "request", needs to be the version of "request" without
> DP_AUX_I2C_MOT and DP_AUX_I2C_WRITE_STATUS_UPDATE stripped out. In the
> TI bridge chip it calls this "request_val".
Thanks for catching this.
I fixed this in v3. PTAL.
>
>
> > +               ((msg->address >> 16) & AUX_ADDR_19_16_MASK);
> > +       addr_len[3] = (len == 0) ? AUX_NO_PAYLOAD :
> > +                       ((len - 1) & AUX_LENGTH_MASK);
> > +
> > +       regmap_bulk_write(map, PAGE0_AUX_ADDR_7_0, addr_len,
> > +                         ARRAY_SIZE(addr_len));
> > +
> > +       if (len && (request == DP_AUX_NATIVE_WRITE ||
> > +                   request == DP_AUX_I2C_WRITE)) {
> > +               /* Write to the internal FIFO buffer */
> > +               for (i = 0; i < len; i++) {
> > +                       ret = regmap_write(map, PAGE0_AUX_WDATA, buf[i]);
> > +                       if (ret < 0) {
> > +                               DRM_ERROR("failed to write PAGE0_AUX_WDATA\n");
>
> nit: can you use dev_err() so that the dev gets printed? Also, can you
> print the error code?
Fxed this in v3. PTAL.

>
>
> > +                               goto exit;
>
> Unless you re-add pm_runtime (which you'll have to eventually), the
> above "goto exit" should just be "return ret". Same with other "goto
> exit"s in your patch.
In v3, I replaced "goto exit" with "return ret" in this function.
PTAL.
>
>
> > +                       }
> > +               }
> > +       }
> > +
> > +       regmap_write(map, PAGE0_AUX_CTRL, AUX_SEND);
> > +
> > +       /* Zero delay loop because i2c transactions are slow already */
> > +       ret = regmap_read_poll_timeout(map, PAGE0_AUX_CTRL, data,
> > +                                      !(data & AUX_SEND), 0, 50 * 1000);
> > +       if (ret)
> > +               goto exit;
> > +
> > +       regmap_read(map, PAGE0_AUX_STATUS, &data);
> > +       switch (data & AUX_STATUS_MASK) {
> > +       case AUX_STATUS_DEFER:
> > +               if (is_native_aux)
> > +                       msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
> > +               else
> > +                       msg->reply |= DP_AUX_I2C_REPLY_DEFER;
> > +               ret = -EBUSY;
> > +               goto exit;
>
> In the TI bridge chip driver we decided that we shouldn't handle the
> defer case since the hardware was already handling it. Specifically in
> the case of this bridge you can see that AUXCH_CFG1 shows a default
> value of retrying 7 times. ...so presumably we shouldn't ever actually
> get a defer here.
Removed the handlers for DEFER cases and added comments in v3.
PTAL.
>
>
> > +       case AUX_STATUS_NACK:
> > +               if (is_native_aux)
> > +                       msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
> > +               else
> > +                       msg->reply |= DP_AUX_I2C_REPLY_NACK;
> > +               ret = -EBUSY;
>
> I believe that you shouldn't be setting "ret = -EBUSY" here. You're
> supposed to be returning the number of bytes that were read / written
> before the NAK happened. In the read case you should also be returning
> the data that was actually read before the NAK too. Basically, add
> something that reads "M" and stores it in "len"
Fixed this in v3. PTAL.
>
>
> > +               goto exit;
> > +       case AUX_STATUS_TIMEOUT:
> > +               ret = -ETIMEDOUT;
> > +               goto exit;
>
> You seem to be missing handlers for:
> * ACKM
> * Invalid reply
> * I2C NACK
> * I2C defer (probably don't need to deal with this?)
In v3, I added the handlers for all status codes except for DEFER.
PTAL.
>
>
> > +       }
> > +
> > +       if (len && (request == DP_AUX_NATIVE_READ ||
> > +                   request == DP_AUX_I2C_READ)) {
> > +               /* Read from the internal FIFO buffer */
> > +               for (i = 0; i < len; i++) {
> > +                       ret = regmap_read(map, PAGE0_AUX_WDATA, &data);
>
> Oops, the above should be RDATA, not WDATA.
Thanks for catching this.
I fixed this in v3. PTAL.
>
>
> > +                       buf[i] = data;
> > +                       if (ret < 0)
> > +                               DRM_ERROR("failed to read PAGE0_AUX_RDATA\n");
>
> Return the error? Print the error code?
I fixed this in v3. PTAL.
>
>
> > +               }
> > +       }
> > +
> > +exit:
> > +       if (ret)
> > +               return ret;
> > +
> > +       return len;
> > +}
> > +
> >  static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
> >                                      const enum ps8640_vdo_control ctrl)
> >  {
> > @@ -286,18 +416,32 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
> >         dsi->format = MIPI_DSI_FMT_RGB888;
> >         dsi->lanes = NUM_MIPI_LANES;
> >         ret = mipi_dsi_attach(dsi);
> > -       if (ret)
> > -               goto err_dsi_attach;
> > +       if (ret) {
> > +               dev_err(dev, "failed to attach dsi device: %d\n", ret);
> > +               goto exit;
> > +       }
> > +
> > +       ret = drm_dp_aux_register(&ps_bridge->aux);
> > +       if (ret) {
> > +               dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
> > +               goto exit;
>
> Don't you need to go to an "error" label that causes mipi_dsi_detach()
> to get called?
I fixed this in v3. PTAL.
>
>
> > +       }
> >
> >         /* Attach the panel-bridge to the dsi bridge */
> >         return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
> >                                  &ps_bridge->bridge, flags);
> >
> > -err_dsi_attach:
> > +exit:
> >         mipi_dsi_device_unregister(dsi);
> >         return ret;
> >  }
> >
> > +
> > +static void ps8640_bridge_detach(struct drm_bridge *bridge)
> > +{
> > +       drm_dp_aux_unregister(&bridge_to_ps8640(bridge)->aux);
>
> I suspect that the lack of a "detach" was a prexisting bug. Perhaps
> you can submit a patch before yours that fixes it? It should undo the
> things that attach did, like calling mipi_dsi_detach() and
> mipi_dsi_device_unregister()
This doesn't look easy to get right.
Since it's pre-existing, can leave it alone for now?
>
>
> > +}
> > +
> >  static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
> >                                            struct drm_connector *connector)
> >  {
> > @@ -334,6 +478,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
> >
> >  static const struct drm_bridge_funcs ps8640_bridge_funcs = {
> >         .attach = ps8640_bridge_attach,
> > +       .detach = ps8640_bridge_detach,
> >         .get_edid = ps8640_bridge_get_edid,
> >         .post_disable = ps8640_post_disable,
> >         .pre_enable = ps8640_pre_enable,
> > @@ -412,6 +557,11 @@ static int ps8640_probe(struct i2c_client *client)
> >
> >         i2c_set_clientdata(client, ps_bridge);
> >
> > +       ps_bridge->aux.name = "parade-ps8640-aux";
> > +       ps_bridge->aux.dev = dev;
> > +       ps_bridge->aux.transfer = ps8640_aux_transfer;
> > +       drm_dp_aux_init(&ps_bridge->aux);
> > +
>
> Eventually you're going to want these here:
>
> devm_of_dp_aux_populate_ep_devices(&ps_bridge->aux);
> wait_for_device_probe()
>
> ...which I believe will enable DP AUX bus support. The second of those
> two is just me being paranoid to handle the case where the AUX
> endpoint device has an async probe.
>
> In order to make the above work you'll need proper pm_runtime support
> though since the aux channel needs to be usable before pre_enable().
> That means you'll have to power the bridge on in the pm_runtime code
> (enough to talk over the aux channel) and you'll need to use
> "autosuspend" so that the bridge doesn't constantly power down between
> aux transactions.
Thanks for the summary.
My next steps for this driver will be:
(1) Enable pm_runtime
(2) Populate endpoint devices in AUX CH

>
> -Doug
