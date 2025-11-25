Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA31C86B5C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 19:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B999010E44A;
	Tue, 25 Nov 2025 18:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="QrWfddZX";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="t/FnXYSe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFD210E459
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 18:54:22 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dGBgd2wjkz9tdV;
 Tue, 25 Nov 2025 19:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1764096861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FcggBhfyoYwFuVXaFI/FvU/3VIn4AeMDtsUY+2IsOQU=;
 b=QrWfddZXaN534uyBkOUWflyaKIPhwhtAvIKRXfnUU7n/Z/TllzK4mRAHa8aKgZTg0pZDw7
 n70Di1goN1Qc3KeHrpKKuT2hSbGOBbzuaab52jLl0bVY0SdcCxKkmln2X6bkUyM2gBlGO8
 Dvj2RzgU/31OCKRTSaax1O8GaPpn1uZ8r5oOSSxZqhPjfZlSKjZMqX30X5ubfSEPM8QrmH
 5WJ1+qsymM9QoRAR4XUqQbd1ys7S4IZ60tqtUF9cMAJnvm13e0c7jAGlD3yQhksbJ7JEpO
 9rbEsZFrA12YONZvNthR70VVeFy/PhQSqBK2Ck9ctVVQlyDFpRuq1ffLb0yb9g==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="t/FnXYSe";
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <eda256ac-a17c-447e-b452-f13578abbadb@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1764096859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FcggBhfyoYwFuVXaFI/FvU/3VIn4AeMDtsUY+2IsOQU=;
 b=t/FnXYSeBEs4vd3Bxzc4dTruoew54DP5BJ4YPVTDHi5DdzLJRnmbPUnx+8LuJievWEFVtN
 xfH04YlR/rg9Gk3wS3vmaoSwXvZuI9V5npQLCQQAS7CkpoxLMbklWx94jwYud0xa+zjnB1
 YrulfoTNY/9jpOp/H2PRmKbYpNHfAs1JFG8+C3lmjGNQpshkRh0G07gtnqhaPFoP8jl7aw
 nXxmbPmWYEyC2bHvvlPyy4rDqGQNZ9MBCQKbWI6wMU0196ucZ0rLlrDug4827P6nFUlDJk
 bjs4BAAUb4IqpfrMteXS4cY4rXVhFyU4x3b6M6qhygu/gzks7mW2FkepvGU4qQ==
Date: Tue, 25 Nov 2025 19:54:13 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Linus Walleij <linusw@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
 <CAD++jL=_wTX6H1uKEHRf7Ud1EKUEhTxmTRqZtUKZzergx-8knw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAD++jL=_wTX6H1uKEHRf7Ud1EKUEhTxmTRqZtUKZzergx-8knw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0bab379abbe31bf2e1f
X-MBO-RS-META: y95uumguexgbmmtmederedqsc389nhbg
X-Rspamd-Queue-Id: 4dGBgd2wjkz9tdV
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

On 11/25/25 5:13 PM, Linus Walleij wrote:

Hello everyone,

>> This fixes two regressions experienced in the MCDE and
>> R-Car DU DRM drivers after
>> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
>> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
>> caused a series of regressions in all panels that send
>> DSI commands in their .prepare() and .unprepare()
>> callbacks.
>>
>> This series make it possible to selectively bring back the
>> old behaviour with explicit semantics and implements
>> the old behaviour as modified commit tails in MCDE and
>> R-Car DU.
> 
> So what's the take on this patch series?
> 
> Maxime: is this what you had in mind? Acked-by?
> 
> Marek: do you think you have an opportunity to test this on the R-Car DU?

I'm sorry, I admittedly was happy that Tomi took over and I could focus 
on other topics. Now, I tested this series on R-Car V4H Retronix Sparrow 
Hawk board with RPi 7" Display 2 with ILI9881C controller, on current 
next-20251125 . For this series:

Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you for taking care of this and your hard work !
