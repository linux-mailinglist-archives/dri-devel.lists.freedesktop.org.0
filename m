Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47B09E1816
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA4E10E15E;
	Tue,  3 Dec 2024 09:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="F96e7EYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BF210E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 09:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733219105;
 bh=s50O+lulK1TzNU8j5dTpRdc+czxYYi1yRKYOjNonR5g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F96e7EYNHtNptT0RXkyhw7WyRcCYQYaYCCfFeuhlxKBU/s73FBf1K6CwDDHnA+VeV
 CD4napSlX5PXKDvP+M8LsQnVLmiw0yZrOTlJtWrmr8gbcw/ey2pXFJjwu/Q1nlenPI
 gutaTY8OeXEjF0f//d1SwfBwpccgVMglAZ+h3UyKiP32FY+gCiqLXfIT+6OszBpVII
 RrlfY31SEJg0BNzfv9SyVMkrSmd7KccUJ2q7FB+KiVRHD7h8RbQ2P/0kB3zlZsTKxA
 hEzBJ3+WDFCyHu9FL/hGhzo+OSkGbAfJs4mXmay3egH8wYNCfoYH+zQg1Y1UOdQaUy
 d3Jl/sX7CRalg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 92C2B17E35D3;
 Tue,  3 Dec 2024 10:45:05 +0100 (CET)
Message-ID: <1d60edf3-1977-45cd-af10-e5085518afe0@collabora.com>
Date: Tue, 3 Dec 2024 10:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/connector: Allow clearing HDMI infoframes
To: Derek Foreman <derek.foreman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: mripard@kernel.org, kernel@collabora.com, dmitry.baryshkov@linaro.org
References: <20241202181939.724011-1-derek.foreman@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202181939.724011-1-derek.foreman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 02/12/24 19:19, Derek Foreman ha scritto:
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
> With this change, we clear infoframes when they can not, or should not,
> be generated. This fixes switching to an SDR mode from an HDR one.
> 
> Fixes: f378b77227bc4 ("drm/connector: hdmi: Add Infoframes generation")
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


