Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EFBC7488A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8071210E041;
	Thu, 20 Nov 2025 14:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="apPuLH8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0334110E041
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:25:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 29F0260052;
 Thu, 20 Nov 2025 14:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA53C4CEF1;
 Thu, 20 Nov 2025 14:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763648707;
 bh=P02NKJm9d4HVc3qEBXdT7gfdA6zg3DsAH5iu97J9h5o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=apPuLH8T93/7v4CYZ97SdBZWLgQs3reOWTCTuyIG8TybXuHB1wp9HR+oPwjPHMuT+
 mEmiPvYz7pb/vU53+C8dS2jv21NUksFXGl+Ph5FB11JLtQ/LW5ckJy0GNKirzKZIhd
 rlA23V8tzpkOVd+m8Jgg5gvQoDO6rg+Zk6CJ2xy8sRZcg4djh0rKVqhdZ3ErwZitBw
 FUBRdaFl45bdwj6qLv0FuED4uf/HaOozDFqMZ5EQcxAa9enOV5Ou9sqEWP2YmhbpNs
 aFjGlTIZssx0edS49xu6TRi38r+4GP87kA3SqncKyF//bOL6OST5Rx9Fu+TE82iRSi
 LAVgCI3qAvwPw==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
In-Reply-To: <20251111060916.1995920-1-rdunlap@infradead.org>
References: <20251111060916.1995920-1-rdunlap@infradead.org>
Subject: Re: (subset) [PATCH] backlight: lp855x: fix lp855x.h kernel-doc
 warnings
Message-Id: <176364870609.729924.9672066870008477994.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 14:25:06 +0000
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

On Mon, 10 Nov 2025 22:09:16 -0800, Randy Dunlap wrote:
> Add a missing struct short description and a missing leading " *" to
> lp855x.h to avoid kernel-doc warnings:
> 
> Warning: include/linux/platform_data/lp855x.h:126 missing initial short
>  description on line:
>  * struct lp855x_platform_data
> Warning: include/linux/platform_data/lp855x.h:131 bad line:
>    Only valid when mode is PWM_BASED.
> 
> [...]

Applied, thanks!

[1/1] backlight: lp855x: fix lp855x.h kernel-doc warnings
      commit: 1704e206cb98c5e43af1483e3b07450055a31008

--
Lee Jones [李琼斯]

