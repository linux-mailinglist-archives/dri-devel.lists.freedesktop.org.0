Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CEF51044D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E51F10E167;
	Tue, 26 Apr 2022 16:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E15E10E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 16:48:56 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e67799d278so16175178fac.11
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=m0dX/1KkBnKssPmbdM8A9ciemnXAWPrdbbwKQbZ6324=;
 b=lbevqTbjrMzew+TvBUwm8ga5txWZPoMaMRCYck3EkDpZOmQVjZzWs1fkRugwMUs3Q4
 rSogqI5UhQVAGgfUnjFPMDg0I4SNojGEZpdedS3rgZnfwvGL9yIR0hKUGXNVN37AzPOn
 +Xmz/huEGxKXt0+gVSIQP44eFAsECuoqN4gV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=m0dX/1KkBnKssPmbdM8A9ciemnXAWPrdbbwKQbZ6324=;
 b=dD6/u9G4/0J/BSelxiatZMwSIIML/mZ28OI68c+gGnh+uISfBfONrEHA5RDNKMy+ab
 vhQe/bFA2KSgsZFRnkOmvEISsg2sU3q/QsEppKJqiFdgVbHNsepNlyPCP9cyJg8TfKou
 euJKwAEtvkWbtyl/RbXvQ6ShZeqvZpk4L/YUtFg6ctRRds4nU5UH2U6DHnJnWqdCCAB9
 cTdhSbO4kEYG8DovU9ChGr9pgZJvX3XovfMkCBrRePYcUWm0QbNWTDSkUXkbj3nR/UZU
 dp1820jABK4W3W6nHkgpnx7n61IbOA64Fugd+3B67W+o20U7S34wcZlvt+C65P2e1l9o
 r/tg==
X-Gm-Message-State: AOAM5327GCmYOFFqbrLfoARr1g/oT4Alb/29naO+pVL3F5Cu2ujyMrMh
 n9VCXy1HWtrb72XRmRY1Dh7pUUqF8qWKz6TLNJhsPw==
X-Google-Smtp-Source: ABdhPJzJoj8RebjuyUxme6w64EO990J12PUN0kdxhOkG64VbiJmkbcwOUDHEsfvQOnjxeHd9GO22tLYxG/peHrubmCc=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr8126116oad.193.1650991735808; Tue, 26
 Apr 2022 09:48:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 09:48:55 -0700
MIME-Version: 1.0
In-Reply-To: <20220426004128.2832555-1-dmitry.baryshkov@linaro.org>
References: <20220426004128.2832555-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 26 Apr 2022 09:48:55 -0700
Message-ID: <CAE-0n539VhBtwH8wjZmkraZE08-ZY-Yjq3Po8eran7yE4q-20w@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm: select DRM_DP_AUX_BUS for the AUX bus support
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
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

Quoting Dmitry Baryshkov (2022-04-25 17:41:28)
> Add missing dependency on the AUX bus implementation.
>
> Fixes: 82c59ed16695 ("drm/msm/dp: Add eDP support via aux_bus")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
