Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80DE52F45F
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 22:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F91C10F9DD;
	Fri, 20 May 2022 20:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C4210F7E8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 20:28:58 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gh17so4565483ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 13:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PUvHmCiaUykxHI8OvIFLVAwT2TJ4ujC+7HAZA4KLm9o=;
 b=E7VekmNmqzzPvnMy92tHR6mFRFrwHRPFMUmM3juUv3W7Caij6EZHqbPF7ji6Ppk5ak
 cLMD4QdxKzTo9OL54y8cUEo8NCYpKVhEHKEn+bt4ImwfTax8nV5J7UHC/HtAlpSHRNly
 +trvejQGwU/eryTVgCTqDvA6Vvw0FwAohxVZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUvHmCiaUykxHI8OvIFLVAwT2TJ4ujC+7HAZA4KLm9o=;
 b=kyIQdqHykVPzHKbjr6yiYTMAEhZp7y2MDkVC3Oc7nkwLA20Bzfc/fgL7tdlrMx971L
 HcL+hoqQfLBn1F4DLh6PLOaExI+bfH+/zQOCQMshnbBn6dPc8JoIUCtdgnw9O+Bqvy8c
 c3/huodWkV1rylvVjTigQLnipeGCoJ25NAKxz/4dVDwhth1Qb1CzGRby3rSCja4PEzRp
 39qMqyfl3XXvxEOEiEc9tIP0GqdlN2xzSifnaWaNqHJewngWk9+znTL8qFopCukfKDbt
 qKyRFihlGb4ITeVK1gMlb21OVVfLm7w6ld+zbFs+SwdGUEtK4jngh4PVw3BWoTHJbAG6
 lJSg==
X-Gm-Message-State: AOAM532lHHwATAPa4cPM816YzYPa6H5cWJEnQ/XrtQppg4JZFaz6js8z
 NaNS8iH43pIUBNLKGb5QY+58AddsNmbUTvMJozs=
X-Google-Smtp-Source: ABdhPJzAOzLELFw5do7zZKEfLcvCeX84nqargOKmyeNbLWgizSACwS5dlWk/l2OFiqPvrXTKMUYPhw==
X-Received: by 2002:a17:907:d0a:b0:6f4:98fb:f407 with SMTP id
 gn10-20020a1709070d0a00b006f498fbf407mr7363620ejc.219.1653078536788; 
 Fri, 20 May 2022 13:28:56 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 rh16-20020a17090720f000b006f3ef214dc2sm3478305ejb.40.2022.05.20.13.28.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 13:28:52 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 h205-20020a1c21d6000000b003972dda143eso1579544wmh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 13:28:50 -0700 (PDT)
X-Received: by 2002:a05:600c:4f13:b0:394:8978:7707 with SMTP id
 l19-20020a05600c4f1300b0039489787707mr10309201wmq.34.1653078530208; Fri, 20
 May 2022 13:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <CAA8EJpqBnR_-YaNj-hc6fjfeRX-aTBhuzCFKg77QEyANu37cnA@mail.gmail.com>
In-Reply-To: <CAA8EJpqBnR_-YaNj-hc6fjfeRX-aTBhuzCFKg77QEyANu37cnA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 May 2022 13:28:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBkCZXL-6LnHMSCOwbUn5t8m0bhLRVh7R64w0Ce6FOvg@mail.gmail.com>
Message-ID: <CAD=FV=VBkCZXL-6LnHMSCOwbUn5t8m0bhLRVh7R64w0Ce6FOvg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 10, 2022 at 5:22 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 10 May 2022 at 22:30, Douglas Anderson <dianders@chromium.org> wrote:
> >
> > This adds a devm managed version of drm_bridge_add(). Like other
> > "devm" function listed in drm_bridge.h, this function takes an
> > explicit "dev" to use for the lifetime management. A few notes:
> > * In general we have a "struct device" for bridges that makes a good
> >   candidate for where the lifetime matches exactly what we want.
> > * The "bridge->dev->dev" device appears to be the encoder
> >   device. That's not the right device to use for lifetime management.
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for the review! For now I'll hold off on landing this until
sometime has time to review the other patches in the series. While not
technically required, it seems weird to add the devm function without
any callers.

-Doug
