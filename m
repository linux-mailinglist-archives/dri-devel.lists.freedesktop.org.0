Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FF263CB10
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 23:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A160810E271;
	Tue, 29 Nov 2022 22:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522BF10E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 22:29:09 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ha10so37273386ejb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zLpCy3698Bc23bcTbA/ZXvSN9t0RpVO+Zbfm9nGrSiQ=;
 b=k2drZtEJBQIQoPR/xGtfnQRDFEFcN0kLvOBnFCVQEMz95pKx1E4a4hbRKLApx+IkEf
 JGfd6zOp4IkKQzXt5/Ou4pqNzf9f+90PafF2m+3MYiGyG9nncqHP4u8DrPnmyo6U9qGL
 +5VwJoq3+DaBLcVeb0ozJQWwt4Z6OjHrqFRe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zLpCy3698Bc23bcTbA/ZXvSN9t0RpVO+Zbfm9nGrSiQ=;
 b=6utmsN5Ax+URGZL5McSdsi6XDUis1xM03ULFDUp4RsWQqC2sW3gCsQTpOuSdqiUtpE
 2kvmvklXNyoJK4pzgjAMgtLRBtrkiH6JyjUvNxadIMAXL/jrpLlBaMydw86Xsx4X05pO
 k606BwMTHEaO+r5Maf9OaK7j/owcHQXfldUcDTJ2Pfy2xlmmaLVa0aa5zAlt9L3+r2OV
 9KyKQQtG9UVC/6xHVaWU+ien/yccmdHtEjk2CQKJZoYRJ2S5D3t53UyoKcwA+iX5F1Dm
 lPuHUUfMlrkcerzsNNNUeGjnkajP8/jn7hLorCjOU8qNzdl2JNFSH0iaAsFErOqLNgzm
 KoPg==
X-Gm-Message-State: ANoB5plWY5vmuPNwBY90xfPaRM2ph3pz+T2k4MkSvvbP6h+9gPdG+2JF
 mmvpg5c0WJI0aj/BZ2bEoFMrbnTlYXhKLTwe
X-Google-Smtp-Source: AA0mqf4Hf8/uYD8WrQQeAWSgQfQZ0e3ENFOxIA30WmvIENO26d59VsyZJBc1KR6aKxldOhgYySWhqw==
X-Received: by 2002:a17:906:694a:b0:7c0:9d50:5144 with SMTP id
 c10-20020a170906694a00b007c09d505144mr466128ejs.590.1669760947571; 
 Tue, 29 Nov 2022 14:29:07 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 l16-20020aa7c3d0000000b00468f7bb4895sm6770996edr.43.2022.11.29.14.29.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:29:06 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so116896wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:29:06 -0800 (PST)
X-Received: by 2002:a1c:cc04:0:b0:3cf:7716:8954 with SMTP id
 h4-20020a1ccc04000000b003cf77168954mr43045048wmb.57.1669760946142; Tue, 29
 Nov 2022 14:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
 <20221117133655.4.If6153da69ec4bc9e83d5f095ef6e6b07283940a5@changeid>
 <CAD=FV=VvhzEgjQidvF3DVokNyiQ1hRkqGShCoNbM5ytma3gZYQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VvhzEgjQidvF3DVokNyiQ1hRkqGShCoNbM5ytma3gZYQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Nov 2022 14:28:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-jPz=8z2eXr4mOd6p=qtPSWJmxRvxvmVnOzURN31mHA@mail.gmail.com>
Message-ID: <CAD=FV=X-jPz=8z2eXr4mOd6p=qtPSWJmxRvxvmVnOzURN31mHA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/bridge/parade-ps8640: Extend autosuspend
To: Drew Davenport <ddavenport@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 17, 2022 at 1:14 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Nov 17, 2022 at 12:39 PM Drew Davenport <ddavenport@chromium.org> wrote:
> >
> > Same change as done for panel-samsung-atna33xc20. Extend the autosuspend
> > delay to avoid oscillating between power status during boot.
> >
> > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> This seems fine to me. Not 100% sure what changed in the probing /
> booting to make it need 2 seconds now, but this really shouldn't cause
> any issues and it's nice to avoid those slow power cycles.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

b1d2751c2f23 drm/bridge/parade-ps8640: Extend autosuspend
