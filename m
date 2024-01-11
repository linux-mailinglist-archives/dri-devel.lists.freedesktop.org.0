Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1255782B509
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 20:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496BD10E985;
	Thu, 11 Jan 2024 19:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E9910E985
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 19:05:18 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5f15a1052b3so52456287b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 11:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704999917; x=1705604717; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70TTwy7LzJ9GVDP1sBtk+/a7RwgjO7meqYg7DVI2Mn4=;
 b=oGgsPnIMpYtBfmK3MxVI7REwVgOizI9mVCN67T3qvrQ48PjasywreZJJ8RkdgsrCYD
 OsOHu06zCYxGMdjZL17KCfM90otLqvxLbpBwOcOcsqPrgg6ejv86sWiLsYPEJQoRZOXL
 nV5uBvwPYoc83Yl2GLHGAM//vwxWgFKxR+GbnGsftGf8SgG9RjRoqeL3QYeQ2lFn+3KT
 DFp1fLADaeruapXvuMJgoJkeWsaWfKqqbVROhzF3aSR4Abt39o6xG2j3aMn58LFrde4h
 r+EPVQJtu/D8Adw04REJWFyWO/89Fg9hGn3kW4b/7xacOZvb3js4FSekTKZX0bDwLkfi
 pGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704999917; x=1705604717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70TTwy7LzJ9GVDP1sBtk+/a7RwgjO7meqYg7DVI2Mn4=;
 b=O2prJ2lDN5+iNwY5RCeLo5M//ogF2OYFcIviUh+E8db+V8bnBmIBuLAIrw/bi/jfoq
 ZxeicI+rjCRmchsMGRLXHjtcevkq54Ne0Qrl+MiE5ShSXpyKAfcGjyDmWNJat4KaH5r8
 fpzsifWvnf9hLEByirkio4gLvagXzxfkD6pJG81pI9XWVLzbe5oYByQi1+Wq8ISOIwEi
 2KhaUAbHIrpOlMQJm+p7l4XUwTy9oSNdHX4IJ8k9Iag0oPpqlo+JPZDYFOiT8nKGKARd
 RAwoENlJymf+jmiaXR6gxDJOEmHgkdVVoptn+8+JrTIgy0hNXP32y+JtXzT2t5yCPYJY
 9bxg==
X-Gm-Message-State: AOJu0YwwuQaZFyFwQZBtHfzU+L5vsve9p+tgopZba0J/OSkwh+lTolCQ
 Ycvg+yYNwx/OtaPNwcHFkq1TRPjoxKHAdnpLVoU0SfIWba4Q6g==
X-Google-Smtp-Source: AGHT+IFMkYvl2Wa5/NCqZqn4cbISrWXSUz1HnKOQORQuB44S6pFNOTZlV/+yw0l5PId0r0Bl0UycfcQ6y7eCvxaNdSU=
X-Received: by 2002:a0d:d5c3:0:b0:5f6:7816:f330 with SMTP id
 x186-20020a0dd5c3000000b005f67816f330mr264155ywd.94.1704999917362; Thu, 11
 Jan 2024 11:05:17 -0800 (PST)
MIME-Version: 1.0
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
 <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
In-Reply-To: <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Jan 2024 20:05:04 +0100
Message-ID: <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
To: Luca Weiss <luca.weiss@fairphone.com>
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
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 4:28=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:

> In some internal documentation it says "LCD Driver IC" "HX83112A" and I
> don't see any reference to Truly 5P65 anywhere.

In the Android directory I pointed to I see this file:
HX83112_Android_Driver/Truly_5p65_module_fw/UpdateFW.bat

(Notice the 5p65 fw dir is *inside* the HX82112 dir)

And in that file:
adb push TRULY_5P65_1080_2160_HX83112A_D01C01.bin
/system/etc/firmware/Himax_firmware.bin

Clearly indicating that they are pushing a Truly 5P65 firmware into
the Himax display firmware directory.

To be fair, that is the driver for the touchscreen part of HX83112A,
but ... Truly is a well known manufacturer of display controllers?

But... given that you have a @fairphone.com mal address and
a working relationship with them, can't you just ask?

> On their website they have this sentence:

All OEMs want to look like everything is their own product. It is
business as usual.

Further on the same note since I guess you have a datasheet)
please bring in #defines for the commands (the first byte in the
write sequences, for examples:

+       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
+       mipi_dsi_dcs_write_seq(dsi, 0xd8,
+                              0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, 0x=
ff,
+                              0xff, 0xff, 0xff, 0xff);
+       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x03);

Clearly 0xbd is HX83112_CMD_SETREGBANK?
(This is easily spotted from the similar structure in the
existing panel-himax-hx8394.c.) So please add #defines
for all commands you know, especially if you have a datasheet
because we reviewers don't have them and "it's just magic
bytes" isn't very compelling. It adds a lot to understanding.

I strongly suspect other Himax displays such as HX8394 to
be using a Truly controller as well, hence the similarities.

In a datasheet for their TFT800480-84-V1-E display controller
Truly kept the init sequence name of void LCD_INIT_HX8290(void)
for example.

Yours,
Linus Walleij
