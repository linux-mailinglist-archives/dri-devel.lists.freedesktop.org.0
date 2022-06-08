Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C234A543E0D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A49511A170;
	Wed,  8 Jun 2022 20:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1D811A170
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 20:59:42 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id i66so29582543oia.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=FcmDs4vqa+TasYfpZVJLUBpBUyUSt1C9HSlbOciM/mM=;
 b=YOMVdz3SS4pfTUc9aTrCX3WuwDW/bMFrATGKllus5yfo9SvZzofwCdlpHpiVN2Gns1
 d5AZNsNbRhYDQS0Desv3WuqN0QQ7dyGM9dNZLwc9yMWJqwcHPW4heAwNTOStgVTvxTZY
 UfX9r8aXugrnDZJlQ4ycpUXv10eFgNnA5EuHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=FcmDs4vqa+TasYfpZVJLUBpBUyUSt1C9HSlbOciM/mM=;
 b=NhW8UdOX96NpsjdBBEoizfkH1JwT7/ASPxwCTSe0+6krudvq5NCHFZ/HvX9yNXbq59
 viI9rOaCvg02viANdfGr7DGeHc48CJLAQ7zegY3vvJBr45x4hz3lzR0jH3MSHB7YGWRt
 QKxb/P0pM5x6q/wxV39T/HUBc8Nkmkzd32qkskGhaViMLSPzzGd5aeKlK0FJjd7SAGrn
 xE465ppetHh5pabGEy9R8M/NifVoAA2uuLAOWIKn5EXSewjdwiPR3pjewLF0nmbwcUN0
 Lgqx1lvE7kJtumYlui5qijKeXEjw4rmt3Y1uT7DxVta/oXEla+uQYXE8TLgoJAGd9N+N
 tjLA==
X-Gm-Message-State: AOAM531uev7TlQsL12Lx37mssOgD5sOeR4qnwEbAHGXj/kS0uOsweOz/
 lUbvMQA2H5otdvIlXThvHRaRMG00prGDuIUwRwKCIA==
X-Google-Smtp-Source: ABdhPJxnlj9sN3+K7oKRZ4gWu7RbfsNuNQkj4EkKq1yNdOgmwVZ5t/rmtKGAs68dcNiueV47wbdHzEDCVycwsnvzh9U=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr3564449oib.63.1654721981740; Wed, 08
 Jun 2022 13:59:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:59:41 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-7-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 13:59:41 -0700
Message-ID: <CAE-0n53z_nWsgVVn-4LbsP1GuzTgCa+DDDDE0y8k3+s-t=eSBA@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] drm/msm/hdmi: drop unused GPIO support
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-08 05:07:17)
> @@ -543,41 +529,16 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
>         hdmi_cfg->mmio_name     = "core_physical";
>         hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
>
> -       for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
[...]
> -               if (gpiod)
> -                       gpiod_set_consumer_name(gpiod, msm_hdmi_gpio_pdata[i].label);
> -               hdmi_cfg->gpios[i].output = msm_hdmi_gpio_pdata[i].output;
> -               hdmi_cfg->gpios[i].value = msm_hdmi_gpio_pdata[i].value;
> -       }
> +       hdmi->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
> +       /* This will catch e.g. -PROBE_DEFER */

EPROBE_DEFER?

> +       if (IS_ERR(hdmi->hpd_gpiod))
> +               return PTR_ERR(hdmi->hpd_gpiod);
> +
> +       if (!hdmi->hpd_gpiod)
> +               DBG("failed to get HPD gpio");

Does DBG() add newlines?

> +
> +       if (hdmi->hpd_gpiod)
> +               gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>
>         dev->platform_data = hdmi_cfg;
>
