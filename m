Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F931F643F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 11:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5698F89C96;
	Thu, 11 Jun 2020 09:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C724589C96
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 09:05:40 +0000 (UTC)
Received: from p5b127c64.dip0.t-ipconnect.de ([91.18.124.100]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1jjJ9W-0006it-Li; Thu, 11 Jun 2020 11:05:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] panfrost: Make sure GPU is powered on when reading
 GPU_LATEST_FLUSH_ID
Date: Thu, 11 Jun 2020 11:05:37 +0200
Message-ID: <4351778.0rgn4tIXvQ@phil>
In-Reply-To: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
References: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 11. Juni 2020, 10:58:43 CEST schrieb Tomeu Vizoso:
> Bifrost devices do support the flush reduction feature, so on first job
> submit we were trying to read the register while still powered off.
> 
> If the GPU is powered off, the feature doesn't bring any benefit, so
> don't try to read.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

on a PX30-board (sibling of rk3326) with a 720x1280 panel and
glmark2 running all tests

Tested-by: Heiko Stuebner <heiko@sntech.de>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
