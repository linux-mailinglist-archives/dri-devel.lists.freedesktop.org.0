Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A05762E07F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2768710E644;
	Thu, 17 Nov 2022 15:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879A010E647
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:57:57 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kt23so6118907ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xPYVdWQGKyAxRr86FuSPZgi+RasDOpkqD17vGK7Zz+k=;
 b=hj/G4BeW/V/LA3u+r6+4U1y/fmx6qLA9fBpI/xGuRQXFMWYeuIxLf8flJbXtEPn7k3
 CJFX7gdHL/JYXZVFfK+V+i5yB6l8i0/km1OFaT1MrT1i7yHHjFlCWqhsoV5XdI6DnSka
 3PxHIEQfJE5JSXXYK3B78m37cEI5Efz4ItdxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xPYVdWQGKyAxRr86FuSPZgi+RasDOpkqD17vGK7Zz+k=;
 b=7OK9EXHJy2cwUbT9fInYEJsCX81Z0AsDxO6fBOaoToqi5Bx9o5CpJIEwYtoD63WTWT
 WfzA1Wh0T0w+rpuctjLdZXYWC19Q10MwPMXEmLr2R4dJqk8td7xx9n7Pha30QD+82wxY
 dPQgnDrH45JokNcAizwpU11n6TUmPgz4kpNZ/L7AmKWpDBJH2V7tBLBfZyXos7uFfP44
 3itchxE/bkX7i5DFQ3rITVclriIKYAVEoIBFqwgn+YOeYIqs+chfvf90Eozw0B4UHNPw
 TeijyfiArSFFvqUlJ1R5dyX75QtfZVBtj672LYumQcgho02w7sX+GjCfUJL+Vj5grIoo
 j/1Q==
X-Gm-Message-State: ANoB5pkdZpAisepYBjuw5b+w8Tj5zfAxd2MefHfh6+db11Md9TuV8brf
 rGDwOKdvFQFg5hoO0dFde8AwXX62oku05YwQ
X-Google-Smtp-Source: AA0mqf4ZcFvJUE099/ySKiVjgrHRgabvC0XhX5Rqm+l76gUn7IETtXRJE4oo2iuA/kL0WechJb8nwQ==
X-Received: by 2002:a17:906:6d48:b0:7ad:d408:3a2b with SMTP id
 a8-20020a1709066d4800b007add4083a2bmr2671610ejt.280.1668700675745; 
 Thu, 17 Nov 2022 07:57:55 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 qh9-20020a170906eca900b00795bb7d64d8sm516276ejb.217.2022.11.17.07.57.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 07:57:54 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id a14so4594707wru.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:57:54 -0800 (PST)
X-Received: by 2002:adf:d085:0:b0:241:b3d6:d6a0 with SMTP id
 y5-20020adfd085000000b00241b3d6d6a0mr1898756wrh.617.1668700674040; Thu, 17
 Nov 2022 07:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20221117110804.1431024-1-hsinyi@chromium.org>
In-Reply-To: <20221117110804.1431024-1-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Nov 2022 07:57:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VEC=GzkDfaOqauBB5Y79teS1ENA5wFUHZmnTRkg6Z4tg@mail.gmail.com>
Message-ID: <CAD=FV=VEC=GzkDfaOqauBB5Y79teS1ENA5wFUHZmnTRkg6Z4tg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] drm_bridge: register content protect property
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 17, 2022 at 3:08 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Some bridges are able to update HDCP status from userspace request if
> they support HDCP.
>
> HDCP property is the same as other connector properties that needs to be
> created after the connecter is initialized and before the connector is
> registered.
>
> If there exists a bridge that supports HDCP, add the property to the
> bridge connector.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
> Reported-by: kernel test robot <lkp@intel.com>

Not sure it's worth spinning for, but FWIW I wouldn't put
"Reported-by: kernel test robot <lkp@intel.com>". The emails from that
bot are always a bit confusing in this regards, but I think they mean
"if the patch has already landed and you're sending a separate patch
with a fix then please add the "Reported-by" tag". ...but adding it to
the original patch just doesn't make a lot of sense.
