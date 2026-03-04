Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGWeFFkZqGmgnwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:36:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE361FF177
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B555B10E9C2;
	Wed,  4 Mar 2026 11:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X/xPPrCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C5D10E9B5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 11:26:11 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-64ca4dfdd88so6445650d50.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 03:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772623571; cv=none;
 d=google.com; s=arc-20240605;
 b=ULG7L5oHYoxqLzYUhoU0UShgoA9SQGxVKZaL+BPWGDtO6QBZe8rU9V8Mbdss1MFHvF
 p9Ty+Nub4Qzs7wCvqjtUN3kTS5vJM2VveToK3lmM72+Wlja69GAk3ToUyTzuWiH2hCiv
 fkall5Zx4qgu6ysN7EM0ZvYA/IbzCH+L09DWfzZuuENqIk759Q9uPvG4ShmwByk1x5F4
 AShJLxY2butT0YlP7uKZtlD6ofVZcDFJhutbNdxxonvDRMnG6qG0XiqWxBT8wPHagnS/
 6sZMh4Ds2UDmkdbG8oeGFsVYNTABKx/uWAw5eaPHx0GvqATJNVKkTtDQ/9lKh3+vHEoi
 YpSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sfnwOEQPG2f279DEvdf3ottcsjP5T7HwO3FoJcmtAlc=;
 fh=22bDiaFUHP0X4/el610H1+ZadraZVEdEyNnbkZ5T0Wg=;
 b=f119WYbIjI7glG0Slq1PRGw2W3GZiMpeUGfEEerlDPYf0Sw3yNMTaKqJeksXHQJDzA
 Pg8FA43TKXGCSLR/BlX9kNDQn8vu3ECv/jvSy3cBw4dugdJ9EIZcYsxAWe527DMAGRK8
 Ycn3FILmUfDZrhAn8yFm6qw+1W+YtVEU3yDlf343UDfmbCTGziZ+x+sKyolg7y/vQ8dQ
 2mYw5qnVHwY8Uw7jCxOe2AZ0s/PtffioETULo8tz/idgmIjHzilChEQfmYgHgf8rBwNs
 /qM1Hvd/WnAeexaxCM0B7/ExaPF36IlzOKvruVTGscurJnveenMXBtFC9qga4/t6fOIZ
 aIKQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772623571; x=1773228371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfnwOEQPG2f279DEvdf3ottcsjP5T7HwO3FoJcmtAlc=;
 b=X/xPPrCM4jnqZ0EzqwCLFnTdAFR8yXh1SsBHLOGpZR53mILAUCY4m9L/eQnFVvDvhd
 m67bb+9nxksQfqKjJPG5yqKbiTiEHH9nmjZGmflOrVBrqDLGn+lF1QTXpi7+d7BcV0Xd
 104zRugmyN6qQBibZcfvP35j0PYXR1vhxdI7otAxEVACOQlwQPLDYclBm9maLl5BLlA7
 CCGUmeC3NJgow02oZ63sqrHHIKJ6pvFAk6FcyNn+P5XlvJHaI+nLpDVv3pzbvsVbXsmp
 TKWqeeOJrBDDsRsmuW/gDRjM7HcemqlJRC2wJY9iKalQd7fQQWOGqQmCxbrrIoXDu7pJ
 oMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772623571; x=1773228371;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sfnwOEQPG2f279DEvdf3ottcsjP5T7HwO3FoJcmtAlc=;
 b=OvGaAb7AQNgMdbrO3fdh0EGun65xVozIkIRp6Qq61T296crruHStff51H72Q0Ulodg
 lR1exnuB5b2VofNDOk30P9dBVPr7UxF9WExNQg6qh2D+l8Xcytu+DV14d6SrD9MW2mtO
 j7EZ/Dk2eYGt/BzXM6PNCUGclM3L99hfKHk66B2eiKBe4nBlh4PPH1diYpjqS3k3MFvJ
 XGpjNcYPv+u/zfZKrMKTyIU6prTCla23hRXsIoKdkcloA1OgE7mxOFOlqWJNwK3aZuQX
 IKoSFfXCgx9bgiXzhXCkMuk6MIRp6HZxB7FbjQRLYKwqbeiroONnb5ZoNf7avHDpuvQ9
 XTwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYzaLL7hrQ4xsKlUNJpW3rRQVV3S4IkE2/lZBy2t+LILzkcgJX/k0QTqRqGyTQzsd0ZHhnj8bG0Cs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXTm6D8fIARtkRRJV0Z6ME3IIJTpeo1QgSG4om1lv8q7MTJRr6
 +JOtwk4qfzH/PEkTCmCz19Wc82MaAtpB0wxp1L9Hc9hKqU9RhaeJs7h4S3KI0LoC8nBLRLgZEug
 rSDVVcdbwSaphYMdEQ7bX8LFzGDDrF8k=
