Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F288C132E
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 18:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4E510E03A;
	Thu,  9 May 2024 16:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UzvSjUzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF08610E03A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 16:42:33 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-792bdf626beso81745985a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715272950; x=1715877750;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1jylhP92/UnOH4NiMwyBD6WrtK+UqXE3bUpoY76z2bU=;
 b=UzvSjUzg429Ysh1ggkVqq0GGgW1iRFA+l9dgbhKIeI2vg9Nob54k3wIbtZGzvooorH
 XGWwz4X4Z/TPsTtbwVYLPYyj684euUSuMwRdf3N5PAQ6fIvBjBw+VEUVwflwY6f2xhMg
 UF4swjJie5z/CJm1NgbpUiFx/RkLxjEDcI278=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715272950; x=1715877750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jylhP92/UnOH4NiMwyBD6WrtK+UqXE3bUpoY76z2bU=;
 b=ig4MHoSXxQRwKTQYBSMpiNidQjBgUgRzitbvz+F/f2p67DPPLt9QBwYK2IxWAep99y
 WgLverAtKLRjQ56ZLYtFY/liO6j/I84AQM6w8fQVA5FcsdhoSDrxrtA3KqqOOaHTHkFN
 fOQLgC59C6ADgHH0mLK+SPnRgg2qVILG7JRpKAYK5W8lOAxbbiBdkGcPBn+KJ0t+pETz
 jutL+eyVBdNZPLTiD/y43QYZNUyRjSP21E657UccAO9k4a5SFUS5lD8sGNPjrja64Y6X
 77yoPOTT9DbCGUeCG27YK5S78ixzOJB49oAJBlADrFIxW33V5fici67bo77iXSR55F6i
 gvDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqqOAu8L5LTOBkq4UbboHOC2mu8sO8NY5iKrwpNRDwk2VXrxUpPl/BXFvpZRJOakQDqV+xMRs5+lZ+ZiETCfbMzhwvmBIzM7iPPUxrQ1O3
X-Gm-Message-State: AOJu0YyM2a9nFrZ4tTHpI/GdnTGbg9+0a1oiQLoeAxBD722CrNK6vKrZ
 rUtmltqEfT4ZnltcGGfgyQI0mBmodPoaGKxnNie2vrz2uqbzEpf44aKtSzEqgLDvH/1uzzQ0jXg
 9ck3z
X-Google-Smtp-Source: AGHT+IG7GOjE5ZUjf+sGmxPB/nOifIKdujFdAGBH9X0nj9nJ2ZGvycxehTgovylL58Ci23Nr5y32IQ==
X-Received: by 2002:a05:620a:25ce:b0:790:c91a:73ae with SMTP id
 af79cd13be357-792bbdc4dffmr497166985a.2.1715272949809; 
 Thu, 09 May 2024 09:42:29 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2a4290sm84828085a.65.2024.05.09.09.42.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 09:42:29 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-439b1c72676so1081cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 09:42:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU3tKw66aEJwvmcYhOJBhXVDkDoZ2JVluq81X2eUt7phBfLCD94Ik41Om/lCH7cybWGsKZAHnnkqzz/KoJSajkiIG1tf1hiCptuCZwoNuSf
X-Received: by 2002:a05:622a:1f10:b0:43d:f77b:7aa2 with SMTP id
 d75a77b69052e-43df77b7cc1mr2148531cf.6.1715272947626; Thu, 09 May 2024
 09:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
 <20240509015207.3271370-8-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240509015207.3271370-8-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 May 2024 09:42:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vd34kBy4meaqqYECQKaT1=XcCFdq3qaU5n=YBWVAVi-Q@mail.gmail.com>
Message-ID: <CAD=FV=Vd34kBy4meaqqYECQKaT1=XcCFdq3qaU5n=YBWVAVi-Q@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] drm/panel: himax-hx83102: Support for IVO t109nw41
 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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

