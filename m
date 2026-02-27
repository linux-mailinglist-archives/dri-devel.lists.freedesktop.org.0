Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHZYMbJsoWm6swQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:06:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253271B5C46
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6D610EAE8;
	Fri, 27 Feb 2026 10:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C33eHuDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5508410EAE8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:06:38 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-463a0e14abfso1502359b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 02:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772186797; cv=none;
 d=google.com; s=arc-20240605;
 b=AJP/TAesaUluvqA58sfS87RRjgO5fd6fYo7QPQhkRhqSbRB3nCIb7nGHMVvEKzi+AY
 VH9BHm5of6niRhuyE3zqNP9VyHULf6lRZOOWVwfYC1brFls5qX9JtxVnrapVXLJN8alN
 dz2N/IHIenjTb5IQCH+XzJElA7w057OxyeEyN8UNEMZsYuAQj/xFcy09+mnYiAjb4wF9
 YkzC/Y5JJow13RchSa+NYzjtxO5gp0epotKZACu1ZRcU+Qt7FPPFXdBzO+K7BZIpksXq
 ObFwiN2f0DtVOlz42/fS6BBW8VbMI6LwpCXIxctYPSHRseqbfZ/zhgAaEEQGWOMyw4vp
 bVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=27VilPVWJqXI8XQyPgT/E1Zp9frs2mvVSAkLJv2NCF8=;
 fh=M0AemfvXK8h54XGgrf5aoDm4KVwhESI6VWrzB6Qzk0Y=;
 b=iY5MP2PwqxK5fjPbyBejSFltlCbtM3FN/dJT4YfKXEIkeYLkju1yc6jjnqvwg2I4UI
 kVsldtVDWnFyH7cAWcp/JLfnaHfPlmLf1GyNH50HKnYFBjPmhpQ8wUJzNhfq1pmPQPXm
 qBQPYyRH41zf6tVfKkoUcUHCcz2iIioQu6pw8tcvizhTKU4X6lKzmxli8sVl8slIr11D
 mensr5+XbBlfLe2UVS67tWZ+FL+vhNaNr3gT3P5j0NNMEbcEtSveK3frXIWNVgMUGPiI
 K94HuQTf6UZ9OrhhN16hooupvDajivWQR4v8e6NpPPJfqmLRou2FRRbm5I706q/5aqp+
 yH9A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772186797; x=1772791597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27VilPVWJqXI8XQyPgT/E1Zp9frs2mvVSAkLJv2NCF8=;
 b=C33eHuDsyl+LnWQJ5lOme8csXbdHsMXg72oCj0M6GeaZO5oaGsS+STo750F5nBSkBN
 elWR7yWvSvzwR9tlMHlTsjUOnlMdNMRwUtwtteWBZIg8j4cHbt6T0ZmUlfcIzczwXaoV
 AhAn+IfNoklEoxJTrfA3/krnaBQr64x6tL73ZHSP0GANK+HH2p2iq2b3yddkQiiKhY3C
 Er3UriTtuPzV3WZCTt8Cn3P6M9fsUKcYrF/euDFP6Yhcn7NsInO3fK4NCJOmyG/r0g5+
 zIPyYnkGaCnKlwOb9IvDb/hvq3nObjEBYYJs86l/nCTJL8R2ABRx8KjS0ev6+TfQJ3an
 dSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772186797; x=1772791597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=27VilPVWJqXI8XQyPgT/E1Zp9frs2mvVSAkLJv2NCF8=;
 b=WFTM+HipYLdFwyxX5nClJYEiPLHTPt/Q+MEoNCAhVG2wx8ha+KYwqMGx1AMQKE1Shc
 0DCsww4mdWN3XkZ+f6iKDtMFOEbwXNU+JTI/gmgXDYKbNaB8ITf54vQRMU7ijugTd2cd
 rCi23ZxujrvaulO2/Y1Rlb+R4APjG8F5oxZC07rbcsGg6/czBvKyhUHeowzzsjJ/SrFA
 nR6pfJn/yS2RjBtjW5reYAOW3xEcmeqroUTyc5GBb4q3AKHnOOD6Olth086Tk87c5XAZ
 Y/a04g4C3f5C182+Lsvd0ULjOGUt85Os0NEyci37d2hegucwAOAZS/xp4phr+1jgF9oQ
 qTcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjuOipxZqK6S9gOO2QHPkdDYPBDQLKX5bN8TXbVx6k5B6U/F9uTBjZqfwVZrytfKVyZ2TYr/AxOk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz431jyKiFUiPDdbB6I/HEJm3qITbEsr4+0KArpbM8PK72RXG6f
 z/Bq06NDytT09kFYwdSGJPL8mOo2blzKarvhprDKHbbNDRvMAfr4hupM8GQn1URdI/weE1Rd9cX
 odn8blb1fYZ3zZMTyDKlieIHzNo4DIwg=
