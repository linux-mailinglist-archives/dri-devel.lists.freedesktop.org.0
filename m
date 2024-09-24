Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F1984779
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 16:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A4410E705;
	Tue, 24 Sep 2024 14:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="akDQbk2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F2710E705
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 14:17:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C9360A425E7;
 Tue, 24 Sep 2024 14:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8D0C4CEC4;
 Tue, 24 Sep 2024 14:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727187475;
 bh=vBpZMPQ9rsXhtFubNr31yUMNqsCHeYd7iWTspMzanFY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=akDQbk2LK7KbJFECMGV3gptY7Spz+NyihBjXTscYNXR0ZDGHLF9Hw3rN9ACFyV85u
 GDIwWOIAIcqoAFtzC44WJtW51ulknFrYxpq6FoUvOWsclSC+ESROlk+7QrCMgbnQsY
 eYDwycxGzdnbO5frLY9q8b8ASW2Tr2al2rRBTSPZtsWGFFG5XxBkM5BsKTiBBw2UZL
 fVNu5oCKclOJe1CHBBpjQNlVrN2bzBgideQbiDkEJDpOKoPiTg7s8H0K+sUG7zuwDq
 rbnO1V4xD/Jakfo4i9iMgpN4h8hSKuwAeegrdW7qAxHSM8ngP7BcvYn9m6LI7zTfNN
 QAWV44HJHMgmw==
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-Id: <172718747303.94652.4109324297463223522.b4-ty@kernel.org>
Date: Tue, 24 Sep 2024 16:17:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Mon, 27 May 2024 15:34:48 +0200, Geert Uytterhoeven wrote:
> Add support for the drm_panic module, which displays a message on
> the screen when a kernel panic occurs.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

