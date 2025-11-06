Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D97C3C9E8
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2877010E966;
	Thu,  6 Nov 2025 16:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KRiTQyzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED1510E966
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:56:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A658043680;
 Thu,  6 Nov 2025 16:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F67DC19421;
 Thu,  6 Nov 2025 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762448187;
 bh=g8hhqYAlLRPy0OO8aW+VM4dqaefjEpSWoUgU+32L+Ko=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KRiTQyzoeXHPV3ZgoIDaRR/5bkTrDMu3LXTDeswLnqvUsIHubMVgJzxY0pDXgcR1W
 jx8PIe5ieZxbb3ENAIXYmzy0SdbYd7xFQCmgd3atLpTlNQP5dFpMjfN+HWaLIjtEax
 X/GDQgi/C5D/1xgqSarpTSKrdOYdeQ2hCd81CN1aqKfoEithXlnK+Y6bZICIZiJHC+
 7nv4SuTGY1vzUkq/lidwnF6vvvxgbpb/PusDqFuvU/BO8gd43XtKja4CFV+mdzLINr
 ebPTgu1fkZcd4BTOhnMmWNnpChNlBV35POmfYzfEQOWWDHLxM3DBOdcIvlYfRI671A
 jpUjSaBY9pKqg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
Subject: Re: [PATCH 0/2] ExpressWire dependency fixes
Message-Id: <176244818496.1958671.2173337292589676568.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 16:56:24 +0000
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

On Tue, 29 Jul 2025 19:18:28 +0200, Duje Mihanović wrote:
> This tiny series fixes two dependency issues with the ExpressWire
> library and the KTD2801 backlight driver. Thanks to Randy for reporting
> these.
> 
> 

Applied, thanks!

[1/2] leds: Drop duplicate LEDS_EXPRESSWIRE config
      (no commit info)
[2/2] backlight: ktd2801: Depend on GPIOLIB
      commit: d95963e309bc1211e28051314e72638d98225614

--
Lee Jones [李琼斯]

