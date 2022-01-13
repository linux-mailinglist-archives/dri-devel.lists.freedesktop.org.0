Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9757648D940
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 14:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AB210FC06;
	Thu, 13 Jan 2022 13:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99601124FB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 13:44:30 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id g81so14997268ybg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 05:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t4iOUVFv53bNQSQ/gO0aroSu848/nmRUJMS9RO8UVKs=;
 b=L3t/7x5E6+oOdmCJJKKVoRGWTgQRkrBeAvTi/BR6XX6Q5XLRVBspgMP0moqqe1UGKu
 ddfQ5RrHcPahfVgeYOmn5AHJlMWc+TOAeWBWMgyMUnrivvh+PMMHgT209bAyuKNQKk3P
 k5e1boYAvB/kJ+LnMsQsDhZiHUXhb1sNYO6pAdHkXjVzD2b9imk89CO5pjBTJ1gRqmjn
 1rGkYILN48K3Xm/0nFyBivNcRKr+prkJFgLFQudXjewMCIb583bksfZpHF2EAupjIetP
 8tVVIFo+S6Vc8JE8qXdS6cSLm37UHqx/W5t6Ee+cWLutbIkIgEgGhIgQ0VWxA2nXMH26
 UgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t4iOUVFv53bNQSQ/gO0aroSu848/nmRUJMS9RO8UVKs=;
 b=oldZT+LbWMeOV8ZTkEMxrhwSr0k+ufczM22tqHI3010PQMAV9iwIBgv8D0fcsBVF6E
 csV8AMn1fy65zYICJtDAf8r6IB6ofu7iaqn30yzILWquFMO28LrMcmlqKmujCiCPNh9e
 em9x7Rc6rdDDEu+zhMhHdAYk7WfyacDyTZ7ggU46ZR9ILfny4U40KU+vbgZjGuzDFr7W
 XNpeoee471k0N5dXfyOKvarL8KMqKoK3854HWPKnCsObqL0hPvW0TPLsq5PtSxSTNGkz
 qqIOU4XM5gyfm2tJWZku9ea3W/MUy2yFw2WsB5r7RXBG40njrJHfebjyDECWKnqx8vL8
 GmkQ==
X-Gm-Message-State: AOAM530SeGxTRIc4WMyGubr//41C36b90U0H40mv8uk6rYcDYg1rNhVf
 8aLv54vHz8GfAkt/hJxaXW+61bPLLeYcfDRJQIgibw==
X-Google-Smtp-Source: ABdhPJwo6URqBePslK+oKLzNiKNduFsi241hMu0BUXNptg5RSut3Cj4rzAH5lLArTqXi4SXz//NaTZwj4mHiagIizJ4=
X-Received: by 2002:a25:7b44:: with SMTP id w65mr5871202ybc.59.1642081469812; 
 Thu, 13 Jan 2022 05:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20220113094419.12433-1-etom@igel.co.jp>
In-Reply-To: <20220113094419.12433-1-etom@igel.co.jp>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Jan 2022 13:44:18 +0000
Message-ID: <CAPj87rPk3_8LdnwWJ3BhtJnRuR+_WHg2hfdgK2R4SMacPGCrUQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Add support modifiers for drivers whose planes
 only support linear layout
To: Tomohito Esaki <etom@igel.co.jp>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Esaki-san,

On Thu, 13 Jan 2022 at 09:44, Tomohito Esaki <etom@igel.co.jp> wrote:
> Some drivers whose planes only support linear layout fb do not support format
> modifiers.
> These drivers should support modifiers, however the DRM core should handle this
> rather than open-coding in every driver.
>
> In this patch series, these drivers expose format modifiers based on the
> following suggestion[1].

Thanks for the series, it looks like the right thing to do.

Can you please change the patch ordering though? At the moment there
will be a bisection break at patch #1, because the legacy drivers will
suddenly start gaining modifier support, before it is removed in patch
#2.

I think a better order would be:
  1: add fb_modifiers_not_supported flag to core and drivers
  2: add default modifiers (and set allow_fb_modifiers) if
fb_modifiers_not_supported flag is not set
  3: remove allow_fb_modifiers flag

Cheers,
Daniel
