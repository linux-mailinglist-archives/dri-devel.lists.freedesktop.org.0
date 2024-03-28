Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1AF88FD09
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5231123B7;
	Thu, 28 Mar 2024 10:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AerGmLRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2B31123B7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:29:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8888960EB7;
 Thu, 28 Mar 2024 10:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B94C433F1;
 Thu, 28 Mar 2024 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711621782;
 bh=/E5PSzRbsq+9zCnmlK9iHP77LX6f4UHO2zjqnjvhyYk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AerGmLRA0B602nhIDHe/HSwEG8AYdimKpG4kqGxPuMA5IdIdaTgcKrH5bZJS+97Ss
 hSG3hcJxa6KG0TuM4S7BDakNbcWWlZLu4Kp1Jf+Eob4XhjAfJACDZHp1pe0YhOcP/s
 8c72ZP3edPizd/A+NvOAlxRzG2/DOlPG2oKFLiQiHqakvq/PNY32ZdjP+qaG5dfaA4
 ujgEha+LEXH+l7hjFA5FF10vFJcdr2dWAZeH7g2JZr/KHT+aKYXPRxnOSqMJD6NVXl
 UolFGjU3P3pIPy1wmt/iwP5RVbsWzEhUvOXT/eUOQ1X7Y6qMVbKogsdSVTdXacea7U
 fCnjXzNN8WtSw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
Subject: Re: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols
 to depends on
Message-Id: <171162177899.407972.17600614685255017033.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 11:29:38 +0100
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Mar 2024 11:56:55 +0100, Maxime Ripard wrote:
> Jani recently pointed out that the Kconfig symbols are a bit difficult
> to work with at the moment when they depend on each other, and that
> using depends on would be a better idea, but no one really did the work
> so far.
> 
> So here it goes :)
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

