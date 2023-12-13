Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF108117A7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8322710E2AA;
	Wed, 13 Dec 2023 15:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABD510E2AA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:42:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 33CD7B81D72;
 Wed, 13 Dec 2023 15:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AB6C433C9;
 Wed, 13 Dec 2023 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702482146;
 bh=GcusTtDa/xUz/eWeRnRe/jGZ7M5e05jlT9WsJ3wX1Aw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ffta2sAir1jM4m+st2G1XjKJwbMxZHgj5f/t5FIM8J+TcIpJrMm8ZOXt4C8IZbTZ0
 4/6nUIZ29UyleFKeoEJh151Bb5llzinRSD+j7HupWYTI0AUbMDl3X+25t/AeCfiAPj
 qRgrcm+QNlJaBI+gdjJ5TxOLmrGcWtiyXdzbHBVrLS2d3YhZhGOe0c3yDWjAAPGO+N
 V96sYnmzxLWgMsOkZOCKuBHivNFd8XHm/eEGh0c9dhTahunm4NCvdY35yMb/XSiKhG
 13Rb3fQ5R2FdKldI6F1mbkyCiZ/FM62m3qEwDmsjVfUh7Sar3EBewWHexBp8X3JSel
 gGGnrJxo0E0BQ==
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231207161513.3195509-2-andriy.shevchenko@linux.intel.com>
References: <20231207161513.3195509-2-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v2 1/1] backlight: hx8357: Convert to agnostic
 GPIO API
Message-Id: <170248214388.988965.2531555627636674132.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 15:42:23 +0000
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
Cc: Andy Shevchenko <andy@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Dec 2023 18:14:32 +0200, Andy Shevchenko wrote:
> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
> 
> 

Applied, thanks!

[1/1] backlight: hx8357: Convert to agnostic GPIO API
      commit: 7d84a63a39b78443d09f2b4edf7ecb1d586379b4

--
Lee Jones [李琼斯]

