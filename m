Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Cp8Knijb2kNDwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:47:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE5D46A41
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCFD10E619;
	Tue, 20 Jan 2026 15:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SPUwtCtW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596B810E61A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 15:08:28 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2b6a868ad45so435581eec.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 07:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768921707; cv=none;
 d=google.com; s=arc-20240605;
 b=ZJfhYBJ4YeBsA7IzG09T7BTDshcIHBhh2obFvTkjJJaETka0Jqf21Coxkrlis0sre+
 B5zKoqg3vJurp2hWORgFFbBk/oj4NvkavxCk7uwnvC3lWUr7LCVz7GYq9oFMVY4g3LLR
 oZw08Ruy2Y8FpiGzZ7UBfEkGZHSuFlrlJA0UwQb6QdO+KwVURZMs9ElfXveyJ1nt9aOy
 mGLtYAbxBsR83+Mw6N1mRrlfOH4YUkfzVGMuGfRRtlosTh5BJRXoQVbgY4jlFkjK1mvK
 HwrxlqiSjtw7axe+PfbZktU2CFwVZjJPXmbCX3pY6lYbHymTV0ItLKupUI5dgkDm3hjl
 Sxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mUmrSu31ONwAekOtCK0Hi13CBA3nu0/xLAwS+OlZz4Q=;
 fh=xALn+fdb/EocqCYrAZ+nhs7i/zHT3uXqcB8Vseup7sE=;
 b=OKdGH7WWhMNNqRh8b7YiquhXTsstuh4Sr/EmNUCOn5us59CKmD9kjMYK9cKp3mz+eR
 UGZUV6mABVS4hpMaX4SHyamH9M9HKB913rwSncHv7hen0e1l2ze1iam+naI9zXWVRpm1
 Ad0UVuf8o5nUwMtxN5EhIi8m8jpPNbg9/YF552NrTzxSS8xXtVkDlWJst4oh1EuBmI65
 1KTl1sVfeqWYLv/mVN/IUvqXnWHP0w06Y6oj5Yn4vprMIQHRH24Yhvsu3wgsdGjveXiH
 rsHZlh3AyOO5GtAMICec8BIwUKhSGoWDv1CT6hTg29myyKGjtTBYxvClB2YQZFZUgw4/
 3noA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768921707; x=1769526507; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUmrSu31ONwAekOtCK0Hi13CBA3nu0/xLAwS+OlZz4Q=;
 b=SPUwtCtWWKSMzUG/iIYXp+bi6Ebh5pAahUYLs7xpNklT/iObIxClo1JP8I8ezR3oW5
 NknoFHngwle28RkYHHus5rZYyO4Ew0BdE8uH29+43hmxWEGfbI6+qXZFwuOC3fqsew6/
 v0ZbyGqScMQmw+ZKkdvt4GDkljpHWdyY404dknYQlPQ3ERLE+77/5TS4YhViEiuMc7NB
 StdoVp+Je0hbsKJbWkXSL5HhglGeybdV3CdhwSNON8ACJBlw1Fm++jcItATuGNcHBPAy
 pnFTXWIeAey1YZT9cf9GPyGdivh3lQgTSppH0m2PCFY5p9BTItZhFyxk6GqZ5qb8NMFB
 fM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768921707; x=1769526507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mUmrSu31ONwAekOtCK0Hi13CBA3nu0/xLAwS+OlZz4Q=;
 b=G8voMa+K5pbj1mTxOaxsWBCWx+RDmSxFZPwrpy1P3sdLXH4soP+/FuS+YGSYiUfQa2
 Vc37ECmUQsZtePTVO+UtkzCerxLMbnfNCxO3s90iS40leymdSqJJD5evYnyzZl5qhygc
 g/x6XkB82BNIyTvLGx9Gp2lDW3pV4VSJwytLTMhwcGY8TGw7GewtetPzdWmRj3DUGlFh
 4A5V8avOEl8mYOeieoqH/N6Eo9DwCah3iUcDSUt0RtF2utVx7Dp8uA0VubrJLWtE8jiz
 vZXN86wHn72mQj1CxvikgPbmy0tphxAqyE6oGbXn/h9rdAum5rNSo8yxWmT7/zKuU5BW
 xttw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN7+Mv3idt5DwfS6X85T/CG7bFa391cXmq3/6llXE4Mn7U1bJTGQCs11lGWrrUFGiLV+aZMOAYe+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSoO7K8rqV+xC2pHF/QNI3T6SCZJab+LzqJ49+1tveTdN+YKpW
 M9CFGwZ9T2RT8EN8omxlvbHgWGx8+/LfJvmFlOTvyDaNeTDg63Tl3wbd4seikp+PKMjgSYi/Of9
 NUDedqlLhq/9HcWEK2cE441erwDg87Sk=
