Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2810AFE209
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 10:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0A310E75D;
	Wed,  9 Jul 2025 08:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DiaeyoYc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RluFGFtS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DiaeyoYc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RluFGFtS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE9110E75D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 08:11:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35E9821134;
 Wed,  9 Jul 2025 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752048710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zszXG46KKg/gYbE6tecfrtEK4YWIdln2/nG+N/R6x5E=;
 b=DiaeyoYcWg2nORSJ8U1QT12F+34woRwk1AlcHJE/BrPOK5BkV6EEUf8dCajx5vvr8UhCST
 /OPabZkE+uarz6QK+rkQZ84dz/cnSQd0+cJBbbvTG58w+JTYERw4aOoQhyOgO8fPMMNOxQ
 otVshkVZLD/2SDX/oJIZiG04PscA6Y0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752048710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zszXG46KKg/gYbE6tecfrtEK4YWIdln2/nG+N/R6x5E=;
 b=RluFGFtS4kdvYfaxW0Zjjd4yFKij9Y3f22vdt24qBDUHGtPHkmWMGUiz4M0aTxWw7BWhQc
 eHjyWu1B9C9b6hBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DiaeyoYc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RluFGFtS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752048710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zszXG46KKg/gYbE6tecfrtEK4YWIdln2/nG+N/R6x5E=;
 b=DiaeyoYcWg2nORSJ8U1QT12F+34woRwk1AlcHJE/BrPOK5BkV6EEUf8dCajx5vvr8UhCST
 /OPabZkE+uarz6QK+rkQZ84dz/cnSQd0+cJBbbvTG58w+JTYERw4aOoQhyOgO8fPMMNOxQ
 otVshkVZLD/2SDX/oJIZiG04PscA6Y0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752048710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zszXG46KKg/gYbE6tecfrtEK4YWIdln2/nG+N/R6x5E=;
 b=RluFGFtS4kdvYfaxW0Zjjd4yFKij9Y3f22vdt24qBDUHGtPHkmWMGUiz4M0aTxWw7BWhQc
 eHjyWu1B9C9b6hBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F51A13757;
 Wed,  9 Jul 2025 08:11:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id msRYAkYkbmhocwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Jul 2025 08:11:50 +0000
Message-ID: <fd6403d7-93f4-4fa4-ad0d-3ab91cba8183@suse.de>
Date: Wed, 9 Jul 2025 10:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: kyro: Add missing PCI memory region request
To: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <55e427bc-53d6-4ec8-b86a-99bd7367d5bb@suse.de>
 <20250708185808.845692-1-giovanni.disanti.lkl@gmail.com>
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
In-Reply-To: <20250708185808.845692-1-giovanni.disanti.lkl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,gmx.de]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 MID_RHS_MATCH_FROM(0.00)[]; TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 35E9821134
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Am 08.07.25 um 20:57 schrieb Giovanni Di Santi:
> Hi Thomas,
>
> Thanks for the feedback.
>
> On Tue, 8 Jul 2025 at 5:10, Thomas Zimmermann wrote:
>> Could this use pcim_request_all_regions() [1] instead? Cleanup and error
>> rollback would be automatic.
>> ...
>> Instead of manual cleanup, you're better off using pcim_enable_device()
>> [2] in kyrofb_probe(). Cleaning up is automatic then.
> I've applied the changes. I noticed that the driver still has manual
> ioremap() and pci_ioremap_wc_bar() calls inside the probe function.
> Should these also be converted to devm_ioremap() and devm_ioremap_wc() to
> make the cleanup fully automatic? Or should I do it in another patch?

If you have the time and interest, you're welcome to change it to the 
devm_ functions. Ideally, you'd send a series, which each patch 
addressing a single function.

Best regards
Thomas

>
> Changes in v2:
> - Use pcim_enable_device() instead of pci_enable_device()
> - Use pcim_request_all_regions() instead of pci_request_regions()
> - Removed manual cleanup code as it's now automatic
>
> ---
>
> The kyro framebuffer driver did not request its PCI memory regions,
> which could lead to conflicts with other drivers.  This change
> addresses the task "Request memory regions in all fbdev drivers"
> from the file Documentation/gpu/todo.rst.
>
> This is addressed by using the managed device functions pcim_enable_device()
> and pcim_request_all_regions(). This simplifies the code by making error
> handling and driver removal cleanup automatic for these resources.
>
> Signed-off-by: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
> ---
>   drivers/video/fbdev/kyro/fbdev.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
> index 08ee8baa79f8..86e5d60ed0ff 100644
> --- a/drivers/video/fbdev/kyro/fbdev.c
> +++ b/drivers/video/fbdev/kyro/fbdev.c
> @@ -679,7 +679,8 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (err)
>   		return err;
>   
> -	if ((err = pci_enable_device(pdev))) {
> +	err = pcim_enable_device(pdev);
> +	if (err) {
>   		printk(KERN_WARNING "kyrofb: Can't enable pdev: %d\n", err);
>   		return err;
>   	}
> @@ -688,6 +689,10 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (!info)
>   		return -ENOMEM;
>   
> +	err = pcim_request_all_regions(pdev, "kyrofb");
> +	if (err)
> +		goto out_free_fb;
> +
>   	currentpar = info->par;
>   
>   	kyro_fix.smem_start = pci_resource_start(pdev, 0);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

