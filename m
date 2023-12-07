Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E24808B50
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AAC10E8B7;
	Thu,  7 Dec 2023 15:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAC910E8B7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:03:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2C9ABCE2446;
 Thu,  7 Dec 2023 15:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFCBC433D9;
 Thu,  7 Dec 2023 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701961405;
 bh=iBtqxKALkQ+SYZWERK2YTeoNG6LzaRsWWxMqGGS3mo8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z2MC1PowSNJ9igtUY/SB0k4SCrhi+CNVDb3TaZrXNplhWpNI9q/VVaUKIvxxTXgDM
 4W+P0A2YcDXWCSFATNWIgY6Rc6hkseRwNsC1E9zq8pjmntAzhuYEixrHAq/FW0YhfX
 yZVS46FBFMFEI+MQCkb1iDOGtBHMgVw3EzQAhWfqdsd5hb2Cl4aLNZ2fSofBVOtEBK
 8kil0yhFQ/ZecvaSKCJfBOPfAbwWxpg4esng+fuVZV+afaURRnH2mddkb/s9//8jjh
 legvq0+uXV2GFxW+criQtXZ7aJGss6NH3/C2EmJyTuZdX+PCU72f+RdkbaxXCXOuGI
 A/Rukeiy+nJYA==
From: Michael Walle <mwalle@kernel.org>
To: tony@atomide.com
Subject: Re: [PATCH v2 08/10] drm/bridge: tc358775: Enable
 pre_enable_prev_first flag
Date: Thu,  7 Dec 2023 16:03:16 +0100
Message-Id: <20231207150316.2633755-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202075514.44474-9-tony@atomide.com>
References: <20231202075514.44474-9-tony@atomide.com>
MIME-Version: 1.0
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
Cc: Michael Walle <mwalle@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, sam@ravnborg.org, ivo.g.dimitrov.75@gmail.com,
 rfoss@kernel.org, jernej.skrabec@gmail.com, simhavcs@gmail.com,
 merlijn@wizzup.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, pavel@ucw.cz, mripard@kernel.org,
 robh+dt@kernel.org, philipp@uvos.xyz, neil.armstrong@linaro.org,
 sre@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Set pre_enable_prev_first to ensure the previous bridge is enabled
> first.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>
Tested-by: Michael Walle <mwalle@kernel.org>
