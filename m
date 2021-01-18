Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F21B2FAD05
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 23:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF3C6E593;
	Mon, 18 Jan 2021 22:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE0B6E593;
 Mon, 18 Jan 2021 22:00:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x20so26170045lfe.12;
 Mon, 18 Jan 2021 14:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f/qcpZPWhGiWW+A8vsV/hNcuw4dnpSrdUrgUwntwH8M=;
 b=SjwNlHsiusaWv0amJatbnD7HFaPTEiOqneOOeoLbqkOC+QOIx6d1JkcuuOuE7b/YpP
 1+gejNq19h+49b573CS0wouwg2kxGEgDQFD8iTFmw+NHOJ7tjlI5eNA4+kC+Qi861nrI
 D91r9dHPjnMT2py6Adc2ZwJHZTPqQWUZ0UVNQRuGEZ5AFoNIMN6Ev325uxuzgOxAqhoO
 OraAD3Ot+6lYQJ0AvIMu7XPLdGdkHbEaqCYPlU+qQa3sL4d9pANmXSkJhn/sB2Tp/GqA
 uHG/fAxv3F7ajgjgN7nlozI5LZG34jwwZg10/dYgD7FIx83lC2neauPIYxfImtmkrCpM
 HW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f/qcpZPWhGiWW+A8vsV/hNcuw4dnpSrdUrgUwntwH8M=;
 b=WWzafQqCtT3I48sM8RpUOjF8qrbSW/8+oxA7mP2Wwq8H4GHCcIReq6U9CmCAFUaXHC
 VyvEfbyHEJdJAS64LLpXIUhjHeWiLhWt6AO3yZp4APLRBwpXjcG5x1yLDi3ozrZ3SQos
 79JPnJtXhC6q/kPEEX96LszGSH5rQvbeInaYEQyrT1+hjG83g2CMPxldz5hOAJ22l/WI
 n71Ct1keE7KhMDnVPzC4JiVGHhx5Fb9LclobGB8CUuJsDadFgFbLAYb9g4FRTghwzL/1
 TAlAM4teMIW4vIIfWrnbEIOir62Vzorgb8OXs+Q3jgvPnUZov4XUm0m5FlAPW/ee92M5
 Kxtg==
X-Gm-Message-State: AOAM5334lOyfmOE8v09Nc7wYgwvwA43p3GhpW9TtZxjN0ju/tQ9D1Ymg
 +c4BVqGYCM+w3D7D8RF+oiePajIn2YMxVxhu9LM=
X-Google-Smtp-Source: ABdhPJxYiJ3u8H7XCmF+VOylKNLp6lANPCM1Z7mWbeJjmvnJfA8sOlEUko+U4q2gEX7Z/x7DfYm0CHpF+tpBJ30XgbY=
X-Received: by 2002:ac2:57d2:: with SMTP id k18mr457215lfo.500.1611007221896; 
 Mon, 18 Jan 2021 14:00:21 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5D_dDTOgDZNy-NkQSPTiKhmrNKjEiqFWGX4rbZr2grDxQ@mail.gmail.com>
 <CAOMZO5DbgM6kPbNsu2XJcZsRauwey9UttSomquY8L4eyDLtZgw@mail.gmail.com>
In-Reply-To: <CAOMZO5DbgM6kPbNsu2XJcZsRauwey9UttSomquY8L4eyDLtZgw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 18 Jan 2021 19:00:10 -0300
Message-ID: <CAOMZO5CP=xW8kFZpQxb35odUBs_9+-EDawENHeCLmVoMEYOnMA@mail.gmail.com>
Subject: Re: Reboot crash at msm_atomic_commit_tail
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Jonathan Marek <jonathan@marek.ca>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 6:44 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Adding some more folks in case anyone has any suggestions to fix this
> reboot hang.

Not sure if this is a valid fix, but the change below makes reboot
works correctly.

kmscube still works.

--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -207,8 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
        struct msm_kms *kms = priv->kms;
        struct drm_crtc *async_crtc = NULL;
        unsigned crtc_mask = get_crtc_mask(state);
-       bool async = kms->funcs->vsync_time &&
-                       can_do_async(state, &async_crtc);
+       bool async;
+
+       if (!kms)
+               return;
+
+       async = kms->funcs->vsync_time && can_do_async(state, &async_crtc);

        trace_msm_atomic_commit_tail_start(async, crtc_mask);

Any comments?

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
