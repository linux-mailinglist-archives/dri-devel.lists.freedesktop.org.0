Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66C2283E7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 17:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257D46E598;
	Tue, 21 Jul 2020 15:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59FF6E598
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 15:35:44 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 671D0206F2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595345744;
 bh=Jq+HO2ZE92p41uBQdq/BMb/mypTi/nYDecJWM1AihcM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uMvk+L3hsMaoMlasRaEj9I8zGcI/tqH0ZIJuLcQv4IC+JuWRDgpSxScQYBkC0nbQU
 OVveghfBbeGVxsp81V0eTkkUGYdoAs9zbyM8C+LBrEbT091oRUenY85sUXGhPDsS12
 V835OiF8a8D0Eq3LGGMcC6+AnWYvmvzPL/IhH8C4=
Received: by mail-qk1-f175.google.com with SMTP id b79so5986340qkg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 08:35:44 -0700 (PDT)
X-Gm-Message-State: AOAM5302Ac4A/hd+yegtoQX2JjKoMTN2S6GsWCbZsJTB9ipX7D6CjdJN
 K2G7Gz0RqxB5KraCPCk8w8LK1gz/BRPYEYbyRA==
X-Google-Smtp-Source: ABdhPJz4TgtCgchktOu/dOftli6ITM4jB5qBpP6WwLgR2Lc4OZWUMi1i07ta0w6iQeOAXiRtzIeIDiSq6wAE9rjmUjE=
X-Received: by 2002:a37:b341:: with SMTP id c62mr26653760qkf.128.1595345743622; 
 Tue, 21 Jul 2020 08:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200703114717.2140832-1-megous@megous.com>
In-Reply-To: <20200703114717.2140832-1-megous@megous.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 21 Jul 2020 09:35:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK6hEiC0O5WeR6nKw38zvX3G=QeCq3-xZ+_9SHWcE6jrw@mail.gmail.com>
Message-ID: <CAL_JsqK6hEiC0O5WeR6nKw38zvX3G=QeCq3-xZ+_9SHWcE6jrw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix warnings in display/bridge/nwl-dsi.yaml DT example
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 3, 2020 at 5:47 AM Ondrej Jirman <megous@megous.com> wrote:
>
> This patchset fixes warnings in the example in display/bridge/nwl-dsi.yaml
> revealed during port of display/panel/rocktech,jh057n00900.yaml to
> yaml.
>
> Please take a look.
>
> thank you and regards,
>   Ondrej Jirman
>
> Ondrej Jirman (2):
>   dt-bindings: display: Fix example in nwl-dsi.yaml
>   dt-binding: display: Allow a single port node on rocktech,jh057n00900

Series applied to drm-misc.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
