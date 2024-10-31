Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C579B779C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 10:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A41C10E875;
	Thu, 31 Oct 2024 09:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rqf6xRJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25E810E87A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 09:35:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 00B1CA43DF0;
 Thu, 31 Oct 2024 09:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACB5C4CEC3;
 Thu, 31 Oct 2024 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730367304;
 bh=i1JF5hv7vtBX8g03vZ3RISaGgraP8hZPC83GrDkms6E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rqf6xRJhhUbnRaSrc5A9DYzADXahx2euct7LThTvHxAIluNdd1u+5QJry1DQXtDeU
 tV+Xq/goTF94FxDGbNcJd0YcH5753belkEEaTfsFY7NhcIYD4LDF8q2uqYVN7mmSaK
 za7eyFTcnnoZ1odY9kAq79ZQBk/x7QiYM3SLMjgQr8cUVboFDrf/VUBXtip/Ptfz4b
 quary7EIDeq1uOXlmvzR5thBrP/xLyKTPkTxkeXsnHk7ylNeyU7JROSZKZaDZDWtMD
 pOnEPdydAgz5d5BN+rcw4sxEc4OlcBXnUgtnmupDON/72sc0QYcg+Kit2a2GFov/wX
 ght8LE16U0Z3A==
From: Maxime Ripard <mripard@kernel.org>
To: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org,
 dave.stevenson@raspberrypi.com, quic_jjohnson@quicinc.com,
 mcanal@igalia.com, skhan@linuxfoundation.org, davidgow@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4 0/3] drm/tests: Fix some memory leaks
Date: Thu, 31 Oct 2024 10:34:48 +0100
Message-ID: <173036727981.2456570.2384235382375387545.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030023504.530425-1-ruanjinjie@huawei.com>
References: <20241030023504.530425-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 30 Oct 2024 10:35:01 +0800, Jinjie Ruan wrote:
> Fix some memory leaks in drm tests.
> 
> Changes in v4:
> - Return NULL early if drm_display_mode_from_cea_vic() return NULL
>   for drm_kunit_display_mode_from_cea_vic() helper as Maxime suggested.
> - Split out the separate ttm test patch.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
