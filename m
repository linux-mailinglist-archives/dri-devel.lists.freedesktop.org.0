Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1B920CE1B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 13:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701496E12F;
	Mon, 29 Jun 2020 11:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7D16E12F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:16:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f18so15728043wml.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 04:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+2xqZS20j7WwADTzivd5NRrmJ0ENwbtX5GoNx6Fe+vU=;
 b=XLLgmXfhuWaN+N3Blm4XvjtjamUreLKdS5/QHTm4enePzjla+8NuL0BzUEsw5AsuPl
 X1CQpwqioX86nUM+EC7gSfRoUeA+UAwdZO7g8FztPrbAYSdLN3Gj3MMH/W+8Ppj+uxgD
 KAtFJqfQczCLRYDtIBfTkhIdFWI9YBhSWE5jq3YrBfCSPrugys7p0q4vwlUjd618SSZd
 dMrBSFPR0uritIZokDchv9FSSZpRcgi21dJ7OIjtgbNo4V4MXb6yNjxlEeE6dPuMrUWE
 6oS0igkzFWZRG/dbKpdJB3FiC9mrrrHhLNEjsQXLJQ+1bLY2Jnypj4+kcokoQr5fAY2e
 Ud0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+2xqZS20j7WwADTzivd5NRrmJ0ENwbtX5GoNx6Fe+vU=;
 b=RIkqCJ9vGu/Oeq3zxTQ9Pi8zLYVx1Ay8cFtQmiwmbhi6SV5ACozKVVIWUldZYZ4Y9X
 pmeuz0lBAS+4jo6isBgEBWEUPJbdFnggMlA2W1YkJZ3SB3rJje95M3oJnY+G1ksDv1jU
 wp59J2hxMAqGfoaf7FbMfMWgrjX+f2qrleDfZ2EdAuAYXfgGMjZsXdRJM4oGoPJbrZIM
 sMP8rOHXIcd1xqCP9i5L8jff27gVXFQG5Tq3wys7dPK4qys578O8f6rBxeFdbMAfHpAE
 6/kqZoorPoDSP0YXkw/FJxr/xp+HpDZbeoDiE+IKCB/rBjPnb1vT5pfhP0JNO4q1JlN/
 5d8Q==
X-Gm-Message-State: AOAM530MuXDj/+zG523gcMtuIQTy6el7p5QsXfJ0halRqggf4fSnhMvk
 D7wmQ+VmNiX2VI+cCAhv05b4hQ==
X-Google-Smtp-Source: ABdhPJwaq3ltksxBStZJO/KdE8Qdopb4vyRHguNNilk7aIVZlKJpbDJ8kuqHWiBjfqVj7CoPPtX5cQ==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr16121628wma.73.1593429377863; 
 Mon, 29 Jun 2020 04:16:17 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n14sm27635244wro.81.2020.06.29.04.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 04:16:17 -0700 (PDT)
Date: Mon, 29 Jun 2020 12:16:15 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] backlight: sky81452: Convert to GPIO descriptors
Message-ID: <20200629111615.gzhppcl5nypqqsr6@holly.lan>
References: <20200626203742.336780-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626203742.336780-1-linus.walleij@linaro.org>
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
Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 10:37:41PM +0200, Linus Walleij wrote:
> The SKY81452 backlight driver just obtains a GPIO (named "gpios"
> in the device tree) drives it high and leaves it high until the
> driver is removed.
> 
> Switch to use GPIO descriptors for this, simple and
> straight-forward.
> 
> Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
