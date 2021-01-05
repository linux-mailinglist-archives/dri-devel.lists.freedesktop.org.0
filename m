Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7427C2EB3C7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 20:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CC96E077;
	Tue,  5 Jan 2021 19:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648DE89F4A;
 Tue,  5 Jan 2021 19:59:42 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id 23so1240915lfg.10;
 Tue, 05 Jan 2021 11:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=w3y172ugq1A8+DfHjAatLK3oOwXsMQTLgHeUXaHnUCU=;
 b=tBCWlgeIGyCHy0ayfKSb2hKeKiEoFzcgiAtzEEfHQ70m4TqSwGsZqX3Xnx4VJJnvbt
 n0OP+1QygM+MIfVv5A7Ue/siY9qUR3JrwvKGHP2W3QTyiHhYMLJ6zdE5Ged8pj1n+RjK
 Bb3lYAmgD2urDHD+97GcmaR9/cYTYUc3lvg36iKQWZkukTkf+xsDRudzvwcq2WaBpdlE
 x0mE68kMXoFvZrIZWNkF8AnSu3p+LzNJVWTcYgez90NbFkWXHh7/NpKY2fPkuOEA7ZKB
 w1aIj7VtjxtrBSQz6IaOTRs86szJNL8Gutp0tvolPIaAjingl3R6BlglT66Kk2USW+JA
 gNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=w3y172ugq1A8+DfHjAatLK3oOwXsMQTLgHeUXaHnUCU=;
 b=dgTZH0/tC1nYNRCgpcOuY5TTv+H0if9RmBhmFYaPlQY6ejziRuQ5JKi1oq8ozCYVO5
 rAEKfQ2Z6jfcJixMkTRfA4QpdIgSVxRc5DOzHFRH8hHmMkpqF1cS4QTHQkZTLLc3yqNa
 fgHWMFOBdppb+jMIf6Oit7uwXccZMxPeAyNTC+QvgCnIXNOWPefhmNKdIgc0vvhov9L3
 NKhlJz2RCI61CWuoJ5A5nt8qRhi0JIYWHzUcsCpg1AALRJSq4Nw0AUzkQzcKRZ75sVA/
 vFPy1Cit3d5c7KcnTwSUtSU9LvVmoHVDZvNy08FEIuBkqz3wjoYFFkg3flcfr8YZhyxk
 2NiA==
X-Gm-Message-State: AOAM533CGhtW2KiPDsUhF88Qj/GrhVhqkaFmtDrzUX5ev04djSgaFX7d
 b0KTCk7NNBjZd6OsYoOsO8r1OzM1iMEnkFh4Fo8=
X-Google-Smtp-Source: ABdhPJxefm71gCAP6d5oS17blFAwFnEd9spoEWiCV79bTaAMdk7JG8QCTPTs9zQB67DoNESWvQ4nEkOaTe/eEP/zqxs=
X-Received: by 2002:a2e:8156:: with SMTP id t22mr509678ljg.263.1609876780665; 
 Tue, 05 Jan 2021 11:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20210103035540.23886-1-tiny.windzz@gmail.com>
 <CAGTfZH37=e4RgdR4xg-3s9-pRjqunHi2jfPQqQgVWkxW94GwOA@mail.gmail.com>
In-Reply-To: <CAGTfZH37=e4RgdR4xg-3s9-pRjqunHi2jfPQqQgVWkxW94GwOA@mail.gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Wed, 6 Jan 2021 04:59:04 +0900
Message-ID: <CAGTfZH0kg=-MLrvEb+oHkaAuS3mV+o+Oia=wUCf=n2v7s1oXMg@mail.gmail.com>
Subject: Re: [PATCH 28/31] PM / devfreq: imx8m-ddrc: convert to use
 devm_pm_opp_* API
