Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A72B2D0DED
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 11:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BED66E566;
	Mon,  7 Dec 2020 10:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93E86E566
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:23:37 +0000 (UTC)
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com
 [51.89.119.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 1967A200009F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:16:15 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="MBgHa4HW"
Date: Mon, 07 Dec 2020 10:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607336114;
 bh=HPXRuUBJKEJLeejKe0O3LJNo3FYv/4yyPm3csjNE6Qs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=MBgHa4HWT1pQfUWHma+jbVEgBNNVEnpCGxvNudCXkjiG3aYtf1AJ1d6ex8r9ZgFGh
 yChjj2SUuqgTjgkCHhRJAerXMAZB+MrbKVlcRz8577gUxo8Dc4QfWhMQGo2Uo79XBj
 QEl2x3z3hCF89gysq7UPuUoIptBTkz0+1vSw5U1toDtF+7hAOmDFsc/Km2BgRMcOhT
 HlEuPsN2+gy487c1kVfIEe1qS28UiapDQmjz4xYUNYD3IWWLuht7YHxJXd8u2w8zyn
 3iB2nEmPXyoSMKO6+uqm4orLIB1Zlv6eMzDR61dK0awC4NGNvfRjP9NskkuX6yOO1o
 319Ffmgn0cyIQ==
To: James Park <james.park@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Message-ID: <Glc_SUKz41Qk-bI6N9lfbRPQpg8K4AqMP-uRty-_TCiGYa3EJXrGuV70sLamoqzb1X9xI9dGRXgBqrsL58eqkXGz3Z1MEo1-391gRFo5N0g=@emersion.fr>
In-Reply-To: <CABjik9dQUk48nUGmfnbQcK26U+Gtw2oqpyC44myEYU-Dgt5Lwg@mail.gmail.com>
References: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <1607215171-36-1-git-send-email-jpark37@lagfreegames.com>
 <1607215171-36-2-git-send-email-jpark37@lagfreegames.com>
 <V01BVRDu5ULkPDHO-WKC98pTaPlU3acbwd99o01-R6bWW0sO9SVlKjTo8l-bvUd6C1BwJafiZGBQ5XeWMFPteVDoc0bURCtVCu2A8IVau3w=@emersion.fr>
 <CABjik9dC26tm0KzOc4SqWm-f-LW=+JbzZQuOR1fZJdZXowHaVw@mail.gmail.com>
 <C1hn9atmhrsfGrdxpjMd9sURb7AK2mpm0YkULfT-i160BF6miRFym6dmoBbzXK_bRi0j2L1lf8jbYw2b30yUYQRqaBaS5pxSKkCxxaK_y7g=@emersion.fr>
 <CABjik9dQUk48nUGmfnbQcK26U+Gtw2oqpyC44myEYU-Dgt5Lwg@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, December 7th, 2020 at 11:05 AM, James Park <james.park@lagfreegames.com> wrote:

> The original code blocks in drm.h look identical to me. I see:
>
> #include <linux/types.h>
> #include <asm/ioctl.h>
> typedef unsigned int drm_handle_t;

Hmm. Actually you're completely right, it turns out it's necessary to
duplicate the branches like this to make `make headers_install` work
properly. See 00c9672606f7 ("drm: Untangle __KERNEL__ guards").
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
