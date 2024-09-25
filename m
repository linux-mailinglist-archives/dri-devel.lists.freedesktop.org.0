Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821039851FE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 06:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F8910E2CD;
	Wed, 25 Sep 2024 04:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H3Bl/3CL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10AC10E2CD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 04:26:06 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-207115e3056so47728785ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 21:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727238366; x=1727843166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=phoYo00B6ZRIpjfRG/81GcMspTNk0jh/acvNetZig2s=;
 b=H3Bl/3CLFUP6kaS32ft+GGadZcfOOkzsnoQ0xU6lJguU2lK/5adD3EI7XbtL5c4vdf
 CGxlKXU2iG29HwB/YMz2e4neiXf/8olttenLB0UheOda7H7cv1OGadA73I3/RT9LIeSF
 FFm5jHhS2I2YZVlFsCTt+FGzmaozzUQYOf4WIBmadbv8Xkyz8HMXUUjSLRrzAUWmJ/h6
 WRL8GAIUTjTWdgnZIXlreItsCo6fy55qoVOxVlA5sJnOi+BalHyl/w4cdK0cJEF6bVs0
 VOeF429FwsFNrwi4zYgdj366TOWaf3+XtIgqx1VJzX/DzY7R2tZZoPk1ry6xP+T3H/S8
 RLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727238366; x=1727843166;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=phoYo00B6ZRIpjfRG/81GcMspTNk0jh/acvNetZig2s=;
 b=Mc6PGHOYttMZKCiEq4VoHPWx82aFtaKeUl6A34bCTEI9QCkAEpGux/U3Jbbt7rfpLH
 wyW7i1bxXag/r9OM5pJJNj7CAYiY/qVsxO9bSPGRpU2KDRfIMKjVYGCwiBigisO3PryX
 JHTUe5n8+ww2BYTiEdWXIXFGIkpv5zItPziavw43+j0vaXdh37yZO4HnPMGIT0I3hxY/
 GuPlpRsOiuu8bX6P8kxFa0Gt6l/B3ydYNJDfK6EnAO2J+1owMAsusuZ5wFry8Psld3Se
 Gtek5llgTUgNJewpXyreJWiicnT7XnTFwZfvbdZkkTpI2hiN8/rb5TlsUyZX4wXcWOfN
 Wdlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3OBWu42huLYiTakgn3Kp2ZxsojZ2+392JcoH9VX5UN/LS/cmaRbp4x1HPnzMEe9gTU3UbEPaguUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yypd6ZvKsqXnbsotinuY+71FCnpQn4H9P5hACw1Io9Zy+2TReea
 ULSJxEyIgPGLXLT61kJ7R23nM9Bk4wOvss9EU9G8bGQgEXw38tiH
X-Google-Smtp-Source: AGHT+IGKxgpD7biIYq4dyOkPpfiLme60hVAhSy3SkRA7HVSfGbct0bidQMhuGF/r7xrAdvHEu1ZB+g==
X-Received: by 2002:a17:902:c94a:b0:202:26d:146c with SMTP id
 d9443c01a7336-20afc42d838mr19087135ad.5.1727238366183; 
 Tue, 24 Sep 2024 21:26:06 -0700 (PDT)
Received: from [10.3.80.76] ([103.4.222.252]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7e6b7c73120sm1899603a12.68.2024.09.24.21.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 21:26:05 -0700 (PDT)
Message-ID: <22d4aada-da3f-45d6-b2a9-b2f9a7ac7d10@gmail.com>
Date: Wed, 25 Sep 2024 09:56:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel: elida-kd35t133: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240923122558.728516-1-tejasvipin76@gmail.com>
 <CAD=FV=WmcyAbzU_M25rCzc3JmNGZ9T0wzMJAfxi-LmdZ6389OQ@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=WmcyAbzU_M25rCzc3JmNGZ9T0wzMJAfxi-LmdZ6389OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 9/25/24 1:25 AM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Sep 23, 2024 at 5:33 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> -static int kd35t133_init_sequence(struct kd35t133 *ctx)
>> +static void kd35t133_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>>  {
>> -       struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>> -       struct device *dev = ctx->dev;
>> -
>>         /*
>>          * Init sequence was supplied by the panel vendor with minimal
>>          * documentation.
>>          */
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POSITIVEGAMMA,
>> -                              0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
>> -                              0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_NEGATIVEGAMMA,
>> -                              0x00, 0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
>> -                              0x4d, 0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL2, 0x41);
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
>> -       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
>> -       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_FRAMERATECTRL, 0xa0);
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
>> -                              0x20, 0x02);
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
>> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_ADJUSTCONTROL3,
>> -                              0xa9, 0x51, 0x2c, 0x82);
>> -       mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);
>> -
>> -       dev_dbg(dev, "Panel init sequence done\n");
>> -       return 0;
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POSITIVEGAMMA,
>> +                                    0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
>> +                                    0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_NEGATIVEGAMMA,
>> +                                    0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
>> +                                    0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
> 
> It seems like you dropped a few bytes in the above. Was this
> intentional? You seem to have dropped the first byte from both of the
> continuation lines (0x00 from the first, 0x4d from the second).
> 
> 
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL2, 0x41);
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_FRAMERATECTRL, 0xa0);
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
>> +                                    0x02);
> 
> This used to be the bytes 0x20, 0x02. Now it's just 0x02?
> 
> 
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
>> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_ADJUSTCONTROL3,
>> +                                    0x51, 0x2c, 0x82);
> 
> This used to be the bytes 0xa9, 0x51, 0x2c, 0x82. Now it's just 0x51,
> 0x2c, 0x82?
>

Oh dear. No, this was not intentional. Most likely I think I wrote a vim
macro poorly.

> 
>> +       mipi_dsi_dcs_write_buffer_multi(dsi_ctx, NULL, 0);
> 
> Are you certain that the above is equivalent to the old
> "mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);" ?
> Where is the "MIPI_DCS_ENTER_INVERT_MODE" constant?
> 
> I think the above needs to be:
> 
>   mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_ENTER_INVERT_MODE);
> 
> I've confirmed that this compiles OK and that there's no need to
> actually have any bytes in the sequence.
>

I'll do a v3 addressing all of this.

> 
> -Doug

-- 
Tejas Vipin
