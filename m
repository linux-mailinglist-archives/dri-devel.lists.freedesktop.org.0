Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7DA904E37
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 10:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C08210E172;
	Wed, 12 Jun 2024 08:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="KW1JCUmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp16.i.mail.ru (smtp16.i.mail.ru [95.163.41.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1471C10E172
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=GuQ81fTkMRIY0atJKwPaJnvGDv9qxeWjTfqqZS4y/iA=; t=1718181255; x=1718271255; 
 b=KW1JCUmFSoQouBYGXwVZcFu0FvUSN97ywwk8iMYsg2otNF4S9kORppLdz6UB5F15lAuHEfUkmTX
 +NQWIoLSVQxz/8uLUWjCy/KBHyuu5p6vXoxcM5SODWvwkd6RtBeMKGRhWhuGaW/K4oMgOIPFyYcLu
 MGe82D9gcW/ICtfHVaw=;
Received: by smtp16.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sHJQo-00000006Iqv-3d0W; Wed, 12 Jun 2024 11:34:11 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, adrian@travitia.xyz, degdagmohamed@gmail.com,
 Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2 0/2] Add Samsung AMS639RQ08 panel support
Date: Wed, 12 Jun 2024 11:34:03 +0300
Message-ID: <20240612083405.15750-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp16.i.mail.ru;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA3396D26EA105C0471DE01117BA8131F700894C459B0CD1B9E79C384F1F30C83F87FE86DE270AD9EEA4A1F4B85C60E69618367D251A7F91BD19B76541BFBA1C79
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77E216A0E97507353EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637317AD06F2A8D0AEF8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A46F48011BC6724D05E8BD7C2AB4DD119CCCEEB49829CA9CCC7F00164DA146DAFE8445B8C89999728AA50765F79006375FFD5C25497261569FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C37EF884183F8E4D67117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF1BD1948763FFC2C2BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B60B49535A5146D2F676E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249957A4DEDD2346B42E827F84554CEF50127C277FBC8AE2E8B8C7ADC89C2F0B2A5AAAE862A0553A39223F8577A6DFFEA7C1156E5889A6D309143847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5179ACBE3032FE9605002B1117B3ED696E2B3889CEF698B471A1B8FE1FED62FE8823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFF5C205EE376A2128B5713E058F120AAA612D997E63082794271130B3895FEC35B268D298D11CBB1A04A26A3878DC133060A1B52F2758568A1DB24A82BF7F4F225F8ED8E497EAF3530D035775BAD7A4FF02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7p5wIdCuWKPL/RwwGig6OQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981B214AC7FA6C301648BD48BD36611AD34AF4E7B71C5FCD9D11CEEFA1C7950CE112C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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

This series adds Samsung AMS639RQ08 panel support used in:
- Xiaomi Mi 9 Lite / CC9 (sdm710-xiaomi-pyxis)
- Xiaomi Mi 9T / Redmi K20 (sm7150-xiaomi-davinci)
- Xiaomi Mi 9T Pro / Redmi K20 Pro (sm8150-xiaomi-raphael)

Was tested on sm7150-xiaomi-davinci and sm8150-xiaomi-raphael. Based on my
analysis of the downstream DTS, this driver should be fully compatible with the
sdm710-xiaomi-pyxis (unfortunately not tested) without requiring any
modifications.

Changes in v2:
- Drop the extra '|' symbol in the description block of patch 1 (Krzysztof)
- Relocate the additionalProperties section after the "required:" block in
patch 1 (Krzysztof)
- Add Krzysztof's R-b tag to patch 1
- Swap the descriptions for vsn and vsp supply in patch 1
- Add Neil's R-b tag to patch 2
- Link to v1:
https://lore.kernel.org/all/20240609203618.49413-1-danila@jiaxyga.com/

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Jens Reidel <adrian@travitia.xyz>
Cc: Degdag Mohamed <degdagmohamed@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Danila Tikhonov (2):
  dt-bindings: display: panel: Add Samsung AMS639RQ08
  drm/panel: Add Samsung AMS639RQ08 panel driver

 .../display/panel/samsung,ams639rq08.yaml     |  80 ++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams639rq08.c  | 362 ++++++++++++++++++
 4 files changed, 452 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c

-- 
2.45.2

