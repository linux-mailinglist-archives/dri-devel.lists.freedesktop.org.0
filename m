Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BB21715E0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 12:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994146EC91;
	Thu, 27 Feb 2020 11:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 574 seconds by postgrey-1.36 at gabe;
 Thu, 27 Feb 2020 11:25:32 UTC
Received: from mx01-muc.bfs.de (mx01-muc.bfs.de [193.174.230.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816AD6EC91
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 11:25:32 +0000 (UTC)
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
 by mx01-muc.bfs.de (Postfix) with ESMTPS id E1BCE20342;
 Thu, 27 Feb 2020 12:15:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901; 
 t=1582802155;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PSPfkAcD4QDEe9iSfKSFzw4oTZNpL0r5C0vE0nEBfi8=;
 b=hZTek6b2Y4HMl5mxHAmJ4zxsXbSz4FzU8KeGrX18+sHYSvU2k5tt2oM0qYHB6psoEXGHFq
 Uho6MeghLCDarNitxYByWjE2JP2spLWNKY0P6iWggFJHne8qpiCnbqoZuxx8sJvyUTRsUV
 p0Syd7KVDaU3JtvOgkHmu1xUd8mrvTt6c67MW7fXuwtKRtXS/Ssk2ZVbY9BhmrnvcQAvFh
 LYSSifQCD2THJP5f4u+Rn2Vwo5g4uv9EkTRAKlNWpFuwzWwCxc1sjscHUiwQ9Hixv0Ab5t
 wic11wWremaDuctMTYuKnhuouxIcK/5FO69d6XQ18rHZbFwDbQFxjUqwJiodow==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Thu, 27 Feb
 2020 12:15:55 +0100
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.1913.005; Thu, 27 Feb 2020 12:15:55 +0100
From: Walter Harms <wharms@bfs.de>
To: Colin King <colin.king@canonical.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han
 <jingoohan1@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, 
 Gyungoh Yoo <jack.yoo@skyworksinc.com>, Bryan Wu <cooloney@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: AW: [PATCH][V2] backlight: sky81452: insure while loop does not allow
 negative array indexing
Thread-Topic: [PATCH][V2] backlight: sky81452: insure while loop does not
 allow negative array indexing
Thread-Index: AQHV7N8n5fHjoG7xokCkDx0n/hJSlagu4ztb
Date: Thu, 27 Feb 2020 11:15:55 +0000
Message-ID: <cb14e57edc1c4f3a81b0aef6f1099b9c@bfs.de>
References: <20200226195826.6567-1-colin.king@canonical.com>
In-Reply-To: <20200226195826.6567-1-colin.king@canonical.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.39]
MIME-Version: 1.0
X-Spam-Status: No, score=-2.99
Authentication-Results: mx01-muc.bfs.de
X-Spamd-Result: default: False [-2.99 / 7.00]; ARC_NA(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; HAS_XOIP(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; NEURAL_HAM(-0.00)[-0.990,0];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-2.99)[99.98%]
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi all,
i would suggest converting this in to a more common for() loop.
Programmers are bad in counting backwards. that kind of bug is 
common.

re,
 wh
________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kernel.org> im Auftrag von Colin King <colin.king@canonical.com>
Gesendet: Mittwoch, 26. Februar 2020 20:58
An: Lee Jones; Daniel Thompson; Jingoo Han; Bartlomiej Zolnierkiewicz; Gyungoh Yoo; Bryan Wu; dri-devel@lists.freedesktop.org; linux-fbdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Betreff: [PATCH][V2] backlight: sky81452: insure while loop does not allow negative array indexing

From: Colin Ian King <colin.king@canonical.com>

In the unlikely event that num_entry is zero, the while loop
pre-decrements num_entry to cause negative array indexing into the
array sources. Fix this by iterating only if num_entry >= 0.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: f705806c9f35 ("backlight: Add support Skyworks SKY81452 backlight driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: fix typo in commit subject line

---
 drivers/video/backlight/sky81452-backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index 2355f00f5773..f456930ce78e 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -200,7 +200,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
                }

                pdata->enable = 0;
-               while (--num_entry)
+               while (--num_entry >= 0)
                        pdata->enable |= (1 << sources[num_entry]);
 
              int i;
                for(i=0;i<num_entry;i++)
                         pdata->enable |= (1 << sources[i]);

        }

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
