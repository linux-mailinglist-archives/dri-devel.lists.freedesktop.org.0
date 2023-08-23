Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C62785DE9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 18:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3252D10E091;
	Wed, 23 Aug 2023 16:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D57210E091
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 16:53:21 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a84c228f26so14914b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692809600; x=1693414400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60vitW1Ii90u436mOW3P7n/14Uw/HX9UVNZgbZ6VZFw=;
 b=YMvhMSGUKUEwJcZCKSgKrgNIPXd8dpcWPr0adKfbQvbvQ6YzJhjijELNS9ZgAtalNZ
 ySnei9A3YmbyvRnlHNlMiUpSvGZM+uec0rbRAajq/N4gbXgxNzsg/mtyIvbGpbolofoF
 y3dKWYmF3KIXzYnJoR77igkpP58SZ6Juy58kFGTnbSaIVm7j9UTQFTFyOpbn8medvBOU
 On9eiSKI/2RaDwSlHzNMza5V6h05+cIR2aMQRDVvdRdheIpKIvmVj4lK7w/clzwLjLB8
 zYJpWvGlQD1WTGdJ5AeFqDIxm0SM4NKa6/gLt46pM+/+gFMNMPa2k6EPf+yjHpHpzlya
 T8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692809600; x=1693414400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60vitW1Ii90u436mOW3P7n/14Uw/HX9UVNZgbZ6VZFw=;
 b=YGmFB9+oaWFC7uvWNTk/GROpk9ShIAifEudII94MhDGc2KQLh0PpuW9IIWSWBD27JP
 vN+ZDVXCpUoldFQOxyvjl8pQn7XR7PJKE7UdbQjXajoD+sGINJ114nFumA6YrfUXtcYN
 MbWnmhezPvcpzgdDht5HfHBbw1VW76SodObeBULU+eVBiRfnUwHnIsPHlnaRECq91r8N
 gY3qzDNLGl68vv0gB+KbB2GAltDDdzXTTAowxBAPYJBgSommR3YZNweJOhBSOCg2aXA1
 5u8Wuqkk15OqqLIs/9Zq2R4VyfcFLxFGspAwOg3aPALWZ3UTn2M0kKE8kNMNuOYFLdYV
 lmzg==
X-Gm-Message-State: AOJu0YzNwwrGVInlHA+XAcqIlLsg0lLwxe/cnBT72W8o9WyQYtyrG7xT
 MweXAIqQhmoIbzlftnQdZLqKJjXRA2cOjUlWG/g=
X-Google-Smtp-Source: AGHT+IGohFNsM5lxfh901g2mPHLDLoP/rBL6blyLLFnGi/0yi0EYAhmmbxViSD/V60MRLGx85Hq6vLVyav/6Rnb5qCQ=
X-Received: by 2002:a05:6808:2201:b0:3a7:5346:fcee with SMTP id
 bd1-20020a056808220100b003a75346fceemr9641483oib.0.1692809600412; Wed, 23 Aug
 2023 09:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Aug 2023 19:52:44 +0300
Message-ID: <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
To: Biju Das <biju.das.jz@bp.renesas.com>
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
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 5:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > On Sun, Aug 13, 2023 at 1:51=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com>
> > wrote:

...

> > It seems like this is a sign that nobody is actually using the i2c matc=
h
> > table.

You can't know. The I2C ID table allows to instantiate a device from
user space by supplying it's address and a name, that has to be
matched with the one in ID table.

> > It was probably added because the original author just copy/pasted
> > from something else, but obviously it hasn't been kept up to date and i=
sn't
> > working.

How can you be so sure?

> > While your patch would make it work for "anx7814", it wouldn't
> > make it work for any of the other similar parts. ...and yes, you could =
add
> > support for those parts in your patch too, but IMO it makes more sense =
to
> > just delete the i2c table and when someone has an actual need then they=
 can
> > re-add it.
> >
> > Sound OK?

No. Please, do not remove the I2C ID table. It had already been
discussed a few years ago.

> Yes, it make sense, as it saves some memory.

--=20
With Best Regards,
Andy Shevchenko
