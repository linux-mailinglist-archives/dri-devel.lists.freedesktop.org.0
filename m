Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB90D4E23FE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 11:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC22910E35B;
	Mon, 21 Mar 2022 10:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C7C10E35B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 10:08:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C1795C00AE;
 Mon, 21 Mar 2022 06:08:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 21 Mar 2022 06:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=eGm/TDAKWR9gB6
 qeL5NuXRWdV2zLT7cuC8efFho3L64=; b=BMhrlv3TPU3J+SoautP3PQCBAPOg9B
 Ex1pQAgTVi1gmeXybG3F59+DZgOiHDEHbmae4xIKG5FcN+rQ5j2QwsKYsvcLj7G9
 VA8oiOhFPZO1f5Ea7mTVN5UdLfPS76kcpFSjvXRE7/ptm/mCGo13s0lahGbdEJDf
 flAhs4RREdqjULHhA7swGiRkR8iB8FmNMwDYrxHFEdj95dbSnGS+8gXTYJCy9bii
 5mL7EoYWMVp5wBtGLr1ZulsnIXvVqejwBMpoFawW8szMaUV4MGZ3GPrYsuEpN7/8
 1DmLDEKaYQtcMJoOwaEzYtGbQf8i5qcoMM85S/yKaXlTjkIQW4FTS97Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=eGm/TDAKWR9gB6qeL5NuXRWdV2zLT7cuC8efFho3L
 64=; b=NaKmnZEbjrsJlkj97GNMR7PoSZC714cy/Z43hG9yiRsGeFVSRvXyhlqBR
 GEXVuoPo09ofAf+Q4cwD0Ero7/+WVQ7wGU8MwtrH8g2n0rOyEfwui2ws5x5Vr3/E
 rKkePB3OdL+FOKwjSSIzQaHuu5BfXg4N3CmftxXwPELdQc4CDNiqSGjnTUAV3E2a
 VLxzQgDcZuhgXhlXFLMUjsq4PpfGK0tD/txywiPTqJLocbVgi1nRhPzBROfMVqWC
 qss2/8wc/tEhvd82miP51e9rI5p0WMyKVTxQ0RFi7ntziueOADTnIgbDBockY0Rp
 +4c2jCeIpxGp1ZXB/Hxka1ldgtfvg==
X-ME-Sender: <xms:kU44Yt4c3G7MZpXTdz9w83wJrocdYBqyuDtCeF1nZfkK-dAcmnhPKQ>
 <xme:kU44Yq7aRV6HQZ718LJB2Az6GIq-sDTZLpriu4lN7cSpL0h-KxpK4ihPmp6eRMcaR
 uxCJIe0QmhNBZVx2I0>
X-ME-Received: <xmr:kU44YkfI_lnzo0qnWyB29lnVfBVCF0s1b65aa9ioFnwsdu8aLT1t7Df9iF0wLz70SJBqEqnujcC3Itgt88hTBhk5rfl9attLih3k7UU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kU44YmJ8wrFTIv7Xyj3CpQYswfH8oBMcmASouJ1zi14K7ZcOLy0Yqg>
 <xmx:kU44YhLGKk6_HawEq0mklYpbYTFibgGwvvSRB6VRKMp1Ku1TAmK_vQ>
 <xmx:kU44YvwdqWsreN7rSSmfuEJJeiqlPrcagoDYe8THRiCM4uDYZMYsDg>
 <xmx:kU44Yo9QHG9oMMNjk5wvZKrtv7BQaC07vSv8qynBZKBaarMOUOVJqA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 06:08:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Nathan Chancellor <nathan@kernel.org>
Subject: Re: (subset) [PATCH] drm/selftest: plane_helper: Put test structures
 in static storage
Date: Mon, 21 Mar 2022 11:08:13 +0100
Message-Id: <164785728829.358708.8611957447198268317.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302235909.784935-1-nathan@kernel.org>
References: <20220302235909.784935-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Claudio Suarez <cssk@net-c.es>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Mar 2022 16:59:09 -0700, Nathan Chancellor wrote:
> Clang warns on certain 32-bit architectures:
> 
>   drivers/gpu/drm/selftests/test-drm_plane_helper.c:76:5: warning: stack frame size (1064) exceeds limit (1024) in 'igt_check_plane_state' [-Wframe-larger-than]
>   int igt_check_plane_state(void *ignored)
>       ^
>   1 warning generated.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next-fixes).

Thanks!
Maxime
