Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548ED3C4EE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5502F10E5AB;
	Tue, 20 Jan 2026 10:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="tGCCTTBw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F1010E5AB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=smipNdqhzJnF+g6Gddp85s4y2D/OwlJ5ZxuyrObg2lk=; b=tGCCTTBwS6v2WF8g5pz+A1eker
 Ov9EN2OdZMYm4IS0IwCTNTJuXFyYnZUFMmczXfRfh/A5EsvcD8Ash+yc4VppDt0Sq5gPtvkPQ7kNF
 cDiRLUjC0GHAYqSxxEkYPcvKJDZTfACHHp3VCH68iTAj+iYj1GjYR4+mSBpFCE4N6iYr1xR4EKkp6
 QlO+gXYLLtEM+Kn90QBnD9lqVsdh1F3vVdB+cRFxrOfNFMxwpF94DFfUk7o4LxQ5D7XoCVAz3Lxhy
 R/h6d8KnAtiRkDdn3lq5ZkhnAZmw5aJRagScX+JT7zBx56EciIDMsepbOjdUBvUUsh9cyKBG9wuIN
 Z9b9S9Eg==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vi8oq-003MG3-Gz; Tue, 20 Jan 2026 11:18:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2] drm/rockchip: vop2: Add mode valid callback for crtc
Date: Tue, 20 Jan 2026 11:18:36 +0100
Message-ID: <176890429956.373062.16944190406218992913.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260117020738.294825-1-andyshrk@163.com>
References: <20260117020738.294825-1-andyshrk@163.com>
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


On Sat, 17 Jan 2026 10:07:30 +0800, Andy Yan wrote:
> The different Video Ports support different maximum resolutions.
> Reject resolutions that are not supported by a specific VP.
> 
> Only the output width is checked because the hardware itself does
> not have a hard output height limit.
> 
> Filter the mode that can't output by the VP/crtc.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Add mode valid callback for crtc
      commit: 88b14b9279d824dd84bdda20c7b2fdb4b285dd25

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