To: Yangtao Li <tiny.windzz@gmail.com>
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
Reply-To: cwchoi00@gmail.com
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 gustavoars@kernel.org, jirislaby@kernel.org, David Airlie <airlied@linux.ie>,
 linux-mmc@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 tanmay@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 natechancellor@gmail.com, Thierry Reding <thierry.reding@gmail.com>,
 tongtiangen@huawei.com, Guenter Roeck <groeck@chromium.org>,
 marijn.suijten@somainline.org, Dmitry Osipenko <digetx@gmail.com>,
 steven.price@arm.com, Matthias Kaehlcke <mka@chromium.org>,
 chandanu@codeaurora.org, emil.velikov@collabora.com,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, harigovi@codeaurora.org,
 adrian.hunter@intel.com, Viresh Kumar <vireshk@kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, dl-linux-imx <linux-imx@nxp.com>,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 rikard.falkeborn@gmail.com, kalyan_t@codeaurora.org,
 linux-tegra@vger.kernel.org, varar@codeaurora.org, mchehab@kernel.org,
 sean@poorly.run, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, akashast@codeaurora.org,
 rnayak@codeaurora.org, parashar@codeaurora.org, tomeu.vizoso@collabora.com,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, agross@kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, miaoqinglang@huawei.com,
 hoegsberg@google.com, yuq825@gmail.com, ddavenport@chromium.org,
 masneyb@onstation.org, Shawn Guo <shawnguo@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yangtao,

On Tue, Jan 5, 2021 at 1:13 PM Chanwoo Choi <cwchoi00@gmail.com> wrote:
>
> On Sun, Jan 3, 2021 at 12:58 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
> >
> > Use devm_pm_opp_* API to simplify code.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/devfreq/imx8m-ddrc.c | 15 ++-------------
> >  1 file changed, 2 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
> > index bc82d3653bff..9383d6e5538b 100644
> > --- a/drivers/devfreq/imx8m-ddrc.c
> > +++ b/drivers/devfreq/imx8m-ddrc.c
> > @@ -370,11 +370,6 @@ static int imx8m_ddrc_check_opps(struct device *dev)
> >         return 0;
> >  }
> >
> > -static void imx8m_ddrc_exit(struct device *dev)
> > -{
> > -       dev_pm_opp_of_remove_table(dev);
> > -}
> > -
> >  static int imx8m_ddrc_probe(struct platform_device *pdev)
> >  {
> >         struct device *dev = &pdev->dev;
> > @@ -419,7 +414,7 @@ static int imx8m_ddrc_probe(struct platform_device *pdev)
> >                 return ret;
> >         }
> >
> > -       ret = dev_pm_opp_of_add_table(dev);
> > +       ret = devm_pm_opp_of_add_table(dev);
> >         if (ret < 0) {
> >                 dev_err(dev, "failed to get OPP table\n");
> >                 return ret;
> > @@ -427,12 +422,11 @@ static int imx8m_ddrc_probe(struct platform_device *pdev)
> >
> >         ret = imx8m_ddrc_check_opps(dev);
> >         if (ret < 0)
> > -               goto err;
> > +               return ret;
> >
> >         priv->profile.polling_ms = 1000;
> >         priv->profile.target = imx8m_ddrc_target;
> >         priv->profile.get_dev_status = imx8m_ddrc_get_dev_status;
> > -       priv->profile.exit = imx8m_ddrc_exit;
> >         priv->profile.get_cur_freq = imx8m_ddrc_get_cur_freq;
> >         priv->profile.initial_freq = clk_get_rate(priv->dram_core);
> >
> > @@ -441,13 +435,8 @@ static int imx8m_ddrc_probe(struct platform_device *pdev)
> >         if (IS_ERR(priv->devfreq)) {
> >                 ret = PTR_ERR(priv->devfreq);
> >                 dev_err(dev, "failed to add devfreq device: %d\n", ret);
> > -               goto err;
> >         }
> >
> > -       return 0;
> > -
> > -err:
> > -       dev_pm_opp_of_remove_table(dev);
> >         return ret;
>
> devm_devfreq_add_device() doesn't return any integer value.
> Even if devm_devfreq_add_device() returns the right devfreq instance,
> the 'ret' value  is not the return value of  devm_devfreq_add_device().
>
> On this patch, 'ret' value of 'return ret' is from imx8m_ddrc_check_opps().
> Surely, it is well working with this modification. But, it is not code
> for exception handling.
> So, we need to remain the following codes:
>
>     return 0;
> err:
>     return ret;
>

'err' is not necessary. You better to edit it as following:

if (IS_ERR(priv->devfreq)) {
    dev_err(dev, "failed to add devfreq device: %d\n", ret);
    return PTR_ERR(priv->devfreq);
}

return 0;

-- 
Best Regards,
Chanwoo Choi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
