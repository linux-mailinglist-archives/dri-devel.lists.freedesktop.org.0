Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPZEC1t5c2kfwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:36:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19B76539
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DF410EAF2;
	Fri, 23 Jan 2026 13:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Th1j+7B+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF68710EAFC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 13:36:22 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-1233ad1b4cdso212007c88.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 05:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769175382; cv=none;
 d=google.com; s=arc-20240605;
 b=L8p8V5xuM3th+aVl9J925a5Q4m6iuu+M2fqSAd3iziYLuewe/CDN0lGdQc+TM/skCo
 gFFkc9ag9Ox0ITkNXE4jFTJg5kmlMykeDlv/i80FgsbO9V0MPtkruMQ+nRz0NJek3xnF
 LQwj9SYnH4/SgObz0aDL8jrI2/aRjxbdrBbLm7Uh8pQehIgHJpOUEf2CWN+jOikNm5jO
 KH+36OuvABgbgFM3L9R2SrUI/Ke47xxV7N6FUFIlthBsG+fJDFgPzfIgZljbgIc3/8J9
 Vqswe9Pj8ir/SbgQJt5ssnvPsPYEeAE31s2ijBiYMLH1wVuj00uk2muRT6voY0PRCW2B
 oYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=thIntUxX7j+Gjdg32P1s3etJ9/yf7Zbx/rSjul6B1Jk=;
 fh=N0pMeH3KgtZab7akwbihtKW7lMopk0JC7GEVyIqmVWs=;
 b=K/BtI14job776N1jdzLwo17xewpLs0yLsosxSAWSjQq42oHUVD4tBHEV/vuECBnXQe
 b3xFYB9zwvVEtDZL3oZiw1wFz4SnGHO3bmdSkFsPOMjKlsuARcmuapA3+U3WHr9e6ZrQ
 Jy4AE/CgBc5LgHDB9whQ5j5O7cNd1Yf2yv/YVmKEDkw0JrMfkoAOfzg+thu7yXb+5OCS
 lQt/R3lppF6AGIaNOa2xJGQQD1GXN+lKweYBea0NYIiNnzqXVFl4VJviiuSeTFmNz8LX
 iTXnoOCPkwAGLiOxQD8zxMJQEqP8H603atcd+aBHATtPlunSrya3rh7KvRiL9hs+CbWo
 tthw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769175382; x=1769780182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=thIntUxX7j+Gjdg32P1s3etJ9/yf7Zbx/rSjul6B1Jk=;
 b=Th1j+7B+W07x6V233UriyLzuDXKXjKQDzsIV5OGqdRTcOxOH/roj9mv97gNnjapHd5
 5DHtdXNhN7T2oSWVeSFxqnj1visnk8kLNurUI7VfD3ca3SswYUuv9CBnF0wN/NrOng9q
 D1AvJLX8KZo3VMW6Vb4qzFO/1cnRKFl3mhaT2lf8oLdEsDypQXgHQ121ZAVovO6sIP0f
 01sJFhl9dBAjUk7zIvNlv34vyehH2Se7WYCcFF0gbGMBus8U9MccXU/ukRtPjwmjtOCT
 84ERDLOFnYQsAWI13AeQ7doFIFKsH0noI6ArQWCrlNIu7bVx4H3ZhKJVln8WwmLRcOsm
 QqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769175382; x=1769780182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=thIntUxX7j+Gjdg32P1s3etJ9/yf7Zbx/rSjul6B1Jk=;
 b=ZIu+4qiGF0nvfh/E1fFd3PugJrFIluqgmVgv9d0OxdRTS8shUkD6C0Fs62B881OSbH
 WdWx3ifuDgMgCXkzjOw0+ZryBVwmziW6H51eiyqF8a6dgpdBs5nzN/rdNRdasKoeQ/c4
 guTDKA8lBP8NEUJQDeW2HiIEHklsoM7+SerhHPcgOBuOzB1UMzDtyai1l/EmTS9dK04j
 9xqOaRirazu00qbCaBUyLu2qAyxy08GJ63hg6Cf9ptHhxI0M7W8hwWS7JezNkxaJP87w
 /V5Iq6gVfAkS8j9MovgmRz3tC7QCftLurAntS/fVYsTJa47+hnehZhve832S86DYV8wg
 H3MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6RDqW5CnHUGfliq8r/dqpxOcKx0qe1qE06C2hQP/cprwnMgew51sCrWmcCPmAM629WjPIh60YA9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7T/YIVuirucy/XXb3lvhGX6kiS+q70cMCCDFQwbotXL3zwKlK
 f4o/t1ZOY2/RiTYio55VN9cBeJwpFq6aHVibQlNWmuS59urMCKSD4rVPsCCqEg4QTsozifvRbTp
 Lah7B9tHgaE83DvqkecAKBRbxP7Z6dDs=
X-Gm-Gg: AZuq6aKwdt7S9FUA8LyMwxAQqmA/uaO/egrKydTQULUsznrTYmAfouPal3wK0cso785
 2tbiF26TP5VuF80hLFwC/4b8KdEjdepz6XiKQbg9MVCr0xIuy19dQr29N8VdQ/fuqU+DFkzOl1h
 /LxRS/SV6AScsh4794019rTRx50ywLY0M0cWW93UHFxEfMRIpOH5V8xAvZpZcnQ8YpW+CNcLIzx
 PxBnsyLZrnPWTpcLZLCs/k1cRiwsKNIAQaPzXlP1pU4kZytvJglF2cFnA91mIKC43NKKv18LANQ
 8LebmIBR1jwdtRBb5YqHnCWEO888f/JJFWMm9y0C0pu2sEvC8AM1fFhutQlA83XYAlLijIeSq2Y
 yqmMii4kKIs0R
X-Received: by 2002:a05:7022:2529:b0:123:34e8:aea0 with SMTP id
 a92af1059eb24-1247dbb1084mr725593c88.1.1769175381816; Fri, 23 Jan 2026
 05:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <aXHi2jJNptrgUqyj@google.com> <DFVDAEMXT9LT.YCUH2BB8FV7C@garyguo.net>
In-Reply-To: <DFVDAEMXT9LT.YCUH2BB8FV7C@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 14:36:09 +0100
X-Gm-Features: AZwV_QgIy0LaoigKp_ehPN0nt_octRcR3EaYj0Zb0FmNjvDaSnSLYUBqrmFsOp8
Message-ID: <CANiq72=tvkD2+0KOiL0AJXt7Hvz3khe1kBVs52CEj6PQyRj6Rg@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>,
 Deborah Brouwer <deborah.brouwer@collabora.com>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
 broonie@kernel.org, dakr@kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:aliceryhl@google.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5F19B76539
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 6:07=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I wonder if it makes sense to request a feature to mute `dead_code` lint =
on
> certain types which we know are there to represent a registration or reso=
urce
> enablement.
>
> Currently rustc's dead_code lint has a builtin exception for `PhantomData=
`, but
> I think a lot other types should have the same treatment, this can be use=
ful
> even for other core types, e.g `PhantomPinned`.

Added to https://github.com/Rust-for-Linux/linux/issues/355.

Cheers,
Miguel
