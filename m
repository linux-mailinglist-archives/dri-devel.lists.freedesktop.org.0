Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7D817D3A4
	for <lists+dri-devel@lfdr.de>; Sun,  8 Mar 2020 12:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5156E297;
	Sun,  8 Mar 2020 11:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F72D6E297
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 11:50:30 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w1so7001142ljh.5
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 04:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AshgBR+MNWPZr69cg7ExJ3jWOPxd+MrMBUeiIC3Ic2I=;
 b=PK6an+PvHILt1iKzlYwWRFsPanyhDLYN54MTzbZqqzI8kZs15kYFb+wvgb0Okxo/7T
 29onyL5aRWiMBZGwyfyVyCiBKZ0dBI3yFedFkCG3qwLF5veRJx8QUq5Wd6dkNZ+bC4VU
 zxQG2Q5XwkXMLCdci8EGX7x2vej3aZrR2frQCuMJH1W4lyNC0ZivWev6yJXSe0rs/D8/
 CgFpAOi1yaE/ncdi+zlO7XHqpkKhCR/uWq3NMM1PamYDaHGDL9QpK+7aFhprq6I++HHc
 eC1AyoEF4Am79O4f59F8LuXQbc9IAy5VHVxNjy95NSkZgBgUxudATkpVjpBtR3LFmQxK
 MzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AshgBR+MNWPZr69cg7ExJ3jWOPxd+MrMBUeiIC3Ic2I=;
 b=Gr8GRow1mvDtivqyAsbfbnDG0YzeXUg+q43YTT1JGqU6bCt9POUOKrQ6GY9i99L75j
 vOgnLXaSa5WzPafRfxz/ZFlOktz6nSyLgkcJ+G6PTKJi956PQwMLUhvNxoLl72MiAUuw
 yqhqnxP8dARBNVOA5RmwP6MOc6ryRPDFq92iHU74M3WImRz9VyCW5RlzmD/lwpZIpewf
 sXde4lTf0YnfoHEYAR38Gtu3g3D1yDiNC3S/ZUfy/0VjENX6bZRnCmdR3vF7p59Z4r7P
 PFwyYOeOVgKEKqkViMv2M/r21Rs70N1uxz8va6RppRg61GDucrxlQ+nlnh2JSJwb60QN
 mp9g==
X-Gm-Message-State: ANhLgQ23/J5pMDQqwNTc/9GjAAUUPP5JDpuoYLfyYEXtxR3kQQe+dpvX
 RTdszeJyGxjHBHojvru8GNc=
X-Google-Smtp-Source: ADFU+vtqO/9fQA8QV3nrZp9fnmzE88QnN1xvqj1h89hr+K/XaXgxAjp3YEzdVwWAbaOfHMsTHYuKCw==
X-Received: by 2002:a2e:9243:: with SMTP id v3mr6780274ljg.159.1583668228335; 
 Sun, 08 Mar 2020 04:50:28 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u5sm8557572ljl.75.2020.03.08.04.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 04:50:27 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 0/1]: dt-bindings: display: fix panel warnings
Date: Sun,  8 Mar 2020 12:50:16 +0100
Message-Id: <20200308115017.18563-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While experiemnting with latest kbuild changes for DT Schema
support there was a couple a new warnings - in may use-case where
I only check one binding file.

Fix the warnings in display/panel/
There are plenty more to go after in other directories, which I
have left for others to have fun with.

Patch is on top of drm-misc-next, where it will be applied once acked/reviewed.

	Sam

Sam Ravnborg (1):
      dt-bindings: display: fix panel warnings

 Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml   | 2 +-
 .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml       | 2 +-
 Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml  | 4 ++--
 .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml         | 2 +-
 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml        | 2 +-
 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 +-
 Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml  | 2 +-
 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml         | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
