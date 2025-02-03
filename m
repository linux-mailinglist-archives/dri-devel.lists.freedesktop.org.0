Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60532A256DF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 11:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AFD10E0CA;
	Mon,  3 Feb 2025 10:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kVml5rMz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="51YV7zQJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N33Tb0gP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wEhrPT/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5451E10E0CA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 10:25:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ACCC021162;
 Mon,  3 Feb 2025 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738578295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B28xHbzd2hSvBb41dA9gCOLpTarCHR/BaSSB5aXAzmE=;
 b=kVml5rMzwj6Mwq9nkEEWgZMd70SwGi4dGGX2F1clbb1ObPWby+eEBTKskLNoWPpm5Db2xs
 8J0HuBIEPKMtTHh1eifC2GU2bVWgGd/JXZSpOph4lLn0hSEx/NZC8aT4dqOokWu5BWfbnX
 9HokWVvzjJDMkolC84B7+8D5y8bExkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738578295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B28xHbzd2hSvBb41dA9gCOLpTarCHR/BaSSB5aXAzmE=;
 b=51YV7zQJ9lvtzsnAC6WL9iurrxUXkpIVdxn83XCCXL0dxy06DdRml3YsvjQ9Cr3VfY7dZW
 TX2kb068i7xywrBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N33Tb0gP;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="wEhrPT/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738578291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B28xHbzd2hSvBb41dA9gCOLpTarCHR/BaSSB5aXAzmE=;
 b=N33Tb0gP0bU8paofonS6m9YOkE0SPwjgxH1Oovu7uQPdR6nN4Ei/eQHVj1/kpaXQRI9i+S
 tbP078ZmOz5p4w8rjBf/fiEA+ZBftKovD1jK+LiNcuJXFsGB1bylBdKrg8aGL855VaMsww
 oPOH3wI0CUUgAUGi8xC02Wme5gEBTGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738578291;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B28xHbzd2hSvBb41dA9gCOLpTarCHR/BaSSB5aXAzmE=;
 b=wEhrPT/8SahloHtQvQQe+m1cdpJzkUxSdeYNUl1EFQMx2kfrapHMllBpSP8Q6cvG732ZTZ
 /3RHYh4X3fS75uDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 529AA13795;
 Mon,  3 Feb 2025 10:24:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IMHVEnOZoGfpcgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Feb 2025 10:24:51 +0000
Message-ID: <b284f594-2b28-4c1b-b00e-2fe7e9036b2f@suse.de>
Date: Mon, 3 Feb 2025 11:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/3] expose mapping wrprotect, fix fb_defio use
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
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
In-Reply-To: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: ACCC021162
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org,kvack.org,infradead.org,redhat.com];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TAGGED_RCPT(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo]
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

Hi


Am 14.01.25 um 00:15 schrieb Lorenzo Stoakes:
[...]
>
> *** REVIEWERS NOTES: ***
>
> I do not have any hardware that uses fb_defio, so I'm asking for help with
> testing this series from those who do :) I have tested the mm side of this,
> and done a quick compile smoke test of the fb_defio side but this _very
> much_ requires testing on actual hardware to ensure everything behaves as
> expected.

With a recent Linux distro, you likely boot up graphics with simpledrm, 
which uses fb_defio as part of its console emulation. To test, boot the 
kernel with the 'nomodeset' parameter and write to /dev/fb0.

Best regards
Thomas

>
> This is based on Andrew's tree [0] in the mm-unstable branch - I was
> thinking it'd be best to go through the mm tree (with fb_defio maintainer
> approval, of course!) as it relies upon the mm changes to work correctly.
>
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/
>
> RFC v2:
> * Updated Jaya Kumar's email on cc - the MAINTAINERS section is apparently incorrect.
> * Corrected rmap_walk_file() comment to refer to folios as per Matthew.
> * Reference folio->mapping rather than folio_mapping(folio) in rmap_walk_file()
>    as per Matthew.
> * Reference folio->index rather than folio_pgoff(folio) in rmap_walk_file() as
>    per Matthew.
> * Renamed rmap_wrprotect_file_page() to mapping_wrprotect_page() as per Matthew.
> * Fixed kerneldoc and moved to implementation as per Matthew.
> * Updated mapping_wrprotect_page() to take a struct page pointer as per David.
> * Removed folio lock when invoking mapping_wrprotect_page() in
>    fb_deferred_io_work() as per Matthew.
> * Removed compound_nr() in fb_deferred_io_work() as per Matthew.
>
> RFC v1:
> https://lore.kernel.org/all/1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com/
>
> Lorenzo Stoakes (3):
>    mm: refactor rmap_walk_file() to separate out traversal logic
>    mm: provide mapping_wrprotect_page() function
>    fb_defio: do not use deprecated page->mapping, index fields
>
>   drivers/video/fbdev/core/fb_defio.c |  38 ++-----
>   include/linux/fb.h                  |   1 +
>   include/linux/rmap.h                |   3 +
>   mm/rmap.c                           | 152 +++++++++++++++++++++++-----
>   4 files changed, 141 insertions(+), 53 deletions(-)
>
> --
> 2.48.0

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

