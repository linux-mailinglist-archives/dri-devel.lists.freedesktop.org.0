Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5897B7C87D7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53C010E08F;
	Fri, 13 Oct 2023 14:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF14010E08F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:28:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E73816213B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AB5C433CC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697207284;
 bh=dZ4T5SQCsYGEmv6ZB9hrEiSnfQIko+mmQNF4wFTvC48=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mkiOwHQRkxB+DWi/8+VffLYFyqJFSmFWi8yDv988+YX+Z+spM5O2Atbzn+w1EECzv
 /led2jApZ5FXpAF78saBqEqVVcirUiIa5LImeQ6HdSaaYitaek+z7feuhFxHun1ALW
 v+fnwW09ScnJKXRGMjhnjOjr/6vZUSVEZ+AdIRCtcfxP2qXJjrj/ZXp6Dt2907EJeB
 unEDzTGp96WsRQmcwDWCifZnmcfaGVnqRD+cMACB8cPDe+z/ckgktSZa/V9Qn0UbBf
 O0T96SdYL+dfA/DxkyQXJww0ceNZt9BWvyxYdW7L0W9I9MNe7QBjkiBjjS1UZvf08e
 tGP8nFJ6aJX2Q==
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-578b4997decso1609933a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 07:28:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YzivFwrY6vPVsoDRwaoSVZKdiM/KWNtigsH4wQYpZ7UhcewTW3n
 ntLgG9DwwjEXeEOd4NuKt3otH/DNzPxWJ3ptbY1gsw==
X-Google-Smtp-Source: AGHT+IFnue5MPsHvPPa1TUd5CWAiTTU4DRB6PCLB37g5QrrJCzPWpbnbsMNyz3cAvbiOx5iOMmqV2IUpGp1BUodd1kM=
X-Received: by 2002:a17:90b:1b4c:b0:274:9823:b481 with SMTP id
 nv12-20020a17090b1b4c00b002749823b481mr26320064pjb.9.1697207284107; Fri, 13
 Oct 2023 07:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230921104751.56544-1-ian.ray@ge.com>
In-Reply-To: <20230921104751.56544-1-ian.ray@ge.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 13 Oct 2023 16:27:52 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6imFZGFtUWR0sNDBnacc79gzX9Up2Gb=CWPU11T=WduQ@mail.gmail.com>
Message-ID: <CAN6tsi6imFZGFtUWR0sNDBnacc79gzX9Up2Gb=CWPU11T=WduQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 switch to drm_do_get_edid()
To: Ian Ray <ian.ray@ge.com>
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
Cc: neil.armstrong@linaro.org, martyn.welch@collabora.co.uk, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, peter.senna@gmail.com,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 12:48=E2=80=AFPM Ian Ray <ian.ray@ge.com> wrote:
>
> Migrate away from custom EDID parsing and validity checks.
>
> Note:  This is a follow-up to the original RFC by Jani [1].  The first
> submission in this series should have been marked v2.
>
> [1] https://patchwork.freedesktop.org/patch/msgid/20230901102400.552254-1=
-jani.nikula@intel.com
>
> Co-developed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ian Ray <ian.ray@ge.com>
> ---
>  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 57 ++++------------=
------
>  1 file changed, 9 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/d=
rivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 460db3c..e93083b 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -65,12 +65,11 @@ struct ge_b850v3_lvds {
>
>  static struct ge_b850v3_lvds *ge_b850v3_lvds_ptr;
>
> -static u8 *stdp2690_get_edid(struct i2c_client *client)
> +static int stdp2690_read_block(void *context, u8 *buf, unsigned int bloc=
k, size_t len)
>  {
> +       struct i2c_client *client =3D context;
>         struct i2c_adapter *adapter =3D client->adapter;
> -       unsigned char start =3D 0x00;
> -       unsigned int total_size;
> -       u8 *block =3D kmalloc(EDID_LENGTH, GFP_KERNEL);
> +       unsigned char start =3D block * EDID_LENGTH;
>
>         struct i2c_msg msgs[] =3D {
>                 {
> @@ -81,53 +80,15 @@ static u8 *stdp2690_get_edid(struct i2c_client *clien=
t)
>                 }, {
>                         .addr   =3D client->addr,
>                         .flags  =3D I2C_M_RD,
> -                       .len    =3D EDID_LENGTH,
> -                       .buf    =3D block,
> +                       .len    =3D len,
> +                       .buf    =3D buf,
>                 }
>         };
>
> -       if (!block)
> -               return NULL;
> +       if (i2c_transfer(adapter, msgs, 2) !=3D 2)
> +               return -1;
>
> -       if (i2c_transfer(adapter, msgs, 2) !=3D 2) {
> -               DRM_ERROR("Unable to read EDID.\n");
> -               goto err;
> -       }
> -
> -       if (!drm_edid_block_valid(block, 0, false, NULL)) {
> -               DRM_ERROR("Invalid EDID data\n");
> -               goto err;
> -       }
> -
> -       total_size =3D (block[EDID_EXT_BLOCK_CNT] + 1) * EDID_LENGTH;
> -       if (total_size > EDID_LENGTH) {
> -               kfree(block);
> -               block =3D kmalloc(total_size, GFP_KERNEL);
> -               if (!block)
> -                       return NULL;
> -
> -               /* Yes, read the entire buffer, and do not skip the first
> -                * EDID_LENGTH bytes.
> -                */
> -               start =3D 0x00;
> -               msgs[1].len =3D total_size;
> -               msgs[1].buf =3D block;
> -
> -               if (i2c_transfer(adapter, msgs, 2) !=3D 2) {
> -                       DRM_ERROR("Unable to read EDID extension blocks.\=
n");
> -                       goto err;
> -               }
> -               if (!drm_edid_block_valid(block, 1, false, NULL)) {
> -                       DRM_ERROR("Invalid EDID data\n");
> -                       goto err;
> -               }
> -       }
> -
> -       return block;
> -
> -err:
> -       kfree(block);
> -       return NULL;
> +       return 0;
>  }
>
>  static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
> @@ -137,7 +98,7 @@ static struct edid *ge_b850v3_lvds_get_edid(struct drm=
_bridge *bridge,
>
>         client =3D ge_b850v3_lvds_ptr->stdp2690_i2c;
>
> -       return (struct edid *)stdp2690_get_edid(client);
> +       return drm_do_get_edid(connector, stdp2690_read_block, client);
>  }
>
>  static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)

Reviewed-by: Robert Foss <rfoss@kernel.org>
