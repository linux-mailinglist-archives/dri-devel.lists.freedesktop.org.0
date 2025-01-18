Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B677A15D5D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2025 15:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A3C10E0D5;
	Sat, 18 Jan 2025 14:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sxFcLrR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3407510E043
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 14:38:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6656E5C5A3E;
 Sat, 18 Jan 2025 14:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F4AC4CED1;
 Sat, 18 Jan 2025 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737211124;
 bh=p8uuuT0wymRMBVrEbqKTi7D8E2Qgrm+TXCVTrrW58FQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sxFcLrR5hAesiWX32VEYCWUFmZfFa7LKPtCa/ukviXb7o8//lw7x6jXdtr8z6ZKt8
 +BY3KZfXFkczLCKoMEXdDKn1f+wFBXBQZeQjeiRudeTy/q9sGCRE6mHkbFPdu9R+pr
 NmJxaw61CvVVRgNlBZo1w8SARhWfa7wZYkiOWcVJ/p4CWip4tQyAUeGwUCN+X5C6xK
 WpLFWXQKqemc8qUixDu0zLByoLyF0sBGoseyPCkJzSpM8cGdXVSIcnCBHQVdsKEPbt
 LUU94ozMdgrKDQILBuoAVeH5U8Wbl4hoFOMBoy1OIxbWKdp5cuX55nl+JMp1DtpODZ
 pa/mwhpHjxyUA==
Date: Sat, 18 Jan 2025 15:38:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: display: panel: Add compatible for
 STARRY 2082109QFH040022-50E
Message-ID: <20250118-grinning-mutant-husky-644c6d@krzk-bin>
References: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
 <20250117091438.1486732-3-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250117091438.1486732-3-yelangyan@huaqin.corp-partner.google.com>
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

On Fri, Jan 17, 2025 at 05:14:36PM +0800, Langyan Ye wrote:
> The STARRY 2082109QFH040022-50E is a 10.95" WUXGA TFT LCD panel,
> which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver. Hence, we add a new compatible with panel specific config.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---

No. Read the emails ENTIRELY and eithe respond or implement the
feedback.

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about 'b4 prep --auto-to-cc' if you added new
patches to the patchset.
</form letter>

Best regards,
Krzysztof

