Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8681D7ACA14
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 16:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF7510E10B;
	Sun, 24 Sep 2023 14:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FC610E10B
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 14:41:02 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-27730028198so381945a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 07:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695566461; x=1696171261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mq9o5qvZyL0ly3pv5TDMT+Manu7qr9Byu7rR10hlJ54=;
 b=NXvqLzv7P6gs/2PIG1njz/ZhZOYxWwDdMy0r6CcVH5gqYQW7EowfqI1qecLIkyPYBL
 NYTHC4DVQEZsjkWgdvzrC1WSkonHQ64Ju5fEIbAOMcXHoMUOPs/UsG+fJgXaDuv+8Z0L
 olwDcoJ6GBj1qJQb3JHT3RrBK+hsM+oRFtlW2VYIwXckt3B88UamDdIQcMmYoc2S8xsM
 lrC8kso4QngfR9npEvxt4J5b7lzHusCpUo8RG280U+J0x2o5UQOjTVEWqUB/dWWzvdPX
 /92eoihLKXgwbjYSko/MvTxPx0cco8JPImpEBJz4Ls/EMHpQWyWMv/x6V5AWbr6p7D+u
 bGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695566461; x=1696171261;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mq9o5qvZyL0ly3pv5TDMT+Manu7qr9Byu7rR10hlJ54=;
 b=hv9eMQqwRdVl5VYtKHrPxb4QSPU1/0EVJHelgl2Z9xBNGa8rk55D1nWCcJ//JFSFCI
 9NcaF/4NOFWFo86W61GC2CAfdIENNU/QN/nmsCExZ9k+sdU3QCboILlS7Mr+8UH3pg3N
 Y+2IL8OhhX4MwgH4bnnpIFlsUEt4InWw3dUXzVILzIBJWZmZduZMcfngXzKw/fXcGrFw
 mtnF9VkREZZL17gEnBs5o+tT+EWqIEHqDDHqNJf2SUHaoAYd2O0WNcpC5eJI2c+puIRD
 QzbOXN+tQaPKyZvwNBykUQHk1/FDUmJmJ3fYvS4sF/swEmzm6pienBNzzXOC2en7jl7j
 jwCQ==
X-Gm-Message-State: AOJu0YyG5x0rNAsCUOmj8eDpiBtudNsvxN6Y7THNZKU94Ef7HKtO52qE
 2wjODJjOmC5vj7FgFUb5yfqwfNeiYW42PVpYG3eVbmYc
X-Google-Smtp-Source: AGHT+IEQymy7QWSSpQEknDuFHDf1tXATwlj3xY76w7/hw4DNOFBSfOXm95pnojPs9rHJPjTgnHdGVQ2aG8iIQGuGBMA=
X-Received: by 2002:a17:90b:100e:b0:277:2d8c:5c17 with SMTP id
 gm14-20020a17090b100e00b002772d8c5c17mr2648454pjb.0.1695566461526; Sun, 24
 Sep 2023 07:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230924073001.16681-1-liuhaoran14@163.com>
In-Reply-To: <20230924073001.16681-1-liuhaoran14@163.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 24 Sep 2023 11:40:50 -0300
Message-ID: <CAOMZO5BeCZTv_T9H7YEJ7i7iDt0do0U7dyNfDPmBcNsFexQiqw@mail.gmail.com>
Subject: Re: [PATCH] drm/imx: Add error handling in dw_hdmi_imx_probe()
To: liuhaoran <liuhaoran14@163.com>
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
Cc: linux-arm-kernel@lists.infradead.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 24, 2023 at 11:36=E2=80=AFAM liuhaoran <liuhaoran14@163.com> wr=
ote:
>
> This patch adds error-handling for the of_match_node()
> inside the dw_hdmi_imx_probe().
>
> Signed-off-by: liuhaoran <liuhaoran14@163.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/im=
x/ipuv3/dw_hdmi-imx.c
> index a2277a0d6d06..3b25f018b2a6 100644
> --- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
> +++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
> @@ -224,6 +224,9 @@ static int dw_hdmi_imx_probe(struct platform_device *=
pdev)
>         struct imx_hdmi *hdmi;
>         int ret;
>
> +       if (!match)
> +               return -ENODEV;
> +

This check is not needed.

The only way this driver can probe is via devicetree and this can only
happen when match is non-NULL.
