Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1B9CA5757
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 22:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7323310E089;
	Thu,  4 Dec 2025 21:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XifWmMFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640D810E089
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 21:26:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1ACD843A55;
 Thu,  4 Dec 2025 21:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83C4C4CEFB;
 Thu,  4 Dec 2025 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764883581;
 bh=ZusWwaEIlm7+T0smgbl+md/eVqDNZ5CJDe7YOlFXCk4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XifWmMFggKBCw145pNTu8D8dPVVM8ZggmfKHpSwh9zHpwLSIM9dv61rDK7tMJ1gJm
 IQ+CsUqdxp7J6x+0KlqkydgQStuY++OTmJf3kOvNtXjBMMRr63HMTlIxgeq4mYo4Qr
 LBG/qZfMGY5rrF7MJenDpvs/3rke4PR9PFGn7Kppi71zYgnOSOOUY93gacsmnfUIbk
 Mzxcrcd3F3QoVG3pyCsNTqsA7JpUYjhxft6CfihN4bTaiRi6ZmG7YDvaX1NA7WuA9u
 LT6PP7VKW6x4eoPZLddHzSeu4B7GdpWOAeLO4XMQ9ffFq39/rnbTyx9M7qwAOutUtx
 X7vpLwoLH7Elw==
Date: Thu, 4 Dec 2025 15:26:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Renjun Wang <renjunw0@foxmail.com>
Cc: maarten.lankhorst@linux.intel.com, sam@ravnborg.org,
 neil.armstrong@linaro.org, tzimmermann@suse.de,
 devicetree@vger.kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, jessica.zhang@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, airlied@gmail.com, mripard@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RESEND 1/2] dt-bindings: display: simple: Add HannStar
 HSD156JUW2
Message-ID: <176488357702.2194025.7613189083646464616.robh@kernel.org>
References: <tencent_D449AE627267BDD68BA41AD80EB3DFB5D407@qq.com>
 <tencent_8B5693A42B580AB3A5359849CCE23E67B407@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_8B5693A42B580AB3A5359849CCE23E67B407@qq.com>
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


On Mon, 01 Dec 2025 22:21:53 +0800, Renjun Wang wrote:
> Add the HannStar HSD156JUW2 15.6" FHD (1920x1080) TFT LCD panel to
> the panel-simple compatible list.
> 
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

