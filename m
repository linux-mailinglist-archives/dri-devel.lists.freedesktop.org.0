Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02959410172
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 00:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985426E0CA;
	Fri, 17 Sep 2021 22:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423AF6E0C4;
 Fri, 17 Sep 2021 22:41:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 5AF182B0092E;
 Fri, 17 Sep 2021 18:41:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 17 Sep 2021 18:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=pbWS3mhStDO/vyfrIneJKdNr84W
 uoAjNdq5ZOc04Za4=; b=R8fDp2teNWIc+9ikwj5txBoV5lhAWSQU6/iSCmma86O
 opfL0jI4+of4PDSWIjSyki8qMKiVE3OHQOz1LCNTIkgxzQfM1Y6aDZtAOIJtNljb
 1drMJ2FRRPRbzhA0NmDn2z9VkFqeokVQjsB7ewCJX0CAQjTeAaS4By7Nj362ryTx
 Q0X4l3uHnJXTYdQOGzjKEcyGsgp7syMPBOQz4Z9Np3uf5PEuqpws29hmXSUkXOeB
 rca2RsPnCVEI61CjgsqmQH9MLaH+F91MCixiNiz5taxERa9qLMhZiNpOjoTAfbwU
 m8A0Q5JqNrdGRA4q3/bD8o/aCeqOfwsXlb59GcaJAhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pbWS3m
 hStDO/vyfrIneJKdNr84WuoAjNdq5ZOc04Za4=; b=JXFFoS+mDQKTy8VX0SIVLE
 4fLTLmt5IRKDFNVntUlBenpRUmKW6gIBK4g6T+7nKj/XXmyYPHcGWrH0ylQ8HSi8
 haVVIIn+wc2nGuKqkDTe2qkgDYfMh0/Yilo7llo4Vlt+nwZLYPorywKI/asRWNKB
 TT5U77VXBf/+rFNMRyz0GMta3In3hvCh1OGAtOlqcB9PauMVDDB7UhP455/zxIJX
 WxpRXWvGZOGfqPoMkMtuAMv6heOIi5AqRFZ1adiBatXdXS232F3/RvLWCl0mCsz6
 7djJoWpEPD3tFYE6a6eqljZtrsPV4gv1lHhl85RNd3tZvnwvMX0Al+hbLhbR8msQ
 ==
X-ME-Sender: <xms:pRlFYWkN3Y86lJehngIUJMv8N3DsXfxJsExnM98X1FZHk7Pr6xL0_g>
 <xme:pRlFYd0n7Y3SRx1vdAhpY6TWJvfY43wNQKULJQmuT-61pHe5odEI5c18rbwPRZokM
 r_ZStpINuTl0SoQ9A>
X-ME-Received: <xmr:pRlFYUrf5tykLUPrLgbYl5ltRSUTjmyMjaWEKm_daBVJZAc-ereo6WBqvm0Db_9G_kevC3PM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehjedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpefhvghrnhgr
 nhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrghtth
 gvrhhnpedvjeeifeelhfetiefhhfdthfefkefhhfeutdetvdfgvefgveefheffgfekjeef
 heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
 gvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:pRlFYan6BMTB8bczto6iNLZJ9_CAJqj6r2lc-MsHHyDru8iR-bP4lQ>
 <xmx:pRlFYU1UYs097VZt9TDFMtb0jFRrc6dB_8OszxctSeKclpdrQ0YvJw>
 <xmx:pRlFYRuvfcg4z7gYodUX88Pk3CqzHSEtzld19zdEbu0NnwLwEfmajg>
 <xmx:phlFYawX4uBRwiPKMsppvrKWIoqVgfccCswWszRW5lYAQe2bL9CmPK00F8M>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Sep 2021 18:41:38 -0400 (EDT)
Date: Sat, 18 Sep 2021 00:41:35 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 11/15] drm/msm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <YUUZn4gcQB/aGZCk@zacax395.localdomain>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-12-greenfoo@u92.eu>
 <20210917154250.GL2515@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210917154250.GL2515@art_vandelay>
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

> >  	int i, out_width;
> > +	int ret;
> 
> Please put ret with i & out_width

Done!


> > -	drm_modeset_unlock_all(crtc->dev);
> > +	DRM_MODESET_LOCK_ALL_END(crtc->dev, ctx, ret);
> >  
> >  	return 0;
> 
> Return ret here

Done!
