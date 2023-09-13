Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 360A079F102
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 20:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A5B10E0B1;
	Wed, 13 Sep 2023 18:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376E910E4D2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 18:19:51 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50098cc8967so124063e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694629189; x=1695233989;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEAPfLQPyHWPs22S6K8OqWidoAHb8MCtHTLAq4j3yQg=;
 b=JbHZ4VBxcyRWCfdi+aBzC0CQkNhJsms+G/7QcFnpMST4Z1HhsMxk+/JtN6+kDUTBND
 vbNco33rRxs/avuN0xuZsMSrL71FuMVv4sWAb6yVOQwPXr6pMCA4LohCKd0/aIWY7HRX
 XYbZXSiAQSwssjFv1XiOW+za3293/RAnPEYQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694629189; x=1695233989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lEAPfLQPyHWPs22S6K8OqWidoAHb8MCtHTLAq4j3yQg=;
 b=SPfOdcIEtYG/hARlOktF2GuHX54NskYqVzUqWL8KMYT1VCAORbrKuIOCwGS27+AZcr
 kpXlBGv79/Y36bcnlKj2AmJo8SySUNlW1PX/s/DbdH57iTSCFE7zLWpeOpDQ1nDyX2dI
 VZJoWvO2nIboDX1uPlU7K+LxfZ6M9kTT0gcufeMCG/lkImywrgBvGA6VfhOFRYLiz36T
 vkyuH81CCd0TKgRW3RtKidF8VWLT5P7+BzpdesAKSg50JENYnJUNVAxEhkZVBGUBgbAo
 rSk2ZNI3oZnieov7cnVoLd+mLbGLQ6EpzTxcl0qSyl1Tu0X3VHf2ppJpn8sq7aZHQLyV
 WU6w==
X-Gm-Message-State: AOJu0YxeCRz5bG6tRy0eycI6FLLk6fX8Y03KRAZGYa0N5KwoDJ020NoH
 iu2PPrA7Ss3YDLjfIQtLt2bD53DVTpP+Gbpg2pbhhd4z
X-Google-Smtp-Source: AGHT+IELXYD1HxfNAQhsGH6KPqdVwTIgwr2TdP2FLOqlkcDRkl/LEhqidH6AUIWBzbtsC1Aan8bMAw==
X-Received: by 2002:a05:6512:559:b0:4f4:dbcc:54da with SMTP id
 h25-20020a056512055900b004f4dbcc54damr2685215lfl.27.1694629188803; 
 Wed, 13 Sep 2023 11:19:48 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 c2-20020aa7c982000000b0052e2aa1a0fcsm7664605edt.77.2023.09.13.11.19.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 11:19:48 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso10175e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:19:48 -0700 (PDT)
X-Received: by 2002:a05:600c:1827:b0:3fe:f32f:c57f with SMTP id
 n39-20020a05600c182700b003fef32fc57fmr197792wmp.0.1694629187934; Wed, 13 Sep
 2023 11:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230906072803.1.Idef7e77e8961cbeb8625183eec9db0356b2eccd0@changeid>
In-Reply-To: <20230906072803.1.Idef7e77e8961cbeb8625183eec9db0356b2eccd0@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 11:19:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4OuYAkPbEL23DbNDRNhHT+0LNSfd01aY2nmkUhSvZ1A@mail.gmail.com>
Message-ID: <CAD=FV=X4OuYAkPbEL23DbNDRNhHT+0LNSfd01aY2nmkUhSvZ1A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update DRM DRIVERS FOR FREESCALE IMX entry
To: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 6, 2023 at 7:28=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> As per the discussion on the lists [1], changes to this driver
> generally flow through drm-misc. If they need to be coordinated with
> v4l2 they sometimes go through Philipp Zabel's tree instead. List both
> trees in MAINTAINERS. Also update the title of this driver to specify
> that it's just for IMX 5/6 since, as per Philipp "There are a lot more
> i.MX that do not use IPUv3 than those that do."
>
> [1] https://lore.kernel.org/r/d56dfb568711b4b932edc9601010feda020c2c22.ca=
mel@pengutronix.de
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I'd expect this MAINTAINERS update to go through drm-misc.
>
>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Pushed to drm-misc-next:

92e62478b62c MAINTAINERS: Update DRM DRIVERS FOR FREESCALE IMX entry
