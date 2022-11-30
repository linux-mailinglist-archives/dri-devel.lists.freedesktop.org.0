Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B692363E0FC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 20:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC0A10E4CB;
	Wed, 30 Nov 2022 19:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF34B10E4CB;
 Wed, 30 Nov 2022 19:46:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d1so28835587wrs.12;
 Wed, 30 Nov 2022 11:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S32eNcmKc8BsmSbNdo6lcSB9y3EoyZdyaRpNrZM6V6w=;
 b=UUC+BzboTsI/n8m9fvee51hT11xqTpN47g5tWD6UNGEd0OskMBYqwsFGs+nlqrHxOV
 BALt2Er3U+8TaK2n9tMbS/fAfkCj+hgqrO+alT8s+LMQYk5yimS7kZN2CR89RPoY4uhc
 cQHJmo0wolfI7WM3+OYlzqzf2j21B28uz8u3NBJbsAK5PW+ruOOMvYC3tlcqE4af10wD
 4TjzpFRTZwbi8F845S9wOe99qbWANR+cxFohuUNS1Wqr6G1ZK6t0dgfZi1wQC37RFJEW
 c0XNawXhOUoNJ9MBGTTLrZB2bizUd2E4n7ou5BnZGCLL42p+vxiweDzll9tLfzVwShVY
 268g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S32eNcmKc8BsmSbNdo6lcSB9y3EoyZdyaRpNrZM6V6w=;
 b=7pTmRrzsJhnmw3mBQA/WWUHgMkBVz1l9G9uYzazMT/AC4ZA9+YCzl1Brf3wnLW0e+G
 jpCSrpMfnfgPgLCXO2qVxoziyRsxot6fwXDD8P4cZ+4HfrkuNHjv2WRe1z5kIeH7W+j1
 QpD4LSrTzOuZEvOtT4Io5Uj4TJrqt+o1IIWaZKIoI9CZ1UM3fcatDH0Vg79rixxovyuM
 wQBVNM6JdgQ8FKnql730Lo4ZsIX6aMdYScZDfZ8U4erWNazQVlYmItPjq+nAdu3TY3Et
 In3cecbMcM77UeJo6cP4rvzes5TWcesrM7DrNImJca+lpFrVjleMJOVCbKHjFnKvHqQi
 Cetg==
X-Gm-Message-State: ANoB5plBAaj1/XlNzABbHtUL+qiJJXBZWBEDwpnM7blTWovUUFPd+wSX
 MeDPkNuXIlAN2dXH1QmucYCb8gYUF0VYJAX7XAo=
X-Google-Smtp-Source: AA0mqf4PKRUbif6CgUNomAtwiz3jn7Z3YoJwcbdsvCiOBKRH/bmt2dSlVK8lTZQ72Sy4tBtIjHo0ep7oKlFsqMxqhKA=
X-Received: by 2002:adf:e68a:0:b0:242:1926:7838 with SMTP id
 r10-20020adfe68a000000b0024219267838mr9824800wrm.200.1669837590039; Wed, 30
 Nov 2022 11:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20221130185303.2025810-1-l.stach@pengutronix.de>
In-Reply-To: <20221130185303.2025810-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 30 Nov 2022 20:46:17 +0100
Message-ID: <CAH9NwWcR1hxHY83UiyyR=J30CMsi=Qd=KbTmrGAuO6K+ptrwSw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: print MMU exception cause
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

Am Mi., 30. Nov. 2022 um 19:53 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> From: Christian Gmeiner <christian.gmeiner@gmail.com>
>
> The MMU tells us the fault status. While the raw register value is
> already printed, it's a bit more user friendly to translate the
> fault reasons into human readable format.
>
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> I've rewritten parts of the patch to properly cover multiple
> MMUs and squashed the reason into the existing message. Christian,
> please tell me if you are fine with having your name attached to
> this patch.
> ---

Uff.. and old patch I forgot to send an updated version - sorry for
that. I am happy to
finally see this patch with your improvements landing - thanks!

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
