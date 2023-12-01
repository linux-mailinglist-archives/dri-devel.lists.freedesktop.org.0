Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1528005D7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC3610E817;
	Fri,  1 Dec 2023 08:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9A110E814
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:37:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C34056209D;
 Fri,  1 Dec 2023 08:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DAFC433AD;
 Fri,  1 Dec 2023 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701419868;
 bh=bh85U6qN+NrzkHALJLdBDTWd6uulN/hrqM1AYU0gOBg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ISHSQGMzW++hzOPN4QdItD7NV5eW5IO8efyUg1rRCBw1eJvEcUYJWuj+RLY39Q2FW
 xvPRi7C1moOHe1ziCAQTJJYP/Mqfg6FQ/WRuNqMCLG9+azMHajN7vuOT9ieV/n11xh
 Fa61TXxgsQ0mWwq39/X2nyDXOYMGRh9SZpxsOiFxu5BBJj3axAaoiVHKL5CbtECmDj
 heNDpgCH4hRxz5ssaTjC9qJv7IixunS8BWgDQGuHVhv76nOmsOPnkbTT7VJ8n80+O7
 6Kuo58z2wRajfaX2ZOxA5kMdItdvAQfsXfQSq3bnXQ0mhsVZpR9M2DZ+jzEE1/p3l2
 EvsKlZKZ98kxQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231130160017.259902-2-donald.robson@imgtec.com>
References: <20231130160017.259902-1-donald.robson@imgtec.com>
 <20231130160017.259902-2-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH v2 2/5] drm/imagination: Fixed missing header
 in pvr_fw_meta
Message-Id: <170141986571.3198881.12603407007353117665.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 09:37:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, matt.coster@imgtec.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023 16:00:14 +0000, Donald Robson wrote:
> A missing header causes the compiler to warn that the function below is not
> forward declared.
> 
> >> drivers/gpu/drm/imagination/pvr_fw_meta.c:33:1: warning: no previous prototype for function 'pvr_meta_cr_read32' [-Wmissing-prototypes]
>       33 | pvr_meta_cr_read32(struct pvr_device *pvr_dev, u32 reg_addr, u32 *reg_value_out)
>          | ^
>    drivers/gpu/drm/imagination/pvr_fw_meta.c:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>       32 | int
>          | ^
>          | static
>    1 warning generated.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

