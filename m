Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35383AFCE9B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 17:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D1010E141;
	Tue,  8 Jul 2025 15:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="m6Mz6Pmf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7l5l/6CP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m6Mz6Pmf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7l5l/6CP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3126110E141
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 15:10:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE56C1F38D;
 Tue,  8 Jul 2025 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751987417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RBJrq5rrEYK3BExPN1yatd5yFSUlyz7lh/vpdvXGyaI=;
 b=m6Mz6Pmfkfhll36kjfI9evCnWYijYAdQHH3cVSK97NDajj7Bwsg86gZRMxYnFxDo3gOMMl
 sjSleKQFeaqu4id7eCQuqL255r17i5MoSDP3K/zFZK/fjxUe1LYPWTC7bgzedx0vVD851L
 rguyRY1zZ9qSNT3l5fZTAhS2jeaNVUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751987417;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RBJrq5rrEYK3BExPN1yatd5yFSUlyz7lh/vpdvXGyaI=;
 b=7l5l/6CP/McLTQpCHpcAgy0YjJdfc7K7uJRZNjuqKcuJ/Su/LSLr/1xvHBNHh924Fdj/4M
 K4l9TzdEFvHoBhCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751987417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RBJrq5rrEYK3BExPN1yatd5yFSUlyz7lh/vpdvXGyaI=;
 b=m6Mz6Pmfkfhll36kjfI9evCnWYijYAdQHH3cVSK97NDajj7Bwsg86gZRMxYnFxDo3gOMMl
 sjSleKQFeaqu4id7eCQuqL255r17i5MoSDP3K/zFZK/fjxUe1LYPWTC7bgzedx0vVD851L
 rguyRY1zZ9qSNT3l5fZTAhS2jeaNVUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751987417;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RBJrq5rrEYK3BExPN1yatd5yFSUlyz7lh/vpdvXGyaI=;
 b=7l5l/6CP/McLTQpCHpcAgy0YjJdfc7K7uJRZNjuqKcuJ/Su/LSLr/1xvHBNHh924Fdj/4M
 K4l9TzdEFvHoBhCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86C4313A68;
 Tue,  8 Jul 2025 15:10:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5nCzH9k0bWgkVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Jul 2025 15:10:17 +0000
Message-ID: <55e427bc-53d6-4ec8-b86a-99bd7367d5bb@suse.de>
Date: Tue, 8 Jul 2025 17:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: kyro: Add missing PCI memory region request
To: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250708144659.787676-1-giovanni.disanti.lkl@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250708144659.787676-1-giovanni.disanti.lkl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com,gmx.de];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_COUNT_TWO(0.00)[2]; TAGGED_RCPT(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, bootlin.com:url,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

Hi

Am 08.07.25 um 16:46 schrieb Giovanni Di Santi:
> The kyro framebuffer driver did not request its PCI memory regions,
> which could lead to conflicts with other drivers.  This change
> addresses the task "Request memory regions in all fbdev drivers"
> from the file Documentation/gpu/todo.rst.
>
> pci_request_regions() is now called during probe. To ensure proper
> cleanup, the corresponding pci_release_regions() and a missing
> pci_disable_device() call are added to both the driver's remove
> function and the probe's error handling path.
>
> Signed-off-by: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
> ---
>   drivers/video/fbdev/kyro/fbdev.c | 23 ++++++++++++++++++-----
>   1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
> index 08ee8baa79f8..80ac17337c1b 100644
> --- a/drivers/video/fbdev/kyro/fbdev.c
> +++ b/drivers/video/fbdev/kyro/fbdev.c
> @@ -685,8 +685,14 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	}
>   
>   	info = framebuffer_alloc(sizeof(struct kyrofb_info), &pdev->dev);
> -	if (!info)
> -		return -ENOMEM;
> +	if (!info) {
> +		err = -ENOMEM;
> +		goto out_disable;
> +	}
> +
> +	err = pci_request_regions(pdev, "kyrofb");
> +	if (err)
> +		goto out_free_fb;

Could this use pcim_request_all_regions() [1] instead? Cleanup and error 
rollback would be automatic.

[1] 
https://elixir.bootlin.com/linux/v6.15.5/source/drivers/pci/devres.c#L927


>   
>   	currentpar = info->par;
>   
> @@ -695,10 +701,11 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	kyro_fix.mmio_start = pci_resource_start(pdev, 1);
>   	kyro_fix.mmio_len   = pci_resource_len(pdev, 1);
>   
> +	err = -EINVAL;
>   	currentpar->regbase = deviceInfo.pSTGReg =
>   		ioremap(kyro_fix.mmio_start, kyro_fix.mmio_len);
>   	if (!currentpar->regbase)
> -		goto out_free_fb;
> +		goto out_release;
>   
>   	info->screen_base = pci_ioremap_wc_bar(pdev, 0);
>   	if (!info->screen_base)
> @@ -752,10 +759,13 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	iounmap(info->screen_base);
>   out_unmap_regs:
>   	iounmap(currentpar->regbase);
> +out_release:
> +	pci_release_regions(pdev);
>   out_free_fb:
>   	framebuffer_release(info);
> -
> -	return -EINVAL;
> +out_disable:
> +	pci_disable_device(pdev);
> +	return err;
>   }
>   
>   static void kyrofb_remove(struct pci_dev *pdev)
> @@ -780,6 +790,9 @@ static void kyrofb_remove(struct pci_dev *pdev)
>   
>   	unregister_framebuffer(info);
>   	framebuffer_release(info);
> +
> +	pci_release_regions(pdev);
> +	pci_disable_device(pdev);

Instead of manual cleanup, you're better off using pcim_enable_device() 
[2] in kyrofb_probe(). Cleaning up is automatic then.

Best regards
Thomas

[2] 
https://elixir.bootlin.com/linux/v6.15.5/source/drivers/pci/devres.c#L476

>   }
>   
>   static int __init kyrofb_init(void)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

