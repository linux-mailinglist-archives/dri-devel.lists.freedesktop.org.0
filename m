Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF8F2B801D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 16:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4CC6E439;
	Wed, 18 Nov 2020 15:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B8D6E434
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 15:09:34 +0000 (UTC)
Date: Wed, 18 Nov 2020 15:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605712171;
 bh=OhZtje6MYcBF8wHEb0rKms0P9u1SWzSbdyeMyfYqw+U=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=YWqN2gQbUV6c3lOVm0rQ37Dbt+eStK7x4+HzoNhFbqibyy5q8NI5zbKDeMdYE0vZw
 hhc+t8uvFl/237YvnQ7YLWVJFh0WOfdC3x/+PbjrK0qbq64kiqMvsrMr6gO8ezdyu4
 bBBQGmdb9AECx5Z6Gi0vJVLHp6jDM/YkvX5vpPykOHVNFQ3OThTcylJtoRVOsADnxZ
 M6sAN10T023kmpI6AS945A5F+z/cf9CFPZZvdedKmB0R3uaaxDpUlOBsP4NCzKVM70
 G2MC9bOqjTjR2aSFPGOWBPyc6yZ32TPpOnBCA21q/qvEgNsyBlljhMucR29MTfIJjR
 3YpRLF7AksV3w==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document drm_mode_get_connector
Message-ID: <T5AN4SYwiVlMP_M5BjzOYV5dTtcc60-0mIORLfkdPazgmXjgJ9xK7-Tt-GFtLYBanzgaxHW6I2PwgBS3yrJSwsjfDlx03cirPmCvVaTp3VE=@emersion.fr>
In-Reply-To: <CAKMK7uHLR2Rd9xOMEqURZJBvyVqO1HCe6eXzh8qKnG+9WX0FYA@mail.gmail.com>
References: <zvaqgUJLuDcSaX7hbo6wcjWOCFUkiwPThMV1D8tq7dc@cp3-web-020.plabs.ch>
 <CAKMK7uHLR2Rd9xOMEqURZJBvyVqO1HCe6eXzh8qKnG+9WX0FYA@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, November 18, 2020 4:03 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> I think this causes warnings, because now we have kerneldoc for this,
> but not for all the members. Also the member-specific stuff should be
> documented as inline comment, see
>
> https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#in-line-member-documentation-comments

Hm, right, will make sure the patch doesn't trigger warnings.

I still think the force-probe stuff shouldn't be documented in in-line
comments, because I'd never look at the in-line count_modes comment to know
whether the ioctl probes or not. Adding short in-line comments sounds fine
though.

> I also noticed that this file has a ton of wrong kerneldoc comments,
> but they seem to not cause warnings (anything starting with /** is
> fishy).
>
> Can I volunteer you for a bit more here?

Yeah, I've noticed this as well. Will have a look!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
