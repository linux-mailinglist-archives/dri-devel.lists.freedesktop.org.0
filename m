Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654EC2F085F
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jan 2021 17:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AA76E0D5;
	Sun, 10 Jan 2021 16:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B2A6E0D5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 16:22:54 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id u21so894540lja.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 08:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GTLBpzTo5LeLsTDW+FDGFlqPoi5x9gPnyhITuJXu+rM=;
 b=DSYv2zoCerXm2EH5e+7b/j5ZbK2t8jAEzGYQh0iJYcLVTAxjb5fK1Ho1Dw3FMWN7gw
 NR+wBmqoUIxB654BISsNuF5bjHox78pr5MQCdk8iOZRYoVtlsfOIqbJnuL3lcsU4bL2C
 8xubwMAexbWdugUs44dosZVFSjpQoU1ZSTMeRntrB54tPAbsPCoXGG0YNhT3YU3Hn9Nz
 uWzVohmQ0wCT+74oX+HlMkK34KQLUr0poA6ExVtoCyRaZbL3F3WdsreGL4f4oaZy/vcB
 AVfVOG0uJpwgHZP+HGVHKbR45mYuszQ3vndqE+S3LxQVFftV7491Z/6ukyYQxld/oDui
 s9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GTLBpzTo5LeLsTDW+FDGFlqPoi5x9gPnyhITuJXu+rM=;
 b=ovQNcCKM25NcDQJxbmcebqbimd/bK6ebnHr5h74vfPsL4M3FDSGvTbZFVNp61XOHNk
 14WinPziQMDc9MOpKu54y3Ju8mJxlGF/oEVESCoSJSjtd7/FF6b5RMYKnXRd95ts7Zu9
 3rZJ7XbknoKwZOnvZ2Ia8LgKsnu99QN0p18nzq3xSqaMfJAwXskqDr1rMV3SRDHrAmGB
 HP8gwcHw9SdGXKAiqroWE19RUWlTBZYRUxga2YP2No8SwCgeh1aHfjM+1DSB1oniXrF/
 3VyWCaKJL9YpzphAxc1b1OAz0sic+FC1ztRAJzMijaX5GfT8Oz5a+JqU6A1qpzk4L/dp
 LnVQ==
X-Gm-Message-State: AOAM530wfzO68z/njR++QAsTGiQBP1MEfAX3HMjmCuJfVhVV6nWmKFpg
 GwkkyvtUz6eK8UR5v4JbeBlZ6UoGfi/S7vClLTw=
X-Google-Smtp-Source: ABdhPJwfxTKkebF7iHh0xQPCulFMc9mmeS6SOuIeo78Q1pwvGaE4csL7+fOXZDRXARAV1qk+pExkZkGaGhfLhjSCczw=
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr5589390ljo.490.1610295772934; 
 Sun, 10 Jan 2021 08:22:52 -0800 (PST)
MIME-Version: 1.0
References: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
 <20210108214313.GA7979@ripley>
 <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
 <20210110153532.GA7264@ripley>
In-Reply-To: <20210110153532.GA7264@ripley>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 10 Jan 2021 13:22:41 -0300
Message-ID: <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
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

On Sun, Jan 10, 2021 at 12:35 PM Oliver Graute <oliver.graute@gmail.com> wrote:

> the first two errors are gone. But I still get this:
>
> [   42.387107] mxsfb 21c8000.lcdif: Cannot connect bridge: -517
>
> The panel is still off perhaps I miss something else.

Some suggestions:

- Take a look at arch/arm/boot/dts/imx6ul-14x14-evk.dtsi as a
reference as it has display functional
- Use imx_v6_v7_defconfig to make sure all the required drivers are selected
- If it still does not work, share the dts and schematics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
