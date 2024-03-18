Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3046687E635
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 10:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83B010E90E;
	Mon, 18 Mar 2024 09:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LZKQ28FT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4277010E90E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710755301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4y4SgSMn0xhvmoHXkMRxARRoLMhg77gR29I4xBsDe8=;
 b=LZKQ28FTW2evtqzzXtrigNIcD6IakQILD8HVAx32MCoMKBGEdYPN4vPLwS9JqmWsCxtIuE
 K2/OOOR4kJDm0BUQMV7dbFEAHONgWFdO0kTI2q2tIIg5fAwF6XlZHCn7lcOPc7a182ePp4
 EmtC4iyYOMrP26u2ScCGKfOpUnJdudE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-fet7Y4ooP_yPk3kpsFJZvQ-1; Mon, 18 Mar 2024 05:48:19 -0400
X-MC-Unique: fet7Y4ooP_yPk3kpsFJZvQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-33ed2677640so1656083f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 02:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710755298; x=1711360098;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4y4SgSMn0xhvmoHXkMRxARRoLMhg77gR29I4xBsDe8=;
 b=MhgMEZVUgFN5+c/U4vO37Rg0idOXViZPt61PuODRyfFEYNYcJhwOChNSZhbzUlWlGu
 glCcMT9vH0not4FzVMAbe2ygC8uo0loUJi21jCpBthLL2Oi7o7MPGm0/AXBbo9AqMW79
 Kqc5C/XOrJEjK25H3zCgk+EVC4RFQU7z9EkS8kxc4EtMmp9Mwjh6twED9X8hBRWfpurt
 eIl6hKaJi609QF+4y9KYVeM5oq5LUV5Gm6zPTSMnY6+k7f5VSFRT3spjiQuYOXkhRL3H
 b86QntmcB/rix+V1qVupvGfFeDS4G8ZWSOj1tOxqgUJrCYy+kNcA/VoUmtH2G6N9+rIZ
 auNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvDcQ8s0yKKT6qEkvJflza+gWpSXQW2iIiNxsHVM2DpNl+ruAtoN09cHwrXwmHLsgacY9yFcekJZA+31BmJ68n+hdZiS/jbZp5akBHiFDm
X-Gm-Message-State: AOJu0Yz0mRTlHSYzZcmXYKFBzE9rbwftcr2mJceyEODKeG6DHDziO8v3
 QZjwfavVK/XDQ1Pw+Pw0NBFQNgHS4AHf914r6E2IHAaqgqk2w7DsVbr6ShS/f/sCjYkStCFCS6Q
 30DV8bftiaiL4u9SqFJOvqhKnKiHRzpHOVBg63kCGvaXNW+0Ehi7vqm8rR/9BaDheVw==
X-Received: by 2002:adf:f3d2:0:b0:33e:8ba7:e53d with SMTP id
 g18-20020adff3d2000000b0033e8ba7e53dmr8843523wrp.7.1710755298491; 
 Mon, 18 Mar 2024 02:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWQR49MtOFntHhQbEWdf58/z7aANwNdxsBw8JKFRo6fJ8CfctzQV4HlXJ4mhfSmdeTYWfwNQ==
X-Received: by 2002:adf:f3d2:0:b0:33e:8ba7:e53d with SMTP id
 g18-20020adff3d2000000b0033e8ba7e53dmr8843502wrp.7.1710755298029; 
 Mon, 18 Mar 2024 02:48:18 -0700 (PDT)
Received: from localhost ([90.167.94.24]) by smtp.gmail.com with ESMTPSA id
 m10-20020adffe4a000000b0033de10c9efcsm9324992wrs.114.2024.03.18.02.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 02:48:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zack Rusin <zack.rusin@broadcom.com>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zack Rusin <zackr@vmware.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 01/43] drm/fbdev-generic: Do not set physical
 framebuffer address
In-Reply-To: <20240318-dark-mongoose-of-camouflage-7ac6ed@houat>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-2-tzimmermann@suse.de>
 <CABQX2QPJJFrARdteFFZ8f33hvDx-HSyOQJQ7AMFK4C8C=BquTQ@mail.gmail.com>
 <e684558e-8308-4d73-b920-547f9012a2cb@suse.de>
 <20240318-dark-mongoose-of-camouflage-7ac6ed@houat>
Date: Mon, 18 Mar 2024 10:48:16 +0100
Message-ID: <87y1afg9b3.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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

Maxime Ripard <mripard@kernel.org> writes:

> On Mon, Mar 18, 2024 at 08:59:01AM +0100, Thomas Zimmermann wrote:
>> Hi
>>=20
>> Am 18.03.24 um 03:35 schrieb Zack Rusin:
>> > On Tue, Mar 12, 2024 at 11:48=E2=80=AFAM Thomas Zimmermann <tzimmerman=
n@suse.de> wrote:
>> > > Framebuffer memory is allocated via vmalloc() from non-contiguous
>> > > physical pages. The physical framebuffer start address is therefore
>> > > meaningless. Do not set it.
>> > >=20
>> > > The value is not used within the kernel and only exported to userspa=
ce
>> > > on dedicated ARM configs. No functional change is expected.
>> > >=20
>> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> > > Fixes: a5b44c4adb16 ("drm/fbdev-generic: Always use shadow buffering=
")
>> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> > > Cc: Javier Martinez Canillas <javierm@redhat.com>
>> > > Cc: Zack Rusin <zackr@vmware.com>
>> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > > Cc: Maxime Ripard <mripard@kernel.org>
>> > > Cc: <stable@vger.kernel.org> # v6.4+
>> > > ---
>> > >   drivers/gpu/drm/drm_fbdev_generic.c | 1 -
>> > >   1 file changed, 1 deletion(-)
>> > >=20
>> > > diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/d=
rm_fbdev_generic.c
>> > > index d647d89764cb9..b4659cd6285ab 100644
>> > > --- a/drivers/gpu/drm/drm_fbdev_generic.c
>> > > +++ b/drivers/gpu/drm/drm_fbdev_generic.c
>> > > @@ -113,7 +113,6 @@ static int drm_fbdev_generic_helper_fb_probe(str=
uct drm_fb_helper *fb_helper,
>> > >          /* screen */
>> > >          info->flags |=3D FBINFO_VIRTFB | FBINFO_READS_FAST;
>> > >          info->screen_buffer =3D screen_buffer;
>> > > -       info->fix.smem_start =3D page_to_phys(vmalloc_to_page(info->=
screen_buffer));
>> > >          info->fix.smem_len =3D screen_size;
>> > >=20
>> > >          /* deferred I/O */
>> > > --
>> > > 2.44.0
>> > >=20
>> > Good idea. I think given that drm_leak_fbdev_smem is off by default we
>> > could remove the setting of smem_start by all of the in-tree drm
>> > drivers (they all have open source userspace that won't mess around
>> > with fbdev fb) - it will be reset to 0 anyway. Actually, I wonder if
>> > we still need drm_leak_fbdev_smem at all...
>>=20
>> All I know is that there's an embedded userspace driver that requires th=
at
>> setting. I don't even know which hardware.
>
> The original Mali driver (ie, lima) used to require it, that's why we
> introduced it in the past.
>
> I'm not sure if the newer versions of that driver, or if newer Mali
> generations (ie, panfrost and panthor) closed source driver would
> require it, so it might be worth removing if it's easy enough to revert.
>

Agreed. The DRM_FBDEV_LEAK_PHYS_SMEM symbol already depends on EXPERT and
defaults to 'n', which implies that isn't enabled by most kernels AFAICT.

So dropping it and see if anyone complains sounds like a good idea to me.

> Maxime

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

