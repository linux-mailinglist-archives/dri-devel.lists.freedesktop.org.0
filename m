Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C5EA1B2A6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 10:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3EE10E92D;
	Fri, 24 Jan 2025 09:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GQwF4fMn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bUgklgqa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GQwF4fMn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bUgklgqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501EE10E92B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 09:31:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97D9B1F38F;
 Fri, 24 Jan 2025 09:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737711081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OQt9GZ9JRFDfccX58xwKCQNMhgU9jud9AZE4uE+ABfg=;
 b=GQwF4fMnZ1Cd+jB+hLPlR2tdV6kXvbiyM3CqZSKbcRdpLe5yldpmpcY0TtUeepGRqVjPTR
 7MXvlIAbkzzDHw6rye/GXDRUMfKdcirZ8UZCAFCLJ7biOnQFurrEsfd7I4apgon+pJYmA1
 Ms3wKs5U3gGbq/7Sh4W6EaMPo6rISxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737711081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OQt9GZ9JRFDfccX58xwKCQNMhgU9jud9AZE4uE+ABfg=;
 b=bUgklgqarbmgnc2jBKTuutxhNuBpQ381+7xdGxDeFjjMM5NxHJAYES/CwtfaW5CrKklgqr
 c/T2B+GvA+RuD4CQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GQwF4fMn;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bUgklgqa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737711081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OQt9GZ9JRFDfccX58xwKCQNMhgU9jud9AZE4uE+ABfg=;
 b=GQwF4fMnZ1Cd+jB+hLPlR2tdV6kXvbiyM3CqZSKbcRdpLe5yldpmpcY0TtUeepGRqVjPTR
 7MXvlIAbkzzDHw6rye/GXDRUMfKdcirZ8UZCAFCLJ7biOnQFurrEsfd7I4apgon+pJYmA1
 Ms3wKs5U3gGbq/7Sh4W6EaMPo6rISxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737711081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OQt9GZ9JRFDfccX58xwKCQNMhgU9jud9AZE4uE+ABfg=;
 b=bUgklgqarbmgnc2jBKTuutxhNuBpQ381+7xdGxDeFjjMM5NxHJAYES/CwtfaW5CrKklgqr
 c/T2B+GvA+RuD4CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 643EB13999;
 Fri, 24 Jan 2025 09:31:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3mgzF+ldk2fUeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 09:31:21 +0000
Message-ID: <6be4aa42-14d3-46c9-b73e-0b036651d55e@suse.de>
Date: Fri, 24 Jan 2025 10:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_MAINTAINERS=3A_Remove_Noralf_Tr=C3=B8nn?=
 =?UTF-8?Q?es_as_driver_maintainer?=
To: noralf@tronnes.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250123-remove-myself-as-maintainer-v1-1-cc3ab7cd98ae@tronnes.org>
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
In-Reply-To: <20250123-remove-myself-as-maintainer-v1-1-cc3ab7cd98ae@tronnes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 97D9B1F38F
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_DN_SOME(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[tronnes.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
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




Am 23.01.25 um 17:34 schrieb Noralf Trønnes via B4 Relay:
> From: Noralf Trønnes <noralf@tronnes.org>
>
> Remove myself as maintainer for gud, mi0283qt, panel-mipi-dbi and repaper.
> My fatigue illness has finally closed the door on doing development of
> even moderate complexity so it's sad to let this go.

This is very sad news. All the best to you Noralf and thank you for all 
your help.

Best regards
Thomas

>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>

Acked-by: Thomas Zimmremann <tzimmermann@suse.de>

> ---
>   MAINTAINERS | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b038382481f99e336a2de0d2249537ec6781463..ed86d884ee0dfeede2ee185f7779380d04c5080b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7173,8 +7173,7 @@ F:	Documentation/devicetree/bindings/display/panel/panel-edp.yaml
>   F:	drivers/gpu/drm/panel/panel-edp.c
>   
>   DRM DRIVER FOR GENERIC USB DISPLAY
> -M:	Noralf Trønnes <noralf@tronnes.org>
> -S:	Maintained
> +S:	Orphan
>   W:	https://github.com/notro/gud/wiki
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/gud/
> @@ -7279,15 +7278,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/mgag200/
>   
>   DRM DRIVER FOR MI0283QT
> -M:	Noralf Trønnes <noralf@tronnes.org>
> -S:	Maintained
> +S:	Orphan
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
>   F:	drivers/gpu/drm/tiny/mi0283qt.c
>   
>   DRM DRIVER FOR MIPI DBI compatible panels
> -M:	Noralf Trønnes <noralf@tronnes.org>
> -S:	Maintained
> +S:	Orphan
>   W:	https://github.com/notro/panel-mipi-dbi/wiki
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> @@ -7384,8 +7381,7 @@ F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml
>   F:	drivers/gpu/drm/bridge/parade-ps8640.c
>   
>   DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
> -M:	Noralf Trønnes <noralf@tronnes.org>
> -S:	Maintained
> +S:	Orphan
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/display/repaper.txt
>   F:	drivers/gpu/drm/tiny/repaper.c
>
> ---
> base-commit: a9301e5bef12f8989a02d886109f13e89e1e51b0
> change-id: 20250122-remove-myself-as-maintainer-7540b245ab05
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

