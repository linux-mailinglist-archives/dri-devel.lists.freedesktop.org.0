Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E948303B4D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 12:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15A66E1E8;
	Tue, 26 Jan 2021 11:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAEC6E1E8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 11:17:17 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id q12so22188078lfo.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 03:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pJqpqM3wbkcxWqAe0VwoN7CRJEfVCncbbtbba4P0YSA=;
 b=hw3DhRDn9hVvc4daS4DVeWwnNPJ43qcUIN2QWA+gf50WILmLqVSXICy7r5oDz9GATm
 ECIkd4bdQNiivPf3ijI7v4uD+jrBQtDEg59kE01gsnt1PWWcw6U0buLzykzXXNG4REI4
 0GZDEuJkpmFTWd6nBzzJSGkI6iH32Wc07L8XVDpMF2OkjY2ESdR2gEjLLW4uA7KOEpmR
 AEv7CXjcMfJ0OD0n3BxS65Wfgbwe0wRE1w1MnJ2z2su9YhBjULwx1TnYrVOSk2eqG+6w
 HEQ2kdWFNBLS5tK4HQNC2rhZcdxHgCa1QSd5pJYHnQ1KDL+MWHsXGJBcz51uVQoCQiXd
 OHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pJqpqM3wbkcxWqAe0VwoN7CRJEfVCncbbtbba4P0YSA=;
 b=FlMQIvMYrk86jV6mRXaEICQ3urZicSexqLt202qCqPOlwIOGzAj92uTeYkD+iSLpK2
 Um7Hvcmpj7g3MofGBGR2Lglct79g1DO0xb/A3e4IjnGN5CRa6gkGMmAt5zo7n/qsnC/S
 X1I6mcCX5HmDs4lij+Np1XAkNQg1wz9RkGefRPN5Qd87oshge02xpotGfXAQ+aKJFeul
 RWTPeyTx/67GwG+s9ARe81O3v+VZIfURbI8otHtkeNN0pKsJT5RPKy3lSBlI24xgC3Rk
 sCTOJX9xXGyg35s8It5OGV4EVLc3LZ6e/Yj2tlTzo1EwKEMtezpjX5bXQvLVsT8nxfe0
 9USQ==
X-Gm-Message-State: AOAM533OkDLO/3pGT2kdDJhdmCAcyFYGOy/23NDZm/pCVFtdbV7svOud
 V8rfRQkIE+rSZC0WwpnjDzL2EwfceWqip8tObpc=
X-Google-Smtp-Source: ABdhPJxU3hj2FF5Ef59xxhwdUjyo3GvwTAUt+FHXSk5+CTSLTpxLfK4jBeA6EZ42XUv6i9hPnC4gUDiyWKXB5lbV6Dc=
X-Received: by 2002:a19:341:: with SMTP id 62mr2351893lfd.500.1611659835911;
 Tue, 26 Jan 2021 03:17:15 -0800 (PST)
MIME-Version: 1.0
References: <20210108214313.GA7979@ripley>
 <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
 <20210110153532.GA7264@ripley>
 <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
 <20210110200606.GD7264@ripley>
 <CAOMZO5DJUm4zutTB1oi5M0zj4_PFZEAbGzX6_LUAkX_dvEz=Qg@mail.gmail.com>
 <20210116124856.GA3406@portage>
 <CAOMZO5DKann0ojZrhjyXOqrRq9owtgrrZTGwttD_bU0-KO=aBg@mail.gmail.com>
 <20210125212917.GA4177@portage>
 <CAOMZO5DiTDQneYMtNBDpyqtYUYJ3AZ_fqWNSyfxWB5AfaNfULg@mail.gmail.com>
 <20210125221701.GA20107@ripley>
In-Reply-To: <20210125221701.GA20107@ripley>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 26 Jan 2021 08:17:04 -0300
Message-ID: <CAOMZO5A99AJ9NVUmbFr3pE2jxXnQnGNZ+00LHtBTtG3f2mye8w@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
To: Oliver Graute <oliver.graute@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oliver,

On Mon, Jan 25, 2021 at 7:17 PM Oliver Graute <oliver.graute@gmail.com> wrote:

> I would prefer mine, because I got a wrong colored penguin on bootup
> with yours :-)

I have originally passed .bpc = 8, but looking at the panel datasheet,
this should be:
.bpc = 6 instead.

In your patch, you pass the timing parameters three times, but they
are all the same.

Usually, it is meant to be: minimal, typical, maximum values.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
