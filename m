Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D3D03FA0
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 16:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBBB10E368;
	Thu,  8 Jan 2026 15:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="J9N1uqyk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737DA10E78D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=uCeCeimucjCaP535NGwMJwYj62zTUinDV1/mQx/kINs=; b=J9N1uqykG2Qxoxw/g34oGTX3La
 vHfTxvF1/cGO6CWMSuz8hpUzuWIZjz530wRgbMpzcMjcRBJCC+iwTxZhtDUoFOPgksjigvu443CGc
 iewuMhbofmOWHOfKL4bzjK5X3tIF6b3chMafqBimDMLr69mDBweMMYbxreQOEtb76y+mEwi9+Dwub
 Qco76G3yKMStrPYBKKNvuI2EQNNdjxPmlUWWslGGMfvvlgOZy2cxaU4eNL84DForHG0ZjGi6Sh0C2
 EAgwIgaRiit4M6eXzfADGK1Ob7JOW9bgRoTSo3VzOeYpMwm9AJDaQ1gxBDkwvVPweVq9DCtC0Su3i
 lI2usngg==;
Received: from i53875a63.versanet.de ([83.135.90.99] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vdsCO-001W86-Se; Thu, 08 Jan 2026 16:45:21 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/2] drm/rockchip: vop2: Add delay between poll registers
Date: Thu,  8 Jan 2026 16:45:19 +0100
Message-ID: <176788711595.3235249.5659814329200289480.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718064120.8811-1-andyshrk@163.com>
References: <20250718064120.8811-1-andyshrk@163.com>
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


On Fri, 18 Jul 2025 14:41:13 +0800, Andy Yan wrote:
> According to the implementation of read_poll_timeout_atomic, if the
> delay time is 0, it will only use a simple loop based on timeout_us to
> decrement the count. Therefore, the final timeout time will differ
> significantly from the setted timteout time. So, here we set a specific
> delay time to ensure that the calculation of the timeout duration is accurate.
> 
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: vop2: Add delay between poll registers
      commit: 9fae82450d8a5f9c8fa016cd15186e975609b2ac
[2/2] drm/rockchip: vop2: Only wait for changed layer cfg done when there is pending cfgdone bits
      commit: 7f6721b767e219343cfe9a894f5bd869ff5b9d3a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
