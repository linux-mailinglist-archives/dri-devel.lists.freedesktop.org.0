Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6F4FB77B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AC110F889;
	Mon, 11 Apr 2022 09:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA54810F889
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 09:27:54 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id q19so13662105pgm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gUZLnKBxx8VA3OSu2dIqsE8cEUY3AK5vGZQzH6jJ2vo=;
 b=JyOGjkokBa+Aw6qxRAQJ498sUGyUYwxAOiPIEVGS79xAIQhaHmakXcZkILRXU1fOW2
 NVc0WL0w8BYbOkqfCmzChBxCXKDv6gT1+t/+dbygd3zinfwoTxBI6btFBiQRlVizGmDX
 RB7oCRd8YSitvkDPJ4LrpIemvAEqXANu3j9uhcwculIe7oLiojCuItyi223yx6g+RUAt
 SzYGRFIZDaUuTcj3XbAkDJ4KsVqTk1z7LPooAhAA6GrGWXCnU4MG8OLY3qUCN6/JXVs2
 KFKpIvtlpMIfuUokiO3icBC5jp5HjunYGiP1vQcNBH7/xKxKPgKgRRQnwiDdsZBkU1ND
 +mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gUZLnKBxx8VA3OSu2dIqsE8cEUY3AK5vGZQzH6jJ2vo=;
 b=JgqknF9gini+1+mvCkFt8AYbmFzSiIO5Vgtq7z1ZjcFLcdXw8XMVbflBtEMyRt8Uhz
 WpMIB2vS2SCz6+6WB8ykEwlLvayEWiEmxFjST1njjLVHJ2+FbIAEMlWGOWh6RMZZEa/u
 scq3vHo+4QIF3TM4Jy9QJ8WOXg7Jcm6kYg7qLL52X34dcLF+8omPw6knYNVI42bp/kQL
 Zb1xJqZqDC3As4CEDGgq7U8y0plgM4ZfUD0+qdMrYxoCsG7fDatqIf9hIaqZEO7q4COm
 dQ8xbs9E+pxCqJpTTlHXPAnTEBDXVQ9eppiHTfJQnrx9Uvcx4Mklr1fR/Ar7M9zKkN/D
 GlDw==
X-Gm-Message-State: AOAM531ogp8uKWQ6cyJgTM8GtT6OBfPlyzuTjco+r+sRcYp0pWUkDmNG
 /4bONA2Tk5i+7NnTv6rqokd+XvV2muaMXw2FBGeNpUmy
X-Google-Smtp-Source: ABdhPJxV9ml1CzlL5oo0xAIHD9+A2y+UDXYm1lYeNkcyI8Z7ey1mgEDT7HQb3xEvCQaE4O+y95NuNpdvXwzy8iTz0jY=
X-Received: by 2002:a63:e20:0:b0:385:fe08:52f9 with SMTP id
 d32-20020a630e20000000b00385fe0852f9mr25852698pgl.99.1649669274422; Mon, 11
 Apr 2022 02:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <CAMeQTsanEow=zq=MuZLjMqpzybdS=5S0=JrkxuCdT7d5MxpEWQ@mail.gmail.com>
 <CADvTj4rBKzGFch8iVzHu1s+6=P0PcLEwoFi74xd_ormEX+2rMA@mail.gmail.com>
 <CAMeQTsaM363n5F=--xhSTayFqOMNvjTQjqz_aEhby6i-KRVBKQ@mail.gmail.com>
 <CADvTj4o_zyVZxaBz0+kRUF30OW3SKFMuo87r6FE9Qkfn1dVsBw@mail.gmail.com>
In-Reply-To: <CADvTj4o_zyVZxaBz0+kRUF30OW3SKFMuo87r6FE9Qkfn1dVsBw@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 11 Apr 2022 11:27:43 +0200
Message-ID: <CAMeQTsbKMxQcDsDRqHsMwqU1BnrcOLwtU7uOrB-1E0z65P79-w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: James Hilliard <james.hilliard1@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 10, 2022 at 10:05 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Sun, Apr 10, 2022 at 1:52 PM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> >
> > On Sun, Apr 10, 2022 at 9:40 PM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> > >
> > > On Sun, Apr 10, 2022 at 1:36 PM Patrik Jakobsson
> > > <patrik.r.jakobsson@gmail.com> wrote:
> > > >
> > > > On Sat, Apr 9, 2022 at 6:23 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> > > > >
> > > > > Select the efi framebuffer if efi is enabled.
> > > > >
> > > > > This appears to be needed for video output to function correctly.
> > > > >
> > > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > >
> > > > Hi James,
> > > > EFI_FB is its own driver and not needed by gma500 to drive its
> > > > hardware. What makes you think it's required?
> > >
> > > I wasn't getting any HDMI video output without it enabled for some reason,
> > > I assume it is doing some sort of initialization needed by gma500
> > > during startup.
> >
> > Then it sounds like you might just be using EFI_FB and not gma500. Can
> > you provide the kernel log with drm.debug=0x1f set on kernel
> > command-line.
>
> Seems efifb loads first and then hands off to gma500

That is how it normally works but efifb shouldn't change the state of
the currently set mode so shouldn't affect gma500.
From the logs I can see that you have LVDS (internal panel), HDMI and
DP (3 displays in total) connected. This sounds wrong. Your version of
gma500 (Cedarview) doesn't support more than 2 crtcs/pipes. This might
be a problem.
