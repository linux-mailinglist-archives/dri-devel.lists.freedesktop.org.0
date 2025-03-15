Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A27A6321B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 20:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B281D10E29A;
	Sat, 15 Mar 2025 19:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AlVRGJGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B541510E29A;
 Sat, 15 Mar 2025 19:52:41 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-30144a72db9so234505a91.1; 
 Sat, 15 Mar 2025 12:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068361; x=1742673161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RkSRY1nf3/CCgGX8CixRKz7GOQ9oD7FKwLr65/SUc7E=;
 b=AlVRGJGgCpiDRQWuGw1vP65TF7G1P0roviqsZ32a4IY2AxoT5VKz6gYAdWudVUNFd1
 pDoxxpTLAnTuu7DjbDV9bB7URKLow2CT6KdloJQA/GJcWWnSjNdMINGqW1+Dh1LsJlbO
 Vwofo7LKPu8l8ncLoxMsfYAzD25RsUzX6qRvKDtXnnEGYm5JsCSHimxaqKBtHJChnQ7+
 MBT8XbM1aZwQ5ASRifYaqw57vwcyzPYs0e4wRMwe5jryzymxEklE1a4W+1qpercubaxu
 s9GwJVBJW5fSGi6b3mX3qmqZQcQw/H1F4pcfBq4Hr0Fq6Y4wKCTil/YuKDoT7jHevcto
 DCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068361; x=1742673161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RkSRY1nf3/CCgGX8CixRKz7GOQ9oD7FKwLr65/SUc7E=;
 b=l1/2AR/T+yNE2nUKYvQbBpMFDtwvcDzcFt8B6DCHppefhluG9nYBnuJTOanimt5TY2
 OFkFaqqs8xPufT61juBeaiynW1mn4Zqkvuc0h4hmnQJRyvkS+cgGbI3SQsUGrF7U8sSZ
 djmLAHpyXldHCsyQi1qhmWO6G4af8OuNNm6gzb1eRuYxK5+o/v7sOhABMCFOe9oRhpnW
 BTi1UnkNqqAcxxNrVQAaQGpkmIvcGPQ/hmd3Xad0+TEHq4YQHpuTYhixG2D0f8qjvamM
 eJ9NuH955qA2kBsS4cwFY2lev2YaTJpXAYbVjrIB4iWT0atMqzxumHMp78iYHIyRGqMA
 AJLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULKbThZA9MpyOKoYSCO6TF/rMWS4jt2ZY56dUSRUPL8GfnNbFcJe5Dxqcb5uTUiV8ZpFP5gsg5Wk8=@lists.freedesktop.org,
 AJvYcCWTC+r/vQYMNBFtjvViYi22UnVeOnWJDFQaJO92oM4JgT/mWvM1XatbWtp8YWxLmK7qxaYMGVcr2A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyn4W84AYSBoC1OlPgbY6VgWhHdAgne2h1jPEbB3RxLz5q2EJwm
 sokgOAdSasHUBcGQtT7Tm3cKZPjmJZq+H0VNnFHjvjxoHc6YfP+uJfDrwSpDFXLCBtRKEtSxyER
 BdPMQi9R21c5LucMejx+Y1lmTwKc=
X-Gm-Gg: ASbGncukvuCGUfcD9rCSHpaBrvKTiZUa2zhjA6it3bn1FVkmMM+Sv/anT66/lRC67xP
 GBowaQXbBfgFhnSgVydQhTmc05CSmuH1cpGC3QeOBVDEha/ZRCK/VHwLZcLdBgmRCpt6HeUaeNq
 wJhstw2FT3d3tG5QMddztCxA7vVg==
X-Google-Smtp-Source: AGHT+IFxs4He+SBXrB/e8968d3Baar4MKu0CcOHNfsoZUjb9jwXqfRgnNLe0uug3mxIerqMFsB0azD9mjCBGHGObzng=
X-Received: by 2002:a05:6a21:9189:b0:1ee:e99a:469f with SMTP id
 adf61e73a8af0-1f5c12df14amr3661527637.9.1742068361121; Sat, 15 Mar 2025
 12:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250315024235.5282-1-andrewjballance@gmail.com>
 <20250315024235.5282-3-andrewjballance@gmail.com>
In-Reply-To: <20250315024235.5282-3-andrewjballance@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Mar 2025 20:52:27 +0100
X-Gm-Features: AQ5f1JryREH9Epw5Czi-uWWexrRFhCZPOTW2A9z8mj-ycImcQLdxcWM1ZbztLgw
Message-ID: <CANiq72mLX6d9wYGC_OfQ_-0SKsjM85hP=X5n9qRwx5krNw1NLA@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: alloc: add Vec::resize method
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 acourbot@nvidia.com, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Sat, Mar 15, 2025 at 3:43=E2=80=AFAM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> +    /// # Example

Nit: please use the plural for section headers.

Thanks!

Cheers,
Miguel
