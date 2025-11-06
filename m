Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD09BC3CA6C
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088E910E985;
	Thu,  6 Nov 2025 16:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZTyDg9OS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5AF10E985
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:58:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 888F36191F;
 Thu,  6 Nov 2025 16:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBFCC116C6;
 Thu,  6 Nov 2025 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762448310;
 bh=71V4FIo2y+M4KAyJTyXGLsgHH48fxpWbne7lhs/Dq3A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZTyDg9OSjzmgeEwzWEwqhSpnBgTVq4stc9rd5Z6n7W/bK50KLnuUCxpIBswNgVlXf
 S9KjsyO8ojFjY7qCyHpYvw2oYybuWL7TGvyqnImyFhGEtNsOG3MRbpBNdzHjCo8WeL
 RFwZjIzwqF4DsQoMpDUuj/WzUl7HXJdDdSNq/v16wZYwwTC/peMR2tNCmoKAQw+WCT
 zT1M+EXq1hXwGb9xvc4FGUwgsuy+TQq6air4HfPOWOK9J+yS4wTqWnpDW1UhmNp2DI
 eb4OMFTqka/AyVa/lJ2sn7AWULQrSdxGNmloPQXFaI47OciyRR8no0Njv3kzRVm8nE
 guSJcDEspmAIg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
References: <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
Subject: Re: (subset) [PATCH 1/2] leds: Drop duplicate LEDS_EXPRESSWIRE config
Message-Id: <176244830776.1960780.8531286743558641469.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 16:58:27 +0000
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

On Tue, 29 Jul 2025 19:18:29 +0200, Duje Mihanović wrote:
> While moving said config symbol out of the "if NEW_LEDS" block, I
> accidentally left a copy inside that block. Remove it.
> 
> 

Applied, thanks!

[1/2] leds: Drop duplicate LEDS_EXPRESSWIRE config
      commit: ea1c4c7e648d1ca91577071fc42fdc219521098c

--
Lee Jones [李琼斯]

