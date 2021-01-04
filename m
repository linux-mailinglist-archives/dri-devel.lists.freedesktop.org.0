Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE7F2E91D0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D5E898B7;
	Mon,  4 Jan 2021 08:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14D789B7B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 07:27:59 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id m5so10364456pjv.5
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jan 2021 23:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FV11oIRk+TS/pD/8cNBoW/mAuSHG2JQfCawYOikAwtE=;
 b=ztavayUlJb9IYhviZXLVPDXytXrfD2aw4hqUXe6JBxG3R1ObnfA5+HWwIajvVgpWj9
 1on2MgzPWWQMeg/0X/G2jJ1qzOz+W3rBCLo5GgkVhRObxgG4TCdpqWJI0+y++DkIYNJE
 h8NG4lDrCZxE3VBlzQ83b0I/rV6xqWOPBYYG40rNoNzEbUZeBeGqY21yf6eE86nGddgq
 pIJl9l5S3NGgr5PCZlM83o3tQ+0n2BlWb3lcdEhyU2eaLqyyn7vNNK3THK4N7YZz/lyE
 ngMTXHgpzuWDcqsjiW3miMdFq4mnvkjU1tUf/2n79EJ0sHez/qLW/VyfVOGOJ7sBUHoC
 IO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FV11oIRk+TS/pD/8cNBoW/mAuSHG2JQfCawYOikAwtE=;
 b=p1PvHXTIuNdjTF2xnPsXZSzyHb+wefKSHEKDrfTkH87Zv/dXMMZOcv7SglR0a+NGxP
 IVBujN5vNLMVGos/afYvKoRZxRgufcA+z7JEHlVtZU9JO75uBQJqLtmlCUIH7z54yYcA
 mn10smEQX3XVsyqc0zQ/HDNyOmvSmR3g1M8h48dIOoWQRImhuMFnGvICN5Dbb1Gl9tcZ
 Heu/JFRyfANRBXXWvcnUW6rZ4Gyn/YGVEmpi5GVh+0Bvkl+7Sb/yl27ghcqUHQurTDJ6
 HnZpVNBd1UGPxIXVJt98fL/fgDyejZVrRnq/mp8ETDffABC8YEXIemxa8Q+ruJdcP+QL
 34AQ==
X-Gm-Message-State: AOAM531RaifuP9B52bqKpoQbO+XBpUdzMMLcKDufnX1N7EM2tPBjiuk7
 rGKU22VpHYfrEtjnFmwu0L96Hw==
X-Google-Smtp-Source: ABdhPJz+3zSxoQuv088o2E7z4G5iPXrMvcrUmHufPvXe/YbO6D9/ZpI0OF0DVfbjBZBJFqdSEZ/lbQ==
X-Received: by 2002:a17:902:e9d2:b029:db:d4f6:b581 with SMTP id
 18-20020a170902e9d2b02900dbd4f6b581mr47937489plk.34.1609745279376; 
 Sun, 03 Jan 2021 23:27:59 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id a31sm59943909pgb.93.2021.01.03.23.27.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:27:58 -0800 (PST)
Date: Mon, 4 Jan 2021 12:57:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 07/31] serial: qcom_geni_serial: convert to use
 devm_pm_opp_* API
Message-ID: <20210104072756.xdvsryok3sxdiytg@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-8-tiny.windzz@gmail.com>
 <20210104071910.2a2otwxyniu7c22z@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210104071910.2a2otwxyniu7c22z@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dropped lots of people from cc list

On 04-01-21, 12:49, Viresh Kumar wrote:
> On 01-01-21, 16:54, Yangtao Li wrote:
> > Use devm_pm_opp_* API to simplify code, and we don't need
> > to make opp_table glabal.
> > 
> > Let's remove opp_table from geni_se later.
> > 
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/tty/serial/qcom_geni_serial.c | 23 +++++++++--------------
> >  1 file changed, 9 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index 5aada7ebae35..36a92df8ec11 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -1352,6 +1352,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> >  	int irq;
> >  	bool console = false;
> >  	struct uart_driver *drv;
> > +	struct opp_table *opp_table;
> >  
> >  	if (of_device_is_compatible(pdev->dev.of_node, "qcom,geni-debug-uart"))
> >  		console = true;
> > @@ -1433,13 +1434,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> >  	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
> >  		port->cts_rts_swap = true;
> >  
> > -	port->se.opp_table = dev_pm_opp_set_clkname(&pdev->dev, "se");
> > -	if (IS_ERR(port->se.opp_table))
> > -		return PTR_ERR(port->se.opp_table);
> > +	opp_table = devm_pm_opp_set_clkname(&pdev->dev, "se");
> > +	if (IS_ERR(opp_table))
> > +		return PTR_ERR(opp_table);
> >  	/* OPP table is optional */
> > -	ret = dev_pm_opp_of_add_table(&pdev->dev);
> > +	ret = devm_pm_opp_of_add_table(&pdev->dev);
> >  	if (ret) {
> > -		dev_pm_opp_put_clkname(port->se.opp_table);
> > +		devm_pm_opp_put_clkname(&pdev->dev, opp_table);
> 
> We shouldn't be doing this here, i.e. put_clkname. Even when the OPP
> table isn't present, this driver calls dev_pm_opp_set_rate() which
> behaves like clk_set_rate() in this case and so the clk name is still
> required by the OPP core.

The same problem is there with multiple patches, fix them all please.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
