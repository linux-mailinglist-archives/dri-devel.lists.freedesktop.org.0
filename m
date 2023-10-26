Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BFD7D8169
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 12:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963ED10E7CA;
	Thu, 26 Oct 2023 10:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0315F10E7B2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 10:58:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 01C70CE3EA5;
 Thu, 26 Oct 2023 10:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C5FC433C8;
 Thu, 26 Oct 2023 10:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698317931;
 bh=qIVTQTHNhRZZlLfC+qCCyQQGNef2L04EjIRQA2XPXek=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=u9Mi2P7MRpz5Yg44iZyKu/pX3dPbgL9RbSqL6WQ0GEVT5tJptVYox3g25WmtjuenF
 HCrAw+eTjhhn2h6L0YPAWbav0+OXmTh62959mAfNO2wahfixJrHpV5OGbcAqedWwHN
 NYbLpf/Xc8maDelr7Ay1nUQeZx5u4DeqwUL/Bi6/CCE1l1o+MqQ8/czqG2WhrDZxpf
 KUvSpZ5AUdUjP8/tWXDicgnuVOgA7sGSt99PWiqgFMD04L9EvP/7baP83UQanQRsq6
 6EbRBUE1U235pR9kKkCK/pKorcogWYyoDvF/uk2sBmUer2A3rbEN1Tkz9SpO8rsYbD
 dm+nTwAcWrJnA==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20231019094609.251787-1-mripard@kernel.org>
References: <20231019094609.251787-1-mripard@kernel.org>
Subject: Re: [PATCH] drm/doc: ci: Require more context for flaky tests
Message-Id: <169831792811.896759.18431283797442582804.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 12:58:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Helen Koike <helen.koike@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Oct 2023 11:46:09 +0200, Maxime Ripard wrote:
> Flaky tests can be very difficult to reproduce after the facts, which
> will make it even harder to ever fix.
> 
> Let's document the metadata we agreed on to provide more context to
> anyone trying to address these fixes.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

