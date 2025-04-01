Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC6FA7769D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AE410E2F1;
	Tue,  1 Apr 2025 08:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.b="SjWDIs9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B381410E512
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:40:14 +0000 (UTC)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
 t=1743496810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70J3qbqUkhpGfcXlW2ynPrpc/c8CjZPQmWcMnQ7zHgc=;
 b=SjWDIs9N+nxAtJw5mMhsl6F0LJ9DBEVxQ2zXCX+TwQTUnNH9sq/DvmXxBW7d5kM7GEvUg5
 o2D9ah2UfPkm/pCmqQqemJvyoe/lsKVnvn7ve5c2SNs0lyFf18apuYNN5WXz6YBo8UnkBE
 qq/f5dV/d9MU9ILlm9SFmd3GHRWqu4E=
To: ville.syrjala@linux.intel.com
Cc: arefev@swemel.ru, deller@gmx.de, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 tzimmermann@suse.de
Subject: Re: [PATCH 1/1] fbdev: atyfb: Fix buffer overflow
Date: Tue,  1 Apr 2025 11:40:10 +0300
Message-ID: <20250401084010.5886-1-arefev@swemel.ru>
In-Reply-To: <Z-rzIfUMmOq1UZY1@intel.com>
References: <Z-rzIfUMmOq1UZY1@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Ville. Hi Jani.
Thank you for your answers.

One small question. 
This chip (3D RAGE LT (Mach64 LG)) is very old it is 25 or 
maybe 30 years old, why is it not removed from the core?

Regards Denis.
