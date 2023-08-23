Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54246785E5B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 19:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211B389B57;
	Wed, 23 Aug 2023 17:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3EC89B57
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 17:14:11 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso776729266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 10:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692810847; x=1693415647;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQv89qTB/4ocabDX/Qs6CKP5Tk03134i0Ytt/LFMjok=;
 b=e5Tcs2/UzHfO06uwj8UHl/Wt5Dv60Bwl+KbOKQ4qu9JzTEbX6Yelj/bB2vZXH2UxuM
 AdP2uqfEIsItwo5r9ICSp/A/vCEFYQhnBkXlnETLX4LDNfE9sYCQwXWlcAIotJRw/hrg
 RZbkXwV2wkuemy65j+ta2qrgqn5E9HXgOfImQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692810847; x=1693415647;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQv89qTB/4ocabDX/Qs6CKP5Tk03134i0Ytt/LFMjok=;
 b=TeDR+FC8azIy85bs5OQ+7E2FX5wL0UlmlLaisx9lZMZK6TXsX7STkcYA51iF6LAQ44
 5PQSr3HyB4EA494Ne0xar6c+Z6sJZTFfxxhB4uz3kuL3vuRIvpqmbYvtPmpKH03qRFTx
 qMfvv3MYz1PVND/rR7lkvHcbFxckjgEJp2SjJkDtpqR/g+xIGizkaCClGZ7nTsjXtIDs
 nqhMxqNWDNGFC52H4BKencms2lxWBSFtXzc68rPaz3KOuvM7+32JtEyrx1ZRUTa7fURD
 jEexfxkgyEccrzqusSO+SP93Fq94aWALja4ezGYHnlVeqIeCAs2bIBjP06HvdJa3u6R/
 dNYA==
X-Gm-Message-State: AOJu0Yzy0npdnXcoD4HcMqBrc3inI3nSNcllSigo7G7IcHDy+MNFC52A
 q6uMgFfr/pEw6XU+vFospGmt+v74V+GA2FpFhRRkIX1/
X-Google-Smtp-Source: AGHT+IFhJ26t/4vHuNFYEgr08vKdE+O3lqb/qhJQ+Guf7p7HgEulcS4PySByJ2T8RdxBkDiThw7a/g==
X-Received: by 2002:a17:906:74cf:b0:992:9ea0:2317 with SMTP id
 z15-20020a17090674cf00b009929ea02317mr11183552ejl.61.1692810847629; 
 Wed, 23 Aug 2023 10:14:07 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 p5-20020a17090635c500b00988be3c1d87sm9852633ejb.116.2023.08.23.10.14.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 10:14:07 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4005f0a6c2bso3095e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 10:14:06 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba0:b0:3fe:dd72:13ae with SMTP id
 n32-20020a05600c3ba000b003fedd7213aemr301803wms.0.1692810846360; Wed, 23 Aug
 2023 10:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
In-Reply-To: <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Aug 2023 10:13:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uwg9AuKuKpUAbfnzfm5wTRtYqhg5f24Y7cPSDugWz1wg@mail.gmail.com>
Message-ID: <CAD=FV=Uwg9AuKuKpUAbfnzfm5wTRtYqhg5f24Y7cPSDugWz1wg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 23, 2023 at 9:53=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Aug 23, 2023 at 5:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > On Sun, Aug 13, 2023 at 1:51=E2=80=AFAM Biju Das <biju.das.jz@bp.rene=
sas.com>
> > > wrote:
>
> ...
>
> > > It seems like this is a sign that nobody is actually using the i2c ma=
tch
> > > table.
>
> You can't know. The I2C ID table allows to instantiate a device from
> user space by supplying it's address and a name, that has to be
> matched with the one in ID table.

In general, right, you can't know. ...and in general, I wouldn't have
suggested removing the table. However, in this specific case I think
we have a very good idea that nobody is using it. Specifically, if you
take a look at Biju's patch you can see that if anyone had been trying
to use the I2C table then they would have been getting a NULL pointer
dereference at probe time for the last ~5 years.

Specifically, I think that as of commit 025910db8057 ("drm/bridge:
analogix-anx78xx: add support for 7808 addresses") that if anyone were
using the I2C ID table:

1. In anx78xx_i2c_probe(), device_get_match_data() would have returned NULL
2. We would have tried to dereference that NULL in the loop.


> > > It was probably added because the original author just copy/pasted
> > > from something else, but obviously it hasn't been kept up to date and=
 isn't
> > > working.
>
> How can you be so sure?

Unless I misunderstood the code, they'd be crashing.


> > > While your patch would make it work for "anx7814", it wouldn't
> > > make it work for any of the other similar parts. ...and yes, you coul=
d add
> > > support for those parts in your patch too, but IMO it makes more sens=
e to
> > > just delete the i2c table and when someone has an actual need then th=
ey can
> > > re-add it.
> > >
> > > Sound OK?
>
> No. Please, do not remove the I2C ID table. It had already been
> discussed a few years ago.

If you really want the table kept then it's no skin off my teeth. I
just happened to see that nobody was responding to the patch and I was
trying to be helpful. My analysis above showed that the I2C table must
not be used, but if you feel strongly that we need to add code then
feel free to provide a Reviewed-by tag to Biju's patch! :-)

-Doug
