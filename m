Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A9B5983D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 15:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36D310E7E3;
	Tue, 16 Sep 2025 13:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="s17WA7Jc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4D710E7E3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 13:53:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C17F51A0DB3;
 Tue, 16 Sep 2025 13:53:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 94F586061E;
 Tue, 16 Sep 2025 13:53:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 41726102F170B; 
 Tue, 16 Sep 2025 15:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758030792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YOfBlPUim/a57KH/xWF3eDOAgXrdeRdSWvKWpWJnLho=;
 b=s17WA7JcvsyW6R+Jeuy+Zt6CeDzINJoogPCTRZJLV86SxvpFuNHG3UJvwYor6fRIsW6QEI
 aW/6NJkfTat8KFpEDRmJwnyHtpBrZ/FLNh8Uxmf6/VmLHHQyjnmg+Qg/veQw6CEL+IuJQb
 IAq7YTJ3xdQJ6EP53dIcWXRy8873WRaSRVUZa8v1wcZPqDaqITaT7wBw2tu6bBxTy3kBA2
 CluRH2yaaT0kxv7angWI4WXIfjHe9uAe8/CcWpK6NFcwKQ4ahSB07RDmR1GFeqKmAUezyG
 IGtIOApWb1udIkwrdBEO8bWrtuicMVPDGtyZEVEHvGX9d63iT9xuc3LKNVHrqA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: bobo.shaobowang@huawei.com, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 lumag@kernel.org, dianders@chromium.org, lyude@redhat.com, 
 andy.yan@rock-chips.com, viro@zeniv.linux.org.uk, mordan@ispras.ru, 
 amishin@t-argos.ru, dri-devel@lists.freedesktop.org, 
 Qi Xi <xiqi2@huawei.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250904034447.665427-1-xiqi2@huawei.com>
References: <20250904034447.665427-1-xiqi2@huawei.com>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix missing mutex unlock
 on error path
Message-Id: <175803077334.454670.15469913360427831912.b4-ty@bootlin.com>
Date: Tue, 16 Sep 2025 15:52:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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


On Thu, 04 Sep 2025 11:44:47 +0800, Qi Xi wrote:
> Add missing mutex unlock before returning from the error path in
> cdns_mhdp_atomic_enable().
> 
> 

Applied, thanks!

[1/1] drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path
      commit: 288dac9fb6084330d968459c750c838fd06e10e6

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

