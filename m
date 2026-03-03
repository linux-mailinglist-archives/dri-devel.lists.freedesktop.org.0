Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBFJIq4Tp2ncdQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:00:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FB01F4480
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7750210E86D;
	Tue,  3 Mar 2026 17:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dZJa1hb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D1910E83C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 15:36:17 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-64937edbc9eso5363816d50.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 07:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772552176; cv=none;
 d=google.com; s=arc-20240605;
 b=eTqZ61IRsDbQSEyuAeILUg26W9sCYKgn07YZFPzBahzlV1nLUsuuRW+R9CPOJzYpu5
 WYjhj8x1Y5GZ98ziytW6ggVQYPYGbcen6239a85V+sF63VbZVJmQw5B8O3ybuvs0Wg8y
 muyxWnCebOt0eOhNb8Dp6lMiHjW6ZCx9oIHIaxkwJitSctWRrSyEQWjpsZJrmQ8/5viV
 3vgmZ4mCov8+Fs49ecz5w+aHFg+lUVCCgBGPhHAN/Ff/soGG0n3YJbxlj23NJPhxc2Wm
 J+WkGEvhi657L8yqIkkLn4RfS1Gzn8GADnwQF+JUqxjYB4UllC32LmklklbY7mSQawGQ
 HDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=O6TWh2jWidbvSGWTPkAkAi8e1GlWCK6BGoSEr4Bldoc=;
 fh=lOYVm2xhmeQxVIkaatzEn0XuPhzx9796uFVhixBbJAo=;
 b=A+bOv+4/wPyYsviaWx0UaGrTr19JXADYR7X7RFnk5N4qB8IfwBXAsp/YTfg8xC5P5A
 7OYlFCkxX312lj7ErXOdK9jjhDiMK+wuqzYpuL3rooEciXIsjbOuMPnEubg5JRGKnWaI
 0Hf2kSwcFqnLMZQTlZAhR2ijLnFT95hOncO8QlbDudqPm4BZinD5lKHn3vH6UH9yQloz
 qlFPqOCNGdlnn/0rRSVuGofzWz+g1tgkwM4SA65AnIsRU9fX13TvzfngWWFZ6/bDib93
 7nT3MPII0tIzL28y6qVu7+UyqyRvu1GYOMFSkkjKGcx2tW235IEqdKTen3ZM4Wc0wRV6
 LfzA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772552176; x=1773156976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6TWh2jWidbvSGWTPkAkAi8e1GlWCK6BGoSEr4Bldoc=;
 b=dZJa1hb/0j9hngX5R17rePwE0ka6OyMNJ+WiSbqpUnlCb64Hucl1AK6d3kyoEsuL14
 15iMdB3ZMljInaV2W6QK6TX5QkPwdZQxL+rVLu4P9Cf5YTbBptb2XoqV7Rv5GfIoGgMc
 3Q5raIXFttju6gPVv/jqbo85XO7N1uqo3sKuQ6dIdwHpmerC3zya2M4L7/n4mbh3oYwW
 pD1D65vaPAAK8+wnC/Tfkj6sAhD77jkbp0Lx+cRwOyWXpRv+EhZs/U3OjRGCqCjF7AGJ
 LuBiDUdphTMBgZFQ4OVDzYpFTRbAgU9DMDDapLHYWhVCM3xeYeaxl1JIxlu9hTSqJCGD
 UR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772552176; x=1773156976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O6TWh2jWidbvSGWTPkAkAi8e1GlWCK6BGoSEr4Bldoc=;
 b=N8wMSV8J3PHPT13DdYYXAP65vxoxB2de27fboAQJa3SRsqIZAtXfcm1zWLhaQeLoKk
 IBVolKkm9O6e4bA2NAhmj30ukh0lMZdNw7bbHxCXaLq5X+Qmi2jfK+uP/g9YIYLPi4WS
 oykLYGCHuXyWNadd5yhWwllurtmqE1KwVL4G3RuoEMIMpORWD7lLPPkApfyCur/rBiN2
 6sosd1L7w2tfFyyy7vVLHUjC+WNzyP5CLGC0y99A/40ssusOtClN3mOYLXmk0vBezjGc
 lnPOZTXSmaxl2DKIsHK08wUYQ1RZeUsvRUucq8jjXh9JAbIHiM/5B3+Yq9CwJ31jmmSH
 /Ikw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnXkvt+BMWK5TZAg/AEb4G/89TPKGL8AAJDhLwK/JdzK84P0PqeeB+J7nO/fH/G7D1ZjQupkyVsl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiR7RJnemUtML38nPSFjCCzJoStjG3ozGPoxCWC4OSqo56a/i1
 jieJ9GXDS+5GmnCVLqHLCqqjVNbNfHiygoRfkHHGqSGSgTpeS8qmCDJeNrb7ONZhbv3r4ZG81a7
 brXVY36XGCK6CmsRWXw5844ecdEv5K2w=
