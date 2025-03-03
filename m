Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325B8A4E562
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC4E10E63A;
	Tue,  4 Mar 2025 16:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NBhz+R/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038B510E08E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:17:58 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 860C640CF4C2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:17:56 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=NBhz+R/q
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gm056s2zG2fZ
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:16:16 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 11C3742756; Tue,  4 Mar 2025 19:15:50 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=NBhz+R/q
X-Envelope-From: <linux-kernel+bounces-541120-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=NBhz+R/q
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id C1A0942C0D
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:06:26 +0300 (+03)
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
 by fgw1.itu.edu.tr (Postfix) with SMTP id 1B7FC3064C17
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:06:25 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sy.mirrors.kernel.org (Postfix) with ESMTPS id A50CC7A317B
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C501EEA36;
 Mon,  3 Mar 2025 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="NBhz+R/q"
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347031D79A3
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.221.50
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740989165; cv=none;
 b=YvfH8TS9pRnhjpxPFMMuwv4YRkAEZyc4oVJXiiT7zcTmZh8j/gSXNL6pSIaD3I2QT0JzG9248IGCfdb1DuZsCRyGjRW8zpAOoop4RrBHMI7WEtKgSliz83J/ykkG1zbNYqW/rLd+uiDnItZlLbKRo5RtEbY7WfvxPwpp2/6We18=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740989165; c=relaxed/simple;
 bh=IH4Qw4OZUiaQzCHILHMnQ5Z2BcYMRjESRbrTXR7+1/s=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=XBp3l0fVBTFNGb7cTRVBB7QQVRbnPKI8R1Anum8P3q2rOs+HEisC6sXPDsIuKnA3GNUC5/WEZ8gtxRs1TwMfhQxfXgJzfMm+dqlafrAP2g6UH+z0R7evDM5DhtegAmzPNA4izeptutC5KDBdXdYiQhQ16oKKQLqb0n6Dc99bw+k=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=google.com; spf=pass smtp.mailfrom=google.com;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=NBhz+R/q; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-390df942558so3241552f8f.2
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740989162; x=1741593962; darn=vger.kernel.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0iUVs2ZQh+M1rl5kLkJ/YPcqr6UkD+Cttj33+uPFnc=;
 b=NBhz+R/qqyjfywOFffrgJ1wP0oqlZb2rYxFPhIP/O7rUgP2s43pWZena9MhiSXJo4q
 yJ4Ow7ZdKhZz+IN1wrkCPYn1jsBNwdIts0yllsm9rg/omcslSWjV7EFxrNx31Dq2hn5Q
 PGysDfFx1VPlU1V7Ba87UCvz4GsbwneOYxxmgK0p1pBn6xgcN6Ko63B4orX0JJeCe3gj
 qxk+cDe8BrPdyX/yTLS9DxO0475a2af7aUIkdWbwvjhEt+bzv1nnhcbX35GPuaanE3Nm
 y8F5LCADAa7xpM84SzXL2uLLeqN/FaSqPzBYFbU2DJFt/MehcBNf+zASY1zuP3PktDZl
 fadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740989162; x=1741593962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0iUVs2ZQh+M1rl5kLkJ/YPcqr6UkD+Cttj33+uPFnc=;
 b=fV5xzgDs7aBycPpqj6rVAsm1ePgbseUCDDti8DZVvxboG5/2NV1xUDp+9vmjgxq/ZX
 Igt2BoCRnqWjk4jIbXp/MPSn7mwXmiHin71EdY4kNnh71OBd83PYHfGnlptax3UZWfo5
 awYO3oATC7Zl/1LnCshbkoxUGz+Rad86Dz3EoZ53+ddkssrPxuzGklVvLTD7rNQn0rE+
 Vgcpq0/NsombUsVwEWpjfU5VxtK5jehPDxxwu/7tlhaek1kekGOcpeLr/7lAvHxlEVtz
 Cr/PzzJ6cPI3wJe77nGaU1boX3+fCn038PmnymlDToA9+97+FcsuhJP75vEOhi9gelTP
 ygJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn70MLOPDxP8UaqYTB13juoYItC83zVyCipWg9dj4y8aJR4F5czn6qE95KoMrsc2vqX7WZhtnxQRGukBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVPhDcZd4Bsz5PPud400lIISnpEOBQNt/ZBUl7+g4uLRj+KJOQ
 uFd1OmxD9Uqz1XuJqFkZlWFrqg0j6rjqFW72leyu+guEIpEUNQ39yUJpZd/7ruk+IswcRZj5YAe
 mguxUqjw/PlWUeDJGEsZZMVrecL9NaDmgKLyD
X-Gm-Gg: ASbGncsnL2E1Y47avo3zkFyR6d60PqHlod7dgiEgE4yKFeQHV2PaFVTTKKPEy2p3gjK
 UKfax4aqcG7MBS+4Wa5mP8zEZF91tXneT6F+BDfZ5K0vH77lwCCbG/mSLzvaBzIIENOZcspmoBy
 QaSt+zLJ1mXngUsaA05VqwVvrLCrn6r00EwNFhA1ba2znZ/+omPo8bDsSH
X-Google-Smtp-Source: AGHT+IEk6318AFfc1LcVsJJ84wt3g9PnbPRWzDdM7m2/xTI/OwzWoyIK3cmNaUT7+G0p9cZPZuhg9T+sy8bKgxhf/+k=
X-Received: by 2002:a5d:5f91:0:b0:38f:3c8a:4bf4 with SMTP id
 ffacd0b85a97d-390ec7cd27fmr9441896f8f.6.1740989162420; Mon, 03 Mar 2025
 00:06:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
References: <20250301231602.917580-1-ojeda@kernel.org>
In-Reply-To: <20250301231602.917580-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:05:49 +0100
X-Gm-Features: AQ5f1JrxAQw0Rq7Ilhd1yFsj2dY9VjMUraWB3QJMgYSvaEWDQVWq8PuNQusYF1c
Message-ID: <CAH5fLgjhMfk1vZCc242vKYnTN13Ss23VhVhaAjwU67Z5qhP9mA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panic: use `div_ceil` to clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6gm056s2zG2fZ
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-SpamScore: ssss
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741709782.51957@fQEvROOx79KI06yWEOsuEg
X-ITU-MailScanner-SpamCheck: spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On Sun, Mar 2, 2025 at 12:17=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
> Clippy warns:
>
>     error: manually reimplementing `div_ceil`
>        --> drivers/gpu/drm/drm_panic_qr.rs:548:26
>         |
>     548 |         let pad_offset =3D (offset + 7) / 8;
>         |                          ^^^^^^^^^^^^^^^^ help: consider using =
`.div_ceil()`: `offset.div_ceil(8)`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#manual_div_ceil
>
> And similarly for `stride`. Thus apply the suggestion to both.
>
> The behavior (and thus codegen) is not exactly equivalent [1][2], since
> `div_ceil()` returns the right value for the values that currently
> would overflow.
>
> Link: https://github.com/rust-lang/rust-clippy/issues/14333 [1]
> Link: https://godbolt.org/z/dPq6nGnv3 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

