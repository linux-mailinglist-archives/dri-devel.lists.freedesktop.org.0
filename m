Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F42AAB9B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 15:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99363893BC;
	Sun,  8 Nov 2020 14:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7CC893BC
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 14:19:11 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5DF0180518;
 Sun,  8 Nov 2020 15:19:08 +0100 (CET)
Date: Sun, 8 Nov 2020 15:19:05 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/mcde: Fix unbalanced regulator
Message-ID: <20201108141905.GA1204146@ravnborg.org>
References: <20201108113535.1819952-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201108113535.1819952-1-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=j8Cu_9a8AAAA:8 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8
 a=qmsrn7tjKqBQr42SAvEA:9 a=CjuIK1q_8ugA:10 a=A2jcf3dkIZPIRbEE90CI:22
 a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 08, 2020 at 12:35:35PM +0100, Linus Walleij wrote:
> Since we now turn off the EPOD regulator to reset the
> hardware, we need to balance the regulators after that
> point. If registering the master fails we only need
> to disable one regulator. Fix this by open-coding
> this leg of the error path.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Fixes: c4842d4d0f74 ("drm/mcde: Fix display pipeline restart")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Looked for a devm variant of regulator_enable() but they do not seem to
exist. So the way the patch does it seems the best way.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