X-Gm-Gg: ATEYQzyWK7kC1C/FvkBup9qWQFi/EqHt9BR1jOuHTWkV9uP3o1+Jd3iJqDohqOlJCaX
 TKOK+zPGUvsoSw7M3yvA/6K1qsJf/WztkCMY3JS7q93MbeAJf6tKPUqwQMmmm0zwJk+tGTM8boW
 tsCTaYXP1nxJ3SIykFJ3reZqWsxaJvXPiKYaJaczT/G2NXbim0XKTKTcCQ6c82ok/F7+m//BSyn
 V2bTa0py71zgInQwGHMgre61f9DOUx5OLw7TB77K9pyVhXixCD9hwtNEnm0dT4+NP+sCUDbTM1z
 tJCWfawrHEBrmjSEMI5m+NlrRc6wLVd5+rHlJNzVW+JdIRph7LcIo2HAMOI=
X-Received: by 2002:a05:690e:4012:b0:64c:ed3f:ea3e with SMTP id
 956f58d0204a3-64cf9b382cfmr1214439d50.9.1772623570712; Wed, 04 Mar 2026
 03:26:10 -0800 (PST)
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
 <CAHijbEXaxLU7sbCyJr1X8B_PoPdM2q19+JuF+huLQqFoLYP8kw@mail.gmail.com>
 <59bd46c0-03d9-4fef-a4fd-14b8f68f9860@mailbox.org>
In-Reply-To: <59bd46c0-03d9-4fef-a4fd-14b8f68f9860@mailbox.org>
From: Julian Orth <ju.orth@gmail.com>
Date: Wed, 4 Mar 2026 12:25:59 +0100
X-Gm-Features: AaiRm506tH-PCpZuFbtkhUPnquGrHqoATdwVzWNFSsg-syhwWSJ2d8RNRppOp88
Message-ID: <CAHijbEUSFA3ptTNZ_YuOLgc44Px4CjAaa9x6DDjJktRCKjj+Dw@mail.gmail.com>
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
X-Mailman-Approved-At: Wed, 04 Mar 2026 11:36:54 +0000
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
X-Rspamd-Queue-Id: AEE361FF177
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,mailbox.org:email]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 12:15=E2=80=AFPM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
>
> On 3/3/26 20:12, Julian Orth wrote:
> > On Tue, Mar 3, 2026 at 7:53=E2=80=AFPM Michel D=C3=A4nzer <michel.daenz=
er@mailbox.org> wrote:
> >>
> >> On 3/3/26 18:44, Maarten Lankhorst wrote:
> >>> Den 2026-03-03 kl. 18:30, skrev Julian Orth:
> >>>> On Tue, Mar 3, 2026 at 6:18=E2=80=AFPM Michel D=C3=A4nzer <michel.da=
enzer@mailbox.org> wrote:
> >>>>>
> >>>>> I wrote in my first post in this thread that I don't object to your=
 patch, so you can relax and stop trying to convince me not to object to it=
