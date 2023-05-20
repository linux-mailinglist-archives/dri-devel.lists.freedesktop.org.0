Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C69670A4DE
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 05:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFB310E054;
	Sat, 20 May 2023 03:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4811E10E054
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 03:20:49 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64d341bdedcso970690b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 20:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684552848; x=1687144848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a4tdh8ePLgLDYlg1qWsXsqlXcy5M9pT1zUbAFVWK7Gg=;
 b=tKd2SdllyGQeDwfJTs1Rs+Y/rLoqUhvcsL/vQ/ruMMXtt3cGVBlR13FQkjtq31JLW4
 Fh5gjimCEeJvmwOSvn7PGgHfWHokzAtBAX+O1Aey6fg4x7iMjaxTsIrYsky1Qt51ZsId
 RJGW90dWqH6W03XZD5pjCrzWgbFbxYOvp+71zRzSkwoCI2xap4lxnz3VsPlSNr4DNnoZ
 Gb7vE7Z7gSyjoAtE9UnafqUn4YeCZ7BjY85wmuS85M8ROlQ63fM2LZZdEltCiMKXXX3+
 dtsqIOpA4E2SwSovhbg9o+DsqxuxN1HTz+7bzoS1LeA7j7XoXKu/FFpnkWlS/fW/FU6f
 ymnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684552848; x=1687144848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a4tdh8ePLgLDYlg1qWsXsqlXcy5M9pT1zUbAFVWK7Gg=;
 b=kYrVa2NaBJEx0A6og1JPFCT1vMSTDe4lXic/rMKuiNeTfpVCVp8FtQ8UMQyCd04yd7
 9/di0VZnfU9wSYa7hKk6ATmiL5iMsyG3/mpon76dGfFOEciUpT+EZ/yWjiaYnpHprr5G
 cD6aJaJz1x+s0MlUL9vqa5oBpv9jO6NABU5vl04JcejuYYww2V8qGfvs9cZWtKfkZDW1
 yfFRMqh37IXt+WtSF6lxgCMMlmjEEqJ76dCiH/fZ5yZxKI6XRr5N08pcgCHvwJd0VvHM
 ZXzqn3xlT6YkqsQoCf0EpyPTQM9E+KVUopeEnU+wT64CubKMEeAbav+6qaZOuaNWZQDC
 VbjA==
X-Gm-Message-State: AC+VfDxHUvmcixLTmVCqtHwDleg/TDTXXrPuryeFgQmQ6Y0Q7RY4mL9d
 LWIGmo9lbmkHdpcwQ5tvwp2LXRL2hKJ1WD6MuYkTHkzxk7ZgK09unzg=
X-Google-Smtp-Source: ACHHUZ6CsKK6FRMox6dgzEJSIR6b8/3Nwr9vMdV3WHc0RhglsGjvwo/p9JBoyRBlC8MYy0zAf1B/X7uzg7hon+6367w=
X-Received: by 2002:a17:90b:e8f:b0:24e:3b85:a8a with SMTP id
 fv15-20020a17090b0e8f00b0024e3b850a8amr4241466pjb.8.1684552848197; Fri, 19
 May 2023 20:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com>
 <20230519080136.4058243-1-yangcong5@huaqin.corp-partner.google.com>
 <20230519080136.4058243-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230519080136.4058243-3-yangcong5@huaqin.corp-partner.google.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Sat, 20 May 2023 11:20:36 +0800
Message-ID: <CAHwB_NLhgbKHpNswTDZQ-oh0KWBLZHO7JwsDT==Y-p9eiZtCdA@mail.gmail.com>
Subject: Re: [v1 2/2] drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI
 panel
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@google.com, hsinyi@google.com
Content-Type: multipart/alternative; boundary="0000000000001f630705fc1786fe"
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000001f630705fc1786fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,Doug,   Thank you very much for your suggestion. It seems that this
cannot be changed on the hardware(already discussed with vendor, TDDI's IC
design is  this) we really want the touchscreen to power on and off
together with the panel, where the panel is in charge and the touchscreen
always powers on after the panel and powers off before the panel.=3D=3D=3D=
=3D=3D>As
shown in T16 in the datasheet, the current TDDI IC not only depends on the
power supply (the 1.8V power supply uses the same power supply for the
touch driver and the panel driver)=EF=BC=8C also depends on the RST state o=
f the
panel. Only when the RST state is high touch HID can ready.

On Fri, May 19, 2023 at 4:02=E2=80=AFPM Cong Yang <
yangcong5@huaqin.corp-partner.google.com> wrote:

