Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7DFA952CD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 16:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FC810E0DE;
	Mon, 21 Apr 2025 14:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECCB10E0DE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 14:30:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745245843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qsv9H0ash+njBouLPA0/pRo+0GrFRby9AbDJsN0GOKE=;
 b=PVB98+6oxX50Q9XW+Za3dp/6aoF6QIsk+GkQG+RhwgAuqCO/PRha/bOC32n/j4OBZ2Vp5l
 fj5ukLpZ9H+rapRiCP5KjSosPe2nVRabrAJJSHJwKEIXCN4UK+uS8J+ghdAdvV4jg9S4e2
 CxoRLNJNJm/OrHZWBTn0zEdDROUIwv06M8rN+lHSNNb0uwvhL9qM3lLyrKX3o/ryPZFwWT
 8FT3DAjMxF7MrDxL8cFiXiDx1lrHCr8ZN9RnZsDc4eNxY6heu9v5jy6Yg7lMS8gof37QZ2
 MzD1LcaBxhJid07mg0m6tHJLgIqQEKNj2tEMr3UFqGv1DiXsGU/ioB/KoLyOHA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Petr Mladek <pmladek@suse.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>, 
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com, 
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com, 
 Aditya Garg <gargaditya08@live.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>, 
 Asahi Linux Mailing List <asahi@lists.linux.dev>
In-Reply-To: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Message-Id: <174524583908.462870.16724111514713149267.b4-ty@rosenzweig.io>
Date: Mon, 21 Apr 2025 10:30:39 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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


On Tue, 08 Apr 2025 12:17:13 +0530, Aditya Garg wrote:
> The vsprint patch was originally being sent as a seperate patch [1], and
> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> them via DRM.
> 
> v2:
> Remove printf tests, will merge later through Kees' tree
> 
> [...]

Applied, thanks!

[1/3] lib/vsprintf: Add support for generic FourCCs by extending %p4cc
      commit: 1938479b2720ebc05aab349c7dc0a53921ff7c87
[2/3] printf: add tests for generic FourCCs
      commit: 403ff8fd2dbf5066128af4d1fde76c35a800369d
[3/3] drm/appletbdrm: use %p4cl instead of %p4cc
      commit: a49ce9cc85a82d5c5d65186f5a8fda0ebfcff571

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

