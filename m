Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACACA90FF8A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF98F10E878;
	Thu, 20 Jun 2024 08:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="icowDgyR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C842F10E880
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:53:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3BB5BCE2139;
 Thu, 20 Jun 2024 08:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF59C2BD10;
 Thu, 20 Jun 2024 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718873602;
 bh=l1RWJ8Fe3bejgKq+UazEidW0lPq5gmE0FU7WcCFsUD8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=icowDgyRC0rXLMcbMd4Z4i/xvZ2tdi5RGhCfvD7zRF5C/nst/8KDQ2L1yN7FDlVLa
 cXHZ7G2p9rqtPFyk8lP3H1XUfCCjMw1b+b2hsFukU1AInHabejgUmPmaq8/Zw2zu6w
 YWAbJt3yxq0keBwHRv2//RrNMyiB0OUcw751+G66wWRk+jIC37qvn/TIg9tQHMCz7v
 VgSWEBE23O9A5SNBh/532qC4jpDV4R5GxtOoUdDql2BXGyy6NSIA/z4QFHdp6saGVk
 C47Vh5E+z6/+E+L3FrBSuUdtasC4GSNr42T7fovILiKJcnX4Aqexyz9GifjcjhCev7
 jL/QEGJasYIHA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240619-md-drm-tests-drm_hdmi_state_helper_test-v1-1-41c5fe2fdb4a@quicinc.com>
References: <20240619-md-drm-tests-drm_hdmi_state_helper_test-v1-1-41c5fe2fdb4a@quicinc.com>
Subject: Re: (subset) [PATCH] drm/tests: add drm_hdmi_state_helper_test
 MODULE_DESCRIPTION()
Message-Id: <171887359991.3857922.6238282449475389694.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 10:53:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 19 Jun 2024 23:29:02 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_hdmi_state_helper_test.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

