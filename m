Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E364100D5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 23:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD83A6E075;
	Fri, 17 Sep 2021 21:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FB56E06E;
 Fri, 17 Sep 2021 21:41:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 6F5EA2B00902;
 Fri, 17 Sep 2021 17:41:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 17 Sep 2021 17:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=bo5do1/2uMxfSsRyPzIa31G3tU+
 VXBJq0VxVweJMjNw=; b=lx2x0Jisdd2o9GUHAoLcO7aZNpLHdrPfa7v+3CbHaiR
 1M7WQ51iFfY9qQzEvo85CsAhISodR2g1V4hPuk1RgX7j2rMrUz9Q5yuRqavVHCIQ
 /LVPTyEFjI+qDIpG99C2mAXra9mj8z4LPs3Gqi1Vnpx6gUv1axTysv/OcXVzC9Yj
 8q9xDY7mQQ7POP5KYcLazECYJtC3G/NqeQp+MHyci+UeT4SH+c3uomhGMxPxIc+5
 +RyIf5WC/T+NQgLisCIlXXcvvQ8QbuX3ErwRXpsACht9OBKx7LTHQ7NQyuJnNlQw
 i8ctXOoi6jk9qq6ptbYc1HB267/KQLPs/LjqoDgYOzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bo5do1
 /2uMxfSsRyPzIa31G3tU+VXBJq0VxVweJMjNw=; b=Z5DVGbfyPXqul6bnNVQN3+
 51BL4yVViShm82Jlg2MDeHZOi8YlO8g4DTDddGKR6Yqz+yEPRYpiA9O1NAheI8Mj
 qfY+4MMrES5Qgcf70UVmEVpYA5Zf3MkId4upz8dtEiGVdD5ju/+Jj9MdZhy0C1lj
 xMobgxPk8Jb2lvSHc2TQ1UAfJABzS6V+jVefwKZbvwxAB2awio5FQtUZcEPHjHIn
 PZZBfTEuq1EH82J2tANVbF/4nMck7ofN6LBZ8z5xreZ5ULWyhFFDkYKeTgxgCpey
 dlvtf35ATwYtChTM84B8IJLD8P5LZw9x76nKD+/mfdALgr2zvUPkH8O7tRO/gixQ
 ==
X-ME-Sender: <xms:dQtFYVOhclBMKX3Mcwz-1lbdVKEQy7TPLNBMmoZnTr4oYeyDzU5_fQ>
 <xme:dQtFYX9eOThRqFuwMFmdFDfSnKLW--Zu8reg_CGY4WaANvYzAOkgmH3kLt2YzGw6D
 dyuGyrUpzkgOR_Pnw>
X-ME-Received: <xmr:dQtFYUSux7FMhpk9fvWiDAx3COeucoGTnWN0VO-E2Sq7y1iFg5UMXo6kmRqqCvFElNhzAFV->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehjedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpefhvghrnhgr
 nhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrghtth
 gvrhhnpedvjeeifeelhfetiefhhfdthfefkefhhfeutdetvdfgvefgveefheffgfekjeef
 heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
 gvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:dQtFYRu3KfwHa-WMGiBn4OINuhHAy-twtNlDdRJYh1MOToE3aIEYyg>
 <xmx:dQtFYdf8bEudJQdBEQL0MyRHYHA5u8SSkW5ADDEeCYdmf4moDrPosg>
 <xmx:dQtFYd1tqxED0N8SmbmgWlJvaXHbIXT47ztcUOBe2pnUc6WsJ_fRNw>
 <xmx:dgtFYeVyeMILMbNbOTk6dKqn5cN6B4ugjQ1e_YoJSKUYtobCKnkzpzKg12I>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Sep 2021 17:41:06 -0400 (EDT)
Date: Fri, 17 Sep 2021 23:41:03 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/15] drm: cleanup: Use DRM_MODESET_LOCK_ALL_* helpers
 where possible
Message-ID: <YUULb61dISOCiYHw@zacax395.localdomain>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <YUSzKxZwW8C29dLV@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YUSzKxZwW8C29dLV@phenom.ffwll.local>
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

On 21/09/17 05:24PM, Daniel Vetter wrote:
>
> Can we at least replace those with drm_modeset_lock_all_ctx and delete
> drm_modeset_lock_all? That would be really nice goal to make sure these
> don't spread further.

I just checked and turns out no one else is using "drm_modeset_lock_all()"
anymore.

The only reference is the definition of the function itself, which I did not
remove because it was being EXPORT_SYMBOL'ed and I was not sure whether it could
be removed or not (to prevent breaking third party modules maybe?)

The same goes true for its sibling "dmr_modeset_unlock_all()".

But if you give me the green light I'll remove both of them right away :)

