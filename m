Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNUSNo7qp2nelgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:17:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CC81FC5F4
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF27A10E965;
	Wed,  4 Mar 2026 08:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="diycga7G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com
 [74.125.224.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6001910E8AF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 19:12:45 +0000 (UTC)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-64c9cabfe5dso7428293d50.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 11:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772565164; cv=none;
 d=google.com; s=arc-20240605;
 b=Fah5BUnYyp3h4JsGaQPX4kHvh0HmwxijyddUAajRdyDG6ABKJ9uyTxeySWL2WC0IyP
 Lof0CpK28JOHEBu8Aj3sX/85ta39oWULoLDJhnJqmYCHUD8yaaGhMzKoj2DmeuqQvZ0t
 h2UdAsMWGvCtFrv9/U5bpnjbGRNm0Kchq8+pQbg86yjVx9R9zQD74fmlSCD1nqCLx8SW
 3HjURDzornK6sztWHWBagYTbb1LPFZY3mWdP7Q8LGuvMEIZwZ+EQIiLnYRM4ugaunajl
 Y2GGByM4wiWg5eB82onUYZ8pgQ9IeofRzX8mVCkAngxNPAE48rseFFXA1vJpxzk1MvqL
 r2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ctyo+PV5oXCna4bhLsZqOuoNqZKYNLazRKDdvHT8UBw=;
 fh=N5UDXLJJEKAgdj/NJu0+1t37ytFpGhi37H38J4LQOKw=;
 b=Gui8Av0DOswguPXdlFBEgKbTeCzuoL4xrrs7s0W2y6Tbiipq2bt+1xkiQIP7G1rW2b
 JhKvKoUrn2ZJHGBEBDm2qIG9gcK+0aobKqEWXJZmsRXavsS5Up3bip9YTv3N+8wsSG/K
 6bBkg/5/auxd8V7XKrqpAszKVV+sQd1BgbNuyeCNM80bLpYexQxoI/vFm3sQ+vVG9viC
 hZoaLEqirfXlZBxMoB8B8l3jmLUiPpT+FBtvOpRwAMavkCYpK97R03WBWEWbf79tUyTd
 Y6Mu1Y38x3yJSxHJ+6HNKURx96sRfLL/y6YUp/F+aP66RpWSwlV/yhhhsGlp5Vxmx4em
 Kvog==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772565164; x=1773169964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ctyo+PV5oXCna4bhLsZqOuoNqZKYNLazRKDdvHT8UBw=;
 b=diycga7GSjk74BCKVT1odtwkX9cqKflPdG2yPLC/KIG6AZ113BFPua5t7a3soBbu8A
 wVldSCee8BpcnlvwtrJEiyD6Y2mzu2cehyNxxe1KpomTf6Gbs/9hvEsPbV7lNpVH8xrb
 dixN9VfCWAbEc4m2G6SJCTL1d0N/0HB38T8ydAJOACqX3Cw+p/0eWXNt+9H3GW+bh+A2
 JHIFD+0goIXdCYiDSYHG8it+2dltOPiiXrs2gVj7WyRNRzjiEopUdu3oD8A3jJsChaHl
 KyfwWn1trOk28OYfMzBlXIdikFfUQEtUT61MQzZucKXrDbtOw93MpYp46H2uFblcZqWu
 U6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772565164; x=1773169964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ctyo+PV5oXCna4bhLsZqOuoNqZKYNLazRKDdvHT8UBw=;
 b=RIjV74BBJUtGj0cmB7DLJtFEHsA++qi9h8ED8c9JXLJ/juWYVKpj2paabjXx6c0qgj
 5QyKEEU24Mep/lkmmK2qWkF/D4Ka0x5pdTc/QyZaivxEIL9V9DrmSCBs4lZM6hj/hQjq
 LdkayauDOXbLc9pUlD1sbgWg4Tuvs+FNH//Y3o5/69vklXnKmPcBgMDffdUjQWVKMtYj
 3+bkykZ4wuS02EdNUKt7oiABe4U/WStCSJmmH+y9pVPw9N1Wu+8l3Usyr2NXD1L2+8Nz
 MwdT1KiX9n5wrF2EksHdpkON+Hd23aoDDTSM46CoPFyps/CXOwL/owgySO64jVqINwwE
 eYyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCdAJA3d+oleztUFI9X99DvybyJcfYTctaN6PihaeWzFq8mMyhm8aoeSSCNl4AQaPfiwQeAoikCqU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW25QBZCWsfhmzFJ+iG8sq7ktj0pB1VaRc8AJLfIWSkdb4esib
 Ao5GVPUJBnQkRzN/Ppphjzup566gmvXvRVyX/T7ZzYlspVyYZBrt7L91CgYAbvzSPT4le90eYwS
 hxafNeIJrF9qRlLGAy42D8LKNJUKKUGE=
X-Gm-Gg: ATEYQzxsNNqSaOPpOgh5zTP753GiAt7KT07pv4oSLEwpKQmwsw+FmqruKWrzBryti6L
 NNOuwKJYgHNKprV1qvQ5yhoJoLKywA82AMK2DKDuy4iJKH8LegVlpMoR7kmZuguq6y2dpRErzV/
 hOEH/pal5yoFqq8rcnFKyILksyyrNlgxFHgK8tzOeYsUEjb3Eu9OJ+7LNi8BWXlYvq1NKbQK6IG
 CsW1U/SoKNvyFPPzWwkdBl9ME47x5WXwaD844NxbSqefYUYDmNJuFKUt7DPOmiK4b7pSVZ/W0rQ
 6+8LrVPvCPLrtMWvne3jJ6n2XJl8VgzqNCrKS7UPVbbzRdHK
X-Received: by 2002:a05:690e:1686:b0:64a:d18a:66c3 with SMTP id
 956f58d0204a3-64cedd494a9mr2396973d50.48.1772565164226; Tue, 03 Mar 2026
 11:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
 <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
 <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
 <CAHijbEXTPSLSADqet1=P1FV6jvoa5yGEprOuYtpQWUq_y5uT2A@mail.gmail.com>
 <c5e2cd1d-05a9-489a-be8a-be4d0d583688@mailbox.org>
 <CAHijbEWoQHTyj_V1dD9UWskPmz0WbrVwzPTD3XqJTczy1ojBnQ@mail.gmail.com>
 <d90d6eb3-72bc-4502-934d-f77dac83690d@mailbox.org>
 <CAHijbEXk9q_cF6g=OuPKG-Wd+GLfU6Pu1HU77FpLdV6jfg9MnA@mail.gmail.com>
 <daaa5465-c086-47b9-be7b-13f5d62292ac@linux.intel.com>
 <5464a6fa-5a49-42f5-a1ea-ce9f18a6955e@mailbox.org>
In-Reply-To: <5464a6fa-5a49-42f5-a1ea-ce9f18a6955e@mailbox.org>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 3 Mar 2026 20:12:32 +0100
X-Gm-Features: AaiRm51neVwO5GpQnVO48fP70MPu4l-kcSR5ZiW9bU4oZct_Zufz1MiHH224NwM
Message-ID: <CAHijbEXaxLU7sbCyJr1X8B_PoPdM2q19+JuF+huLQqFoLYP8kw@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 04 Mar 2026 08:17:10 +0000
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
X-Rspamd-Queue-Id: 83CC81FC5F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:maarten.lankhorst@linux.intel.com,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 7:53=E2=80=AFPM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> On 3/3/26 18:44, Maarten Lankhorst wrote:
> > Den 2026-03-03 kl. 18:30, skrev Julian Orth:
> >> On Tue, Mar 3, 2026 at 6:18=E2=80=AFPM Michel D=C3=A4nzer <michel.daen=
zer@mailbox.org> wrote:
> >>>
> >>> I wrote in my first post in this thread that I don't object to your p=
atch, so you can relax and stop trying to convince me not to object to it. =
:)
> >>>
> >>> I'm just pointing out that this is working around broken user-space c=
ode, and that there are other similar cases where that kind of broken users=
-space code couldn't be worked around in the kernel, so it's better to also=
 fix the user-space code anyway.