> The Starry-ili9882 panel also is a TDDI IC. From the datasheet,panel
> need the RST signal is high when touch communicate and also MIPI needs
> to keep the LP11 state before the lcm_reset pin is pulled high. So add
> enable_gpio_init_value and lp11_before_reset flag.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ++++++++++++++++++
>  1 file changed, 371 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 7aaa85b0de8a..8d564df6e5e3 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -146,6 +146,344 @@ static const struct panel_init_cmd
> starry_himax83102_j02_init_cmd[] =3D {
>         {},
>  };
>
> +static const struct panel_init_cmd starry_ili9882t_init_cmd[] =3D {
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x01),
> +       _INIT_DCS_CMD(0x00, 0x42),
> +       _INIT_DCS_CMD(0x01, 0x11),
> +       _INIT_DCS_CMD(0x02, 0x00),
> +       _INIT_DCS_CMD(0x03, 0x00),
> +
> +       _INIT_DCS_CMD(0x04, 0x01),
> +       _INIT_DCS_CMD(0x05, 0x11),
> +       _INIT_DCS_CMD(0x06, 0x00),
> +       _INIT_DCS_CMD(0x07, 0x00),
> +
> +       _INIT_DCS_CMD(0x08, 0x80),
> +       _INIT_DCS_CMD(0x09, 0x81),
> +       _INIT_DCS_CMD(0x0A, 0x71),
> +       _INIT_DCS_CMD(0x0B, 0x00),
> +
> +       _INIT_DCS_CMD(0x0C, 0x00),
> +       _INIT_DCS_CMD(0x0E, 0x1A),
> +
> +       _INIT_DCS_CMD(0x24, 0x00),
> +       _INIT_DCS_CMD(0x25, 0x00),
> +       _INIT_DCS_CMD(0x26, 0x00),
> +       _INIT_DCS_CMD(0x27, 0x00),
> +
> +       _INIT_DCS_CMD(0x2C, 0xD4),
> +       _INIT_DCS_CMD(0xB9, 0x40),
> +
> +       _INIT_DCS_CMD(0xB0, 0x11),
> +
> +       _INIT_DCS_CMD(0xE6, 0x32),
> +       _INIT_DCS_CMD(0xD1, 0x30),
> +
> +       _INIT_DCS_CMD(0xD6, 0x55),
> +
> +       _INIT_DCS_CMD(0xD0, 0x01),
> +       _INIT_DCS_CMD(0xE3, 0x93),
> +       _INIT_DCS_CMD(0xE4, 0x00),
> +       _INIT_DCS_CMD(0xE5, 0x80),
> +
> +       _INIT_DCS_CMD(0x31, 0x07),
> +       _INIT_DCS_CMD(0x32, 0x07),
> +       _INIT_DCS_CMD(0x33, 0x07),
> +       _INIT_DCS_CMD(0x34, 0x07),
> +       _INIT_DCS_CMD(0x35, 0x07),
> +       _INIT_DCS_CMD(0x36, 0x01),
> +       _INIT_DCS_CMD(0x37, 0x00),
> +       _INIT_DCS_CMD(0x38, 0x28),
> +       _INIT_DCS_CMD(0x39, 0x29),
> +       _INIT_DCS_CMD(0x3A, 0x11),
> +       _INIT_DCS_CMD(0x3B, 0x13),
> +       _INIT_DCS_CMD(0x3C, 0x15),
> +       _INIT_DCS_CMD(0x3D, 0x17),
> +       _INIT_DCS_CMD(0x3E, 0x09),
> +       _INIT_DCS_CMD(0x3F, 0x0D),
> +       _INIT_DCS_CMD(0x40, 0x02),
> +       _INIT_DCS_CMD(0x41, 0x02),
> +       _INIT_DCS_CMD(0x42, 0x02),
> +       _INIT_DCS_CMD(0x43, 0x02),
> +       _INIT_DCS_CMD(0x44, 0x02),
> +       _INIT_DCS_CMD(0x45, 0x02),
> +       _INIT_DCS_CMD(0x46, 0x02),
> +
> +       _INIT_DCS_CMD(0x47, 0x07),
> +       _INIT_DCS_CMD(0x48, 0x07),
> +       _INIT_DCS_CMD(0x49, 0x07),
> +       _INIT_DCS_CMD(0x4A, 0x07),
> +       _INIT_DCS_CMD(0x4B, 0x07),
> +       _INIT_DCS_CMD(0x4C, 0x01),
> +       _INIT_DCS_CMD(0x4D, 0x00),
> +       _INIT_DCS_CMD(0x4E, 0x28),
> +       _INIT_DCS_CMD(0x4F, 0x29),
> +       _INIT_DCS_CMD(0x50, 0x10),
> +       _INIT_DCS_CMD(0x51, 0x12),
> +       _INIT_DCS_CMD(0x52, 0x14),
> +       _INIT_DCS_CMD(0x53, 0x16),
> +       _INIT_DCS_CMD(0x54, 0x08),
> +       _INIT_DCS_CMD(0x55, 0x0C),
> +       _INIT_DCS_CMD(0x56, 0x02),
> +       _INIT_DCS_CMD(0x57, 0x02),
> +       _INIT_DCS_CMD(0x58, 0x02),
> +       _INIT_DCS_CMD(0x59, 0x02),
> +       _INIT_DCS_CMD(0x5A, 0x02),
> +       _INIT_DCS_CMD(0x5B, 0x02),
> +       _INIT_DCS_CMD(0x5C, 0x02),
> +
> +       _INIT_DCS_CMD(0x61, 0x07),
> +       _INIT_DCS_CMD(0x62, 0x07),
> +       _INIT_DCS_CMD(0x63, 0x07),
> +       _INIT_DCS_CMD(0x64, 0x07),
> +       _INIT_DCS_CMD(0x65, 0x07),
> +       _INIT_DCS_CMD(0x66, 0x01),
> +       _INIT_DCS_CMD(0x67, 0x00),
> +       _INIT_DCS_CMD(0x68, 0x28),
> +       _INIT_DCS_CMD(0x69, 0x29),
> +       _INIT_DCS_CMD(0x6A, 0x16),
> +       _INIT_DCS_CMD(0x6B, 0x14),
> +       _INIT_DCS_CMD(0x6C, 0x12),
> +       _INIT_DCS_CMD(0x6D, 0x10),
> +       _INIT_DCS_CMD(0x6E, 0x0C),
> +       _INIT_DCS_CMD(0x6F, 0x08),
> +       _INIT_DCS_CMD(0x70, 0x02),
> +       _INIT_DCS_CMD(0x71, 0x02),
> +       _INIT_DCS_CMD(0x72, 0x02),
> +       _INIT_DCS_CMD(0x73, 0x02),
> +       _INIT_DCS_CMD(0x74, 0x02),
> +       _INIT_DCS_CMD(0x75, 0x02),
> +       _INIT_DCS_CMD(0x76, 0x02),
> +
> +       _INIT_DCS_CMD(0x77, 0x07),
> +       _INIT_DCS_CMD(0x78, 0x07),
> +       _INIT_DCS_CMD(0x79, 0x07),
> +       _INIT_DCS_CMD(0x7A, 0x07),
> +       _INIT_DCS_CMD(0x7B, 0x07),
> +       _INIT_DCS_CMD(0x7C, 0x01),
> +       _INIT_DCS_CMD(0x7D, 0x00),
> +       _INIT_DCS_CMD(0x7E, 0x28),
> +       _INIT_DCS_CMD(0x7F, 0x29),
> +       _INIT_DCS_CMD(0x80, 0x17),
> +       _INIT_DCS_CMD(0x81, 0x15),
> +       _INIT_DCS_CMD(0x82, 0x13),
> +       _INIT_DCS_CMD(0x83, 0x11),
> +       _INIT_DCS_CMD(0x84, 0x0D),
> +       _INIT_DCS_CMD(0x85, 0x09),
> +       _INIT_DCS_CMD(0x86, 0x02),
> +       _INIT_DCS_CMD(0x87, 0x07),
> +       _INIT_DCS_CMD(0x88, 0x07),
> +       _INIT_DCS_CMD(0x89, 0x07),
> +       _INIT_DCS_CMD(0x8A, 0x07),
> +       _INIT_DCS_CMD(0x8B, 0x07),
> +       _INIT_DCS_CMD(0x8C, 0x07),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x02),
> +       _INIT_DCS_CMD(0x29, 0x3A),
> +       _INIT_DCS_CMD(0x2A, 0x3B),
> +
> +       _INIT_DCS_CMD(0x06, 0x01),
> +       _INIT_DCS_CMD(0x07, 0x01),
> +       _INIT_DCS_CMD(0x08, 0x0C),
> +       _INIT_DCS_CMD(0x09, 0x44),
> +
> +       _INIT_DCS_CMD(0x3C, 0x0A),
> +       _INIT_DCS_CMD(0x39, 0x11),
> +       _INIT_DCS_CMD(0x3D, 0x00),
> +       _INIT_DCS_CMD(0x3A, 0x0C),
> +       _INIT_DCS_CMD(0x3B, 0x44),
> +
> +       _INIT_DCS_CMD(0x53, 0x1F),
> +       _INIT_DCS_CMD(0x5E, 0x40),
> +       _INIT_DCS_CMD(0x84, 0x00),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x03),
> +       _INIT_DCS_CMD(0x20, 0x01),
> +       _INIT_DCS_CMD(0x21, 0x3C),
> +       _INIT_DCS_CMD(0x22, 0xFA),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0A),
> +       _INIT_DCS_CMD(0xE0, 0x01),
> +       _INIT_DCS_CMD(0xE2, 0x01),
> +       _INIT_DCS_CMD(0xE5, 0x91),
> +       _INIT_DCS_CMD(0xE6, 0x3C),
> +       _INIT_DCS_CMD(0xE7, 0x00),
> +       _INIT_DCS_CMD(0xE8, 0xFA),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x12),
> +       _INIT_DCS_CMD(0x87, 0x2C),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x05),
> +       _INIT_DCS_CMD(0x73, 0xE5),
> +       _INIT_DCS_CMD(0x7F, 0x6B),
> +       _INIT_DCS_CMD(0x6D, 0xA4),
> +       _INIT_DCS_CMD(0x79, 0x54),
> +       _INIT_DCS_CMD(0x69, 0x97),
> +       _INIT_DCS_CMD(0x6A, 0x97),
> +       _INIT_DCS_CMD(0xA5, 0x3F),
> +       _INIT_DCS_CMD(0x61, 0xDA),
> +       _INIT_DCS_CMD(0xA7, 0xF1),
> +       _INIT_DCS_CMD(0x5F, 0x01),
> +       _INIT_DCS_CMD(0x62, 0x3F),
> +       _INIT_DCS_CMD(0x1D, 0x90),
> +       _INIT_DCS_CMD(0x86, 0x87),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x06),
> +       _INIT_DCS_CMD(0xC0, 0x80),
> +       _INIT_DCS_CMD(0xC1, 0x07),
> +       _INIT_DCS_CMD(0xCA, 0x58),
> +       _INIT_DCS_CMD(0xCB, 0x02),
> +       _INIT_DCS_CMD(0xCE, 0x58),
> +       _INIT_DCS_CMD(0xCF, 0x02),
> +       _INIT_DCS_CMD(0x67, 0x60),
> +       _INIT_DCS_CMD(0x10, 0x00),
> +       _INIT_DCS_CMD(0x92, 0x22),
> +       _INIT_DCS_CMD(0xD3, 0x08),
> +       _INIT_DCS_CMD(0xD6, 0x55),
> +       _INIT_DCS_CMD(0xDC, 0x38),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x08),
> +       _INIT_DCS_CMD(0xE0, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0x56, 0x6A,
> 0x6E, 0x79, 0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, 0xBB, 0xCE, 0xC6,
> 0xBD, 0xD5, 0xE2, 0xE8),
> +       _INIT_DCS_CMD(0xE1, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0x56, 0x6A,
> 0x6E, 0x79, 0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, 0xBB, 0xCE, 0xC6,
> 0xBD, 0xD5, 0xE2, 0xE8),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x04),
> +       _INIT_DCS_CMD(0xBA, 0x81),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0C),
> +       _INIT_DCS_CMD(0x00, 0x02),
> +       _INIT_DCS_CMD(0x01, 0x00),
> +       _INIT_DCS_CMD(0x02, 0x03),
> +       _INIT_DCS_CMD(0x03, 0x01),
> +       _INIT_DCS_CMD(0x04, 0x03),
> +       _INIT_DCS_CMD(0x05, 0x02),
> +       _INIT_DCS_CMD(0x06, 0x04),
> +       _INIT_DCS_CMD(0x07, 0x03),
> +       _INIT_DCS_CMD(0x08, 0x03),
> +       _INIT_DCS_CMD(0x09, 0x04),
> +       _INIT_DCS_CMD(0x0A, 0x04),
> +       _INIT_DCS_CMD(0x0B, 0x05),
> +       _INIT_DCS_CMD(0x0C, 0x04),
> +       _INIT_DCS_CMD(0x0D, 0x06),
> +       _INIT_DCS_CMD(0x0E, 0x05),
> +       _INIT_DCS_CMD(0x0F, 0x07),
> +       _INIT_DCS_CMD(0x10, 0x04),
> +       _INIT_DCS_CMD(0x11, 0x08),
> +       _INIT_DCS_CMD(0x12, 0x05),
> +       _INIT_DCS_CMD(0x13, 0x09),
> +       _INIT_DCS_CMD(0x14, 0x05),
> +       _INIT_DCS_CMD(0x15, 0x0A),
> +       _INIT_DCS_CMD(0x16, 0x06),
> +       _INIT_DCS_CMD(0x17, 0x0B),
> +       _INIT_DCS_CMD(0x18, 0x05),
> +       _INIT_DCS_CMD(0x19, 0x0C),
> +       _INIT_DCS_CMD(0x1A, 0x06),
> +       _INIT_DCS_CMD(0x1B, 0x0D),
> +       _INIT_DCS_CMD(0x1C, 0x06),
> +       _INIT_DCS_CMD(0x1D, 0x0E),
> +       _INIT_DCS_CMD(0x1E, 0x07),
> +       _INIT_DCS_CMD(0x1F, 0x0F),
> +       _INIT_DCS_CMD(0x20, 0x06),
> +       _INIT_DCS_CMD(0x21, 0x10),
> +       _INIT_DCS_CMD(0x22, 0x07),
> +       _INIT_DCS_CMD(0x23, 0x11),
> +       _INIT_DCS_CMD(0x24, 0x07),
> +       _INIT_DCS_CMD(0x25, 0x12),
> +       _INIT_DCS_CMD(0x26, 0x08),
> +       _INIT_DCS_CMD(0x27, 0x13),
> +       _INIT_DCS_CMD(0x28, 0x07),
> +       _INIT_DCS_CMD(0x29, 0x14),
> +       _INIT_DCS_CMD(0x2A, 0x08),
> +       _INIT_DCS_CMD(0x2B, 0x15),
> +       _INIT_DCS_CMD(0x2C, 0x08),
> +       _INIT_DCS_CMD(0x2D, 0x16),
> +       _INIT_DCS_CMD(0x2E, 0x09),
> +       _INIT_DCS_CMD(0x2F, 0x17),
> +       _INIT_DCS_CMD(0x30, 0x08),
> +       _INIT_DCS_CMD(0x31, 0x18),
> +       _INIT_DCS_CMD(0x32, 0x09),
> +       _INIT_DCS_CMD(0x33, 0x19),
> +       _INIT_DCS_CMD(0x34, 0x09),
> +       _INIT_DCS_CMD(0x35, 0x1A),
> +       _INIT_DCS_CMD(0x36, 0x0A),
> +       _INIT_DCS_CMD(0x37, 0x1B),
> +       _INIT_DCS_CMD(0x38, 0x0A),
> +       _INIT_DCS_CMD(0x39, 0x1C),
> +       _INIT_DCS_CMD(0x3A, 0x0A),
> +       _INIT_DCS_CMD(0x3B, 0x1D),
> +       _INIT_DCS_CMD(0x3C, 0x0A),
> +       _INIT_DCS_CMD(0x3D, 0x1E),
> +       _INIT_DCS_CMD(0x3E, 0x0A),
> +       _INIT_DCS_CMD(0x3F, 0x1F),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x04),
> +       _INIT_DCS_CMD(0xBA, 0x01),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0E),
> +       _INIT_DCS_CMD(0x02, 0x0C),
> +       _INIT_DCS_CMD(0x20, 0x10),
> +       _INIT_DCS_CMD(0x25, 0x16),
> +       _INIT_DCS_CMD(0x26, 0xE0),
> +       _INIT_DCS_CMD(0x27, 0x00),
> +       _INIT_DCS_CMD(0x29, 0x71),
> +       _INIT_DCS_CMD(0x2A, 0x46),
> +       _INIT_DCS_CMD(0x2B, 0x1F),
> +       _INIT_DCS_CMD(0x2D, 0xC7),
> +       _INIT_DCS_CMD(0x31, 0x02),
> +       _INIT_DCS_CMD(0x32, 0xDF),
> +       _INIT_DCS_CMD(0x33, 0x5A),
> +       _INIT_DCS_CMD(0x34, 0xC0),
> +       _INIT_DCS_CMD(0x35, 0x5A),
> +       _INIT_DCS_CMD(0x36, 0xC0),
> +       _INIT_DCS_CMD(0x38, 0x65),
> +       _INIT_DCS_CMD(0x80, 0x3E),
> +       _INIT_DCS_CMD(0x81, 0xA0),
> +       _INIT_DCS_CMD(0xB0, 0x01),
> +       _INIT_DCS_CMD(0xB1, 0xCC),
> +       _INIT_DCS_CMD(0xC0, 0x12),
> +       _INIT_DCS_CMD(0xC2, 0xCC),
> +       _INIT_DCS_CMD(0xC3, 0xCC),
> +       _INIT_DCS_CMD(0xC4, 0xCC),
> +       _INIT_DCS_CMD(0xC5, 0xCC),
> +       _INIT_DCS_CMD(0xC6, 0xCC),
> +       _INIT_DCS_CMD(0xC7, 0xCC),
> +       _INIT_DCS_CMD(0xC8, 0xCC),
> +       _INIT_DCS_CMD(0xC9, 0xCC),
> +       _INIT_DCS_CMD(0x30, 0x00),
> +       _INIT_DCS_CMD(0x00, 0x81),
> +       _INIT_DCS_CMD(0x08, 0x02),
> +       _INIT_DCS_CMD(0x09, 0x00),
> +       _INIT_DCS_CMD(0x07, 0x21),
> +       _INIT_DCS_CMD(0x04, 0x10),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x1E),
> +       _INIT_DCS_CMD(0x60, 0x00),
> +       _INIT_DCS_CMD(0x64, 0x00),
> +       _INIT_DCS_CMD(0x6D, 0x00),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0B),
> +       _INIT_DCS_CMD(0xA6, 0x44),
> +       _INIT_DCS_CMD(0xA7, 0xB6),
> +       _INIT_DCS_CMD(0xA8, 0x03),
> +       _INIT_DCS_CMD(0xA9, 0x03),
> +       _INIT_DCS_CMD(0xAA, 0x51),
> +       _INIT_DCS_CMD(0xAB, 0x51),
> +       _INIT_DCS_CMD(0xAC, 0x04),
> +       _INIT_DCS_CMD(0xBD, 0x92),
> +       _INIT_DCS_CMD(0xBE, 0xA1),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x05),
> +       _INIT_DCS_CMD(0x86, 0x87),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x06),
> +       _INIT_DCS_CMD(0x92, 0x22),
> +
> +       _INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x00),
> +       _INIT_DCS_CMD(0x11),
> +       _INIT_DELAY_CMD(120),
> +       _INIT_DCS_CMD(0x29),
> +       {},
> +};
> +
>  static const struct panel_init_cmd boe_tv110c9m_init_cmd[] =3D {
>         _INIT_DCS_CMD(0xFF, 0x20),
>         _INIT_DCS_CMD(0xFB, 0x01),
> @@ -1796,6 +2134,36 @@ static const struct panel_desc
> starry_himax83102_j02_desc =3D {
>         .enable_gpio_init_value =3D 1,
>         .lp11_before_reset =3D true,
>  };
> +
> +static const struct drm_display_mode starry_ili9882t_default_mode =3D {
> +       .clock =3D 165280,
> +       .hdisplay =3D 1200,
> +       .hsync_start =3D 1200 + 32,
> +       .hsync_end =3D 1200 + 32 + 30,
> +       .htotal =3D 1200 + 32 + 30 + 32,
> +       .vdisplay =3D 1920,
> +       .vsync_start =3D 1920 + 68,
> +       .vsync_end =3D 1920 + 68 + 2,
> +       .vtotal =3D 1920 + 68 + 2 + 10,
> +       .type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc starry_ili9882t_desc =3D {
> +       .modes =3D &starry_ili9882t_default_mode,
> +       .bpc =3D 8,
> +       .size =3D {
> +               .width_mm =3D 141,
> +               .height_mm =3D 226,
> +       },
> +       .lanes =3D 4,
> +       .format =3D MIPI_DSI_FMT_RGB888,
> +       .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PU=
LSE
> |
> +                     MIPI_DSI_MODE_LPM,
> +       .init_cmds =3D starry_ili9882t_init_cmd,
> +       .enable_gpio_init_value =3D 1,
> +       .lp11_before_reset =3D true,
> +};
> +
>  static int boe_panel_get_modes(struct drm_panel *panel,
>                                struct drm_connector *connector)
>  {
> @@ -1972,6 +2340,9 @@ static const struct of_device_id boe_of_match[] =3D=
 {
>         { .compatible =3D "starry,himax83102-j02",
>           .data =3D &starry_himax83102_j02_desc
>         },
> +       { .compatible =3D "starry,ili9882t",
> +         .data =3D &starry_ili9882t_desc
> +       },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, boe_of_match);
> --
> 2.25.1
>
>

--0000000000001f630705fc1786fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(31,31,31);font-family:&quot;Googl=
e Sans&quot;,Roboto,Arial,sans-serif;font-size:14px;font-variant-ligatures:=
no-contextual;white-space:pre-wrap;background-color:rgba(68,71,70,0.08)">Hi=
,Doug,
=C2=A0 Thank you very much for your suggestion. It seems that this cannot b=
e changed on the hardware(a</span>lready discussed with vendor, TDDI&#39;s =
IC design is=C2=A0 this)<span style=3D"color:rgb(31,31,31);font-family:&quo=
t;Google Sans&quot;,Roboto,Arial,sans-serif;font-size:14px;font-variant-lig=
atures:no-contextual;white-space:pre-wrap;background-color:rgba(68,71,70,0.=
08)">
we really want the touchscreen to power on and off together with the panel,=
 where the panel is in charge and the touchscreen always powers on after th=
e panel and powers off before the panel.=3D=3D=3D=3D=3D&gt;As shown in T16 =
in the datasheet, the current TDDI IC not only depends on the power supply =
(the 1.8V power supply uses the same power supply for the touch driver and =
the panel driver)=EF=BC=8C also </span><span style=3D"color:rgb(31,31,31);f=
ont-family:&quot;Google Sans&quot;,Roboto,Arial,sans-serif;font-size:14px;f=
ont-variant-ligatures:no-contextual;white-space:pre-wrap;background-color:r=
gba(68,71,70,0.08)">depends </span><span style=3D"color:rgb(31,31,31);font-=
family:&quot;Google Sans&quot;,Roboto,Arial,sans-serif;font-size:14px;font-=
variant-ligatures:no-contextual;white-space:pre-wrap;background-color:rgba(=
68,71,70,0.08)">on the RST state of the panel. Only when the RST state is h=
igh  touch HID </span><span style=3D"color:rgb(31,31,31);font-family:&quot;=
Google Sans&quot;,Roboto,Arial,sans-serif;font-size:14px;font-variant-ligat=
ures:no-contextual;white-space:pre-wrap;background-color:rgba(68,71,70,0.08=
)">can </span><span style=3D"color:rgb(31,31,31);font-family:&quot;Google S=
ans&quot;,Roboto,Arial,sans-serif;font-size:14px;font-variant-ligatures:no-=
contextual;white-space:pre-wrap;background-color:rgba(68,71,70,0.08)">ready=
.</span><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Fri, May 19, 2023 at 4:02=E2=80=AFPM Cong Yang &lt;<a href=
=3D"mailto:yangcong5@huaqin.corp-partner.google.com">yangcong5@huaqin.corp-=
partner.google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">The Starry-ili9882 panel also is a TDDI IC. From the data=
sheet,panel<br>
need the RST signal is high when touch communicate and also MIPI needs<br>
to keep the LP11 state before the lcm_reset pin is pulled high. So add<br>
enable_gpio_init_value and lp11_before_reset flag.<br>
<br>
Signed-off-by: Cong Yang &lt;<a href=3D"mailto:yangcong5@huaqin.corp-partne=
r.google.com" target=3D"_blank">yangcong5@huaqin.corp-partner.google.com</a=
>&gt;<br>
---<br>
=C2=A0.../gpu/drm/panel/panel-boe-tv101wum-nl6.c=C2=A0 =C2=A0 | 371 +++++++=
+++++++++++<br>
=C2=A01 file changed, 371 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/d=
rm/panel/panel-boe-tv101wum-nl6.c<br>
index 7aaa85b0de8a..8d564df6e5e3 100644<br>
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c<br>
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c<br>
@@ -146,6 +146,344 @@ static const struct panel_init_cmd starry_himax83102_=
j02_init_cmd[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {},<br>
=C2=A0};<br>
<br>
+static const struct panel_init_cmd starry_ili9882t_init_cmd[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x00, 0x42),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x01, 0x11),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x02, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x03, 0x00),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x04, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x05, 0x11),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x06, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x07, 0x00),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x08, 0x80),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x09, 0x81),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0A, 0x71),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0B, 0x00),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0C, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0E, 0x1A),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x24, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x25, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x26, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x27, 0x00),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2C, 0xD4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xB9, 0x40),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xB0, 0x11),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE6, 0x32),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD1, 0x30),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD6, 0x55),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD0, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE3, 0x93),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE4, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE5, 0x80),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x31, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x32, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x33, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x34, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x35, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x36, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x37, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x38, 0x28),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x39, 0x29),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3A, 0x11),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3B, 0x13),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3C, 0x15),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3D, 0x17),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3E, 0x09),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3F, 0x0D),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x40, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x41, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x42, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x43, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x44, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x45, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x46, 0x02),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x47, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x48, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x49, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x4A, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x4B, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x4C, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x4D, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x4E, 0x28),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x4F, 0x29),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x50, 0x10),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x51, 0x12),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x52, 0x14),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x53, 0x16),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x54, 0x08),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x55, 0x0C),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x56, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x57, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x58, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x59, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x5A, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x5B, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x5C, 0x02),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x61, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x62, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x63, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x64, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x65, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x66, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x67, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x68, 0x28),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x69, 0x29),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x6A, 0x16),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x6B, 0x14),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x6C, 0x12),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x6D, 0x10),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x6E, 0x0C),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x6F, 0x08),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x70, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x71, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x72, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x73, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x74, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x75, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x76, 0x02),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x77, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x78, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x79, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x7A, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x7B, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x7C, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x7D, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x7E, 0x28),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x7F, 0x29),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x80, 0x17),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x81, 0x15),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x82, 0x13),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x83, 0x11),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x84, 0x0D),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x85, 0x09),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x86, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x87, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x88, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x89, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x8A, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x8B, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x8C, 0x07),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x29, 0x3A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2A, 0x3B),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x06, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x07, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x08, 0x0C),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x09, 0x44),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3C, 0x0A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x39, 0x11),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3D, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3A, 0x0C),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3B, 0x44),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x53, 0x1F),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x5E, 0x40),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x84, 0x00),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x03),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x20, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x21, 0x3C),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x22, 0xFA),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE0, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE2, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE5, 0x91),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE6, 0x3C),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE7, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE8, 0xFA),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x12),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x87, 0x2C),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x05),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x73, 0xE5),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x7F, 0x6B),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x6D, 0xA4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x79, 0x54),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x69, 0x97),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x6A, 0x97),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xA5, 0x3F),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x61, 0xDA),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xA7, 0xF1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x5F, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x62, 0x3F),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x1D, 0x90),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x86, 0x87),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x06),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC0, 0x80),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC1, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xCA, 0x58),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xCB, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xCE, 0x58),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xCF, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x67, 0x60),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x10, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x92, 0x22),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD3, 0x08),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xD6, 0x55),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xDC, 0x38),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x08),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE0, 0x00, 0x10, 0x2A, 0x4D, 0x6=
1, 0x56, 0x6A, 0x6E, 0x79, 0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, 0xBB, =
0xCE, 0xC6, 0xBD, 0xD5, 0xE2, 0xE8),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xE1, 0x00, 0x10, 0x2A, 0x4D, 0x6=
1, 0x56, 0x6A, 0x6E, 0x79, 0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, 0xBB, =
0xCE, 0xC6, 0xBD, 0xD5, 0xE2, 0xE8),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x04),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBA, 0x81),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0C),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x00, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x01, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x02, 0x03),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x03, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x04, 0x03),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x05, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x06, 0x04),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x07, 0x03),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x08, 0x03),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x09, 0x04),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0A, 0x04),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0B, 0x05),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0C, 0x04),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0D, 0x06),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0E, 0x05),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x0F, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x10, 0x04),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x11, 0x08),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x12, 0x05),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x13, 0x09),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x14, 0x05),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x15, 0x0A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x16, 0x06),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x17, 0x0B),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x18, 0x05),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x19, 0x0C),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x1A, 0x06),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x1B, 0x0D),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x1C, 0x06),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x1D, 0x0E),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x1E, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x1F, 0x0F),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x20, 0x06),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x21, 0x10),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x22, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x23, 0x11),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x24, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x25, 0x12),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x26, 0x08),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x27, 0x13),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x28, 0x07),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x29, 0x14),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2A, 0x08),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2B, 0x15),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2C, 0x08),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2D, 0x16),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2E, 0x09),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2F, 0x17),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x30, 0x08),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x31, 0x18),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x32, 0x09),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x33, 0x19),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x34, 0x09),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x35, 0x1A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x36, 0x0A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x37, 0x1B),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x38, 0x0A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x39, 0x1C),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3A, 0x0A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3B, 0x1D),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3C, 0x0A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3D, 0x1E),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3E, 0x0A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3F, 0x1F),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x04),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBA, 0x01),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0E),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x02, 0x0C),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x20, 0x10),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x25, 0x16),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x26, 0xE0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x27, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x29, 0x71),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2A, 0x46),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2B, 0x1F),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x2D, 0xC7),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x31, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x32, 0xDF),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x33, 0x5A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x34, 0xC0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x35, 0x5A),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x36, 0xC0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x38, 0x65),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x80, 0x3E),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x81, 0xA0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xB0, 0x01),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xB1, 0xCC),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC0, 0x12),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC2, 0xCC),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC3, 0xCC),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC4, 0xCC),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC5, 0xCC),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC6, 0xCC),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC7, 0xCC),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC8, 0xCC),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xC9, 0xCC),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x30, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x00, 0x81),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x08, 0x02),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x09, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x07, 0x21),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x04, 0x10),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x1E),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x60, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x64, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x6D, 0x00),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0B),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xA6, 0x44),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xA7, 0xB6),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xA8, 0x03),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xA9, 0x03),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xAA, 0x51),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xAB, 0x51),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xAC, 0x04),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBD, 0x92),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xBE, 0xA1),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x05),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x86, 0x87),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x06),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x92, 0x22),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x11),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DELAY_CMD(120),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x29),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{},<br>
+};<br>
+<br>
=C2=A0static const struct panel_init_cmd boe_tv110c9m_init_cmd[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 _INIT_DCS_CMD(0xFF, 0x20),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 _INIT_DCS_CMD(0xFB, 0x01),<br>
@@ -1796,6 +2134,36 @@ static const struct panel_desc starry_himax83102_j02=
_desc =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .enable_gpio_init_value =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .lp11_before_reset =3D true,<br>
=C2=A0};<br>
+<br>
+static const struct drm_display_mode starry_ili9882t_default_mode =3D {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.clock =3D 165280,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hdisplay =3D 1200,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_start =3D 1200 + 32,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_end =3D 1200 + 32 + 30,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.htotal =3D 1200 + 32 + 30 + 32,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vdisplay =3D 1920,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_start =3D 1920 + 68,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_end =3D 1920 + 68 + 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vtotal =3D 1920 + 68 + 2 + 10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_=
PREFERRED,<br>
+};<br>
+<br>
+static const struct panel_desc starry_ili9882t_desc =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.modes =3D &amp;starry_ili9882t_default_mode,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bpc =3D 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.width_mm =3D 141,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.height_mm =3D 226,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.lanes =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.format =3D MIPI_DSI_FMT_RGB888,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_=
MODE_VIDEO_SYNC_PULSE |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MIPI_DSI_MODE_LPM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.init_cmds =3D starry_ili9882t_init_cmd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable_gpio_init_value =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.lp11_before_reset =3D true,<br>
+};<br>
+<br>
=C2=A0static int boe_panel_get_modes(struct drm_panel *panel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector)<br>
=C2=A0{<br>
@@ -1972,6 +2340,9 @@ static const struct of_device_id boe_of_match[] =3D {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;starry,himax83102-j02&q=
uot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &amp;starry_himax83102_j02_des=
c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;starry,ili9882t&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;starry_ili9882t_desc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { /* sentinel */ }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(of, boe_of_match);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000001f630705fc1786fe--
