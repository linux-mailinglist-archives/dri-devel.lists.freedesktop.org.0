Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0F8861355
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 14:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A23610EC14;
	Fri, 23 Feb 2024 13:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qbGKZ+kv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCA510EC14
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:52:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8918F634C1;
 Fri, 23 Feb 2024 13:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885F2C43390;
 Fri, 23 Feb 2024 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708696320;
 bh=or8i1puQGcDyy/qbuYUMEIgpfRe1YXEBx6rJkHnAbTk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qbGKZ+kvfgUjj18GvB7b3ZFSa2af5pwwgaBQdbc+QBCJrQ0dfJqp4Kjky0Jk0Wk7z
 4/A+n/96CO0dQV4IlgmKjPjTovUMjJiVjboNmK8fT37h0Un2uHizwhCZChtvETaPYm
 JezQtVKCHStRMaYvW2wK6/BSLiD7IFiTovX7qu+OLgnR6Mh61vLmkugV45/qOwJcSk
 pi1+9QRRzKNbC0xUAXvfy8Y3tkYSQebyJNipWGO4NapBjo8D8CRuB/Z/bsXXXoPNO2
 djYrygZsWddbZTa8Q0be6Eu8IBCxUK1XLEldEfYfVqn76ThP0kXueXEjhAeblKmIbm
 QIhKbo6frB63Q==
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>, 
 Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
In-Reply-To: <20240208184313.2224579-1-andriy.shevchenko@linux.intel.com>
References: <20240208184313.2224579-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [resend, PATCH v3 0/3] backlight: mp3309c: Allow to use on
 non-OF platforms
Message-Id: <170869631829.1650917.5934790597869811002.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 13:51:58 +0000
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

On Thu, 08 Feb 2024 20:42:25 +0200, Andy Shevchenko wrote:
> Allow to use driver on non-OF platforms and other cleanups.
> 
> Changelog v3:
> - rebased on top of the last changes against this driver (Lee)
> - added tags to patch 2 (Daniel, Flavio)
> 
> Changelog v2:
> - rename pm3309c_parse_dt_node() --> mp3309c_parse_fwnode() (Daniel)                                             - add tags (Daniel, Flavio)
> - new patch 2
> 
> [...]

Applied, thanks!

[1/3] backlight: mp3309c: Make use of device properties
      commit: b6fc7e62a7afc3709b31f6779665c7fc4a7755d7
[2/3] backlight: mp3309c: use dev_err_probe() instead of dev_err()
      commit: 73e209b9ef8743071e8a04aad48db6644f3c8ce0
[3/3] backlight: mp3309c: Utilise temporary variable for struct device
      commit: 2a93258e20bb03016347a2e27e5d21ead3bfd2e4

--
Lee Jones [李琼斯]

