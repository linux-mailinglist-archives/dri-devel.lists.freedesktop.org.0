Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5282B00BD2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 21:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C91910E942;
	Thu, 10 Jul 2025 19:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FbTY2aO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A7110E942;
 Thu, 10 Jul 2025 19:06:39 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-748fadc0bc5so228130b3a.0; 
 Thu, 10 Jul 2025 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752174399; x=1752779199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68qpC4Y4uSheoQEbmMxx5RKOE+wIAn+KKwc+9lT74pM=;
 b=FbTY2aO2vhNiTQb09I97V0oZF/Aq0TPs7bB02BP+bmnbbKzLsaY6/46gHsx/qOVdYo
 huszeuDdnnIW16K4C7vPBn6BqO+b+lAG3ifPrFUF8Niw36Xh2Dx4OapkksFSlPweS8YL
 TeM8CqgFk/JG9Y9xGQlsoKu0YYwGVaxNOvNojemL6a9y1TDU9e5vp8493u8ClWetKKnC
 2ukSKqoGH+FLkevh6RV6jRIC4Vcp1CJKHaxzVF58qMQRk4pTDWIcGTxgZqSyrJx4bj3l
 UbirBhJ2dqR2p5abPZynCuvkmQl68TUuhLfKdd4doUc0/IzOY0uRsqLEWUHVbOGKIN6I
 h5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752174399; x=1752779199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=68qpC4Y4uSheoQEbmMxx5RKOE+wIAn+KKwc+9lT74pM=;
 b=tRZpAsVfYX+dVYBkHuYouBhNfO8dtm8iVV5b+lvOKPWuf1SYIBNJJaboao573uepaA
 76Z07rbhb373Xx2qlKtMhQc4U0zeA2BBaNA+ZtPC3SsdB+H3yT4k4Nigmwy8KPofHTdZ
 uZEvsIQKf4g66tp9pzFTOCQm6VwdVRuCk2/yApCnYQJ3TfqE0DXCA7DjVXEgiZ52UARA
 uAjRKBC8/mNvDSBS9V5kzEslkS5XbGi/Ysc0QCp6CpDunC/O6KheJ2W5QNMdwlq1DZ2j
 tAlTuqSadOl3YT+X5Yii8ORO6I9rw5Lb3kegwK8xtpoTMBhRtqFg/9ywbGn6RFEKcYaK
 f1Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUdb5lTIE19YnnODvBIV/sJxBhwWtPNkEezlZUZRzXgdeGXpipJy9iOERXuZYVYs0pVjqJzLuwuQ==@lists.freedesktop.org,
 AJvYcCViCZsD8xlhSB4610esPwIGtOKFyo7qs/3v9tHmhjy8WaWZEi9145cIXzIMRuhv3WeQf3ipcTEMWgo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznv0l64TqBzULSZktb2m+uvlnPhqJk/eTKD8hBZdCSJt4p6joG
 BZggFgrryhJlVToOwo8pglg6tP8/3v8qRxZTNPem9QTMRztLgG/kVmC6rxtoHKw0bJCSxcRLLHZ
 wMUqZq06zA4+cecvlqPyUai/bnoV61gM=
X-Gm-Gg: ASbGncsQ5TQOt+IfiGMU+HOGYI3TA27OTKvPAU13L+s/wDO58wGJjytxF2Jjh8p6jU3
 jgr0CWOx6+hUFexToLdvoB824CtS0iuliLFtRaFPf/ZdHjtkwyUK/kVbLQKqjV6I/8YrD9nSInm
 geFtuW5idp1aXf9LYW+Acbwrpb111jYc++EiG7uQFZ
X-Google-Smtp-Source: AGHT+IG0VJqe3uNAcjU3Xxte+v+hYbWn4ghp69RsSsnwscX/+eeuYBtfenFCSddGxjjaiQm1KOImr0VmDgF/3kDaWcw=
X-Received: by 2002:a17:90b:5645:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-31c4c972591mr333377a91.0.1752174399128; Thu, 10 Jul 2025
 12:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-2-f362260813e2@nvidia.com>
 <CANiq72nh71s9to5v1KHJWN79bEFv97zN6jcGJyEQkaJZ5UuJfg@mail.gmail.com>
In-Reply-To: <CANiq72nh71s9to5v1KHJWN79bEFv97zN6jcGJyEQkaJZ5UuJfg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Jul 2025 21:06:25 +0200
X-Gm-Features: Ac12FXw_q-goG-jOjFcf1y4t2ncn8eM_tujmaC9ue0dJR_ud1nXJSMx9bb--WFg
Message-ID: <CANiq72n6759SXO4_8jUryge3s0scp00hiKBnkhnbieObQdqL7Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: Clarify sysmembar operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Joel Fernandes <joelagnelf@nvidia.com>
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

On Sun, Jul 6, 2025 at 3:46=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Added the possibility of catching this automatically in e.g. `rustdoc` to=
:
>
>     https://github.com/Rust-for-Linux/linux/issues/350

Filled: https://github.com/rust-lang/rust-clippy/issues/15245 so that
they have it upstream.

Cheers,
Miguel
