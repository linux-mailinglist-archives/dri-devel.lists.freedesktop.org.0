Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F49B1261E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 23:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65EE10E057;
	Fri, 25 Jul 2025 21:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="oThx1Fyb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3173110E057
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 21:24:11 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3e293a3b426so27759055ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753478650; x=1754083450;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dT9DhCI4omelHQCSbq0zx+balg3BlkNvSkZNZzTd3hw=;
 b=oThx1FybeGLQ6e+sOWN4Bgz1Fm+u3SIhtt7NloKB3Khkn4l8PZK5TWkMYIip7iKVEt
 aw8Hmy3Ao5acqMphyy0/PxUXb0KNlHFCwtdK2FLBkEvnRO2rxnAgWUATE4fyucvVGKO6
 EBZ0mZokyz75Tma/dRwvM17Bgq/7K9aCasd+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753478650; x=1754083450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dT9DhCI4omelHQCSbq0zx+balg3BlkNvSkZNZzTd3hw=;
 b=HaEwEVlh/PNMsKYz7gZvO7XQfuHgQHZIq/SnZ701efDW/8QUxKk9j+xTi5mAH+ZpFh
 hsc3BODPqML2CETtra2y22PqCntzd7FuYJkS/WDyiZEahKEea8doLns4qzz/LcHg3EzN
 ecdGxrEJJ+xB+LqJ175L2qnRKN9t3JztsDJuEUN0RqVfQ8iE5JrctPqgtRLYkiQcw++9
 0gE/6rfKCjfSNqZPvUrDtykBIO5K2jsaqi2hBvqnbsAW7WsxmN3rg4++1ngyQpuYRlfc
 8D3xYAO15mXh1z69TSaZtzHkBHpuhrjFWAt/lo1mN5HRPVRB3l7h5FTSTsaVYeV9yYWS
 966A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU/kiuKto2WBZEzvEia2sX+KCet1Q9WfKva33OkNJt+4AEZmYMKWTVhJuo6z1rXP1JirolQqAgTiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQz8qYCfmwSOIdZdsmZF0AlRTbj5oZbDT8Vk0/PffSycmTj2uJ
 ptj2baomho78QN9HoUoKeG78P8LUaLPcvooXg5Go5DsORkx9TvVBfEjh3LTWi2c8C5gAcvdORPc
 j1cM=
X-Gm-Gg: ASbGncsaEochwsoE2iuZrFDRkwQnbOYWVaJvCaVUaR2KMVQvHdMY+kCTGsTk4tooeEb
 ExIW4G+1X3dYgRltUpVWkf2TFkFqFog4v2l456GT/BuxnLrxQZFF3gxnffVct0wHe4ZdYjs7GVP
 CSNdSQHpx1cK1dInB8WdN5Eoa0BXwtha6ET3TSDIrBbJ7RY+SuvacSFKn46H8aPGLbeoAIgdCFZ
 z/73sonwUuZ3f5E0RB/rTQAaxDDoq+bD04v2/VEE5nIL2K/XVD85nJzpfzIgk0gPFMj96cKasDd
 NDAvwSEw1j4IpsLAWjLpF+bwpkaaBHbi6fqEyiTkJsv8fUTaStzBBxp6tQp3zqnZ65rCT9mlVsh
 6++j8voCboceyXKJJGN2QN6HDAka9niVTr4dEmiVOOAFkN5Y+fHRBgegBjQYOcqYakA==
X-Google-Smtp-Source: AGHT+IFNNBQWGJEx9ATcH6ldKSwuARubLNaN+nA+oLhR/QOw9/NViFK2vV/Y5vFAtwPRmQZkob1Qew==
X-Received: by 2002:a05:6e02:3090:b0:3e2:c4ce:51c8 with SMTP id
 e9e14a558f8ab-3e3c52af7e8mr56238905ab.14.1753478649574; 
 Fri, 25 Jul 2025 14:24:09 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-508c91eed7dsm175782173.39.2025.07.25.14.24.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 14:24:09 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3e3c34a9b4cso13433255ab.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:24:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPPZZ4UKrbYGKXLFz29FlI8oYwsSdM4WgbBq/J225B2UyulxSdAMBPgHyJYp4bBoJttd3hxqywCIA=@lists.freedesktop.org
X-Received: by 2002:a17:90b:350b:b0:312:29e:9ed5 with SMTP id
 98e67ed59e1d1-31e77a124ecmr4350962a91.23.1753478246765; Fri, 25 Jul 2025
 14:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250724202338.648499-1-me@brighamcampbell.com>
 <20250724202338.648499-3-me@brighamcampbell.com>
In-Reply-To: <20250724202338.648499-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Jul 2025 14:17:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGNN68Fu4kJQQ8jO+fYP4qVJYmL0quxa_=Y5GEtS-jMQ@mail.gmail.com>
X-Gm-Features: Ac12FXxs1ZuIHE7bbVyrgXeO1Q1pzMxPpg9wpyIoG3cbGGcu5JyXqQ0FaT82pVk
Message-ID: <CAD=FV=UGNN68Fu4kJQQ8jO+fYP4qVJYmL0quxa_=Y5GEtS-jMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: novatek-nt35560: Fix bug and clean up
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Jul 24, 2025 at 1:23=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Fix bug in nt35560_set_brightness() which causes the function to
> erroneously report an error. mipi_dsi_dcs_write() returns either a
> negative value when an error occurred or a positive number of bytes
> written when no error occurred. The buggy code reports and error under
> either condition.

