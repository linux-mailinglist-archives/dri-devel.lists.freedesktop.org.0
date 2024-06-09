Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1793D90182C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 22:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E0E10E292;
	Sun,  9 Jun 2024 20:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="lMJlQJRF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="l89tmy8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1313 seconds by postgrey-1.36 at gabe;
 Sun, 09 Jun 2024 20:58:33 UTC
Received: from fallback20.i.mail.ru (fallback20.i.mail.ru [79.137.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CE610E292
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 20:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=jUWmlcuePUdDpLeFLBVk04U0i/kUraSxOcG7isSSgqE=; 
 t=1717966713;x=1718056713; 
 b=lMJlQJRFJLYq/s9UpM5EESQLfaS82tjQb8CVlAg+WBANUh3sHcbE5yRPKVOTF9PD0nZfZeQl8pbDrXwirgb3ZAlmI8G2ywxshQoL5CjO3ImhSH7NIA4pmHt0bXBzCWFWc9BRF9ShXMbLNMbuFYZm+53VXZcZzr3V4kmRc2PYriU=;
Received: from [10.12.4.20] (port=39844 helo=smtp44.i.mail.ru)
 by fallback20.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1sGPHJ-004H9z-OB; Sun, 09 Jun 2024 23:36:38 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=jUWmlcuePUdDpLeFLBVk04U0i/kUraSxOcG7isSSgqE=; t=1717965397; x=1718055397; 
 b=l89tmy8hGitYlk07wsyGA5u+Z5LGCOw9MGxqlRzAi2eaY/qbGnvFKFV7l9t+g+Vb8AnsdY/H8Aq
 z2ozTUnA7/8NpoXukGVM3YEsHIVbmbwDz6KUEfmX8DadyA0BZIM3pRWqfXiD6hIqYy+J1YNdbRbpO
 UPFILqDyF6GW88JpATg=;
Received: by smtp44.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sGPH3-00000004YbQ-1IfB; Sun, 09 Jun 2024 23:36:22 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, adrian@travitia.xyz, degdagmohamed@gmail.com,
 Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 0/2] Add Samsung AMS639RQ08 panel support
Date: Sun,  9 Jun 2024 23:36:16 +0300
Message-ID: <20240609203618.49413-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD948651DF6EBC8E8B2F3C2019B50ED79272429E8323770A69B182A05F538085040E5603F6EAF513856D4FF92D56319F197448DE2AD3994A7427A4D2F7B2508D394E9977CD5C7BA570D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AD2F2D6F6013FF7FC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE716FAD50E497B9C14EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36E96DE96AC6DA6F4C9DA7AAB3940AEFA454139C8A3DDBDD54A471835C12D1D9774AD6D5ED66289B5278DA827A17800CE77E7E81EEA8A9722B8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6BAA8CD687FCDB2EBCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C22496010E6B77066451176E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8BBB75ECA0EAB52AE83AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FCAE9A1BBD95851C5BE2021AF6380DFAD18AA50765F7900637D64787C5AB2E18C322CA9DD8327EE4931B544F03EFBC4D572219AA581D1B0840C4224003CC83647689D4C264860C145E
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A54B00A8D2ECC013395002B1117B3ED69620828F57A5254853406406D89DD9EB8A823CB91A9FED034534781492E4B8EEADB30A456A8F293845C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3810E75B5F9F66C566EAE38DF7B5FCEACE2C6BC6BB304F9A2C929CB36D555B4CF49F51687F14C9B80FD6CD3E887ECC32579C634A4CDAACC5AE15ADD81BFA704D04A08754E2C765E00D035775BAD7A4FF02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXhO6DXcrkr0XTfOtWPCGr3S
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949817A795F5C603EFD0C57FFD5DAF71AD12C93539627FE5850417DE40CF728D4966F2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4B653A1001F6F75E45D3E182DE990518462D9B15B91B4BA89B647ED114AB003ACCE0692C6BF09384D96B65AA5C4D7215703338A50BFA905CDF8EEC2ADE53719C2
X-7FA49CB5: 0D63561A33F958A5D2136437802185CAC7FF20794776412D35C53782351F85508941B15DA834481FA18204E546F3947C3A8EB65318B1979EF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637C3957E6FF5665BA9389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3B95D3BAC42CD083E35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj6D5zjHqYKv0VnfguqaVuAQ==
X-Mailru-MI: 8000000000000800
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

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
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

