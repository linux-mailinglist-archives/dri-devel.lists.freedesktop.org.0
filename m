Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344872B3F66
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 10:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDC189D7C;
	Mon, 16 Nov 2020 09:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A46489D7C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:09:05 +0000 (UTC)
Date: Mon, 16 Nov 2020 09:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605517742;
 bh=XOpmtLA3FG1YGAzJZFjIARQk+2d0fPgiu9VeeIFRjRg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=axaIo0NS/A15x+KQfoo2hBLjMaH7iDv5lOrXQkchq0679GP4frWdguTYltCFIvHCB
 9gczUFxXCwQVLzDdKcNYsvP9XHjKAgGVdtyU2MkGVVZFZjMYYy1oaQ0StW5Oob/UTb
 0UVt/9TVDw+7KwlL+F4ADKON/CUsGstm+zsoqQ/+QNyAqcs1CeXnobbxhooiVxV45i
 CWz3WIuvVwMYE0fb5alRkoPioGVhFT/vcwg18jv6SFA8l/dHj2HMhN4kF2EK+YikD0
 PTebkDyDcdToTp6n2vQrnqGihZ7mFKLWGKpUiWFwQpQi1y0YQeZHmPYAVkvVasRMkR
 kd1WSbWxfZDKA==
To: Marek Szyprowski <m.szyprowski@samsung.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [v2,1/2] drm: convert drm_atomic_uapi.c to new debug helpers
Message-ID: <9Kr7KSkpWU_eo1ALXztw7ryOMnXwGVye3q_RK-hjpjRGpkdqcq_nVROg8C3OXF3jPxMMOB3XeLrSri8XG0h6IoC-5uyV2JwztiaGZK6gGqw=@emersion.fr>
In-Reply-To: <87bba2ec-b044-66c8-1fd7-4c01a9e5b791@samsung.com>
References: <FpVdsmqIh7IkH7YIwBjmp5ict1qi4NZlwHrIps@cp4-web-034.plabs.ch>
 <CGME20201116090608eucas1p128a4fa2e03380fe0cffea2f9bc2af816@eucas1p1.samsung.com>
 <87bba2ec-b044-66c8-1fd7-4c01a9e5b791@samsung.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, November 16, 2020 10:06 AM, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> This patch landed in today's linux-next as commit e3aae683e861 ("drm:
> convert drm_atomic_uapi.c to new debug helpers"). Sadly it breaks
> booting all Exynos based boards. Here is example of the panic log:

Sorry for the inconvenience, my tests didn't trigger this code-path.
I pushed a fix for this in drm-misc-next: 0003b687ee6d ("drm: fix oops
in drm_atomic_set_crtc_for_connector").
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
