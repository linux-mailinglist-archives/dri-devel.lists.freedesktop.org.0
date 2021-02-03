Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9032B30D635
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 10:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2FC6EA24;
	Wed,  3 Feb 2021 09:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94ABF6EA24
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 09:24:40 +0000 (UTC)
Date: Wed, 03 Feb 2021 09:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612344278;
 bh=+CRe2Y9hntyqXAxFNYVyv7L57pdZqy+txrs6GWAC4d0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=CccOBdyCCQKaxN8C/m9H0HiY9Ho0t5ayHF9OBDxYhYkxoJ8OWUY7ixG6DR2UHvR5p
 FyTYbdA8l6Xm1rc2dqTt2W6rdFhYrL4UaTC2QITD4NoS/1Hn3hQW4VzysZ2L13u+bG
 NUY7I0MLY9GMymK/QZE7ZAxOELkjrR9XtQx2g0OGw1eIkMPQpPZ4EMT7AfKVgO1BZL
 D+ojpzTduSdxUH7dRCoDCwZe9XkB3emrh77crKV4JSA9KY833umx+CBv+9/Cdkz2sc
 OTAalghev/3+LhU6QfB84DQpSF7/9oigkjVXSLUX69vXVaGy6zEcfUPrmLlqCYu2CR
 NmtWQlpawJotw==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
Message-ID: <KZZVYm0Qza351oOJ53ZX0pUcEa6NRh2sJJiq5OR2IjRlmJsdCZXRusR3ZuiiL5dqUgpR_STva8ySdYIJAUnSHVkU5HnNLzC68pNSEcuYdcA=@emersion.fr>
In-Reply-To: <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
 <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
 <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, February 3rd, 2021 at 1:56 AM, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> As summed in the commit message the burden is only applicable when all
> of the following are set:
>  - non-linux
>  - force DRM_FOURCC_STANDALONE
>  - c99 -pedantic
>
> Even then, we're talking about a compilation warning. So yeah - let's
> keep things short and sweet.

Sorry, I don't think this is acceptable. Regardless of your personal
preference some projects have -Werror -pendantic, and we shouldn't make
them fail the build because of a libdrm header.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
