Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988A8644831
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 16:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D946A10E05A;
	Tue,  6 Dec 2022 15:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF7010E05A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 15:40:49 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id n20so7291900ejh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 07:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VQDzBqsBTE8WLwYAzMMGHQmUn+CuZZVkF9Y36XFfYec=;
 b=kLrPEpykbsLXwkED/QlJ1FLFFvX9oUCpMJKPH4x0GiU8byIpo6HmWG9Xl4xlk8maqA
 aKCRmP7kd8Dz9IRbEOKS5YbYuuxkhhJl9Q5sjHr0iuB9l2Et/XZi1FDpz4I54nt6Dtg4
 Xp+7QF9vE9mokQorQF9Rn7+Mt/gaqnt96+GEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VQDzBqsBTE8WLwYAzMMGHQmUn+CuZZVkF9Y36XFfYec=;
 b=5QX1LecBaNU4O/sGxmYiAj4K9FVRqZmS3mGX/tAG5Tap24gr9sOpNtafEjZAGOy+6B
 rmiY5D/8dfuTj2be2sTsID9Cd4FvSHtdWTnCG/lW3LqvnM1E3QxdjQNjuJneDObQo7i0
 ur58oA9AlVSpeCRkLrSJXDOE+AZcD9oZLgTZSf1L537412xsNcIUrlpEOYKnsMDOL+Ll
 /JeN8bNpkcbTgult+bS+Yi+zNwB7RqbNCQw94e25S478MnaPkTJuderKUlKEkZCTXZ/o
 2rw5X6s2sF1CLSjTE6gb2I03N+3z/h9iSlAqEluusoiWzGOU5xyC+HsDZJ8mGjc3obdL
 fvcw==
X-Gm-Message-State: ANoB5pk2+pweAzwy4VZY9anEJ4r/slzwTt3gHS5NiMHIuCy4qowE9oIi
 PQ958jd97rIhgzs77akrR/QYlmVp1HJoCi9Glas=
X-Google-Smtp-Source: AA0mqf5VOopERT5WjxE2ZNz9QpK77ZvWcAQY9UGKQZsy7nFRfXKxu/EN4sVS98wJMIewY3uGSmpSFQ==
X-Received: by 2002:a17:906:abd1:b0:7bd:a1a7:1b43 with SMTP id
 kq17-20020a170906abd100b007bda1a71b43mr180043ejb.2.1670341248263; 
 Tue, 06 Dec 2022 07:40:48 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 k24-20020a1709065fd800b0078d76ee7543sm7512020ejv.222.2022.12.06.07.40.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 07:40:46 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id l26so5239369wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 07:40:45 -0800 (PST)
X-Received: by 2002:a05:600c:3c8e:b0:3d0:69f4:d3d0 with SMTP id
 bg14-20020a05600c3c8e00b003d069f4d3d0mr23096034wmb.93.1670341245678; Tue, 06
 Dec 2022 07:40:45 -0800 (PST)
MIME-Version: 1.0
References: <20221206075512.812389-1-linmq006@gmail.com>
In-Reply-To: <20221206075512.812389-1-linmq006@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 6 Dec 2022 07:40:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XXoue_vkuM7TmxnECfT3-p9d-OH=H_dyeoOk_Kp4kK2w@mail.gmail.com>
Message-ID: <CAD=FV=XXoue_vkuM7TmxnECfT3-p9d-OH=H_dyeoOk_Kp4kK2w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix memory leak in
 msm_mdss_parse_data_bus_icc_path
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 5, 2022 at 11:55 PM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_icc_get() alloc resources for path1, we should release it when not
> need anymore. Early return when IS_ERR_OR_NULL(path0) may leak path1.
> Add icc_put(path1) in the error path to fix this.
>
> Fixes: b9364eed9232 ("drm/msm/dpu: Move min BW request and full BW disable back to mdss")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index e13c5c12b775..a38fa9a9a3d6 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -49,8 +49,10 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
>         struct icc_path *path0 = of_icc_get(dev, "mdp0-mem");
>         struct icc_path *path1 = of_icc_get(dev, "mdp1-mem");
>
> -       if (IS_ERR_OR_NULL(path0))
> +       if (IS_ERR_OR_NULL(path0)) {
> +               icc_put(path1);
>                 return PTR_ERR_OR_ZERO(path0);
> +       }
>
>         msm_mdss->path[0] = path0;
>         msm_mdss->num_paths = 1;

Hmmm. I guess the original author of the code (which wasn't me--I just
restored the code that was deleted by a previous change) was assuming
that if mdp0-mem had a problem that mdp1-mem would also have a
problem. That would mean that you wouldn't need to call icc_put() on
it.

...and, in fact, your patch doesn't handle that case, does it? If
_both_ of the two are error or NULL then you'll be calling icc_put()
on something invalid. I guess icc_put() handles those cases without
crashing but it will give a WARN_ON() splat if it happens to be an
error...

Really, there's a better solution anyway. Instead, you should do:

path0 = of_icc_get(dev, "mdp0-mem");
if (IS_ERR_OR_NULL(path0))
  return PTR_ERR_OR_ZERO(path0);

msm_mdss->path[0] = path0;
msm_mdss->num_paths = 1;

path1 = of_icc_get(dev, "mdp1-mem");
if (!IS_ERR_OR_NULL(path1)) {
 ...
}

In other words just defer getting path1 until after you've checked
path0 for an error.

-Doug
