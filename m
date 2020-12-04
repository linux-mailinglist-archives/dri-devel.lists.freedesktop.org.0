Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99142CEA45
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7592D6E139;
	Fri,  4 Dec 2020 08:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D565C6E139
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 08:53:38 +0000 (UTC)
Date: Fri, 04 Dec 2020 08:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607072016;
 bh=mJf4cIgQmqKdvH7aMIlrcgYR5DwsLltw/FDe1W8yzi8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=J8BNK/cjDm8Qes1h8OFO2qQ7A2QmYEtQg4EhtMyAQklCw4hgUbewluwxEC8w8Ps8o
 uEwnFrBsMjjQqIIEFW0FnntPoiCTe3BbWWHISjzhCJ5FMrgv31du1xrVq4mrlOBwB9
 U5d3V0lCFjjSsIvA9QOPDzCAqF16I6WYTGCpZxwH9nbr6ACHyWnqkTt8sm2JgHQO5P
 F5lTCpJecsDEynrHDpTYudZMe7qpOXNagYG4euOv8q2dZ9fEzh9u58jIqd5GQfOdIo
 CyiwZCSorqWRW5n+iF4pzLglCUIsaB+QpALJLk51tQlAXy37lLPMJM5zMT4n6qvYni
 dkGpRo0ykHurA==
To: James Park <jpark37@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Allow drm_fourcc.h without including drm.h
Message-ID: <kg-gEiynWjY827eEdQ93-QfPdC-z3Odes93NaWXaEts4z4kNu8I5xffAec3LDWfjN5_iUGYrL2ZOP8t597Y8pkEKdxgmC0c8OGzGHuTAgPM=@emersion.fr>
In-Reply-To: <1607057617-145-2-git-send-email-jpark37@lagfreegames.com>
References: <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <1607057617-145-1-git-send-email-jpark37@lagfreegames.com>
 <1607057617-145-2-git-send-email-jpark37@lagfreegames.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, December 4, 2020 5:53 AM, James Park <jpark37@lagfreegames.com> wrote:

> +#ifdef DRM_FOURCC_STANDALONE
> +#include <stdint.h>
>
> +typedef uint32_t __u32;
> +typedef uint64_t __u64;
> +#else
> #include "drm.h"
> +#endif

C11 allows duplicate typedefs, but older versions of the standard
don't AFAIK. If this is a concern, a solution would be to guard the
typedefs.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