. :)
> >>>>>
> >>>>> I'm just pointing out that this is working around broken user-space=
 code, and that there are other similar cases where that kind of broken use=
rs-space code couldn't be worked around in the kernel, so it's better to al=
so fix the user-space code anyway.
> >>>>
> >>>> At this point I think we're arguing about "how can ioctls be extende=
d"
> >>>> and "does userspace have to use memset" in general, not just about
> >>>> this particular ioctl. You've made the argument that ioctls are not
> >>>> extensible in general unless userspace uses memset. However, I'm not
> >>>> yet convinced of this. As you've also said above, drm_ioctl happily
> >>>> truncates or zero-extends ioctl arguments without returning an error
> >>>> due to size mismatch. Therefore, the only way for userspace to detec=
t
> >>>> if the kernel supports the "extended" ioctl is to add a flag so that
> >>>> the kernel can return an error if it doesn't know the flag. And then
> >>>> that flag could also be used by the kernel to detect which fields of
> >>>> the argument are potentially uninitialized.
> >>>>
> >>>> That is why I asked above if you knew of any other examples where an
> >>>> ioctl was extended and where memset(0) became effectively required d=
ue
> >>>> to the extension.
> >>
> >> Since it's always been effectively required for ioctl structs, "become=
" doesn't apply.
> >>
> >>
> >> In terms of documentation, the "(How to avoid) Botching up ioctls" pag=
e says under Basics:
> >>
> >> * Check all unused fields and flags and all the padding for whether it=
=E2=80=99s 0, and reject the ioctl if that=E2=80=99s not the case.
> >>
> >> Which is what the code you're modifying here did: The code after the a=
rgs->point checks doesn't use the point field, so it's checking that user s=
pace initialized the field to 0 per above.
> >
> > I don't believe that is true. The old code only checked args->point if
> > the flags argument was 0. If the flags argument contained
> > EXPORT_SYNC_FILE but not TIMELINE, then the old code ignored
> > args->point completely.
>
> Right, the code didn't fully implement the rule which has been documented=
 for 13 years. Makes no practical difference though, the user-space code wo=
uld have hit a failure regardless.
>
>
> > However, since the original code only used args->points if TIMELINE was=
 set,
> > I believe the intention behind the TIMELINE flag was to ignore the args=
->point
> > field if the flag was unset. That assumption is the basis for my patch.
>
> Whatever Rob's intention was, checking the value of the local variable in=
stead seems of little use, since it can have a non-0 value only if the TIME=
LINE flag is set. If the intention is to catch the TIMELINE flag being set =
without the IMPORT_SYNC_FILE flag, that should be done directly instead, or=
 it won't be caught if args->point is 0.

You're right, the better check would probably have been (using a shorthand)

    if (!IMPORT_SYNC_FILE && TIMELINE) return EINVAL;

However, since that was not done at the time, there might now be
userspace that relies on this not returning an error as long as the
point is 0. The intention of my patch was to be strictly more lenient.

>
>
> >>> You don't even need to use memset, this would work too:
> >>>
> >>> struct drm_syncobj_handle args =3D {
> >>>       .flags =3D 0
> >>> };
> >>
> >> TL;DR: This method isn't 100% safe either.
> >>
> >> It won't initialize any padding which isn't covered by any struct fiel=
d. We try to avoid that and have explicit padding fields instead, mistakes =
may happen though, and in theory such padding could later be used for a new=
 field.
> >
> > I don't think this is workable.
>
> libdrm begs to differ. It shows that it's not only workable but really ea=
sy. There's no reason for doing it any other way.

Using memset to initialize padding bytes between fields is workable.
Having the kernel add checks for this for existing ioctls is not
workable because it would break usespace that doesn't do this. Which
is every rust program out there as far as I can tell.

I'm not aware of any ioctls that actually have padding bytes between
fields so this discussion is mostly academic.

>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
