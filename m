Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B820274866B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 16:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8D310E36F;
	Wed,  5 Jul 2023 14:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD50F10E382
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 14:33:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742eso69872455e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688567603; x=1691159603;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mQUXAkyiQApMq+ZE6mPnwyJ3KTToGXwRWpzxeS6gtoU=;
 b=TP49Ly4bRH4lLTT35h8wVfAwVxrJgc8Hm8iAUo+nhTxeYBA+AKk1HSKDGzn94tP3jJ
 /UIxJ4/uo8yuFDr/vJUsJmog42GwssD1cqtABp7hqCH8wmX3QJ92ttJqCTg2dGDN2OGm
 rDcsmLUR7aL3zpWnpNRYgW7Pe6E6+onYViN1i5ZyhJq+in7lkAX5KFaZr8Oiq/8tPWzz
 o0gw3qO+o6bNrEqL6giVppiT7lA/FpOF5OYwCN2/Ze7DwE+48Pb/gJXVuNiID9PkG3LS
 4RinTWPpx4VsGESZDsQ1rXLnLtquh+aKBRLdw9D+xY1KGPufXXcKZwLrW5hr6u3akx8S
 UgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688567603; x=1691159603;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQUXAkyiQApMq+ZE6mPnwyJ3KTToGXwRWpzxeS6gtoU=;
 b=bZm1boSGTQJdoQSX7810O1fnqcSUN5vXpLohTSlo2H1xe5OEGxBw1gPY/+jkDAwTgQ
 mtmsGiM1lG172JkAdU0qAWPcfvqzJIaC63Pak8JvXxPBDqJcpWc2g8CZngqAGFdf3KNo
 gFv6qWO2EAZHwARRH3cVLe9Z3QmqO8htnzGIbX2u8dCTSnntxwTCOxQwJc1KKofhHFdJ
 sIzBmFBK18xnM8NaCQMfIC4YCg8KCf0wWaJn9+4u8HacPpLqt/SSqsuJKvMmAsrLrXsu
 OA2XfOU30k2CcxAcVMa9r27LIrja1rbFgs/XmYtfzE8/hHNgMkt1vKap+TdSzgDkpAYI
 I1HQ==
X-Gm-Message-State: ABy/qLY7zIEhzB2NqwXTQiwuil2KSfUSl8hVMQxsSMN13mqmEY+mAP07
 a3B36VeL92Ba2/jbtlWfOkfFkQ==
X-Google-Smtp-Source: APBJJlEcP9KsqrX0torxAaick855DXdlm/LSXir4ylL4od030uqLUgvwXNO/rx9wm36ZF/1GfIK8cQ==
X-Received: by 2002:a1c:f713:0:b0:3fb:d72b:b2a0 with SMTP id
 v19-20020a1cf713000000b003fbd72bb2a0mr9242635wmh.6.1688567602750; 
 Wed, 05 Jul 2023 07:33:22 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003fbda7d2d41sm2280190wmj.48.2023.07.05.07.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 07:33:22 -0700 (PDT)
Date: Wed, 5 Jul 2023 15:33:20 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mans Rullgard <mans@mansr.com>
Subject: Re: [PATCH] backlight: led_bl: fix initial power state
Message-ID: <20230705143320.GE6265@aspen.lan>
References: <20230705142447.15546-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705142447.15546-1-mans@mansr.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 05, 2023 at 03:24:14PM +0100, Mans Rullgard wrote:
> The condition for the initial power state based on the default
> brightness value is reversed.  Fix it.
>
> Furthermore, use the actual state of the LEDs rather than the default
> brightness specified in the devicetree as the latter should not cause
> the backlight to be automatically turned on.
>
> If the backlight device is not linked to any display, set the initial
> power to on unconditionally.
>
> Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
> Changes in v3:
> - Add comment

This mismatches the subject line ;-) but I can live with that if Lee
and Jingoo can!

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
