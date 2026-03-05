Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPh4DvLLqWl+FQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:31:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CADE216F92
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0231B10EC6E;
	Thu,  5 Mar 2026 18:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eEFCuXU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D55310E285
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 11:49:11 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64ad46a44easo6952796d50.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 03:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772711350; cv=none;
 d=google.com; s=arc-20240605;
 b=lg2o2kqIdWvCBN2n/sKB8Tu9mx3MD5p4y8SebFt31TtDpg1X8plSbitB6xET32/Y/D
 AdEviv4xsosnJ6/+aM/+MIkt9ShMXPOC/6fjYN2OS9JhYIYmBmBIteu5VqMQ4Eucj1kX
 gXNNG5qvgP+gVrEvaiDCCgmV19Fo6Afn3FkkTRqyVMxAigNa1xssA/8R80sLbArpzgO8
 sy3wwN6ynoqfLACbvkZVfd8ZR1G3h4BNdOkEtd3Wx8jgwLp8Er0Lvmzgp6uiPPeZsYYk
 vZMkHzId5qk/FFUFawyTnm/ym+tikg5FYsJs3rLOuC4G9PkTuFLyuXmUoH05bEWpw1rO
 11TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5dylkg5i6KyaHiH6LW/xi+H4XkRI04kFxENx6WCyvCs=;
 fh=b1kDuJNBZbegb5OjnPusfMUNG7rj6TgmpSxAAjA+Gss=;
 b=hSxQrf7b57cDBWM30WeO9Cfg9ZH0ix5NZjonkLrH+RWXiH7Pe97s+vUQFE5+N+Ircc
 5zWAm+1rYhayg8g2vpdCLQQFVKYQiraIAJXuTBotin9LJtHTUh5UVXjD2MXs4MtbvSUf
 Bih51LnBZiyZpHf57Fwj1WOTSytyS5tbFs1crzC7UfOT41PWw7kroUesxFi4YR3jhZOn
 aswCemduZoNmbCq8hKIYxEKGxB7o6WN3Legv+yVXvxyAhnAufNJuJ8jKOwC51wARQTFN
 ai9CJcMV4XYqBssKT9e9ItkWSXDBJAc89//zaHUpeYcaxvHeUH5fdRkbW1FKli+oPQEM
 7piA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772711350; x=1773316150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5dylkg5i6KyaHiH6LW/xi+H4XkRI04kFxENx6WCyvCs=;
 b=eEFCuXU/4llNUFR1PgmcRBSaAqFIM56gLzSb7CbAsf28OpLpIeluJ99TGcjswBtbu5
 RkyyNDJNHKXNhqo6qIQ+w0vMz2ehjfAEIJZjv3VaF4EsXb8pv78l49huDa8kMUl2wI5f
 k9R5//GPT1030KNEAsS0oUuzCeeJS+jrUOdfeNSi8pMDTbtoRH8D5V1ITa1RWgIFRido
 ZaujgHs5CEuJg/+nqDodrjdfda1Wxb263Xm0SnlYngM3MN/K66OUTGdQtwnE0AROvNl3
 YZwmjzkDbfKpUai7eYt+fKG3L+zDgkgeYHdGzg+B6LeBSFqo5IZsIEDsZWyMM8iZGG00
 DPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772711350; x=1773316150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5dylkg5i6KyaHiH6LW/xi+H4XkRI04kFxENx6WCyvCs=;
 b=U8LCVAECHS/TFUd3kVjQV/J8FZqpnBlIhotnXabUxx7SZxRD9s2q9jjtoWDCuDQwxP
 jqvyHQ0kOBFRSz8WUDUQcQ9wRLyZdR0hrv7zPCbzze4BVMCdjA3ZPmmx5oYvD2z9iO0p
 pBfuKZ7CRkfMzvxp9DUhWVaqtdsyaZCKLPUt/R2ai5/OFDX8dtvAQnqtba98FMHf4fIF
 F4OChCf/fMQfRTTuKsKsEoGeCeU9IZTH0lswoZxMceZFW9+Gf3+z4DoUQHwWujTyNoWC
 UqoQdwEgjZJKiSVwWv74Tsef9DF+fW7p0JfBV7dFJCZ0NoQ8bga/0rNOO9X1+IfTD4pH
 7geA==
