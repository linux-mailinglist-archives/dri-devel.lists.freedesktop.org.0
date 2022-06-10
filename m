Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E955462C0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C879410E384;
	Fri, 10 Jun 2022 09:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5D910E384
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:50:00 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id g25so5940426ejh.9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GM7d3E0tduZqRYf2e+s3dbuLzIr4Mw1YJSMLDAOVaMI=;
 b=mPsDPC8Jc7T4BUqovcJHh9X9aOrAhrclaAa/mhdil1CMSWhn30imVTqNFRV+0HRuZR
 9clubq9kS7nPcWWq0+jUK/ZXeKuiFGzZDvtFDwXEp2uxKkZ+j2tw+p6oTgwkJY+ubiyC
 fNpq3+oeKLsbInyhxMt0RU7rnoLmgsm+qFbiG6K8ZL9ftfWRVogRMaCLYG0PEmOcWyxi
 Ej/gBPv4wGEs//8C5AqndzktP0qrzc314Ie0fAKrmlRueinVOKmVaBBtnVyEHYDDTkgY
 p8yH/z6bfp1mBhN+ixEyIEW0HoPZyP6dMU1cLXojoX9F8XKV/BwCrjhvbDch3r8LG4uz
 wQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GM7d3E0tduZqRYf2e+s3dbuLzIr4Mw1YJSMLDAOVaMI=;
 b=yTx3+PLAqw+JwMevAvKmObqdUl98jzEa8Sg+QKxrNWuBCoKIKYS760FOA/aCr+t4TR
 VvD40r2bnTOO/cdst8O6tDZao7vcoZRxb4ef05GXb9MPl/iO9cExoXrJ2OW0IqxhkiAc
 Q5kCikCBAa/wr7DnkY8OiD51WwG1rU1iNHokmkJfVy2LDcb29k6gqGkkQRhHHh94y+hG
 g/R9m6taQj/U/kEOe53xFs3z2ngtNYx5m8NcUV1n9XGhMMX8em1997ThsbHuBNUISGxj
 kcc2AWGzdyAwkQ7eNlvMMpeh0cLlzKo+kSdEaIJcUijs9MpGVrZ8L3a/M5SzDSw4gC+A
 Y7zg==
X-Gm-Message-State: AOAM533YbGHSsvgh7IsIm7V+AcluQFyEnBA0sEDJthIwJOD2BYgkXEJ/
 zCjw7n0sr/Vj8VcrJfaZbJq6+A==
X-Google-Smtp-Source: ABdhPJyCD/klApB8VX8jrzmpF60V4CVF43i+O2miGAxeX9trvWXvTRU8uZ81PMBn+YHe3kzoGb0iXQ==
X-Received: by 2002:a17:907:3f08:b0:711:d61d:e10 with SMTP id
 hq8-20020a1709073f0800b00711d61d0e10mr21666615ejc.11.1654854598989; 
 Fri, 10 Jun 2022 02:49:58 -0700 (PDT)
Received: from ash.lan (82-132-215-210.dab.02.net. [82.132.215.210])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a17090608cd00b006fedcb78854sm11931009eje.164.2022.06.10.02.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 02:49:58 -0700 (PDT)
Date: Fri, 10 Jun 2022 10:49:55 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] fbdev: atmel_lcdfb: Rework backlight status updates
Message-ID: <20220610094955.cy53ujicaplr7aw7@ash.lan>
References: <20220608205623.2106113-1-steve@sk2.org>
 <20220609095412.fccofr2e2kpzhw4t@maple.lan>
 <YqIuUYUXzxeSgZ/o@ravnborg.org>
 <20220609194511.4e0bc3e6@heffalump.sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609194511.4e0bc3e6@heffalump.sk2.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Helge Deller <deller@gmx.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 09, 2022 at 07:45:11PM +0200, Stephen Kitt wrote:
> Hi Sam, Daniel,
>
> On Thu, 9 Jun 2022 19:30:57 +0200, Sam Ravnborg <sam@ravnborg.org> wrote:
> > thanks for taking care of all these backlight simplifications - this
> > really helps to make the code simpler and more readable.
>
> You’re welcome! I noticed fb_blank was deprecated and near enough unused, and
> started digging...

I saw Sam's comment and kinda wished I'd thought to say that... definitely
good to see these things being tidied up.


Daniel.
