Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC272D0728
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 21:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C7989F85;
	Sun,  6 Dec 2020 20:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A370989F85
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 20:52:16 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 693F8804EF;
 Sun,  6 Dec 2020 21:52:12 +0100 (CET)
Date: Sun, 6 Dec 2020 21:52:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 02/13] video: fbdev: core: Fix kernel-doc warnings in
 fbmon + fb_notify
Message-ID: <20201206205132.GA1869030@ravnborg.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-3-sam@ravnborg.org>
 <0fb6ff8b-bea3-c5bc-0d37-8a5fdab41abc@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fb6ff8b-bea3-c5bc-0d37-8a5fdab41abc@infradead.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=hD80L64hAAAA:8 a=crRib1yXDS5m8vWqQdEA:9 a=6yl3AuPvxnofhKU7:21
 a=UF2XOXkvibLTi7r4:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Gustavo A R Silva <gustavoars@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Peter Jones <pjones@redhat.com>,
 Lee Jones <lee.jones@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy.

On Sun, Dec 06, 2020 at 11:37:17AM -0800, Randy Dunlap wrote:
> On 12/6/20 11:02 AM, Sam Ravnborg wrote:
> > Fix kernel-doc warnings reported when using W=1
> > 
> > v2:
> >   - Improve subject (Lee)
> > 
> > v3:
> >   - Add RETURNS documentation (Thomas)
> 
> Hi Sam,
> 
> Yes, RETURNS: will work. It just looks like any kernel-doc section name,
> such as Context: or Note:.
> However, the documented format for return info is "Return:".
> (see Documentation/doc-guide/kernel-doc.rst)
OK, like this?
I did not fix any existing uses of RETURNS, thats for another patch.

	Sam

commit 03b7c3ecf7cb51b5429ca0ef58a32bb4dc486610
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Sat Nov 28 23:40:49 2020 +0100

    video: fbdev: core: Fix kernel-doc warnings in fbmon + fb_notify
    
    Fix kernel-doc warnings reported when using W=1
    
    v2:
      - Improve subject (Lee)
    
    v3:
      - Add RETURNS documentation (Thomas)
    
    v4:
      - Use Return: not RETURNS (Randy)
    
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
    Cc: Lee Jones <lee.jones@linaro.org>
    Cc: Sam Ravnborg <sam@ravnborg.org>
    Cc: Randy Dunlap <rdunlap@infradead.org>
    Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
    Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
    Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>

diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev/core/fb_notify.c
index 74c2da528884..10e3b9a74adc 100644
--- a/drivers/video/fbdev/core/fb_notify.c
+++ b/drivers/video/fbdev/core/fb_notify.c
@@ -19,6 +19,8 @@ static BLOCKING_NOTIFIER_HEAD(fb_notifier_list);
 /**
  *	fb_register_client - register a client notifier
  *	@nb: notifier block to callback on events
+ *
+ *	Return: 0 on success, negative error code on failure.
  */
 int fb_register_client(struct notifier_block *nb)
 {
@@ -29,6 +31,8 @@ EXPORT_SYMBOL(fb_register_client);
 /**
  *	fb_unregister_client - unregister a client notifier
  *	@nb: notifier block to callback on events
+ *
+ *	Return: 0 on success, negative error code on failure.
  */
 int fb_unregister_client(struct notifier_block *nb)
 {
@@ -38,7 +42,10 @@ EXPORT_SYMBOL(fb_unregister_client);
 
 /**
  * fb_notifier_call_chain - notify clients of fb_events
+ * @val: value passed to callback
+ * @v: pointer passed to callback
  *
+ * Return: The return value of the last notifier function
  */
 int fb_notifier_call_chain(unsigned long val, void *v)
 {
diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 1bf82dbc9e3c..b0e690f41025 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -605,6 +605,7 @@ static void get_detailed_timing(unsigned char *block,
  * fb_create_modedb - create video mode database
  * @edid: EDID data
  * @dbsize: database size
+ * @specs: monitor specifications, may be NULL
  *
  * RETURNS: struct fb_videomode, @dbsize contains length of database
  *
@@ -1100,7 +1101,6 @@ static u32 fb_get_hblank_by_hfreq(u32 hfreq, u32 xres)
  *                                    2 * M
  *        M = 300;
  *        C = 30;
-
  */
 static u32 fb_get_hblank_by_dclk(u32 dclk, u32 xres)
 {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
