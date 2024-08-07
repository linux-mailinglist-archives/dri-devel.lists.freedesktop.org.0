Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D394A2BB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 10:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6769610E458;
	Wed,  7 Aug 2024 08:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="elIQlNeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF86C10E458
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 08:26:44 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4281d812d3eso14336505e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723019203; x=1723624003;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JZHByOv0mOQel4KMBZjJK3uZiiCwuwlf50RnLCFOcRk=;
 b=elIQlNeZFQ4y//evdq524KcLhz7kN0SPKxzJPHO/BzvK9PFt4S1A/OjQZqtORAxokv
 EXrXBtDxPocI6Kw5ePNPTeYJzt+g+EJRhAGZb4rDk5dE7bO8TZHa51EF1p7wXn+EEEG0
 KpfbycwMKfjtZCY+zYUPAYNU0SoedH+fe9qXjRTuEe9VHITqtR/rztekBeTiYf2BXvyS
 vBNkpOt9PYcKsUHiAjYC8HY5KSzx5RZw6XZ5KxYPbWpEGav4WDYSuNU+hHtQMZePwAX1
 evQwe7wbF33IaECrtPS+1nWDbeAC65NoQ7hSk0QKxadxDRXYidoUDBtn7BZlIFgfTHDa
 vOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723019203; x=1723624003;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZHByOv0mOQel4KMBZjJK3uZiiCwuwlf50RnLCFOcRk=;
 b=SUwOr1OXXc24kzmmE9xgp8awS5qoT07l6KjtRzRnU05y3nLJcu9b0vC00KInU/4d45
 qivg0m4o0NBmu9lBga1R4LQaA+05oiMymLqga+U3cdnktLAQUrGshmVfmrMgS2aYlvpg
 MOzAdlke46q2UAiiYWCPCLJCvmxbWgZqJytbpQwXTeMNbnF5TVTm+SCPrn9YP7ElMZUF
 SmH7InC1zj25EfU603LCmqt0S2OsHtLw1T5F6+TuSGpacDRRjEcXjl/XwcI62yPkFHn3
 prAsts3AnzVysPTeZbWZJBPYp0iZdztG7pvA6cPSYvnUWbjHrcRRCIOL/uqMOXd6QE/L
 5tqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsPopn1OiiCUctX9pbtSSufS5qeosR7zRtKN0FEUkBh+bIc4TQwSjuy/5S01uBQe0zY+Lz29GIKLCU60gYxcfIZTtsQ5nmVzjilUPfwHoo
X-Gm-Message-State: AOJu0YytTZtqUXHu261lf7APwBNGizcL4P20ZYABGk7QA7XvaBFNB9Mm
 asE/b+2ght+9SGi1wqZtlEqnX5NDwNKyENPUW9k7r8vAF/uininLEqUTxtKIXmI=
X-Google-Smtp-Source: AGHT+IFz38MFkpvdt0BKpKNIiKOyIyBho+s/Gh9rbf8GDZAtKNc/QE+/bIeiT1DD/pgoorf5EawALA==
X-Received: by 2002:a5d:5510:0:b0:368:6606:bd01 with SMTP id
 ffacd0b85a97d-36bbc1c4abfmr13978046f8f.55.1723019203144; 
 Wed, 07 Aug 2024 01:26:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4290580cb80sm18381625e9.45.2024.08.07.01.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 01:26:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  Kevin Hilman
 <khilman@baylibre.com>,  dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] drm/meson: dw-hdmi: split resets out of hw init.
In-Reply-To: <CAFBinCCvWFCCvb9gPvv0-eudG=iuKROk5rPSiorKTnHcToDfTQ@mail.gmail.com>
 (Martin Blumenstingl's message of "Tue, 6 Aug 2024 22:49:40 +0200")
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-6-jbrunet@baylibre.com>
 <CAFBinCCvWFCCvb9gPvv0-eudG=iuKROk5rPSiorKTnHcToDfTQ@mail.gmail.com>
Date: Wed, 07 Aug 2024 10:26:42 +0200
Message-ID: <1ja5hozqkd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tue 06 Aug 2024 at 22:49, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hi Jerome,
>
> On Tue, Jul 30, 2024 at 2:50=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.c=
om> wrote:
>>
>> This prepares the migration to regmap usage.
>>
>> To properly setup regmap, the APB needs to be in working order.
>> This is easier handled if the resets are not mixed with hw init.
>>
>> More checks are required to determine if the resets are needed
>> on resume or not. Add a note for this.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/mes=
on/meson_dw_hdmi.c
>> index 5cd3264ab874..47aa3e184e98 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -581,11 +581,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi=
 *meson_dw_hdmi)
>>         /* Bring HDMITX MEM output of power down */
>>         regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
>>
>> -       /* Reset HDMITX APB & TX & PHY */
>> -       reset_control_reset(meson_dw_hdmi->hdmitx_apb);
>> -       reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
>> -       reset_control_reset(meson_dw_hdmi->hdmitx_phy);
>> -
>>         /* Enable APB3 fail on error */
>>         if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
>>                 writel_bits_relaxed(BIT(15), BIT(15),
>> @@ -675,6 +670,10 @@ static int meson_dw_hdmi_bind(struct device *dev, s=
truct device *master,
>>                 return PTR_ERR(meson_dw_hdmi->hdmitx_phy);
>>         }
>>
>> +       reset_control_reset(meson_dw_hdmi->hdmitx_apb);
>> +       reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
>> +       reset_control_reset(meson_dw_hdmi->hdmitx_phy);
> The old out of tree vendor driver [0] enables the "isfr" and "iahb"
> (in P_HHI_HDMI_CLK_CNTL and P_HHI_GCLK_MPEG2) clocks before triggering
> the resets.
> Previously meson_dw_hdmi's behavior was identical as it enabled the
> clocks in meson_dw_hdmi_bind() and only later triggered the resets.
>
> I'm totally fine with moving the resets to meson_dw_hdmi_bind() but I
> think it should happen after devm_clk_bulk_get_all_enable() has been
> called (to keep the order and thus avoid side-effects that we don't
> know about yet).

Good point.

I was also thinking about squashing this with the regmap patch.
I've split it apart for v1 to make things a bit more clear but it only
really makes sense with the regmap conversion.=20

>
> Also out of curiosity: are you planning to convert the driver to use
> devm_reset_control_bulk_get_exclusive()?
>

It's been a while this I've done that. I remember I thought about it.
I think it was a bit more difficult to use that clocks. I was looking at
making the driver a bit more clean and simple. It was not really helping
to move it in that direction IIRC.

>
> Best regards,
> Martin
>
>
> [0] https://github.com/endlessm/linux-s905x/blob/master/drivers/amlogic/h=
dmi/hdmi_tx_20/hw/hdmi_tx_hw.c#L470

--=20
Jerome
