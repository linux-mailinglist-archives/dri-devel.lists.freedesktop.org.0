Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F111D53B6BC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE138112D58;
	Thu,  2 Jun 2022 10:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C33112D58
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:15:21 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id j3so3287185qvn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 03:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGK0zPU93j8Ge2AzP1KbQCzIzb8femdDnLBXlrSmAF4=;
 b=rGExpiOaZ1dgPz/IIE7N5VFS9CKXCNxc1uESwdH+rJIsRxPqcrxLlunbdvz9yDCtDJ
 voN25Ke98eRyOfhycMhlE6/BhgKy9kGqk0aVat6o8LmN+Dvtjo+t62ITp+NdHdJ8DaZp
 ZK1f4mTGjjBMuaKsCEJuIAl4s/rcnw8J1EsiMHkl+n5vTmEsXXhs/HU2YbrLab9gd73W
 iO3SqhvP749pR96qrqOJg0OsiHYyZEd0RhLMp5fjNgjRvmKi2oDsFTp7dnlJPyIfNnhF
 ozhd2EusWxJT1KgDiXtn64VqP2yLPhmHegWOXpJfg3beGU/wXASf74PTlh8Zrta1jYLL
 E8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGK0zPU93j8Ge2AzP1KbQCzIzb8femdDnLBXlrSmAF4=;
 b=jPkjbrmogDAtYAayzpksaf/wcq4xn2AX2c8zf+E5/5JCQ9ZhjFVcBZ7T5+3hU3kHfL
 tH+W5ZAF1Q85wVm+1uCI1O9f4oHSiQSA5STcBZyC+F0F2vEApTokaV4riO89xNcf9BV0
 8XeWw/b+9Zw9sHUxasw+7TJ+Ym826lwevzvdMuGvwnRre9xqOW7OjK6+TIAs2EjtkEvm
 PyPU4pECqcU7Vx5Bc+Llsh6tj+pcvJSqSgx9xqzzSKTAJ4IFJ1X3EGF+Q6iGpAquETNW
 HBMXy5dQygWtPhMjwSsO8vObN1slYP5yNtwhezBvLqaupn3vMf6/E49Ko34iYQLvjL8o
 f5jA==
X-Gm-Message-State: AOAM532bHZMo5dx9312MkT28rigCk7U6c9e6r0WQPFIe82hclu9xasQS
 yHGuVOCMIWeKAQb/TPt1B/LTHNbQ86h3KvcfImynVw==
X-Google-Smtp-Source: ABdhPJwZVrgPJE/PLNJFp4EqWodbfWB4zXOatz/ZqouAf8UAnlORn21DQ04M5d/rYnMf/jo5weyIf8kqSfgKMKENP48=
X-Received: by 2002:ad4:5b81:0:b0:465:ded8:780 with SMTP id
 1-20020ad45b81000000b00465ded80780mr4768269qvp.119.1654164920448; Thu, 02 Jun
 2022 03:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220601220747.1145095-1-marijn.suijten@somainline.org>
 <20220601220747.1145095-3-marijn.suijten@somainline.org>
In-Reply-To: <20220601220747.1145095-3-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Jun 2022 13:15:09 +0300
Message-ID: <CAA8EJpp0Nv=H3Xm-PQyr0__KA_tP1p6LeSkDwGSMBx0X8kpZ8g@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] clk: mux: Introduce
 devm_clk_hw_register_mux_parent_hws()
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Jun 2022 at 01:07, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Add the devres variant of clk_hw_register_mux_hws() for registering a
> mux clock with clk_hw parent pointers instead of parent names.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  include/linux/clk-provider.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 4e07621849e6..316c7e082934 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -980,6 +980,13 @@ struct clk *clk_register_mux_table(struct device *dev, const char *name,
>                               (parent_names), NULL, NULL, (flags), (reg),     \
>                               (shift), BIT((width)) - 1, (clk_mux_flags),     \
>                               NULL, (lock))
> +#define devm_clk_hw_register_mux_parent_hws(dev, name, parent_hws,           \
> +                                           num_parents, flags, reg, shift,   \
> +                                           width, clk_mux_flags, lock)       \
> +       __devm_clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL,  \
> +                                  (parent_hws), NULL, (flags), (reg),        \
> +                                  (shift), BIT((width)) - 1,                 \
> +                                  (clk_mux_flags), NULL, (lock))
>
>  int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
>                          unsigned int val);
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
