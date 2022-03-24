Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A42B4E6A00
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 21:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5198E10E320;
	Thu, 24 Mar 2022 20:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1053010E320
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 20:51:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id r13so11586145ejd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kWTv8rvzSud6vjQAPBruU1+NUsUkFIclJurG5+jMDKk=;
 b=iD6u/kx7rEMaMiEJQLhlCNXkeSS/pc5DIS25/uS7QK+u4Vx0am6v8p8Vnj/csxW/Dh
 Abo9xh6+gFlh1siWNxA6ksZo2zDZdU49sR4M0ZTN7yk44jPdjgQ+9PGdt5iLpcbAlJy5
 u77KgsNMtUPNxLuFfnPcVYDKBLswUw6B7jPVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kWTv8rvzSud6vjQAPBruU1+NUsUkFIclJurG5+jMDKk=;
 b=2yHP6yD3lVmyXc6LUG8S5aTsmL8fX4f9szUIEKwQv0xY+G7665OR78AeJsc34jQtLW
 QDWhLQARTVYMO1fHyr8d5EI5AL4H7t+1Wweae/avulql2ljpJcSpe/wyzXJjzbYvzXKw
 JbIrWy+Fu2cjESsILNcS8UOYkT+cBLI5fIUrxradGLH3RbTTiQYSoTq/ONXS84NG2H0z
 mK+GAjdOyxYtlkQ0E5oNSUcZcZ78SZAXm9rjW39ogYtH4XjRj/D3BZ8ups87X5M1FVEO
 8rdm6d41SWqTjYa14LuBtkGcJYKtJ3KLChZ3RJ+H80BNlAyRdVQU57/TbqkfqH37QQ9I
 2q0g==
X-Gm-Message-State: AOAM531yxp1oali9BCexSplCn+mqMhHDJW2GGScRAhT8dqzQBfIbj9y5
 7mvMPfIikQw3KUONQ7dYFPzHSzNtKW0VDJ0Z
X-Google-Smtp-Source: ABdhPJyDqwq6NrphDNqIfLcWrukf9aiXY+DlTGBV92WxfwwTpPquUBWOmcM+uQ4gQNTUY5pH9QkMUQ==
X-Received: by 2002:a17:906:fc5:b0:6db:30df:df23 with SMTP id
 c5-20020a1709060fc500b006db30dfdf23mr7574743ejk.396.1648155095277; 
 Thu, 24 Mar 2022 13:51:35 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 o21-20020a170906289500b006d144662b24sm1542146ejd.152.2022.03.24.13.51.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:51:34 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id a1so8265393wrh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:51:34 -0700 (PDT)
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr5864281wrc.513.1648155093356; Thu, 24
 Mar 2022 13:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134819.v2.1.I816014b6c62da5a33af5021f3cc35cea66552c00@changeid>
In-Reply-To: <20220324134819.v2.1.I816014b6c62da5a33af5021f3cc35cea66552c00@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 24 Mar 2022 13:51:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UdRzeHio5Vo+zmXDt9a8oUwXiZyHvxkqjx4HVcrx7W-g@mail.gmail.com>
Message-ID: <CAD=FV=UdRzeHio5Vo+zmXDt9a8oUwXiZyHvxkqjx4HVcrx7W-g@mail.gmail.com>
Subject: Re: [PATCH v2] panel-edp: drm/panel-edp: Add AUO B133UAN01
To: Matthias Kaehlcke <mka@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 24, 2022 at 1:48 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add support for the AUO B133UAN01 13.3" WUXGA panel.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v2:
> - autodetect and configure the panel based on the EDID data instead of
>   relying on a compatible string and hardcoded mode settings.
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Given the trivial nature of this change, I'll plan to land it in a few
days barring someone else yelling about it.

-Doug
