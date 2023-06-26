Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005373E2BC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 17:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5610A10E221;
	Mon, 26 Jun 2023 15:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95C910E221
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 15:05:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-313f04ff978so1150240f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 08:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687791917; x=1690383917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=348adPXQRKrKNTWGAwb9z5LOcOD3S5LIRa6IrQyqmGc=;
 b=BpdMkRqMxf6XEjAul5+0XQ4Uqv2kRvyAG7uM//NhkYVZS74eHBo+NlzGx6Km7k8dew
 blQILAw7fwJy27T2x3DKaUlmEQcDJRSCj8uKQURAmWzo7FGHZNgXP+PTFSBy3ViEwxDK
 bwUXavKKzBgmLv3XDq49ITl/dbsCckPuHheh1OyxNCa9H1yrYB1OubNaNBFQMYfXVyf9
 4jZ/Dp+NUWclfn5YkfLFegJDrQ6plDOZ1zLMYwpsVnYWM2AtacotDLe1spyxM2z0yHPk
 j0ZN67PMABHain93jKjzWnpDNib5oPHQXOXXsIpIXONZ9UFxlFj04vrTDLF/c98FZA07
 LqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687791917; x=1690383917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=348adPXQRKrKNTWGAwb9z5LOcOD3S5LIRa6IrQyqmGc=;
 b=bOr+BkQnHjUx2Ie4bjgvbsv64T86c//x0E1dLbDe5fXfP4RYnvXGvnVSiX0E1aQ1+z
 8XnkB8WveJzzYcx4mLl3T4yvPFuvZm9nZ6DVhhnCc3/aUZE26cCanlDGiGUCgq2OeqWd
 iDEqBcYZCqXglcT6jKqlwUkkSBoIA3q6XHxSXO99fzFrNvvYb3FGGOxTBDisQ5UmlWkx
 F357g7QeUm+oDeu4kzfQTR2OzzzOk5vHDj+aW/hRyV7cBc46mBCSkmAc2q7/z8gEGyDk
 SXwnVqQ/TR59PCA30/7xH5++U/xcfClBBhk0akeBVMI5ijd3xT7bn7ACSCnHZyFEH38j
 9GsQ==
X-Gm-Message-State: AC+VfDx/EN1ruhyQkg5ILY9j73RVYvSQhoimtPy5iO0KMo3lu6ErNJQM
 Y08UAOYqrhZ/tIZk+vKj7O2Ugw==
X-Google-Smtp-Source: ACHHUZ5VYTqqVMy0dhtZ4hxs5N4mrJgTTvouyQr7HxLT3nJwXi1SuqaAezHLUswOmb65Bowi8io8Mg==
X-Received: by 2002:a5d:5960:0:b0:30f:c56c:b5b3 with SMTP id
 e32-20020a5d5960000000b0030fc56cb5b3mr8897292wri.4.1687791917522; 
 Mon, 26 Jun 2023 08:05:17 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 e15-20020adfe7cf000000b0030fae360f14sm7644766wrn.68.2023.06.26.08.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 08:05:16 -0700 (PDT)
Date: Mon, 26 Jun 2023 16:05:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker applying
 initial PWM state
Message-ID: <20230626150514.GD95170@aspen.lan>
References: <20230608-backlight-pwm-avoid-flicker-v1-1-afd380d50174@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608-backlight-pwm-avoid-flicker-v1-1-afd380d50174@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 08, 2023 at 04:11:14PM +0200, Philipp Zabel wrote:
> The initial PWM state returned by pwm_init_state() has a duty cycle
> of 0 ns. To avoid backlight flicker when taking over an enabled
> display from the bootloader, skip the initial pwm_apply_state()
> and leave the PWM be until backlight_update_state() will apply the
> state with the desired brightness.

backlight_update_state() uses pwm_get_state() to update the PWM.

Without applying something that came from pwm_init_state() then
we will never adopt the reference values from pwm->args.


Daniel.
