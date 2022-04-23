Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBCF50CADF
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 15:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098E0112023;
	Sat, 23 Apr 2022 13:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1C1112019;
 Sat, 23 Apr 2022 13:57:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8724E6120E;
 Sat, 23 Apr 2022 13:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5323C385A0;
 Sat, 23 Apr 2022 13:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650722222;
 bh=zGzRwwY4g8A2v1nQlf+NEVpuOwHFKGM8BY8W9ldNH00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eYunXOTeLEM1I4b5B5HtHuXue/YDymNhhZYJ6i+hAoRP7I9xu/iTwE28igUkEIKuN
 KMSQSKyrEIBCIQKkKBMsOFOn3EmLq1nfRQm2M8fAamgYcsG45qLVZQFy/zwc5imWS+
 ATw1j7U1AtOMbRvaAxTbQdKtCbYSKraGqH7uOljurgamy9IobZnKruWwfGn1OzPRO3
 slRn+gXTnEmLHetJykYgDYEyvejji4HYtYTyCuSqLOzZjTaQJdKEi2iYWEKlPN0cOy
 NaBLO8KZgL9q6EB6LO+Z2Zi7/jMVZF4hsEC7ddjJ0uBz3QcmdwXl41PzAIt4aGjm3A
 sej72ZZFAnTow==
Date: Sat, 23 Apr 2022 09:57:01 -0400
From: Sasha Levin <sashal@kernel.org>
To: Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH AUTOSEL 5.4 11/14] drm/msm: Stop using iommu_present()
Message-ID: <YmQFrXEBzanbx5FJ@sashalap>
References: <20220419181444.485959-1-sashal@kernel.org>
 <20220419181444.485959-11-sashal@kernel.org>
 <CAJs_Fx7YVBn7qvaE23ThBOFzozKHBkefdSztfF+xtTw2hhgw2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJs_Fx7YVBn7qvaE23ThBOFzozKHBkefdSztfF+xtTw2hhgw2Q@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 11:53:23AM -0700, Rob Clark wrote:
>You might want to drop this one, it seems to be causing some issues on
>older generations.. I'll be sending another PR shortly with a revert.
>
>https://patchwork.freedesktop.org/patch/482453

Dropped, thanks!

-- 
Thanks,
Sasha
