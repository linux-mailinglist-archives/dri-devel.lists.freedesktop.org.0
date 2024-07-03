Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D219258D2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E668810E12D;
	Wed,  3 Jul 2024 10:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="KYvYfsP9";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="fz63JBYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E677A10E12D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:37:20 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.nyi.internal (Postfix) with ESMTP id 2C4101380508;
 Wed,  3 Jul 2024 06:37:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 03 Jul 2024 06:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1720003040; x=1720089440; bh=G6cVu6Mlds
 8QUJjdA1rJyQ1UDV54Q/orV87nudERv2o=; b=KYvYfsP9qoTXs7wdrQlrpsLBpO
 6SBDc+FtsS6A4SWcwZ++SRG5DgjG/27tiPlYcMT3aHkf5XvVlqzTEK+SgBfMd+jC
 fYA5BEDrYV7Kdfhis//b+grhPE7U6MkORmAxiKb2KOG7BsWO+Ax8XyDBLaVzLEhb
 yLxSNOAiH15hMoTiG6uM1dHn0VTgl9Ujjg1W1GAuLYrW48NZTvIaLiLF0dedVuG/
 XQXlCIvg4tHo9BE0mmJrP5IP7AR3shsIdxFTlC+WIbChzxOEqMSUNDxYN4/HmilY
 071DZTqH6evvDP7PpCOnDYbasHmNoX140Abpaf4Q5loKBSG77/u4s6vDqkpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1720003040; x=1720089440; bh=G6cVu6Mlds8QUJjdA1rJyQ1UDV54
 Q/orV87nudERv2o=; b=fz63JBYuxpuYfNc4yiDbRT2evPYlVapX7Ya7rZ4CcqpY
 a5rG9e4GY0Aonq+YrzCyDo7eQKAscOKBLjIi3Qf+o6ObHQzxflByeLIRzt/AfeJH
 DEhRIY6q3vw72DSgwtOhm2N2h4n8du63uAjQ7LsCoAK1TM+ATvGe9ZEl5W/jGou4
 OIQ/SkPNpROwiUdyLTFb/H1xR0LSn6R4UWTTe0e4JkBgBwE8BZSNfPLG5hHzF7RA
 wEtYjjDrC5/E17S+euZymm5y6oY5iBuemTCPzRTbOYCMtp0RDIDfXL5xLowLkeYf
 jEkHMuVCuYXkizUV3UfHs21G9ero/wZmXPKpAdTJkQ==
X-ME-Sender: <xms:3ymFZgTzkBCu1BX8ID3teAFZFei8KSTM_01gR3xvgnfVNjnYEwNakQ>
 <xme:3ymFZtwssw9E6TqzFSHW3x3z6gV-AOuX4Jr_5pciZBC9_hA861Pa_JvGxmikHA881
 bEbTK0Zehoj6MHeug>
X-ME-Received: <xmr:3ymFZt0ZyMOZkwZIRtnTjqyzBg_dDO3unXJwpN64dZMv173JKkT9i1LwM7antdKMd27G0OmGOw2skiloRf40MGjkTF9F76Qr0nGPO6mOOGPUMbnM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
 lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
 hrnhepuddvueduueegtdeuffetveevgeehhedvhfefudduveekgffgfedtheegtefhhfff
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
 hnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:3ymFZkD9Dub9HW1hfmaPZbJdIw_bbE3eNCoxSC7PDmFDI958IJVK1w>
 <xmx:3ymFZpgYLZ9Fs-AgEo7KSjyyzAiX3SRD-BLoehiJCDvUllZRXST66w>
 <xmx:3ymFZgqlUkeNZReC9nUepdysc8JqMjjpqDbaFZ50Ulo6natbB6jhyg>
 <xmx:3ymFZsjSTOLYynN_cKq2QoLfIURNLKBLAe8V40OcZfCTR0_ArsdapQ>
 <xmx:4CmFZoSNDo_mB1krSeDIJWK_ICSpq8qo4KvbxUrL5ywd7AIprn71aHNs>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:37:15 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 0/3] Correct WL-355608-A8 panel compatible
Date: Wed,  3 Jul 2024 22:31:43 +1200
Message-ID: <20240703103710.31169-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

V2 of this patch for this LCD panel used in Anbernic handheld devices, with updated compatible string as agreed, in the format <device vendor>,<component serial>.

Original blurb below:

The previous patch adding support for this panel [1] referred to previously by its serial number only. As discussed after the patch was committed, the preference is to use the integrating device vendor and name in this circumstance.

This series corrects the panel compatible to reflect the vendor (Anbernic, already in the vendor prefix table), updates the NV3052C panel driver with the new compatible, and lastly adds num-chipselects and sck-gpios to the DT binding example, identified by make dt_bindings_check as required for bit-banged SPI over GPIO lines.

Ryan Walklin (3):
  dt-bindings: display: panel: Rename WL-355608-A8 panel
  drm: panel: nv3052c: Correct WL-355608-A8 panel compatible
  dt-bindings: display: panel: correct Anbernic RG35XX panel example

 .../{wl-355608-a8.yaml => anbernic,wl-355608-a8.yaml} | 11 +++++++----
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c       |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/display/panel/{wl-355608-a8.yaml => anbernic,wl-355608-a8.yaml} (76%)

-- 
2.45.2

