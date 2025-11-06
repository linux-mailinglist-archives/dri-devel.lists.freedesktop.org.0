Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC452C3C9F1
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D2B10E96F;
	Thu,  6 Nov 2025 16:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LREOG0gn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5315010E96B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:56:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38EA240243;
 Thu,  6 Nov 2025 16:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2FCC19422;
 Thu,  6 Nov 2025 16:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762448190;
 bh=FuO1gz5tfoLvvbB4jOghkbbmvdkSwTkLpzNI5+ALn7I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LREOG0gnnPp2NMG5Ii8znRTg3c6awZa5Yy4/HB6k4hIvsjK6ewJ4FbPr3Shp4btjB
 eCYeCM+BEmAXoiqn+q6gvG4hUnzMbhzYi4HOahdJ340MSkhIg/ujThjzy8JgVxQ/A+
 3Ec/OJhBjXaJcXdfjknMFi9A/qbiN4eNCujx2MwtUvgm0q5gQDNeVKFSYZIkuFW7Ps
 qMw4MmPVFzdJmdZbVjI9/H0PM3YkS40hRIDcLw5sPGlXz4xV16heRQKTqeKzd/wNPj
 XlS6q2VFf7sTrh1tHgTsOu3TxW612JRU283HZny69pl1Ljp/d3H7rdEL/PnuH/PpLa
 pRvfdoZhuS5dA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
References: <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
Subject: Re: (subset) [PATCH 2/2] backlight: ktd2801: Depend on GPIOLIB
Message-Id: <176244818780.1958671.15088383749219735173.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 16:56:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Tue, 29 Jul 2025 19:18:30 +0200, Duje Mihanović wrote:
> The LEDS_EXPRESSWIRE library used by the driver requires GPIOLIB. Make
> sure this dependency is not left unsatisfied.
> 
> 

Applied, thanks!

[2/2] backlight: ktd2801: Depend on GPIOLIB
      commit: d95963e309bc1211e28051314e72638d98225614

--
Lee Jones [李琼斯]

