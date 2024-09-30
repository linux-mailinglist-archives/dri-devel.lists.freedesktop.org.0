Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2D498AEB1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 22:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABC210E12F;
	Mon, 30 Sep 2024 20:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="vYnzjgDf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="g/tDmJaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback2.i.mail.ru (fallback2.i.mail.ru [79.137.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E13610E12F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 20:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=eB29JtlsHjhVvHnx+pcGQPtAc7wpfme/nwcJRyj2I3E=; 
 t=1727729403;x=1727819403; 
 b=vYnzjgDfREi18QbOcwUBJXBJ6KsdtHr2D0caCbXzF/NHTVOi/1OeVD0VWTGTyd2FVTCPFAR90FzL5/f0qEv8xi6oyW1y4OBQWoL/YESN1NA1aSxO/1g+/ZyGIYSAwKBiybvT+PACQCV9vnOkaZAsEo/YrfaA1hZmfkZD+uV/hfo=;
Received: from [10.12.4.4] (port=40340 helo=smtp16.i.mail.ru)
 by fallback2.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1svMxE-000FL0-0V; Mon, 30 Sep 2024 23:25:12 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=eB29JtlsHjhVvHnx+pcGQPtAc7wpfme/nwcJRyj2I3E=; t=1727727912; x=1727817912; 
 b=g/tDmJaM/hiJItbJk+WKkk8apd+505xas3Qkiz89+IY1uhuvNjC664Fpf/LT4UlJ0WZJXL/MoyR
 /6O5777LXXAta0BmgBLJel1dLYQFX3Fhdfeg1lFHwC39aP3TJ0m5NLSHKtpiXfRx+7wLI46G5BSIo
 Oj32iDFBaROKX3VrGzI=;
Received: by exim-smtp-69fb954d46-6fqd6 with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1svMww-00000000HGp-3IF7; Mon, 30 Sep 2024 23:24:55 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, adrian@travitia.xyz, degdagmohamed@gmail.com,
 linux@mainlining.org, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v3 0/2] Add Samsung AMS639RQ08 panel support
Date: Mon, 30 Sep 2024 23:24:46 +0300
Message-ID: <20240930202448.188051-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD964E86F54238FCC39C3784A4327226DB3819A5FA7125B1930182A05F5380850403B9362816B6F46E33DE06ABAFEAF670592BCB6CB7EB6A6801C5DC97C387795A570620434C0A4BCCF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AD2F2D6F6013FF7FC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE75263010198C72082EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36206E5B6CC72E505B4A8E081920376F909FD42FC85D2B00CFA471835C12D1D9774AD6D5ED66289B5259CC434672EE6371117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7ABB305BD10C6E5099FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE7BCF6856210B26C42D32BA5DBAC0009BE395957E7521B51C2330BD67F2E7D9AF1090A508E0FED62991661749BA6B97735ABD590C9C6A374A6CD04E86FAF290E2DB606B96278B59C421DD303D21008E29813377AFFFEAFD269176DF2183F8FC7C056E33EBA9EC0A35D68655334FD4449CB26055571C92BF10FCE5475246E174218D5E8D9A59859A8B6EB4D44AFC205D51D089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A579BF5C0F0A45CFCD5002B1117B3ED696143590F355A774FEC66B2B37046EC955823CB91A9FED034534781492E4B8EEAD69BF13FED57427F1C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF80880810C07507E0344D3823C1D04A7DF54DB47C94A1D58AFE166049F1FC8F93698455FC0CD9C182A06F21331F7F71AF7A55F5C4D5B3B2B5DAB1623086507E5B434F79741C29DD4E0D035775BAD7A4FF02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXgdAFNAgs695iSfrzhpT1Bf
X-Mailru-Sender: 0A26D9779F8DDEAB5292BC5C4A2F20933E72752B4F29A4B9B951B70A5BD4BD8EE96F85FC93FE546849EBE2174CCC9479210985D6C440852E55B4A2144138A88088F510C62CFD139357C462056C5AD9112068022A3E05D37EB4A721A3011E896F
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4CB1E8E83197BFF8464E828B268E23EA2B83D8C6643CBE5E468F3CF0E9FE49B6959AB7659C5DDE2DE0E2D885F6E84AF1907855D3478A187770B6EFB612D32F868
X-7FA49CB5: 0D63561A33F958A5892510C71E9B0216F2A5BDCDF8A52466E4437CF7B4A7BD2E8941B15DA834481FA18204E546F3947C2A2A42EA92AE1E8FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370EB3F966903511E7389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C39B1AFFD6BD8BDD3135872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojNqGc3Zc5qMlOb9TWM7amOw==
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
analysis of the downstream DTS, this driver should be fully compatible with
the sdm710-xiaomi-pyxis (unfortunately not tested) without requiring any
modifications.

Changes in v3:
- Switch to mipi_dsi wrapped functions in patch 2
- Switch to devm_regulator_bulk_get_const in patch 2
(Based on patches from Neil Armstrong)
- Link to v2:
https://lore.kernel.org/all/20240612083405.15750-1-danila@jiaxyga.com/

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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Jens Reidel <adrian@travitia.xyz>
Cc: Degdag Mohamed <degdagmohamed@gmail.com>
Cc: linux@mainlining.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Danila Tikhonov (2):
  dt-bindings: display: panel: Add Samsung AMS639RQ08
  drm/panel: Add Samsung AMS639RQ08 panel driver

 .../display/panel/samsung,ams639rq08.yaml     |  80 +++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams639rq08.c  | 329 ++++++++++++++++++
 4 files changed, 419 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c

-- 
2.46.1

