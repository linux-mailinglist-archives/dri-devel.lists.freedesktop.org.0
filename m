Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP02IY2YpmltRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:15:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACB91EAA6A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485C010E653;
	Tue,  3 Mar 2026 08:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE9F10E653
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:15:06 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-94aca174532so1515615241.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772525705; x=1773130505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baIVfZQL5mR/z7ZDL+omelyIyuKMeJSDP1yp3gkoZFE=;
 b=MmhJD1hG2Vly9BpPtScvOaI331e7KOUxx+FY/kPxYIHwQoHdyRewOsTS5uvIr7ScZf
 ceVGianXwxSLPO3GrsZN67OKEwM4FOWm1ZzLTFBKpovFIjuYs2O4mzDvzaZkFHANfYB5
 dl+XECq1Pmb5ypFI6OKAK+u5QYsjJ31dGKIyCPYekG86+DdvM+09occEYn5/h7yCDvPt
 GOWuvaC4Odm4ecXZmFj4exFFar4rpXgtGS6tMQC1nkGVKQ+BlGVQn1anVLbHAXELrOp1
 uHCBBBTjtxGSyj3zlDn5KrL+M443ngKEBMrMHoi39S8vpzmZIo+u+d9ezKndpWSlOT5E
 CGuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbiMmBc19do//xatzu6JPQXmnvweLKFo3cIc2sbtDw6xP5d9UcAn2F0mhy8IuT+x266XSx4/f/AoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkbiDYKKzFNOxMTU2PB4FRzlHcIBQ1RJVy9UzuPX/szd47zKty
 DITj/izFu5f09NpgElogEDwmtvnonZ5KqqWtHNLrflN1Walo1wkhb/GfM66kJvoV
X-Gm-Gg: ATEYQzzKz1jvT1MfMvAR/Q3rjNdxAePVyZYMAWLITIpsZWyUFkH5SbgTg1Sw8y7f4Tr
 mEG0nGmz1FyC7Sc3F43uYk2rcm/iW6v4KNwvwJVAsw6M10U5zg7KfqZgFSL8q9GlhjjQhoujLna
 G3cwsKQ9UANToCuINhTxPzyL+P10EvZ1NSPoEfkcRKIm3qPa9jyGuhFyrI+Ha+5wmUu6+3BXZdy
 E1Mt/rlbsB+puF52g55yy2cGXMc/ou3ulWZNHxbfXOAntWlWuFTENYRolUnHgQUNUDZFALIRTUf
 pUVKJ3rbrgbuKcpAF0bl2HtrvL/px4mlQa5aQiJ/oyCjINF36lWDQ2xxnfYqsLMkCgz0pKyOubq
 eWg5BphV2f+9sJ6v1POAx2TpF088M88QPICvSSpOGXOzuDeZehUirrB/sNo/12ojUhyJ7CTLu9e
 wePSGeuaFu4olkwMySdA8rswwVUM0clfv4dsRJEEnit+XuTugSLI1wzIf2eKXx
X-Received: by 2002:a05:6102:3f0f:b0:5f9:39e9:65b0 with SMTP id
 ada2fe7eead31-5ff32281b7dmr5866743137.4.1772525704944; 
 Tue, 03 Mar 2026 00:15:04 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ff1ea6f7fesm15783021137.13.2026.03.03.00.15.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 00:15:04 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-5fe086fb0bcso1134260137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:15:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQwmimLpmhudq/wmgY4ZyXlsQe4hvpMXsMmkukxoK+hIkDcaa9zE2BZLRa386wW3v/92ltph+p9HE=@lists.freedesktop.org
X-Received: by 2002:a05:6102:508f:b0:5db:cba0:941 with SMTP id
 ada2fe7eead31-5ff325870f6mr6153888137.38.1772525704432; Tue, 03 Mar 2026
 00:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
 <20260303-uppish-finicky-mustang-cd135f@houat>
In-Reply-To: <20260303-uppish-finicky-mustang-cd135f@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 09:14:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
X-Gm-Features: AaiRm52aGiAdtZAUmev5KOPqlNFWQU8B725pPLRxm8mb5akJev06moWAe8DIoF0
Message-ID: <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
To: Maxime Ripard <mripard@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Queue-Id: EACB91EAA6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:marek.vasut+renesas@mailbox.org,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.freedesktop.org,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.563];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:email,linux-m68k.org:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Action: no action

Hi Maxime,

On Tue, 3 Mar 2026 at 09:07, Maxime Ripard <mripard@kernel.org> wrote:
> On Thu, Jan 15, 2026 at 03:45:53AM +0100, Marek Vasut wrote:
> > Update drm_of_get_data_lanes_count_ep() return value documentation
> > to match the drm_of_get_data_lanes_count() return value documentation.
> > The drm_of_get_data_lanes_count_ep() is only a wrapper around the
> > drm_of_get_data_lanes_count() and therefore returns the same error
> > codes.
> >
> > Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep")
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> > --- a/drivers/gpu/drm/drm_of.c
> > +++ b/drivers/gpu/drm/drm_of.c
> > @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
> >   *
> >   * Return:
> >   * * min..max - positive integer count of "data-lanes" elements
> > - * * -EINVAL - the "data-mapping" property is unsupported
> > - * * -ENODEV - the "data-mapping" property is missing
> > + * * -ve - the "data-lanes" property is missing or invalid
>
> I have no idea what "ve" means in that context. We should rephrase or
> pick something more obvious.

"-ve" = negative, "+ve" = positive.

git grep "\s[-+]ve\>"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
