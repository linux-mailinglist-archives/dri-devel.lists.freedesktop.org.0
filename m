Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC8450F08D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 08:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22EF112544;
	Tue, 26 Apr 2022 06:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DA311253B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 06:00:58 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id a10so19583085oif.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 23:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Wit8rbTM2VYf6vUKmIHeUUnnIfDCsz7ar6R39GV+tas=;
 b=hd8G4VjioxyMc+UVOw79VgBvFmlxIV9Rrpp7TbI0Jm9xKCVBT626QbjZZWuMzbv5Yz
 lfeJ6mX8cUcw0K1GhHY7rD3pHXa718nrq/ZMx5IUZiFfW1T8RVVqTCvfb6+ik32HZP3/
 SozL4gTAkcwxgVkNidGvX5xfNuLL4gxQVs3iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Wit8rbTM2VYf6vUKmIHeUUnnIfDCsz7ar6R39GV+tas=;
 b=H1TlYFdQhqqraFQTbzJoWzAuAFBei/0gW2RMY82yAjDiJLXDLVW9pNYzvX1U48mzuu
 ckncqIkCqOaqK+Es3rTqQDXzwjIRoxI5uMc5SeIgG7Tnx7KH5ENm3k8b5ip9LVLaIEY/
 7N7bPi1+lU5JRqP5CCW2wb9coFGHC1pvN5B8Q1zmiZ0DGgaw2lPoQl07Eb1Jet3TGqBj
 x2atO9Z63skqCMvM/JGlEtdfIgQRdoyErfEvvoifRzcuvG4iW3OpAtlvsO7UpibaiX3C
 PwngveEbaSk+92rz7rDzJM87rZePgWuZhFNcH8K5RzvPXns7ZVH1jrZ58pl+KTuDicwI
 vQoA==
X-Gm-Message-State: AOAM530J7cyOG87flEPonStmQAN0vdEr9g6fST3Bs4eUTj5CyRWLpM69
 3Wgx3clDiCE4GGnRH6gyAK9bymbG79ebyWT5YJFAgQ==
X-Google-Smtp-Source: ABdhPJx/DXIJPn9m/RMOSlqtJpPWvHURBqE5bubgiZvYTm/Xfs6dAKYq3jMp46vuisc1fF8p+9rweRvZlD4yuUw+gt0=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr10076037oif.63.1650952858263; Mon, 25
 Apr 2022 23:00:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 23:00:57 -0700
MIME-Version: 1.0
In-Reply-To: <1650952595-27783-1-git-send-email-quic_khsieh@quicinc.com>
References: <1650952595-27783-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 23:00:57 -0700
Message-ID: <CAE-0n53kv+NPJ-4Cpjy_FeJT5xOo7fLNz24fyGUcjy6ucccjbQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: remove fail safe mode related code
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-25 22:56:35)
> Current DP driver implementation has adding safe mode done at
> dp_hpd_plug_handle() which is expected to be executed under event
> thread context.
>
> However there is possible circular locking happen (see blow stack trace)
> after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
> is executed under drm_thread context.
>
> After review all possibilities methods and as discussed on
> https://patchwork.freedesktop.org/patch/483155/, supporting EDID
> compliance tests in the driver is quite hacky. As seen with other
> vendor drivers, supporting these will be much easier with IGT. Hence
> removing all the related fail safe code for it so that no possibility
> of circular lock will happen.
[...]
>
> Changes in v2:
> -- re text commit title
> -- remove all fail safe mode
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Should add some Fixes tags here, probably for the first introduction of
this logic and the one that moved stuff around to try to avoid the
lockdep warning.
