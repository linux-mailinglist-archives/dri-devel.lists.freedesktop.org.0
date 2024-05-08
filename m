Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40B8BFCBC
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 13:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A941128BF;
	Wed,  8 May 2024 11:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="wOBNSsmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBD21128BF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 11:56:09 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-6f450f43971so3353854b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715169368; x=1715774168;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzBWZByfqdZx/hPlpPIy1POerUtgZPZjzuSa/z5kMRo=;
 b=wOBNSsmI2+RvaeuPsLDxGHuaVgIq3Csvq280IdnnsYBktyRv4aLIYBiJg80G2zyW/9
 x78KBMMh5yDqBL/sM1Ozh+kHKVpqoI957SpdB9+bpB7LsPzpExakVnfzHpE+mC9/wX2/
 CcxMot2TTInvzlnxBC/P/kmNwog97rMF5EKCDWoM5Sz+vLzl8lZW1FuTwCATkLmQnyp1
 UyLoaefoqGG6/VvkdKhA940N6tTcTzKt4jcAeaXPc/q1PRxUoCwy1zieZHkaQKg9E88j
 zE/jgV8PAjSX9wXzJOEta0XSGePz2rH3UKf/5r6mJ5n5b3UzRwTY8mEy5CxqT7LuJ2XR
 v7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715169368; x=1715774168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzBWZByfqdZx/hPlpPIy1POerUtgZPZjzuSa/z5kMRo=;
 b=wycJmo5nuSOuhxKHufW8KztHpDO89qD1eTIGpw/KG6bn3Ef6SrA6N1hVKG9cjd1iGJ
 d4pMR21Z5/QPk10At/QF9JWHg6m/f+jKXmTN77TN+Q6Q6W3HIoPWWKIRGXx6svrkrpAw
 mBssGeVMuwkrVGo2WR3sKl6wmtA1+l78Mn+nxwYltJSIZwlQAEkjyXDJoYxi90rtX9CX
 DABoQICxzJGYLYqvSk8t1M1CHRsK81ztgaqek5EIFTqWCMHuifOLOcF/yQhKmUxuEUdd
 PfzwMFg75PqaTQTXdKfhgexPmL94XuF1aR9VzWkshEky9Cyk2Mp3F0MR4JvjxLJNDM2s
 pJWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5PQQcuv1dZ79yXIZQ7wtVP9rim93BA67BR8DVIcv8JlOSX4Wve1wvq2CTaFodvDa4KyUszQJitDPtvcaGIC85gIjk7HSq1jPyVtVQDg4N
X-Gm-Message-State: AOJu0Yz7CQ0gZfZZX4dhzQqHORN0z19AZ8OaEYinZ64LSTXVxTk4KaS2
 PvGVUyRFl7kJrGEcbPHgorzrLeoYe65fdutWYbK7ZmmiaKGmZw6ZPOgqCBoe2nVhvh5IwF//X0e
 3XuuhxB1+BsrZDvTKJIgv68+XGan88En1cqVodQ==
X-Google-Smtp-Source: AGHT+IE4iAufvNLrHlSAWygkM7cmsvfktyL3UoTB3p6BWDfJXKoN/b0exVyFToTRexZifcgUkoKRBcwkpcWi6GUpDBc=
X-Received: by 2002:a05:6a21:168e:b0:1a3:65af:9baa with SMTP id
 adf61e73a8af0-1afc8de0229mr2361763637.62.1715169368633; Wed, 08 May 2024
 04:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
 <20240507135234.1356855-6-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WR0o1Z4c4+GjrZw8mTJPZnP8uB_gWhX1QuOxxm4qhroA@mail.gmail.com>
In-Reply-To: <CAD=FV=WR0o1Z4c4+GjrZw8mTJPZnP8uB_gWhX1QuOxxm4qhroA@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Wed, 8 May 2024 19:55:57 +0800
Message-ID: <CAHwB_NJHOphvydx8=HjgroE6ZXyJz-MHsJUwiedsMhshG0CMkQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panel: himax-hx83102: Support for BOE
 nv110wum-l60 MIPI-DSI panel
To: Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

