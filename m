Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46139AFD580
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 19:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4807A10E6BC;
	Tue,  8 Jul 2025 17:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="G/qoFhT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141D310E088
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=UQuPrMl4qmbsQGIYF0VFRtd+Ry1sum32/xnLjEzzRFg=; b=G/qoFhT9pYQEzuVrsyhoFiGJwq
 wxsivWG0AwDsw7VnOYFtSvVLThLZ+54dF99VqMaA5cxZFSQDShF4Tgt7bNG6B0dQohOo+0jOvV0rB
 i1o0ZSor4GIR7PEElnBAYtOS5QERcnwm50OTJP95OBEeCYIhJwp8OeIIGJtDPBlDK6tO4Q7qzdyAV
 rUVZWVovUFOLl4JgAEAWRVDizxGpY8odH2Ef4k+PA165yno0Nq0ko3BC3xWZ1ktvnOjWfZx3djLFU
 XQsUK6k6/c/+eDldJR3BtCDmknjwHfxmsDHy0Qa+l+9tx3mPRzikfhIr4IDuwTCD1XaLs7Hz06Tjd
 OR+cY02g==;
Received: from i53875a8d.versanet.de ([83.135.90.141]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uZCE7-0005cC-SZ; Tue, 08 Jul 2025 19:35:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	long.yunjian@zte.com.cn
Cc: Heiko Stuebner <heiko@sntech.de>, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn, mou.yi@zte.com.cn,
 xu.lifeng1@zte.com.cn, ouyang.maochun@zte.com.cn
Subject: Re: [PATCH] drm/rockchip: Use dev_err_probe() to simplify code
Date: Tue,  8 Jul 2025 19:35:17 +0200
Message-ID: <175199006059.1731917.11035979004712647883.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
References: <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
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


On Thu, 15 May 2025 20:35:54 +0800, long.yunjian@zte.com.cn wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: Use dev_err_probe() to simplify code
      commit: 52008d6fe7fa84ecf23864c5cc373beb085f30b9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
