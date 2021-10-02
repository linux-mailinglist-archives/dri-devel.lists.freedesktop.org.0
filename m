Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B75F41FE7A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 00:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BB26F465;
	Sat,  2 Oct 2021 22:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37C56F465;
 Sat,  2 Oct 2021 22:32:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id BEC3D580812;
 Sat,  2 Oct 2021 18:32:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 02 Oct 2021 18:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=feVIX2W/iu7IBNGFg1YLLfvKn4A
 Iy1omyC/w57V7Wug=; b=ovzWw3hIbQCcGYWWfpO5bqetBoj8fYi4cU/uzea2qvO
 Os2rrnreQKdvey22GdkFqYmTqVwHJlz6/KQlAp2Z8mQbRrcVVGS0RhHbrp1axmS1
 T4FNGBRIC6VRRFUJMyPMA1yIs4iwF9On1Bqrg0StKz63ldd8P4gi0modAY16sbNX
 WOnmsvjUWgOf1EVFXdUONhdRS4d570TW/OoyrKXXmebjiEw+1j8fLm+ljv907z9t
 CIOzD86mMLeHbUi80OMHKQWQ8a2BTeJqaaCtNR9LBUJzmUq7awJMWepSCUordAjM
 ngdvij4dTKC2HxgnXfPCiotEibBAe0PNcQega9F7pqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=feVIX2
 W/iu7IBNGFg1YLLfvKn4AIy1omyC/w57V7Wug=; b=YMRGtjh8b6/uHXJHbSLqIN
 XkvnsOT7+fKkqo5MsyQdt9QElTwpFnNH7NZDiZLXzSXOS6FBDZrF/soSknUPTps7
 cSX/90+DSQd2xC8HCoXyBNUteJevzWwv9zGF6tVIfUiERM5LrxOfobmziR9FM4T0
 mLSPpj+5dA82NtTLbKYT3qLKVZAaZg0+5PRAHUA/IWgXUESWEo1fpoaeLWYr8All
 JpIncHLyYWJxtXR3Pqqqab9/qf/YQ861tur8Ji253I3WZ1vgqVr7s70Rik3/dyCs
 ITXmHAKFXd63QFz77+qvRhy+dIxMO6LWM6al1XMqrbbo7nzjVZHNbj/Kf3X0AxUg
 ==
X-ME-Sender: <xms:Bd5YYVrkc8p0swSo4xEZCdl3rsDWQNqeVIZdmhP6Wf4caAa16nuybQ>
 <xme:Bd5YYXoybymUuSKmzHwxRHKymivMUvij6JnRtsZIZZVpo68liJZ5TGtJ4Vua42s3h
 LbwxpfrPkAuPzM3xA>
X-ME-Received: <xmr:Bd5YYSNyitcnLvWu6_RcSwzRBf9mTNYHl30tfrNj1m3MO1-0de2gr9vj-JbxHL1gJia4r6Hs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekledgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpefhvghrnhgr
 nhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrghtth
 gvrhhnpedvjeeifeelhfetiefhhfdthfefkefhhfeutdetvdfgvefgveefheffgfekjeef
 heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
 gvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:Bd5YYQ53pf_AP7qMCUlDCqgVT7w95ls-2nvB6UhjKENlMbZ5WDSaxg>
 <xmx:Bd5YYU4JlqPHutlqQe1xw7mwVg9baVMFebyytWihVAutD_bPZs0x9A>
 <xmx:Bd5YYYimDCwEr_h0ImYBRvk71nWMA2_Ffonah7m0LdYM5in_bm1rRA>
 <xmx:Bt5YYRyL6bw7ctESdJ47OvY4c654oRJOS64QLo3qvUcb6D6jGOtaqA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Oct 2021 18:32:32 -0400 (EDT)
Date: Sun, 3 Oct 2021 00:32:14 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v2 00/17] drm: cleanup: Use
 DRM_MODESET_LOCK_ALL_* helpers where possible
Message-ID: <YVjd7hLKtYG2bkY7@zacax395.localdomain>
References: <20210924064324.229457-1-greenfoo@u92.eu>
 <20211001183655.GW2515@art_vandelay> <YVda4jNSGuQf50JV@intel.com>
 <20211001204815.GA2515@art_vandelay> <YVeGOyLzuhN7zzV7@intel.com>
 <YVfEWaLfYWdhezCa@intel.com>
 <YVgGklsHT5fkavDL@zacax395.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YVgGklsHT5fkavDL@zacax395.localdomain>
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

On 21/10/02 09:13AM, Fernando Ramos wrote:
> 
> Sean, could you revert the whole patch series? I'll have a deeper look into the
> patch set and come up with a v3 where all these issues will be addressed.
> 

Hi Sean,

I now understand the nature of the issue that caused the problem with i915 and
have proceed to remove the global context structure (which revealed a similar
issue in the amdgpu driver).

I have prepared a V3 version of the patch set where these issues should
hopefully be fixed for both the i915 and amdgpu drivers.

In order to prevent causing more disruption, could you tell me what the proper
way to proceed would be? In particular:

  1. Is there any place where I can push my changes so that they are tested
     on a i915 machine? (Some type of automated pool)

  2. I can test the amdgpu driver on my machine but, what about all the other
     architectures? What is the standard procedure? Should I simply publish V3
     and wait for feedback from the different vendors? (I would hate to cause a
     simular situation again)

  3. Should I post V3 on top of drm-next or drm-misc-next?

Thanks for your patience :)
