Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC10984E333
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 15:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286EF10E822;
	Thu,  8 Feb 2024 14:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fys1Wb9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B2B10E823
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 14:31:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0855D61E04;
 Thu,  8 Feb 2024 14:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB73C433F1;
 Thu,  8 Feb 2024 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707402659;
 bh=ak9JMX8tijlCPP56ze53dnYiQcO/R64y/Q97h9/U+Nk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fys1Wb9+k3KI+hyqCXMqcMkJ3Qq6guby6WgO1DmWUzTIsqu2M7b61wlVZt5UHyIHU
 21wP0jNDw8aZ3YIeNqFOxvSLWJRuzo2nU0dB++pF5H1WDyjzQFlgexhPWZLP3MVG02
 LDUoFlCeKiLGKv07ru/VT7kVMYPcXa399hgCZdKr2nwl71OMKwUVJ9DYNeWXcmujFP
 MRwSoTmikxoCzoVq1YdXwLdI2Z9T5u8m+Kv61xyQ32isBC23eB+r7UEulvheduvBtr
 /X4yTWKNl0aLQpezfprwjZnbjT2pkhX2YZ1O1dEreCnp9Prm28KG5AQ2aepiM8iYUM
 cfj3mJC4FjEwA==
From: Lee Jones <lee@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
In-Reply-To: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF
 platforms
Message-Id: <170740265768.1071907.16480464735034223971.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 14:30:57 +0000
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

On Thu, 01 Feb 2024 17:14:12 +0200, Andy Shevchenko wrote:
> Allow to use driver on non-OF platforms and other cleanups.
> 
> Changelog v2:
> - rename pm3309c_parse_dt_node() --> mp3309c_parse_fwnode() (Daniel)
> - add tags (Daniel, Flavio)
> - new patch 2
> 
> [...]

Applied, thanks!

[1/3] backlight: mp3309c: Make use of device properties
      commit: e531c279ddee738260a94b2121836549ea167f63
[2/3] backlight: mp3309c: use dev_err_probe() instead of dev_err()
      commit: d991269f64928051c895151a8589dce806a92d9e
[3/3] backlight: mp3309c: Utilise temporary variable for struct device
      (no commit info)

--
Lee Jones [李琼斯]

