Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96E607D67
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 19:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B43310E58B;
	Fri, 21 Oct 2022 17:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF1010E58B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 17:21:35 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id g10so3915274oif.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 10:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=A6BqgqIxQ+q3oABy/KVS7FxTx0acwuSVWX67BzMj1gk=;
 b=f0nVmiNw0x2GGqQ57S0MHq3NjFd8sUe5YLfcPOwspvxvypgP+cCpLhpNjPq6N6+CXP
 +Q0C/RoViUG+lyDIum7B7rwHu9/lqryapUDDBwzENKf051uyNXPT1Eu9fIgFQ1VFbqZf
 6XkDVmSa9qwO0qiTxQaAgB+yJfoRh3noPTlNLizvy6WRHLxedoEXqVuTmx9ic2Ccaegy
 HI0Xci1CnQUW7bVAVDIttvYeUfCyCf1jH5un9YxdPJlISULB2whXDSj9SPZRlE5Yolgh
 tBAxGNaVZir22XaGDM8po83dHjz7yWQrhde0v7cPOVIvfPX54xGmHI+f6cYmRTkphONF
 KyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A6BqgqIxQ+q3oABy/KVS7FxTx0acwuSVWX67BzMj1gk=;
 b=KfAOOttxQTpYhrRqIaSrR4PvNOcpK7nKuvzgM71kYdZCC2vg2igMidUAkSdi8sIxtc
 cEfnblkpXt3Y7LrmiXoF9eR/iSCJCeSpBX7lCUaDX/5FRmQwELoNCa+ER7YMMA+Fkwsr
 onOUMMfayB7mtaRACgwyc6Ob9Wbhr9S+y4m0eCSPO0FK9WnPbrgxguEes6cUJz1QfYZI
 8EweZHYdXNN46WyXj2L0TRJHXQEZXdk5w/V7JlvCCRxYGYPiNz2BxLdZEA8n10NC66zx
 ZqUaiSYl3XKL5TmxDG5asBGOPwtnGvK/8jUmkubsUuAiSS/6xIyfnsM1UhXPSJkdQ8d2
 MiaA==
X-Gm-Message-State: ACrzQf2xHsRI+bdY9l8Ro9lBFHMg7fMAydXgLPhLOUeqkNn2My7Z28SQ
 nLz4CO4+7dsV01ukLom2pRk=
X-Google-Smtp-Source: AMsMyM6MoqvyIyxliKOCqZiFkvP91AsjRQGjeNSwYlnxadYUwlrS7DJ88HFJP0uITquBRGXm8Nv8tQ==
X-Received: by 2002:a05:6808:1994:b0:354:d97e:d4aa with SMTP id
 bj20-20020a056808199400b00354d97ed4aamr23292247oib.148.1666372894339; 
 Fri, 21 Oct 2022 10:21:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a05680809a200b00350a8b0637asm1305671oig.47.2022.10.21.10.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 10:21:33 -0700 (PDT)
Date: Fri, 21 Oct 2022 10:21:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 3/4] hwmon: lm90: simplify using
 devm_regulator_get_enable()
Message-ID: <20221021172132.GA1890681@roeck-us.net>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <a1fa4364cbb775de25478117dd22dda0742089e3.1666357434.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1fa4364cbb775de25478117dd22dda0742089e3.1666357434.git.mazziesaccount@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amlogic@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 21, 2022 at 04:18:43PM +0300, Matti Vaittinen wrote:
> Drop open-coded pattern: 'devm_regulator_get(), regulator_enable(),
> add_action_or_reset(regulator_disable)' and use the
> devm_regulator_get_enable().
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Applied to hwmon-next.

Thanks,
Guenter
