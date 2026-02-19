Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKvzILrhlmnkqQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:11:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CAC15DA1B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C84D10E23C;
	Thu, 19 Feb 2026 10:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JIz/MyZK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hg+9SGTZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JIz/MyZK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hg+9SGTZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8E710E23C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 10:11:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A341A3E6DD;
 Thu, 19 Feb 2026 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771495860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p5mteQbPIQ5Fbcjzl+kazaPmZ3yewACfM0hYa+iV4so=;
 b=JIz/MyZKMyl2bFzrbCc0i9P//G1mZ38OwooxI/yeChc71uF0+NlzKjI7soCU8IRwqfON0T
 VS9EzcS+nLWTAsQMr6oGYNL7XkvGktUFZO5SatZkZWz53zxmzspRQdGERV/hxir+mYPOWy
 jJrrUnDt26ZmSvmzwaqvA5KLa3uz9nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771495860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p5mteQbPIQ5Fbcjzl+kazaPmZ3yewACfM0hYa+iV4so=;
 b=Hg+9SGTZ3fZDgaWxuooebunSgUfC269kVXQPuGozb3ccX1VNHMt48nnlSqiaFIBvw+qJLG
 iaEngr3cl8l2iMAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771495860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p5mteQbPIQ5Fbcjzl+kazaPmZ3yewACfM0hYa+iV4so=;
 b=JIz/MyZKMyl2bFzrbCc0i9P//G1mZ38OwooxI/yeChc71uF0+NlzKjI7soCU8IRwqfON0T
 VS9EzcS+nLWTAsQMr6oGYNL7XkvGktUFZO5SatZkZWz53zxmzspRQdGERV/hxir+mYPOWy
 jJrrUnDt26ZmSvmzwaqvA5KLa3uz9nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771495860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p5mteQbPIQ5Fbcjzl+kazaPmZ3yewACfM0hYa+iV4so=;
 b=Hg+9SGTZ3fZDgaWxuooebunSgUfC269kVXQPuGozb3ccX1VNHMt48nnlSqiaFIBvw+qJLG
 iaEngr3cl8l2iMAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D11E3EA65;
 Thu, 19 Feb 2026 10:11:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hzTOCbThlmkEWwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 19 Feb 2026 10:11:00 +0000
Message-ID: <34dd132a-ebec-4116-865b-72e46b7cf520@suse.de>
Date: Thu, 19 Feb 2026 11:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/sitronix: add ST7789V panel driver
To: Archit Anant <architanant5@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: wens@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nathan@kernel.org,
 geert+renesas@glider.be, marcus.folkesson@gmail.com, david@lechnology.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260214070123.41374-1-architanant5@gmail.com>
 <CAGb2v679248jj4CwQhYAbTUiPJ1=-JqX15CaNY94Cj_dFXwZXw@mail.gmail.com>
 <CADJHxWCzbzD3MK+NLS3UVqXeH4cKop-ErNSnn_RUmAzRLmk7Mw@mail.gmail.com>
 <87ikbx6sf1.fsf@ocarina.mail-host-address-is-not-set>
 <CADJHxWD-UpjgGKst_CDPqXHADVPJY6KL296VFOq6WFBEKqVong@mail.gmail.com>
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
In-Reply-To: <CADJHxWD-UpjgGKst_CDPqXHADVPJY6KL296VFOq6WFBEKqVong@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:architanant5@gmail.com,m:javierm@redhat.com,m:wens@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:nathan@kernel.org,m:geert+renesas@glider.be,m:marcus.folkesson@gmail.com,m:david@lechnology.com,m:noralf@tronnes.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:marcusfolkesson@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch,glider.be,lechnology.com,tronnes.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: E2CAC15DA1B
X-Rspamd-Action: no action

Hi

Am 16.02.26 um 16:38 schrieb Archit Anant:
> On Mon, Feb 16, 2026 at 1:17 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>
> Hi Javier,
>
>> Archit Anant <architanant5@gmail.com> writes:
>>
>> Hello Archit,
>>
>>> Hi ChenYu,
>>>
>>> Thank you for the detailed review and the pointers toward the documentation.
>>> I will ensure the headers are sorted alphabetically and the driver name
>>> conflict is resolved in the next iteration.
>>>
>>>> The reset logic in mipi_dbi is inverted when compared to panel-st7789v.
>>>> mipi_dbi needs to be taught the "proper" reset polarity.
>>> Noted. I will look into the mipi_dbi core to see how to handle the reset
>>> polarity correctly.
>>>
>>>> Instead this functionality could be merged into the existing panel-st7789v
>>>> driver. You mentioned above that that driver only supports the 9-bit SPI
>>>> transfer mode. However porting that driver over to mipi_dbi would fix this,
>>>> and remove some redundant code. And tinydrm support could be added on top
>>>> of that.
>>>>
>>>> I actually mentioned I was going to work on this on IRC. But I only ported
>>>> the driver over to use mipi_dbi, and haven't gotten around to adding
>>>> tinydrm support. I can send out the conversion patches if that helps
>>>> you.
>>> That would be fantastic and would save a lot of redundant effort. If you
>>> send out the patches to convert the existing panel-st7789v driver to
>>> mipi_dbi, I would be happy to build the 'tiny' (simple display pipe)
>>> support on top of your series.
>>>
>> I think we want to get rid of the simple display pipeline and instead just
>> use regulator atomic helpers, even for the tiny DRM drivers.
>>
>> Please take a look to previous commits such as 2037174993c8 ("drm/bochs:
>> Use regular atomic helpers") or 622113b9f11f ("drm/ssd130x: Replace simple
>> display helpers with the atomic helpers").
>>
>> --
>> Best regards,
>>
>> Javier Martinez Canillas
>> Core Platforms
>> Red Hat
>>
> Thank you for pointing this out. I based this implementation on the
> existing st7735r driver, which currently uses the simple pipe.
>
> I will study the bochs and ssd130x commits to understand the migration to
> regular atomic helpers.
>
> If the goal is to move tiny DRM drivers away from the simple pipe, updating
> the Sitronix drivers to this new pattern sounds much better.
> I will incorporate this into my plan for the next iteration
> (building on top of ChenYu's work).

The thing is that this driver builds upon mipi_dbi_dev, which uses 
simple_display_pipeline internally. So it might be legitimate to use it 
here. Otherwise all the MIPI support from drm_mipi_dbi.c would have to 
be duplicated.

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


