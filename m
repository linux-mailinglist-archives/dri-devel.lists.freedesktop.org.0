Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A8AFC43D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A05810E5A9;
	Tue,  8 Jul 2025 07:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Z+cDIoqg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oCcz3XoT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z+cDIoqg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oCcz3XoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15A710E5A9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 07:38:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7DE6C2115F;
 Tue,  8 Jul 2025 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751960333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gvG5OJSZUKUfmOaM9AGtFnkko27si3EQj7m9quIH+1U=;
 b=Z+cDIoqgze0oqsRAESJ+3Zsubl5j79M5/pT1u8FEq56KkABuklx2yAl0/NOQBBq7cLliEG
 w/BgzsdD5oNmLng+Ej9dIh+o55N1YVqhN4CqcCO+MbE7SxVxW7+kKpJ1tPj7QM2zeYl1gr
 4jUnK5OWMyE7gIUGrduMElIiHqfl0PA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751960333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gvG5OJSZUKUfmOaM9AGtFnkko27si3EQj7m9quIH+1U=;
 b=oCcz3XoTG2OpMrgy6Go/NmHCi+I73sVD2Pqsd2PADEDbC8BCxQ6lqFq6fSktqH9ZfYBB//
 meQGvKx6KWqOyyBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Z+cDIoqg;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oCcz3XoT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751960333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gvG5OJSZUKUfmOaM9AGtFnkko27si3EQj7m9quIH+1U=;
 b=Z+cDIoqgze0oqsRAESJ+3Zsubl5j79M5/pT1u8FEq56KkABuklx2yAl0/NOQBBq7cLliEG
 w/BgzsdD5oNmLng+Ej9dIh+o55N1YVqhN4CqcCO+MbE7SxVxW7+kKpJ1tPj7QM2zeYl1gr
 4jUnK5OWMyE7gIUGrduMElIiHqfl0PA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751960333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gvG5OJSZUKUfmOaM9AGtFnkko27si3EQj7m9quIH+1U=;
 b=oCcz3XoTG2OpMrgy6Go/NmHCi+I73sVD2Pqsd2PADEDbC8BCxQ6lqFq6fSktqH9ZfYBB//
 meQGvKx6KWqOyyBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1198913A54;
 Tue,  8 Jul 2025 07:38:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HNbpAg3LbGhQRwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Jul 2025 07:38:53 +0000
Message-ID: <a421623f-e93f-4423-bf30-c7388c6a3508@suse.de>
Date: Tue, 8 Jul 2025 09:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/framebuffer: Acquire internal references on GEM
 handles
To: Satadru Pramanik <satadru@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 asrivats@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, jean-christophe@guillain.net,
 superm1@kernel.org, bp@alien8.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bert Karwatzki <spasswolf@web.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250707131224.249496-1-tzimmermann@suse.de>
 <a3336964-1b72-421c-b4dc-2ac3f548430b@amd.com>
 <4c1bc40d-6bd4-4102-b12f-fda320216e1d@suse.de>
 <CAFrh3J9uh0M5bWeS3cv_Cb1yFTKhE2+9mSk5hsZTzWW3uYKaWg@mail.gmail.com>
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
In-Reply-To: <CAFrh3J9uh0M5bWeS3cv_Cb1yFTKhE2+9mSk5hsZTzWW3uYKaWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[17];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_TO(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,web.de]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,guillain.net,alien8.de,lists.freedesktop.org,vger.kernel.org,web.de,linaro.org,lists.linaro.org];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:mid, suse.de:dkim, suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 7DE6C2115F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 07.07.25 um 18:14 schrieb Satadru Pramanik:
> Applying this patch to 6.16-rc5 resolves the sleep issue regression 
> from 6.16-rc4 I was having on my MacBookPro11,3 (Mid-2014 15" 
> MacBookPro), which has the NVIDIA GK107M GPU enabled via the Nouveau 
> driver.

Thanks for testing. I think the sleep regression was just a side effect 
of the broken reference counting.

Best regards
Thomas

>
> Many thanks,
>
> Satadru
>
> On Mon, Jul 7, 2025 at 9:33 AM Thomas Zimmermann <tzimmermann@suse.de> 
> wrote:
>
>     Hi
>
>     Am 07.07.25 um 15:21 schrieb Christian König:
>
>     >>
>     >> +#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)  BIT(0u + (_i))
>     > Why the "0u + (_i)" here? An macro trick?
>
>     You mean why not just BIT(_i)? internal_flags could possibly contain
>     additional flags. Just using BIT(_i) would make it look as if it's
>     only
>     for those handle refs.
>
>     Best regards
>     Thomas
>
>     >
>     > Regards,
>     > Christian.
>     >
>     >> +
>     >>   /**
>     >>    * struct drm_framebuffer - frame buffer object
>     >>    *
>     >> @@ -188,6 +191,10 @@ struct drm_framebuffer {
>     >>       * DRM_MODE_FB_MODIFIERS.
>     >>       */
>     >>      int flags;
>     >> +    /**
>     >> +     * @internal_flags: Framebuffer flags like
>     DRM_FRAMEBUFFER_HAS_HANDLE_REF.
>     >> +     */
>     >> +    unsigned int internal_flags;
>     >>      /**
>     >>       * @filp_head: Placed on &drm_file.fbs, protected by
>     &drm_file.fbs_lock.
>     >>       */
>
>     -- 
>     --
>     Thomas Zimmermann
>     Graphics Driver Developer
>     SUSE Software Solutions Germany GmbH
>     Frankenstrasse 146, 90461 Nuernberg, Germany
>     GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>     HRB 36809 (AG Nuernberg)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

