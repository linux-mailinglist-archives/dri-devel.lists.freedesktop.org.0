Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6068443800
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 22:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158ED738A0;
	Tue,  2 Nov 2021 21:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B855738A0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 21:42:19 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d24so669387wra.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=++s5U25AmrtB0jRnPpON4TpfrUm8lCjgAhvwZZmMcyk=;
 b=ypsj6Ztj6KKT7yYtszeRDXqjLyZmFUoIc+pxUWoktkz3jaSW6u2HbXU9Bl27QlJsl0
 IWvAbSyqQ0WxqnNA+uYNY973Li8SVWTmbRsqnS11uD6ZwfizcpG3d0twxYCkNSiFdZ8A
 yajUdx3i+Tn1HCidgUivgNykquHBWP/isqlmQY7+Nzjv9Z5FnpKswnFgweJTvVPjQ2Mb
 aMd0ytn8pyd8gAAfCxVvIy7VFJoxgv11UiuwG1pkK5jdHWmP8I9DBnl5oFmChc0h4wIY
 hJUzmoQKiTrYN+UauG/GalqSk3lqXw/Q25UCoakaIc3KigU0ObihOu3kT2sed6VD3B7M
 DBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=++s5U25AmrtB0jRnPpON4TpfrUm8lCjgAhvwZZmMcyk=;
 b=pK8sVdgldAbMdww08YYtyrtFlJnKb4V6/61M1U7jPmxKs0e7npR9oANTLvTAd1liXO
 V+Oas5IN76RP5RY4EUWlHZ+LYDVVDc+Su6kUiqUdsWq7ZO6AxHTpvyMSEx9ECZfLyQ0d
 L1ev+bZM0GUH3SOUGUH76Z2E/X9UtkcYApFwkVfoEsHFUZMlLezNn6EMicuunx5GrOd4
 5TvmfoSmd176cLB+KaymCirMAZK901e4cHMuQPZKD5t50EAKhbUpKYRFKJ4UYpnWa59M
 kUBe/7AKD7A06Ctpct7M8vL9hSyme0WC9ZH6QcRCKGtcEw2wn4qa5cAxkIXYdOmSAAET
 EDHA==
X-Gm-Message-State: AOAM533Ie0NfbT8+WYzpUz+5N4DlGy46mwwmtdmBM7qfG92BThCVHBYF
 fva4B4JBqjvPPlsihBczswRXjw==
X-Google-Smtp-Source: ABdhPJzr8YmQqLyUSmCkYejogwjzQiAMastwvkFjwXPWrtwricO0JbZ/1JZUr6s7j1zCifzs7f6EIQ==
X-Received: by 2002:adf:a28f:: with SMTP id s15mr49491954wra.138.1635889338120; 
 Tue, 02 Nov 2021 14:42:18 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id e12sm217581wrq.20.2021.11.02.14.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 14:42:17 -0700 (PDT)
Date: Tue, 2 Nov 2021 22:42:16 +0100
From: LABBE Corentin <clabbe@baylibre.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: led_bl: Add support for an "enable" GPIO
Message-ID: <YYGwuCmORnjFRHMk@Red>
References: <20211102100455.2016610-1-clabbe@baylibre.com>
 <20211102111942.xd7eqz2zrtb7zotc@maple.lan>
 <20211102112514.75v7evbdp4ccyyt5@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102112514.75v7evbdp4ccyyt5@maple.lan>
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
Cc: linux-fbdev@vger.kernel.org, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, khilman@baylibre.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le Tue, Nov 02, 2021 at 11:25:14AM +0000, Daniel Thompson a écrit :
> On Tue, Nov 02, 2021 at 11:19:42AM +0000, Daniel Thompson wrote:
> > On Tue, Nov 02, 2021 at 10:04:55AM +0000, Corentin LABBE wrote:
> > > From: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > > 
> > > This patch adds support for an "enable GPIO".
> > 
> > Before taking this kind of change is there a good reason why backlight
> > should manage the GPIO? I thought that the LED subsystem was a sub
> > system for LEDs (not LED controllers). In other words if you direct
> > that the LED be lit up then isn't it the LED driver's job to manage
> > the GPIO and ensure that it lights up?
> 
> Sorry... I should have paid more attention to my sense of déjà vu with
> this patch.
> 
> This approach was discussed and rejected when we first introduced the
> led_bl driver:
> https://lore.kernel.org/linux-leds/20190705100851.zn2jkipj4fxq5we6@devuan/
> 

Hello

I am sorry, I didnt checked if the patch was already submitted or not.

Regards