> >>
> >> At this point I think we're arguing about "how can ioctls be extended"
> >> and "does userspace have to use memset" in general, not just about
> >> this particular ioctl. You've made the argument that ioctls are not
> >> extensible in general unless userspace uses memset. However, I'm not
> >> yet convinced of this. As you've also said above, drm_ioctl happily
> >> truncates or zero-extends ioctl arguments without returning an error
> >> due to size mismatch. Therefore, the only way for userspace to detect
> >> if the kernel supports the "extended" ioctl is to add a flag so that
> >> the kernel can return an error if it doesn't know the flag. And then
> >> that flag could also be used by the kernel to detect which fields of
> >> the argument are potentially uninitialized.
> >>
> >> That is why I asked above if you knew of any other examples where an
> >> ioctl was extended and where memset(0) became effectively required due
> >> to the extension.
>
> Since it's always been effectively required for ioctl structs, "become" d=
oesn't apply.
>
>
> In terms of documentation, the "(How to avoid) Botching up ioctls" page s=
ays under Basics:
>
> * Check all unused fields and flags and all the padding for whether it=E2=
=80=99s 0, and reject the ioctl if that=E2=80=99s not the case.
>
> Which is what the code you're modifying here did: The code after the args=
->point checks doesn't use the point field, so it's checking that user spac=
e initialized the field to 0 per above.

I don't believe that is true. The old code only checked args->point if
the flags argument was 0. If the flags argument contained
EXPORT_SYNC_FILE but not TIMELINE, then the old code ignored
args->point completely. The patch suggested by Maarten does what
you're suggesting: It unconditionally verifies that args->point does
not contain garbage. However, since the original code only used
args->points if TIMELINE was set, I believe the intention behind the
TIMELINE flag was to ignore the args->point field if the flag was
unset. That assumption is the basis for my patch.

>
> This contradicts the arguments in the commit log, so I'm leaning toward o=
bjecting to this patch now.
>
>
> > You don't even need to use memset, this would work too:
> >
> > struct drm_syncobj_handle args =3D {
> >       .flags =3D 0
> > };
>
> TL;DR: This method isn't 100% safe either.
>
> It won't initialize any padding which isn't covered by any struct field. =
We try to avoid that and have explicit padding fields instead, mistakes may=
 happen though, and in theory such padding could later be used for a new fi=
eld.

I don't think this is workable. There is a lot of code out there that
effectively vendors the ioctl definitions (and so is not affected by
new fields) and relies on field-based initialization affecting all
significant bytes. For example
https://github.com/Smithay/drm-rs/blob/08dee22f0dcfa4a73a18ca3a954d4f7c2c74=
9c03/drm-ffi/src/syncobj.rs#L48-L58.

>
> FWIW, libdrm uses memset for all ioctl structs.
>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
