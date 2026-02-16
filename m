Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCcVBrDLkmlfyAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 08:48:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559C91415DE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 08:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F78D10E075;
	Mon, 16 Feb 2026 07:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QhwxRvva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE1D10E075
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 07:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771228074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uol2fLV3qDx0A8pdj/OSTFONpzYOz9GPk6lW8EILWMI=;
 b=QhwxRvvaH+RvVpz8eEwE4+mf2QQowmNR0ZXRzfKKsNl1TeS5Xs/Qb+YA7DIpBM1V+CwbnY
 gNfxTMPS4tBdiovjeVDH20eGiKw2zbbEO/msOErYE9/L5Kgxa6EkcWqN5O/PqfRSkLZ+nE
 lm9uce5Yg9ZVLKOe0tNEq58PKgqj7x4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-DxgxMjBJPWiJ7uo7wOZlig-1; Mon, 16 Feb 2026 02:47:52 -0500
X-MC-Unique: DxgxMjBJPWiJ7uo7wOZlig-1
X-Mimecast-MFC-AGG-ID: DxgxMjBJPWiJ7uo7wOZlig_1771228071
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4836e35292cso24552455e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 23:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771228069; x=1771832869;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uol2fLV3qDx0A8pdj/OSTFONpzYOz9GPk6lW8EILWMI=;
 b=bHPGdylYXd1OXlLxfYrlWkDhDVHeYSKYX5OPBZwGi5DBCXkd2OhZzumaNTPZFygbpv
 EI/ilwgFCi4/1/Xvbf/jQQ4byb9un0DcDH1mp0i/sdbDbp9XY+BRV6Oglaz8mxz+BtT/
 AHiGR80IIsT4vN07MJ9xW6jC5rzRPwbV9caaesfgFo7N5Am+c4dhTLz2tpjBj5huP7QD
 k4iXaORAsbS0q6VafaWZBAtDnP4RfG3Eo9+hWYgGbFrA6SRa2LrdH4BacIwNraMK3znY
 s5sFhxK/v1EzoKAoPTNPAvaKzLQM+1tijatJHg+/RPVk5R7okf2ompcNqAOBJJnkf6qQ
 P3Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCt0DUbMcIzsXben3G1jfDmKaRcFJn2LQtG3fvedQdSfz5NUMgufdoK9FLfXR62L5bPvwlr7YvCM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxvRcAJRp+ves7y6s0W7bT5GlnYTXJf5KW7128lovMsEwdyJ3Z
 99bOuAAg96+cHILY+CMS5MueBLppmyA0I8scCSC+EnyVQbVuMiWZsM98blgFmvU54XTFM0+khC1
 l3JmE4SnTxGZW2XrfTm6RUCsB5DZLEdDcnFNlXK/L670W1btA/Poegn0+JAtLKN3ZvBct3Q==
X-Gm-Gg: AZuq6aLxoWzMzy7r2jxfmYuC6NFLdsGflEVo7dMMFOA7ANMyEfWcbsnTH8RhWufsLAt
 BBw+ccCY2XfH5KQbLq4x1+8q6lEMMdUjbvoUuMmDXLbn+EanHC/fdI44/9SBIDn3wFTUyCNp8il
 Si6Gq6LqAwda+sKV4IJwUzPLqyhbvjQhf1RUc7sy9xH9IYMs7ATXicuf5pAt62zKdMjUKlcXksw
 REDgqBXp49v2LVLgtv7TvcIloTdbLWqLwGZRfiwapdZjkIC79vh7qQU7ukr8xodxib/A/vPWBFl
 DTGOcXioFbKanHPj9q5iD3Mm0IIS6KB1ao3vk2lk46bztclUKUOTawCdG74kehDi44ajDb4sU8X
 zWUJbXWENfzVhiwGCcNbFvQyMHp6tjGYigEQSa+qPS5IsPUaV5k+AJcPjrzvuyXtwkeXhYdi4pf
 koInYi
X-Received: by 2002:a05:600c:450a:b0:46e:35a0:3587 with SMTP id
 5b1f17b1804b1-48373a4e82emr158832355e9.27.1771228068803; 
 Sun, 15 Feb 2026 23:47:48 -0800 (PST)
X-Received: by 2002:a05:600c:450a:b0:46e:35a0:3587 with SMTP id
 5b1f17b1804b1-48373a4e82emr158831945e9.27.1771228068384; 
 Sun, 15 Feb 2026 23:47:48 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd34sm469831235e9.7.2026.02.15.23.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 23:47:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Archit Anant <architanant5@gmail.com>, wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 nathan@kernel.org, geert+renesas@glider.be, marcus.folkesson@gmail.com,
 david@lechnology.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm/sitronix: add ST7789V panel driver
In-Reply-To: <CADJHxWCzbzD3MK+NLS3UVqXeH4cKop-ErNSnn_RUmAzRLmk7Mw@mail.gmail.com>
References: <20260214070123.41374-1-architanant5@gmail.com>
 <CAGb2v679248jj4CwQhYAbTUiPJ1=-JqX15CaNY94Cj_dFXwZXw@mail.gmail.com>
 <CADJHxWCzbzD3MK+NLS3UVqXeH4cKop-ErNSnn_RUmAzRLmk7Mw@mail.gmail.com>
Date: Mon, 16 Feb 2026 08:47:46 +0100
Message-ID: <87ikbx6sf1.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uYEjVig1E8fwCBeh1A8iL3GQFvdpJzgmOdDa-UloyOw_1771228071
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:architanant5@gmail.com,m:wens@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:nathan@kernel.org,m:geert+renesas@glider.be,m:marcus.folkesson@gmail.com,m:david@lechnology.com,m:noralf@tronnes.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:marcusfolkesson@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,lechnology.com,tronnes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 559C91415DE
X-Rspamd-Action: no action

Archit Anant <architanant5@gmail.com> writes:

Hello Archit,

> Hi ChenYu,
>
> Thank you for the detailed review and the pointers toward the documentation.
> I will ensure the headers are sorted alphabetically and the driver name
> conflict is resolved in the next iteration.
>
>> The reset logic in mipi_dbi is inverted when compared to panel-st7789v.
>> mipi_dbi needs to be taught the "proper" reset polarity.
>
> Noted. I will look into the mipi_dbi core to see how to handle the reset
> polarity correctly.
>
>> Instead this functionality could be merged into the existing panel-st7789v
>> driver. You mentioned above that that driver only supports the 9-bit SPI
>> transfer mode. However porting that driver over to mipi_dbi would fix this,
>> and remove some redundant code. And tinydrm support could be added on top
>> of that.
>>
>> I actually mentioned I was going to work on this on IRC. But I only ported
>> the driver over to use mipi_dbi, and haven't gotten around to adding
>> tinydrm support. I can send out the conversion patches if that helps
>> you.
>
> That would be fantastic and would save a lot of redundant effort. If you
> send out the patches to convert the existing panel-st7789v driver to
> mipi_dbi, I would be happy to build the 'tiny' (simple display pipe)
> support on top of your series.
>

I think we want to get rid of the simple display pipeline and instead just
use regulator atomic helpers, even for the tiny DRM drivers.

Please take a look to previous commits such as 2037174993c8 ("drm/bochs:
Use regular atomic helpers") or 622113b9f11f ("drm/ssd130x: Replace simple
display helpers with the atomic helpers").

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

