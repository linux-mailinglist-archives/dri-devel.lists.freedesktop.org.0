Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C757C2D0C34
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D98589F5B;
	Mon,  7 Dec 2020 08:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12BB6E462
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=vIK6m1ctc35l8MtZw4GhuOmmWW9BpzOaMtrZWwhnKPA=; b=cEumralgnwh+jRe12UCsStYlTC
 GVxHJFKjqSEPPiRoIZalVZDp5IvOP6d5ujKsPQdr3iiaisXeEadwX4RNu5XA4y1zvThpKzDs8u2pL
 diPMigE0nSE//QolSNHuO2p1Nrk15gXfEYa9N2ryj5kjac+pU+84jc4lNA4+2vO91IGmrNh9OlwnJ
 6I7TVYIX3Fa6MJKVnh983my10M+Jlu+gvqalhNaunl2+MKsaqO9Z+o7pLfFJ7Xb4cLvncuZ25e6eB
 tcQAmghEQHh+uP7fNPpd0wJ9b99xH5xfAgZeg3name4XYCa3Fp3pJDqaAvFvqPKFHKfv/n8VVYbuY
 jYn86gvw==;
Received: from [2601:1c0:6280:3f0::1494]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klzqZ-0000sq-1R; Sun, 06 Dec 2020 19:37:27 +0000
Subject: Re: [PATCH v3 02/13] video: fbdev: core: Fix kernel-doc warnings in
 fbmon + fb_notify
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-3-sam@ravnborg.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0fb6ff8b-bea3-c5bc-0d37-8a5fdab41abc@infradead.org>
Date: Sun, 6 Dec 2020 11:37:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201206190247.1861316-3-sam@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alexander Klimov <grandmaster@al2klimov.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Douglas Anderson <dianders@chromium.org>, Tony Prisk <linux@prisktech.co.nz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/6/20 11:02 AM, Sam Ravnborg wrote:
> Fix kernel-doc warnings reported when using W=1
> 
> v2:
>   - Improve subject (Lee)
> 
> v3:
>   - Add RETURNS documentation (Thomas)

Hi Sam,

Yes, RETURNS: will work. It just looks like any kernel-doc section name,
such as Context: or Note:.
However, the documented format for return info is "Return:".
(see Documentation/doc-guide/kernel-doc.rst)


> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
> ---
>  drivers/video/fbdev/core/fb_notify.c | 10 ++++++++++
>  drivers/video/fbdev/core/fbmon.c     |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev/core/fb_notify.c
> index 74c2da528884..4e39c61fae1f 100644
> --- a/drivers/video/fbdev/core/fb_notify.c
> +++ b/drivers/video/fbdev/core/fb_notify.c
> @@ -19,6 +19,9 @@ static BLOCKING_NOTIFIER_HEAD(fb_notifier_list);
>  /**
>   *	fb_register_client - register a client notifier
>   *	@nb: notifier block to callback on events
> + *
> + *	RETURNS:
> + *	0 on success, negative error code on failure.
>   */
>  int fb_register_client(struct notifier_block *nb)
>  {
> @@ -29,6 +32,9 @@ EXPORT_SYMBOL(fb_register_client);
>  /**
>   *	fb_unregister_client - unregister a client notifier
>   *	@nb: notifier block to callback on events
> + *
> + *	RETURNS:
> + *	0 on success, negative error code on failure.
>   */
>  int fb_unregister_client(struct notifier_block *nb)
>  {
> @@ -38,7 +44,11 @@ EXPORT_SYMBOL(fb_unregister_client);
>  
>  /**
>   * fb_notifier_call_chain - notify clients of fb_events
> + * @val: value passed to callback
> + * @v: pointer passed to callback
>   *
> + * RETURNS:
> + * The return value of the last notifier function
>   */
>  int fb_notifier_call_chain(unsigned long val, void *v)
>  {
> diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
> index 1bf82dbc9e3c..b0e690f41025 100644
> --- a/drivers/video/fbdev/core/fbmon.c
> +++ b/drivers/video/fbdev/core/fbmon.c
> @@ -605,6 +605,7 @@ static void get_detailed_timing(unsigned char *block,
>   * fb_create_modedb - create video mode database
>   * @edid: EDID data
>   * @dbsize: database size
> + * @specs: monitor specifications, may be NULL
>   *
>   * RETURNS: struct fb_videomode, @dbsize contains length of database
>   *


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
