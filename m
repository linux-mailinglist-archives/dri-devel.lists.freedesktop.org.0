Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA354886060
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 19:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F9810F70D;
	Thu, 21 Mar 2024 18:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gXgctHp8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB91410F70D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 18:14:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3EA58CE13C4;
 Thu, 21 Mar 2024 18:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD4DC433F1;
 Thu, 21 Mar 2024 18:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711044842;
 bh=XUlN3uXoacGlQBJNEV343fyloPlUcDzqZL5AIHjXbco=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gXgctHp8kphN9fq2pXjJI2fDGR1kFRn1bGLZ1eU/Rj7LyeHn7k4kQGIVaOZ2OoJ3S
 g18Xf5PB7CLUvvToJ8f8M8Xv7+dvp1hLwAngdLcDAGrGrWw0Bs5ZVTmqd1ufcgwBTh
 0kA+RCWGZrbkwEeRDyIkseVYk8WIOBJmjMvUmc9yDSJCpCTAetCbQ9IXORFnv+1xCf
 Z6NbUqy1IWQTJg+Uc1/ZlbbEzVEP4pLSsohohT+r/lDz9Tbzbkg2BZocbPY7WI1Fgh
 Nj5flbZND0cHPRKHr6KvIY2qzZSbqRkj9JDMqiYFu1/xvy8AhiAZpULnx78Lnj2Pa+
 omVb1Ic+a3FVQ==
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
References: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
Subject: Re: (subset) [PATCH] backlight: mp3309c: fix signedness bug in
 mp3309c_parse_fwnode()
Message-Id: <171104484009.147635.12745541732945934686.b4-ty@kernel.org>
Date: Thu, 21 Mar 2024 18:14:00 +0000
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

On Sat, 16 Mar 2024 12:45:27 +0300, Dan Carpenter wrote:
> The "num_levels" variable is used to store error codes from
> device_property_count_u32() so it needs to be signed.  This doesn't
> cause an issue at runtime because devm_kcalloc() won't allocate negative
> sizes.  However, it's still worth fixing.
> 
> 

Applied, thanks!

[1/1] backlight: mp3309c: fix signedness bug in mp3309c_parse_fwnode()
      commit: 84a053e072c8aacff8074ac5d6f7a4e7ff745209

--
Lee Jones [李琼斯]

