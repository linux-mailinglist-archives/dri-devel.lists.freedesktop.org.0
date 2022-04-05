Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6704F4776
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 01:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4322510E7AA;
	Tue,  5 Apr 2022 23:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDDD10E7AA;
 Tue,  5 Apr 2022 23:37:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b24so626887edu.10;
 Tue, 05 Apr 2022 16:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oxcH17jAwGUaiE3wuBD2atyeKUFb0clhJQsWsKprZu0=;
 b=Jaf1+Cf85aoNqD9Mkf9utDHfipbulVMqDx9Av7gYtCWspRVy6y0ge4by+CwQydFFpy
 VCCP1b/bxX8BqcJEKhoz7gw82p0hcCpNp37OhD5frZonVGAMHd7Hg464PLYMfQVpw3Bj
 ezjwzXdnm4LRGZPUOnT6URQuXexcDUNMlzD/z/6ubn4bTdX9llxwvP7Nn2vtjAfx4a2m
 vzPayJj9N7pdbP1nELm6kPDj4xagWfIJrPYkKZIZuYeM7zs8zv4vQTgFwcdOO9z3CxAO
 I+e7WImaTi2mM5fDa3ViQr65NTHUu8P/LhYj2wRMXdYsfe0aOQFXASDtTyfvI2qHM14E
 StwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oxcH17jAwGUaiE3wuBD2atyeKUFb0clhJQsWsKprZu0=;
 b=rqbR8UEsFhyLoWbXcOXS5uIxC4j7c2xiGVq/ZpjltgYclzZ0NTVdXPIpC9hWqYd/VJ
 LYDMxNe7cyvN0NcfZKzSmztx4sbILBtfgWhWv2uEiXTEYdRHKmjGr9WK5kG1Mg0z4MXu
 PNgtC1LFFFyIZL3Ex+XViieY6mlBcui57X31CgWnDyq7rzypWU428CaaVHiswauh7WuQ
 ITOXAPl8rrZ1ZFBCz+QejxQbffY7QPRIW1FBBEvY+W49CSqy+uKwX9uBo4MvvJCxXp0/
 H32V/VpHdlR41BAf+ICPEzWWIPzoNXn/MKo9UHhVHu0Cba8eVRv6WEjsqpcem5wdlEMX
 llUA==
X-Gm-Message-State: AOAM531r8O7GqfHPYgLHYJHIJBoewzocD4x/1W4cifTdnegWqT4gTtNq
 ajZImfnm1hBoeD8oaGMKkD4nFaffQodZbiVUnz8=
X-Google-Smtp-Source: ABdhPJwi4/FJ1MTGD+gEeQe9rdHBvAp/zIuPO9+vlFEkgtMTze+aKuKe2YS8+ewplGeSadBVQJ0LnW1XjjGpdLmypyk=
X-Received: by 2002:a05:6402:11cf:b0:41c:dbc7:79d2 with SMTP id
 j15-20020a05640211cf00b0041cdbc779d2mr6139870edw.50.1649201824353; Tue, 05
 Apr 2022 16:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
 <20220405210335.3434130-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20220405210335.3434130-2-daniel.vetter@ffwll.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 5 Apr 2022 20:36:52 -0300
Message-ID: <CAOMZO5DBrPQs-D_q-g50kqfSpr-_KAoFgVm-ZpVtHehNADA9ew@mail.gmail.com>
Subject: Re: [PATCH v3 01/17] fbcon: delete a few unneeded forward decl
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Claudio Suarez <cssk@net-c.es>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 5, 2022 at 6:04 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> I didn't bother with any code movement to fix the others, these just
> got a bit in the way.
>
> v2: Rebase on top of Helge's reverts.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org> (v1)
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org> (v1)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Du Cheng <ducheng2@gmail.com>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Claudio Suarez <cssk@net-c.es>

From checkpatch:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Daniel
Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter
<daniel.vetter@intel.com>'
