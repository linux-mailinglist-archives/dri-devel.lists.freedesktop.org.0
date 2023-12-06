Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FDF80708F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15B910E051;
	Wed,  6 Dec 2023 13:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A1B10E051
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:10:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 32119CE1817;
 Wed,  6 Dec 2023 13:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DE6C433C8;
 Wed,  6 Dec 2023 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701868217;
 bh=jIbKL5LRHGYHKC85M/i5/2RcS7LR3FeKW1eEn/Ul9/c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=P8LuolL+HT/EAp6zuZi0qpIGPEZaLt8V3lxRCn6ixgDsBoSYvHr5AVFnu2fDK24o5
 rvCWRWPNavbIlVctQOw8Q2OE3GCoM5CQnw7P6R2ahEy3d3m/cZCzy0NPaP3HTNXs/y
 NvYiJEgmwJ7F53fQxWePruKP7BEyg+V6wPeb5NWTh04wANouDTW/sK1Pny3P3jZ4Ww
 +vMeOEDXMhr/thS+/OSkOA8APUlSuoFethnyORthETEMKrCriL0XY6XWTf1EsVu2gU
 LLbIydvT1dTRq84LrQVBhbQaMnG5KxVdkADzeEVygwFI7CP1adtTjMp5vlL/PuhJ4X
 Md1WuGTAn7WLA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231204151337.60930-1-donald.robson@imgtec.com>
References: <20231204151337.60930-1-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH v2] drm/imagination: Removed unused functions
 in pvr_fw_trace
Message-Id: <170186821499.357447.5969662518847238769.b4-ty@kernel.org>
Date: Wed, 06 Dec 2023 14:10:14 +0100
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
Cc: tzimmermann@suse.de, matt.coster@imgtec.com,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 Dec 2023 15:13:37 +0000, Donald Robson wrote:
> Fixing the warning below due to an unused file level vtable. Removing
> only this causes additional warnings for the now unused functions, so
> I've removed those too.
> 
> >> drivers/gpu/drm/imagination/pvr_fw_trace.c:205:37: warning: 'pvr_fw_trace_group_mask_fops' defined but not used [-Wunused-const-variable=]
>      205 | static const struct file_operations pvr_fw_trace_group_mask_fops = {
>          |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

