Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAEA8C45AE
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6CA10E047;
	Mon, 13 May 2024 17:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EgCKe50P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC5E10E047
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:08:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1AC860EEB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838C4C113CC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715620085;
 bh=OD9t1Do/6Nqy/4kVv1yQjxAOL1p/N0MNU0BBYN6g7N4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EgCKe50PXHvNdEFWJL0csra8tbXERgpPQEJN0uQnYPzB2R+/5DuHKtxxkqnlB7O7M
 PqzbnCYMYn+zQVQco0ICFZ2QbwZK8CWE6F7KJ4vG3lTLW5JyjLnwrhmwdOrwRWZp60
 HU2BCiMNbH8yxVD3csX1X9H4KyuVQTcbzAkK5nxEX0vHWhwapqlwZSazX/pH6NNLVf
 0QU6jpBPoJShRN3TYO6vWVjaxmxYoi8CRm1K3Mfo+7bfKpR+7VniLHgfZsaQfEZESB
 0uS+q8T/WewOofOhxNfi2IBij0cfluMQZzQew5yJdHjp0/XwiR+bw8yQXQ3PZGQbeA
 +RbcBy2BLVW+Q==
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-22ed075a629so2739157fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:08:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YxAJRPV2ouQrHVMqZjwZ1mfWbYZBnE9zRnp0W8NrZsq9+mOh19k
 U5a9GT6S/0S8Q/A/9tZCk6Q4+OReP9R6gqGy+UCApX4NqdO20b5JW2fGXdF7CHhCpExHbXZDx9W
 zykblJEXKdXYM0jmKiOTjFdWYhdKv3lzO8Ufs4Q==
X-Google-Smtp-Source: AGHT+IEtGIwM5+S5tz5iafjYpLlABUJmN6twCe9mE7f6BJaW3wbpnZo6fAc2TDM+/NTTif372yzpKhtLVg3XDIs+zN8=
X-Received: by 2002:a05:6870:4345:b0:23e:8800:a56d with SMTP id
 586e51a60fabf-2417290e2a9mr12297620fac.10.1715620084855; Mon, 13 May 2024
 10:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715347488.git.jani.nikula@intel.com>
 <485a33bc4eba9daae109d3f4795bc695e026ba0c.1715347488.git.jani.nikula@intel.com>
In-Reply-To: <485a33bc4eba9daae109d3f4795bc695e026ba0c.1715347488.git.jani.nikula@intel.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 May 2024 19:07:52 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6WN1voSYR=8SsZKr5H8TcyV50TRFo57nAyZLmJFQ9M4w@mail.gmail.com>
Message-ID: <CAN6tsi6WN1voSYR=8SsZKr5H8TcyV50TRFo57nAyZLmJFQ9M4w@mail.gmail.com>
Subject: Re: [RESEND 4/6] drm/i2c: tda998x: switch to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 10, 2024 at 3:26=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Prefer struct drm_edid based functions over struct edid.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda9=
98x_drv.c
> index d8d7de18dd65..2160f05bbd16 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -1283,7 +1283,7 @@ static int read_edid_block(void *data, u8 *buf, uns=
igned int blk, size_t length)
>  static int tda998x_connector_get_modes(struct drm_connector *connector)
>  {
>         struct tda998x_priv *priv =3D conn_to_tda998x_priv(connector);
> -       struct edid *edid;
> +       const struct drm_edid *drm_edid;
>         int n;
>
>         /*
> @@ -1297,25 +1297,26 @@ static int tda998x_connector_get_modes(struct drm=
_connector *connector)
>         if (priv->rev =3D=3D TDA19988)
>                 reg_clear(priv, REG_TX4, TX4_PD_RAM);
>
> -       edid =3D drm_do_get_edid(connector, read_edid_block, priv);
> +       drm_edid =3D drm_edid_read_custom(connector, read_edid_block, pri=
v);
>
>         if (priv->rev =3D=3D TDA19988)
>                 reg_set(priv, REG_TX4, TX4_PD_RAM);
>
> -       if (!edid) {
> +       drm_edid_connector_update(connector, drm_edid);
> +       cec_notifier_set_phys_addr(priv->cec_notify,
> +                                  connector->display_info.source_physica=
l_address);
> +
> +       if (!drm_edid) {
>                 dev_warn(&priv->hdmi->dev, "failed to read EDID\n");
>                 return 0;
>         }
>
> -       drm_connector_update_edid_property(connector, edid);
> -       cec_notifier_set_phys_addr_from_edid(priv->cec_notify, edid);
> -
>         mutex_lock(&priv->audio_mutex);
> -       n =3D drm_add_edid_modes(connector, edid);
> -       priv->sink_has_audio =3D drm_detect_monitor_audio(edid);
> +       n =3D drm_edid_connector_add_modes(connector);
> +       priv->sink_has_audio =3D connector->display_info.has_audio;
>         mutex_unlock(&priv->audio_mutex);
>
> -       kfree(edid);
> +       drm_edid_free(drm_edid);
>
>         return n;
>  }
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
