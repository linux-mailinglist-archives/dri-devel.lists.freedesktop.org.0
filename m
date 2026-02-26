Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHQLGS39n2n3fAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 08:58:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22A11A2278
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 08:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE09F10E044;
	Thu, 26 Feb 2026 07:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZJ2OurkD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE6D10E044
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 07:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772092711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6HSMbdMfEtsXEv7wJXDWJr6XKZTaO2UazUOToDtNJT4=;
 b=ZJ2OurkD9BLjOWMhOyTXnqZ1cgnVeWx/JZv5qkPEQ4wuAV33/I8Q3BZ5oB6koshfc8QYKk
 v5rq7ONIL9IeVUAA/BqiVXAathe1GkK/VchQkP9A3fkr2uQX0snrzfVDimC7HOBC68FnPc
 HjMapXsuigw0ttDkqOCzjLuH7ee3sl8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-VTW44jwxNDOJbKV018W8lA-1; Thu, 26 Feb 2026 02:58:29 -0500
X-MC-Unique: VTW44jwxNDOJbKV018W8lA-1
X-Mimecast-MFC-AGG-ID: VTW44jwxNDOJbKV018W8lA_1772092709
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-483101623e9so4344085e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 23:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772092708; x=1772697508;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6HSMbdMfEtsXEv7wJXDWJr6XKZTaO2UazUOToDtNJT4=;
 b=cPSTGvMyxg7bINh2IlSaTbJZdAwdF3NbFgt9SHh4gLz39+pcgvS3fAJu3juoxP3hMS
 dlYZZnZ1NLsLa2kGPd5ffmfqvl+X9iEx7NyinewIDAmh70tA8eLkG92ZP5tvr/tvDquC
 /GjndjW/9vXwd0A1j88joYWA7Dlhu0l/pHmLBPXAkrJFjkzg5sJMolasehkoGt/iM+2T
 yDgXJo2neO5313LquUCJ4Onzc7VjhQkb8ifMYppLi34wWrioLXjRWyq5FMxqQjEPJPqa
 EbzVe5jmQu3/plJAAOxKpB2WXfmaMmZGMo/lZb99A6dBsYw9ISs2nxLdPrxRhOIPIV1W
 OkaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuYCP6YSeJySqbDDXxeLLfcU1l/Dq784gmtWheyGaXI1IvDrJXUK1d0/sXgEDYwmibkFQKxQtRgxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUJqFb7eraUHpDYONcLSu+0Ek9RQLBbDldxVrp/k2+56GcAz1V
 kRZs6X0oZ754jTauT8BYhL4eY75YMwQ255ObG/pQhaeyC8oE/p9NmWxkl5SFAhWgTUgrVZdwbZO
 Z1ot4GduiUNxKIt69z2pS+fUCx6hw93kMMHFxInOoklcokhVm0TtOw68MkS7K2Sey9b3iSQ==
X-Gm-Gg: ATEYQzzwivqNZ0JZ+k5peXy6IsibTRyEkhCAz4zKlxJw3e+L9kr5EbNRrO1KU0qzZo4
 Ms0quniDgcEf72X4T7F4CAVW51mqbJT75YvpsgBjcaqiVEZK9GU0hsFFFDHjCrcXBX2HgGi8yit
 PB+u87wbrKnHN30txhOPbWlUVYQytpVg2Wy1zR7GzCAYFtwt+48zLj7LwKss1PcbTh2x/NJ+OTO
 e49pmdSgwTZkPcBeM7eSOJz/B/sT6Hz6mFr18QDel2kkihCsr4XCvjy/f2AfJxsz92o6HRTSJCH
 m4lKjnKBmE+gSgIU1SKQhp6+RF71+tnTjYc5I1rnenNMXRykjXn4iDsZIEdx5kDUk6Bt/LRxpKl
 1Gxn6LFvp0XROFY1he63bLQon+xbTQeiw6niNDom05tVqyprQgllDr/CxirJgXr/y3VOgb/b8RZ
 Nzwms1
X-Received: by 2002:a05:600c:4e0f:b0:483:badb:6191 with SMTP id
 5b1f17b1804b1-483c3db0103mr18741885e9.8.1772092708573; 
 Wed, 25 Feb 2026 23:58:28 -0800 (PST)
X-Received: by 2002:a05:600c:4e0f:b0:483:badb:6191 with SMTP id
 5b1f17b1804b1-483c3db0103mr18741605e9.8.1772092708169; 
 Wed, 25 Feb 2026 23:58:28 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd750607sm127604395e9.10.2026.02.25.23.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 23:58:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Francesco Lavra <flavra@baylibre.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/solomon: Fix page start when updating rectangle in
 page addressing mode
In-Reply-To: <20260210180932.736502-1-flavra@baylibre.com>
References: <20260210180932.736502-1-flavra@baylibre.com>
Date: Thu, 26 Feb 2026 08:58:25 +0100
Message-ID: <87tsv4ueam.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _ap4dQCfr3lA6vlY4SJRUSHt6VzcZaf-BXFdEUM4n_c_1772092709
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:flavra@baylibre.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:wens@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C22A11A2278
X-Rspamd-Action: no action

Francesco Lavra <flavra@baylibre.com> writes:

Hello Francesco,

Thanks for the patch!

> In page addressing mode, the pixel values of a dirty rectangle must be sent
> to the display controller one page at a time. The range of pages
> corresponding to a given rectangle is being incorrectly calculated as if
> the Y value of the top left coordinate of the rectangle was 0. This can
> result in rectangle updates being displayed on wrong parts of the screen.
>
> Fix the above issue by consolidating the start page calculation in a single
> place at the beginning of the update_rect function, and using the
> calculated value for all addressing modes.
>
> Fixes: b0daaa5cfaa5 ("drm/ssd130x: Support page addressing mode")
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

