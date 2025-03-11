Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9205AA5BDFA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 11:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CF510E54E;
	Tue, 11 Mar 2025 10:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FbeclbuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432A510E54E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 10:35:56 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2241c95619eso10715355ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741689356; x=1742294156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UxDskpVLYU61Yhkdp0Uj1euBtT7W0h1UniNT/9Bub0M=;
 b=FbeclbuMcwUx1yZYlmvQYtS1tFNUgYyx8RHMzQebZG3A59YoQSIDl7p91jWD7+5Ik6
 QPtRtNCboUxr8OuLmUnyswbzgtK/x/fVDalwF6NjDxM410HuL7ByfawUwChlSvYBS8Su
 nIPWauaCGLtLWzuTK2w7GQ1gdE9198p3aclZ+7xN3FUIxsgcECAcHFhb/OoZoGbBb1wP
 lSE+DVTlO2kkOGEQu7Gel65ilrGnDJE/QpMZjzWYJYre8/5lhYW4zsW2S+wCW+bRSGKY
 +uxly6Wl90ilg7teCEetr4dhZ6F0vRnVLIBR74QobdEAusiBz6Oezmdie7USjF+GdorY
 hwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741689356; x=1742294156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxDskpVLYU61Yhkdp0Uj1euBtT7W0h1UniNT/9Bub0M=;
 b=jRMH6nNLcs3zUyOecaJ+DsXIX8A/a2cl/l81GWokmPUr2oYEfU7V1hRAxr/2bKTQyb
 I158/zI+5v2guqAU9zsQRSJSDihDv/T8XEYI59lmWro1kKp7oA7yUNAkw43s9rV+kJaT
 Tx8a87YG8B89z6H+4c8N/YhPUARFFK00QF2kgpDhvYKztF1ff9jObKW9+WR1LKmqzvqk
 UuRFI4fqnFqXJPDL0smH/4ebhwdWBD+kHzdND7b4wQe88cnZyT1l/HrqbMJEi2lyL0Ko
 IthEZ88ipsAg4LrIGDRoNdj4iN/3AnS2s/spm3hvUHHq+Ahd93APd5xzAw1Z0eoq0g2f
 XmPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPmw9MVzfQwL3J2Q1D38OzQd/shoPDC9gUP1pATunyZ/NTB0nEnq/qFVvrNr6bVU5ni6aqIZO4U6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0dfp5Q4gsuSRA8SaKxisUG7thHOhuoBWFKV/ohxZRxA7fhboB
 02XXvnF1Vt+9I4GbAUnNEKIdOC9A4d0M3QjIWxTtvK5OyP1594NPOVBUzrcVKG0JWDWdupaHHKr
 JL4PB1Kp7f/p4bKQR+1ctn2HeBr0=
X-Gm-Gg: ASbGncvd86Iz33vqpWkyTEAc0LvY/kaRlBDfbMiJ0rOvCvg5UPmK0OZcNKfHelyc6+w
 uiYWdd3A5O7nmxscVAVdcrasxgMMDBxRVIOLFbQYhkNNvrHlD1EAipQYBYL1ZcyeRj8U5sniSlW
 QPQm+9rulrS12Mz6MsIefTLRJSG1Z59ZiU4tnA
X-Google-Smtp-Source: AGHT+IF87YUiZ+c5JOKl7/uEv8ins8dVWQu9guMI6WW9ct4VPV38xmxKRqCghoMQdNmqmGUU8pbk7zCcBU98rWgQoGs=
X-Received: by 2002:a17:902:db10:b0:223:5e86:efa9 with SMTP id
 d9443c01a7336-225932807a6mr15210015ad.8.1741689355745; Tue, 11 Mar 2025
 03:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250311201726.3f45cc67@canb.auug.org.au>
In-Reply-To: <20250311201726.3f45cc67@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Mar 2025 11:35:43 +0100
X-Gm-Features: AQ5f1JpSKQvJcLrhKtcF2ocDtAMKZaTGndWlR_jK9p2w5k5M46BDlLORXfeX0qA
Message-ID: <CANiq72=_jVDkSo8Q+it4_6-UkTEVxD6xG82aEPcpAwGQpKAB2g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>, 
 Alice Ryhl <aliceryhl@google.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Tue, Mar 11, 2025 at 10:17=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> I fixed it up (I guess - see below) and can carry the fix as necessary.

Looks good to me, thanks!

Cheers,
Miguel
