Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9582F4917
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 11:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661AD6E49D;
	Wed, 13 Jan 2021 10:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31146E49C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 10:59:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 383A023441;
 Wed, 13 Jan 2021 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610535570;
 bh=YW4QjGYFsbAuui1Vift+SPuhkkmUUaZythToMJo1+vw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OyRNuc2fpe0Hj3u2FvUgrww9G6rTIjDEsi0ww87FsoxfQMGZ0M3HZSlEM0J73t73Q
 J/fYjXEZdqw1dVE0T0O2ethPSuAg8raN6fmokKnAMpoRhiwfvrmrV8/kvWCi5NpLN3
 GpXR1aJ2DC/BEykKU6+8pM2W7Sm/sXjlwZctGJ0LU0tjxZ3MrBvRCZwy+hmRMhCL4l
 lr0lebDfK1kVO6cM+Omx1g8PQ3/EUm2oa/R3vYENYDe3gKvzmm+tL5FQMd0cKYOg7y
 8DqNep3l1QmHAJ/vw5rrUhaH17PCGPG5mujVaKfEGdUscb7a/TgjAD/viwLxu1nEez
 DsXtqSUj1jlCA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzds7-00DpGl-QQ; Wed, 13 Jan 2021 11:59:27 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 20/24] ASoC: audio-graph-card: update audio-graph-card.yaml
 reference
Date: Wed, 13 Jan 2021 11:59:21 +0100
Message-Id: <8a779e6b9644d19c5d77b382059f6ccf9781434d.1610535350.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610535349.git.mchehab+huawei@kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changeset 97198614f6c3 ("ASoC: audio-graph-card: switch to yaml base Documentation")
renamed: Documentation/devicetree/bindings/sound/audio-graph-card.txt
to: Documentation/devicetree/bindings/sound/audio-graph-card.yaml.

Update its cross-reference accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/devicetree/bindings/display/bridge/sii902x.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/sii902x.txt b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
index 02c21b584741..3bc760cc31cb 100644
--- a/Documentation/devicetree/bindings/display/bridge/sii902x.txt
+++ b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
@@ -40,7 +40,7 @@ Optional properties:
 	documents on how to describe the way the sii902x device is
 	connected to the rest of the audio system:
 	Documentation/devicetree/bindings/sound/simple-card.yaml
-	Documentation/devicetree/bindings/sound/audio-graph-card.txt
+	Documentation/devicetree/bindings/sound/audio-graph-card.yaml
 	Note: In case of the audio-graph-card binding the used port
 	index should be 3.
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
