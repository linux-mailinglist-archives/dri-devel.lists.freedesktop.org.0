Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F31418B3B
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 23:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489616E59F;
	Sun, 26 Sep 2021 21:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C6A6E59F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 21:25:59 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id w19so16589058ybs.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iMPgg6KbNR7SBuS84OoPSFsPWPTjKDeqDpJ1FZRuuU8=;
 b=fhyf21dva/dA7hTHOYfThNp2a7oPQD7YyLzd4632YHpv0fb0+yw9pI03VHxZJZtBmh
 bLXUOqGgDnXHgwmjViGuewaY3Xx8o+qWn3frItKEciD5a+jG8G5VtOHpZhSUYb0XqNAu
 +3sCbmfi+L4+rjmOl2VhNyMQWLzYlHrz75rX8kiFOll2po48Dp+NdPZ8dsNMr5bG/mnk
 ErqATV57SoZMoWI9jrvxPKmmAo8KdFkeXmG8a1T8lP/WvRJP/FXveCsdvh6ymlljUZC3
 D+X9May/v0D1qa6RML4ptAAePQDnC2qOtr30okRtHyKpGBoropDdRNaJTzfMHEScVuq+
 tA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMPgg6KbNR7SBuS84OoPSFsPWPTjKDeqDpJ1FZRuuU8=;
 b=fQ08UWwaUkrV3FlHiMmO/L8d6WU/kxNkd+OpEaiNltnmbcgajItIuLwl7fQsgBARno
 P8GleHnV461lCHEgb5rBO3AxQrG2Dvl+1PERzQUCmEuYBreUHhGCsjxKlyW7lpWEsmhd
 FHwfDpUEyNr3utNQqKpXnfQEuaraFB+TYDdipK1swDV1YD3Xg2ZL6yXBUiYkvqkiLk2j
 K9LUdFxynLzaH4z8qSunMcyDQOjSerSxrbetDrI+LdxVIaW5CwwGRLOeS4v/mRDkzovW
 m7rOECU24gFhtcm0CcNYKQP1z07SKmFqMkHm9xvbkBhdg6jbs2sbXhiD414aNU5Md/4O
 Xpyw==
X-Gm-Message-State: AOAM530cA3VxREe7XjdcowISywWp3X5Q1BxmsF/Mny87JB77yij4V68k
 /7+fYEBXOZ+qoxr3Xhmkm1TtPrWa+8sQjTJGl4yq9JWT3YE=
X-Google-Smtp-Source: ABdhPJx1NfwleFcTxfWxFAiysMSCTHZoLytPJlIZhAVZFpLQob+c9Yfkd5HCRMqU0I4M13juZpZCFm9+SNyTaY3E4E0=
X-Received: by 2002:a25:4543:: with SMTP id s64mr24430101yba.346.1632691558433; 
 Sun, 26 Sep 2021 14:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210924135530.1036564-1-maxime@cerno.tech>
 <20210924135530.1036564-3-maxime@cerno.tech>
In-Reply-To: <20210924135530.1036564-3-maxime@cerno.tech>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 26 Sep 2021 22:25:22 +0100
Message-ID: <CADVatmM7KEW6mGTHrfWt2mU4J79cJBjDH99rhefsz724gN7-Hg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/vc4: hdmi: Remove drm_encoder->crtc usage
To: Maxime Ripard <maxime@cerno.tech>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, Sep 24, 2021 at 2:55 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The drm_encoder crtc pointer isn't really fit for an atomic driver,
> let's rely on the connector state instead.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>


-- 
Regards
Sudip
