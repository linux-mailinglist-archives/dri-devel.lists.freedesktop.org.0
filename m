Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FCD4AE7E0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 04:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26FF10E143;
	Wed,  9 Feb 2022 03:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADF710E143
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 03:31:43 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso633623otv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 19:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2EUDRGuxtVXdjJqKcqAEgC1qrVlM0soEHjVQnLyJLs0=;
 b=gFATHfSbEwJ/EGCF/zEhTeIkEiUQSOtcK2sHp8Ebb6qkZ97CXiedI42DYKV8syEAhw
 2MfPvVbvx9pSlf+FbdNkpo5sOT7rnWZJSgKcq1N8o7AZs4hdnePK/9VsDYWVUFrMDdc7
 34M9B/MX2ZIkmzVf8be7MvwUbk9d4V/qGuyygAao3NvdJNSKEe/rAf5ZbaAolRNoyNkN
 0zp4MEyrvgF90sHoqB57p/Q5X0HiU5AMkVkGGp3A+h73NEXe0kqX5EFn4uoOGcO6FMt8
 2ZZdf2T4w+mhVGE5O4jj/AgEMEdKML3wEkzRdMhohV3wWNulr9mB+UfdiujJJnc1rRf5
 s7Tg==
X-Gm-Message-State: AOAM5329gs+vGnLrWmx9DexA3OebFtdQ67blApd/BJc9gevc8WeS/33N
 8iOYxqpaewLSxCWdJVkMVw==
X-Google-Smtp-Source: ABdhPJzZSGGfllJlipqtnKsyZA9CXiQ7dw6mFa1JxouW5CgG7GlwB3WtIzOv3/iC9X6LEldT18lNyg==
X-Received: by 2002:a05:6830:1084:: with SMTP id
 y4mr184049oto.42.1644377502928; 
 Tue, 08 Feb 2022 19:31:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q8sm6374550oiw.12.2022.02.08.19.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:31:42 -0800 (PST)
Received: (nullmailer pid 3585232 invoked by uid 1000);
 Wed, 09 Feb 2022 03:31:41 -0000
Date: Tue, 8 Feb 2022 21:31:41 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 16/27] dt-bindings: display: rockchip: dw-hdmi: Add
 additional clock
Message-ID: <YgM1nQ4BiJJdM6Ax@robh.at.kernel.org>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-17-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126145549.617165-17-s.hauer@pengutronix.de>
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jan 2022 15:55:38 +0100, Sascha Hauer wrote:
> The rk3568 HDMI has an additional clock that needs to be enabled for the
> HDMI controller to work. The purpose of that clock is not clear. It is
> named "hclk" in the downstream driver, so use the same name.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml        | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
