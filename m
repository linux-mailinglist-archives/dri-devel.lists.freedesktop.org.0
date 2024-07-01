Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65D691DDC5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 13:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FEB10E39B;
	Mon,  1 Jul 2024 11:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="annQbUSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55C610E39B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 11:24:25 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-80f8dc709eeso499447241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 04:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719833064; x=1720437864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUrL67AhfddDFHRxH2TRoEF8hBbehX2Axe/cx3JPvX0=;
 b=annQbUSPyRnH+79SLmjWvkSamu3Y/QMmbuckRNwDRcMQXVAFzQc3E5za8y7BDpCdun
 MlXNsDjk4arvxRZbZHXgCJtOndRf7YazvMo+qO3xQofoWddldth7IplM+b/9IlWtXhfn
 jbdYr0wBLAVoa3S23XGbGiWpzrl1DzsJHBxjbI2oBFJPJfv4C0AsZVr8kTy1YOXAMHRY
 wfao5rk1tNh5s98kbxlhLiMZh2xc9Hg9vB0NPIwHnZyy6BhAqjLZUW1MOD1y5bGpi+pk
 SaUW659QqbRWoYrnNdJZh1RwJxnP32yo8MgBqmR9BomPnwFdoyo1sYKL30jcse7B6K9k
 lQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719833064; x=1720437864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUrL67AhfddDFHRxH2TRoEF8hBbehX2Axe/cx3JPvX0=;
 b=gjrtBRy1cv7XcWl13bydSR0mvfUUFRV0DQc9HqPVEWNwUItnazM+UaLENpr6qDQ9Jv
 DI5FLDB836lx+gCx40Dc025UZbRR3kU3Y+bO1R0ACg7CLg8SJ5IuxXxjcjKgzkZWnbR1
 yLBCfXMJKvjlW2u7RClDgbdghEG08bmBzzRU1u/cqa3fAW6SjEekawz7StWGZbogtiQA
 kaUXrf8JOhYJR+6qYFMLqVWmqE1O/6ArYyl4qwEN6SpPlFCHzKRM8sYfGF29hLs1WRb5
 aLNnha+NoGaSdf91UCbXkre4NESt1WporND3fmb7Ooy5xRDR5cw0x5nizRS51wNbMKts
 2y4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJS6koBPxpW1vXg5IpRwEmoAr7qOBydGIjPScCYKGuj3QcX204UzTL/iUBu3Viv8gR5CBixIihdmRlvzos5wGuHVaEB/2rkrGOWRQNePNb
X-Gm-Message-State: AOJu0YweLXH6CJ/jrz4OSfX9NdbTN8Ib8Ab+IUJJRnApXTcYCji9Kknu
 pbDISoS/o++Ut3Fjgbmn3JhDkzRCzDe35PfJv6XD2bshogFOaL1q/8NFARoluLcAESRGAdT/3LZ
 Db6mRXKrHOPchOmcgPlrqV45pnSE=
X-Google-Smtp-Source: AGHT+IGwyMqOfO87PLcMKYzWqKj15ArhzLp2ipo62An2cYoqn8JEiXomOKPcQ3YWcK787dlLTa9WLMfj39rGKsdv6fM=
X-Received: by 2002:a05:6122:d1e:b0:4ef:61c2:6331 with SMTP id
 71dfb90a1353d-4f2a563c321mr3165714e0c.1.1719833064580; Mon, 01 Jul 2024
 04:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
 <875xtp96zy.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xtp96zy.wl-kuninori.morimoto.gx@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 1 Jul 2024 12:23:14 +0100
Message-ID: <CA+V-a8uY6QSC4nfk5dEgB80O4z1nxpeBqwGPVBL4h5NHqjhjdA@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] media: platform: ti: use
 for_each_endpoint_of_node()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Eugen Hristev <eugen.hristev@collabora.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 1, 2024 at 3:32=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
>  drivers/media/platform/ti/davinci/vpif_capture.c | 14 +++++++-------
>  2 files changed, 12 insertions(+), 14 deletions(-)
>
Reviewed-by: Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar
