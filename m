Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB52F21F1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 22:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE0E89A20;
	Mon, 11 Jan 2021 21:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F33B89A20
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 21:40:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id o13so213907lfr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=08kjOHNqoclzbrayusYvCm0uOJ7HCLLD67zwmvsDXe4=;
 b=weTv57enjPTOq4oMIemwhYr70s+g2FAdzvRmyRNOWRWn7InLvlBB6ybnl61f5EMvw7
 BLTgP5gInZPfzMapQhzopc0zIReuMlJ4G+gVkIBi6h49SevzTpqZLPy+5BiYGAKaqyAZ
 YgzBZ6u4sz0+viO6TF1A8WVgj4dU3qJilGZeMbkeYHV3YE9d1gSpcXQOL2FiYwwJzHEd
 r1NNqGDolmxeKPC8gBN0xqmj2LrVdLzeDTiX+4ZwAyZ00BxjaM5EfaS+ojnSj5xEueZF
 D5y/U6/004migaQz84loC5Gt/iuh5aCDF0QMVWVjdqxZjn/hWNQMIfMRYyfVZzTXHEl1
 pYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=08kjOHNqoclzbrayusYvCm0uOJ7HCLLD67zwmvsDXe4=;
 b=jjl4cujSg1lL0bqkiM3Yi8WkSPaUInvTPmqZTYOojpSsaqD5nhohbaLQfDiJI7A/Vt
 bYoF2Hud69W0jQmFpwIGV+UbUacwq5uafVEiv/ZP5oCiCuEP919nQnwECEotMaz7TytQ
 04WNich2rttwjtKK3v5oAPUNstHGaiVDUoGx+i9DzChFcWQJriV8hBkSpbtXOiG+h0Ng
 OEviTyOh2efvpbZoXt04ICJKGi7mH69yJc79im95s5lcpD5kH4dZrAqkYRztkoNN6JSj
 rmnN69W3h0rxTFaXFgsH76tkipFnMY7wfg9y8pWjAO+uUkhaGonkq5FPeTCHBzY2oo+A
 PEzA==
X-Gm-Message-State: AOAM532Ncv0LIL0DAiGAacEeWjbDr3R/xHte65PtvDtx6HiOFXHhTmKt
 86OSvnupzyn1BLPr/3tpZQitfLCkhykpXgNPl6ppwA==
X-Google-Smtp-Source: ABdhPJwLUslnyOi+YACIjK6CRZtmKO7d75Gyw6+DbuEdMPrz44s2sSAyN9jpISaCv1mvXHRvgqyRoUKmtkI0NE+o67I=
X-Received: by 2002:a05:6512:74e:: with SMTP id
 c14mr654796lfs.529.1610401257577; 
 Mon, 11 Jan 2021 13:40:57 -0800 (PST)
MIME-Version: 1.0
References: <20210110120926.80471-1-linus.walleij@linaro.org>
 <20210111161930.GA3575260@dell>
In-Reply-To: <20210111161930.GA3575260@dell>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jan 2021 22:40:46 +0100
Message-ID: <CACRpkdZoSdYss71McN-wy5NSDE6dnonzSHmrNdVkaLw7qmS6QA@mail.gmail.com>
Subject: Re: [PATCH v8] backlight: lms283gf05: Convert to GPIO descriptors
To: Mark Brown <broonie@kernel.org>
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
Cc: Marek Vasut <marex@denx.de>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 5:19 PM Lee Jones <lee.jones@linaro.org> wrote:

> > ChangeLog v7->v8:
> > - Rebase onto v5.11-rc1
> > - I wonder why this never seems to get merged...?
>
> Because you need SPI & PXA Acks and a merge plan.

Ah you're right I completely missed that the include is down
in include/spi/...

Mark, can I have your ACK for deleting
include/linux/spi/lms283gf05.h
As part of this patch sets?

I will collect the ACKs and resend with a proposal to merge
through the backlight tree.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
