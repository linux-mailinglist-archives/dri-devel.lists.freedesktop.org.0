Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B5B8D519
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 07:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0E010E327;
	Sun, 21 Sep 2025 05:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A7NcgZ2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CE710E327
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 05:01:11 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-30cceb749d7so1437829fac.2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 22:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758430871; x=1759035671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjfAWdx3qllN2H0M+sW0dm7oGyFJwrK43aFNVvYCDkE=;
 b=A7NcgZ2Bo9ImR1j4uRqjQ402nTLP19GVgYbYzM6D7J6aWM3lrqP6ufRA6fpM1fOuOq
 doPcAHkoTUBxJYr+UGjt8FtbkRKhlTPZJZsUc3Wcyy7UjmNJKwJ9vONVKvh1ISxIeTuY
 UtdXHtqZHvEpxd5wufgoKmXSRWWSHHextQMMWro+XJFGEhG91F/Sa5Vl3jTgiVgsgMgH
 WKbOYWbwIkQguU7X2jCb8nxGFee3auTzGt62W8pPxb1UXmMVX2DJQ+IW9y5GEpXjQB/z
 vMDn5Bp6H8UojZTTYochMmAjL6HOWaocFbPFhllpWbIO630/Dg82dYsnawTXIZaCCAhn
 htjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758430871; x=1759035671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IjfAWdx3qllN2H0M+sW0dm7oGyFJwrK43aFNVvYCDkE=;
 b=i9GHQeVxsCXBtSxlGaTunztGtmaR35kpoi3lZ0iyl1v/Q9SvM2AKPDZKSkeN/7wMuK
 UKEaGw5zat860jlD8xD3Ieve/+VZ7fg7E1ymLfpJaEZ68ggP02CNws6kmGSa66W4t0LV
 9gB9cNZcV9Bk65tkGAkQ3xWR20iBx5bIWsZmGbQvudiRe8G+gk47FR5EY2Uk+0DB+dJb
 OPzgAc84jzxeJ9yTrU0AXtH7RMEn5u291zrXMr64ToEhDVzwlPWLaBZ5ChlblV4QbEMa
 Zu8O4Y1smPDlztKEMCi+cOi5hZ1hwRVfs/z+bXjMWiWilpT7icVCakOV3vvs8EY+Jy2I
 ydvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuMqu761KU1w0rOKi37SDqNahq4w8N6dE6qRBcbK0hZnCL/ZspwvdMqVinEQVG1Kytyx6MYB/7kno=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzZ8aaASheknYk0Pa9nibhEAVKCd1W6QX4WPqJXm0gADXA6qYE
 HGxrre9BoYH1vsTe/LziucU8+51DYTMOirGDAPqUtSPVsJdZc7PbxBuhqTBSKB3IiXEhkgbbfen
 Su4m5mtacK91Ju68d3BkpuW4YgnZSKLQ=
X-Gm-Gg: ASbGnctr38NBS2smuB/KcrBc/39ItkrQK2DJt43Z93u+wkC9XtmjVen94b057MVv0BJ
 +Xwxyt9LM//Dgvk2ra9u32l/uT8KObTyDmaRUzri1bjkzEbtzYEU2XPZvosE7FhdWhA/UQa2ZIh
 eUWmK7aF8L3W73rJ2FJoOhyEztI1BmvrTgfdD1HJxV7f8gxVP0MtqVSOpJdXWc3eSnxlCmwM3lz
 KpjY5zN
X-Google-Smtp-Source: AGHT+IFKpKCb+G5+tP41Jly7b1/38Uvws70S97XKQpr/S5rzy7zAFBiiLMjEcsLoKodvfvth4fS5Yj3OP9ZLUPhO44s=
X-Received: by 2002:a05:6870:6e83:b0:31d:718f:a09d with SMTP id
 586e51a60fabf-33bb5c80cf2mr4292754fac.25.1758430870653; Sat, 20 Sep 2025
 22:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <20250917-mt8196-gpufreq-v3-5-c4ede4b4399e@collabora.com>
