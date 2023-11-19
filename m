Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747037F096F
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 23:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB12E10E0EC;
	Sun, 19 Nov 2023 22:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C7110E02E
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 22:26:38 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a87ac9d245so41948767b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 14:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700432797; x=1701037597; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tKHAEH8pm+mdyGm3S8xcZ989PK/m0lepxYWwzGVtNa8=;
 b=nq/DaxFcnFp44LuHulXQtV9qp7u6VUqdWY87UtrnERDu7Z65tF0UJsdP44KCsCL/fQ
 2xtI76S6kFQEeBhD1bC0nE80yNpVIy3G1/LcyaSRaE0ABc4zvv//HctiCwoVgcy3ygvs
 gRrI2WCnRIFBRAPehB7/9xKVb8H2eLQy8xJPKdJ1mXC30sw0Tz++IHaZUoahHbxGtCNI
 irR7axmlew9pqvqfDio0rVt45EYfJ0s1s302u3mQo8m8J1zQxrwSgVJs63h0+VJ4xqAt
 fx6jgcd9u7FfvQX8HYJfAhTqCWn7yBSaT3+kfNm6BcJUDGWm6Vlu433kbyBodkUDPmt5
 pVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700432797; x=1701037597;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKHAEH8pm+mdyGm3S8xcZ989PK/m0lepxYWwzGVtNa8=;
 b=l2JJPFEITS1LE3ZwKKdRUfg0l0HGhfks5ClGR9kauj56wcbGjXzIwWxlkV4Vr/Fu6F
 ay6SrxxRhuXADVyKNI3/OxHR86b8bI6rscxCJwLJMzZ9mMOw7QUWNPqaOKtiKAhAtA+Q
 qHzzglzVzADS5A1bdShPzcPrgRwffPTAuXQpFaVYGFkKSxvA3ouNiDN+1uMOgRmNqrmm
 W+jh9+zYF0JraAQpHsmZ6ryPloBY1zPZhI9Qgow+di2Nx+lOaf8eNu9s3mb5uq6JBMXy
 rIDB72xZuTevLe/rP0GDXl7KlH9hHHyoRdA9bKV3Ox0NagH737KXd5jYkuH0NbWcUbsQ
 tiSw==
X-Gm-Message-State: AOJu0YzPJvMFM9a4x4YTy6NibJciTiosnluqJVmrMfik/3GQI76wAqoB
 U5VZcspYv7cwr5BcO0Jnc3HUBTUXjI0rMd6VCqUx2Q==
X-Google-Smtp-Source: AGHT+IEtI+WRNtdT4PtRIsdb7Gg1gy47h39hKWZ51B3OX/a2prMfArKvd71uD8hG3OuEWkkjavfqqMPGUN001gM/ruY=
X-Received: by 2002:a0d:fb86:0:b0:5a7:be61:d52b with SMTP id
 l128-20020a0dfb86000000b005a7be61d52bmr6291046ywf.24.1700432797500; Sun, 19
 Nov 2023 14:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20231119112826.5115-1-hkallweit1@gmail.com>
 <20231119112826.5115-15-hkallweit1@gmail.com>
In-Reply-To: <20231119112826.5115-15-hkallweit1@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Nov 2023 00:26:26 +0200
Message-ID: <CAA8EJpr6uVn+MA=yzFrCybKx7j2YDXALV1i-Gh01PaR84qRkXg@mail.gmail.com>
Subject: Re: [PATCH v3 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove
 I2C_CLASS_DDC support
To: Heiner Kallweit <hkallweit1@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 19 Nov 2023 at 13:28, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
>
> Preferably this series should be applied via the i2c tree.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'm fine with merging this patch through any of the trees that picks
up the rest of the patches.

>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_i2c.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
> index de182c004..7aa500d24 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
> @@ -249,7 +249,6 @@ struct i2c_adapter *msm_hdmi_i2c_init(struct hdmi *hdmi)
>
>
>         i2c->owner = THIS_MODULE;
> -       i2c->class = I2C_CLASS_DDC;
>         snprintf(i2c->name, sizeof(i2c->name), "msm hdmi i2c");
>         i2c->dev.parent = &hdmi->pdev->dev;
>         i2c->algo = &msm_hdmi_i2c_algorithm;
>


-- 
With best wishes
Dmitry
