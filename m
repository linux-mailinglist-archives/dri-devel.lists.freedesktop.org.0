Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A62D98C16A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 17:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F88310E05F;
	Tue,  1 Oct 2024 15:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IsGNGBnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210C710E05F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 15:19:09 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fad48f6f9aso723301fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727795947; x=1728400747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qi8yKQjrLWHCSWjOpRs4bR/ZSldJgDWgk6YEdhDY6s4=;
 b=IsGNGBnHPg5qn5ajXs9M7G1NOvZR470MgSQlPy4FfzAy13TgxuJy/scoWTw3I1fFqv
 bwpqLeRQuQTiZaOD4fZb+AT7TaKxKk2bgcjjt8RJfe/2yNDIcOYAZgYE8Cvvm35vtf+u
 LN7yuipZu5cwe4LSDwPqjV3rrPFWoYSDefEEf5cHxoPWyrf7VzFSvEJHbqKJJvy9Hpmo
 gIrD1FCD4+cx9pvjOzElxyZ5kTZxXQKtB/01Ik9fhn7vv6zuGD787cv53g4wN/SftkhE
 6CJd75W1sheNI8mzC/8oIYg6JtICketiqTNBxb1LIsIfua1625PCnO+NFydob2OCEvpb
 zbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727795947; x=1728400747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qi8yKQjrLWHCSWjOpRs4bR/ZSldJgDWgk6YEdhDY6s4=;
 b=cB+VwTYpx0rsrEUl3s5O2vKWcDIWTULz6MUEazaX3/H4p69qmKO/CW+HVlIITOe0Ri
 3tFxUhBGJ33rZvDjCfejIpJUAPYNPuxsYtYgnWg6GOHnqJz4STx3ZzoPPCVXyeqgXW83
 Peq+YJ+/ccDH21o/4zPVUcvCREvNFHMTNus5NyXfmwuCe7W5OhRSDvvsSqB+muL81SeS
 sPpoynA5t7nGUR9yRDBLfAIIU3v+E3aAyWGbvAq02eCPBeg3MugNWpKenVZVQRvtjdcq
 X56eJKgpP9sHMpyowOU7ipopVj/g3xwgjvNcvtS71dqso4rZhcoP13Hu7Vws8He2Jtv4
 J2FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY4i3W90UYlJF9SGTpgyfrt9eMqCFnHPOp/Ml+2yohrwvBHyn54woVagUq5bYN78KdC3THDphiSjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyitrjQkbcyTfPhhEQr7cqIFPPPc+fEEVMKvsMJEFrvBC4iXQC4
 iIyfaFv7DfHMQwRcjMt2jfsAnHr8Hxj6CLQLeG5rpGRcHnwUb/GhA6ELXuOKQMP/vGRRi4evK9p
 nJtn0NROpvVUuPZ2lBCyK3D+XnDQ=
X-Google-Smtp-Source: AGHT+IHt+TuZfDewSpTYnzspHrDKyHlYwH7HsKkgbgr/yf/IpVhOkdGpUpV5QaZEfyPfW8LWCD7/L67Db9Tp6/Do6RU=
X-Received: by 2002:a2e:b8c5:0:b0:2fa:d784:e11e with SMTP id
 38308e7fff4ca-2fae10a34c3mr207631fa.11.1727795946762; Tue, 01 Oct 2024
 08:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-2-lyude@redhat.com>
 <87wmisuqcd.fsf@intel.com>
In-Reply-To: <87wmisuqcd.fsf@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Oct 2024 17:18:53 +0200
Message-ID: <CANiq72n5bethTsoGvEEd4OM-J+7t6bsMN0Qvm-=cnqjMLyAcrQ@mail.gmail.com>
Subject: Re: [WIP RFC v2 01/35] WIP: rust/drm: Add fourcc bindings
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Asahi Lina <lina@asahilina.net>, 
 Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com, airlied@redhat.com,
 zhiw@nvidia.com, 
 cjia@nvidia.com, jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 open list <linux-kernel@vger.kernel.org>
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

On Tue, Oct 1, 2024 at 11:26=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> regenerated? Should there be more granularity?

Indeed, eventually this will need to be split, like we did for `helpers.c`.

Cheers,
Miguel
