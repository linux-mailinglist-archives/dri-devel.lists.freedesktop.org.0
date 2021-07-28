Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4143D92F1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 18:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CCC6E103;
	Wed, 28 Jul 2021 16:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD82C6E103
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 16:14:25 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id t26so1292607uao.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QqWn/BHPOPbSckFRicgadgAajWgZlXRmVKCT3bnmuN8=;
 b=nP9Oy3zAmObpbYStuTy8ZjKX8tEugotw371LI1Eoptm/qpfojs4bTqLEmxyDwM+XWL
 jurphaRLblUPUzwTRmF1g2t8fjhDJac8nieuSin4PeoHemBXlpe5mNLyaZ2izvEW6Y90
 szSPmD/nyP/8f7hhHs4XbNRZfKdpTUmhX4S/rl9RFdxUHpjcUEuZZUxX3Hnu1GPoxGHv
 ZtKxsFnBDL3bART22WLZcHuCf1fGO4m8jGwYFRM7zmjyZyf68QdEGC7mQcFgQt5Bt6Hx
 2bS9FvV+WCIGVLngZpfUR4DlkpNm0/FYkclipjcbcrHrY64DGNZDaaHUNd11jZ4dVmDh
 9zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QqWn/BHPOPbSckFRicgadgAajWgZlXRmVKCT3bnmuN8=;
 b=aQ5LbsttsrR3dyhvfAQN8J/ue93dRrLud3S2VIIzAnqx8GE6hmM6FLTI1Jw+eZ+dp7
 aswO+SNv0pDyxtjNhMVyGBrx8LZJjAOOXkW1mCr3w9i2Sbe33DL0EykMKoTnfqOQ8Lhp
 dT6E6FPCidRlL2tBi/EWNOS5MmpMbO9WhhePOpn9PSdo29aotqcbw0P/F9Ztz3rOzU01
 c0I/kX7V6vEmKKLXxqQKFOx0HxJmPWw63TYp+xVGB9bDApvP54b2EgyJ/NuGm6MaUFYl
 38HQSreYYpaHIOo4XlMTKePAzajFnkEmtKxYWUA+Bg/5McZQdvghTe3wKbms+OA5rHf3
 8LQw==
X-Gm-Message-State: AOAM533sCbdjT8FZjqKB4jqKB0XnMw8clQy2IV8hDeS3S5HCiXEB7ReO
 2tsIjzd/7OOA4fLBhPxYNC6Ff15DwHVvbkIdOs4=
X-Google-Smtp-Source: ABdhPJyXrLnw9h0nBb9nWWSDcZF9BIdcW4KkazctWqpCA4jbo/uoR8angkLMEqHhQNeV7vhaKRiwgKFOGtLQVwB8nDU=
X-Received: by 2002:ab0:7187:: with SMTP id l7mr746401uao.13.1627488864865;
 Wed, 28 Jul 2021 09:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-6-sean@poorly.run>
In-Reply-To: <20210721175526.22020-6-sean@poorly.run>
From: jim.cromie@gmail.com
Date: Wed, 28 Jul 2021 12:13:58 -0400
Message-ID: <CAJfuBxwMOigvHFxjsaNmHa3hgeHm27mweAsVBexFaTNGh373Zw@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 05/14] drm/print: rename drm_debug* to be more
 syslog-centric
To: Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 1:55 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> In preparation for tracefs support, rename drm_debug related functions
> to reflect that it targets the syslog. This will allow us to selectively
> target syslog and/or tracefs.
>
> No functional changes here.
>
...
> +static inline bool drm_debug_syslog_enabled(enum drm_debug_category category)
> +{
> +       return unlikely(__drm_debug_syslog & category);
> +}
> +
>  static inline bool drm_debug_enabled(enum drm_debug_category category)
>  {
> -       return unlikely(__drm_debug & category);
> +       return drm_debug_syslog_enabled(category);
>  }
>


ok so the distinction is  this has 2  drm_debug_enabled() fns,
allowing separate decisions later.

IIUC,  in the long run, @danvet wants 0 of these.
