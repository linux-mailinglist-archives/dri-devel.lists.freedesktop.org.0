Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FF9BBD2D7
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 09:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E937210E30A;
	Mon,  6 Oct 2025 07:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 469 seconds by postgrey-1.36 at gabe;
 Sun, 05 Oct 2025 21:38:55 UTC
Received: from mail.treewalker.org (mail.treewalker.org [78.47.88.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9087210E2BB
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 21:38:55 +0000 (UTC)
Received: from hyperion.localnet (unknown
 [IPv6:2a10:3781:5345:1:a81:e1dc:2665:ea0c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.treewalker.org (Postfix) with ESMTPSA id 8EB611FDC2;
 Sun,  5 Oct 2025 23:31:04 +0200 (CEST)
From: Maarten ter Huurne <maarten@treewalker.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 John Hubbard <jhubbard@nvidia.com>
Cc: Dave Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.18-rc1
Date: Sun, 05 Oct 2025 23:31:03 +0200
Message-ID: <3771775.lGaqSPkdTl@hyperion>
In-Reply-To: <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
 <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Mon, 06 Oct 2025 07:04:43 +0000
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

On Saturday 4 October 2025 03:53:34 CEST John Hubbard wrote:

> The main complaint with rustfmt is that it is extremely twitchy and
> unstable with respect to one-line, vs. multi-line output.
> 
> *Especially* with "use" statements.

The Black and Ruff formatting tools for Python use a "magic comma" rule 
that works well in practice: if the last item has a trailing comma, the 
items are guaranteed to be formatted multi-line, while if there is no 
trailing comma, single-line formatting is attempted.

I couldn't find documentation of the feature itself, but there is a 
settings flag to turn it off that contains an example:

https://docs.astral.sh/ruff/settings/#format_skip-magic-trailing-comma

Bye,
		Maarten



