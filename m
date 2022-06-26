Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE6D55B452
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 00:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5238B113297;
	Sun, 26 Jun 2022 22:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215FE113297
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 22:33:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id q6so15330457eji.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 15:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O51AM3Qzm9rWVB6oLrltcYSc31aaLTopfeRLV80m1Yk=;
 b=gDLni17NhALEi/hNiPzVgFRh7cP8zgvivg+f5FfBrWXKmrg1ZfqlR/dpgGsuvU8xyA
 s2gLamxDUBAvE4VWjcmMmB6LdzW0OqpGmPC6HF54CN/3jMjGSzbnB8bjcgNAQc/kNn6F
 uCqte+fPbMKqCp1KcHL13Kcclk3RWtO+ua/WreTkTN8rE8KiD8eb+Oqxb+1oWpWQ3xhx
 IHvYoKz6GnK3Wg8Lbq3T3noIe+fwmQ/glEBh58trPhABAv7X8On2N2Jgvvh5FqZsnAyO
 o1SMsqUi0da/Z3AJjmJImlmNXX5SkTkmUldE9MKCLp0a4EfXklkri1+Xg5EoFXL8unoI
 SxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O51AM3Qzm9rWVB6oLrltcYSc31aaLTopfeRLV80m1Yk=;
 b=Zq59FReDcjJET0lLB/XkJqXhAVlfWhNSriyZaivNuGjapUHs3jECPrAgmQMAgBMJj7
 +Qto41GLunMWlSFd5bekUyc2QI61egpJlJ1SPqp6jfRwGivzD+jwGgDh2MibB1jHalfU
 gK5eR9eI7AuD7/LrdRZLq5RiZbug/mQsk+WYEMGUgHnGwrsNN8mxgmdEuU7dqBYeXBzK
 9tSIzATvgx2HDSG3syCUlKky9xJEgyQ8YefbmwcpWJUmmYPvct83VTo43gqMPuSv+mhv
 GQ/Wp6NtLLCY0kz3FT2UVTRIeXjmO3S3Vjg1B0mFdJ7HY23lyiZk8QsbQWqcUIhglH8m
 Nfaw==
X-Gm-Message-State: AJIora/gK1d1lSzyW07h7yYCko390XXouYqIO6GDxHagblT8PNbvxVlD
 02musCtsuOyCbS/q+V4W1nV22RngmEpcskMpa1I=
X-Google-Smtp-Source: AGRyM1uXR6Lm+Uqx2z3Aq3NI7bcB199Bsml3RGNzAeBEZ0KTVBjoaNUwUSrUDkKtwStl3kTYGYR3Bb5P7Was8WuQxGQ=
X-Received: by 2002:a17:906:3f51:b0:712:3945:8c0d with SMTP id
 f17-20020a1709063f5100b0071239458c0dmr9736344ejj.302.1656282822640; Sun, 26
 Jun 2022 15:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
 <20220617072723.1742668-6-narmstrong@baylibre.com>
In-Reply-To: <20220617072723.1742668-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jun 2022 00:33:31 +0200
Message-ID: <CAFBinCDJmjpix6Y4yN8PbNUvJddEhwFjiLJe+zBLo9vN2oNbng@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/meson: add DSI encoder
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 9:27 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds an encoder bridge designed to drive a MIPI-DSI display
> by using the ENCL encoder through the internal MIPI DSI transceiver
> connected to the output of the ENCL pixel encoder.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
