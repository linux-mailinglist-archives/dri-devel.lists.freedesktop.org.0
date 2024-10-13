Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A113199BBFD
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 23:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A533B10E22E;
	Sun, 13 Oct 2024 21:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="0LW0I28t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="TqyKREel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655CD10E22E
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 21:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=DJsoerbn2g9YnhOA+aAVi/ROcgeH/2vbVJReRJZRy0M=; 
 t=1728854666;x=1728944666; 
 b=0LW0I28tcUKUK32pgidhq9LjwaR61xU165HEg4XlBW7gl38WrtbBXAt/wOzOTxOa86kbAarK3wqxxZO59F5o4SL0I9sQoXTY1cAYP3R7KvhrD8mQLeQa0Du5BUeRaYimJu4eQY6H5bJp3gkL9EZLQD8hO+lYlsf76DTpsHrdkgM=;
Received: from [10.113.254.35] (port=55274 helo=smtp46.i.mail.ru)
 by fallback24.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1t064e-00CSOB-AR; Mon, 14 Oct 2024 00:24:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=DJsoerbn2g9YnhOA+aAVi/ROcgeH/2vbVJReRJZRy0M=; t=1728854664; x=1728944664; 
 b=TqyKREelPumxFR0urMFbvaXlGYk9g9yUEvFP3sPKZchW0T1ShNJ7Nj9PBC5qA4hz2EaWgoZT9oU
 OoPuKAkEbLqdNNwDiqHQhRX/uE/BCuMA0l943WDewkVBjHCccnRVieQYZFKn+iMRx1caeyWSsfqo9
 NJsP53nK6frA6ce/Mus=;
Received: by exim-smtp-57f79c7799-ff99r with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1t064M-00000000ArH-0rF3; Mon, 14 Oct 2024 00:24:08 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@mainlining.org, danila@jiaxyga.com
Subject: [PATCH 0/2] Add Samsung AMS581VF01 panel support
Date: Mon, 14 Oct 2024 00:24:00 +0300
Message-ID: <20241013212402.15624-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9B01871A0ED523BBFF2944416096D9CA3AE14DD4C63332AA4182A05F53808504013DD3176E971EEAA3DE06ABAFEAF67056BC648B22CFE4DC16FE32FC68D7A26215E6CE7239E2C5700
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70CB15FA6C489297DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637040380BD28C1B15C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8EC40544D673B9D93B209FDF25BDF1A94320F95A1A5734699CC7F00164DA146DAFE8445B8C89999728AA50765F7900637F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637BA939FD1B3BAB99B389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F79006374DE940E1D5066CFBD32BA5DBAC0009BE395957E7521B51C2330BD67F2E7D9AF1090A508E0FED6299176DF2183F8FC7C028765F5520A300B2B3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE140C956E756FBB7A2E808ACE2090B5E1725E5C173C3A84C3D6B8D1F75A55B56D75ECD9A6C639B01B78DA827A17800CE7DBBA001AFC1C4016731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A581E5C18D857CD09F5002B1117B3ED696151D57D9E149EAF803803A57F48E4E5A823CB91A9FED034534781492E4B8EEAD05E80F4396618BB2C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF831D47FB02EB9A09BFDF06F2C0A4555CDFBFAD9B7E637E2BA4B00099E5EAAFC086260C86DC1AF1467C85317C21026A4916A324304D278F70E9F78341A6FF8F0F2B26EEB1B55DE588457F7985AD47CF5C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXh4Yk9t5uvvwexZDSZUiMG1
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981D35572ECED80C0D408AF9BFB128101EEF65C61FAEF2CAEDAECD8E3C9D15857412C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B42DA9BE0E4F7CCE4C920C9969AF7F7D50DA10E0C0C57A2ACB049FFFDB7839CE9E3928B87FA8A99B4499D9CF92E70DFBBC20C89EA2BDA1295B54D21228237775D6
X-7FA49CB5: 0D63561A33F958A5CA61BECD78F80F474B52209FD31D9DB26365B2346D0CB40A8941B15DA834481FA18204E546F3947C27087801AC92D1FAF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E86CBEAED33ED63B389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3D8B0ABA717EF295735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojTJ02HBIKT7IGXOCpeSUWww==
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

This patch series adds support for the Samsung AMS581VF01 panel, used in
the Google Pixel 4a (sm7150-google-sunfish). Unlike many other devices,
which may use different panels in various revisions, the Pixel 4a has only
one possible panel option. Also this panel is not used in other devices.
Testing has been done by me.

The driver initializes the panel in normal mode (High Brightness Mode and
Brightness Dimming are disabled). High Brightness Mode and Brightness
Dimming are not supported yet.

In the downstream device tree, the panel is named as
"dsi-panel-sofef01-1080p-cmd".

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
Cc: linux@mainlining.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Danila Tikhonov (2):
  dt-bindings: display: panel: Add Samsung AMS581VF01
  drm/panel: Add Samsung AMS581VF01 panel driver

 .../display/panel/samsung,ams581vf01.yaml     |  79 +++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams581vf01.c  | 283 ++++++++++++++++++
 4 files changed, 372 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c

-- 
2.47.0

