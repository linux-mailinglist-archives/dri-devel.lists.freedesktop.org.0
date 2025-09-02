Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28AB40DDE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CF310E828;
	Tue,  2 Sep 2025 19:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XAhItdP1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C375410E82A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 19:29:46 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-71d60593000so44073997b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 12:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756841386; x=1757446186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCDtmJ9MnRRD8pZdomc+bD7vyzpQ5/EL7gaHH0a7i9k=;
 b=XAhItdP1b8V3CgpYvMxy4mR72B0xHVINU1kr1h53ofWfpAiE07VTbd2/aAouH2aPfE
 k9YArZjtpD16pNHZBl7qrR8Ik5p37DPsEpAMh0p9HpqS/hIjIFWijjIqIpA+X0/WzzuD
 3/Sate9NxSkPM2kMEnx9a/leqnzshsDeHtySfljEerdbHXBNYUIyP4wr7Kc7SgT9XvEo
 FsLr0W2C2wB4fahmd5cyXxTmrLDNaryoDwPgVMDD4D8wXU4cBrnITfq4u8qgHS4j+Ms2
 iXLfQt80VT5SVsXe5liqf/3yvWb/krZhuOcURfhsl0rM35BwhcRQflwG1PsezZob4kUH
 dPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756841386; x=1757446186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCDtmJ9MnRRD8pZdomc+bD7vyzpQ5/EL7gaHH0a7i9k=;
 b=pR12g0NgJQgQGNs/bZOdtcUL2lwVEoGMK8ZRJFUh/CPjAtPiX1Olk8g3JkwdlM2Idq
 Dyw0Y+MvWVzbt6mITnxjnKFRM5U7xeov8x/tf5CoJ+w9TyA56efDXLMKmWOAzauHgxKo
 JBwlxrfbpsputnQudVgrWsKdb/WvDVjbX8a0XfzYMYUOIBPKBKvrWzX9emiv/xOXIo3F
 B7d/wqkienVO1SyiMYLZoc0dULQzi9wThQJ3KM4XNYqPyYEAnkXPbQMZVIzuKIIuMr0G
 WG/TRs5jHgkcELONWsR87EES9VDqkIN+cJHN/sa1YKkuFGPmnYQsMm7YYZc3vC/anxxw
 9T3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV09PQqzS/XGO+qizMAGqvUR6TJ33rHyfQf30E55AvtZnfMN7V7QsqeLZaOUhFMuJ0pHsEvlbayXaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLcmwt5HtES00wIHrBajxssy8kgcncCiuzrjkf4wwXr5KL2taQ
 YZuHDKY9o5vDtMd50ylEdw9dO/+nZx/t3fIJ46LoAdSptZG4R6GwPDZfk4V0iGw06z2ybQxXWCn
 TuZmgJvzG7zDgowZYw7ILH8J+W5/ah0w=
X-Gm-Gg: ASbGncvkA9H9kXLL50pF6+0JtN6xQYPAuV74gS30eDXUAD9Q3FfKOfHWzkXa2IDOlMY
 S9ZVSg1al+iws/pvtZ57WP1/6q5dKoKBo54WSME4+ctFmdsnSBFflW9o3US3DsDdJNoN0K4OfiM
 /6QYc6WIpVbBMjrvtG9Ws8Tm4a07W0oo4VwEY6SHVVo0CQ2jdVXmviiQx4CxMFWCp4goo2lY1Zb
 sOREyPeKy6+O3hBFmY6b6Kq7fGv4M2Hc+0d6I2HmFxz6T/DL4gyvq/o9C1xTiU3WVdpaTYr
X-Google-Smtp-Source: AGHT+IGTLvT2TgzPf6r2XqdEnizQavc2n6Hz47RT3wEvJ7iVTXIBCwd89zfqpXV936H4mpV9p0egjFgHh9H+RUCPcwQ=
X-Received: by 2002:a05:690c:3809:b0:721:64ec:bc65 with SMTP id
 00721157ae682-72276537066mr135149447b3.44.1756841385677; Tue, 02 Sep 2025
 12:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250829230251.3095911-1-olvaffe@gmail.com>
 <20250901092711.15832cfe@fedora>
In-Reply-To: <20250901092711.15832cfe@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 2 Sep 2025 12:29:34 -0700
X-Gm-Features: Ac12FXw1HjxcTsR5YSE7EFPgr2NIGInvguTOoGuC8pCUs2YgJlMpIsI50AoKFsA
Message-ID: <CAPaKu7QMy6c2zELBUXAUqL_NqYyC7v-xP0_dkxUhOnO86nUCwg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panthor: assign unique names to queues
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Sep 1, 2025 at 12:27=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
<snipped>
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/=
panthor/panthor_sched.c
> > index ba5dc3e443d9c..62f17476e5852 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -360,6 +360,9 @@ struct panthor_queue {
> >       /** @entity: DRM scheduling entity used for this queue. */
> >       struct drm_sched_entity entity;
> >
> > +     /** @name: DRM scheduler name for this queue. */
> > +     char name[32];
>
> The base string ("panthor-queue---") is already 16 characters. You then
> have a group ID that's below 128 IIRC, and a queue ID that's no more
> than 15, so that's 5 more chars. This leaves you 10 chars for the
> client ID (theoretically a 64-bit integer). I know the logic is sane
> because you truncate the string, but I'm wondering if we shouldn't make
> this string bigger to cover the theoretical max client_id, or simply
> dynamically allocate it (kasprintf()), so we don't have to think about
> it if we end up adding more stuff to the string.
It seems we don't validate queue count.  Sending
https://lore.kernel.org/lkml/20250902192001.409738-1-olvaffe@gmail.com/
for that.

On a user device that opens the render node once per second, 10 chars
are good for 317 years.  It lasts significantly shorter on a test
device, but the uptime is also significantly shorter on such a device
(hopefully).

But kasprintf should be harmless here.  I can certainly switch to it.
