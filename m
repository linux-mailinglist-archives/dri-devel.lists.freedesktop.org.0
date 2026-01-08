Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40ED0255E
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 12:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C39710E6F5;
	Thu,  8 Jan 2026 11:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FKlzWtGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FBF10E6EE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 11:15:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E868643E16;
 Thu,  8 Jan 2026 11:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A89C116C6;
 Thu,  8 Jan 2026 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767870958;
 bh=Be99HMovMR5LQotLB1NQZpI+sg7SVag9SyAOUDgqdX0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FKlzWtGkLuwrSAINoC4zB+EmGtmPQu6pgqHGbAEgtQHLNv8yDzMiKG5BbBun6qYty
 CzAiAVfUtDc6WbM8+CTm59A6dw9amv3UFdLnNiFY/Rb5fMMQnlA7j6PU7z3dsCn8VA
 2hZLZHYbutwNcy2WiKQkTi/4K7r2IDelpL6DJ+o8O/uRfZRDEMmmklu9EozsPh43IJ
 F1ziB+yBQC4UN2gwqCOmzluBPyutORqZkp3Xl3RNCM44j3zh2zPnDeRSG4giL0LgCE
 0jHOAhovcXF2Y2cJLirMuOGTKUocUDOcNtyVxQzjDjd4EU6V5pSKhzZkhqcW9bBH7D
 67S4V4LsZZvrw==
From: Lee Jones <lee@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>, Petri Karhula <petri.karhula@novatron.fi>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20251205-cgbc-backlight-v6-1-e4175b0bf406@novatron.fi>
References: <20251205-cgbc-backlight-v6-1-e4175b0bf406@novatron.fi>
Subject: Re: (subset) [PATCH v6 1/2] backlight: Add Congatec Board
 Controller (CGBC) backlight support
Message-Id: <176787095661.872999.6388109153430100607.b4-ty@kernel.org>
Date: Thu, 08 Jan 2026 11:15:56 +0000
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

On Fri, 05 Dec 2025 12:19:47 +0000, Petri Karhula wrote:
> This driver provides backlight brightness control through the Linux
> backlight subsystem. It communicates with the board controller to
> adjust LCD backlight using PWM signals. Communication is done
> through Congatec Board Controller core driver.
> 
> 

Applied, thanks!

[1/2] backlight: Add Congatec Board Controller (CGBC) backlight support
      commit: b516456e9f916070fde6aa50cad5680a689687e6

--
Lee Jones [李琼斯]

