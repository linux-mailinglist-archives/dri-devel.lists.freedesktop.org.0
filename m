Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B3255BA26
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 15:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC8310EADA;
	Mon, 27 Jun 2022 13:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F0810EADA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:54:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BC75A5C00E2;
 Mon, 27 Jun 2022 09:54:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 27 Jun 2022 09:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656338050; x=
 1656424450; bh=1sXcaHNvwQI7h/921KKpkJ57L1W6T3uEZqhu2eypuk4=; b=Y
 1Rqf+sdn09yuhpgGcoGAQOLtbdWZhXObj7G352cPvK6Zv/A8gUWMqIpGDb+mzeLV
 C+umACtgrB6SDw6aoklf9H/fW0O/orFLGqOScW+0brUuyxKosOTYE2ATwRLMEjeO
 EmLnD5omUAPddhU6aDH8uvrGb5EEVKmz5P07WTQLpmDL0bHC+JKxC3p6pRz2bdlp
 dEaJmxh+oYaeWkpebqaSAXTUkhffPyVi9RSn4KAEPMGOHMWh5F7e96zi5uu548jv
 n7JoFecCeu786WGpMSVxhjN6zorGzsKHyGG3bUIrAaAIw7bzgJHMc9z18wGvuLAz
 WBnNmaN/E2BUqOEZ1bpIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656338050; x=
 1656424450; bh=1sXcaHNvwQI7h/921KKpkJ57L1W6T3uEZqhu2eypuk4=; b=B
 H/TyUHH1ezf3C1YYRARAykCOmS0g1X15s3YsghCcUSzXT4jv0mxMExzhGIbdcnEp
 XQdLNAlOcGEcNQbX8TjdpGukN9LHL+5Ku6Yy3fVdaoKv3NJzrC2OTXlAOPNOix6V
 5jxqGZLcntfapfw9I1WtcbxEJ2MM9/aaOBvTrFHTrY1WXOKqZatnmuPBrWwGCWW1
 zBDXguS3jFtcVRHbFsJi24h0c5I/RTUbQdZcMaARUdiOSqgWv5TB079uZvjnTWNy
 bWWOgDTQQooFVfe8FeP/51AHyrvT0M2FFioUovqA8h8KvCQcuuNm+LLj54AxWpy3
 0D2W33rwfejCoG/T7uqyg==
X-ME-Sender: <xms:gra5YrJQoWrhSMyhipPApTh159DnzhPYWrTIuBIAY3ioHUKWTxFtwg>
 <xme:gra5YvJjPV3eu-0oSTBsv9oeo8Mx2B8-scQBHma0duclJrE2F2rOxpUazRwpbF_Mv
 SdDUOhudmRRmslymfE>
X-ME-Received: <xmr:gra5YjtSZ9GLN_0fSS1iasxgbEC8FMPlB19NpnTEOPxvyrq4J2-KN5VVLgZyDO3m0fseYS2Z-b4DllOgHP2RKD6JZmJ-G_POhUpbGz8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
 tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeuieeggffhffffieefheduie
 euvdetgeeufeffvefgtedvffehheekffevudefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gra5YkZxJjoTj81ZMP149EWzzjmyF0JOvV2JeXa-59jBo-j9XVa3Ag>
 <xmx:gra5Yibj7qip2CP4izoKjA7X49DC-LWeKpPh2o-2Hjy2IBh0Gcz3Pg>
 <xmx:gra5YoB3uWklatS5FWkSpMEkmtEJtBDiuqaNlU69Dw6DCtN7njw5Yg>
 <xmx:gra5Ypz_S27WTPG59VFkURbnKo7IS-TwNGMlxOgtbhFWSWaSsx-BHg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 09:54:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: maxime@cerno.tech,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH] drm/vc4: perfmon: Fix variable dereferenced
 before check
Date: Mon, 27 Jun 2022 15:54:04 +0200
Message-Id: <165633801994.372965.15433742616843978348.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622080243.22119-1-maxime@cerno.tech>
References: <20220622080243.22119-1-maxime@cerno.tech>
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
Cc: airlied@linux.ie, daniel.vetter@intel.com, dan.carpenter@oracle.com,
 lkp@intel.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Jun 2022 10:02:43 +0200, Maxime Ripard wrote:
> Commit 30f8c74ca9b7 ("drm/vc4: Warn if some v3d code is run on BCM2711")
> introduced a check in vc4_perfmon_get() that dereferences a pointer before
> we checked whether that pointer is valid or not.
> 
> Let's rework that function a bit to do things in the proper order.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
