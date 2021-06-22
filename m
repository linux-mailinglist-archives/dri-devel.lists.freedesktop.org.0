Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD13B058F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 15:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B276E0F5;
	Tue, 22 Jun 2021 13:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7584A6E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 13:11:06 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so2256204wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4ClenBNFnPWHMhqejsNe5gaf74Np+yZIMmycF1fngD0=;
 b=cikWR6oES/vEFxXcIF4Otrr+lOBxkB0bxRhNQz40xIxkZEwqBUL4rd+XEYhUiPy02A
 ld7jETSbFZNw0+94pqVncdWGaSmXxWiHls2XS40Yujxuap0EjZQl+za51D7abFPAh0jZ
 alBZBfTL/WJESu21EaUjmVbjv5PSMT+2uZ0lLo6A4YWvuBpM55Pnzlh1wAmqd/e1/+My
 /mtj535QVBJzQYOpdFcNwcPEPULDIWEHQwHSbihdzlv5VqOzQ23atTaognM8FyimQWG8
 lmK7W3Tl3pbXE/PjZud6cEGliygQ7C2RGefzBZD6z0lazAq0snJH4cpNKari12+h/Oke
 X1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4ClenBNFnPWHMhqejsNe5gaf74Np+yZIMmycF1fngD0=;
 b=Uwy7MpCC0cOZkoQ/pGIJ90wad7Hb1/uIIewz5RK317flTR6Y+iPY4m1TVuyuwGPbhp
 CighI/Kz9sfTsVuKw8P1qTqX+OETJCa7b8+14GXjw0q0eMuCkdfjbnA+nw74CXmptITu
 ++IS9ATHwbOP04jZz/qVR1bfXqK35Fcf/ZAMVImjj+ozBgPtQz+v6VChxN9JeSE1LLxp
 U4w16zLvkFC8g7jI7RW1np7WNljt5Cmy63I8N8rFXlbAYDqhVPN5kYtbW3MUMnvfXTyk
 tu0zWWFnW74A2d7TrtYvnYYHvb5BIGU/eXVCJuD+ruNkvh6uXKCe0SUA1N2ROi/gSCfV
 5oyw==
X-Gm-Message-State: AOAM531QG/ovTyM01CKpuSBN+mwRaRo6aOi677xC2w+eEHxXK2xIX/4J
 m6LxD0YW+FW5/2S9Nqs/VZwXaw==
X-Google-Smtp-Source: ABdhPJyd0ZBEfT4naKU/aoV/BVHri+673sPYJQn0GQx2PGKHw3++vn5T86SrhOVGaXeBJcRhs2KDDw==
X-Received: by 2002:a1c:7f96:: with SMTP id a144mr4496387wmd.22.1624367465132; 
 Tue, 22 Jun 2021 06:11:05 -0700 (PDT)
Received: from dell ([91.110.221.181])
 by smtp.gmail.com with ESMTPSA id c23sm2482647wmb.38.2021.06.22.06.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 06:11:04 -0700 (PDT)
Date: Tue, 22 Jun 2021 14:11:01 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 1/2] backlight: lm3630a: fix return code of
 .update_status() callback
Message-ID: <YNHhZRkKFoucAyQJ@dell>
References: <20210621122148.116863-1-u.kleine-koenig@pengutronix.de>
 <20210621122148.116863-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210621122148.116863-2-u.kleine-koenig@pengutronix.de>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021, Uwe Kleine-König wrote:

> According to <linux/backlight.h> .update_status() is supposed to
> return 0 on success and a negative error code otherwise. Adapt
> lm3630a_bank_a_update_status() and lm3630a_bank_b_update_status() to
> actually do it.
> 
> While touching that also add the error code to the failure message.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/backlight/lm3630a_bl.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Fixed the subject line for you and applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
