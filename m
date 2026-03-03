Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMGINrETp2mfdQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:00:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632881F449C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A79A10E870;
	Tue,  3 Mar 2026 17:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ytpx88hz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com
 [74.125.224.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CA510E080
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 16:54:23 +0000 (UTC)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-64ad9238d8fso5665057d50.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 08:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772556862; cv=none;
 d=google.com; s=arc-20240605;
 b=XkDHajrrpedYDZmggSKISjo6UZw7/kuC0jPDslA45Av0Vhm5fpxOjISIFSBNmxA5ib
 AQ5YM0CZr9v4NvJnF+6DECtNbj8MjGZwyqJvYuOJI6A+/CT8YDBvxEFyVuivU7370o+J
 SqqBib09rN1itf9c/EUygyTfK1q/2VskrP6k6PzOjUbzBQOTTkc0HQclG1aSSTl/cAy/
 nSdyF1XWyL/WOvM8/r5mMiPSb3As9ZSO/lNUlrIfMDQ3zwYBn/P/YNz2xhc2EMwtuHJR
 HHI2ErBy+e7cIbnUfOP4N0M1gGRyVSRcAov1rJgmzWxPjlfMxMlJqfO32hS1rIAES0e1
 jSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DYp2LAL8rNzRDmVXtkZ71RUbT+7ZrsVaILrThm3kSIs=;
 fh=ikyGfyH0YVX7liKuUPYwkY3w4LlBAMbA1SiYWJ0QnBM=;
 b=hZeGn3w/wDL5MUMtxPus8wPrxTnNfac0DAzWnAOJYF0Ypha1cljNXcGEqiecHLTCL0
 WN6NVVbfISHAGhEXNYWrs7rS/A7NGzql/3MMBsj0+Kmpvc97enXbOs3Y3c82ALUUjkLY
 DyBUdWuMSVbF9Wg+sP78e834vGeBqWSIrJLyBj1HcJWSiablbKnCsBvRnCv3UHJL0CKK
 thYYVtEGfK184RMSOmGF+oaM56+QhhRIhfpIcccrQ/HvTNWcEuNbEKjDCPALgP1EWbkz
 ZgrehPZwAKkuyYKB4Q9PQpVBL0LR3xA49YaDeyHUr7h+sApLDapXZKqoL6VAdVj34vX6
 Z+PQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772556862; x=1773161662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DYp2LAL8rNzRDmVXtkZ71RUbT+7ZrsVaILrThm3kSIs=;
 b=Ytpx88hzgkAao5Xonz/78s8N/lKLl+NT3fjn3FOzeQUxtl6fTMsfhIxGdZe+SnJcYt
 a2kDdHhNLIqN4XBR7iBgEcFaKppa2S+3XU6G+8MXSxZuLZ1B0Rus14LFX952KN7c6pI8
 AlNHvp3uiqidVOje2V7/28o6SKmQtZRnpBLJ44UCSBRiwABjjqas0NvmW5zwm0/JPqJS
 0SI0nql9OXOFdiR1rFp//eMGXvI6QZNJKahiesQ0yuco+7nLvdeIeHINGsob7tU0/rDI
 HNMzGcsPEcOnIxcq6erLyuZVQkv/7fhFqxY7328SKD3OYbpV5xRmgl8RoJk7z/JyvZlr
 vTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772556862; x=1773161662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DYp2LAL8rNzRDmVXtkZ71RUbT+7ZrsVaILrThm3kSIs=;
 b=X6mqBbJoAm0Fb3t1FrGx5KLKDtdykJ/XVc4iTlMq3v+31d7OWtOCqnWwLTcnqrhL26
 q/khclhXBIfRQjS/+3saQOsQdoLIgLmP7QVIuQcw7VLR+4BTVlzd6xHBnoivUCwnDr3t
 WicShD5xxMIfvXLRvOsYlFKRTM3oYeo2+QuXASAEV5A5DQaNljvMb0o37p9WhtopnuKE
 KWFTlC/0wO3Bo6s7UemGIKYOkRDOMEvE8mGRVsrAa4565b2F1qphv/trxCJJGuSePZPv
 IyszWIvwWmixIymyZip61MK4omJ/M9kJLqwd4rvOmdU7Vu/KZlNLlxOGfLINKbDn0n/1
 1j8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPk+VP+7k7WB9snPsRLymY+p6DGuIDfxPYf6hkagJRpyQIMTRRvKCzrndYTaho9COs9a3vsi5adBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGOutLKMUPPVZeFkycjH3qXvP/WyaYlMnm7RciCZXiqMD5QsUe
 iU25GDuC3WWd3xy+mOH+31ZStLTAE69PDeeYdUXk7POPoX9b9efLxLCtcvyHvmhcILnPYMkIumK
 tI1CzhJBNF3tqCJCtcTorOPat3fM9Klc=
X-Gm-Gg: ATEYQzz4ANVmqSZWetw36WbYM/3nxAgtq3r4KlyHo5b/gHjsTc2Ho4YbzsdR8Pnyj80
 s/YQkmcqIRCj2mWx2onTkzeKCYv7pXl3jlS1maHqilZMy2Lt0e0wl72DQXo2EseRlQy7K2qsOk9
 a+6V4+RBRugi0KPzIAj/d4kMBNYPe5jgB66V6HYZm4nHrC8A18YYx6u9spO+jFJN1QBJ/9m9YQ2
 TCCfox01fE+9ri/9/z5gOckWtiGW7gAJEMRaeaj4Y99KIxAcWVfEhHXVGZjVKlF4jLUyB4l3Az+
 Z4AGmQJfQ16kA4cyWLrj6a60eh4C2E6Rv30WTTLuTK5271G09xR9/zJ0Jo4=
X-Received: by 2002:a05:690e:2548:b0:64a:cf8e:47f6 with SMTP id
 956f58d0204a3-64cc22a8cdbmr9663785d50.68.1772556862336; Tue, 03 Mar 2026
 08:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
 <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
 <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
In-Reply-To: <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 3 Mar 2026 17:54:10 +0100
X-Gm-Features: AaiRm53eLziU0i7VieM9VK6iXyf3C6zBTVXAPKwhZpHFPX1lBbd60Nr1hfTdbfY
Message-ID: <CAHijbEXTPSLSADqet1=P1FV6jvoa5yGEprOuYtpQWUq_y5uT2A@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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
X-Rspamd-Queue-Id: 632881F449C
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
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[mailbox.org,amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 5:40=E2=80=AFPM Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> There is precedence in the ioctl, the pad member is checked against zero =
for the same reason.

I don't believe that this is comparable. Developers of code developed
against an older kernel could look at the kernel and see that the pad
field was checked against zero. They could not see the same for fields
that didn't exist at the time.

> The check was there because it is invalid to pass when IMPORT/EXPORT_SYNC=
_FILE was not set.
>
> This is what I would recommend instead:
>
> [...]
>
> +       if (!(args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE) &&
> +           !(args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FI=
LE) &&
> +             args->point)
> +               return -EINVAL;

Should it not be

+       if ((!(args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE) ||
+           !(args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE=
)) &&
+             args->point)
+               return -EINVAL;
