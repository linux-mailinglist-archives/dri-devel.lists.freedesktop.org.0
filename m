Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362877FB290
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 08:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F1110E431;
	Tue, 28 Nov 2023 07:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED9110E431
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 07:20:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40b472f99a0so12108125e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 23:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701156029; x=1701760829; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GlKaojjWsS2mKXXH/lCdZxSBZtEolg1CllKho1I9qUk=;
 b=XSipNypGL/nkZntRPupZ3ny6B9QZlW+GphvD+eqFv1bQFYiNquHUECVsaZ1Ab3oCvl
 wlC5+ouFCgkLQtggn6McP5SftxghyN5emvyLAGcr6zHexKtOQjO1De8SdQVI+2TjgBLc
 GZArfA5dxE6yZNYuivicOICBBUfyf7LaDre4ZLXkLkBgxbCsqIiNjoKO3kS2ded6JWIf
 eqEqc1d0kGveh/3XYw32w667wkdLs83jW3024D895UY6og9O/licczgcGi5vf3HLyYrp
 78Ic+EeKRcsHqlo1uOgJM+Pv0k/aLfkGyJRGlIYQm+uur/AehmZ6Fvdtr3SYyQmT8p8X
 HE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701156029; x=1701760829;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GlKaojjWsS2mKXXH/lCdZxSBZtEolg1CllKho1I9qUk=;
 b=SoA+o7POL3jcc86M3FqPioo0C2OkhI89+yGUQOVQ0yeUSqppqEdp5/+sIccFY28w/O
 sEQN5K5sBBIq1ngXCqN4pEmu/N1KQZWhZCd/EKmlStH/e4IrVldmGZBlacC3AYbDdqwU
 Hb37y9tne0L6Tv0AxNuOQocpn/oHCEbu2RHlBi18dhPq05RWUrMkneHvQQGerUC0v7Mv
 FOnrgqf1yvZCtGmwsoTOS9E6XHI/lCHu51froKAAVyiS9dF72DRP/sEUMgY18iiYLdJI
 8Z/pUngQ0KhHzVoLvwqPOte3G59e4VwgIXEJdGaXX/ICXquQcwb+cMWePDx39KUNeedJ
 LCmw==
X-Gm-Message-State: AOJu0YxMEJH489Vc8oTuhkBWhBXdpv9sOwJRvL5cLzfcP5/BhAI179jt
 +8qZ25bX2d876QpSgF38UHYz4g==
X-Google-Smtp-Source: AGHT+IF6yymzXvBR4WUX+fUJ8Txwcj+WhPguITWXOvxT2qKsOngD7N6dCN0mpcaXZ18UrLNr1hKmMw==
X-Received: by 2002:a05:600c:4f50:b0:40b:4193:2469 with SMTP id
 m16-20020a05600c4f5000b0040b41932469mr6886106wmq.3.1701156028996; 
 Mon, 27 Nov 2023 23:20:28 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c4f9000b0040b38292253sm14988422wmq.30.2023.11.27.23.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 23:20:28 -0800 (PST)
Date: Tue, 28 Nov 2023 10:20:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: f.suligoi@asem.it
Subject: [bug report] backlight: mp3309c: Add support for MPS MP3309C
Message-ID: <af0a1870-693b-442f-9b11-0503cfcd944a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Flavio Suligoi,

The patch 2e914516a58c: "backlight: mp3309c: Add support for MPS
MP3309C" from Nov 16, 2023 (linux-next), leads to the following
Smatch static checker warning:

	drivers/video/backlight/mp3309c.c:277 pm3309c_parse_dt_node()
	error: uninitialized symbol 'prop_levels'.

