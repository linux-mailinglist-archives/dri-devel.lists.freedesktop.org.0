Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF075223CC
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1A610E4B6;
	Tue, 10 May 2022 18:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B85510E4B6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 18:20:55 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bv19so34624968ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 11:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Yk1Asd++vaP19BlzM04q8JrUNHDRJ05bhviE9yuAPk=;
 b=INLIAOxhhXUy3b2Wv5oKZ+ASdc4ha8u5IcIg9AnYC6zreX0H2HoaFCK9hB4CykHXkK
 XZVzvSizz4kB/TJKeRip9CJTqze5/crAgaFDNGly6mvn766BTLQaXX64kjijz9t2BbOA
 vmmC2vidST0NUSonzNfh4DJqDLkcLfMAxkRAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Yk1Asd++vaP19BlzM04q8JrUNHDRJ05bhviE9yuAPk=;
 b=dZOySa6l7Mq+MfycM0u12ECLDKGumWecU6TDlHulef7VTc+vr3k5fiVP4zqiSYgICP
 MpbSkcwjwa/endPGpCBD/npFdLivmqj3qzlRmoA/kkIuP+9CbWJ5aMT1rlw+b2XrUNG/
 E2DGdY3klTMfQQ1CuWvRjzbe4Y5Q91iyV/hHJRExAZdeCU32GqiykOpbg7qtiFt8rOhA
 HGKqdV8d2enlzU8D4kwqx3mf3q/F7x+HNUpuMiTS7pYK+Qc2MjNZv/bXzDbAJ5izJQtZ
 QzUEC4BFiJopw2/3wfULY7bGQ+L983vIUn8c/BlW0dyovNg3CJ9vs42w9t87MME8gUQ0
 4ATg==
X-Gm-Message-State: AOAM5330dji0LX6tAFyFNAd0M3ve3RvFAET+5L+83zRL/AL7/OsaYdrd
 q6u2BpUrAWUsN1i+VsbBvPS6lsRGF1MO8u9T
X-Google-Smtp-Source: ABdhPJwKcKT6e4wpsNuDwCyqmsvUckZnr1Ot2myZhWa4cU9brnEa4ZqzVK0ocrzEPBYWOCE7OlEEig==
X-Received: by 2002:a17:907:eaa:b0:6f8:f86:66d5 with SMTP id
 ho42-20020a1709070eaa00b006f80f8666d5mr18016821ejc.275.1652206853253; 
 Tue, 10 May 2022 11:20:53 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 j4-20020a170906430400b006fa981fcd78sm24213ejm.93.2022.05.10.11.20.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 11:20:52 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id c11so24928786wrn.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 11:20:52 -0700 (PDT)
X-Received: by 2002:adf:f50d:0:b0:20a:e096:ef with SMTP id
 q13-20020adff50d000000b0020ae09600efmr19493674wro.679.1652206851534; 
 Tue, 10 May 2022 11:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220429055145.3852271-1-chi.minghao@zte.com.cn>
 <CAD=FV=Vo+1O=m_-Wf5z6fxcXAtRabQu3u7tc3pt8Q645b1n1VA@mail.gmail.com>
In-Reply-To: <CAD=FV=Vo+1O=m_-Wf5z6fxcXAtRabQu3u7tc3pt8Q645b1n1VA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 May 2022 11:20:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XizF+13_QzYfOQA2YCUqgVMvcE=GCN+cSdpwkRvYUsNw@mail.gmail.com>
Message-ID: <CAD=FV=XizF+13_QzYfOQA2YCUqgVMvcE=GCN+cSdpwkRvYUsNw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: simplify the return expression of
 ps8640_bridge_host_attach
To: jing yangyang <cgel.zte@gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Zeal Robot <zealci@zte.com.cn>,
 LKML <linux-kernel@vger.kernel.org>, Minghao Chi <chi.minghao@zte.com.cn>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 29, 2022 at 9:21 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 28, 2022 at 10:51 PM <cgel.zte@gmail.com> wrote:
> >
> > From: Minghao Chi <chi.minghao@zte.com.cn>
> >
> > Simplify the return expression.
> >
> > Reported-by: Zeal Robot <zealci@zte.com.cn>
> > Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> > ---
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

e090532246fe drm/bridge: simplify the return expression of
ps8640_bridge_host_attach
