Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F36C8F608
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 16:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F039310E82A;
	Thu, 27 Nov 2025 15:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fgOslIUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE2E10E833
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 15:55:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C4A1741A66;
 Thu, 27 Nov 2025 15:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0779BC4CEF8;
 Thu, 27 Nov 2025 15:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764258945;
 bh=79PrYF2iuQAc+y+8JIgjRAAux2ndHI3wVSQ8aGdIWUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fgOslIUYs0AZCw799d0aeqrZbiD6pyAm2YhoR41il0xyM0tYRo3WJHXWyGRtIBJQ+
 Mj2WRqmbidrW/SmRYUA9oszt1rhc3PpLV4sb2QLce9rW7YxoE9poMD+IPzmJc+D0NB
 vjbCZZaBQnXVqf37MUNMvjUKWeDJqWwNgMO/2EO/zNTKh7nyzAhQREOCf6Cg0dfRxL
 zf8aO+LF+JWRb0kc8Nnf2tQz995m3fPsu1ahIbgGXG+AlstG8n/0/taPt2VHmCYa0O
 +xw/cRiT6fmJ73kFT2DLLpA6UQ/8vARTrvBcLMRc3gDoR/jU0CrNtA4bauMwhOpyZl
 25U6f1cncmO0g==
Date: Thu, 27 Nov 2025 15:55:41 +0000
From: Daniel Thompson <danielt@kernel.org>
To: petri.karhula@novatron.fi
Cc: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4 1/2] backlight: Add Congatec Board Controller (CGBC)
 backlight support
Message-ID: <aSh0ffjtRlow2WO-@aspen.lan>
References: <20251127-cgbc-backlight-v4-0-626523b7173d@novatron.fi>
 <20251127-cgbc-backlight-v4-1-626523b7173d@novatron.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127-cgbc-backlight-v4-1-626523b7173d@novatron.fi>
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

On Thu, Nov 27, 2025 at 03:21:59PM +0000, Petri Karhula via B4 Relay wrote:
> From: Petri Karhula <petri.karhula@novatron.fi>
>
> This driver provides backlight brightness control through the Linux
> backlight subsystem. It communicates with the board controller to
> adjust LCD backlight using PWM signals. Communication is done
> through Congatec Board Controller core driver.
>
> Signed-off-by: Petri Karhula <petri.karhula@novatron.fi>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
