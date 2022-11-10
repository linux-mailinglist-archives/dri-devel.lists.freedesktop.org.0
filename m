Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 278376241B8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315CD10E6F3;
	Thu, 10 Nov 2022 11:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4963F10E6F3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 11:46:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 577025C016A;
 Thu, 10 Nov 2022 06:46:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Nov 2022 06:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668080774; x=
 1668167174; bh=BsR56HSej5wLEnQIbihgAJ8HcMDp/WjCOHTnYkSXCSc=; b=a
 JM8tc/TDyL0JuttNSK85/27V0lax0sxopBq2dEqHVaBvZjuGYNYVZ0Yupc+ZDGf4
 Nlkrv3/l4hENMq6pe0WVQF7ahh4b9Q7bElOPVER37Y79lI/HKxsdHeTJD3sdqhk/
 b6DhEbU0HZx+0XCyeCy8X8WYyWJhAkzTiz6phhLfArbE6i3CIlReCV27EA4jiFnQ
 c1+JCoBrU9Ztqi7ktk7ZVEZZ7Cxrnfs3s325gH6VcPQ6wTbjyS6RBLLJH9SxVdXp
 O0yMgfNhoKK8TL2itWKzEa6e0qDpX9ZOeodOk/zk0tjshA18uOe9jBnbWmc5Ur4W
 bjIzKFxELs1Bg0vULQUJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668080774; x=
 1668167174; bh=BsR56HSej5wLEnQIbihgAJ8HcMDp/WjCOHTnYkSXCSc=; b=g
 ROc3FIYhnO5/VpJJTOrNoyJ0QVKhKZJ6IXReYR/CkFHl03mJQRWXQ/01k1nRZ7dc
 LiD1FFGRIY6pIybtBjpOBSPJ6kYKIBSb4YzP+iPDpkbCYQ2RcA7nb0BdCC/xMiTa
 OTVtJxBNxM7VDWX/XpKUfM1KsSe8up5kfJNJt8G8ADNqERlCOdkGe5ht9RmJIAYl
 c87OTpgWGZzmWctSUPelc8+Nn+JqefaxOxv4GWA4OLxB/MXqAgNPrGe+LFjW+tGg
 UAeABcLxTDx1gB8yAmlYqS0Cc46kzn2VgNCEK2Z6itbAL+iVlDsdrNvbJWI3bk1c
 XDfJSrSLTncrsYtj0DdkQ==
X-ME-Sender: <xms:heRsY0jsD-cArDSmxlAx6-ZnYz5dxCC6GrsUgvobauPUQj5qsArW4g>
 <xme:heRsY9BmZjrjMJ3cjTMwfBv8-OEi4daGtz_afAdFppUVik7v4grdAKu8h-ZmJ4QUW
 vBebA71E7GmdCO7Sl8>
X-ME-Received: <xmr:heRsY8H-GP2nyxk-0ORlzWUGJ5F1q510yzefUHMxMEYsH9kGxWGlTbBcAhxej2MtvH2LSPSnlI3w-ZgA08kA2gfEMC7mbH7RJt8S0m2JU5-2uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:heRsY1RKVbXkpoRjDaBAvP8voJX7kY3RumtVNUWgY9sHYDgudbDoPw>
 <xmx:heRsYxziy2-f9hjmnmgzGqJkqrGhmvEwZZdhVRmYzOh5EASSu_Oeiw>
 <xmx:heRsYz4KqwFD6CWLBDYu3xeZkNuXEweBpmX59TR8RLufxQ607jeXEA>
 <xmx:huRsY4jKGMjMpzG0tJVFayEhRmgq-tyD5yOtfEDCHAz4P_qESK7X0w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:46:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: brian.starkey@arm.com, liviu.dudau@arm.com,
 angelogioacchino.delregno@somainline.org, mihail.atanassov@arm.com, 
 robdclark@gmail.com, mripard@kernel.org, vladimir.lypak@gmail.com,
 olvaffe@gmail.com, dianders@chromium.org, 
 daniel@ffwll.ch, quic_abhinavk@quicinc.com, airlied@gmail.com, sean@poorly.run,
 james.qian.wang@arm.com, 
 emma@anholt.net, quic_akhilpo@quicinc.com, marijn.suijten@somainline.org,
 thierry.reding@gmail.com, 
 Gaosheng Cui <cuigaosheng1@huawei.com>, dmitry.baryshkov@linaro.org,
 sam@ravnborg.org
In-Reply-To: <20221110094445.2930509-6-cuigaosheng1@huawei.com>
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
 <20221110094445.2930509-6-cuigaosheng1@huawei.com>
Subject: Re: (subset) [PATCH 5/5] drm/vc4: kms: Fix IS_ERR() vs NULL check for
 vc4_kms
Message-Id: <166808077078.1000366.11533322573210640041.b4-ty@cerno.tech>
Date: Thu, 10 Nov 2022 12:46:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-99e3a
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Nov 2022 17:44:45 +0800, Gaosheng Cui wrote:
> The drm_atomic_get_new_private_obj_state() function returns NULL
> on error path, drm_atomic_get_old_private_obj_state() function
> returns NULL on error path, too, they does not return error pointers.
> 
> By the way, vc4_hvs_get_new/old_global_state() should return
> ERR_PTR(-EINVAL), otherwise there will be null-ptr-defer issue,
> such as follows:
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
