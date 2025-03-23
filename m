Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E1A6D0A5
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 19:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB5E10E160;
	Sun, 23 Mar 2025 18:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mail.ru header.i=@mail.ru header.b="SSzbJc0R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="cBBAekPA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="omDm0SJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback23.i.mail.ru (fallback23.i.mail.ru [79.137.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17FC10E160
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=enRdOwzdzHPi6bszjCuT/F6jj3XrHxNc9XrgbnkSZRo=; 
 t=1742756279;x=1742846279; 
 b=SSzbJc0RZJM2/2mMCimO3rNUBhH/PxFxz+uY0XewVzR9XxQGJZpTu+Xl0UrWaUnKj10EE04EXvoRIlCgJ3jnM0O/h/dVHBP4GqOd+9Ru+40jZNBOIebD2TbtZDW2WzPpcY6CXJIEJRJs4skT11RF0W6p0qvZ00wNWUmye7tm9q8Xifu3dB3bI6ZkzKHR9Mfxv9eJwYHFyB+v7+He2I0QlC0iFPa9XPl14Ko+8uO++aoAZb3up7fu45Ox78MxTogiSFFlyvFZyKfNsgMpgvOExSRlgIhjLofzIxEC2UrTek3s4WCu0VBBH/ntJopcRLXxebbf1fAHwsloO9cTwsLw5w==;
Received: from [10.113.177.82] (port=57044 helo=send262.i.mail.ru)
 by fallback23.i.mail.ru with esmtp (envelope-from <listdansp@mail.ru>)
 id 1twQWC-00EpDt-Td; Sun, 23 Mar 2025 21:57:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=enRdOwzdzHPi6bszjCuT/F6jj3XrHxNc9XrgbnkSZRo=; t=1742756276; x=1742846276; 
 b=cBBAekPAQAygyrxNWyIC+Vccby4A/15WW4je8APE/nwsIS5IlYSTgkuTfk0UI7+DFEGvMYGUJ0Y
 HJ5wqSHTJ8UTjJWZ09cBnpl6XAXcFLvKqLqr0z9aQ7OTFhHRhP19cJgZBUFPoikrFn8zWyLtP0xFj
 2B9WdpV4W8e5X+N/fvjDHYylPO67I12/KbpzK91+KtyeAKON9XcNxhyLNA0AWQsLzMDr4VQhFyuon
 zk/gxypkRlNT0U19mQbPnLlQT43+fPODAOPn/s6yCKhtcHOu8BffTJfsCiUQGpSq9XyxSjd3sdYm2
 C85233SwOg8ulgR2UhAG5gcB2h5ezYpu1uMg==;
Received: from [10.113.185.249] (port=54634 helo=send126.i.mail.ru)
 by exim-fallback-6464776d59-k9sng with esmtp (envelope-from
 <listdansp@mail.ru>)
 id 1twQW4-00000000QOj-1U6J; Sun, 23 Mar 2025 21:57:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=enRdOwzdzHPi6bszjCuT/F6jj3XrHxNc9XrgbnkSZRo=; t=1742756268; x=1742846268; 
 b=omDm0SJdFEEXj6Y+CXyKyf4Aw0MaLjZqLYmSpZiv4rcws8DvrXvwlOLE5Z9pjlqCZf0AjqSAjAA
 U+4oQ2rb510WN7ukZ95cdE/Z8JXNG7s+1fU8k107wLwMaD6vcy+nR/tsnbfMVM1C5ihH8TdSRiC4e
 KGDqamL2pyXxUPtgLjD23iE1VEm6p6DhO7l1u+i5Tm1G1XIw6XFz6H6PkWQNaPJwgcMFs5GF9bUm8
 E7BnzoDBu8fyS0xO8tQjNgYd09d7TwlkA8s5UcvHwQ+E9U6p0IjE14lnZFpQeY94zE+zFKEUW6ZEe
 q8weodXJmsJm3VZmhALYaYPDAaWguWqzcvBg==;
Received: by exim-smtp-75f69ddc6c-x6wgr with esmtpa (envelope-from
 <listdansp@mail.ru>)
 id 1twQVu-00000000Hoy-466x; Sun, 23 Mar 2025 21:57:39 +0300
