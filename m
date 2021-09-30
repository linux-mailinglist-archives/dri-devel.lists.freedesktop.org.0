Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73941D609
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7AC6EB4D;
	Thu, 30 Sep 2021 09:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897976EB4D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 09:10:41 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id u32so11574026ybd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 02:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IsBi9KGM+duMUBkqLbZcKnNANUPaDvfqY+9KI++d1gQ=;
 b=eCs8Via4CKy2YwVXcomckNTjHMS2LbHGnhhhIUrXUmeml0PteHy7a4cRBaKPVrqINI
 E2WfKSnX4E1lwmOr/cBy21+Ywcxhf/RswdYplYlmHBVR1IXYU3+xQNnARoYYaaKYLCkb
 fF2lfBmdyw4bCjJWjbPrlzgCz9/iJVeMxMxPLBaA3EqFJiRLvjptj63lr4deUaTjBmGY
 w+Hzi6nlenUWP/CufXTua1ZJ4lS25CbbFALkp+KDojM+wNWu96L9N4QIOFnsu9SxW4mk
 VWZ0pvJY+HDdm39UxTJUu57GULhEnqA4Wi1ba8wfF2ttsV+gv16v3tHjmcd98aBcBf0I
 E7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IsBi9KGM+duMUBkqLbZcKnNANUPaDvfqY+9KI++d1gQ=;
 b=NGwj3IZySSXEQHoywC9X70wHZ8KMzACsOSszQ+qbHHZ9MGd7C2dqEoOKwu9Olzw/0n
 gxtFgHUxE6Ssc+oWKkL0/KNbA9yGhNtHonByGHVqC3PzFkxafJ+Ir5UAPGszra6evTt2
 FLGnBs113s3MC6xfn2WGx/I8fwL/fKPE/RcAgI87UC6/Skr0VGr8I/xNKvISRD4C32qY
 y4AjjNMs9K6z/w1lgkzq+s5jj7NMwBBQ3xcJ7cm+a14ShnseptzTcR3ulSc4aSWrRNQG
 xb9I2FVzqLwFrndiMEMLH00N6nnmdA5hUiVV8gsJyogBMacT7tLj/z/Y+AdcqIJoyCzF
 tPmg==
X-Gm-Message-State: AOAM532n40nr5xEBr+L43F022+fzDY5LnPCd1hGiT9IJ2TxzOe8pG4Xd
 AyajcaFNqD8sqYkwPHmx1trUhGxRUaQbaBkLMkVihA==
X-Google-Smtp-Source: ABdhPJzt4cFxh5ZbTDxpMDaJGksteUsAF6RSDkDU/8Z6xkGBFyiIT2RzGcenEJXmzXXIEo8AqHYUo8sS0wJEu5ManPw=
X-Received: by 2002:a5b:887:: with SMTP id e7mr5088092ybq.500.1632993040552;
 Thu, 30 Sep 2021 02:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210903130000.1590-1-contact@emersion.fr>
 <20210903130000.1590-2-contact@emersion.fr>
 <20210922114844.67ed5697@eldfell>
In-Reply-To: <20210922114844.67ed5697@eldfell>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 30 Sep 2021 10:10:29 +0100
Message-ID: <CAPj87rModxmvm80OmeD2Upmu8UyysVQ_9CNJte4iPLUxbU3=hA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/lease: allow empty leases
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Simon Ser <contact@emersion.fr>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Stone <daniels@collabora.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 Emil Velikov <emil.l.velikov@gmail.com>, Keith Packard <keithp@keithp.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On Wed, 22 Sept 2021 at 09:48, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> that is one awesome commit message! It explains everything I might have wanted
> to ask.

Yeah, what he said. An awesome explanation of a terrible problem.

My main worry is that we'd end up tripping over our own feet in either
the kernel or libdrm when GetResources got called against an
empty-lease file description, but that doesn't seem to be the case:
the worst I can see is that we'll return the list of all encoders,
which is useless but AFAIK harmless.

So this is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
