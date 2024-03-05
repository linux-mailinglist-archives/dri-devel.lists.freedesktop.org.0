Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E863871A28
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A26C1129C1;
	Tue,  5 Mar 2024 10:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IjDnJHzI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888621129C8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 10:04:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 99BA7CE192D;
 Tue,  5 Mar 2024 10:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77714C433F1;
 Tue,  5 Mar 2024 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709633067;
 bh=8W2qw1WVmAoRpkjb/Rl0uY6LpoazYFR3M96IUv9XMAs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IjDnJHzIKlI5pTTxw9ouETpa8Qru8SG6F+ONURQ03blCAJrme1qkftj3wylFthZH8
 IQtZsB3GyU1YvZXM7MnEKATyR6GkpNtb9zz04jYsp39xO6LlFG2oT9CyCJESRg+YtX
 /jsJgNg4hbKmLMA1rd9/LkVYTOhgOhThPJHoOrOk8DaIVUViDG78DAulvTL0c1a/Dt
 B7WJoK2+uwQV8dDx57HpbDjXkhDHcDlYQuUuN1fTuS1Uuo0GCPQrg0wzqVqNLbsOio
 3E6UZEpuH9cTBtbo0duncn9k2ha82s+Sgiy/4aMm87SVnGsJPC9PKKVmwIVO8QK1ei
 zXlP8baeG+jTg==
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
Subject: Re: [PATCH v2 0/7] backlight: Simplify probe in few drivers
Message-Id: <170963306625.66390.18051034360544296280.b4-ty@kernel.org>
Date: Tue, 05 Mar 2024 10:04:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Tue, 05 Mar 2024 09:11:55 +0100, Krzysztof Kozlowski wrote:
> Simplify old code in few backlight drivers.
> 
> Changes in v2
> =============
> 1. Patch #1: Drop "Error :" msg.
> 2. Add Rb tags.
> Link to v1: https://lore.kernel.org/r/20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org
> 
> [...]

Applied, thanks!

[1/7] backlight: gpio: Simplify with dev_err_probe()
      commit: 2f5929cd930b24a88d6fa73ab08ba857c59f7686
[2/7] backlight: l4f00242t03: Simplify with dev_err_probe()
      commit: d3de24fc13465a4b45047d193f729b73e062a881
[3/7] backlight: bd6107: Handle deferred probe
      commit: e00b57b4d4464071cb18d03cc8040e103c662d80
[4/7] backlight: as3711_bl: Handle deferred probe
      commit: fd9f81bc3f48d5064bfd894eeb0202f5825ea4b1
[5/7] backlight: lm3630a_bl: Handle deferred probe
      commit: c7fa2f12e74a437fc8c77b7780131b13acc2fa49
[6/7] backlight: lm3630a_bl: Simplify probe return on gpio request error
      commit: dedd6eb26bbb37139d0a0122e4b4ad94f06edaa1
[7/7] backlight: pandora_bl: Drop unneeded ENOMEM error message
      commit: 07dbc9e6e2433fe312423096efc037bf47298ed1

--
Lee Jones [李琼斯]

