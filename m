Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A084FAD23
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 12:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AF010F541;
	Sun, 10 Apr 2022 10:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E3C10F53E
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 10:13:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso1619857wml.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cZo/m1bqkSUtO6Lom2S713GFjpljpLQ71ASMRg5Hn7w=;
 b=G58Fiwr1roHUchNnV8uMiaCFlRz2gDTmTryzv+V6xhpmcC2+7j2UYPcxbrxAQ9+rrC
 C/VGld+ZVH6mDkRxPT/wFr2XNJxJN4pjaPhTq70m+y4m/9bur6+N0IV9ClOGx0Tltjkd
 MAM9BzWlGt6Iu5Fy/dIk9cwzKb4emXlRp41t+JtYjnaiL+FwxQ7Zw4lGn9MPUS2ok9bH
 1kgqpfnryNMqmoX4D439+Hlf+b2V686Gx5+avWu3xvMntxGqAUO/5rtBrTax5dOgYJM4
 T1FnmDekMJtgEUXCjydAuYejPCtkWVgUqTCFawTlTWYz+xCScuKzzgQOBaSseJtnwDA/
 1Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cZo/m1bqkSUtO6Lom2S713GFjpljpLQ71ASMRg5Hn7w=;
 b=Yabx0yYy7SO7f/4eD2Wkng1DneRvRgM+qjqlm411q1Yz0t5plEcvzy/OJZ5Tebdo28
 gU2ClHvs09VFZoOLW77hjXMM+yL2cHnJn+wpRTcZEOqIBvAhb2tGJ2lMvKnyLl9ofG2C
 QDrk+wynEe17v2TdWOf4qSpMDUZDPR2wKz/WNO2SdctnP8uczyLF+HdFGdBBr0p3qd8K
 Q2DQKfwmqoyuMIkKmH89eIae6EK7kTj6PiJyyanJJ+k3CIilBouhPn+eFuMiiibn8u1C
 jjW77Byw9aVIAR9BsCivc712raj81qg2yjbdZvMjZZc3MI4Ex67Lxhqeq3YMl9ANM3M3
 iIog==
X-Gm-Message-State: AOAM530YIh+5pGw4hFDGADYnQ8UsP2iMyf1VYdE+6Y8fMKYpj8GFG0jo
 Wxkru935nTRYodY0qmq+Zok=
X-Google-Smtp-Source: ABdhPJxGa9m+AiJOIpY+QhfkC4bE2zpKqtFGZEkSzed002NzgVtl8V100+Yzc8eR8U8nqrx6SN/B3w==
X-Received: by 2002:a7b:cb0d:0:b0:38e:aaf3:b08f with SMTP id
 u13-20020a7bcb0d000000b0038eaaf3b08fmr8769112wmj.12.1649585587969; 
 Sun, 10 Apr 2022 03:13:07 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 i4-20020a1c5404000000b0038e7dc5e469sm14467590wmb.25.2022.04.10.03.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 03:13:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, hverkuil-cisco@xs4all.nl,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/5] drm: bridge: dw_hdmi: cec: Add cec suspend/resume
 function
Date: Sun, 10 Apr 2022 12:13:06 +0200
Message-ID: <3658461.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <4a6a4b70-3e24-3043-4e9d-f62e4798f28b@baylibre.com>
References: <cover.1649412256.git.Sandor.yu@nxp.com>
 <45739041a743cd435415ca53264678e57a653147.1649412256.git.Sandor.yu@nxp.com>
 <4a6a4b70-3e24-3043-4e9d-f62e4798f28b@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: shengjiu.wang@nxp.com, cai.huoqing@linux.dev, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 08. april 2022 ob 15:41:36 CEST je Neil Armstrong napisal(a):
> On 08/04/2022 12:32, Sandor Yu wrote:
> > CEC interrupt status/mask and logical address registers
> > will be reset when device enter suspend.
> > It will cause cec fail to work after device resume.
> > Add CEC suspend/resume functions, reinitialize logical address registers
> > and restore interrupt status/mask registers after resume.
> > 
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> > 
> >   drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 37 +++++++++++++++++++
> >   1 file changed, 37 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c index
> > c8f44bcb298a..ab176401b727 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> > @@ -62,6 +62,10 @@ struct dw_hdmi_cec {
> > 
> >   	bool rx_done;
> >   	struct cec_notifier *notify;
> >   	int irq;
> > 
> > +
> > +	u8 regs_polarity;
> > +	u8 regs_mask;
> > +	u8 regs_mute_stat0;
> > 
> >   };
> >   
> >   static void dw_hdmi_write(struct dw_hdmi_cec *cec, u8 val, int offset)
> > 
> > @@ -306,11 +310,44 @@ static int dw_hdmi_cec_remove(struct platform_device
> > *pdev)> 
> >   	return 0;
> >   
> >   }
> > 
> > +static int __maybe_unused dw_hdmi_cec_resume(struct device *dev)
> > +{
> > +	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
> > +
> > +	/* Restore logical address */
> > +	dw_hdmi_write(cec, cec->addresses & 255, HDMI_CEC_ADDR_L);
> > +	dw_hdmi_write(cec, cec->addresses >> 8, HDMI_CEC_ADDR_H);
> > +
> > +	/* Restore interrupt status/mask register */
> > +	dw_hdmi_write(cec, cec->regs_polarity, HDMI_CEC_POLARITY);
> > +	dw_hdmi_write(cec, cec->regs_mask, HDMI_CEC_MASK);
> > +	dw_hdmi_write(cec, cec->regs_mute_stat0, HDMI_IH_MUTE_CEC_STAT0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
> > +{
> > +	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
> > +
> > +	/* store interrupt status/mask register */
> > +	 cec->regs_polarity = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
> > +	 cec->regs_mask = dw_hdmi_read(cec, HDMI_CEC_MASK);
> > +	 cec->regs_mute_stat0 = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops dw_hdmi_cec_pm = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_cec_suspend, dw_hdmi_cec_resume)
> > +};
> > +
> > 
> >   static struct platform_driver dw_hdmi_cec_driver = {
> >   
> >   	.probe	= dw_hdmi_cec_probe,
> >   	.remove	= dw_hdmi_cec_remove,
> >   	.driver = {
> >   	
> >   		.name = "dw-hdmi-cec",
> > 
> > +		.pm = &dw_hdmi_cec_pm,
> > 
> >   	},
> >   
> >   };
> >   module_platform_driver(dw_hdmi_cec_driver);
> 
> As Hans said on v1, why don't you call dw_hdmi_cec_enable(cec->adap, false)
> in suspend and dw_hdmi_cec_enable(cec->adap, true) in resume ?
> 
> With this, CEC engine is not disabled on suspend.

This should not be done, at least not unconditionally. CEC wakeup 
functionality is used by Crust firmware for Allwinner boards. In fact, DW HDMI 
CEC controller was designed with suspend/resume functionality in mind. If 
properly set, it can autonomously scan for preset CEC messages and generate 
interrupt when found.

Actually, I'm not fan of this patch, since it looks like workaround for power 
management firmware not restoring previous state. Or is this HW issue? In any 
case, Allwinner SoCs with DW-HDMI CEC don't need restoring any register, so 
it's certainly not a general issue.

> 
> Do you plan to use the engine from the suspend code ?

As mentioned before, it's already done for Allwinner, so CEC should remain 
enabled.

Best regards,
Jernej

> 
> Neil




