Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E7AE49A6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA1E10E3E9;
	Mon, 23 Jun 2025 16:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RzBVhatz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28F110E3F3;
 Mon, 23 Jun 2025 16:06:59 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-23496600df1so9692935ad.2; 
 Mon, 23 Jun 2025 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750694818; x=1751299618; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0geRFgwyhl/h2PdBdo1H4e4Lzu++xXp44QjAHfPHcpE=;
 b=RzBVhatzY6U2KEdR5YbZTLSMiKgiPdCb5n8d1BLoXU53GrR/63PxRrb4B+XS+0E9XO
 qHh0XUyjMBuQtYLt+CG5NrutuxNA3sY9pKWp6+Ip1vm/gVahpGvjmdosLnXHVmv7w2+b
 hj+GvSFbcWQMwXysE6HyNuMdYbj6f52f7B0kLRAsWFdpNeUSVdMtEN+rI+ngmqQjVrjr
 wmKuqtwV2LwoovBmHyHWJYuWtw9+WwIjZ59tWfYljSvPst4nWKx2Au2PtVQklNXf/2VZ
 dhbUiJWbbjATXMUehlp/8OOvOttIwtsPwmbbuuC+YKNW+CM8N5GzTGe2oZCAEfO5wpdm
 HSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750694818; x=1751299618;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0geRFgwyhl/h2PdBdo1H4e4Lzu++xXp44QjAHfPHcpE=;
 b=t1WOaMdHoLvwxeMDDPnKJh8UclMQXR+ylxrXa5gJSL8sM271s3sjqttfkGsacvCQz6
 6kP6uBGQtwqhEfZdw66MoNf4zh3L3Xm6TynD7ZticMGZd5fHSqb99tsGuSNqlTfG3Sys
 gE9Bo5ZJzes7qvekxRaqD92DAUHKOtv9UQrziZlmWZgEcNwV/eXvu3l84I7hQ88PCPDv
 s3XkeyTw2YF/7LtuRKn6sB2+6N84We9e50xrazWaE7OLo+ivxMG+TPD746NMenYXGLG0
 eLVG9Rrchr2KlbcosQbEGvOCxpBIZVBlBx+350ldsY5NK33zGm7eA1b3bKGx91msmy4o
 m69w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVowm1U23jccEo7NUgcjAhHQrPiXU7X2lHMtFcBKBjtXwpntJJnewVO+q2LwyZiV5SsKGwMIU+PdMI=@lists.freedesktop.org,
 AJvYcCX3lIMvG9BECQ0NRc48uzwb2u9M8CjeKvz/ca4BB4lIQnSHcbBSMnHnkLGW93dildYviTSwohdMjg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZpUDOArZywGY36Kp3x3j1dr/+zMVr2ToICrRH+lKTY3yhUiTq
 SFqewQ3TbScZ+8DDhOq1ODqhxGr19rZRZtYXa3fgDcyur7T2m1jomqbXh/4qhnquLboOUIGwTiG
 /F8Pr846ea8wvjncHnS2i6CmA7Qt/7Jw=
X-Gm-Gg: ASbGncvvR+6wnIvfa14UgGumvmuV9k2tbQ2NTFVF4ThjMYkheqBR9OZS4fHAP57NZWb
 GwKSmdF1K4y95O0/eyOrXYs5wPL73tDqEo/aFwns1/ivuMxBzHI/LDk9la3D/Ryy+KNIbyecIbs
 jiGReObVh+o3Uc6cByKcA4qRURIak4M6I45P85ma+ydOrvaupJ3TuvxQ==
X-Google-Smtp-Source: AGHT+IFR44j/1R0shLJ61EnHnectkEfaJDYb54OjRunDNzkmTMtDm7NOHONuQN3UupNHtxtD9voN35iKKcokHj+Ly+Q=
X-Received: by 2002:a17:903:186:b0:234:ef42:5d52 with SMTP id
 d9443c01a7336-237d995b838mr77988655ad.6.1750694817904; Mon, 23 Jun 2025
 09:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <20250619-nova-frts-v6-5-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-5-ecf41ef99252@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Jun 2025 18:06:46 +0200
X-Gm-Features: Ac12FXzdlCfbzJ08ThqRc5NtvH3ui4qmOJA_sGg1WT42WuqZ4jQEejRTIJpoPoE
Message-ID: <CANiq72ny5vSdLDLpr8D2rVb6dEboq55T6JQ1KJkmEORsj-3kfQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/24] rust: sizes: add constants up to SZ_2G
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Thu, Jun 19, 2025 at 3:24=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> nova-core will need to use SZ_1M, so make the remaining constants
> available.
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
