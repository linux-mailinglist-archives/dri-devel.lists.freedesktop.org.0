Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D935E5AA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 19:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E10E89D5F;
	Tue, 13 Apr 2021 17:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2A389893
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 17:54:03 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id b17so12487653pgh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 10:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+4PyFE0Z63r4dwfjFWUfn+ZwYI5WhtCq0wza5SYUhT0=;
 b=kFidD4BqxO16i5NDjlMk21z4/+O58HvveY9D/z9HTJtgK5j29TK/u2FQq8biPbYrVC
 n4SQncXF96eXqonDFNOcG8RSZ1Mx/9hASAu1rXmQBB6CrLADOaoI2eBexHQBc4qnPij0
 hkqOoqSua0sAvrdiTzwCxS95gNecLFS3dp/xqp+0cA+ZWRxeEkrTk5PEh34sugAJeHu9
 ZwfOtOb2yWDQ1wJ1yvlPq7IvQpLzrdEP5rJRyYJLs7zaFKo3r7ZZ/9M11ZoSYvswv/sy
 8ml4FEQ4UAvrQ3wK0D7aSv6oNMiBbD5HaPYSwVjnUDraCTXcwUWu7qBUC7TT1EbGwGvV
 adzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+4PyFE0Z63r4dwfjFWUfn+ZwYI5WhtCq0wza5SYUhT0=;
 b=h511S7qaO/gHGcYy5Dn8mskiIZR7EaHeup8MynCNX+BreeLZ9KQ7xdFGe2XVQNGoUv
 f3W2EAhOoefIWZ08LHIaIUUH8Ba5JfJx50blbcNry8v/Mj+43KN0Qemt/Q6pH8S15eWh
 tCONpSVQjxItxZufo95x6pn5UhVixk00HKi5lp+HTZF21ZFEfBZrOSls0trlf1u2Nk7z
 y9jmarsTy42Zn9ZBQByczjJP0HNpM34ZYR+knwwyQTonGbf6fAO7ScODsNszBUW/yCJB
 d8EgSDX32CoKMYQekMwrG2o+6yplPxznaV9mzGS5izVW1Qk1ngyLNkAi4ADQ/w9huByx
 DF1Q==
X-Gm-Message-State: AOAM532zDMf7Il0moKOukOz9Td9s5ULB2vWDjR9pnRWIB55bkruVZByL
 ny49mZoTYXVk29HIqfiSSTCvKf0xuYW7XTWoh2EDJg==
X-Google-Smtp-Source: ABdhPJxnIrnRes9OE/FCfsKMv3Tut65YdVv51sZZacX49GiILt4E8sd5eUm7EHV6B623gCj+pFr1rLZMC2J1IN2utb4=
X-Received: by 2002:a63:7708:: with SMTP id s8mr33748780pgc.265.1618336443222; 
 Tue, 13 Apr 2021 10:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-4-narmstrong@baylibre.com>
 <bb9196e3-e2d0-e44b-0cf1-cb469ea2edd7@baylibre.com>
In-Reply-To: <bb9196e3-e2d0-e44b-0cf1-cb469ea2edd7@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 13 Apr 2021 19:53:52 +0200
Message-ID: <CAG3jFysHBhj-mj_WAmHNaTDdmzkF2UwTmWc8Xnzb1zdcFFYN7A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: add it66121 HDMI bridge driver entry
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Phong LE <ple@baylibre.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, paul@crapouillou.net,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Apr 2021 at 17:47, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 12/04/2021 17:46, Neil Armstrong wrote:
> > From: Phong LE <ple@baylibre.com>
> >
> > Add Neil Armstrong and myself as maintainers
> >
> > Signed-off-by: Phong LE <ple@baylibre.com>
>
> Obviously:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>
> > ---
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9ae8444c96b4..ff6450c83049 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9515,6 +9515,14 @@ Q:     http://patchwork.linuxtv.org/project/linux-media/list/
> >  T:   git git://linuxtv.org/anttip/media_tree.git
> >  F:   drivers/media/tuners/it913x*
> >
> > +ITE IT66121 HDMI BRIDGE DRIVER
> > +M:   Phong LE <ple@baylibre.com>
> > +M:   Neil Armstrong <narmstrong@baylibre.com>
> > +S:   Maintained
> > +F:   drivers/gpu/drm/bridge/ite-it66121.c
> > +T:   git git://anongit.freedesktop.org/drm/drm-misc

I'm getting a checkpatch --strict warning here. The two above lines
should switch places.

WARNING: Misordered MAINTAINERS entry - list 'T:' before 'F:'
#27: FILE: MAINTAINERS:9537:
+F:    drivers/gpu/drm/bridge/ite-it66121.c
+T:    git git://anongit.freedesktop.org/drm/drm-misc


With this warning silenced, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

> > +F:   Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> > +
> >  IVTV VIDEO4LINUX DRIVER
> >  M:   Andy Walls <awalls@md.metrocast.net>
> >  L:   linux-media@vger.kernel.org
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
