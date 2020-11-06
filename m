Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E62A9DC7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 20:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B056EAF0;
	Fri,  6 Nov 2020 19:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8D96EAF0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 19:17:00 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id r14so1265462vsa.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XjxcjMM64AoPrrGB5WU2iaP3zlHzPJnCO2/knh+pBZk=;
 b=ChDMhKoR0fYHz6+pG+digC/UdlOyMfTyTXxZYVDmx1L3K5ftT8gUyphVat8s/W/5rS
 wA3PHUwayVERFcspmZbwzWdlnfg0Fd+rr4fDUkeEFIzDweo4TafrzXhjqk1DhyuzjX9L
 QCmbfPMjuFoEKAXO1AmcXscV3L7sp69Pd9xf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XjxcjMM64AoPrrGB5WU2iaP3zlHzPJnCO2/knh+pBZk=;
 b=ZoVMGjD/AEhvHdDVCYqKGSwbpUuQywcKSC5+yh7KtQapR1NDg8oxPIoTDnv1LD2Cba
 u9Zfq3yBJ4R2xfJRKATEgsT/l/pB86LCueQ6M575hLaemp65pgyfk8KMIj0vcbycwt0x
 Ocb/JxBNrLrD2H1ohvxok9A2CyzzyoNN02UdxuAtAKVlabF9CtEIwT7ZiUz0wXCD2i0O
 3gYCREVP2yVbiW8SN/UvYQel66+cmV702sbuw2Mc8xjM3qXSE5An/Yus23f1d1sUYT8w
 slhkmdDNAI8xwGRti+cGRhSqLwIGHpYDzbhiRFr0vvwncB3bjB3APIr0nWsWqu8uOfsU
 4+Tg==
X-Gm-Message-State: AOAM533CHm07WXtE7MbxWpBpJMA/zaHRnpEHsmNNtMERziPprP6UOHho
 ePNQN7y8oF7VyXt520biRdciBsoL/Bm9Uw==
X-Google-Smtp-Source: ABdhPJyNKauma5iwqh89Gip5URm6/akxfQty3N0gE/YgM2i64plzsa1hHJgCXAOYwQ1vqA4+zRhWDQ==
X-Received: by 2002:a67:ea46:: with SMTP id r6mr2463149vso.40.1604690219311;
 Fri, 06 Nov 2020 11:16:59 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180])
 by smtp.gmail.com with ESMTPSA id l16sm285731vke.27.2020.11.06.11.16.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2020 11:16:58 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id m3so473971vki.12
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:16:58 -0800 (PST)
X-Received: by 2002:a1f:78c7:: with SMTP id t190mr2166294vkc.17.1604690218042; 
 Fri, 06 Nov 2020 11:16:58 -0800 (PST)
MIME-Version: 1.0
References: <20201106182333.3080124-1-swboyd@chromium.org>
In-Reply-To: <20201106182333.3080124-1-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2020 11:16:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UFk9Lb_E4-qHdmzdC2VHOmn6emzg3YgbZWGPAdBpSnJQ@mail.gmail.com>
Message-ID: <CAD=FV=UFk9Lb_E4-qHdmzdC2VHOmn6emzg3YgbZWGPAdBpSnJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Add flags to boe_nv133fhm_n61
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 6, 2020 at 10:23 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Reading the EDID of this panel shows that these flags should be set. Set
> them so that we match what is in the EDID.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Fixes: b0c664cc80e8 ("panel: simple: Add BOE NV133FHM-N61")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 1 +
>  1 file changed, 1 insertion(+)

Yeah, generally I haven't found that the flags matter, but it's good
to match what the EDID is giving to keep things consistent.  :-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
