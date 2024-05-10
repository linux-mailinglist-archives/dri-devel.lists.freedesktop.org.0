Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B463C8C2C8F
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 00:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E1310E0BE;
	Fri, 10 May 2024 22:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lTHS3V79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA44410E074
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 22:23:02 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e1fa824504so32478431fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715379781; x=1715984581; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=G0Uyr1pN8k/ARGpxhDyBbiCgjg0OynDBUphzu3LkFrg=;
 b=lTHS3V79gHCVdSk1H5UpsH2lq5L3ZJd0IUmgQM7ZJ9Gbtq/HOKw3m4vaxHpH5plXil
 xAf05Ytp8Q/7+1/VUqV5nOwGI83bjGRJfAuqW24jjF/HxPDZUxVFrQJ/+UE1QG57mjBe
 Av33ClPTZ0ij9sSJn87Pnoi89eMsrAXbu1HJq608TQ+dhq+UuEP0xapGa4T0IWevTCwF
 01aNEd+CXBG+7YRoEbhxOY6NyulmlLQzSRsckKw0bSSoAm9M8d5rV4GusCyM6nCoQpQQ
 DHm5pHcqZ6VIlXKmWu/EhlmdZMheuAkNTCGWyufADcEZ+QKTv0Iui1BEpjAd3plHH6Ww
 UiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715379781; x=1715984581;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G0Uyr1pN8k/ARGpxhDyBbiCgjg0OynDBUphzu3LkFrg=;
 b=N21IAx+OrK3EZchUxiD6onwsg+zWq1FGretY6tgLCgkamGdwboQTu06t21qhfwUrym
 /c0uWZBCAK9zajYA19LI7VtQ3K/ZZD2G0lWtZuXmnEqQ9UIY5881sot9DcUFJCJD+oei
 vSi75XkfE8R2xPx+0wDxn0qTx+vaE6aeOJqX46gKYu4VFSyWUcv6kGKqAsHZJyusYjwK
 FXJhGXqR7Doefqyiz/Y4LX7jOJpZzZGwkTIbiLpYsbBSgKixygnR8HmhbbO8NmO7/40a
 Mo5/JeFu+nClaNoa8ShUwzwgSCNu0THyus6JaPyn7WZQsnTFFsUJdEzQySPeBZx6+f7g
 MhfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW90VtH8nmzp2tmJdXu11ZflZil/eVnt/8uA6l55U0W5H5egZYHcGu+BB5GyyEVXhYU+EMKqi/QE2D4ne4ubldscXa9kD6HdJPpV3fs7255
X-Gm-Message-State: AOJu0YzPWj/o89h0zt3aPoCNV3YxrKbd3jDgNeyIzQjBv4MnbBLBwwON
 /Bht9SzqxEtq90nZH9vsTwShuPr56Whtjnov1Um6/Dz1Q30LG1mtpylO1KVxLS0=
X-Google-Smtp-Source: AGHT+IF1IRH4d76n4pNOyKYDdO40mH/uIs2el/Qhpb/0zJQWJsLL3MOXUVp9zI7G4e8SrdOea3SYfg==
X-Received: by 2002:a19:2d07:0:b0:522:e58:86b3 with SMTP id
 2adb3069b0e04-5220fc6d53emr2348194e87.36.1715379780683; 
 Fri, 10 May 2024 15:23:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d2db3sm832202e87.269.2024.05.10.15.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 15:23:00 -0700 (PDT)
Date: Sat, 11 May 2024 01:22:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/7] drm/mipi-dsi: wrap more functions for streamline
 handling
Message-ID: <3ooczfup63gjhuphlujaq26ggo4rasu6c5j2ki3avzxs5wgcqn@lx55p76myvpn>
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
 <20240510-dsi-panels-upd-api-v1-1-317c78a0dcc8@linaro.org>
 <CAD=FV=UuJF5Nv6qLzH8SK8NPfHa6Qwp4XOwkLUYt2Rv8ACjfeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UuJF5Nv6qLzH8SK8NPfHa6Qwp4XOwkLUYt2Rv8ACjfeQ@mail.gmail.com>
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

On Fri, May 10, 2024 at 02:45:45PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, May 9, 2024 at 3:37 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > +/**
> > + * mipi_dsi_compression_mode_ext() - enable/disable DSC on the peripheral
> > + * @ctx: Context for multiple DSI transactions
> > + * @enable: Whether to enable or disable the DSC
> > + * @algo: Selected compression algorithm
> > + * @pps_selector: Select PPS from the table of pre-stored or uploaded PPS entries
> > + *
> > + * Like mipi_dsi_compression_mode_ext_multi() but deals with errors in a way that
> > + * makes it convenient to make several calls in a row.
> 
> Your comment is backward. The name of the function is

True, my bad.

> mipi_dsi_compression_mode_ext_multi() not
> mipi_dsi_compression_mode_ext(). ...and it's like
> mipi_dsi_compression_mode_ext() not like
> mipi_dsi_compression_mode_ext_multi().
> 
> 
> > @@ -338,6 +345,18 @@ int mipi_dsi_dcs_set_display_brightness_large(struct mipi_dsi_device *dsi,
> >  int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
> >                                              u16 *brightness);
> >
> > +void mipi_dsi_dcs_nop_multi(struct mipi_dsi_multi_context *ctx);
> > +void mipi_dsi_dcs_enter_sleep_mode_multi(struct mipi_dsi_multi_context *ctx);
> > +void mipi_dsi_dcs_exit_sleep_mode_multi(struct mipi_dsi_multi_context *ctx);
> > +void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx);
> > +void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx);
> > +void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
> > +                                   enum mipi_dsi_dcs_tear_mode mode);
> > +
> > +#define mipi_dsi_msleep(ctx, delay)    \
> > +       if (!ctx.accum_err)             \
> > +               msleep(delay)           \
> 
> Please enclose the above in a "do { ... } while (0)" as typical for
> macros. Otherwise you could possibly get some very surprising
> behavior:

Ack.

> 
> if (needs_big_delay)
>   mipi_dsi_msleep(ctx, 50)
> else
>   mipi_dsi_msleep(ctx, 10)
> 
> ...with your macro as it is I think the "else" will match up against
> the "if !(ctx.accum_err)" inside the macro and not against the "if
> (needs_big_delay)"
> 
> Also: nit that the mipi_dsi_msleep() should probably be defined above
> the "mipi_dsi_dcs" section.
> 
> 
> -Doug

-- 
With best wishes
Dmitry
