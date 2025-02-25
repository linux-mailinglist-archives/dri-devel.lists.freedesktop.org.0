Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF23CA45067
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 23:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF76D10E0BE;
	Tue, 25 Feb 2025 22:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OLjybS5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F1710E082;
 Tue, 25 Feb 2025 22:42:50 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-abb7520028bso830340366b.3; 
 Tue, 25 Feb 2025 14:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740523368; x=1741128168; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b+LeoWD79JHqCNmXmfrX82I1MTihVlt4+Y014zmulIs=;
 b=OLjybS5RLo5hnmorH2ByntxaEZ6lnQHxJPaTo9MCqgHYJ0Sp/sSOocAMYhR614q+HG
 tgWBqlStHHVgXW2ObLgIn4hkMfySf20mfIln3bq13AeZ7yeNzs/+L99e9ZPyuuPduGkh
 V5c5RQTr5ZwzYdm4wA7+AnW5839nBhBR4qdoDehT8WGf6YN2ZhM0gnTQQd2cHNtIlVUV
 lElNP7OfJr3J3GTA/xQU0UnPUc3ZPjUu1CQIcbVjLn3QHxO4aVORxoDn2lKShmwM0RIG
 r6mVTwyQ86nm3SVtRx5xoAErlgk6sjzhLPJnS9C2ToMDJDx1mj0mj45SUnHYFsGdNBg3
 RBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740523368; x=1741128168;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b+LeoWD79JHqCNmXmfrX82I1MTihVlt4+Y014zmulIs=;
 b=cwUWA+M3wlldHGyM7f/ww+f8shrnoqkL2tWacHiYtw7yt4uryoz1OOxpgblcwAThi2
 eePsfQVClAcB20UQ5PulRmZs597Y5NmYJDpSBn2dlAeO8xohgvzazWtQLvMROiUohjOt
 sU4Hc80TuBdT9eju7v8j7EG8iUECdcOLYfrmwI/w/t7UKis/0U9Nkfd4tB1qvmSAk7e0
 4J39EynUBVpyiecwMQIkTWAXwewUkbfcton6pyH2azRJ0NpoW8el3JZfLzVe8f4p8KKx
 rNHw3XqLunGWQgzNxTYNsXUifzhbz6oHpISPYyRv3P3UMExkgZjgFX+PVNJYYjstjWi/
 m50g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4WoR62I422RL051717xaaBpacrh/kNitRJqFECbY03tSk4tvu8c0DPfKFoPZFVC94fZqZtO4QQ/4=@lists.freedesktop.org,
 AJvYcCXV4W2zaqkq/AKIgnEQaOEbSh6kaImFTq8fVLto5XjQcNoA6j8bmJt/fBYaFJG+QFwC7zfYVj7QAw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXvBCMxVol27vRflyE4HLUr8ZYYCHwnM8iuYRufsCmH6W8kP1a
 EjMbthY5dH3Fg4kDl2c4rp5AnwMT2FQJRtFJxys265wDlnPTMF6cQ/vqnsCStZA/8Sfvf4SGiE2
 4Tj6yDpqyY6m7z5BLhepDn8/1wfI=
X-Gm-Gg: ASbGncttss4HkNzf8Y76DHugkiaKkSDKTVSzLdXdM51oJd5pfU6ehv4/fic3LczEVMg
 GuI3vgkDOoG3lkg5twDReugPaStzLoTeMi0/qxVXPOh3K3f8esrIatCGheqR7EpDK7XWHur6LlU
 /yXTCy0Q==
X-Google-Smtp-Source: AGHT+IFifrc/55FE/o7oKNACzTd5eIPpMN3RnO7ka1K/p5yqQNOOgOOnNnXkfu+qTWAXrjJTu1ZcDxRLPqb8lMW9yYw=
X-Received: by 2002:a17:907:7d8c:b0:ab7:d87f:665a with SMTP id
 a640c23a62f3a-abeeef36285mr65939366b.46.1740523367894; Tue, 25 Feb 2025
 14:42:47 -0800 (PST)
MIME-Version: 1.0
References: <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
 <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <Z7493C8_IvvYDbm8@pollux>
In-Reply-To: <Z7493C8_IvvYDbm8@pollux>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 26 Feb 2025 08:42:35 +1000
X-Gm-Features: AQ5f1JrXlW948cBSgISkGZ98vaN4OmpvDgQrRNGPSuFQf0Efsh9Vf4MvRVvuzKk
Message-ID: <CAPM=9txkwr3_sdNESa9ufu1j4V-XsJ=EuLFuNLb_dLCfwhYD3w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, 
 Gary Guo <gary@garyguo.net>, Joel Fernandes <joel@joelfernandes.org>, 
 Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Ben Skeggs <bskeggs@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, paulmck@kernel.org, 
 Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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

>
> I'm saying that extending the time of critical sections is a concern, because
> it's more likely to miss the unplug event and it's just not necessary. You grab
> the guard, do a few I/O ops and drop it -- simple.

At least for nova-core I've realised I got this partly wrong,

https://gitlab.freedesktop.org/nouvelles/kernel/-/blob/nova-core-experiments/drivers/gpu/nova-core/falcon.rs?ref_type=heads#L305

However in this case I expect the sleeps small enough to end up in
udelay perhaps instead of actual sleeps,

but I wouldn't be too worried about the overhead of adding a bit of
extra code in the wake up from sleep path, the sleep is going to take
the time, a few extra instructions in the poll won't be noticeable.

Dave.
