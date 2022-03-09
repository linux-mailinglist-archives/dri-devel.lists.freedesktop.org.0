Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9E4D387C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 19:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDEF10E2D1;
	Wed,  9 Mar 2022 18:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B25510E2D1;
 Wed,  9 Mar 2022 18:12:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1983921wmb.3; 
 Wed, 09 Mar 2022 10:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uoxmvtZigi1Sv5XM6EkK1OcIKPpEpiJc5xxUsYRrAG0=;
 b=hXhbb6bxSfbjFDOsU4OqO5bLCh89JJPAUzo5eoYpbhAzbdvwoRB493uWAhOmxS9PJx
 jGj0BZ4h+0QxlgwY0Qy2wuZ/MK6TJTdJ1MIIqs3qP9FdCAgNJJc6NxFYOzQRhhfQxKO0
 dV53w96PuShUkkpXWL5DdHhRtH79gUz/tHTZEfo9TCCKJ4LsDFuiozty56GbnSNpjSZP
 NCEQerydhC8OtccM96YvqOrD+TtVdYN3j1VdExUDhcwG8pbpzolISQ3Uv3tmwB9QH+9/
 Ma9xxpzFwVaWtOsH4Fb8VQUBDHk/ShdCV6Y3GWULQ5feO3p6Knah6CT7jbR6TAhJ/X6z
 a7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uoxmvtZigi1Sv5XM6EkK1OcIKPpEpiJc5xxUsYRrAG0=;
 b=s8ztClWxP1bg3mlYtu4lpuhpRdAIhl30OgAza/JwGOJgKQp5GDoPTXRRtuuZx1Biue
 +q4cC/wijl/Yk08+jIKJW4t950N6Hxymwlt/M0AoOkR0HNGJxAyEQ2ytCUw/Ary+Jvyn
 5Ol0iGngyaFC/zgsHukEz+v1lFGOyVjMqID/+OwHs6nSl83QaiPNbPLtdmnzWvQzcWT/
 8a6tbnLpIDnYxQ8i+TSE4h3eQcAB0Fe9xdYC69lDvtiYwqv9/1CNqi+5F0F6ghy+88Im
 3RXdZdbg6XYIgSERZKxZZje8ff2u/KcktY43HvJWi2IcS0OSgmT5OefxJkUd9GB8tt89
 /Bog==
X-Gm-Message-State: AOAM532511kFCiG/oOlA1rsbHiwwWCFoSTyPP4TMH/9oJgGd/WRYfUU7
 rEqdzRo8KT0oI10yFq18qX0BhHisFZSbHCa1ZBQ=
X-Google-Smtp-Source: ABdhPJwn/PPyFZWI3QlIQ2lMkCkJ7XQ89Ou6uhNsUaNYCpjnEZbfn8jOuyiXfX+3B4jVqpr89jJU/gklKt9c1VrSVyg=
X-Received: by 2002:a05:600c:6d7:b0:389:7336:29e6 with SMTP id
 b23-20020a05600c06d700b00389733629e6mr8622204wmn.26.1646849538715; Wed, 09
 Mar 2022 10:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
In-Reply-To: <20220308180403.75566-1-contactshashanksharma@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 9 Mar 2022 10:12:58 -0800
Message-ID: <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Shashank Sharma <contactshashanksharma@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
<contactshashanksharma@gmail.com> wrote:
>
> From: Shashank Sharma <shashank.sharma@amd.com>
>
> This patch adds a new sysfs event, which will indicate
> the userland about a GPU reset, and can also provide
> some information like:
> - process ID of the process involved with the GPU reset
> - process name of the involved process
> - the GPU status info (using flags)
>
> This patch also introduces the first flag of the flags
> bitmap, which can be appended as and when required.

Why invent something new, rather than using the already existing devcoredump?

I don't think we need (or should encourage/allow) something drm
specific when there is already an existing solution used by both drm
and non-drm drivers.  Userspace should not have to learn to support
yet another mechanism to do the same thing.

BR,
-R
