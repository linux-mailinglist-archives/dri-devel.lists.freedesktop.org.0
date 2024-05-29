Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B98D2934
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 02:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61F4112B37;
	Wed, 29 May 2024 00:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e8HwZDij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA463112B37
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 00:01:47 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e73359b900so15223391fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 17:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716940906; x=1717545706; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JbSUJZ3lWVi558UySXJCbOkQXUwg/BY6swouuGo3h3M=;
 b=e8HwZDijfh022FxNaWcCawFDlZsMbYQ1lurl0fT/YxozP0gQdtT4LxY53rY6O4Cplw
 bepj8DEycwwXr+EQMu1I+1VwNsSqEqyxkcOhV3MLOufmHr1lcocBPWnaxL8zSzHLaWPo
 Zh6b6lciTr5qOPDSn6DXJfKCVQi3HPJNYfhho11YigxL375R0X2acI2QM/a7TCzZrYe3
 5Vq7jTJhBuSO6DMDQwFYqwXaWh1J/wsX/wUYuS/S9ipI0Oxsr49F8nNdH2399KqiB9WD
 7bT5fOhCLnSdEd/z/aHn29mNSWR/qmkE00nSs1tpbS2rQNumdfPCG5rD/cPq+lEObAYK
 YQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716940906; x=1717545706;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbSUJZ3lWVi558UySXJCbOkQXUwg/BY6swouuGo3h3M=;
 b=l8knj3a9UkCYFgRNQ/NJF9QkyKWjW0KbHdVNBeb4RPDtYu6zFyzBUf9xjAunbwiZli
 mNqkYeMTJuO5704NEHEwWgT/ikLjhcoUdWYb9NpS9MaTPay5cSWyDvOC1MnxtY9PxlHu
 TmQZ5F0NWiFZhGdd/Zyg+QMh/mhzc2xVnyRiIPuDeuiQkXs3cfqrkCi3VxQxIg136r9i
 ssXJrdN/zsnfU2x01jnumSx5wHZhEPRSJBAxNQjprw3YduSZQBhjklLCaYElqObpDgCd
 Ul/Si7xOuyqmQzsEPzG2gyKjJnc57dXNBb0vGlgXZvhpqBHFZtU1ZooOC+bqp89aWVLJ
 Pkvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8umARap/7FGC6p9MQSddlbyIbrwHqDeRht9ER1/InlQzulu/X6TnfxNt/omg4RG9urViZUmlpvkpGKnU5HxFJMleL/mvObUqP3uFLGFzP
X-Gm-Message-State: AOJu0YyaRc5Z/CkzOPELKBqdHqU5BHNs5JMkpFPGv2lEx9ZkXrCqUVlm
 Qj2+m7I/AOpKN892J8DGmJTJQJL9xnT9B+qK3ll2yU5BC29XhfZh40Y9NBF6uF8=
X-Google-Smtp-Source: AGHT+IGMFvu7tNMpu3hd4ZI4DzSWJEhLR+W1+ptB5RwKxDpz/xmWeD3EGSsLralZrE8N3ltg8VCBsw==
X-Received: by 2002:a2e:9e57:0:b0:2e9:795a:c25c with SMTP id
 38308e7fff4ca-2e9795ac301mr46868491fa.39.1716940905814; 
 Tue, 28 May 2024 17:01:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bdd159fsm23674921fa.94.2024.05.28.17.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 17:01:45 -0700 (PDT)
Date: Wed, 29 May 2024 03:01:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: prabhakar.csengg@gmail.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 1/8] gpu: drm: use for_each_endpoint_of_node()
Message-ID: <3wxib4xs4shnhn6ekokmi2uwo5daqhomefqosmocvyuashxqsq@wwp6a6yrl7ag>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87h6eh4hld.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6eh4hld.wl-kuninori.morimoto.gx@renesas.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 28, 2024 at 11:55:26PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
