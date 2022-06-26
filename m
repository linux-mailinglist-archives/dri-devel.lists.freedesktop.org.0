Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEBA55B33D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 19:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD7310EBC1;
	Sun, 26 Jun 2022 17:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94DF10E947
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 02:01:46 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EBFD0320051E;
 Sat, 25 Jun 2022 22:01:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 25 Jun 2022 22:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=davidreaver.com;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1656208903; x=1656295303; bh=cwUPUl+OA5
 T721UciMEMKWal2tgSsfaKw5bHf2WB2Bg=; b=Vrpc7VzWm2Is2FrgPWUh3oJS2J
 TZJVavr+Qi6w1BZCAlOfZK0eqOF3MUmo5XOzo1+k4iT6NGaAN3JjlNmG6RNWMVjR
 qGB+VkJ29f59nQWCkVNsjJr1bBLjVlLRnfh7+db3+l9nls8AgGXqkizaT/9gla4C
 ddfz18H/brNWgEm+jhlEbbyTvAiQiuxlt90oqOqrxRH0GZE31lfCds3cNjDtXM+T
 lpxl/90/dHUnhsYlB3SCjFlHKJWvz7iseJzcAg/yxIo2vlv5pdNDR6xnByYbWxtN
 /SH9NXmpuVf+iARsjhTFFbD7F5FdDUFwpo+e+7SlyCLDzzK3FjPu6CpJZ4Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1656208903; x=1656295303; bh=cwUPUl+OA5T721UciMEMKWal2tgSsfaKw5b
 Hf2WB2Bg=; b=TrG7REjbLp2fryMdS/mOHTnncpwaYqBmKRy37t0AfUoLN1Jg+cJ
 uSu5slr8Iz6hB9p4JnCkDjspCWxWv2lnf7Rg4BazRzOdsB5lGukCGrUWvMmyTqsQ
 wxp1dlWvkh0+ETBME+LQmEqPnA9RMJ4Tm8vD+O++aIEf1aI0YwrxmDLwDNxp0N+n
 o7OOFT2jWBKwQIEr8TaYkEVlFx4vpguR52Oop3iztQMWDlYggj+PNMrtkhVVbGPd
 tc/uAZ55++6nnAHJ8bV+fv5yakL/K3at2Cz9t/+uB1cu686rfBfkdpt+tGth3eWH
 OzPS6imxzeKjNJ6TiXFGFPexUDUMaVr1kTQ==
X-ME-Sender: <xms:B763Yq9OQrv6n8E7W63sBoJchrjPUsAy0u1A_mu2x-jG350sab1DXA>
 <xme:B763YqvWNuHmKgjFB6p6o26CEXQamp6Dj4LrWWGI7erMAghkRHTW4iz_4FEHDFALW
 fWCcoVQkfss0g9_Ia0>
X-ME-Received: <xmr:B763YgBhO1C58QCCn73wPUCGPODUyeegxFsCRBlki5jTCAXxC3Ig_GPiQkkf-5usRb7T6x7jPa60sUBpHdQrquICHu4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegvddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgrvhhiugcu
 tfgvrghvvghruceomhgvsegurghvihgurhgvrghvvghrrdgtohhmqeenucggtffrrghtth
 gvrhhnpedvvdeifeelgefgfedtjedtffehueeiffehjeeggfffjeevudeuueegteekheej
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
 esuggrvhhiughrvggrvhgvrhdrtghomh
X-ME-Proxy: <xmx:B763Yie5UTOKJwsSWtrkaiz3lY32BISJ5r8VIp3j7vwZAY-PShk7jQ>
 <xmx:B763YvOjXAS7Cq88-NSIAlud4Dv9S79OaC-Fa76e58W7YNvEMWJkSg>
 <xmx:B763Ysm8qHXV9HscF4kkuKoUVvmnpJb4JTviY9e5aiboPVtXCtRpJw>
 <xmx:B763YkoAMKpMtSWGfHBQRRWlaR3yLGXVKwX_i4UuANR4vGcrAJbWFQ>
Feedback-ID: i67e946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 22:01:41 -0400 (EDT)
From: David Reaver <me@davidreaver.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: fbtft: fix alignment should match open parenthesis
Date: Sat, 25 Jun 2022 19:00:02 -0700
Message-Id: <20220626020002.1577101-1-me@davidreaver.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Jun 2022 17:47:58 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 David Reaver <me@davidreaver.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix alignment of this line of code with the previous parenthesis, as
suggested by checkpatch.pl:

  $ ./scripts/checkpatch.pl -f drivers/staging/fbtft/fb_tinylcd.c
  CHECK: Alignment should match open parenthesis
  #41: FILE: drivers/staging/fbtft/fb_tinylcd.c:41:
  +       write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
  +                      0x00, 0x35, 0x33, 0x00, 0x00, 0x00);

Signed-off-by: David Reaver <me@davidreaver.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..60cda57bcb33 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	udelay(250);
