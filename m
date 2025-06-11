Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44EFAD625B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 00:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91C110E0CD;
	Wed, 11 Jun 2025 22:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GZN2u701";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZU7A/J7f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GZN2u701";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZU7A/J7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577AC10E618
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:07:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DDC41F38E;
 Wed, 11 Jun 2025 11:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749640036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yszc8ZxnAc6Iyln4ZFrzJAqKJWDPXNV2ZOTEiPJKG/k=;
 b=GZN2u701ghojHqZgzEHxiWI4QaurCcqWhvcf+MUY9ZoUZzc/xwHo1Kg63qqtJidSL1DgpT
 /BYpbnbOkteY663j+/CGNl1DIQBffWYP8KAM7StP8GH7vDctvr1ChukYfr0dkb18sgsm2A
 zfIyY5E+jmG0lFaKD4Eiew+gyZBV6KM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749640036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yszc8ZxnAc6Iyln4ZFrzJAqKJWDPXNV2ZOTEiPJKG/k=;
 b=ZU7A/J7fVHMCCgDz7+DSce+1nW62ruVSEhmR9LxOfiAfg3VQgqVzxq8B+nVzIZk1cJuDuP
 uatBAS777Wb2FBBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749640036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yszc8ZxnAc6Iyln4ZFrzJAqKJWDPXNV2ZOTEiPJKG/k=;
 b=GZN2u701ghojHqZgzEHxiWI4QaurCcqWhvcf+MUY9ZoUZzc/xwHo1Kg63qqtJidSL1DgpT
 /BYpbnbOkteY663j+/CGNl1DIQBffWYP8KAM7StP8GH7vDctvr1ChukYfr0dkb18sgsm2A
 zfIyY5E+jmG0lFaKD4Eiew+gyZBV6KM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749640036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yszc8ZxnAc6Iyln4ZFrzJAqKJWDPXNV2ZOTEiPJKG/k=;
 b=ZU7A/J7fVHMCCgDz7+DSce+1nW62ruVSEhmR9LxOfiAfg3VQgqVzxq8B+nVzIZk1cJuDuP
 uatBAS777Wb2FBBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA4FE137FE;
 Wed, 11 Jun 2025 11:07:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ve9kJmNjSWj+HQAAD6G6ig
 (envelope-from <pfalcato@suse.de>); Wed, 11 Jun 2025 11:07:15 +0000
Date: Wed, 11 Jun 2025 12:07:13 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Subject: Re: [PATCH drm-misc-fixes] drm/sitronix: st7571-i2c: Select
 VIDEOMODE_HELPERS
Message-ID: <jkwafulqm5ohw6kssy3yr7akosoxihkkbemadrnoaysmhjmwgd@lg3d7qtwtwhc>
References: <20250610-drm-st7571-i2c-select-videomode-helpers-v1-1-d30b50ff6e64@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-drm-st7571-i2c-select-videomode-helpers-v1-1-d30b50ff6e64@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 URIBL_BLOCKED(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,redhat.com,gmail.com,lists.freedesktop.org,lists.linux.dev];
 RCVD_TLS_ALL(0.00)[]; MISSING_XM_UA(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Mailman-Approved-At: Wed, 11 Jun 2025 22:26:11 +0000
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

On Tue, Jun 10, 2025 at 12:40:38PM -0700, Nathan Chancellor wrote:
> This driver requires of_get_display_timing() from
> CONFIG_VIDEOMODE_HELPERS but does not select it. If no other driver
> selects it, there will be a failure from the linker if the driver is
> built in or modpost if it is a module.
> 
>   ERROR: modpost: "of_get_display_timing" [drivers/gpu/drm/sitronix/st7571-i2c.ko] undefined!
> 
> Select CONFIG_VIDEOMODE_HELPERS to resolve the build failure.
> 
> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

We've been observing these build failures regularly on certain configs in our
internal -rc1 branch, and this patch fixes it perfectly, thanks for tracking it
down!

Feel free to add:
Tested-by: Pedro Falcato <pfalcato@suse.de>
and
Acked-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
