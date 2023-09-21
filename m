Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D377A951F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35D210E5AF;
	Thu, 21 Sep 2023 14:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CC210E137
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 14:15:27 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1695305724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Kdi0A6/rK+Ep3LvvFNYZbipzuoG5coyIRlqyQNpvFw=;
 b=zZ09UGsxiVnj6qUWu3BqMx/BP0ztYTTRcJ0m51WB+0V2fRbpQnzf1+upXvadozQWuaKC3s
 MD81JkwThCeZtSDZk9lCUqdmwoBlEU67CBd/fJJbqrWtiNNZF7v5wcJWUyG5CVQsYFu3+F
 jl8agq3MawwwVtMaOtR/zbBabFryFWwxf/6btI3e9iHjA/I4QWtL+6oT9UUjjovL7jydEY
 09+zsF9Bhc+bp4W24EZ4NTdePFF7yy6OkPflvIZDipQqym3vNaNVB90yjpYpZ0aF8R4QnV
 dVmteKjilYTCyi1UJ/HScc8uxZ91CSL0uIQxPBGOr9gJMuu6OkCxoWz2EJkK0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1695305724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Kdi0A6/rK+Ep3LvvFNYZbipzuoG5coyIRlqyQNpvFw=;
 b=7XsQ//Jju63rVjCThepadMrVHbUDSt+N5TqNtqbzpoUWy5NGMX52VrxG3zpKa5EnSYtMhE
 w68339nCORhdGzBg==
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] drm/amd/display: Remove migrate-disable and move memory
 allocation.
Date: Thu, 21 Sep 2023 16:15:11 +0200
Message-Id: <20230921141516.520471-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I stumbled uppon the amdgpu driver via a bugzilla report. The actual fix
is #4 + #5 and the rest was made while looking at the code.

Sebastian


