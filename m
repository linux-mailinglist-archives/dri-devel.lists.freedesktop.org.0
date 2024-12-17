Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9E89F4F4C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 16:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B4710E231;
	Tue, 17 Dec 2024 15:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FoSHTKDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774E410E231
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 15:22:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C92CD5C6037;
 Tue, 17 Dec 2024 15:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522D2C4CED3;
 Tue, 17 Dec 2024 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734448960;
 bh=4p0fQwWK3PT2nkfbpSRG13XJ5cEho/hFa4rRFg1VZ5E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FoSHTKDvT6ykhJWQDsiaLNkWkVkwM0hSg+G/qfwmz5iK9pMP1W67WmqGOU6Lj+JL2
 GHg8aKM6cs5JHdw0tAIHHguYMNC3Uu8GtmmK4ZrwkaiYL3iV/QSi8tJ7C1H6JIW44M
 r3uor1ErS8L2Skuy4cGKCqBhjdlmDhUFnozxTds242TPcvLaA1/WcQ3HVDfq/WUYiT
 Tw56fEj2ESsE+YOUCvH8ZAbW5w04l0FPrgrtVJtNqttjF5LxhwjvQ0klnfT6PpY9zS
 FHvFz/90CnXpi6YnJlPW/tMpM4c1G09ZhyHenLOJsDyz68BV+o1QVp45T+VJSbsYAY
 wW/ledNBKXSiw==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, 
 Derek Foreman <derek.foreman@collabora.com>
Cc: kernel@collabora.com, dmitry.baryshkov@linaro.org
In-Reply-To: <20241202181939.724011-1-derek.foreman@collabora.com>
References: <20241202181939.724011-1-derek.foreman@collabora.com>
Subject: Re: [PATCH] drm/connector: Allow clearing HDMI infoframes
Message-Id: <173444895813.895781.12953047517299319623.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 16:22:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Mon, 02 Dec 2024 12:19:39 -0600, Derek Foreman wrote:
> Our infoframe setting code currently lacks the ability to clear
> infoframes. For some of the infoframes, we only need to replace them,
> so if an error occurred when generating a new infoframe we would leave
> a stale frame instead of clearing the frame.
> 
> However, the Dynamic Range and Mastering (DRM) infoframe should only
> be present when displaying HDR content (ie: the HDR_OUTPUT_METADATA blob
> is set). If we can't clear infoframes, the stale DRM infoframe will
> remain and we can never set the display back to SDR mode.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

