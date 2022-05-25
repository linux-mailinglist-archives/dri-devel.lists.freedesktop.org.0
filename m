Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99BE533435
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 02:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B232910F24E;
	Wed, 25 May 2022 00:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B0E10F24E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 00:17:22 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id rq11so16395099ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 17:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1LTAegdLBV4hZX2uHYmjk/dla88XNgBTSaD0OB3B+8M=;
 b=kKPLSMN6xMS2w0FJsTSTn5fBnoTHeJt+9CeeTUzN+aQ9dQimk0L1Aafe33w0wWCux7
 74qHznQVKBOW7spBnui2O1O6Gso4TYWEKlsqH/WH0dTLemoEDscHt4LEYFMSq1bfqCKC
 KQPHqZL7iohxsDVP7GweVtzVtE0Klup1Gh8qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1LTAegdLBV4hZX2uHYmjk/dla88XNgBTSaD0OB3B+8M=;
 b=j+ggXXBMni5BJzeRfJaOld0Uo2RIt88zwdhsVLXYc8UfRLl3OeJgqjxoX2+WlVmdl1
 39rRw/vOazw6JgevvY3syqsgTex8zANNkZP9P0alTylUdiGqVVcmjNoqKnCoMbE5M6vO
 OfoaIeRkHRPeDnakh1s8GKJeC6ypAnfFvtC6dSDmEWAl5R02026Da4UEf8XVOAFUsjfw
 ZO6iBkb8dD/CErfXqcmpz7KTZ75+ALh7nbSIFBYSPJ6Qhl0Hdqmoi8KhGSPQ3iybAIf0
 BtA6d1iR8GDdIZHYh5YqBlxVoemsAIY2Poiyut1viBCqUOQHrdI3Y3zQKJbZschrnvuE
 tB1w==
X-Gm-Message-State: AOAM533SlsEdjK97NvGswufxoMUdo+TTxEtxi/VTgGd3/WOvQ8OJZrrf
 ZvtCCiDaWdCk8sTHCnHUfFNn5eYzrXZea5s+3oY=
X-Google-Smtp-Source: ABdhPJzMKlw4pfWVhp1+0r1zrxFhJAYWKOPEs87faw4Q2dFsbLLNG3YVr5r/br5NZzZpO1q81hSuDw==
X-Received: by 2002:a17:906:c14c:b0:6f4:fdf3:4a3a with SMTP id
 dp12-20020a170906c14c00b006f4fdf34a3amr26526304ejc.525.1653437840542; 
 Tue, 24 May 2022 17:17:20 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 ec9-20020a0564020d4900b0042acd20d46csm10073763edb.92.2022.05.24.17.17.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 17:17:19 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id z17so4683826wmf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 17:17:19 -0700 (PDT)
X-Received: by 2002:a05:600c:2e53:b0:397:4730:ee7a with SMTP id
 q19-20020a05600c2e5300b003974730ee7amr5788119wmf.118.1653437839019; Tue, 24
 May 2022 17:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <1653082028-10211-1-git-send-email-quic_khsieh@quicinc.com>
 <1653082028-10211-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1653082028-10211-3-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 May 2022 17:17:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTtXZ9onaAZCsog=ENFb7_rsNhy=wviROAFMd05ycJqg@mail.gmail.com>
Message-ID: <CAD=FV=XTtXZ9onaAZCsog=ENFb7_rsNhy=wviROAFMd05ycJqg@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 20, 2022 at 2:27 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b144ae1..a93e153 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3130,6 +3130,7 @@ struct qmp_phy_cfg {
>         int num_resets;
>         /* regulators to be requested */
>         const char * const *vreg_list;
> +       const unsigned int *vreg_enable_load;
>         int num_vregs;
>
>         /* array of registers with different offsets */
> @@ -3346,6 +3347,10 @@ static const char * const qmp_phy_vreg_l[] = {
>         "vdda-phy", "vdda-pll",
>  };
>
> +static const unsigned int qmp_phy_vreg_enable_load[] = {
> +       21800, 36000
> +};

I'm a little confused. Why make a new parallel structure? Don't you
want to set a load for everyone who's using "qmp_phy_vreg_l"? It seems
like it would be better to do something like this:

struct qmp_regulator_data {
  const char *name;
  unsigned int load;
};

struct qmp_regulator_data qmp_phy_vreg_l[] = {
  { .name = "vdda-phy", .load = 21800 },
  { .name = "vdda-pll", .load = 36000 },
};

Right now some random smattering of devices are setting the load but
not others...

>  static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>         .type                   = PHY_TYPE_USB3,
>         .nlanes                 = 1,
> @@ -3711,6 +3716,7 @@ static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
>         .reset_list             = sc7180_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(sc7180_usb3phy_reset_l),
>         .vreg_list              = qmp_phy_vreg_l,
> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
>         .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),

One downside of the parallel structures is that there's nothing
enforcing that ARRAY_SIZE(qmp_phy_vreg_l) ==
ARRAY_SIZE(qmp_phy_vreg_enable_load), though the code below relies on
it.


> @@ -6175,6 +6186,18 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       if (cfg->vreg_enable_load) {
> +               for (i = 0; i < cfg->num_vregs; i++) {
> +                       ret = regulator_set_load(qmp->vregs[i].consumer,
> +                                               cfg->vreg_enable_load[i]);
> +                       if (ret) {
> +                               dev_err(dev, "failed to set load at %s\n",
> +                                               qmp->vregs[i].supply);

nit: indentation of the 2nd line seems a bit off?

> +                               return ret;
> +                       }
> +               }
> +       }

Feels like the above snippet belongs in qcom_qmp_phy_vreg_init() ?
