Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLqZJpLHpmn3TQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 12:35:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEAA1EDEE6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 12:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99E910E7AF;
	Tue,  3 Mar 2026 11:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Icp5U4BK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1435C10E795
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 11:23:26 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-64937edbc9eso5085274d50.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 03:23:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537005; cv=none;
 d=google.com; s=arc-20240605;
 b=ecfeltix9VAPwEFU9vKjVkEQnEqxvZOnaDe4WsQDj8jHir4w8JxCnWds9Aruax0xWX
 CI9+1LXhivfZ2nVZl1ZH1wqQt0ucioIpAHt8g6MwmWgLqEbJ9BvLSqh2uYPdjm3cG+Lj
 bbbiUHxcbPQ+tnMms/pHgoL0YIbCduViwHgeBWQPU7K0eb/74RLkp3x3u41/E+BUjyiR
 I2un7swAVxzHjA3qbzAHsOg6hCSi6Os0j3sLsB3dMS8VzVxDHwSSEBEf+w8tflZpEyWW
 vUttNCsMRt2Hz3e8HkdxR757TEh4n0gZE7xX1aFD+0PTEksupjP12sAWkp/4rRr07oEb
 4eHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AQfndCCsOwIQdq7SrFFtxozpYHm+9VdK5aYNS4GA3RU=;
 fh=zCciBAZrqenKL3lxEXWQD9YZti7y3p2onxJUqQqloBw=;
 b=H27W2Lf3kzbGhS8uaONLBlHyV+nhYtGwWrk4q3Q5bVDLe+hOFeF8jFuQGbY4IDRVBK
 Zp1in2wau+t/frsOxoVmWCGdezHc6gV8DxJqO5jLfN2dIqR2xhIMQhb6roivI/RK1v9c
 oSkStsTordOdI8rb4xYgiSxnptEdAAa67OFTzZuhNNEn1m+89oT9xp/L/bJOaZ0nN13I
 hn9JVmeAEjBuZ4HQwGXe8LuKwxMcQQjm8sh8QTGWCxBUHXbdWgUD2HnHwTGkAANqLVQk
 cR3O6QAR0u6BdFSrE1lrSfVImSAVqTqvPa6Si/q2PS3apmgZH5/i6qswpGq3fN9YiWu5
 BreQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772537005; x=1773141805; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQfndCCsOwIQdq7SrFFtxozpYHm+9VdK5aYNS4GA3RU=;
 b=Icp5U4BK6pwt6oyJqnrXe6DcJAIMV1zF8WMtr3yzKHydKFiGMKhLCHR6Jb98YEjlEJ
 jg1pnAdqlEsuhBC1CkBg6b6b52hcXlFAYamUVLzJ4OPA+oE7mnsiIpG4Wr8cDUIF6JIa
 qA2z1sxKr++jMFjW5yDzprpuVXlvjdMTaizBq6u9C2Q6VCi/Hrn8TJvWaQTdHfcqUpMM
 KOxqrihZVPqG3hfQ0D6axkNJF6e6CEyfixlNV5OCezM6ff1vwyhgto0T1R6xKLAChl+S
 LKvuevyQEN9uY0L/W0s/RCX9jdC0C8HzT0z9G5ayJKyMcwkMLiOtxhulpJDpmozpPqFZ
 beXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537005; x=1773141805;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AQfndCCsOwIQdq7SrFFtxozpYHm+9VdK5aYNS4GA3RU=;
 b=ieSYbLi6WJc+Y8d2dFgEEgSZgP+XTwkms7jDvFgSob7f0o/kjwh/q9dltQU+i2pD1o
 oBPgCwGGmiEhryyXmp41Y/yhj/3mIXianbllWWAOgEj0b7BxRc+MdsdqU2AxmOvCCXzS
 KR3MZBAAp47+Bj2R0l1DRrDC6BtMtwgvTwxfzCCG6ukhX/c6G4GLU7B4rCHqbeX7+wdX
 YgR7GH2CuP9ZRyBqn90OaTziDLVnWVkxloH5SK/2Ypc5LIjB/i5b3kOyGmyEiUSHL2OM
 vkMIBDy2lWKpw8pwjFGyqoxHjx0TuOvLb7HG+I4gZEcDIFSMMF5uabYYhTi9TQ7CFfP/
 kXEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTp+/bL81/ZNYIpty2x2aSq8p4/sqS17mqTfnY3LFwIBR7KnJm9+8OlitQz7ytv0TLKzpHAOtVC8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy34L9g0fvGTC9LG/oqUudPdSyKx1FjOOIkH4v3Z/qYn4L+1DJe
 /KjT+NpVrGd8uG22erxyNBhFjPwH2x/9IKx6WSHMF6X13U9yet1QjXKUdNs+Ad4Nl5DpHAb5hxH
 Tz1KiLGAMLOEUX2Eq/Pw8Hu6CK1pR4Sg=
X-Gm-Gg: ATEYQzy43hkvI5cYmfgCRnr2dZPmF9ITvymVWBwfQC1dfzehX5tHLUvQCOksEWTwU66
 KOBgKPsI/cyanyk9odDhnTtTUxo0EX4d+jrgqVEro+3wAKUK3gqott0LFupV28Wsj7DITGzZALT
 3rzx3Ghqesqh4PJvBOdXKF3kS2BiL/671k1NAuhjZMEsxROSgF3v3PsFxLuJW2OXzLDWjAZ+6/V
 32vcB4IqO5yPUjhrxGPlhm9UZy0wP6OTnepJ12uBT4qXo2nHUTUY6qhIzrHAFmBJRowaYqoFMBX
 ZtDOOoLx4YeQPX4K04C6NL7JGdUsDAyhDZtyZZhLQr6JtDy0
X-Received: by 2002:a05:690e:1651:b0:64a:f2dc:2844 with SMTP id
 956f58d0204a3-64cc2289f74mr9427494d50.51.1772537004808; Tue, 03 Mar 2026
 03:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <637a138f-ee6f-4940-843f-0ec873997de3@mailbox.org>
In-Reply-To: <637a138f-ee6f-4940-843f-0ec873997de3@mailbox.org>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 3 Mar 2026 12:23:14 +0100
X-Gm-Features: AaiRm53j9zJCg-JC07czuf1TImlwidQcbnUVKxjjj4eeV67tG6HSkljTi_geqsQ
Message-ID: <CAHijbEVBisTwn2hYdmPiz_ZNZZWppXHgN6T4faHncMHrPWSOuA@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 03 Mar 2026 11:35:37 +0000
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
X-Rspamd-Queue-Id: 2FEAA1EDEE6
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
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:christian.koenig@amd.com,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
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

On Tue, Mar 3, 2026 at 12:17=E2=80=AFPM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
>
> While I don't object to this change, I'd argue that this is really a work=
around for broken user space, not a fix for a kernel regression.
>
> User space must initialize the full struct to 0, except for the fields it=
 wants to have other values. This kind of kernel-side workaround for neglec=
ting that won't be possible in all cases.

When the code in my example was written, the points field did not
exist. Therefore, as far as that code is concerned, the authors
believed that the struct was fully initialized, since they manually
initialized all fields that were contained in the struct at that time.
The code was then later recompiled against a version of drm/drm.h that
contained the new field.

Or are you saying that userspace must always use memset(&arg, 0,
sizeof(arg)) to initialize ioctl arguments? If so, ioctl(2) does not
mention this.
