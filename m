Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A268B9E1B
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 18:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FED112550;
	Thu,  2 May 2024 16:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="icQpYnrA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5CE112550
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 16:03:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 267DACE175D;
 Thu,  2 May 2024 16:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA13C32789;
 Thu,  2 May 2024 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714665784;
 bh=ow1KC9SnQMQ7MKL0NI/nMglq9JDo0cCau3G6e2MnlDs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=icQpYnrAZKg4/VonjJUS6w8mwh2OFRmpACcphL5nNVygT69ke9ZrvMwtH7ts4JBbT
 6EpxSiEsaNTDm8oGeEb16K7GRXJ4OPRNFGT3HKFe8Vr30x4YqTkecTjJYVhahirODG
 EVx9sElJcoxiqBgwX8EV5WHRVPR5HIPJGsltLzefVOYjjBjIckfxPIjbZ6B88qrqJB
 GQXGqByFqefiYFL09bxi3bTkOMqSa9H9/Vll7kMUYnrWmceuy/DDELIuetkJ6IFfTM
 pF71PfC47S8+ENSECGkWkXobGKlp+/ENlIiUZp8jpdtOpmEcI+3/0/rslpBCT15oCe
 Vl8m5wLSqCzhA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240426135602.2500125-1-masahiroy@kernel.org>
References: <20240426135602.2500125-1-masahiroy@kernel.org>
Subject: Re: [PATCH v2] drm: move DRM-related CONFIG options into DRM submenu
Message-Id: <171466578189.2253884.109722255099962126.b4-ty@kernel.org>
Date: Thu, 02 May 2024 18:03:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Fri, 26 Apr 2024 22:56:02 +0900, Masahiro Yamada wrote:
> When you create a submenu using the 'menu' syntax, there is no
> ambiguity about its end because the code between 'menu' and 'endmenu'
> becomes the submenu.
> 
> In contrast, 'menuconfig' does not have the corresponding end marker.
> Instead, the end of the submenu is inferred from symbol dependencies.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next-fixes).

Thanks!
Maxime

