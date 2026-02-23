Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANhYFaZenGkUFQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 15:05:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2467177B66
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 15:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F3410E44E;
	Mon, 23 Feb 2026 14:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ag9ZhFAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0752710E44E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:05:21 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-45f0b597eb4so2584713b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:05:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771855521; cv=none;
 d=google.com; s=arc-20240605;
 b=eHjWOUOXwE8vNq/basF6XVkVuOUhfNTP8FR5MMZxTRG7i7u3ilZqlXYxs2bNWwNFMQ
 DCthHJBLyThSGfyv6NIYvWPDy539Mn9/8HZIFhAUdwOl/8mIw+aapDAG9kZh6FF++Sto
 EC8p8Pf2HSBIFOCTicIq+8gNv+V6gLM2D0b4uJL3zRGCwHLhn89qVMaTIxdp9S5SWPM2
 uab414e1JFsbVInjGDeFKHF+wQygM5At242sdRhRhzNG6wlymU7gKdoQHH80L2GVGUt2
 pGJtpt8ni41xr+qaznwcCeqgUqcRpV6w6k+tNV6DGa4Bxr4rK4/e0ib3Y5R7wsf9iiED
 obMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=02i20cNAG6V19KWqUmdqEUoqgzs3TLmYZKkP6GGWQb8=;
 fh=87l6OdHO2eaUbWKCbYOSYGFav3b4kVUbvbkP5jaObXo=;
 b=JVgefFKt7Ta9KPyBoaazVY2WQP4PMzw5MnCdqje31R7sJKcvEE+03OQzDAKXs3fSkT
 Mmeo4zBnswAChPvXpA+BsFoIyNu/2fKwlUOgu9DgDc132V4tLoBibJBBKGNAkx9E8MjB
 YMXGCfaWR4kpFykvimbA6705P9YwLT+04z+r+NFmf6rHpvAuvj3wwofF3fe+ijAzPXdr
 iFSC6jYKoXSizQj9lZYtdQsXNL+EIeSx/zhaYNp1ywoGps0L70ymRG5cqPl2n7f4c/4b
 Frri7gSd+27CGpokjO8FJzwbN/8soBWENYRhgSzjIhPnCAthRDopkt2KrTxcKNAT07kS
 bpgA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771855521; x=1772460321; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02i20cNAG6V19KWqUmdqEUoqgzs3TLmYZKkP6GGWQb8=;
 b=Ag9ZhFAe6ypnnwrSDsfUP8OqkKp0VDM1eZ84k20z6zZbGeIpF++5GblrWU2bKStL1+
 wSAut8y2xVcbi0nEE3noaEYcKHnptLp6TSplpS2G73xAYb01Wr9UAeCCEGp8D0pxO6FJ
 Z45h2OF9jrJd8ycWDizHD29wkUGRVGsFiB6guVrlALeSuz+cfJpCrosGacMB+KdbQ4fQ
 NVIA3itNJVzOu5t+XFiarw5yIQJiaFXNs18KyRLXFV3Ta5txTx52OzJHSV+S70F6Zks3
 GHByh1yBfkOWoGXftlk4ZUm9qrob925DC1ohXBEKwuVN0U/Prxo9FqJchHHQAFID03o9
 LSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771855521; x=1772460321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=02i20cNAG6V19KWqUmdqEUoqgzs3TLmYZKkP6GGWQb8=;
 b=RKTPo3r04wbrKZ9yXYWra45VDDLxN2hLzmImBbh7EhtDH1Y1NAgMhtZMwxaL+5yrZZ
 wt6d8uG9iS8uU0DrilcC8Dgxwd5Vi9kUWz5k9FckjYtf/VvZLE9qVNZW8GqudNhEB27H
 Cscfi7aEy/DiPLRR9Qb2Ka27neUjKs1RZYf5PnRIQi71DP7V7SrI3hvoIsODesXs8UbE
 OUbK37NGe+h85xRWSxnbUR2jx9lUvJLh9E+kl4onG+QJ+pYR9UsUSnuDuMyWoNyPT8tk
 +z7VM8YM2ZbbBYpk/jyZ3FCrxxhkP1XJ5aVBpx5XIykJP1PtaJZh7yWlWZmSV2weGPf3
 o6vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWelfZ6THRJWw4dNlQsfdZ3Mi0MsaF7p/M30euErcM1JB6PYbw85d9jgktiriWQaLUqf4dR/sP/TX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyr968Roc+ebGKbF6Zd4pBifhDf7Y8yz2WF1he3N+I0Nrcf2R3d
 FTJiyAx+XDou3tyykpw/n6ulwRUMhi0wFNGfM1OjuGSl1NHeH1getrZiN0kZMZ37Ds6/cf8m1EA
 MEcLogyEqjXiDeMBN7BLGYaGp1wndQUM=