X-Gm-Gg: ATEYQzx7yv4S3kEmxslMWoSy1HziBFLauLXQUs3/e+d5J4VTkK5xNPwI0DZv6mlDOO/
 L9UDVYUHrCZgAEfwH/wRi7PA734dJ6MXorNSpc3icLKYlztmITP+T5vmhARoZ2ibqhHhe9tNcVd
 uGOSTDsoyl6akqtVLovVYm+M9+IW3VJzlcbCpGA6VzPrcwfqcCJu2Kl4zbm0rYN8+t6V623XwTs
 XQqfwSAzLNTtSQAvnBQ6Pyg0Q+kUfpz/Wj9ANCKgkInfxuhhJIuJ6GNh1YqPXf90spqZajF3w0G
 IFxF3wE4JYmwLuQhJ0yI3+1qgsoDrQVWbygRdZ/lkP/eC58t
X-Received: by 2002:a53:bdd1:0:b0:649:b943:2cc6 with SMTP id
 956f58d0204a3-64cc228990dmr11537726d50.52.1772552176062; Tue, 03 Mar 2026
 07:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
In-Reply-To: <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 3 Mar 2026 16:36:04 +0100
X-Gm-Features: AaiRm520RLtzd_UgJHtQP9dh0-6CKW1wva0wq0t6qMbIQN669Fz0cfZR0SCcsA4
Message-ID: <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 03 Mar 2026 17:00:21 +0000
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
X-Rspamd-Queue-Id: 25FB01F4480
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
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 4:29=E2=80=AFPM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> On 3/3/26 15:59, Christian K=C3=B6nig wrote:
> > On 3/3/26 15:53, Maarten Lankhorst wrote:
> >> Hey,
> >>
> >> Den 2026-03-01 kl. 13:34, skrev Julian Orth:
> >>> Consider the following application:
> >>>
> >>>     #include <fcntl.h>
> >>>     #include <string.h>
> >>>     #include <drm/drm.h>
> >>>     #include <sys/ioctl.h>
> >>>
> >>>     int main(void) {
> >>>         int fd =3D open("/dev/dri/renderD128", O_RDWR);
> >>>         struct drm_syncobj_create arg1;
> >>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &arg1);
> >>>         struct drm_syncobj_handle arg2;
> >>>         memset(&arg2, 1, sizeof(arg2)); // simulate dirty stack
> >>>         arg2.handle =3D arg1.handle;
> >>>         arg2.flags =3D 0;
> >>>         arg2.fd =3D 0;
> >>>         arg2.pad =3D 0;
> >>>         // arg2.point =3D 0; // userspace is required to set point to=
 0
> >>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &arg2);
> >>>     }
> >>>
> >>> The last ioctl returns EINVAL because args->point is not 0. However,
> >>> userspace developed against older kernel versions is not aware of the
> >>> new point field and might therefore not initialize it.
> >>>
> >>> The correct check would be
> >>>
> >>>     if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
> >>>         return -EINVAL;
> >>>
> >>> However, there might already be userspace that relies on this not
> >>> returning an error as long as point =3D=3D 0. Therefore use the more =
lenient
> >>> check.
> >>>
> >>> Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeli=
ne syncobjs")
> >>> Signed-off-by: Julian Orth <ju.orth@gmail.com>
> >>
> >> I'm not convinced this is the correct fix.
> >> Userspace built before the change had the old size for drm_syncobj_cre=
ate,
> >> the size is encoded into the ioctl, and zero extended as needed.
> >>
> >> See drivers/gpu/drm/drm_ioctl.c:
> >>      out_size =3D in_size =3D _IOC_SIZE(cmd);
> >>      ...
> >>      if (ksize > in_size)
> >>              memset(kdata + in_size, 0, ksize - in_size);
> >>
> >> This is a bug in a newly built app, and should be handled by explicitl=
y zeroing
> >> the entire struct or using named initializers, and only setting specif=
ic members
> >> as required.
> >>
> >> In particular, apps built before the change will never encounter this =
bug.
> >
> > Yeah, I've realized that after pushing the patch as well.
> >
> > But I still think this patch is the right thing to do, because without =
requesting the functionality by setting the flag the point should clearly n=
ot have any effect at all.
> >
> > And when an application would have only explicitly assigned the fields =
known previously and then later been compiled with the new points field it =
would have failed.
> >
> > It is good practice to memset() structures given to the kernel so that =
all bytes are zero initialized, but it is not documented as mandatory as fa=
r as I know.
>
> Even though it may not be documented, it is in fact mandatory. Otherwise =
it's not possible to safely extend ioctl structs in general.

The intention of the original patch was to ignore the args->points
field if the flag is not set:

    if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
        point =3D args->point;

Using args->point unconditionally later was therefore a mistake.

>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
