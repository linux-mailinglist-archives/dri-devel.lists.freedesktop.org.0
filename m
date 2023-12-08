Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3281809F85
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 10:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7337B10EA2E;
	Fri,  8 Dec 2023 09:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB2A10EA2E;
 Fri,  8 Dec 2023 09:36:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 46E51B82B91;
 Fri,  8 Dec 2023 09:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA0FC433C7;
 Fri,  8 Dec 2023 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702028175;
 bh=DBB0cZVnrGAA1c/X5SLL7/u2difhyNNyZDqG7yjJOs4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SZWRbo8g1bmhY3/GovnRwATWs0PoOCfMBuAoAylrJHzRrMP/9vguKEyBjs7JofmxE
 zkKv9t/Dm9kmoIpGlXMNBZGwZonfPJwZtu0te9OQCLavm6GHKKk7pRgFNPAVlRohHM
 LZGh2v5W1VfBgMpKlxdIXyKv3Aa/I6PNOFJ7lts6DQ+d5wDjxXlm2F0eGU5XoTrH43
 pXakVFaWVFi4WIT2w/ErnkqkZHozdJx7ci8/W/N4JncepZjLItEnrZB7JvEfEIVC9j
 2XEjAu1r19MVBMCcuk4XH08COuKHINt+6PTjN0dv+jEjn0EDSNZ6umbmkmHzkWNjXF
 7LjlxqQIt+dPg==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231208010314.3395904-2-dmitry.baryshkov@linaro.org>
References: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
 <20231208010314.3395904-2-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 1/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Message-Id: <170202817282.16687.13033401710138514898.b4-ty@kernel.org>
Date: Fri, 08 Dec 2023 10:36:12 +0100
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Dec 2023 04:03:13 +0300, Dmitry Baryshkov wrote:
> The drm_atomic_helper_check_wb_encoder_state() function doesn't use
> encoder for anything other than getting the drm_device instance. The
> function's description talks about checking the writeback connector
> state, not the encoder state. Moreover, there is no such thing as an
> encoder state, encoders generally do not have a state on their own.
> 
> Rename the function to drm_atomic_helper_check_wb_connector_state()
> and change arguments to drm_writeback_connector and drm_atomic_state.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

