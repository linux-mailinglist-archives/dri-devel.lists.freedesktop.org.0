Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4542B0034B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 15:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398D210E8DF;
	Thu, 10 Jul 2025 13:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="J3vdXU7d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a37i96bn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J3vdXU7d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a37i96bn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F076F10E8DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 13:26:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21CF11F79C;
 Thu, 10 Jul 2025 13:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752153988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=e/k2M2Tl5nJfag4azPtUe3kxanG2uqzCR6UDSBb1iKk=;
 b=J3vdXU7dgjnzE8WxiSAa22XhZzeS8RHwVgMllOcD/ggl+3q/utxL6GhKMjf0iKt26OM9yL
 7ZnBVAJ58wlEs61Y8JKPmeCFZKvCevjv3yL+KkU5OZDIbSe0KrKgbdDj79rMBmxaGDEPuS
 8WFQ5FF9mRbway2mZRmxEKf/4WMydEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752153988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=e/k2M2Tl5nJfag4azPtUe3kxanG2uqzCR6UDSBb1iKk=;
 b=a37i96bnvJnrP7Po1ew/zXqHpKg0hsa+1b7YQVZyLaPSJMM82UAiYVFTYPZ0NvtrAl3eqj
 lGJRDfRSLHO4EvDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=J3vdXU7d;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=a37i96bn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752153988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=e/k2M2Tl5nJfag4azPtUe3kxanG2uqzCR6UDSBb1iKk=;
 b=J3vdXU7dgjnzE8WxiSAa22XhZzeS8RHwVgMllOcD/ggl+3q/utxL6GhKMjf0iKt26OM9yL
 7ZnBVAJ58wlEs61Y8JKPmeCFZKvCevjv3yL+KkU5OZDIbSe0KrKgbdDj79rMBmxaGDEPuS
 8WFQ5FF9mRbway2mZRmxEKf/4WMydEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752153988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=e/k2M2Tl5nJfag4azPtUe3kxanG2uqzCR6UDSBb1iKk=;
 b=a37i96bnvJnrP7Po1ew/zXqHpKg0hsa+1b7YQVZyLaPSJMM82UAiYVFTYPZ0NvtrAl3eqj
 lGJRDfRSLHO4EvDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C554E136CB;
 Thu, 10 Jul 2025 13:26:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WxHOLoO/b2iZHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Jul 2025 13:26:27 +0000
Message-ID: <ab591252-120c-4740-9e89-7efd31dc00a0@suse.de>
Date: Thu, 10 Jul 2025 15:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: mt8173-elm-hana:
 kms_atomic_transition@plane-all-modeset-transition-internal-panels flake
To: Vignesh Raman <vignesh.raman@collabora.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 nfraprado@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
References: <30b3f8b0-3409-4329-bb60-b6287e1a439d@collabora.com>
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
In-Reply-To: <30b3f8b0-3409-4329-bb60-b6287e1a439d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.98%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,collabora.com,gmail.com,ffwll.ch]; 
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns,
 plane-all-modeset-transition-internal-panels:email, suse.de:mid, suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 21CF11F79C
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

Hi,

spamming the mailing lists with copy-paste mails is not going to help 
with these problems.

Best regards
Thomas

Am 10.07.25 um 15:16 schrieb Vignesh Raman:
> Hi Maintainers,
>
> There is a flake test reported for the mediatek driver in drm-ci.
>
> # Board Name: mt8173-elm-hana
> # Failure Rate: 60
> # IGT Version: 2.1-g26ddb59c1
> # Linux Version: 6.16.0-rc2
> kms_atomic_transition@plane-all-modeset-transition-internal-panels
>
> 07:35:22.411: DEBUG - Begin test 
> kms_atomic_transition@plane-all-modeset-transition-internal-panels
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
> Test assertion failure function wait_for_transition, file 
> ../tests/kms_atomic_transition.c:539:
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
> Failed assertion: fd_completed(data->drm_fd)
> 07:35:22.411: ERROR - Igt error: Dynamic subtest pipe-A-eDP-1 failed.
> 07:35:22.411: ERROR - Igt error: **** DEBUG ****
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.2, fb 84
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.3, fb 83
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: }
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: commit {
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.0, fb 82
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x5560000/89522176
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x3000000/50331648
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x556/1366
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x300/768
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x52/82
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.1, fb 84
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x4000000/67108864
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x3000000/50331648
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.2, fb 84
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.3, fb 83
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: }
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: eDP-1: set_pipe(A)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: eDP-1: Selecting pipe A
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.1: plane_set_fb(0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.1: plane_set_size (0x0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.1: fb_set_position(0,0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.1: fb_set_size(0x0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.2: plane_set_fb(0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.2: plane_set_size (0x0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.2: fb_set_size(0x0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.3: plane_set_fb(0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.3: plane_set_size (0x0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.3: fb_set_position(0,0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.3: fb_set_size(0x0)
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: commit {
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x55/85
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: Pipe A: Setting property "ACTIVE" to 0x1/1
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.1, fb 0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x0/0
> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.2, fb 0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.3, fb 0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     eDP-1: preparing atomic, pipe: A
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: eDP-1: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: }
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) DEBUG: 
> Retrieved vblank seq: 4302 on unk
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.0: plane_set_fb(82)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.0: plane_set_size (1366x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.0: fb_set_size(1366x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.0: fb_set_size(1366x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.0: plane_set_size (1366x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.1: plane_set_fb(84)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.1: plane_set_size (1024x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.1: fb_set_position(0,0)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.1: fb_set_size(1024x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.1: fb_set_size(1024x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.1: plane_set_size (1024x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.2: plane_set_fb(84)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.2: plane_set_size (1024x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.2: fb_set_size(1024x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.2: fb_set_size(1024x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.2: plane_set_size (1024x768)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.3: plane_set_fb(83)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.3: plane_set_size (512x512)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.3: fb_set_position(0,0)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.3: fb_set_size(512x512)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.3: fb_set_size(512x512)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: A.3: plane_set_size (512x512)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: commit {
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x51/81
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.0, fb 82
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x5560000/89522176
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x3000000/50331648
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x556/1366
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x300/768
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x52/82
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.1, fb 84
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x4000000/67108864
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x3000000/50331648
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.2, fb 84
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display:     populating plane data: A.3, fb 83
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_kms-DEBUG: display: }
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
> Test assertion failure function wait_for_transition, file 
> ../tests/kms_atomic_transition.c:539:
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
> Failed assertion: fd_completed(data->drm_fd)
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_core-INFO: Stack trace:
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_core-INFO:   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_core-INFO:   #1 ../tests/kms_atomic_transition.c:536 
> wait_for_transition.constprop.0()
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_core-INFO:   #2 ../tests/kms_atomic_transition.c:715 
> __igt_unique____real_main1122()
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_core-INFO:   #3 ../tests/kms_atomic_transition.c:1122 main()
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_core-INFO:   #4 [__libc_init_first+0x80]
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_core-INFO:   #5 [__libc_start_main+0x98]
> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
> igt_core-INFO:   #6 [_start+0x30]
> 07:35:22.412: ERROR - Igt error: ****  END  ****
> 07:35:22.412: ERROR - Test 
> kms_atomic_transition@plane-all-modeset-transition-internal-panels: 
> Fail: See 
> "/results/igt.kms_atomic_transition@plane-all-modeset-transition-internal-panels.log"
> 07:35:22.412: DEBUG - End test 
> kms_atomic_transition@plane-all-modeset-transition-internal-panels
>
> Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79879662
>
> Please could you have a look at these test results and let us know if 
> you need more information to debug. Thank you.
>
> Regards,
> Vignesh

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

