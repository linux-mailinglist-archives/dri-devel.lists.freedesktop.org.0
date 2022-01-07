Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3177486F20
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 01:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C20510EAE8;
	Fri,  7 Jan 2022 00:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF7E10EAE8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 00:53:29 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 r7-20020a05683001c700b005906f5b0969so5000387ota.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 16:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=HyIyD/FeTK4sbdzxIDEW/7ZUfCzvimbAsXNwxxbAmpw=;
 b=FRUqR4QwchxI3llxfhdNdykMyi16FLkC3n7I1Ac516fAxo9xniQwI0Ms3jeeZ4WrD/
 dC3IvIuty6qVmiMqt2ICkeG2C/VHno2euq/A5tX9cSdCoSBx7r7AR72gbPVB3g4707Rh
 CzONEFsFX/tRLB1idnqT4QPEBEEtVLEuCmO2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=HyIyD/FeTK4sbdzxIDEW/7ZUfCzvimbAsXNwxxbAmpw=;
 b=2VBSKLcQoLcJ8pOhgkT9ufQJ69KgwOAy7w8O6R2KhEdFSLu7dxOty65MuUWK4SJAki
 b/hbeu7P/xRKgzxf3DNilDT4nsIN9xRYw5EiVTNInF9g7aGydCS3CyVftKilEY6QAv/b
 5Fjav2I1M1EKcPqefgYye9/AgUVg5u+x2sP141/FL3+9tVgp/L2n42AeF07Xv6g6cg0Q
 e+75KpVoNpaF/8S9UwWcTO6dndz3/Ckx19qiBlrIjkNqexuZjeQ/6ttVUJ7WR0uick/Q
 PBkHKwrEnsfPVeLK39K3rWzl+r+fyral46dO5Sf91r3eTeLKg4kjVAQoYYDZk+rUTzVW
 Cv6Q==
X-Gm-Message-State: AOAM532cVJz8alc1E6fRHpNCt5hupgt4udYzVIwIsYOA+NR5TQt4oAPn
 M/bNIQU4jiV2VXlPM4coz/aV1Ikz/jRJWxkmlF6wCQ==
X-Google-Smtp-Source: ABdhPJwSKDzu+nMqGQvxjht/3U4F2wicx9+GJ22pBtNGUIRUIp5sFm092+riUAmgWDhW5NgpOHw37OdDP9M8PvRPzFU=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr753580otk.159.1641516808695; 
 Thu, 06 Jan 2022 16:53:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:53:28 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-2-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:53:28 -0800
Message-ID: <CAE-0n50ZOAzmNsjv9o1FtXW1rYLaKmd_UZwO1dMKTamdL9nFOA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/msm/dpu: drop unused lm_max_width from RM
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 15:10:27)
> No code uses lm_max_width from resource manager, so drop it. Instead of
> calculating the lm_max_width, code can use max_mixer_width field from
> the hw catalog.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
