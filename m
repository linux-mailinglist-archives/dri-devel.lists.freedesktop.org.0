Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0886B187C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 02:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F3B10E76D;
	Thu,  9 Mar 2023 01:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC8E10E76C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 01:07:29 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pa4kd-00041d-Tb; Thu, 09 Mar 2023 02:07:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jacob Keller <jacob.e.keller@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/rockchip: use struct_size() in vop2_bind
Date: Thu,  9 Mar 2023 02:07:20 +0100
Message-Id: <167832398244.362678.12023027008851540104.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230223013533.1707706-1-jacob.e.keller@intel.com>
References: <20230223013533.1707706-1-jacob.e.keller@intel.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Feb 2023 17:35:33 -0800, Jacob Keller wrote:
> Use the overflow-protected struct_size() helper macro to compute the
> allocation size of the vop2 data structure.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: use struct_size() in vop2_bind
      commit: 3b4db36c4cd9e7e49babe931d7117cdba0d04ce0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
