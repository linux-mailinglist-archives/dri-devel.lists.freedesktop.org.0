Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671B84DE63
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 11:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38CE10E0AC;
	Thu,  8 Feb 2024 10:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OV+JSx1u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B2710E0AC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 10:34:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 64F9061B57;
 Thu,  8 Feb 2024 10:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D625C433C7;
 Thu,  8 Feb 2024 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707388460;
 bh=1QpF1ZrEfgoKQLbS2UZur7gxZmwRrXLWGrUvFrm7s1M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OV+JSx1uJUlJzp7ocYy49czqFmZAXSnlas7BwM7XLVRe3aOFmoi7p5wsoparNbmBW
 BcuHVsjUn+2BRZ+AYF7AWzBJd3uG50plXaDj4PrAknuXqBBmmuKrvzYcPMgQfOgMkO
 wT9LSUV3XzFyMkfvMOFHLvRYEa+4i9MpnOGPDWz+N+u3R5wfoDTIR/m9dMoguOXNl+
 vqmqT1BPi4ysWTk4WhRjhKeBRkgk6917sT4iAKGbreepefbt5ptyjaBLukXGzaW+Pb
 mNbUPgWUtE8Cx5F1WRSneagrZiMCQd+9MzKVObiIVGGvxOsTh8PT/mJtjTlzStQgUU
 9HNQCdGjMtX/g==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Jianhua Lu <lujianhua000@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240129122829.16248-1-lujianhua000@gmail.com>
References: <20240129122829.16248-1-lujianhua000@gmail.com>
Subject: Re: (subset) [PATCH] backlight: ktz8866: Correct the check for
 of_property_read_u32
Message-Id: <170738845824.913767.15145975279890460106.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 10:34:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024 20:28:29 +0800, Jianhua Lu wrote:
> of_property_read_u32 returns 0 when success, so reverse the
> return value to get the true value.
> 
> 

Applied, thanks!

[1/1] backlight: ktz8866: Correct the check for of_property_read_u32
      commit: 7c0ff4ae24bf4589b5bb460e4b31817c61fa2bef

--
Lee Jones [李琼斯]