In-Reply-To: <20250917-mt8196-gpufreq-v3-5-c4ede4b4399e@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 21 Sep 2025 00:00:59 -0500
X-Gm-Features: AS18NWDK9SEswNrgx0QIzUV1feO9ul79WZJVBOk2Mw-YsP45swDD7fxXXq-LHKs
Message-ID: <CABb+yY0_TZC0Dd3Rue=6Am4=Urs8hdkaa6RE=42t58SYUsLV0w@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
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

On Wed, Sep 17, 2025 at 7:23=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
....

> +#define MBOX_CTL_TX_STS                0x0000
> +#define MBOX_CTL_IRQ_SET       0x0004
> +#define MBOX_CTL_IRQ_CLR       0x0074
> +#define MBOX_CTL_RX_STS                0x0078
> +
1) Please don't pollute the global namespace. Make these something
like MBOX_MTK_GPUEB_xxx. Here and elsewhere.
2) You don't write short values, so maybe just 0x04, 0x04 0x74 and 0x78.


> +#define MBOX_FULL              BIT(0) /* i.e. we've received data */
> +#define MBOX_CLOGGED           BIT(1) /* i.e. the channel is shutdown */
> +
This is confusing. CLOGGED usually means malfunction, but it seems you
want to call it STOPPED or UNINIT?


> +#define MBOX_MAX_RX_SIZE       32 /* in bytes */
> +
> +struct mtk_gpueb_mbox {
> +       struct device *dev;
> +       struct clk *clk;
> +       void __iomem *mbox_mmio;
> +       void __iomem *mbox_ctl;
> +       struct mbox_controller mbox;
> +       struct mtk_gpueb_mbox_chan *ch;
> +       int irq;
> +       const struct mtk_gpueb_mbox_variant *v;
> +};
Other structures have kernel-doc, so why not here too?
...

> +
> +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> +       int i;
> +       u32 *values =3D data;
> +
maybe order in decreasing lengths ?


> +
> +       /*
> +        * We don't want any fancy nonsense, just write the 32-bit values=
 in
> +        * order. memcpy_toio/__iowrite32_copy don't work here, because f=
ancy.
> +        */
>
Please make the comment technical. Currently it just expresses your
distaste for fancy :)

> +       for (i =3D 0; i < ch->c->tx_len; i +=3D 4)
> +               writel(values[i / 4], ch->ebm->mbox_mmio + ch->c->tx_offs=
et + i);
> +

...
> +
> +static struct mbox_chan *
> +mtk_gpueb_mbox_of_xlate(struct mbox_controller *mbox,
> +                       const struct of_phandle_args *sp)
> +{
> +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(mbox->dev);
> +
> +       if (!sp->args_count)
> +               return ERR_PTR(-EINVAL);
> +
> +       if (sp->args[0] >=3D ebm->v->num_channels)
> +               return ERR_PTR(-ECHRNG);
> +
> +       return &mbox->chans[sp->args[0]];
> +}
>
Just use the default of_mbox_index_xlate()

....
> +
> +       for (i =3D 0; i < ebm->v->num_channels; i++) {

You make this block a bit cleaner by using a temporary variable
        echan =3D &ebm->ch[i];
and using echan instead of ebm->ch[i] a dozen times below.

> +               ebm->ch[i].c =3D &ebm->v->channels[i];
> +               if (ebm->ch[i].c->rx_len > MBOX_MAX_RX_SIZE) {
> +                       dev_err(ebm->dev, "Channel %s RX size (%d) too la=
rge\n",
> +                               ebm->ch[i].c->name, ebm->ch[i].c->rx_len)=
;
> +                       return -EINVAL;
> +               }
> +               ebm->ch[i].full_name =3D devm_kasprintf(ebm->dev, GFP_KER=
NEL, "%s:%s",
> +                                                     dev_name(ebm->dev),=
 ebm->ch[i].c->name);
> +               if (!ebm->ch[i].full_name)
> +                       return -ENOMEM;
> +
> +               ebm->ch[i].ebm =3D ebm;
> +               ebm->ch[i].num =3D i;
> +               spin_lock_init(&ebm->mbox.chans[i].lock);
> +               ebm->mbox.chans[i].con_priv =3D &ebm->ch[i];
> +               atomic_set(&ebm->ch[i].rx_status, MBOX_CLOGGED);
> +       }
> +


-j
