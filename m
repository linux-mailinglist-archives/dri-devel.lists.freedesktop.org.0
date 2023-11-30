Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A547FEBB9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 10:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6951C10E6CE;
	Thu, 30 Nov 2023 09:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AF010E1BD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 09:18:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A7BF261E09;
 Thu, 30 Nov 2023 09:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01383C433C7;
 Thu, 30 Nov 2023 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701335931;
 bh=nT9nGRfMfU4zgEHa6fXZDXZZdiT3bkcMygf58AsjxvA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oT/IMeHMhtHPp9SwiakrtnQOomaEbeQQ3MX+Z0Sn3gUXDHeHrtiLnSG05innsBON0
 363PAMnvstx3bi1dB/K428ltGi+X4HJDHPWZ2U8bPNz1NpU/oPhyS7xlcS2eVCiR7w
 0IQfMIvRxEXO3tLgM6McOwxcOG9p3UL0gMHmAmq+f39el5JimFxEgunEkftfkrtWIq
 ghdz5FAwkmw9XUSPCuguHbXn04F/fHy1cjDeYjcvVof3wZ+ABgVqpJQau1xJFG4G1z
 QHhd5pH3d6vzWwl6p7r1cFWG/T42/PYOciAtLMXkL9fj7LzilePHbLXlNdJwAZZkYL
 b4A/R6UBi7lOg==
From: Maxime Ripard <mripard@kernel.org>
To: Sarah Walker <sarah.walker@imgtec.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <384288de-a779-46c7-869d-b3c63462e12b@moroto.mountain>
References: <384288de-a779-46c7-869d-b3c63462e12b@moroto.mountain>
Subject: Re: (subset) [PATCH 2/2] drm/imagination: Fix IS_ERR() vs NULL bug
 in pvr_request_firmware()
Message-Id: <170133592874.3076107.12823287713812257230.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 10:18:48 +0100
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023 10:27:01 +0300, Dan Carpenter wrote:
> The pvr_build_firmware_filename() function returns NULL on error.  It
> doesn't return error pointers.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

