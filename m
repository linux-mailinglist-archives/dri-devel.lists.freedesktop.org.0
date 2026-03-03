Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHlbNPIWp2m+dgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:14:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C90B1F4794
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF2E10E892;
	Tue,  3 Mar 2026 17:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y5DY8byw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C04D10E890
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 17:12:06 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-649278a69c5so5047027d50.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 09:12:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772557925; cv=none;
 d=google.com; s=arc-20240605;
 b=h0GbNQ5lIoNIrCKlZ47iVxFFbFztVefwJu0SfFD6PMmm5gA0nFYVbu7f7nHBGQns2/
 ErBco62/yjd7o8XQuusua7bw3z905g420Yd4DbJMxNhNPMbP91xuyHZF6CPtDVjg0z1G
 0IJObeYDieAvEreU/Es82bL7Oatr5+oNleywH0eqKerZRhH53NeLz/C0AZYwOhkp7qJx
 FpQkmYL7HcyRiRl4f8F16G3ec/L1bwntGnFRBw0azWkgIoLFViagsz+ZFRzB+7kzslGR
 ExP67W7isUvJaFSsA9vrVgl9bWHUzEET77MQfVSEIv01NOif38C66zp/DtQEjAY9QnVc
 t4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9sUpEKqm4FHDdB3eWP71R/GFWW8PizQBOTa8oFRcpL8=;
 fh=KOZ2C0S1FLHljWnHLiI5yHEtRS5LJ94FiRmmWXEul3M=;
 b=WJePPPu9eu4DX9NaV1Em+QNIZG5V5/Co97ZlSRAIU97socwMYjYv0zrCQRn99/YAMk
 lamGw/mT4W+OudbQRUoK8yltIZ7UJqnpHK4PA+siL6XXoddHCYXYPqt2oqGnh/c4LtOx
 FeoSPyKQjnA5Cec70h+woCt0bPmuYPtfq+lpdwsXYyUapjN43ZjY+EBUHO94TF1JbJgB
 f4CgAaMkcAozT3a/+RKF8Vr+GnvhElw9K5s/9oL8VzeuxpBwwxwQsUfKvN5LGdzWbdiR
 6slaH5/VV7JVRHAmthPxaMIJO4P5WR88u4cYchAgV6AQz1MVHYT/YDoEM72NJ20xu7AD
 YI8A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772557925; x=1773162725; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9sUpEKqm4FHDdB3eWP71R/GFWW8PizQBOTa8oFRcpL8=;
 b=Y5DY8byw/3OV7dsfO2cEghWlqVZHNbfuZOPSpvz3eef741mimGSKLr3JhfzDzI7me7
 Mgsg0/KGcfCsxadUbFnwf0YBZnZoL4ueFXQF5abgJ1BpDQh9rpDes6Mtk8ZEA7SelNmW
 JVruG7uq7ZHGS0jvK8NvRdRZt7vuGtgEUjGsKTQR0/o+jGqxuL6s8hu6lWzJnd1Z4P4u
 8VNfZbunOmjSivLNpVDenIwxMECU2e7m3wyhVuLZBN82MRA233525Vqzo5Ns3I5HN4Og
 +5WLybFqs4kaKb2HmOMnSX3zJWooR9BBCbeuyFGZ6aqL4wMV+0h0f9PB530F3/nwICGK
 TLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772557925; x=1773162725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9sUpEKqm4FHDdB3eWP71R/GFWW8PizQBOTa8oFRcpL8=;
 b=fO3cBGqRNewksBjrye7Os3hydUhtDYYmyud+2ocrJoi1K5oGwAjVVb2F11g/dnxSHF
 qFw4pQgnrlVAx7VaDtDz2gr99hz0JjW5JgCY7+HfGwlH8iNYm2kEztPC3JY6kS+qh4zI
 GLJ/9IxAg3uh6dLwBNam+WiQjLp4tf9QXOR2V78tPHmY7MH2Oju5U70bWsCz4oPhL28V
 wuKa0zQF5lUam3Qip1heFuqzTCLbYJZxIICO3SyvLDFxBvC9MJ05jvUte/gLnMQv0jPc
 2vrGG6cgrDFZEvFmLSVlIxf2qk8ser66XqVkTujr2DAYzJVLZaog02vZsQLKjBBSTkhC
 B+0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3ahdUHqSel5c8nrvjdKt/T5n0XPnO0xUYVO7PU7HFTflHObgwYd1U4dbtoZcDVj1FcB0/iXw19O4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgsJRb9m3G7bVRdF90/pS8aRCHl0sXxkuoCkrMuCvmBzbXN/0U
 rigOz//2lJ8JQsqpPM+LkEU71ji97t2i8Z45BEpFkwqk33ke6YjWkI4NtlkCOJlJHmY+H41Jtd/
 VNvWb25wu6IvFryxhsjHVnqngipVCV38=