Hi,

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B45=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=B8=89 07:35=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Tue, May 7, 2024 at 6:53=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > +static int boe_nv110wum_init(struct hx83102 *ctx)
> > +{
> > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi }=
;
> > +
> > +       msleep(60);
> > +
> > +       hx83102_enable_extended_cmds(ctx, true);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, =
0xaf, 0xaf, 0x2b, 0xeb, 0x42,
> > +                                        0xe1, 0x4d, 0x36, 0x36, 0x36, =
0x36, 0x1a, 0x8b, 0x11, 0x65, 0x00,
> > +                                        0x88, 0xfa, 0xff, 0xff, 0x8f, =
0xff, 0x08, 0x9a, 0x33);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0=
x47, 0xb0, 0x80, 0x00, 0x12,
> > +                                        0x71, 0x3c, 0xa3, 0x11, 0x00, =
0x00, 0x00, 0x88, 0xf5, 0x22, 0x8f);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x49, 0x=
49, 0x32, 0x32, 0x14, 0x32,
> > +                                        0x84, 0x6e, 0x84, 0x6e, 0x01, =
0x9c);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x84);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x=
04);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20=
);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0=
x84);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x36, 0=
x36, 0x22, 0x00, 0x00, 0xa0,
> > +                                        0x61, 0x08, 0xf5, 0x03);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x=
1e, 0x30, 0xd4, 0x01);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, =
0x13, 0x07, 0x00, 0x0f, 0x34);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, =
0x03, 0x44);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x03=
);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x37, =
0x06, 0x00, 0x02, 0x04, 0x0c, 0xff);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x1f=
, 0x11, 0x1f, 0x11);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0=
x00, 0x00, 0x00, 0x00, 0x04,
> > +                                        0x08, 0x04, 0x08, 0x37, 0x37, =
0x64, 0x4b, 0x11, 0x11, 0x03, 0x03, 0x32,
> > +                                        0x10, 0x0e, 0x00, 0x0e, 0x32, =
0x10, 0x0a, 0x00, 0x0a, 0x32, 0x17, 0x98,
> > +                                        0x07, 0x98, 0x00, 0x00);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x18, 0=
x18, 0x18, 0x18, 0x1e, 0x1e,
> > +                                        0x1e, 0x1e, 0x1f, 0x1f, 0x1f, =
0x1f, 0x24, 0x24, 0x24, 0x24, 0x07, 0x06,
> > +                                        0x07, 0x06, 0x05, 0x04, 0x05, =
0x04, 0x03, 0x02, 0x03, 0x02, 0x01, 0x00,
> > +                                        0x01, 0x00, 0x21, 0x20, 0x21, =
0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> > +                                        0x18, 0x18);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaf, 0=
xaa, 0xaa, 0xaa, 0xaa, 0xa0,
> > +                                        0xaf, 0xaa, 0xaa, 0xaa, 0xaa, =
0xa0);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x00, 0x=
05, 0x0d, 0x14, 0x1b, 0x2c,
> > +                                        0x44, 0x49, 0x51, 0x4c, 0x67, =
0x6c, 0x71, 0x80, 0x7d, 0x84, 0x8d, 0xa0,
> > +                                        0xa0, 0x4f, 0x58, 0x64, 0x73, =
0x00, 0x05, 0x0d, 0x14, 0x1b, 0x2c, 0x44,
> > +                                        0x49, 0x51, 0x4c, 0x67, 0x6c, =
0x71, 0x80, 0x7d, 0x84, 0x8d, 0xa0, 0xa0,
> > +                                        0x4f, 0x58, 0x64, 0x73);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x07, 0x=
10, 0x10, 0x1a, 0x26, 0x9e,
> > +                                        0x00, 0x53, 0x9b, 0x14, 0x14);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0x11=
, 0x00, 0x00, 0x89, 0x30, 0x80,
> > +                                        0x07, 0x80, 0x02, 0x58, 0x00, =
0x14, 0x02, 0x58, 0x02, 0x58, 0x02, 0x00,
> > +                                        0x02, 0x2c, 0x00, 0x20, 0x02, =
0x02, 0x00, 0x08, 0x00, 0x0c, 0x05, 0x0e,
> > +                                        0x04, 0x94, 0x18, 0x00, 0x10, =
0xf0, 0x03, 0x0c, 0x20, 0x00, 0x06, 0x0b,
> > +                                        0x0b, 0x33, 0x0e);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0=
xff, 0xff, 0xff, 0xfa, 0xa0,
> > +                                        0xff, 0xff, 0xff, 0xff, 0xfa, =
0xa0);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, =
0xbf, 0x11);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x96=
);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc9)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x84);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xd1)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0xf6=
, 0x2b, 0x34, 0x2b, 0x74, 0x3b,
> > +                                        0x74, 0x6b, 0x74);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x=
00, 0x2b, 0x01, 0x7e, 0x0f,
> > +                                        0x7e, 0x10, 0xa0, 0x00, 0x00);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x02, 0x=
00, 0xbb, 0x11);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0=
xaf, 0xff, 0xff, 0xfa, 0xa0,
> > +                                        0xff, 0xaf, 0xff, 0xff, 0xfa, =
0xa0);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfe, 0x=
01, 0xfe, 0x01, 0xfe, 0x01,
> > +                                        0x00, 0x00, 0x00, 0x23, 0x00, =
0x23, 0x81, 0x02, 0x40, 0x00, 0x20, 0x65,
> > +                                        0x02, 0x01, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00, 0x01, 0x00);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0=
xaf, 0xaa, 0xaa, 0xa0, 0x00,
> > +                                        0xaa, 0xaf, 0xaa, 0xaa, 0xa0, =
0x00, 0xaa, 0xaf, 0xaa, 0xaa, 0xa0, 0x00,
> > +                                        0xaa, 0xaf, 0xaa, 0xaa, 0xa0, =
0x00);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0x=
ff, 0xf8);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0x00=
);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x96);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f)=
;
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> > +       hx83102_enable_extended_cmds(ctx, false);
>
> It's not super important, but in panel drivers I converted to the
> mipi_dsi_dcs_write_seq_multi() I checked the "accum_err" and did an
> early return right before any mdelay() calls. This means that if any
> of the above failed then we didn't waste time with the mdelay().

Ok, I wiil add check accum_err before calling mdelay in V4.
Thanks.
>
> > +
> > +       msleep(50);
> > +
> > +       return dsi_ctx.accum_err;
> > +};