X-Gm-Gg: AZuq6aL9Pou/+4I0aQrFrmUxryw/+CfM/AvEA+H9BSfJFFrN4d+y/FZgoAWR/hOpCnZ
 8Dp2eoZaqBGrqvDeU4svcgIQrmquGpk/1e7GmyX0939w9b4dQgpmwuCf8zc0uaDsQIaHovP4vXZ
 u8OzlUKeVo0EMXaHVK1+Dz0i2U3vhFgkUhlJ/dfXVSHkqfx+Q9sVoS5Ff1GiBN8EXPG+AStKAqT
 WH93eslF+53ZDIJPo3fpywswgR9BLnijdEWd/BL4OmbL7aaOcQoVUVmELxKz58PuKCjOqDEDRFC
 XIyFu0o=
X-Received: by 2002:a05:6808:4f20:b0:45a:6cfe:b00 with SMTP id
 5614622812f47-4644638ad16mr4078070b6e.43.1771855521056; Mon, 23 Feb 2026
 06:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20260206133458.226467-1-tzimmermann@suse.de>
 <0d9ce3db-76e0-4468-9b0a-6c488f8eaa70@suse.de>
In-Reply-To: <0d9ce3db-76e0-4468-9b0a-6c488f8eaa70@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 23 Feb 2026 15:05:09 +0100
X-Gm-Features: AaiRm50IadgGube12bupDBvo0DbDEVpc0RzYmcR2XHS1sPaDkZ7ZjnThL_zYD3c
Message-ID: <CAMeQTsYD6jWmuRgMddyQEX4YaGEa=fjrbsMc7hHYPxjAiC9Hjw@mail.gmail.com>
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
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.com:url,suse.de:email]
X-Rspamd-Queue-Id: A2467177B66
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 1:49=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> ping for a review

Hi Thomas,
Sorry, I'm very busy at the moment. I hope to get to this some time
during this week.

-Patrik

>
> Am 06.02.26 um 14:21 schrieb Thomas Zimmermann:
> > A client buffer holds the DRM framebuffer for an in-kernel DRM
> > client. So far, gma500 has created an internal ad-hoc framebuffer
> > for its fbdev emulation, while by-passing the regular interfaces
> > used by user-space compositors.
> >
> > Replacing the existing code with a client buffer allows for stream-
> > lining gma500 code and later also the fbdev helpers. The new framebuffe=
r
> > will be registered against the client's file and will support handles
> > for GEM objects. This is then just another framebuffer within the DRM
> > ecosystem.
> >
> > As there's still a custom GEM buffer object involved, patch 1 exports
> > an interface to create a client buffer around it.
> >
> > Patches 2 and 3 update size calculation in gma500's fbdev emulation and
> > makes it use the helpers provided by DRM.
> >
> > Patch 4 converts the code to client buffers and patch 5 removes the
> > now-unused framebuffer code.
> >
> > Tested on an Atom N2800 Cedarview system.
> >
> > Thomas Zimmermann (5):
> >    drm/client: Export drm_client_buffer_create()
> >    drm/gma500: fbdev: Set framebuffer size to GEM object size
> >    drm/gma500: fbdev: Calculate buffer geometry with format helpers
> >    drm/gma500: fbdev: Use a DRM client buffer
> >    drm/gma500: Create framebuffers with drm_gem_fb_create()
> >
> >   drivers/gpu/drm/drm_client.c         |   3 +-
> >   drivers/gpu/drm/gma500/fbdev.c       | 101 +++++++++++++-------------
> >   drivers/gpu/drm/gma500/framebuffer.c | 104 +++-----------------------=
-
> >   drivers/gpu/drm/gma500/psb_drv.h     |   6 --
> >   include/drm/drm_client.h             |   3 +
> >   5 files changed, 64 insertions(+), 153 deletions(-)
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG N=C3=
=BCrnberg)
>
>