From: Danila Chernetsov <listdansp@mail.ru>
To: Helge Deller <deller@gmx.de>
Cc: Danila Chernetsov <listdansp@mail.ru>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH] video: fbdev: kyro: Add some geometry checks.
Date: Sun, 23 Mar 2025 18:57:37 +0000
Message-Id: <20250323185737.602339-1-listdansp@mail.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92A53477891B58793825B79BECD38E02E42497B1FF40D587C182A05F538085040EE765B1EEA68409B3DE06ABAFEAF67058A6E3CF6E5E01F8BFAA9F3B359509F8249B610CA6D60D10F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A34C649281B21B01EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375664A2B0A4393176EAA77B2F40198CB27ACFB60C9A2166D956648CCE9848DA6250B8EEF46B7454FC60B9742502CCDD46D0D0CABCCA60F52D7EBF6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249E232F00D8D26902CA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD1828451B159A507268D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EEB28585415E75ADA9F41620B44FB51B7DD8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE362B3BD3CC35DA5886136E347CC761E07C4224003CC836476E2F48590F00D11D6E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F790063717E6A56809D3D6D1EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A587F46D27172A86695002B1117B3ED696844EB587DD887C694A0A47EBA01A636A823CB91A9FED034534781492E4B8EEAD003C2D46C52F18F2C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFD2EF63304466465627E35D2A99788FAFFA12A352F931B06FE8DB7F381BFF43A9486D6DC23143AA0ED556C2DAAA19247F5EB0CB9BADE52277B6F8643E9C2F164303EDA1124073BDCA77C8E16086367389913E6812662D5F2AF72BBD4AC8FF0C4E5649C4772AD793FE964550E41902C4E4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtzKseUyeDnhbAJ4K9bnQ3Bg==
X-Mailru-Sender: F244DC1430FACE5461D0E33575193BA22C7BE48A118D0749B951B70A5BD4BD8E0259DC99F647BA51DE369B216F14D11CC53BD13D3F6EEB2F3DDE9B364B0DF289C95E31D8FCF52BE1594FB4C9F0DBF4120D4ABDE8C577C2ED
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4C75C13076030B6608AF98B5E2C9340ABBE3F2237FD3B192B049FFFDB7839CE9E8EB000FA6B60A7A9F84AF7FD74D637056122DCE773384725D6A2981A42E890C504465C7D8E5080F1
X-7FA49CB5: 0D63561A33F958A5D0F3E1543A8E0B075002B1117B3ED696717A7032D552910775CAC6BD4D76D0B202ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZwShGFTa9ahxLo40IvX34dQ==
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4C75C13076030B6608AF98B5E2C9340AB21EEB097175FBED5049FFFDB7839CE9E8EB000FA6B60A7A91BAD004C7C054933AF2A59B70FE12558B3E78FEF2776E810
X-7FA49CB5: 0D63561A33F958A5F476775C5CA609668EFB79B1D6074E63BB372755940BCE1ECACD7DF95DA8FC8BD5E8D9A59859A8B6A096F61ED9298604
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZwShGFTa9ahw4BIdV5NVlDw==
X-Mailru-MI: 20000000000000800
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

The check protects against division by 0, integer wraparound,
and overflow Start/End window settings.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Danila Chernetsov <listdansp@mail.ru>
---
 drivers/video/fbdev/kyro/fbdev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 08ee8baa79f8..1d5246313d9a 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -378,6 +378,13 @@ static int kyro_dev_overlay_viewport_set(u32 x, u32 y, u32 ulWidth, u32 ulHeight
 	    (x < 2 && ulWidth + 2 == 0))
 		return -EINVAL;
 
+	/* The check protects against division by 0, integer wraparound,
+	 * and overflow Start/End window settings.
+	 */
+	if (x + ulWidth - 1 <= x || y + ulHeight - 1 <= y ||
+	    x + ulWidth - 1 > 65535 || y + ulHeight - 1 > 65535)
+		return -EINVAL;
+
 	/* Stop Ramdac Output */
 	DisableRamdacOutput(deviceInfo.pSTGReg);
 
-- 
2.25.1

