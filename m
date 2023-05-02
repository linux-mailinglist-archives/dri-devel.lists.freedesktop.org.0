Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780F86F427C
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 13:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68EC10E514;
	Tue,  2 May 2023 11:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD4010E514
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 11:17:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so36201695e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026241; x=1685618241;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hC5rYIWvK/tkRAoPAEF5edYxUmmDzm+5+7yR1xwhyX0=;
 b=dxhKeusNbXgpsiW1CpqtUWcJK9plsg0Ezqx8fKwR0zapkU8N3hAGXDFmSDhCiB6w46
 XVdt76X/wBAfL5WxSmINEmhZ3rxgkeXQdM+wozMGQQQBDpYr7R9h6cj+zRwJH/5cBbWR
 cRo/jwT083+CMmIMSImONFUnlHgocMCxXlNgI45kpy/JicSeJPaDEhV97la20RnohU5f
 Xt5hCpW4cF9//AvzGDbxn+p3xgGFMEYbGxMk8QvpBflWwvQn7BI2Arxol3s5E2WleiZ9
 qlLwtugL5TMWQ59Xj4RxXRWRaXxFj1RM6JOFjfXBE/cEuW8F9chZ1nuBm9YYFFHqIP5u
 EAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026241; x=1685618241;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hC5rYIWvK/tkRAoPAEF5edYxUmmDzm+5+7yR1xwhyX0=;
 b=BbzTHXKN4EimXTwIeIeEAGxQ1QGlbmdRvPjAiKmy4C8Zs0j8/U2JdaaWc0My88ZptU
 MoFwo9oJBTPHdVVMPFM0XxLvvoZRyc61ofIeEr4Z9SKVXXjBMkDMDfKeLO88okm/VgM5
 k7l62I5wn7DwlmWPZ9TTt9NSFYhTElxMOtNhVNVggwMMaIkIG5vROaih0Qs2qyAaXhWi
 4r8z2w/gseofYmTWkO7835pi+4PhosbdrP8afXHxLSTs1+uKjkJV+Ql/ST+A86hGUoyl
 7MhdobgfEHAO/nfp/RnLqS9zRgXFihs5fnxXott/DWlQ2pbnGORpw3//MB493WDOcUKN
 FvTQ==
X-Gm-Message-State: AC+VfDwefmImMdLcws8ByGx8HwLhfuzbCL2F/osxvk2rGE1vHvbKmS4T
 CGctPLrI4Rs7K1baNj8vpKuEIA==
X-Google-Smtp-Source: ACHHUZ5zpyqpXr+mFRT0QdK4GBZ6IFbr+l3lnDvYTS2KPabZ8s1ZjpQNTuYHyGo+UuIIUaf8/iI6jw==
X-Received: by 2002:a1c:f019:0:b0:3f0:49b5:f0ce with SMTP id
 a25-20020a1cf019000000b003f049b5f0cemr11338031wmb.12.1683026241502; 
 Tue, 02 May 2023 04:17:21 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c365500b003f182a10106sm35223317wmq.8.2023.05.02.04.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:17:21 -0700 (PDT)
Date: Tue, 2 May 2023 12:17:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: backlight: ktz8866: Add reg property
 and update example
Message-ID: <20230502111718.GB15678@aspen.lan>
References: <20230428160246.16982-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428160246.16982-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 29, 2023 at 12:02:46AM +0800, Jianhua Lu wrote:
> The kinetic,ktz8866 is a I2C driver, so add the missing reg property.
> And update example to make it clear.
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