On Wed, May 8, 2024 at 6:53=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> +static int ivo_t109nw41_init(struct hx83102 *ctx)
> +{
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> +
> +       msleep(60);
> +
> +       hx83102_enable_extended_cmds(&dsi_ctx, true);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0x=
ed, 0xed, 0x0f, 0xcf, 0x42,
> +                                    0xf5, 0x39, 0x36, 0x36, 0x36, 0x36, =
0x32, 0x8b, 0x11, 0x65, 0x00, 0x88,
> +                                    0xfa, 0xff, 0xff, 0x8f, 0xff, 0x08, =
0xd6, 0x33);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x4=
7, 0xb0, 0x80, 0x00, 0x12,
> +                                    0x71, 0x3c, 0xa3, 0x22, 0x20, 0x00, =
0x00, 0x88, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x35, 0x35=
, 0x43, 0x43, 0x35, 0x35,
> +                                    0x30, 0x7a, 0x30, 0x7a, 0x01, 0x9d);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x84);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x04=
);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0xc=
4);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x34, 0x3=
4, 0x22, 0x11, 0x22, 0xa0,
> +                                    0x31, 0x08, 0xf5, 0x03);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xd3);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x22);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1e=
, 0x13, 0x88, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x=
13, 0x07, 0x00, 0x0f, 0x34);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x=
03, 0x44);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x03);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x07, 0x=
06, 0x00, 0x02, 0x04, 0x2c,
> +                                    0xff);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x0=
0, 0x00, 0x00, 0x00, 0x08,
> +                                    0x08, 0x08, 0x08, 0x37, 0x07, 0x64, =
0x7c, 0x11, 0x11, 0x03, 0x03, 0x32,
> +                                    0x10, 0x0e, 0x00, 0x0e, 0x32, 0x17, =
0x97, 0x07, 0x97, 0x32, 0x00, 0x02,
> +                                    0x00, 0x02, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x25, 0x2=
4, 0x25, 0x24, 0x18, 0x18,
> +                                    0x18, 0x18, 0x07, 0x06, 0x07, 0x06, =
0x05, 0x04, 0x05, 0x04, 0x03, 0x02,
> +                                    0x03, 0x02, 0x01, 0x00, 0x01, 0x00, =
0x1e, 0x1e, 0x1e, 0x1e, 0x1f, 0x1f,
> +                                    0x1f, 0x1f, 0x21, 0x20, 0x21, 0x20, =
0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +                                    0x18, 0x18);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0xa=
a, 0xaa, 0xaa, 0xaa, 0xa0,
> +                                    0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, =
0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x04, 0x04=
, 0x06, 0x0a, 0x0a, 0x05,
> +                                    0x12, 0x14, 0x17, 0x13, 0x2c, 0x33, =
0x39, 0x4b, 0x4c, 0x56, 0x61, 0x78,
> +                                    0x7a, 0x41, 0x50, 0x68, 0x73, 0x04, =
0x04, 0x06, 0x0a, 0x0a, 0x05, 0x12,
> +                                    0x14, 0x17, 0x13, 0x2c, 0x33, 0x39, =
0x4b, 0x4c, 0x56, 0x61, 0x78, 0x7a,
> +                                    0x41, 0x50, 0x68, 0x73);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x07, 0x10=
, 0x10, 0x1a, 0x26, 0x9e,
> +                                    0x00, 0x4f, 0xa0, 0x14, 0x14, 0x00, =
0x00, 0x00, 0x00, 0x12, 0x0a, 0x02,
> +                                    0x02, 0x00, 0x33, 0x02, 0x04, 0x18, =
0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0x=
7f, 0x11, 0xfd);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00, 0x0=
0, 0x04, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x00, 0x0=
0, 0x00, 0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0,
> +                                    0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, =
0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00=
, 0x2b, 0x01, 0x7e, 0x0f,
> +                                    0x7e, 0x10, 0xa0, 0x00, 0x00, 0x77, =
0x00, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xf2);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x03, 0x=
07, 0x00, 0x10, 0x79);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0xf=
f, 0xff, 0xff, 0xfa, 0xa0,
> +                                    0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfe, 0x01=
, 0xfe, 0x01, 0xfe, 0x01,
> +                                    0x00, 0x00, 0x00, 0x23, 0x00, 0x23, =
0x81, 0x02, 0x40, 0x00, 0x20, 0x6e,
> +                                    0x02, 0x01, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xaa, 0=
xaa, 0xaa, 0xaa, 0xaa, 0xa0,
> +                                    0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, =
0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0,
> +                                    0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0, =
0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0,
> +                                    0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, =
0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xff=
, 0xf8);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0xff, =
0xff, 0xff, 0xff, 0xff, 0xff);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x96);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +       if (dsi_ctx.accum_err)
> +               return dsi_ctx.accum_err;

Since this is a new panel you're adding support for and there's no
excuse that we don't want to change the old command sequence, it seems
like you should add the call to:

hx83102_enable_extended_cmds(&dsi_ctx, false);

If for some reason that would be a bad idea, let me know.

-Doug