X-Gm-Gg: ATEYQzxWD/liNfRdw/+peYEV5sMi3e2MS/gNgMQnKxbplocga4VGlXNbZloXx/ZYcPT
 lraEe0RJmAWnOBdSoyA4WcksdMakX+fDX1lxYN3uVqmLaXN7/qw7qqLmvwRXB12oIPbhHcrGWLz
 VZjy09Lr23KQ5Jde+MhwcAMVne/Qut66MFAMGOcPLrO322xJ3Fv9IasyDy56W7oddl/Lk/0jQpH
 Pqtg+tx4++e4E32dOhgDDNBkoM3hFnigOx3X3SHfUcAl93aJXfpph00sEGeVSEKyNyBbZ+VTAII
 Ufkzz26t0RtYV7zRA80wrt4XTHVczdfEDud7jJPRGmDrcyk9
X-Received: by 2002:a05:690e:1509:b0:64c:f4f4:20ae with SMTP id
 956f58d0204a3-64cf4f422d8mr985035d50.78.1772557925120; Tue, 03 Mar 2026
 09:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
 <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
 <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
 <CAHijbEXTPSLSADqet1=P1FV6jvoa5yGEprOuYtpQWUq_y5uT2A@mail.gmail.com>
 <c5e2cd1d-05a9-489a-be8a-be4d0d583688@mailbox.org>
In-Reply-To: <c5e2cd1d-05a9-489a-be8a-be4d0d583688@mailbox.org>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 3 Mar 2026 18:11:52 +0100
X-Gm-Features: AaiRm51ZnlXJNoPp8y0UxYSIRGNlSMMpuU2FbW_nvkL0SpFAfDLDBNU6rsbiWBA
Message-ID: <CAHijbEWoQHTyj_V1dD9UWskPmz0WbrVwzPTD3XqJTczy1ojBnQ@mail.gmail.com>
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
X-Mailman-Approved-At: Tue, 03 Mar 2026 17:14:22 +0000
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
X-Rspamd-Queue-Id: 2C90B1F4794
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,mailbox.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 6:04=E2=80=AFPM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> On 3/3/26 17:54, Julian Orth wrote:
> > On Tue, Mar 3, 2026 at 5:40=E2=80=AFPM Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com> wrote:
> >>
> >> There is precedence in the ioctl, the pad member is checked against ze=
ro for the same reason.
> >
> > I don't believe that this is comparable. Developers of code developed
> > against an older kernel could look at the kernel and see that the pad
> > field was checked against zero. They could not see the same for fields
> > that didn't exist at the time.
>
> "Initialize only known fields" isn't a valid approach here. The full stru=
ct must be initialized to 0, including any fields added in the future.

It worked from the introduction of the ioctl until the new field was
added. How could anyone know about this requirement if it is not
documented? Some people might not even know that ioctl numbers encode
the size of the argument and therefore assume that the argument
structure is fixed. I think this is quite different from syscalls such
as clone3 which make the size argument explicit and where it can be
expected that the developer knows that the struct might grow when the
application is recompiled.

The new flag was added so that userspace can detect older kernels that
don't support the point field, such kernels return EINVAL when they
see the new flag.
Then why should the kernel not also use the absence of the flag to
detect older userspace that might be unaware of the point field?

>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
