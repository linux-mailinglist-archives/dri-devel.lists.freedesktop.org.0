Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2026BE46CA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591F910E237;
	Thu, 16 Oct 2025 16:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="sT6vRqMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057A210E0C7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=LINeZ92B6as9p5YZGgLinLU9LTl3+cggwI044K3HV9U=; b=sT6vRqMeha5paYOSJJkSbuqkpg
 Dp43S1p+pwtPhKwOG6B80p9xTHolM7IisIytC11DgzOYHwKjpCKzJsyVOmgYQJej92NGpQ9FmQJE2
 qwsMRzdgTKKzqS3ivGXz/tsQMaGnO1Sd3VqGGaXiuFnHWQA7EgurTM9Fb/x4OEChwbyE99TVdjE1l
 ouTJD/fgaJvWMHyYwhIVl5oJtVSCD0MoCLQ8kmj6Dx1yWz0oOzDTGV0yvH7b353OLJQJTJJonRDXB
 mSaS4JqvUBI9xnJOOcQVkq+J1fNHnCjAzdpKuMW/YYeJ+mjWPddVpKjCeMqn4DYmVJJgvbLSeEBPJ
 LZVNDmrQ==;
Received: from i53875b4f.versanet.de ([83.135.91.79]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1v9QQG-0001Hf-SA; Thu, 16 Oct 2025 18:01:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: dw_hdmi: use correct SCLIN mask for RK3228
Date: Thu, 16 Oct 2025 18:01:39 +0200
Message-ID: <176063049204.2255429.1568270425140283082.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251010173143.72733-1-alok.a.tiwari@oracle.com>
References: <20251010173143.72733-1-alok.a.tiwari@oracle.com>
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


On Fri, 10 Oct 2025 10:31:41 -0700, Alok Tiwari wrote:
> In dw_hdmi_rk3228_setup_hpd(), the SCLIN mask incorrectly references
> the RK3328 variant. This change updates it to the RK3228-specific mask
> RK3228_HDMI_SCLIN_MSK using FIELD_PREP_WM16, ensuring proper HPD and
> I2C pin configuration for RK3228.
> 
> Change: RK3328_HDMI_SCLIN_MSK -> RK3228_HDMI_SCLIN_MSK
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: dw_hdmi: use correct SCLIN mask for RK3228
      commit: c700e7279b29948f5d2aee30df2dbd3124df3b9c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
