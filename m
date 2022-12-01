Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469763ED76
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDE410E5A3;
	Thu,  1 Dec 2022 10:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D1A10E5A3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 10:18:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8557F5C0187;
 Thu,  1 Dec 2022 05:18:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 05:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669889898; x=
 1669976298; bh=MWSrBvl/UW9ZbSLAN/MFFkSUKxOl0WiQ6KDpmIUnOcI=; b=F
 fsQ+eQ/DDHPOrCYgluPVVPoQtj1DFKMS4TB2JqujnYdwY6e1FFXWnhXHef8awEbn
 O01Psl8oYuSjwRy9LeARJ589EzPxVhpzYdH5PzemXRjS5JUWlQ8BIdqw1oneqbsZ
 3PyZauRHzTDSBPomBI1GZKEtHn/dLGFVyXW/x6/KRGivaTlDn6TRhZ6ZOVRxoDk/
 qyDFjnjWBIZsA/fPgb+1dV6/EL6TWIY5PkMFpg0tb+5LS283f1dQpAccfAsCPhGt
 ccvf+f6HXysWPl5MqwSX08US6Tnzouo32dqnRnNz2W2AwN4CWbAVlu/HVb5iluQ1
 Ozcr4J+maEoqpWdA+di9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669889898; x=
 1669976298; bh=MWSrBvl/UW9ZbSLAN/MFFkSUKxOl0WiQ6KDpmIUnOcI=; b=d
 RjpnAbRSK7pS58wduLTPLGDFjRFytIEH7uvF6L3OBeV4ZH2RBxv1U1vx8FNLebCe
 cyqiI2X6EEchvlHRnkq1ODw6JCQJViletEYijpbFiX14BclDgAR0+wvnLnfnWiuK
 jBv7Wvp003OMTdvVOR78NgDi/PKZnGKYNVqWO2oK+pAIGLWbw7cHOnnZG+1xOd+j
 JZrUL05lYa4gp34c5I/9YcRdYEe1pSmgqZXytf4naft02rdfFOimsaf/bRXabJn8
 WnX1gk5NcuRArkvfz1Q4SNISj9nti7GGEhRDZSkN2SOwi+7PpO9Oa2yEay9yotLL
 XOjNZzKWMbzf7aTJBy/5w==
X-ME-Sender: <xms:an-IY5ttoqb8i00ZTYdRTcX35BhG86cFczsFl4j7VUn8QveUjkAkZg>
 <xme:an-IYycJfJ4hx82odTf7UirMAHvftCHyb4TW8Zx5j7m6fKtig66TVX705Z72-A4XA
 BBLrkJ7x0P9-2MIH4I>
X-ME-Received: <xmr:an-IY8xHXSROwEKOEG9068iULJaUbbsL-p0dcw5MDKiFqAZKjIBqt24l3jtjilmYy5cC6tIf3sTSIDCCmxZ5mb4R9aMFOxaBLx-BVYsChLNo5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:an-IYwNGLKfZf1iXwqDWMfQxp7gwDXGfhdZ4jb6Zo1vGZ-WPDgXhag>
 <xmx:an-IY59FyFWDfLf6l4cwpIs4iUccrU0Pyw7ihfep0Xb8FOPFdKm74g>
 <xmx:an-IYwUbTQbrNO2ptuvLE4mcEyLDLS2gkP2Tom7WFLOEtuGScRzyXA>
 <xmx:an-IY8UI8rZSEekM6NxSWAA75IaqQLgUhhT1E6uagXHTnhOPIRLaeQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 05:18:17 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] drm/tests: probe_helper: Fix unitialized variable
Date: Thu,  1 Dec 2022 11:18:10 +0100
Message-Id: <166988985776.410916.4574339381986293754.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201090736.290935-1-maxime@cerno.tech>
References: <20221201090736.290935-1-maxime@cerno.tech>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 1 Dec 2022 10:07:36 +0100, Maxime Ripard wrote:
> The len variable is used while uninitialized. Initialize it.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