drivers/video/backlight/mp3309c.c
    202 static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
    203                                  struct mp3309c_platform_data *pdata)
    204 {
    205         struct device_node *node = chip->dev->of_node;
    206         struct property *prop_pwms, *prop_levels;
    207         int length = 0;
    208         int ret, i;
    209         unsigned int num_levels, tmp_value;
    210 
    211         if (!node) {
    212                 dev_err(chip->dev, "failed to get DT node\n");
    213                 return -ENODEV;
    214         }
    215 
    216         /*
    217          * Dimming mode: the MP3309C provides two dimming control mode:
    218          *
    219          * - PWM mode
    220          * - Analog by I2C control mode (default)
    221          *
    222          * I2C control mode is assumed as default but, if the pwms property is
    223          * found in the backlight node, the mode switches to PWM mode.
    224          */
    225         pdata->dimming_mode = DIMMING_ANALOG_I2C;
    226         prop_pwms = of_find_property(node, "pwms", &length);
    227         if (prop_pwms) {
    228                 chip->pwmd = devm_pwm_get(chip->dev, NULL);
    229                 if (IS_ERR(chip->pwmd))
    230                         return dev_err_probe(chip->dev, PTR_ERR(chip->pwmd),
    231                                              "error getting pwm data\n");
    232                 pdata->dimming_mode = DIMMING_PWM;
    233                 pwm_apply_args(chip->pwmd);
    234         }
    235 
    236         /*
    237          * In I2C control mode the dimming levels (0..31) are fixed by the
    238          * hardware, while in PWM control mode they can be chosen by the user,
    239          * to allow nonlinear mappings.
    240          */
    241         if  (pdata->dimming_mode == DIMMING_ANALOG_I2C) {
    242                 /*
    243                  * Analog (by I2C commands) control mode: fixed 0..31 brightness
    244                  * levels
    245                  */
    246                 num_levels = ANALOG_I2C_NUM_LEVELS;
    247 
    248                 /* Enable GPIO used in I2C dimming mode only */
    249                 chip->enable_gpio = devm_gpiod_get(chip->dev, "enable",
    250                                                    GPIOD_OUT_HIGH);
    251                 if (IS_ERR(chip->enable_gpio))
    252                         return dev_err_probe(chip->dev,
    253                                              PTR_ERR(chip->enable_gpio),
    254                                              "error getting enable gpio\n");

prop_levels not initialized on this path.

    255         } else {
    256                 /*
    257                  * PWM control mode: check for brightness level in DT
    258                  */
    259                 prop_levels = of_find_property(node, "brightness-levels",
    260                                                &length);
    261                 if (prop_levels) {
    262                         /* Read brightness levels from DT */
    263                         num_levels = length / sizeof(u32);
    264                         if (num_levels < 2)
    265                                 return -EINVAL;
    266                 } else {
    267                         /* Use default brightness levels */
    268                         num_levels = MP3309C_PWM_DEFAULT_NUM_LEVELS;
    269                 }
    270         }
    271 
    272         /* Fill brightness levels array */
    273         pdata->levels = devm_kcalloc(chip->dev, num_levels,
    274                                      sizeof(*pdata->levels), GFP_KERNEL);
    275         if (!pdata->levels)
    276                 return -ENOMEM;
--> 277         if (prop_levels) {
                    ^^^^^^^^^^^
Uninitialized

    278                 ret = of_property_read_u32_array(node, "brightness-levels",
    279                                                  pdata->levels,
    280                                                  num_levels);
    281                 if (ret < 0)
    282                         return ret;
    283         } else {
    284                 for (i = 0; i < num_levels; i++)
    285                         pdata->levels[i] = i;
    286         }
    287 
    288         pdata->max_brightness = num_levels - 1;
    289 
    290         ret = of_property_read_u32(node, "default-brightness",
    291                                    &pdata->default_brightness);
    292         if (ret)
    293                 pdata->default_brightness = pdata->max_brightness;
    294         if (pdata->default_brightness > pdata->max_brightness) {
    295                 dev_err(chip->dev,
    296                         "default brightness exceeds max brightness\n");
    297                 pdata->default_brightness = pdata->max_brightness;
    298         }
    299 
    300         /*

regards,
dan carpenter