My personal preference would be to code up the fix itself (without the
multi transition) as patch #1. That will make everyone's lives easier
with stable backports. You'll touch the same code twice in your
series, but it will keep it cleaner...


> Update driver to use the "multi" variants of MIPI functions which
> facilitate improved error handling and cleaner driver code.
>
> Fixes: 7835ed6a9e86 ("drm/panel-sony-acx424akp: Modernize backlight handl=
ing")
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>
> The usage of the u8 array, mipi_buf_out, in nt35560_set_brightness() may
> be a little curious. It's useful here because pwm_ratio and pwm_div
> aren't constant, therefore we must store them in a buffer at runtime.
>
> Using mipi_dsi_dcs_write_{seq,buffer}_multi() in place of
> mipi_dsi_dcs_write() gives the added benefit that kmalloc() isn't used
> to write mipi commands.

Ah, this makes sense. We've seen this before, but I keep forgetting
about it. Thanks for mentioning it. I wonder if it makes sense to have
variants of mipi_dsi_generic_write_seq_multi() and
mipi_dsi_dcs_write_seq_multi() that take non-const data. The only
difference would be that the array they declare on the stack would be
a "const" array instead of a "static const" array...


> The jdi-lpm102a188a driver's unprepare() function will ignore errors
> reported by mipi_dsi_dcs_{set_display_off,enter_sleep_mode}. This
> driver, however, will fail to unprepare the panel if either function
> returns an error. The behavior of the jdi-lpm102a188a panel makes more
> sense to me, but I strongly prefer not to change the behavior of this
> driver without personally having access to hardware to test.

Makes sense to me.


> @@ -176,62 +173,28 @@ static int nt35560_set_brightness(struct backlight_=
device *bl)
>
>         /* Set up PWM dutycycle ONE byte (differs from the standard) */
>         dev_dbg(nt->dev, "calculated duty cycle %02x\n", pwm_ratio);
> -       ret =3D mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> -                                &pwm_ratio, 1);
> -       if (ret < 0) {
> -               dev_err(nt->dev, "failed to set display PWM ratio (%d)\n"=
, ret);
> -               return ret;
> -       }
>
> -       /*
> -        * Sequence to write PWMDIV:
> -        *      address         data
> -        *      0xF3            0xAA   CMD2 Unlock
> -        *      0x00            0x01   Enter CMD2 page 0
> -        *      0X7D            0x01   No reload MTP of CMD2 P1
> -        *      0x22            PWMDIV
> -        *      0x7F            0xAA   CMD2 page 1 lock
> -        */

The above comment was useful. Can you keep it?


> @@ -278,16 +232,18 @@ static int nt35560_read_id(struct nt35560 *nt)
>         case DISPLAY_SONY_ACX424AKP_ID2:
>         case DISPLAY_SONY_ACX424AKP_ID3:
>         case DISPLAY_SONY_ACX424AKP_ID4:
> -               dev_info(nt->dev, "MTP vendor: %02x, version: %02x, panel=
: %02x\n",
> +               dev_info(&dev,
> +                        "MTP vendor: %02x, version: %02x, panel: %02x\n"=
,
>                          vendor, version, panel);
>                 break;
>         default:
> -               dev_info(nt->dev, "unknown vendor: %02x, version: %02x, p=
anel: %02x\n",
> +               dev_info(&dev,
> +                        "unknown vendor: %02x, version: %02x, panel: %02=
x\n",
>                          vendor, version, panel);
>                 break;
>         }
>
> -       return 0;
> +       return;
>  }

nit: no need for explicit return here, right?


> @@ -322,92 +278,56 @@ static void nt35560_power_off(struct nt35560 *nt)
>  static int nt35560_prepare(struct drm_panel *panel)
>  {
>         struct nt35560 *nt =3D panel_to_nt35560(panel);
> -       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(nt->dev);
> -       const u8 mddi =3D 3;
> +       struct mipi_dsi_multi_context dsi_ctx =3D {
> +               .dsi =3D to_mipi_dsi_device(nt->dev)
> +       };
>         int ret;
>
>         ret =3D nt35560_power_on(nt);
>         if (ret)
>                 return ret;
>
> -       ret =3D nt35560_read_id(nt);
> -       if (ret) {
> -               dev_err(nt->dev, "failed to read panel ID (%d)\n", ret);
> -               goto err_power_off;
> -       }
> +       nt35560_read_id(&dsi_ctx);
>
> -       /* Enabe tearing mode: send TE (tearing effect) at VBLANK */
> -       ret =3D mipi_dsi_dcs_set_tear_on(dsi,
> +       /* Enable tearing mode: send TE (tearing effect) at VBLANK */
> +       mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx,
>                                        MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -       if (ret) {
> -               dev_err(nt->dev, "failed to enable vblank TE (%d)\n", ret=
);
> -               goto err_power_off;
> -       }
>
>         /*
>          * Set MDDI
>          *
>          * This presumably deactivates the Qualcomm MDDI interface and
>          * selects DSI, similar code is found in other drivers such as th=
e
> -        * Sharp LS043T1LE01 which makes us suspect that this panel may b=
e
> -        * using a Novatek NT35565 or similar display driver chip that sh=
ares
> -        * this command. Due to the lack of documentation we cannot know =
for
> -        * sure.
> +        * Sharp LS043T1LE01

Ah, this is the obsolete comment that you removed and talked about
"after the cut". You could probably include that info in the commit
message itself since someone looking at the commit later would
otherwise not know why this info was removed.

Also, nit: you should end your sentence with a period. :-)


Overall this looks like a nicely done cleanup. Thanks! ...just a few
small nits...


-Doug
