Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3E74E7AE9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 23:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CB510E078;
	Fri, 25 Mar 2022 22:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6456B10E078
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 22:05:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id 5so15536216lfp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gSuHxcWKDft0wEiSByRN3yAcLQsM1bheLGndcSgmOqw=;
 b=FKSMHhqizDs33EW3ErY303/fz+7K2TKqwcs+lhK0yRoiucDb2viQAjpvZhR4ZNGmAn
 BZ0/xX06mv6AWTFECzIy38wMtRDqrwPC1zzthhbLsTxaWi7L3/ucSC2V7NRdPIK25cIj
 zVNrah701AB0dl3w9zzN1KtclCYKI6xb+uAwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gSuHxcWKDft0wEiSByRN3yAcLQsM1bheLGndcSgmOqw=;
 b=OXg7i/OVNdiD7/AhFj8vI2SbTqxf4N0IrMFMeEWrg7gV26Phk6CIzA+Nc21uk4pXYZ
 gbolk/k2utmVz+7nJQyVndkgD+aN9taIUtxjRGpvr0qdPv2vgKJPZ+hlnEcBA5OBRVMo
 7RUvWSX3trc+dVsOBOzGHHZW+J5NaNOkwTxqGYmJSr2tRMKo7rzfcuGIlJ6Bb2vg4Rmz
 NOW9KR6KPdtdcyDgDOaO960U/mXLQcnND3szaJthlPYS9RQkHNm7Wq1NoFVtN1/ydpvT
 PI/+USdaga7r/Dg0uzqdjYHJw0cv+KKQjLr+aHmBIlbQYWC4taMpZjs/3ksZIQnbQ8xq
 CR3Q==
X-Gm-Message-State: AOAM531qJXQAcl/0lcK3Fuxd6tX/s8iSTqcOzEpcWBMPmQ35f2Rjg024
 G5/Cca7e9IoWlPfka34W+K5S9jEVnGk0Su0x2a4=
X-Google-Smtp-Source: ABdhPJwkZabu/pR7vyX1eClux5Q571fFOfRUIEaMg0Yw61ZtdKpeefn/CmCU6RUQpf59tSEhGjUpvg==
X-Received: by 2002:a05:6512:a85:b0:44a:3f77:d9b9 with SMTP id
 m5-20020a0565120a8500b0044a3f77d9b9mr9366886lfu.465.1648245905051; 
 Fri, 25 Mar 2022 15:05:05 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 i4-20020a056512318400b0044a31d60589sm837026lfe.86.2022.03.25.15.05.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 15:05:04 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id p15so15518840lfk.8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:05:04 -0700 (PDT)
X-Received: by 2002:a05:6512:3d8f:b0:44a:2c65:8323 with SMTP id
 k15-20020a0565123d8f00b0044a2c658323mr9471453lfv.52.1648245903684; Fri, 25
 Mar 2022 15:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9ty8CYpuQ05BjgB9_CBRUjiL5PMTF-irHRXKOWtOrgxxZA@mail.gmail.com>
In-Reply-To: <CAPM=9ty8CYpuQ05BjgB9_CBRUjiL5PMTF-irHRXKOWtOrgxxZA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Mar 2022 15:04:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3LoxC8izR6fQ=RsD0ndtZjY_o0-Pg82XtHYQNS5RPoQ@mail.gmail.com>
Message-ID: <CAHk-=wh3LoxC8izR6fQ=RsD0ndtZjY_o0-Pg82XtHYQNS5RPoQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.18-rc1
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 7:13 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Some fixes were queued up in and in light of the fbdev regressions,
> I've pulled those in as well,

Thanks, pulled.

It sounds (from the other thread) that the mediatek DT issue is also
about to be fixed, even if it's not yet here.

But that hopefully (probably?) affects fewer people and testing robots.

             Linus
