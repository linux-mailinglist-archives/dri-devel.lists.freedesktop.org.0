Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E011964C216
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 03:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C241710E201;
	Wed, 14 Dec 2022 02:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1C410E201
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 02:02:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D778C61773;
 Wed, 14 Dec 2022 02:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C203EC433D2;
 Wed, 14 Dec 2022 02:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670983338;
 bh=83ob3N1he1MIOrIIbkVJFs5buErAmrdJMCOKfKXHqb0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bDLXc0RuV61tWZ2TmhA1zZ/K9nn8vhh9b8wz9mlGGOgLzL72MNBrv3mH5M0aHf5I3
 hYs6hOT0gCeh5AF+RryYv8T3742g9igNINX2g//Q0TC+McJ349jyIEVzFAxIZPfX4E
 N1Ms8QVMLpeyMvw3A726E4yHJiEUK7ovU2FeXBOiFb6EcuxkjSe2oj3T7gyQfQB65W
 ihdnMMbu247K8HnVN4q4MpH7jWLJ/OHVUsz/8nMUgIWNMVcXMMGXDkb0I18prIFwR2
 XONm4gCX+VRwbHTKJW+zbxU6oFygYoN5Fou0uk2HBKR4zgxK7mI9PN+4YcjW2MZ5LE
 +IzwIELTfXT8g==
Date: Tue, 13 Dec 2022 18:02:16 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH v2] net: ksz884x: Remove some unused functions
Message-ID: <20221213180216.34f1826f@kernel.org>
In-Reply-To: <20221213035707.118309-1-jiapeng.chong@linux.alibaba.com>
References: <20221213035707.118309-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: netdev@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 davem@davemloft.net, linaro-mm-sig@lists.linaro.org, edumazet@google.com,
 pabeni@redhat.com, sumit.semwal@linaro.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Dec 2022 11:57:07 +0800 Jiapeng Chong wrote:
> These functions are defined in the ksz884x.c file, but not called
> elsewhere, so delete these unused functions.
> 
> drivers/net/ethernet/micrel/ksz884x.c:2212:20: warning: unused function 'port_cfg_force_flow_ctrl'.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3418
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

# Form letter - net-next is closed

We have already submitted the networking pull request to Linus
for v6.2 and therefore net-next is closed for new drivers, features,
code refactoring and optimizations. We are currently accepting
bug fixes only.

Please repost when net-next reopens after 6.2-rc1 is cut.

RFC patches sent for review only are obviously welcome at any time.
