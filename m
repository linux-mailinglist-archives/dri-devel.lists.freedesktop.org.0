Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF3C8005D2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6786510E80F;
	Fri,  1 Dec 2023 08:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B4310E80F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:37:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 16AF0CE23C3;
 Fri,  1 Dec 2023 08:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C04C433C9;
 Fri,  1 Dec 2023 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701419865;
 bh=vwfvlYF1Ql3h7BF9nsm39RTMqOUzKsLqOB50UqUXBjA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VK5oqLyBqvMLA+eGbkLMBFgaWYBNu7SwDEy/2Vu0/2rCRtSYroTn06gDojGhPxsre
 9/raSZkDuWXNyAWGkcfuZ1LHLLNTmrW7B+BV6mgKiokA5rFSnc3ezdy7Gc7P2+R9He
 yTq2ipWxqc52qTz2wHVMFz6MHtGig0GjAbXgccGDqfq4/A+I4Zfhnq9ZtFhIxVgYIc
 +bTcjq8xfccaIPs/clHBBOMUWXokj6yGZcoD4KwOwr0LJENFj4wJF7wbNf93vvkbfa
 RB7zxImckcNBfVZ7gVMLycAKruqbdPvVBCUkd/+y2W5KWR/pZok44zZJLvtEoOJ3dG
 WEV2wu8VncCCg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231129153703.162642-1-donald.robson@imgtec.com>
References: <20231129153703.162642-1-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH 1/5] drm/imagination: Fixed warning due to
 implicit cast to bool
Message-Id: <170141981127.3198685.4985387071674104963.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 09:36:51 +0100
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
Cc: matt.coster@imgtec.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023 15:36:59 +0000, Donald Robson wrote:
> 


Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

