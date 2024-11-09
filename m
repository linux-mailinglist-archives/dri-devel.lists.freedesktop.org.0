Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EC19C2FD0
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 23:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7650510E021;
	Sat,  9 Nov 2024 22:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="wfgs76ln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013B310E021
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 22:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=agd7DTsP3iDbnG7sWOzlCcsKSDrrKy3fQmFvesVPIFQ=; b=wfgs76lnTeZLn8bIGTGvj/GPhh
 rmaQ8JI3KX7xwRsd4sVZAtL8Hwg1O4h452xGUxoxaH5ocANU/BPzExe0jClK0Ap2ko4rROZ0afaKl
 j/00aJDatlW+2lL7WMVt5MjQvVuiAULwndxotzYbl+pXMm1AqrzXSlkUYzwACxJQPmwIF3n2qnxjy
 VWBaqB1MudAW0Ae3FgKor2rat8hGrqyWHUopbGGcizY9uZVAvoy2rZBXrbTlKlX54OUks/UC2RU/3
 2M7xK2L6WUKtURV15G6TRJPOumH1eH+j6L/WAdgQ3Hfo7ISiaRvKVilcajYTuyJZUSOEnxYnGoPN6
 V0dJ483A==;
Received: from i53875b28.versanet.de ([83.135.91.40]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1t9uJN-0000NE-MY; Sat, 09 Nov 2024 23:52:09 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 hjc@rock-chips.com, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: vop2: Don't spam logs in atomic update
Date: Sat,  9 Nov 2024 23:51:56 +0100
Message-ID: <173119266840.1201296.2477223024161993614.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028074140.382199-1-andyshrk@163.com>
References: <20241028074140.382199-1-andyshrk@163.com>
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

On Mon, 28 Oct 2024 15:41:34 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Demote the error message to drm_dbg_kms to only print the message
> if the respective debug messages are enabled.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: Don't spam logs in atomic update
      commit: 712ec5de382d009396ced509e75b392d28871aa4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
