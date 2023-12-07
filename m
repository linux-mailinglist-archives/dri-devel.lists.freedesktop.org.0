Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E180892A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 14:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E6610E02D;
	Thu,  7 Dec 2023 13:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AB910E02D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 13:28:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4CF4ACE22A0;
 Thu,  7 Dec 2023 13:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDACC433C7;
 Thu,  7 Dec 2023 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701955717;
 bh=RjsTyYC7v5IBKKpKx0mXuVDmEieZFxuN9bGKkGb4jM4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=n0qBB1+zRYTXRTd+nu8JKgQzysDyojT1UNCv+AGdjADVO7f4owE8g+Z1bgNOjQqOr
 afyBN0nJ6aWuql1gqgxdWjOrqmlWUYNNDKbbgXa/ebY/7Z7XznAmClVs/+fHpOF7UN
 +//RTIiUyKGeaVZxPPi450UcRotQ0k1PL8L3GFKvT5d6DhWBucJs2x97eLa5qVovrl
 ZEXDoxKqv/LEpPx0umQ9Xf0wlLJ+BbrE/jq4LJEhaicI73tQIa5xVOVSEgyFHG3OcW
 jS19FJjcBBoyYvCzO5pR3LL7TM4SMneczHFDkmF9Btz55THQjQ46bIY73bhN4w+51p
 bp0Ts138eCq4A==
From: Lee Jones <lee@kernel.org>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231206174525.14960-1-rdunlap@infradead.org>
References: <20231206174525.14960-1-rdunlap@infradead.org>
Subject: Re: (subset) [PATCH v2] backlight: ili922x: drop kernel-doc for
 local macros
Message-Id: <170195571617.42042.8968185076237505378.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 13:28:36 +0000
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Dec 2023 09:45:25 -0800, Randy Dunlap wrote:
> Don't use kernel-doc notation for the local macros START_BYTE() and
> CHECK_FREQ_REG(). This prevents these kernel-doc warnings:
> 
> ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * START_BYTE(id, rs, rw)
> ili922x.c:85: warning: missing initial short description on line:
>  * START_BYTE(id, rs, rw)
> ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead
> 
> [...]

Applied, thanks!

[1/1] backlight: ili922x: drop kernel-doc for local macros
      commit: 64d9799d6dd04601227f602ae961e3f3d2f1f02b

--
Lee Jones [李琼斯]