X-Gm-Message-State: AOJu0YwdpVO9ELHusLupQFrW81q9wtErTgx5rQy3PyTx81Dp95b1uzEF
 AOkqgevLDa6m0rNgQ5ZNwCH1GNf7FkpXrU0h33SBiCk05PHl6EFoIVGeqGPB7KQw/KIdBKufsNC
 sMNf8gI9goEZH0j6T0VS9IPfUYh5JYP0=
X-Gm-Gg: ATEYQzzCvQyYSaj0/Fl/oSM1iToWwYDFreH7fbGh/EmLTcQFSG6Dw3B0IvrazPTHWGC
 30dI7u21v3ISFmpTHWzOu6o8ngAo4mZhmJHwY731o1kH/M9jNk/o8VmdpZMVhIaoJWHrKtIITv6
 E4Wq8XiwSj7+KiFXoaqB8DPYEzstTSZNAndXSiolafV0CLCJVRUuQeVxABYTbFZqaLFXvdAFpuE
 3ym4Rd7C7yJL1bWRxMML8TS0ZaPprSlB5WPTzxou2wOso5tlxA1RPMc1yGboEi9mHFCUc7ZYZM0
 JdjWUSAfG/q0O4R058vrWE1SLscs//4MjgjdgxL7GN6Q5SiB
X-Received: by 2002:a53:ee64:0:b0:64c:a41f:31a7 with SMTP id
 956f58d0204a3-64cf9bf8358mr3598103d50.84.1772711349977; Thu, 05 Mar 2026
 03:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20260305113734.1309238-1-dev@lankhorst.se>
In-Reply-To: <20260305113734.1309238-1-dev@lankhorst.se>
From: Julian Orth <ju.orth@gmail.com>
Date: Thu, 5 Mar 2026 12:48:57 +0100
X-Gm-Features: AaiRm53czpcJ4Kh_-9QH5wh840dLk4f394RKZj8SS2WW2Xr8DRLTxejqPtyf7BY
Message-ID: <CAHijbEWKN8EY0uy73XR2RRh1ScgarZTLibu5ECR08OeqTje54Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty
 stack"
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 05 Mar 2026 18:31:06 +0000
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
X-Rspamd-Queue-Id: 9CADE216F92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.19 / 15.00];
	URIBL_BLACK(7.50)[lankhorst.se:email];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:intel-xe@lists.freedesktop.org,m:robdclark@chromium.org,m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_RCPT(0.00)[dri-devel];
	ARC_ALLOW(0.00)[google.com:s=arc-20240605:i=1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	NEURAL_SPAM(0.00)[0.935];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: add header
X-Spam: Yes

On Thu, Mar 5, 2026 at 12:37=E2=80=AFPM Maarten Lankhorst <dev@lankhorst.se=
> wrote:
>
> This reverts commit 2e3649e237237258a08d75afef96648dd2b379f7.
>
> The problem occurs when userspace is compiled against new headers
> with new members, but don't correctly initialise those new members.
>
> This is not a kernel problem, and should be fixed in userspace by
> correctly zero'ing all members.

I don't mind it being reverted since userspace rust code is not
affected by this failure mode.

However, if you're committed to the idea that this is a userspace
issue, then I think the correct solution would be to instead apply the
patch you suggested. It clarifies the intention of the code in my
opinion.

>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Julian Orth <ju.orth@gmail.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 49eccb43ce63d..250734dee928e 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev=
, void *data,
>                 return drm_syncobj_export_sync_file(file_private, args->h=
andle,
>                                                     point, &args->fd);
>
> -       if (point)
> +       if (args->point)
>                 return -EINVAL;
>
>         return drm_syncobj_handle_to_fd(file_private, args->handle,
> @@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev=
, void *data,
>                                                           args->handle,
>                                                           point);
>
> -       if (point)
> +       if (args->point)
>                 return -EINVAL;
>
>         return drm_syncobj_fd_to_handle(file_private, args->fd,
> --
> 2.51.0
>