X-Gm-Gg: ATEYQzyUhOkpZ9hwljDv1QKwc+XI/a8QFif4SNLKRpKTWgV2TeKU1tQoehZzE+vG5R3
 GGnLQwg1sOW8tMipBvqj4AplR7VeW+eIzecRgD1AhyyKfXD7XOARVBiKuSZqdxDCCPnIr9g17lu
 qRGFIDmfb0pXYIfdNbLIzvJIoE8mjYLlSK4kkyZf1VxtHQZZIw73P2khI0hUH2Q3glLlZAGfILo
 RF3lxz4JHL9m0Y+rjhPqPfFMdDUnMOw/wt0ShIDjNr0dv9RDDwR60xqnoz2i7JP9S5M/h7ggTRC
 t27P3JefTJlseX1zgQ==
X-Received: by 2002:a05:6808:c236:b0:45c:8c9a:44dd with SMTP id
 5614622812f47-464beb41a9emr1183173b6e.39.1772186797299; Fri, 27 Feb 2026
 02:06:37 -0800 (PST)
MIME-Version: 1.0
References: <20260206133458.226467-1-tzimmermann@suse.de>
 <0d9ce3db-76e0-4468-9b0a-6c488f8eaa70@suse.de>
 <CAMeQTsYD6jWmuRgMddyQEX4YaGEa=fjrbsMc7hHYPxjAiC9Hjw@mail.gmail.com>
In-Reply-To: <CAMeQTsYD6jWmuRgMddyQEX4YaGEa=fjrbsMc7hHYPxjAiC9Hjw@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 27 Feb 2026 11:06:26 +0100
X-Gm-Features: AaiRm53xlUQ4TZ5rCguwKyK79IKzj_hdVrAreOVMxQchmleZc7dJTbQyA4HIk3Q
Message-ID: <CAMeQTsa-RTrTYTPiAHvO15QqQhsihGEtq+S_fUSiQUqQg2v2LQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/gma500: fbdev: Use client buffers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[patrikrjakobsson@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrikrjakobsson@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 253271B5C46
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 3:05=E2=80=AFPM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Mon, Feb 23, 2026 at 1:49=E2=80=AFPM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
> >
> > ping for a review
>
> Hi Thomas,
> Sorry, I'm very busy at the moment. I hope to get to this some time
> during this week.

Looks good. For the entire series:
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

Please push this to drm-misc-next

Thanks!

>
> -Patrik
>
> >
> > Am 06.02.26 um 14:21 schrieb Thomas Zimmermann:
> > > A client buffer holds the DRM framebuffer for an in-kernel DRM
> > > client. So far, gma500 has created an internal ad-hoc framebuffer
> > > for its fbdev emulation, while by-passing the regular interfaces
> > > used by user-space compositors.
> > >
> > > Replacing the existing code with a client buffer allows for stream-
> > > lining gma500 code and later also the fbdev helpers. The new framebuf=
fer
> > > will be registered against the client's file and will support handles
> > > for GEM objects. This is then just another framebuffer within the DRM
> > > ecosystem.
> > >
> > > As there's still a custom GEM buffer object involved, patch 1 exports
> > > an interface to create a client buffer around it.
> > >
> > > Patches 2 and 3 update size calculation in gma500's fbdev emulation a=
nd
> > > makes it use the helpers provided by DRM.
> > >
> > > Patch 4 converts the code to client buffers and patch 5 removes the
> > > now-unused framebuffer code.
> > >
> > > Tested on an Atom N2800 Cedarview system.
> > >
> > > Thomas Zimmermann (5):
> > >    drm/client: Export drm_client_buffer_create()
> > >    drm/gma500: fbdev: Set framebuffer size to GEM object size
> > >    drm/gma500: fbdev: Calculate buffer geometry with format helpers
> > >    drm/gma500: fbdev: Use a DRM client buffer
> > >    drm/gma500: Create framebuffers with drm_gem_fb_create()
> > >
> > >   drivers/gpu/drm/drm_client.c         |   3 +-
> > >   drivers/gpu/drm/gma500/fbdev.c       | 101 +++++++++++++-----------=
--
> > >   drivers/gpu/drm/gma500/framebuffer.c | 104 +++---------------------=
---
> > >   drivers/gpu/drm/gma500/psb_drv.h     |   6 --
> > >   include/drm/drm_client.h             |   3 +
> > >   5 files changed, 64 insertions(+), 153 deletions(-)
> > >
> >
> > --
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> > GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG N=C3=
=BCrnberg)
> >
> >
