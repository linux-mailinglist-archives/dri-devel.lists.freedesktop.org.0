Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 371017EB452
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B13010E45C;
	Tue, 14 Nov 2023 16:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6559B10E45C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:01:59 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-da41acaea52so5924990276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699977718; x=1700582518; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fndB5KSZHnHBu08KuHV8EeEo0E7HNwgttkkgS68SA2I=;
 b=uy51kE3KV/v5OQg+yyEw+Qlp8h874MT/O9ZwbO6w6/A+ugBEaX7XHNIRHuJPQgXbVs
 QOcumd4xwP1YXVyiElwhFGVmncqV0vKB1l1Z2ajvE4WagvkPKj8h72jn/RgoSJ/t5ajp
 ErB6T4Luz2iMBS/3KBk799MXaA7sadlQrqAtQ+kFtqCxGOB1J+edtVLZN3DAnBIRl7gw
 5piL5SOkRAyDwELin6tViTTbZZgOYqY1CgOWgEqnMAaaigGvrJ2zwKb9+BEagusjVCP+
 tEaDFSoyAuK+AjFNlngEc9xE4542wJ6VIKfbfNn56bn1/SUM7ck4tBruKO7QISxujuT5
 XuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699977718; x=1700582518;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fndB5KSZHnHBu08KuHV8EeEo0E7HNwgttkkgS68SA2I=;
 b=CWZGswTKtEFD8Z8jqvJIHQ7PlwjVXSVxUzaI5q05FctlSynBnSpK9rznC7Ajh8AFDg
 EJp8lVcAOcJRYckQLn1khwjhUfqCSz5oOZhB+4Ll9TO1WylEhj5BBFmL0BcF1En7biv8
 EmPwm1S7OZameGEwT5TODvKhOadj5lMhKYunix33z0Ie8KhWboZ+RAFO4RNBle8OEXmp
 RRG9jokIt74Q1XyxvdfbjYKQ11Af9iIBVsohCXubJgI1hYt61li8isaG5x6C/XBAcLQX
 sZdLyuvWP+MjwZAXhQuusKaAgTxpB/WaUZVZ/2B5CLZb+JKaGTfVlBDtk4xm2KYr4dq6
 OGpg==
X-Gm-Message-State: AOJu0Yy3ec9SbE4odp45tsePqT8NmtADJNgbZlNlQDNt57oAUK53OPMy
 lMElzGQO+S9vVrqTZ/HEtkzk4N7/Vm9n4J46aan0pw==
X-Google-Smtp-Source: AGHT+IHsevervoQJYVTNCoLk1NXeNiVOY3Shw0OrWY/m6yICDDktyuOZ2Wig21e0oPgniacjjKXoc7GyOir3X9amtTk=
X-Received: by 2002:a25:cacc:0:b0:da0:ccd6:b8a2 with SMTP id
 a195-20020a25cacc000000b00da0ccd6b8a2mr11767481ybg.19.1699977718516; Tue, 14
 Nov 2023 08:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-3-sui.jingfeng@linux.dev>
In-Reply-To: <20231114150130.497915-3-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 18:01:47 +0200
Message-ID: <CAA8EJpqHt4KX_yvq8DtRi2z7Y7RS5soSk=C_=00qyt9jTMEu4g@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/bridge: it66121: Add bridge_to_it66121() helper
 and use it
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023 at 17:09, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> Instead of using the container_of() directly, which avoid the code lines
> too long in horizontial. Just trivial cleanup, no functional change.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)

-- 
With best wishes
Dmitry
