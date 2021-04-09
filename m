Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE635A1E2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 17:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B65F6EBAC;
	Fri,  9 Apr 2021 15:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3053E6EBAC;
 Fri,  9 Apr 2021 15:22:04 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id a19so105128vsh.5;
 Fri, 09 Apr 2021 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3s5iM0DDtutXCX2CW4Fk02eYIx8aYsLaJtdlto8nJPE=;
 b=G4wrRJhals2S4TjgcKsiTJsyA42YcY65w3HJYq0XZf/exUD4l9dN8DLs3Lf4l4uEZW
 r+lhWBYLZ8h69qf8p5HuPR1WrXxgvwYTqpi8L1VjwX6BmTaTsBuLkkCOO2deNVXOJaGZ
 wRnTyIPFXF7G7Sw0vGk0FD23+S/FAsPtABsf+Kew9aelHZWKuE2fzrWBAHVK3EpN7uwJ
 0mpu4aVambDs60rl1skyVuV/HTHMlC3jWsuo6xEulxmVF1p4FxlN9zFD09qoGxPwBtr9
 E9CYoTtcsVxOX898Pk5FfQvIl/iFTLgy9AKUQiZCWLDiN/JO+uvI1HX6e6/IZZJ1MaES
 Za3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3s5iM0DDtutXCX2CW4Fk02eYIx8aYsLaJtdlto8nJPE=;
 b=CtNtEnXts9e5PzNLljMzLnx+fxalvwrFzP+xhR5F+IQ5ci7m/L3a6TUdzVt68drWEl
 GvvDAYawmcoIOEdDLs4YT5sQslwC6umT1OL6Zh1papDKwJ8XhaQd0XZIlXbMxnldpEXk
 P3L76PIDavD6+w1OZYNfBWDSqVykg93CUmBGxubGaJlD6ooVhvzjomoUrDO3Cbk4wZPT
 5SoYIGgwDKMQSeZcm7ngydh43JdnG0U4t1A0ulym3eA10eZNJ32ruwl8vZpywiBMib6M
 HCJV/NIK9RJYjmkBzuM96TVS2M6D1taKp73iW8CR4TH8CnBPnoP26qVeuh40AdFBg5JC
 DaUA==
X-Gm-Message-State: AOAM533kJ1tTFBUnAstshQJxuVAlWD8J4z1mAPLF3rhBh3o4pMDtOoBN
 Xf3N6I86qh0gDEX1iwRt6LYjonl6FYnXVCHmiK0=
X-Google-Smtp-Source: ABdhPJwYrqbTO+toHceKeBWFha82OgtSQjsuKppLIZhszG27iDCJgqD0OJhNgbIISMnlNTxQrt/pp+m7P4CZUTxsEX8=
X-Received: by 2002:a67:e15c:: with SMTP id o28mr8648918vsl.9.1617981723139;
 Fri, 09 Apr 2021 08:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210409122231.8391-1-linqiheng@huawei.com>
In-Reply-To: <20210409122231.8391-1-linqiheng@huawei.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 9 Apr 2021 17:21:52 +0200
Message-ID: <CAH9NwWfkug1dN2sSMEpJ2JuKNG=wJ7mCcNejgEFKihwviuAbcw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/etnaviv: remove unneeded if-null-free check
To: Qiheng Lin <linqiheng@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Fr., 9. Apr. 2021 um 14:23 Uhr schrieb Qiheng Lin <linqiheng@huawei.com>:
>
> Eliminate the following coccicheck warning:
>
> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:616:2-8: WARNING:
>  NULL check before some freeing functions is not needed.
> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:618:2-8: WARNING:
>  NULL check before some freeing functions is not needed.
> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:620:2-8: WARNING:
>  NULL check before some freeing functions is not needed.
> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:622:2-8: WARNING:
>  NULL check before some freeing functions is not needed.
>
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
