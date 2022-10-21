Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6CB6073DE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 11:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E27710E59F;
	Fri, 21 Oct 2022 09:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E57110E656
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 09:20:05 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w8so1156935edc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 02:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dx9BLQvoaMG7DqLRzNjziMyZfaDs9wLP+FXBSPFHhbs=;
 b=IeIxqcDmqci/XYp27ASgSvY6TjvAGWP/vX/molOxDSmIuy7nlPwsqNXvyWOh1us0ib
 ZhLFgG63gxnmye6K4Amw4GCCR0+P89qu4znB7dqQ9GxmQUjkTQMvqYrsj18vXHZUQ39U
 pA/Bl6dutCzAzLfOmxE3JwQ1TmLjT3ZD3JjjIIpEhQQgMN+e2wQAUNK5+sInnRR2BK/5
 grar90MbZaVV5vbAbyWsufG7rfi46s+wwMSOb/x/fkFh/grlv62jm0kSjJx97GrUJuNu
 DqqnqXhLv1neufChA2ufsJSMD6lPW44+v25S7WcmcFauO0rat4XTLDA8QKhJOl8NwiV/
 HWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dx9BLQvoaMG7DqLRzNjziMyZfaDs9wLP+FXBSPFHhbs=;
 b=pnF1RuGxUXfbvUMQLFo8kQ6n8jDbV3wXT0zXYpdMd+OqIbLKDgy9xVMVkfTdmdH/8H
 ltHoJtS8qVhc6WKAq4kZkYJeOBHDyF0NFUD23t5Ugnv1/p+0pRkTHHqmCFy3KdAWz56G
 4n4jVYGPOrC7VStyvhLdAKp8jtCsfPmHbBiJTlDVeaSmojbPIqiMH0rBvy5nla/wgDxh
 yeBuDKb5xF3t0iTSYxWN1VNsXIrS8H27xqHB7or4Ps7S0gWFgdZ7NtPvGphjt5CcUxu8
 LfgVuTr83850FhofeVzMOnTLLU4WkzM5ukLV//hRTbGGFVy1QP0e8ja2H8EeSKXDN46B
 zqBQ==
X-Gm-Message-State: ACrzQf1PUjUX77GwVenUNmW+yoZR/77QGDXuL4bhKET2w0/TJ5UcmxY6
 cMXd9O4Io3+2kgZu8FAv2M9vAcuVmSxPkW4kHq/IkA==
X-Google-Smtp-Source: AMsMyM4ViG6lPBW24+5VDOQDsyFITJgNpDWDPYpNTvRQlLFCfnqWgoKjdiQklUs7JhwSnR6O19xJEIw8Y4SYmtdlBpk=
X-Received: by 2002:aa7:c98d:0:b0:45c:6451:320e with SMTP id
 c13-20020aa7c98d000000b0045c6451320emr16384826edt.172.1666344003494; Fri, 21
 Oct 2022 02:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-4-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-4-maciej.kwapulinski@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Oct 2022 11:19:51 +0200
Message-ID: <CACRpkdZLJa7NXjO6PrpRYG7e0W_8W2fMWRR1mMqtpx1MQ7kVFA@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] gna: read hardware info
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
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
Cc: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maciej,

thanks for your patch!

Overall I really appreciate the attempt to use DRM, this looks so much
smoother than the previous iterations.

On Thu, Oct 20, 2022 at 7:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:
>
> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
>
> Get the hardware information from register MMIO_IBUFFS
>
> Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
> Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>

> +static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
> +{
> +       return readl(gna_priv->iobase + reg);
> +}

If you are consistently using functions like this to read/write registers,
you are just re-implmeneting regmap-mmio, see
drivers/base/regmap/regmap-mmio.c
or look in drivers selecting REGMAP_MMIO and the neat tricks
they do to read/write and update registers with regmap.

Yours,
Linus Walleij
