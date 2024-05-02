Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FCE8B9F74
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 19:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411E311260A;
	Thu,  2 May 2024 17:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LdpCAseE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5E211260A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 17:26:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 062DD60B32;
 Thu,  2 May 2024 17:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1FCC113CC;
 Thu,  2 May 2024 17:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714670798;
 bh=ZaiiRZ2rHARj9qlIVThHOdD9gBPLlRdbHjtki6AAwhM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LdpCAseEXC1l0+nRg+IFZwPvDYNnioSl5U++nFBZrw8Aa40h7cPTx6ym1wzsOFPqX
 nl0O5Ffm38F29REUyV9MATORkoPzLjho+VnQTvs4vVzYdSBK+Jd2DfHzKXvcstlY57
 R1kFl9hJUtJQ9FykDhHys2FIFa29Qiz9cJH3pUR02e5ArKGDwGFAGXhWYKiHfAAyRm
 G+zDk3TpR/2Y/1wm2MbzSA6jBcpByiqBQtnEJORz1J+HqNBlwvRtHmb3wHaapNpe73
 CIs3p7n6GrJz22v9+2qP7CSVWYHOpMBbefhxDeZWQt1CRelkbopMn5U3xnfToo8h7n
 6jsfMgtcz/Zyw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 deller@gmx.de, Shresth Prasad <shresthprasad7@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, javier.carrasco.cruz@gmail.com, 
 skhan@linuxfoundation.org, julia.lawall@inria.fr
In-Reply-To: <20240502172121.8695-2-shresthprasad7@gmail.com>
References: <20240502172121.8695-2-shresthprasad7@gmail.com>
Subject: Re: (subset) [RESEND][PATCH v3][next] backlight:
 sky81452-backlight: Remove unnecessary call to of_node_get
Message-Id: <171467079621.1227065.12439900385268240993.b4-ty@kernel.org>
Date: Thu, 02 May 2024 18:26:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Thu, 02 May 2024 22:51:21 +0530, Shresth Prasad wrote:
> `dev->of_node` already has a reference to the device_node and calling
> of_node_get on it is unnecessary. All conresponding calls to
> of_node_put are also removed.
> 
> 

Applied, thanks!

[1/1] backlight: sky81452-backlight: Remove unnecessary call to of_node_get
      commit: 4da294108e38bf9cd5c62c2caa47611e5dbb7fb1

--
Lee Jones [李琼斯]

