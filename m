Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C097BA5F826
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EA610E8B8;
	Thu, 13 Mar 2025 14:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="AfWHpHnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76EA10E8BA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:30:03 +0000 (UTC)
Date: Thu, 13 Mar 2025 10:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741876201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QO0UPfQQymXHeypC5X6LCSQpNz+vVL9uYM6sc2XnAqk=;
 b=AfWHpHnMiCbbj/ZAw5DMFsA65UmLlBmEiN1FW5lL7XwaAsrXmjIsJejDSEnU0GmrquJ4FC
 wYfGhpFUCFdlmP59JRXCIUFmG6CKzgM2zMmOelOSClc+TquVXAy8dh2THLxRLheAr4vYa8
 n11f98diUkhdvseID3pZpsloOj/YiNR8S6x+bYF7gET4fpHl8DOwdBTT9XOJI4F0S71hQy
 hVtse0BcplVegVGgj9WqWcBKPLWIoG+5A3IKElNY5Ffa0bqTXawcPEq26SbviK0WK0xITU
 Lx1SoPKDu0J0dwRwCEGsdrtm/2JsuDE77O+GZ9m2NXVlAMbI0Y9DMN8+fTI2DQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Aditya Garg <gargaditya08@live.com>
Cc: Petr Mladek <pmladek@suse.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v2 0/2] Use proper printk format in appletbdrm
Message-ID: <Z9Lr39wuJc80Cnsb@blossom>
References: <F61E0F31-980B-4855-9AA8-D594BEEFEC6F@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F61E0F31-980B-4855-9AA8-D594BEEFEC6F@live.com>
X-Migadu-Flow: FLOW_OUT
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

series looks ok to me. Who is pushing this to drm-misc-next? (I can if
nobody else does)
