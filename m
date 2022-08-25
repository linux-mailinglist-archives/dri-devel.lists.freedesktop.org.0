Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9005A184F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 20:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249E010E898;
	Thu, 25 Aug 2022 18:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F381F10E898
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 18:06:22 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 t11-20020a05683014cb00b0063734a2a786so14420493otq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 11:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=vvKNhwodo3b0D7wr+xi2jqqIEIqtl+Yrqm5TAHzIjcc=;
 b=kpMw1/0cz2l0wLS5eCf0pnYaOSzM1oU82bCuNWzIxcLoeGHTzZbqIHLicPez40Cb/5
 L2Yt8dlKbIbpOn9tzU3csXG41A/LrkV+60n/R9SffFc13VjBWIkn5JQMpwtCCFSTi8Kz
 YWjboilvOWYg7X9U95pelUBTngmBeoDX+husI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=vvKNhwodo3b0D7wr+xi2jqqIEIqtl+Yrqm5TAHzIjcc=;
 b=YMFEv6ZcEHR+OxHl5hSTk4djCfkapONdJPoLohcG2Epe/CMqy86zJQlPlMN3Nh1sgB
 IhWB1O/VX/YAXSXU8ccB0psehSpJEH/r5MH/JxD0Pdu2mPy+IdKCXn9AQwi9NcUWPaR0
 MQXTgocy71bsCAZl0ETARJE+VuW2N554F0acQN1n0N716RF+dNyRTAgNW4EwBUBP/QvD
 fJWzuaPXViqb6qUhGZd2aY3D3J536NJmWkXk3AfayQwV540riO3jNSNolJTqxTBweBo3
 Bsb3jbahd2CTlzIQR8VEpasmVBPPGAyJah9tH7D8xoUjhq8l5QKehj57YglP350kvn4S
 928g==
X-Gm-Message-State: ACgBeo0pOKHD9XlUB3RhgaBtxBDugmvXXHPl2sRbJMnxB1ioBq6MmuMh
 rTrnJZ0gzgUWy+4nCEVXAE1BZiHs1csE3A==
X-Google-Smtp-Source: AA6agR7FU0BTBwOMMX8ahfgKqrF27pyW1Toh29QxUeRRQNtIct38UaNU1X3m7h8d8tqhbP7Ioclg0Q==
X-Received: by 2002:a05:6830:4122:b0:639:32a7:984e with SMTP id
 w34-20020a056830412200b0063932a7984emr113839ott.295.1661450781882; 
 Thu, 25 Aug 2022 11:06:21 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
 [209.85.167.178]) by smtp.gmail.com with ESMTPSA id
 y7-20020a4ade07000000b00435a59fba01sm18282oot.47.2022.08.25.11.06.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 11:06:21 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id t140so15346017oie.8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 11:06:20 -0700 (PDT)
X-Received: by 2002:a05:6808:20e:b0:344:997f:32b8 with SMTP id
 l14-20020a056808020e00b00344997f32b8mr93699oie.11.1661450780460; Thu, 25 Aug
 2022 11:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220822180729.1.I8ac5abe3a4c1c6fd5c061686c6e883c22f69022c@changeid>
 <CAD=FV=W5X2XvvKT5tq+1ywJSmVB0TAHquGgn02uNmn4s-sqndg@mail.gmail.com>
In-Reply-To: <CAD=FV=W5X2XvvKT5tq+1ywJSmVB0TAHquGgn02uNmn4s-sqndg@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Thu, 25 Aug 2022 11:06:06 -0700
X-Gmail-Original-Message-ID: <CA+ASDXMetKHtL8Hm_=S7xPcHX19FDaCoXtHmh=E6i6pLEXQZ0g@mail.gmail.com>
Message-ID: <CA+ASDXMetKHtL8Hm_=S7xPcHX19FDaCoXtHmh=E6i6pLEXQZ0g@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm: bridge: analogix/dp: add panel
 prepare/unprepare in suspend/resume time"
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Zhang Zekun <zhangzekun11@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, xuqiang36@huawei.com,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 25, 2022 at 10:37 AM Doug Anderson <dianders@chromium.org> wrote:
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks :)

> Given that this is _not_ an area that I'm an expert in nor is it an
> area where the consequences are super easy to analyze, I'm a little
> hesitant to apply this to drm-misc-next myself. Ideally someone more
> familiar with the driver would do it. However, if nobody steps up
> after a few weeks and nobody has yelled about this patch, I'll apply
> it.

I'll take this opportunity to correct Andrzej's email address (my bad;
I need to use the up-to-date MAINTAINERS / .mailmap when generating CC
lists), in case he's one such expert.

Brian
