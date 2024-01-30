Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3F842D96
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 21:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621D113541;
	Tue, 30 Jan 2024 20:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3D7113540
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 20:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E576B41A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1706645895; bh=9KysNAjR2JJqZckLeN84dmIjHnc6rN2+vXgE45980uU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=g/karfMalEzLnFfjmYg+HXbUBUv2mpeqvy66J883uo9ZS4xhTNI19ANDbgGhXNt4E
 qyyje5/F3tftwwKw67XZXbIXuJIixYSm+yAuxgR7ETaeNkun9o1xR//ewH6RJk6pMf
 nHqNHB5h5fdWDVRQcI8c4dBwviuXjkJI+0+c7ByB0RRUTY1at7XhEqXweYVU0hn0uR
 HR8ikFK2kmUIu2GuN8NVf6TKHXeJRJ5ZRPHJrY2QZaJZMcm0cdiVB2O6KoxuJaxn8K
 CG5qwT3CD9I5CWpS6RsFHPPbYKw2B30GNXIxtojAO3XIbw5JAcKgMSF5P/J0ufiohm
 pjp3598pgy8Hg==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id E576B41A47;
 Tue, 30 Jan 2024 20:18:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kernel-doc: document object-like preprocessor macros
In-Reply-To: <20240109140345.3344094-1-daniel.vetter@ffwll.ch>
References: <20240109140345.3344094-1-daniel.vetter@ffwll.ch>
Date: Tue, 30 Jan 2024 13:18:14 -0700
Message-ID: <87il3abmnt.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-doc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> I had no idea this exists, but Randy pointed out it's been added quite
> a long time ago in cbb4d3e6510b ("scripts/kernel-doc: handle
> object-like macros"). Definitely way before I started to write all the
> drm docs sadly, so there's a few things where I skipped writing
> kernel-doc since I didn't know it was possible.
>
> Fix this asap by documenting the two possible kernel-doc flavours for
> preprocessor definitions.
>
> References: https://lore.kernel.org/dri-devel/dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org/
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/doc-guide/kernel-doc.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Applied, thanks.

jon
