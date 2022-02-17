Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D5A4BA03A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 13:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F76C10EB83;
	Thu, 17 Feb 2022 12:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B50610EB83
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 12:35:13 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id t14so8056311ljh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 04:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LWPD6Kgwc6gsaIwc/83kQA+CXXR+sZVYQ6mwJ+IXwU4=;
 b=hd6kCYaXxC+91SAwo9IDDgatkFAZJcDBJFFXqg+VxWpV/IpAs4DSzvsdPSJudNZm6G
 GCW0j+A5cZETBTsCPyWqRFV4dCYIoCZ0IBH0hgP+QalawR+1ORj2oPqNgxNJ/LyP0qaW
 PKLzU6hDgHozsS8MeuRGEZxYtvgsPf5nzkaebL0uFopcGy09/BKniZ3/2EQVmVl5IHyZ
 srDjK9bC2zmLLcRTq2K2uniI6JDKyv8D+PKh+mRFkSzE0qu3b9fFDmsbgH/JMm/Cufmg
 5pco7mnzpvz1+u8LFIO2h9EWncAeizuwiDPLdpQ0PMmdAKFb1g3dAhYjfG1zvU0ZinWo
 1KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LWPD6Kgwc6gsaIwc/83kQA+CXXR+sZVYQ6mwJ+IXwU4=;
 b=3BZcbl0g80vrAvn3P2aHrOcnqiw2Fx3jYkjY99vUqkkXL0OyCWZrEiUyo0edQ98420
 z51qxj/JbcUjv2/iVUKouO4XkWye8iNXcczRMw+pCD7bTABxymSxjvkQmNR46CgBO1H9
 io4hg0H/WlW4eIdffdFN8FPmKmduuk8QCbH+8es+2QXGRGgwoyxANZIcO0sb+Bf4ZJ1x
 rcXjpASVFIi7pYt/0wK6NvNZpU9V1htlr99pxiKMTaI9rPEtvtRgoCO6brel2k6PPMN3
 IssDeLFP8MzeIsBAQzRgDsO7hNCr6UdGjTPYIhpfUjn+O62c9S0+knXLVHULiYtc8IR/
 qDgg==
X-Gm-Message-State: AOAM5311OYD7oMP9hOgFCx4mHYvIO+q9fm7XslLcFAZOI08RDNI76Phf
 iOnet04WrY+/hywH59B4k3Y=
X-Google-Smtp-Source: ABdhPJyq4nnzOUVkvajYV7SPQuFphHf3LTtq76L3OCutr4uEkPgLgZrENhhQGtwqPU3Rgy4RmWFTEQ==
X-Received: by 2002:a2e:9b98:0:b0:244:c875:ba70 with SMTP id
 z24-20020a2e9b98000000b00244c875ba70mr2144114lji.284.1645101311775; 
 Thu, 17 Feb 2022 04:35:11 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id bt2sm3332145lfb.93.2022.02.17.04.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 04:35:10 -0800 (PST)
Message-ID: <cd66c9da-15c2-54e1-8016-8d951926eaa2@gmail.com>
Date: Thu, 17 Feb 2022 15:35:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 09/23] drm/rockchip: dw_hdmi: Add support for hclk
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-10-s.hauer@pengutronix.de>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220217082954.2967889-10-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

17.02.2022 11:29, Sascha Hauer пишет:
> The rk3568 HDMI has an additional clock that needs to be enabled for the
> HDMI controller to work. The purpose of that clock is not clear. It is
> named "hclk" in the downstream driver, so use the same name.

Have you checked that DSI works without the enabled hclk? I'd expect the
whole VOP to be clock-gated.
