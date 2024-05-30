Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A92C8D5462
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 23:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27D210E02E;
	Thu, 30 May 2024 21:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="dtgYkDTq";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="NXPO7gDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5780E10E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 21:14:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 8E72F13800F4;
 Thu, 30 May 2024 17:14:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 30 May 2024 17:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm1; t=1717103675; x=1717190075; bh=Zzi71YbFys
 WiU+Kq+K7h/c+IcUB1IZI3WMw81hw1D1I=; b=dtgYkDTqlkDln9YDEy99WF61Dl
 WOxu5VzXWWXRn+2/QI4rM6KuTMIzVddIRiUcp2YY001yMcVuajfNOLLTaMiDSW0M
 6pW8lpCvbwLi5FRAnz6To/RGy8G+c1s2S00wzVyVAFB+90tIVY6zQmki7tqb/OpM
 PTAh6o/9Wcg7MtR9uOFgqQerLWJLNw0X+vrftWxUgURZlCVQD1Xgt/uPL62jZKsJ
 P8EQ/0w9FqpDEiZM2DdRw4sOfpbQMqG438TRb8atOoJeep2aR4nZhsIOxCSw4T2J
 giom1IFIgYYvICC+QNlbxXX/ortMr2Ahwh5gnAjbnd+DCk5RDymbvtgh3Oag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1717103675; x=1717190075; bh=Zzi71YbFysWiU+Kq+K7h/c+IcUB1
 IZI3WMw81hw1D1I=; b=NXPO7gDlmOZ8SO7s67vz+5qTkv4ovvrM7rRMsgA4KZta
 jD0ZDZcKOYyqAcYBO2DWzuUcyA2N2fah678YBk/AOyt0x+AM0V8JOiC4yxzmh5wB
 ZSmHRsJueFGCQBH04zsTCxi6eVcpGMrASFbjfz5G+BkHonycnBCRxLEDfU4R1Sqb
 QMhjo73SkJClQ6mouBG1KukjPFKh+2BigbF8/LPAK4wyp9zSd9A/RJZeU3nuol6F
 ZXIrLqvayoN7PJwoLDCPVWaH0p7huLC9v043Hu9APDB/S5wo2MD3dfu/UN01c0yq
 jQl8qFOh0cbFzF1n2L0fZKWVSq8LSoYX4wx7f0I3jA==
X-ME-Sender: <xms:O-xYZoDwRrlJkntokFx6rirAx6SLdStaVih9twy9AV0QSyU0aX13ag>
 <xme:O-xYZqiCPZ3PoWJdmob1U3q_LJFqWyUCIh3LhUMngAn-bEg8uivofwTy6UrOtveJ2
 i3LKbVmrMvYAVgwag>
X-ME-Received: <xmr:O-xYZrnp01D3pGVhiQztZ-dhBmsyFTBp3qLi7fjlkHMPWh_lZMhG3Enr0BlraKmwLEp6cQ5Oaj4YI3ydlE_0CSf4Cdly2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekgedgudehiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepuddvueduueegtdeuffetveevgeehhedvhfefudduveekgffgfedtheegtefh
 hfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:O-xYZuwlpvcgAWy9YG9TlgLzNVCODCbSvj4Q1GSmF4e-Hybfa-wzuA>
 <xmx:O-xYZtTxo5FCe3-_LhaH8Rc-ZYX3gOpi1XNvelxdd09Gav7hC_Qr6Q>
 <xmx:O-xYZpYLaZaTXgqc2SGleIFMMzNEWHwb70ECts14NuWl3LZTpMUlog>
 <xmx:O-xYZmRECKDTEZ3Pf7Uw4hVJxNDEtN-exStP_099b57oAG_g7c9o8A>
 <xmx:O-xYZuLUETn-l9fc4Cu0LdDjIJcwalPbXRmJWdGokIqN7sdYn1X4aIHz>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 May 2024 17:14:26 -0400 (EDT)
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
 Chris Morgan <macroalpha82@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 0/2] Add WL-355608-A8 panel
Date: Fri, 31 May 2024 09:12:12 +1200
Message-ID: <20240530211415.44201-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.1
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

Hello,

V3 of this patch with further cleanup to DT binding example code and whitespace fixes in driver code. No functional change from V2.

Original cover below.
--

The WL_355608_A8 panel is a VGA LCD display with an NV3052C-compatible driver IC, used in a number of Anbernic handheld gaming devices. This patch adds a device tree binding, and support for the display timings and init sequence to the NV3052C SPI/RGB driver.

Regards,

Ryan

Ryan Walklin (2):
  dt-bindings: display: panel: Add WL-355608-A8 panel
  drm: panel: nv3052c: Add WL-355608-A8 panel

 .../bindings/display/panel/wl-355608-a8.yaml  |  60 +++++
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 225 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml

-- 
2.45.1

