Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DBC8148C8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F87310EA13;
	Fri, 15 Dec 2023 13:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA67510EA04
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:13:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 325F2CE2E84;
 Fri, 15 Dec 2023 13:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76811C433C8;
 Fri, 15 Dec 2023 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702645987;
 bh=tuoQDVEvOc4yYofLOsac9XvmYp1ao3T0xlTQ8AbQp/k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kHCHb5AH3+NMcS7GzCcQ6i5eMb8R4+mbVTuNYb6//iPDSHzMTaKTDfdlE6RWgnkXu
 fnwG/yuVs6dnGqG56LR81EJ9Kg3ZSeV700QJ7qkM/4rNvBA1YMrpZY+kMDqKTqI+Kt
 +4ezyU9PBP4ZSU5DFR/UnPelyeEYliBlGN4SNrVEyarjrK02gmGM4e4MCgDmFiHpsL
 MjB63cTsKJn2lAqLTc95QMx1F7Fph7ByU3sTprr42dduZvugZsEsmvI7yw7zKDL1WS
 hJHf2EK6mj4yL2Jm3+KiAYmugp7MwZqa6Vc9doz3Cg9Lu+JP0W79WLrXb1ekHpujit
 yvqP2FLT2uKFQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231208163019.95913-1-donald.robson@imgtec.com>
References: <20231208163019.95913-1-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH] drm/imagination: Fixed oops when misusing
 ioctl CREATE_HWRT_DATASET
Message-Id: <170264598499.449619.5534546786451480094.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 14:13:04 +0100
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
Cc: tzimmermann@suse.de, matt.coster@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Dec 2023 16:30:19 +0000, Donald Robson wrote:
> While writing the matching IGT suite I discovered that it's possible to
> cause a kernel oops when using DRM_IOCTL_PVR_CREATE_HWRT_DATASET when
> the call to hwrt_init_common_fw_structure() fails.
> 
> Use an unwind-type error path to avoid cleaning up the object using the
> the release function before it is fully resolved.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next-fixes).

Thanks!
Maxime

