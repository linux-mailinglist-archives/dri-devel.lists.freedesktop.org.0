Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28245A50505
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6599A10E808;
	Wed,  5 Mar 2025 16:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="meZ4Spib";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tdTETR1m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="meZ4Spib";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tdTETR1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFFA10E808
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 16:35:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 300041F745;
 Wed,  5 Mar 2025 16:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741192521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8+g/o1+srqo0DCoe59Hnf8JHVdHXN66r5jGSQybdPSM=;
 b=meZ4SpibdoDPcNikk/QPPep7dvXFEdLAmQ/oxq/j/oYNJVdpC02fmyG74F8jEhLqhKdPsY
 BMzq3Kt506oYXkwxCEHtHwo8bNBUSquQ5k/XDwfq7ne5jnBupH5TWR904Ma4oEqdaseZdh
 23dpVq4fzW+2d9xiJVupsit4WP7jaoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741192521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8+g/o1+srqo0DCoe59Hnf8JHVdHXN66r5jGSQybdPSM=;
 b=tdTETR1mEY+ldwXmqxEoEY5Ks0uWVDte5IGeCtD4Wd29P42kQnrdbFgFI6P5cB3AaSJYMH
 Bc/n+KLUooA73rAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=meZ4Spib;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tdTETR1m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741192521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8+g/o1+srqo0DCoe59Hnf8JHVdHXN66r5jGSQybdPSM=;
 b=meZ4SpibdoDPcNikk/QPPep7dvXFEdLAmQ/oxq/j/oYNJVdpC02fmyG74F8jEhLqhKdPsY
 BMzq3Kt506oYXkwxCEHtHwo8bNBUSquQ5k/XDwfq7ne5jnBupH5TWR904Ma4oEqdaseZdh
 23dpVq4fzW+2d9xiJVupsit4WP7jaoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741192521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8+g/o1+srqo0DCoe59Hnf8JHVdHXN66r5jGSQybdPSM=;
 b=tdTETR1mEY+ldwXmqxEoEY5Ks0uWVDte5IGeCtD4Wd29P42kQnrdbFgFI6P5cB3AaSJYMH
 Bc/n+KLUooA73rAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E40611366F;
 Wed,  5 Mar 2025 16:35:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aJVVNkh9yGcLfgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 16:35:20 +0000
Message-ID: <1e5fe1fa-a1fb-45e1-85a4-56f767170fe3@suse.de>
Date: Wed, 5 Mar 2025 17:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/gem: Test for imported GEM buffers with helper
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-2-tzimmermann@suse.de>
 <CAN9Xe3Rbf7fjWy=3Gh_QtNb9jq+9DM6BNZL8w2uHKJMTUT9v4Q@mail.gmail.com>
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
In-Reply-To: <CAN9Xe3Rbf7fjWy=3Gh_QtNb9jq+9DM6BNZL8w2uHKJMTUT9v4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 300041F745
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,linaro.org,amd.com,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
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



Am 28.02.25 um 17:04 schrieb Anusha Srivatsa:
>
>
> On Wed, Feb 26, 2025 at 12:28 PM Thomas Zimmermann 
> <tzimmermann@suse.de> wrote:
>
>     Add drm_gem_is_imported() that tests if a GEM object's buffer has
>     been imported. Update the GEM code accordingly.
>
>     GEM code usually tests for imports if import_attach has been set
>     in struct drm_gem_object. But attaching a dma-buf on import requires
>     a DMA-capable importer device, which is not the case for many serial
>     busses like USB or I2C. The new helper tests if a GEM object's dma-buf
>     has been created from the GEM object.
>
>     Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>     ---
>      drivers/gpu/drm/drm_gem.c |  4 ++--
>      include/drm/drm_gem.h     | 14 ++++++++++++++
>      2 files changed, 16 insertions(+), 2 deletions(-)
>
>     diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>     index ee811764c3df..c6240bab3fa5 100644
>     --- a/drivers/gpu/drm/drm_gem.c
>     +++ b/drivers/gpu/drm/drm_gem.c
>     @@ -348,7 +348,7 @@ int drm_gem_dumb_map_offset(struct drm_file
>     *file, struct drm_device *dev,
>                     return -ENOENT;
>
>             /* Don't allow imported objects to be mapped */
>     -       if (obj->import_attach) {
>     +       if (drm_gem_is_imported(obj)) {
>                     ret = -EINVAL;
>                     goto out;
>             }
>     @@ -1178,7 +1178,7 @@ void drm_gem_print_info(struct drm_printer
>     *p, unsigned int indent,
>     drm_vma_node_start(&obj->vma_node));
>             drm_printf_indent(p, indent, "size=%zu\n", obj->size);
>             drm_printf_indent(p, indent, "imported=%s\n",
>     -  str_yes_no(obj->import_attach));
>     +  str_yes_no(drm_gem_is_imported(obj)));
>
>             if (obj->funcs->print_info)
>                     obj->funcs->print_info(p, indent, obj);
>     diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>     index fdae947682cd..2bf893eabb4b 100644
>     --- a/include/drm/drm_gem.h
>     +++ b/include/drm/drm_gem.h
>     @@ -35,6 +35,7 @@
>       */
>
>      #include <linux/kref.h>
>     +#include <linux/dma-buf.h>
>      #include <linux/dma-resv.h>
>      #include <linux/list.h>
>      #include <linux/mutex.h>
>     @@ -575,6 +576,19 @@ static inline bool
>     drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>             return (obj->handle_count > 1) || obj->dma_buf;
>      }
>
>     +/**
>     + * drm_gem_is_imported() - Tests if GEM object's buffer has been
>     imported
>     + * @obj: the GEM object
>     + *
>     + * Returns:
>     + * True if the GEM object's buffer has been imported, false otherwise
>     + */
>     +static inline bool drm_gem_is_imported(const struct
>     drm_gem_object *obj)
>     +{
>     +       /* The dma-buf's priv field points to the original GEM
>     object. */
>     +       return obj->dma_buf && (obj->dma_buf->priv != obj);
>     +}
>     +
>
>
> Looks good to me.
> Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks for reviewing.

>      #ifdef CONFIG_LOCKDEP
>      /**
>       * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to
>     the gpuva list.
>     -- 
>     2.48.1
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

