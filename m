Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9251599FC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 20:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADAD6E1F2;
	Tue, 11 Feb 2020 19:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A5A6E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 19:45:25 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CB5C24687
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 19:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581450325;
 bh=q9VPe1ydTAUi5w6cEUW2frjU+ddA+4dEWgK+7B6NC6I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FGxQCvk9BKxSg0jEbtd78/wqP1wz5MOUXCR8gNr+IUYaHsYQ1u5lvMzUa8sGNucXg
 4FUEGJKMFVaaIHLxqf5X+rzh9mkRxCFbo5ID5XRUp+s6ppk7vl2+ws9GMqgj0rnTEk
 OabOp4I7XE8UkL4fFlWIyp4FwDi6MroU5c8JiNCY=
Received: by mail-qk1-f171.google.com with SMTP id w25so11387729qki.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 11:45:25 -0800 (PST)
X-Gm-Message-State: APjAAAVcQfcxPNCphBPv3mR3gUqq0DuBXUf6JW033RheS1q2xJ72FT9g
 5IFYmOXnpeS4w8S9a0VqmM6ax4dMWd5CdbiiYg==
X-Google-Smtp-Source: APXvYqy0F+krus8t+VOTuwWLyoxJ8kM9OC5+rJsRnXBBMj4D9aoh01Q8w4F58R6PunZUYPlNZZKVVXMWCGpr1BIXR1g=
X-Received: by 2002:a37:85c4:: with SMTP id h187mr7906186qkd.223.1581450324216; 
 Tue, 11 Feb 2020 11:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20200210100455.78695-1-maxime@cerno.tech>
In-Reply-To: <20200210100455.78695-1-maxime@cerno.tech>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 11 Feb 2020 13:45:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLbG5AH_N=2UTLrwTetktdKoqjZUrF92kbBW+hU8-ucbw@mail.gmail.com>
Message-ID: <CAL_JsqLbG5AH_N=2UTLrwTetktdKoqjZUrF92kbBW+hU8-ucbw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: sunxi: Fix compatible
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 4:05 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Commit f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display
> pipeline to schemas") introduced a YAML schema for the Allwinner TCON DT
> binding, but the H6 TCON-TV compatible was mistakenly set to fallback on
> the A83t's, while the initial documentation and the DT are using R40's.
>
> Fix that.
>
> Fixes: f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display pipeline to schemas")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
