Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6639AC3CAA6
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 18:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5CD10E98C;
	Thu,  6 Nov 2025 17:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CDVjEKim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E184410E989
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 17:00:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 145AA6191C;
 Thu,  6 Nov 2025 17:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F04C116C6;
 Thu,  6 Nov 2025 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762448445;
 bh=wrgqo59yPdMKQ+qoBa8t2ahWgAq+kcaeZ6wytvG29Mg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CDVjEKimD+y61aHoCmYDX5QWMc8JR5fO97SM3VpqLixV4RVE5077KJOYoWMdLJ3Zs
 kMT11WBAQApMK5IRZ+Nnai0nz+rAJSnUAOsev17qnR9OrBUMLbxjh65Q6/ikm5k5n0
 XdA30hWHZZY65tHzbJF0+7VAJzGAowheI7mUZzFN05g5HGDD/RBqA96jfQMbxWRI8M
 5RTfZcd5oCJ2Xyi78OzZ+fPnNOZowCslC110PCoaRhmIc+bMVyBe2gODV9qhtLKtjN
 WmUeGSSJofZbYXfWtOYyxO0TuNjfn8aeoujoKUE091PMtFkuyuDkh8wHfx6f4nUqmQ
 Puz/POu6iSt6A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>, 
 Jean-Jacques Hiblot <jjhiblot@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Saravana Kannan <saravanak@google.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
In-Reply-To: <20250519-led-backlight-add-devlink-to-supplier-class-device-v6-1-845224aeb2ce@bootlin.com>
References: <20250519-led-backlight-add-devlink-to-supplier-class-device-v6-1-845224aeb2ce@bootlin.com>
Subject: Re: (subset) [PATCH v6] backlight: led-backlight: add devlink to
 supplier LEDs
Message-Id: <176244844196.1963389.1499748337381220684.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 17:00:41 +0000
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

On Mon, 19 May 2025 22:19:11 +0200, Luca Ceresoli wrote:
> led-backlight is a consumer of one or multiple LED class devices, but
> devlink is currently unable to create correct supplier-producer links when
> the supplier is a class device. It creates instead a link where the
> supplier is the parent of the expected device.
> 
> One consequence is that removal order is not correctly enforced.
> 
> [...]

Applied, thanks!

[1/1] backlight: led-backlight: add devlink to supplier LEDs
      commit: 67d8eed26eadb1edd4873d24889be26aa9b73fe5

--
Lee Jones [李琼斯]

