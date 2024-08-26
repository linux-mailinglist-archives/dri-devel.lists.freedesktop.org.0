Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB7195F3C0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 16:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961AB10E212;
	Mon, 26 Aug 2024 14:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="adpXub2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7077A10E212
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 14:23:58 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7a1d984ed52so272141685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724682237; x=1725287037;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwMj193fRnQWJj8EMVK/Yl7VxbK3hJ7E5fMVl5t23FA=;
 b=adpXub2cwC7FoR0wc7tbG/k1sD6bw4JDXDeg8ftHaaDrcwxlQF8H25UVbkKWuP2iXk
 wgEbRpQhLmVsoXVyYtlg8vIZiSsiQlIaMxih/YsFWArDDhcMP/fLl3+8bJssbJw9h2bG
 s8/TQsV6EDwZmCTw0pFllKWBj6aAQoRKAi6cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724682237; x=1725287037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwMj193fRnQWJj8EMVK/Yl7VxbK3hJ7E5fMVl5t23FA=;
 b=L4Ws49MqzMfLqi+fuBFjnNa1BB+cFErFGyJr4p4Ppiy6iqv4bZEHp9A+RYPyfPHS4R
 i7DsReW+vqWoxfOwChNevN9kCIbfBIAwZah6K4V1tHcrP5JBTAb+4pXB75Czx1kXcEO0
 OSxGeaAL6b1lkI19E59CqkYwQKl1Hn+B/huHFpAo6WwMq3GdIlG7wu0SHYZ4Md0lQ+TP
 +Oj5f+FEEwU0jxkxVp7Mb7gaHBaTEmE5Xt62ogwUbctBiemsc+s/2Soy7zbfgEBXzHTf
 jqsGexgqsLqLl0WTVdRBF6yGSSLCs4i9udj/qiBDB4NRHmg7YG0KmZTXgaq+VB0aM0f9
 g5CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxnnv2ja+46RTwg/q9s8A0hRWNKmQsGcOVDptVQjdIVkG2v/yxodhgqd9i/hp8kwtHn4rzFQbWSA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5yX3vMQRnXCVcN42PmKjTubYu3YX5tP/+/CpCnDiynGh7FJDw
 QdIQjymr9wyekw/fr3ZaMBdFSOyTdYZFS6NWEdKJzqMkS1VmztNxedpAv/BA4jbfak31yop0HkY
 =
X-Google-Smtp-Source: AGHT+IES9eJHLHZhK/CHqN85Yu9vqrP6MQJxuNQYIJLF2ZUs5C5ALElPy/rfzgqRmAJ/hsgmZylVUQ==
X-Received: by 2002:a05:620a:2991:b0:7a3:5e3f:cc09 with SMTP id
 af79cd13be357-7a6896e3de7mr1088953785a.8.1724682236600; 
 Mon, 26 Aug 2024 07:23:56 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com.
 [209.85.219.46]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f35cda8sm452815685a.58.2024.08.26.07.23.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 07:23:55 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6bf84c3d043so22510096d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 07:23:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVEtsJtDwM5h4+qt9oiwmeasYCZWG0SQBtCAz5f0o9DEhLXYYmSGdxWfPwUZC45YNELJbQSCJm4IPE=@lists.freedesktop.org
X-Received: by 2002:a05:6214:460f:b0:6c1:7508:9372 with SMTP id
 6a1803df08f44-6c1750893ecmr106950466d6.9.1724682235124; Mon, 26 Aug 2024
 07:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240826-drm-panel-edp-add-boe-ne140wum-n6g-v2-1-2758e8574842@linaro.org>
In-Reply-To: <20240826-drm-panel-edp-add-boe-ne140wum-n6g-v2-1-2758e8574842@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Aug 2024 07:23:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W7EWhuse=74di=RVLTU6FFXQh1M_Z_a2wHDbOpeU57Gw@mail.gmail.com>
Message-ID: <CAD=FV=W7EWhuse=74di=RVLTU6FFXQh1M_Z_a2wHDbOpeU57Gw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: add BOE NE140WUM-N6G panel entry
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Mon, Aug 26, 2024 at 5:39=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
>
> Add an eDP panel entry for BOE NE140WUM-N6G.
>
> Due to lack of documentation, use the delay_200_500_e80 timings like
> some other BOE entries for now.
>
> The raw edid of the panel is:
>
> 00 ff ff ff ff ff ff 00 09 e5 66 0b 00 00 00 00
> 1a 20 01 04 a5 1e 13 78 07 01 5f a7 54 4c 9b 24
> 11 51 56 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 9c 3e 80 c8 70 b0 3c 40 30 20
> 36 00 2e bc 10 00 00 1a 16 32 80 c8 70 b0 3c 40
> 30 20 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 1e
> 3c 4c 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 45 31 34 30 57 55 4d 2d 4e 36 47 0a 00 dc
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Added raw EDID to commit message, as per Doug's reguest
> - Picked up Doug's R-b tag
> - Link to v1: https://lore.kernel.org/r/20240823-drm-panel-edp-add-boe-ne=
140wum-n6g-v1-1-7bdd3c003514@linaro.org
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Pushed to drm-misc-next:

[1/1] drm/panel-edp: add BOE NE140WUM-N6G panel entry
      commit: 51394119f640423858a2f04076d6f1c3e83fa715
