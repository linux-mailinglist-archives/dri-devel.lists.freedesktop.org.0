Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90368A4E74B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CBB10E658;
	Tue,  4 Mar 2025 16:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DN3H11wx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D7310E657
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:59:51 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id BCE6840D977E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:59:49 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=DN3H11wx
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gns14r0zG2tp
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:17:53 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id F109A4273F; Tue,  4 Mar 2025 19:17:50 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=DN3H11wx
X-Envelope-From: <linux-kernel+bounces-541117-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=DN3H11wx
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id C4E6F42AFC
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:05:24 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
 by fgw1.itu.edu.tr (Postfix) with SMTP id A9BDA3063EFC
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:05:24 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DAF71892B24
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CCE1EEA49;
 Mon,  3 Mar 2025 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="DN3H11wx"
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644ED1D63F7
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.128.53
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740989106; cv=none;
 b=NshpEhk9BBK6fpYbQ98+nffQ87s+NPIxUn0J8LA0O+YezS/6A2A/4xxrJFE5JKemJdiklReZqHMR0YWD5KtdzSPIwEjwr61qaWMcUu0NcRT5wLFBqVT1zKMjyBgd/NVCrVjAJB5Js+Ds8jpD4CPFlGpafLTOz+ZKxVjWBxqb3yc=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740989106; c=relaxed/simple;
 bh=JHlXb3zul+rNFkDXGVQOrWhVuAYvI+ZjVaYWHjEHsuU=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=h+9ce6UjX17Rtbf2ISX4c8Pr1YuC1sw5CkS+/4IlxFIYXha3Qq7BgdCMy/gcdxBTFYmvmktZsQ8UmlseYKO7Z9hLblxq363q1Xb1Xx2dW9BjYtp9RzsoE2t/VioR4p1q8ME6YPHggtpD53JBZM04C5JKON4ZYP39LwVT3hN2enk=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=google.com; spf=pass smtp.mailfrom=google.com;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=DN3H11wx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4398ec2abc2so36815445e9.1
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740989103; x=1741593903; darn=vger.kernel.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBB9+bS3IdAEw2Zo9wy+KIRO8+GAYmgN6Dv1bAKxGKQ=;
 b=DN3H11wxatL3cArjcoi0gb7tLt1aFRvKH5UcTmqmM4Cp8ToSfni9pxgCgQahywKBoL
 wjJzTP+yS6W+N98u2cc+tF0fdh3p3/5ZP+R5bKKwWNUXJxd08hWLrFmJV+0Qs1glcQL6
 BQA4IUQFaDhpOfBqCG3Ne/MSdWvBmpu2k4ej4gLKfA/RxlWXVlVzO+tgVn5J8vlrES0+
 R0GXBwXC2hoExKYNGlJkh4ElT1A1bL57wzGjicGr3hryUZWkloz1UbrIY8Z7AkQs7G2S
 TPG3raYUm0pmfYXCk5PDzChFfJt/G1nN567xeS2T6dsZltZtgvfA4KNr4kR4tcOYEzjr
 /L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740989103; x=1741593903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBB9+bS3IdAEw2Zo9wy+KIRO8+GAYmgN6Dv1bAKxGKQ=;
 b=Wr5xwifzrMN2EO3E4csD9SR8nexVaBWvCYpL44xzevZtGJPZEtaWIbzYHQGhK7zVHL
 6IpnmtbVfgprw2qzbj0APpC/WPj0NqfRWY+nvMVzXAuGAUBDJS5bdFr9+PfC/2sfqFd2
 btCokWFIT8lXcoNt8cWzmrcOqP7Z0ey3oqvx27Xi0+KytCpeD5O6jrNrLWoUyECqZrOA
 a/tBIVoQ22AZbCVzqA1kwOSiE89v16LnYVji+pJAMtKcLDu4eXuHYRp+IAzdqQErLtVH
 PG66y98gi0ulTyNL2xyYdmLE9Wg60FDIQA/pSI+kuz5emRyH0ZT7hyidOVet4ecpTwFN
 8NYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxtUCaTv6SGYjCwcAmDgMw7WxCC4X5x8fI81sPqTPBHE5zAUb3CAHEtCWMZFkbh5thyfuYQbRoLuB2Two=@vger.kernel.org
X-Gm-Message-State: AOJu0YyopsfNmX1siOG8ow8yxJqGYviRVOjekepnbhoOCqS1eVbFdkQp
 uWUokUx0jVwlN0eCGRZZUhgB+rgRFKbPNk3U9ZBzyh4vhmtn6xxyevUEoK9jxVNYVNPQOrLOM4E
 z6R9ZBNR5mUGRYEbi1dcHyATHPISUlf8p5i6Z
X-Gm-Gg: ASbGncvjq0mUdXqPpO5tO8vzU8GPrPi+Wu4o0RT3LtOJD9sioNbQwJyDjbmxgPoc9c/
 A7EDAxuhIgu0PYD5MKZZr+zUQZvtiYfg3VDEPTMZyZmblMMX4dAKd875tXWyTKrPPBydiP5PVhc
 wsju0w56CjCNyCkXHkhfr1LQmdPfTZvj6+AN6vy9hQw4v9jkn0JJQFYmvM
X-Google-Smtp-Source: AGHT+IGpdxgjf0gkSNOiBqhKXbQc9hRhwlo2W/nTX9MqGqqFdt/JgT25MM6r5uWJ1chlgrzzP+QlZYMm6vZ2gmLXFNk=
X-Received: by 2002:a05:600c:3b24:b0:439:9496:17df with SMTP id
 5b1f17b1804b1-43ba66fee15mr102753595e9.13.1740989102617; Mon, 03 Mar 2025
 00:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
References: <20250301231602.917580-1-ojeda@kernel.org>
 <20250301231602.917580-2-ojeda@kernel.org>
In-Reply-To: <20250301231602.917580-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:04:50 +0100
X-Gm-Features: AQ5f1Jo80hSF1L-_KjqVRtXigJWOzdDSnpQhkOp567xZ9U8afL5p9lZs6wbyFLU
Message-ID: <CAH5fLggKXw-SCtR_vAOAU8KJaAvmNP20egmtV8KmX0xV0DA0dA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panic: fix overindented list items in
 documentation
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
X-ITU-Libra-ESVA-ID: 4Z6gns14r0zG2tp
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-SpamScore: ssss
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741712297.19981@8+lo2VGTxuC54g5tnZFA/A
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
>     error: doc list item overindented
>        --> drivers/gpu/drm/drm_panic_qr.rs:914:5
>         |
>     914 | ///    will be encoded as binary segment, otherwise it will be =
encoded
>         |     ^^^ help: try using `  ` (2 spaces)
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#doc_overindented_list_items
>
> The overindentation is slightly hard to notice, since all the items
> start with a backquote that makes it look OK, but it is there.
>
> Thus fix it.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

