Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD60F612629
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 00:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EBD10E03B;
	Sat, 29 Oct 2022 22:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7898210E02C
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 22:08:58 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oou0X-0008NZ-3n; Sun, 30 Oct 2022 00:08:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: daniel@ffwll.ch, linux-rockchip@lists.infradead.org, airlied@linux.ie,
 Zhang Qilong <zhangqilong3@huawei.com>, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com
Subject: Re: (subset) [PATCH -next 0/2] fix PM usage counter unbalance
Date: Sun, 30 Oct 2022 00:08:46 +0200
Message-Id: <166708118166.1656095.1443296308637313004.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220922132107.105419-1-zhangqilong3@huawei.com>
References: <20220922132107.105419-1-zhangqilong3@huawei.com>
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

On Thu, 22 Sep 2022 21:21:05 +0800, Zhang Qilong wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> We fix it by replacing it with the newest pm_runtime_resume_and_get
> to keep usage counter balanced.
> 
> Zhang Qilong (2):
>   drm/rockchip: vop: fix PM usage counter unbalance in vop ops
>   drm/rockchip: fix PM usage counter unbalance in poweron
> 
> [...]

Applied, thanks!

[2/2] drm/rockchip: fix PM usage counter unbalance in poweron
      commit: 4dba27f1a14592ac4cf71c3bc1cc1fd05dea8015

I've ignored patch1 here, as your Huawei-collegue Yuan Can
did sent a different one that catches some more occurences.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
