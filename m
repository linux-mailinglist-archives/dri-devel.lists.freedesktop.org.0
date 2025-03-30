Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF0A75BAC
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 20:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0E010E343;
	Sun, 30 Mar 2025 18:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LC2CxIgF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79EF10E343
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:05:55 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso23785255e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743357954; x=1743962754; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hnfsVQoN7BVQq/UCAqhsRfIkUla9FknIwhk198jk+nA=;
 b=LC2CxIgFaKuhkZYCDuaB+dZWY0vu99Fz5lEwnA2321q94lzKwDj8/3OYJIQmP9jeTi
 hP9PQiK7zwQh7jrkNGGgJqVHfW5xtYp4F1OrX0RZ4JXFRbFSPNTEoEHmm7Sjj/GHxh4L
 SnPyFSnl66TPqa760h2Dr8Kg++kEUoraeZ5ADifBFHW/wx6/IXE8NGyuU23tpbUpIL5n
 ge1VcgJxgsfY8b+Dp9129Rtv4xAShTjsjRuEQ1uQlKw8kBGQu3pDHElzx1PYxFJufdzl
 dio1paIw0PcIgfi+xuCW3ObgY6Wh99JzaMG0Bc4WFH9f29tEJdcQr9l9X1rapQqjaPq3
 Jngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743357954; x=1743962754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hnfsVQoN7BVQq/UCAqhsRfIkUla9FknIwhk198jk+nA=;
 b=e7ARakEIC76jFRHfwafAHwsz0akteh0dJ4/CgPXSUP0jPXfnBFMAlDbuA28zvmKBJF
 rhkLFJKokDsyKuqQeioqzHismITfiE9yyb38KGq00bslYuwpR0T2WRYGO6edG2RepqZ3
 1FvPufS+PKsBR6RjbOPljWrA1jPOzC/RX6fhIkBKmLtbzxguLpIpdyb1ZRnEwtztJu/C
 MCe+7z4PJ70J4CVuVJwI/toyQj8gAs2ZoJgq4Yay16eG5Fn1RZ3xtMgf5mcNr3jqyIpP
 /9bNc3YYSthz0nJYdYTnUnEQw/ccs9+kThNlz9BnsiQtw6Z9qmFcEJDbhHs9F7k6tzsz
 tCpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0/V/+BhwKqkczp3wUGmTItw/DTaOsLTE0zNxlJhoUh3M2qpWfRerZM0LmL5n+fWsgBZgprnrDJ24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR3e3I0gNKfDZTD9SCulYrbz8Q0ugFfTGwkKYhXxCpwU888HB/
 z5X/TgUv3pPI4hHWjY5WGeVsffRaO9z1R3fluWm4VdOdVounZxrcRuUExR7oxa7Z+evH9+FYzOi
 HC0kC79XvjqobHHLiJOnoIKRrMhINKh2xV2f4kQ==
X-Gm-Gg: ASbGnctWZUhj4Fp/zm0Zk/lizJNZxzILTKEGMbClY6oFsLqP5O64QzWc/N1Wa0HZ+9X
 yXism2w2HQb5+C7cDM9gRLWKqwn8FBd/lia07qyhqW2EyCghbHvUjPZkeHZFyA2Ep0wqD3P/nwL
 PAPGF+Ov8ugYS1VAPb5u6YFPOZgypu1wQK4SOKOIH8nj9NLn65LlEC9jbipujeCQ5S+pj1ZA==
X-Google-Smtp-Source: AGHT+IHoos9QzanPsGiYgW04xbM8tHV8yEstV7nbyP17tfhgl5Tu6pOmCopyigYoqs8pQfUizNRz5NEJZ+MuExnPEyA=
X-Received: by 2002:a05:600c:3493:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-43db62b72e4mr57523125e9.10.1743357954536; Sun, 30 Mar 2025
 11:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org>
 <f2odvmbhsfmkrkzada2a7qdjavomt2cjji7mbwibzlhxiz35ai@2qxnfb44eb2r>
In-Reply-To: <f2odvmbhsfmkrkzada2a7qdjavomt2cjji7mbwibzlhxiz35ai@2qxnfb44eb2r>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 19:05:43 +0100
X-Gm-Features: AQ5f1JrPaoChzlVOaAUOxwhyfNR6iarewZ64iTBqQ4hyLv-fzJCFGnyzphgmD5s
Message-ID: <CACr-zFDUMzb+jKcBc1SfpsOiQsAJJ0jsPdS-vcA=OXy-K3pfQQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, 30 Mar 2025 at 18:56, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Mar 30, 2025 at 06:49:40PM +0100, Christopher Obbard wrote:
> > According to the eDP specification (VESA Embedded DisplayPort Standard
> > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > the MIN value as the effective PWM bit count.
> >
> > This commit updates the logic to clamp the reported
> > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> > the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> > registers is now required to succeed. Before reading these registers
> > was optional.
>
> Describe why, not what. Something like 'is now required to succeed,
> otherwise bl->max value can end up being not set, although
> drm_edp_backlight_probe_max() returned success'.
>
> LGTM otherwise.

Amazing. We got there eventually!
I updated the commit message around this change to be:

    As part of this change, the behavior is modified such that reading both
    _CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
    bl->max value could end up being not set although
    drm_edp_backlight_probe_max() returned success.


I will wait for more feedback for few days before sending the next version.


Cheers!

Chris
