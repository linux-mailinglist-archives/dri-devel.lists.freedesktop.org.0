Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA1E397BC2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 23:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A3B6EB1D;
	Tue,  1 Jun 2021 21:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA806EB1D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 21:31:03 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 76so287961qkn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 14:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JXdhJvyph4ihhVHm63xPBDzDhOrbAVr21xAsdZ3zjgE=;
 b=QIHU1soWfHH67GjAO10YhdgZrzB6z/Bf0EI7l7m8mXk415RghLKfRESYKUKi5vtFSh
 5Ho0+Y1H91bZ/HOs5wxE42WA5yqWLT00wehIq+wsn/cqEejRrZ8O/0FLZGmSW9BqvTlA
 eTDS8IHly24W/BTvIJ0I1B/PfrBRDm0otbjnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JXdhJvyph4ihhVHm63xPBDzDhOrbAVr21xAsdZ3zjgE=;
 b=M3ltSSAlzA2JMEAlLJ2B/0qfqxAhw1FuDx4ef8+/8Lw1l/tJ3w9fcnV6qfCYoSNVb9
 BB6pznRPTVXfSltOiDsB9etJyaZGg6izKnHKrGWNwGL8kMPLpypPR31+ARiu4z4d1k43
 r4ftJZNk324CW67yk6bDANNERq1c4GgKNY95LNm85hH88WySaVhC7pMQRJfi9z+I7vjZ
 4msnGeCbn76TJ2QNGsJ3hEpcftbcDBLznC4laZsycYD92OgevB2fh+ivGyOjPkeXW6bT
 MqNO7hLTGvBfwoqu4DlI950IMnIB3uc8fbSz6junSy3L8CaGQQHCVdpuyiKor0GCUQmF
 DfqQ==
X-Gm-Message-State: AOAM533imhgbksvtb7ylqS4Ej6r5L4PlLrW03OgDE3m4OUrdtIeVWaP9
 TLPuNNxIq23gvi3DB+hLJxYzQAxltTFleg==
X-Google-Smtp-Source: ABdhPJyv1LCt3lh/hc/89QWfUW4h8ebAkujWDsdviS++CU2gjH2pn75kmLVDcGuJiTVlADx55miFAQ==
X-Received: by 2002:a05:620a:1593:: with SMTP id
 d19mr24084735qkk.211.1622583062220; 
 Tue, 01 Jun 2021 14:31:02 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id i11sm10302990qtj.4.2021.06.01.14.30.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 14:30:56 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id y2so734173ybq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 14:30:53 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr41689832ybm.345.1622583050481; 
 Tue, 01 Jun 2021 14:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210531102838.2423918-1-linus.walleij@linaro.org>
In-Reply-To: <20210531102838.2423918-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Jun 2021 14:30:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHzqi67_bf0EUCF=cgzGt-uX=+-ehkOfjm32Wg8YBt5Q@mail.gmail.com>
Message-ID: <CAD=FV=XHzqi67_bf0EUCF=cgzGt-uX=+-ehkOfjm32Wg8YBt5Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: db7430: Add driver for Samsung DB7430
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 31, 2021 at 3:30 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> +/**
> + * struct db7430 - state container for the Db7430 panel

super nitty: s/Db7430/DB7430/

Also, it's not technically "the DB7430 panel" but instead "a panel
controlled by the DB7430 controller".


> +static int db7430_dcs_write(struct db7430 *lms, const u8 *data, size_t len)
> +{
> +       int ret;
> +
> +       dev_dbg(lms->dev, "SPI writing dcs seq: %*ph\n", (int)len, data);
> +
> +       /*
> +        * This sends 9 bits with the first bit (bit 8) set to 0
> +        * This indicates that this is a command. Anything after the
> +        * command is data.
> +        */
> +       ret = db7430_write_word(lms, *data);
> +
> +       while (!ret && --len) {
> +               ++data;
> +               /* This sends 9 bits with the first bit (bit 8) set to 1 */
> +               ret = db7430_write_word(lms, *data | DATA_MASK);
> +       }
> +
> +       if (ret) {
> +               dev_err(lms->dev, "SPI error %d writing dcs seq: %*ph\n", ret,
> +                       (int)len, data);
> +       }
> +
> +       return ret;
> +}

Still hoping that this can work atop DBI so we can avoid the raw SPI
writes. You said you're trying for it for v3 so I'm looking forward to
checking it out there.


> +static int db7430_power_on(struct db7430 *lms)
> +{
> +       int ret;
> +
> +       /* Power up */
> +       ret = regulator_bulk_enable(ARRAY_SIZE(lms->regulators),
> +                                   lms->regulators);
> +       if (ret) {
> +               dev_err(lms->dev, "failed to enable regulators: %d\n", ret);
> +               return ret;
> +       }
> +       msleep(50);
> +
> +       /* Assert reset >=1 ms */
> +       gpiod_set_value_cansleep(lms->reset, 1);
> +       usleep_range(1000, 5000);
> +       /* De-assert reset */
> +       gpiod_set_value_cansleep(lms->reset, 0);
> +       /* Wait >= 10 ms */
> +       msleep(10);
> +       dev_dbg(lms->dev, "de-asserted RESET\n");
> +
> +       /*
> +        * This is set to 0x0a (RGB/BGR order + horizontal flip) in order
> +        * to make the display behave normally. If this is not set the displays
> +        * normal output behaviour is horizontally flipped and BGR ordered. Do
> +        * it twice because the first message doesn't always "take".
> +        */
> +       db7430_dcs_write_seq_static(lms, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);

In response to v1, I asked:

Also: should we be error-checking lms397kf04_dcs_write_seq_static()
return values in this function? spi_write() can fail...

It still seems like it'd be nice to error check, even if you just
print a message in the helper function and then go on with the rest of
the function (to simplify control flow).


> +       db7430_dcs_write_seq_static(lms, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
> +       /* Called "Access protection off" in vendor code */
> +       db7430_dcs_write_seq_static(lms, DB7430_ACCESS_PROT_OFF, 0x00);

Now that you've updated the #define to include the words
"ACCESS_PROT_OFF" you probably don't need the comment.


> +/**
> + * db7430_get_modes() - return the mode
> + * @panel: the panel to get the mode for
> + * @connector: reference to the central DRM connector control structure
> + */
> +static int db7430_get_modes(struct drm_panel *panel,
> +                           struct drm_connector *connector)
> +{
> +       struct db7430 *lms = to_db7430(panel);
> +       struct drm_display_mode *mode;
> +       static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +       mode = drm_mode_duplicate(connector->dev, &db7430_mode);
> +       if (!mode) {
> +               dev_err(lms->dev, "failed to add mode\n");
> +               return -ENOMEM;
> +       }
> +
> +       connector->display_info.width_mm = mode->width_mm;
> +       connector->display_info.height_mm = mode->height_mm;
> +       connector->display_info.bus_flags =
> +               DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> +       drm_display_info_set_bus_formats(&connector->display_info,
> +                                        &bus_format, 1);

In my review of v1, I asked:

panel-simple also sets the bpc in the "display_info". Do you need to?

I didn't see a reply, so I'm still curious about the answer.


-Doug
