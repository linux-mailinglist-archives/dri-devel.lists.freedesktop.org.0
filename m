Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCiFK6sTp2mfdQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:00:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2938D1F4471
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E20E10E869;
	Tue,  3 Mar 2026 17:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VXANNDg2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F54410E832
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 15:21:39 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-64ad46a44easo4901900d50.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 07:21:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772551298; cv=none;
 d=google.com; s=arc-20240605;
 b=BlbaQB3w2yIW/isLuliE8GaLORF5nDk06H0I/ijB15V9bhhS8YV5/zdCr4h/wqRVHF
 uf63eK9mHpEvmhS+F2tFWu4JF6BLqFNoXCyzlGz3zZh8PA/KPFX76n2i6FAeOaA7FTqI
 +2yZZIkACc5XQ1U5Wq2WR+QTWEQTzj304LpjEfT3aAuNfRp5NMB/u6yAibGhwRLiHAHr
 fPVZyRQ6FTLENDfr+tKwMnoBCzkYkJJ+carZEtSgb7L4+EWpbUgfQNUron2Jni4bKPRh
 RawkMa240Ysmb655mHRQ7RqmPnLKhXQYoNIL0evoTt+dUXGJKIA3gifKuznu9K6NJOUB
 jDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Nx6jOs6QLPzaFfgPIix39Znu/LIEVrgl+IKp/10u8t4=;
 fh=uXO77rVsKobZFzF1LpRN1HtEQ5UM8YemW7BxyYlHV5s=;
 b=hWlCrWME250iKSl1RnqF7H664lKu6ac9jyP7n4VZQcmmP4/JwEfY5bKp8eykZdg6g/
 VbmnrO0KX25VcWz1SLx3XVI6T+Tu44iHNxOLoilmzHV3JlL7gMzL5TOIZKSTz18fEAiw
 oXleMEW2ItzCRQiw7XiVKOZWtpdrq1BvrKXSrrfPTwUXR3qen18auKoI6vFMa8mnxp+O
 77GQRlAZkGn9wNRgez+lTJwcU1pvdgtmJgw69KkuSYdsc7GuJblIfOc3YxJYE6og3297
 aXTvtsht9G0vTHvBA0RM7j/djJ/5IC2/lkph047nKbBrwDqmpUo6/rEqX5gQBU1WPNYD
 qyGg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772551298; x=1773156098; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nx6jOs6QLPzaFfgPIix39Znu/LIEVrgl+IKp/10u8t4=;
 b=VXANNDg26KPrsadNLhB+rJ1wrhrDUWV1HVLmmDVoGvuRFre3eM2JSxNxghdD28RTQZ
 l+1V7LPUb1TpG4ys15rR+H4fxZVC5mf5i953sU//wlxIQV+YuYweelldNsJIChynQl4w
 TB9QqlkKushx0TWOd9sG2LZKCwSWRf+8y9Y2nB6lFrsIFICT+z69npudJTwmtiN6Y5hF
 FInnI/aFq/N1N8A2qD6tzmTwgVIgTMnpGRBTkFMjm2MmodDGF3pAfyH6Vf3apWPSb7eW
 HeP1/H07csOJ9x59zWMVxQ2sDhvuH4aWM4W2defJGeFqhbWUH25IADQJLWx9kw043pgQ
 7alA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772551298; x=1773156098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Nx6jOs6QLPzaFfgPIix39Znu/LIEVrgl+IKp/10u8t4=;
 b=Bf32aE21r1dPzOG4kicqbML2mnn3A7OYS1rkjVTdfX5J4wbk58xbHDiq8uBHsptUHH
 h4L8zL8MCTKqVr+FR9zHDVf3mSCtbtt5EK8A/8mrAI2HHzJIq2RrISyz1UflpmV6XSTP
 9IWImAYD/CBxtqz0eQxW6kN3N9pV7DPVU0lwuZx7/RlYSz5qH06lUX5B6hfPc0XLRxBj
 eIuurhbvKizVKEZF+9wPJ7r9PV0VrTz04aj88pdyHs1zh+s51dWozMfFrc9FY/xZWV6I
 zVhUqnV/oOHFET3hpLyH1lWE+8lPeENy7iUCkBFsO2HPMp4QyUvL7L5jkHrQKJlWTMea
 hgVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvexdR8VtE8z/SLM/kv1yHt7YcGRvnDeEJuk59qE4H0Drb7LrHVaj3SVvezpAMe72IlJjPQvMKuvg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo7FEcYkFnq1/iwFIIYc7ZTfInCI/16Nndbp6pjAQEAeg9gS2L
 CcMG2Snsxl2t6Itcy8mlo4gMydOdLu4g64ShP64CyPUudO2/lZ6J/4YNnjqu1G3iHM5qRVIP6fu
 bvo/q98vt9oRXBBbnwcqtuwiDiYA3pCA=
X-Gm-Gg: ATEYQzzl0im7GCWEV0Mf60c1fXQdn8qCoKiFhiLR4ZIY37e6s+Q6LgEhcy7ePuzG4km
 gvmVuHFoaHyMu74ZGbuGBurmIeqpcr3LCf88sNyBu6+qCje3Qf+ZQ9qejCZLJVKxsKF9Q0toOX7
 jf/qbFZwvop4SOn/y/qPaBumYW9vV+mcbVMH3k+lDEuQ5EwGAdsbMzeqqi/Ifr+I6x7G22aBM+t
 62IVFb80k/oyQCbep7RsxvuN4EU+9sZED04CLYSNVRzTZgr69bO6eejx3dYYsajBWXSKqTaHZvF
 OFOIQtsxHELhobZzPwC10c4G/WoNvln+MPOgpIRRSdstJDsx
X-Received: by 2002:a53:b105:0:b0:64a:dd9d:e944 with SMTP id
 956f58d0204a3-64cc20ca4b3mr10235777d50.25.1772551298320; Tue, 03 Mar 2026
 07:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <5a816b1b-fae3-42d9-95eb-b1706a91d138@linux.intel.com>
In-Reply-To: <5a816b1b-fae3-42d9-95eb-b1706a91d138@linux.intel.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 3 Mar 2026 16:21:27 +0100
X-Gm-Features: AaiRm51fytWRpL_6A4PizJZRy_bYVs73yi5_nD1EfcJ1qutzwDaqNsuIhNIeFjc
Message-ID: <CAHijbEUvGm1On6YEhrEuWDv1iWAKa1e+sm9a6ywerWoUg7X9bA@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
X-Rspamd-Queue-Id: 2938D1F4471
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
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 4:15=E2=80=AFPM Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Hey,
>
> Den 2026-03-03 kl. 15:59, skrev Christian K=C3=B6nig:
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
> I know that in case of xe, even padding members are tested for being zero=
. For new code it's
> explicitly recommended to test to prevent running into undefined behavior=
. In some cases
> data may look valid, even if it's just random garbage from the stack.

This isn't about padding fields. This is about a new field that was
added to the struct, increasing its size. Existing code could not have
zero-initialized that field except by using memset or something
equivalent. As long as the requirement to use memset is not
documented, requiring existing code to use memset is a breaking change
because code that didn't use memset always worked until the new field
was added.

>
> Is it too late to revert?
>
> Kind regards,
> Maarten Lankhorst
