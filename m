Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE736ACECF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 21:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019E910E456;
	Mon,  6 Mar 2023 20:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2212 seconds by postgrey-1.36 at gabe;
 Mon, 06 Mar 2023 12:06:10 UTC
Received: from fallback18.i.mail.ru (fallback18.i.mail.ru [79.137.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8C10E2E2;
 Mon,  6 Mar 2023 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=h4VGDoBsgspJTdXbCO7qW1b7WGjbWxU1wQ/lWinoSAg=; 
 t=1678104370;x=1678194370; 
 b=TQt5dH8iNEP+ztSDwEPnjT9VCfgIcSQSbzGCIwavRFUIQ3dJb1e/vBuCNvPNaJKU5D1r5t1v2T9hKPYkzpL89FslynicThDGsjAV+6W0/1ZbGf0d2hvqlsZeEHgcuwBUbyBZjGGV9mInjm4HbYUTa2n+WO2eLn9L9SaLa3CQ8ga6+REdsVPYkfe3kn0banTe3Nhxhq5J+BU1JaXNmmiSqt54pFGRvk084s4kxNbtx2vHk2ZuGqWZ56FVq1IeUePehbxQ9K53Vqcae1v6sB/6x2a4VhMpy9QydGneb7uxIPvmjj4sb3/3Xgu8WZ1OYGcMgTksQphSdzrcCh/pkTLg0g==;
Received: from [10.12.4.13] (port=37126 helo=smtp38.i.mail.ru)
 by fallback18.i.mail.ru with esmtp (envelope-from <listdansp@mail.ru>)
 id 1pZ91n-00F3Q2-OQ; Mon, 06 Mar 2023 14:29:15 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=h4VGDoBsgspJTdXbCO7qW1b7WGjbWxU1wQ/lWinoSAg=; 
 t=1678102155;x=1678192155; 
 b=KDV6nmbexfHzVoxjnMW7ElvGyq0AQcMFwvfCe4UQHfCeHEP+CDlGin33bZjd8S+dJNxLbre9E6pJ9Tu+6m+jip32QTBn5BqFagGZKtO/uY3B6LPQigqyMWTV3/yEiNnfNTfWT/ISgnHlBwfc23IFl5xYn+2bp6jX7lAsWCrelT6q/gwlr88NFQ8dwKYY/9mJHmhJwE2aHiH+3M1UQTMuuWw4WhgkeRcBO03sDjHOJ7kn/TlyASO6K3nw8R4nlQ0WB776TU8mO+DGO1LY//29rfvL+fEJ/ovWRBPMJr5G2VJj3F7MF3rq7fZCrMu0tIKGH8ahMKWH1tECxFaYj4iB5Q==;
Received: by smtp38.i.mail.ru with esmtpa (envelope-from <listdansp@mail.ru>)
 id 1pZ91c-00FgqB-9M; Mon, 06 Mar 2023 14:29:04 +0300
From: Danila Chernetsov <listdansp@mail.ru>
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] drm/amd/display: remove an unnecessary NULL check
Date: Mon,  6 Mar 2023 11:28:24 +0000
Message-Id: <20230306112824.8049-1-listdansp@mail.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9BCEC41593EBD8357C44FF2494EBC845BD7AEF656CFC8618A182A05F5380850407AAAB7044E02CB9B414A6F5C01DD568A1464148261DD8DAB87349C382CCD176E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77BF46084C0059042EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CE17C7754E00FC028638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B016A246DDE16CE6CE9C66B9EF8B9FEF6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7212612128AA291179FA2833FD35BB23D9E625A9149C048EE3F735096452955E3C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BD77DF2741F6D7EBCA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCE93681558A2C9BD03AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063720748F29B94A53BDD81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FE3CA985283E39ABD6D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A549E2961E890F56F30BEA83F3CBBF9969DE678A5BD2C0A5E74EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF505830FD47C92F6C63
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34EC58E35A639A24717EF9FFCB2582C4CE9685E1A881FD599AF437D96B6782AAB28FA5DE920320117D1D7E09C32AA3244C03A6BB35BA37848FCB5D409686E6C48C853296C06374E60298DBA7662A2C9987
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojo8yGo04U2e24zAj8bFTDMA==
X-Mailru-Sender: 4CE1109FD677D2770147F6A9E21DCA7BAAB1B1B66B3222840ED6C1C441B85F206115718EBCD968C67E3C9C7AF06D9E7B78274A4A9E9E44FD3C3897ABF9FF211DE8284E426C7B2D9A5FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4BD2EB812D5A6E5F7D3C1BE093F4DBF3EB2D947066E19A99D049FFFDB7839CE9E8A9D5799ED9E1A2444D8461CACA1603EE94E99B57B1F40A8A4D66971C28B3C74
X-7FA49CB5: 0D63561A33F958A59C14BF51AC7C436FBB2F4EF9A83765FF9435D9682D80C156CACD7DF95DA8FC8BD5E8D9A59859A8B6A096F61ED9298604
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdAc2jUOxWGfxps9h1Uf8DGQ==
X-Mailru-MI: 800
X-Mras: Ok
X-Mailman-Approved-At: Mon, 06 Mar 2023 20:03:52 +0000
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
Cc: lvc-project@linuxtesting.org, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danila Chernetsov <listdansp@mail.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'pipe' can't be NULL because it points to an element of array.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixed: 7cf2c840c6b5 (drm/amd/display: Commit validation set from state)
Signed-off-by: Danila Chernetsov <listdansp@mail.ru>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 0cb8d1f934d1..d3b850372eb3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1854,7 +1854,7 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
 		for (k = 0; k < MAX_PIPES; k++) {
 			pipe = &context->res_ctx.pipe_ctx[k];
 
-			for (l = 0 ; pipe && l < context->stream_count; l++)  {
+			for (l = 0 ; l < context->stream_count; l++)  {
 				if (context->streams[l] &&
 					context->streams[l] == pipe->stream &&
 					dc->hwss.setup_stereo)
-- 
2.25.1

