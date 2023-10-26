Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524B7D837F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 15:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0C310E7D9;
	Thu, 26 Oct 2023 13:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682E910E7DA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 13:26:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 352DECE3F62;
 Thu, 26 Oct 2023 13:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FCEC433C7;
 Thu, 26 Oct 2023 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698326786;
 bh=41Xg+Doxc4aBDvl2iYiwfP8OIdQnKvWUYMtMk4RePuQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YyTcABChaU6MYFY2UYYfXz8rPw658AKaFaGnP9VQyN+R04Et5KHx8w8GZ9/Rlz/JQ
 bEixMV4D3I7Zn5hcQnjuWs7XZSDGl+r531/f2zF819MLd3udsnMwiBpKU1r+KQiUT2
 XVPabxKNULHZtBF87OPVEaV7o+Qr3PeoMCJljGoq4Al2RQ8IyatksKj3UtktfeDjL1
 mfJmiPLxLB4vf8RSClf2mhnQuiGb/ve+R6Fh+4Z8j+DHtq9s69l2bDDW/j5uLj2R4L
 vs3TDYxEwCwT6zPeDsNKtr2+Ezl/bovnII3SJbN2JgubIwMcxIUQnj55aUPnIEd9sx
 DxJUtM3CBoC9A==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
In-Reply-To: <20231002164715.157298-1-robdclark@gmail.com>
References: <20231002164715.157298-1-robdclark@gmail.com>
Subject: Re: [PATCH] drm/ci: Enable CONFIG_BACKLIGHT_CLASS_DEVICE
Message-Id: <169832678386.958223.2789362196867076790.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 15:26:23 +0200
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Helen Koike <helen.koike@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 02 Oct 2023 09:47:14 -0700, Rob Clark wrote:
> Dependency for CONFIG_DRM_PANEL_EDP.  Missing this was causing the drm
> driver to not probe on devices that use panel-edp.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

