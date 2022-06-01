Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F61C539E04
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 09:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA447112FE0;
	Wed,  1 Jun 2022 07:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A048C112F1B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 05:18:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7545F5C0274;
 Wed,  1 Jun 2022 01:18:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 01 Jun 2022 01:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxfierke.com;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1654060699; x=
 1654147099; bh=pI2TcS/GmuulEBu78AzfEuLsiwDtXdWOlXoLgPUsA54=; b=G
 NAtkN2cM02tzTOF992U9jXAj5RzKGaT1ZXjHmxxVFdoKHpt3iSNQWSafX47b14OX
 zEg5GWISs96nwnigNb7UHovnziOBiQ6wWqE9iolYozKn5TXHt0ALv6r8J8QlKfgK
 Jt8vQh+MT9LPOfqVa5ix/L9NgcS/fnRb5H+QECIJw52iyGlgl54IlgeHdA1cXXzm
 JFwPOMb/st2eEuZYNXOq5dqsXl+CchiDg9dTwN8Rh4L9ZDgLJOl31EcmGRb1mSsy
 y0bEO/SdP3vd6qcZMjq2XUE3YXrPztsy/XErkTBJxj3GzRh1qI+de1tv1xhTZ+SH
 2uGPoT0y/3qeLxqJoT6Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654060699; x=1654147099; bh=pI2TcS/GmuulE
 Bu78AzfEuLsiwDtXdWOlXoLgPUsA54=; b=Lwc6Xw0wuN0U2+7pOqgxv06xZjuzQ
 wmwsYGcyOGdIQkkvTz+ap8txuUwgtBEP4Qjs1itV+l/BzDjPFVpiqEHQEyU0HTLV
 jakzLPqhE1IfP/RUy0UNNGL2id+Tzsa3YkeC4/HnjeeoCXDrNhzGdfRNK5rLiP4S
 YCt1pmW3SZYI+9DcM4gCyxejiNclJRFiJMM2z+7oahMAorCBkH4i7AwLjdDko0Jr
 ZqrAUcU11W7nxPIitwyXFT9mqtKpSTXaJtEFSCVxHo6b5OCfXeinV6F74RxWISv1
 OvHRF7O3hali3y+kcXdEOorvMeIjAf7t7WOktYyw0LHcHVULEQTTdXHMQ==
X-ME-Sender: <xms:m_aWYtG346RN6GWfXkGF7TPLtY9lLRgwwOSCBq2tlNdjT6ZFDXPvhw>
 <xme:m_aWYiUmvcbq7-gCkiNu9bJzuhCtE0szi5-d_6Q-dL66OVcaU-zE1Y7IKXIhSxdjp
 U39VLJirNmxrLOBldw>
X-ME-Received: <xmr:m_aWYvLTSsbxB5ZOljD7fvU0NWDVBYY7ptMG42qYwIlg5s0LPp0uI87kqsQM_P2V37TcuNUtgZ-wObibhR22fq28ix1Vbddf-1n9OMRMI0vB2QE6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeelgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepofgrgicuhfhivghrkhgvuceomhgrgiesmhgrgihfihgvrhhk
 vgdrtghomheqnecuggftrfgrthhtvghrnhepudelvedvtdffhfeugfelieevvedvhefgve
 dtteefkeevvdfhieekudeuteefgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepmhgrgiesmhgrgihfihgvrhhkvgdrtghomh
X-ME-Proxy: <xmx:m_aWYjEWQyxdn5tKe62J1UoIpOpwpsSt7Muu8NOWtzjSDeLa4w9ZQA>
 <xmx:m_aWYjU98E2rYgn-RfdFCM13GbizdUmqZTS9MW1Tx_oxHxYIvDT8xQ>
 <xmx:m_aWYuNJCuo1kfQzTaS3Nv6PEvOOgMQGRSrhuB8gpdh8Gdyk5qrM-Q>
 <xmx:m_aWYsue5bC_RwBlE0vVSZTr0MV6eAYQVWnFyc66q-sC7auaTR9dGQ>
Feedback-ID: idee9475d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jun 2022 01:18:18 -0400 (EDT)
From: Max Fierke <max@maxfierke.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add prefix for ClockworkPi
Date: Wed,  1 Jun 2022 00:17:46 -0500
Message-Id: <20220601051748.1305450-2-max@maxfierke.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601051748.1305450-1-max@maxfierke.com>
References: <20220601051748.1305450-1-max@maxfierke.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Jun 2022 07:19:08 +0000
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
Cc: devicetree@vger.kernel.org, Max Fierke <max@maxfierke.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a prefix for Clockwork Tech LLC, known as ClockworkPi. They
produce a number of hobbyist devices, including the ClockworkPi
DevTerm and GameShell.

Signed-off-by: Max Fierke <max@maxfierke.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 79b72e370ade..9546d8320224 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -251,6 +251,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^clockworkpi,.*":
+    description: Clockwork Tech LLC
   "^cloudengines,.*":
     description: Cloud Engines, Inc.
   "^cnm,.*":
-- 
2.36.1

