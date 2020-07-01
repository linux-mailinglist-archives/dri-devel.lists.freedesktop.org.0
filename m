Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F017421054A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DE36E3DF;
	Wed,  1 Jul 2020 07:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A82B6E3DF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:48:15 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c11so13018236lfh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TjiYI/gEP169VVLakifLbvQVy48ggB6CHQLcRMroefU=;
 b=RVyHQuQzZLBw/SQpUEi8z7UybHsmHph+B+xx4GJ8dm4Pxr+SkoiOvWF1jJUp7DQTL+
 Eaviic01wVP9FqwpiZ96kYPmfLyATrWKc+L333nvEG6xVhOMwJOzuCYElHaq1oyNmg1z
 NO8CcPBrA7MLBX+dExcxO6XpNStvjllUuxl9fDkjTmAYAXdTJFR55Lja6XymUvDbl9bN
 Jppn4l+JPRuIboEqwHTt9oGCno7OFkeBawKH5nY+i0MH+LFVRzqv9Dvr2dJLbyiQR/YT
 ceK58913bJiU0qI3nqLSCfm569894PStfpzd4k34HDglx/XrRt7bhvVpx4mR9JLMor+8
 5new==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TjiYI/gEP169VVLakifLbvQVy48ggB6CHQLcRMroefU=;
 b=bxrYtlVaPjPGhYqsow84MHglvOa0jgK9YofoxRFsl152OyrkDBk9wfPh6iArCOthnM
 lCZqb/31sBjxUitwOPS5dGhdq1ztGgVphQfEKJPLnS5lwfd0FvyAJrq8WhuLK9qxeizm
 6HMgW6sE2EwMuMUDIFlshlxT4IYFsvp8aJnbV3Rq0Yq4KvRax04vloqbR2zfND55WHKy
 XGSkbOds3EOOYa/uWE0G2FQpE8ZPd6aYicbT/WbeQ461e7z/vqLdqkDafRgg5QIFeG0A
 4+l6JfMrm/unzvwDaxvItHwTElDVwoh25u3MFunflfLKGU/IaJWBwMAdujyzEpTfZ0/S
 fB2w==
X-Gm-Message-State: AOAM531vo5UmNgpG/ncYsuYe8ZYon8w/dPX0xKvAotzi0KeMX//JbpQ7
 jBF068nNEj3aokN3COaxzdLZov/I7aWTT7AlBiZsGA==
X-Google-Smtp-Source: ABdhPJwV5xZYRat45bbOJ4xsC/Efdt4tNxEMd6akXvKgpkzyErWL1uwmbKlZUIZd3iRZnd8NQDpvg2racqna36gSElA=
X-Received: by 2002:a19:ccd0:: with SMTP id
 c199mr14342828lfg.194.1593589693523; 
 Wed, 01 Jul 2020 00:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-6-megous@megous.com>
In-Reply-To: <20200626005601.241022-6-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 09:48:02 +0200
Message-ID: <CACRpkdYJbojy5JzSQ-gvQC6QqGOGCNDLz4UVmCFyw7cZ20ekBQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/13] drm/panel: st7703: Rename functions from jh057n
 prefix to st7703
To: Ondrej Jirman <megous@megous.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Luca Weiss <luca@z3ntu.xyz>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> This is done so that code that's not specific to a particular
> jh057n panel is named after the controller. Functions specific
> to the panel are kept named after the panel.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