X-Gm-Gg: AY/fxX7fz2D+ypH7+XzE8Fw4g69++HRwf0HjLBTEbGN8W4ytI3nwHKCqb5Oa3KssDUE
 qdN6/5D1b03nu+g2ZPMKaMfaAcUFoltQ6XC40G7GIte5LMm0FPUmKNs9eA8jVOAOZhMvlB62x3R
 LHUYrrLaDm2LN8ji/Rl1eSBU9WxDF2l7r314PQl3s/Bf2OnoaUhwibdIKSuNYg/yWfHOSigTc14
 lUB9nBI3gkQFqzBLHnmJqqk9hNbVcQrHFnEVgqUDAVve3hTMPxn7zuHRFK8iD2LLOWICZnjZDTv
 XBrCe0Y=
X-Received: by 2002:a05:7022:988:b0:11e:3e9:3ea5 with SMTP id
 a92af1059eb24-1244a784d5amr5877902c88.7.1768921707433; Tue, 20 Jan 2026
 07:08:27 -0800 (PST)
MIME-Version: 1.0
References: <b6bd1fdd-fae7-4ee9-ae06-9abe168adbd4@amd.com>
 <20260120063718.203785-1-mukeshogare871@gmail.com>
In-Reply-To: <20260120063718.203785-1-mukeshogare871@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Jan 2026 10:08:15 -0500
X-Gm-Features: AZwV_QgXgb-PwVx8LhgBmWAgQ7P5qiwZoXFZFMd3tgmE88AqA_JFQA7mJqDS-oU
Message-ID: <CADnq5_PnT9iMTvgzGCDVqVdkCO0Mcyr13VSz3Xqrgatgd5JuUg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: convert VCE logging to drm_* helpers
To: Mukesh Ogare <mukeshogare871@gmail.com>
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
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
	FORGED_RECIPIENTS(0.00)[m:mukeshogare871@gmail.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5DE5D46A41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Applied.  Thanks!

On Tue, Jan 20, 2026 at 3:26=E2=80=AFAM Mukesh Ogare <mukeshogare871@gmail.=
com> wrote:
>
> Replace legacy DRM_INFO() logging in the VCE code with drm_info()
> helper that takes a struct drm_device.
>
> This provides proper device context in dmesg on multi-GPU systems and
> aligns the radeon driver with current DRM logging practices.
>
> Note that this change logs firmware version information at info level
> and does not indicate a failure.
>
> Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>
> ---
>  drivers/gpu/drm/radeon/radeon_vce.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon=
/radeon_vce.c
> index bdbc1bbe8a9b..ed631c0e5e28 100644
> --- a/drivers/gpu/drm/radeon/radeon_vce.c
> +++ b/drivers/gpu/drm/radeon/radeon_vce.c
> @@ -121,8 +121,9 @@ int radeon_vce_init(struct radeon_device *rdev)
>         if (sscanf(c, "%2u]", &rdev->vce.fb_version) !=3D 1)
>                 return -EINVAL;
>
> -       DRM_INFO("Found VCE firmware/feedback version %d.%d.%d / %d!\n",
> -                start, mid, end, rdev->vce.fb_version);
> +       drm_info(&rdev->ddev,
> +                       "Found VCE firmware/feedback version %d.%d.%d / %=
d!\n",
> +                       start, mid, end, rdev->vce.fb_version);
>
>         rdev->vce.fw_version =3D (start << 24) | (mid << 16) | (end << 8)=
;
>
> --
> 2.43.0
>
