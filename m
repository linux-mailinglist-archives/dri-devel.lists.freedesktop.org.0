Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A982A70DA7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CAE10E60F;
	Tue, 25 Mar 2025 23:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JOBXnD5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240C310E60F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 23:32:10 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30bfed67e08so70400051fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 16:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742945528; x=1743550328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eefr6HbRlYtDKXKjCQxLxiNjejMQgJVFupcX7Ph1gcM=;
 b=JOBXnD5m80byFtyVHO9la7fzGRiceGF5ThNGX3vFWJBqCkmg1VJIA8ba9CsTvcud0M
 d6e87UKdGZ2ajhLv/JfzSfc/royQWmq8BplGHdtEpO5xH/3X8fHGJrZoI9C3Sq5GtzBv
 VTMtOCtcd30Ro29WRGypD6mJEtaLcXvWW84bscW864z/BbrLdzF5u2O3u5QuOlekOWVC
 KsgM0XsohJdeZWYtkSkgKttysoG0od7HEjyMI0i3PCBIc5Kp64Og+dfR2xRgOeLfhb70
 Rroq6tm1DkYQbao200koARhYBS9tr15hh17HgNxUoy35UgZ0ZGdv2iUmLvnVsIKJKleC
 Gi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742945528; x=1743550328;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eefr6HbRlYtDKXKjCQxLxiNjejMQgJVFupcX7Ph1gcM=;
 b=H2Sy6PQU87L54DZ3uaIjfGZ3VOOApFzy1oFcZCaC0/itY5jXIeAcby2utKRWOzEFe6
 M8RbMMq6nKP1Tv/C6Rjliy0H3srlEZ6VgRNe3xNqOjAvvjsJ6U9cIEQbH+DjQI6fXiZW
 IbhJg7jRB5/lRykHL8oRSckEk4SpKHD5VHeFhe+CApET3wXFX5TbYGLkbvhV4gU5eRjn
 OhjSSe6w3F5XaaIgHM4JDWwn/8pW/PUSbONbjy7kORjhavNGAQix/IfTTALKea7Z5W7c
 CRKyZ5JDgckIp3WP6zs+CinsdAce+vC9m7AbNWeSR4v5l9LMPLSIR6r6fbYYAAKIXQf+
 yH2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUic/P93kSfNETfoAv5KSIej8xr76j675Zm5c33Z9LCxJauySnv4G4lUMSWf4QfTAthvet82X5X0xE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ37EsETTpNffgk2nhYOY3deUK3+C6Qssx8sZWQqrBO/I4O91s
 X4PjWMm0bFRgKoTjWIJMOwP2rjlFH2xoQ+mwcMzG/hJmz6T4cym8OOqbECm9H2QNu46mMUYD8Mw
 3DQzKG95KqkAhBdSGkwSPF9t0B1g=
X-Gm-Gg: ASbGncsvr52ARw5WbEIdHSYNDyxL5JBxwRMR7m5XksJDlwkzjhm/qiUT6RVvpjS4WTx
 M1UVeWaS++r6Rzh+Ph+Z9gSU6JdQNlcP7IYluthJiw6Ez8dcXUUmOl7E69n41nNq3wupMPZTCRH
 Z2PJ0CkX5+0glKzJCbRMe15PY9I0+9FTDBdK4GZalK9TtiGMHNfqi+GP/etHc=
X-Google-Smtp-Source: AGHT+IFxHYJ+0IsL/dVIF9u+EAWIllGZhFdwDLi1uT8DJOuKNoI5GnEZcD+Vh9CnqpoEAhYqpPdcD4a8c0fhXk8RIyI=
X-Received: by 2002:a2e:bc1b:0:b0:30b:a9b7:7dfa with SMTP id
 38308e7fff4ca-30d7e214c8dmr68301441fa.3.1742945528268; Tue, 25 Mar 2025
 16:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
 <CANiq72kYt2mYG8FA=U6C4CPUGfAwDFZ8Jji5SH2Yt2NnOHua0w@mail.gmail.com>
In-Reply-To: <CANiq72kYt2mYG8FA=U6C4CPUGfAwDFZ8Jji5SH2Yt2NnOHua0w@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 25 Mar 2025 19:31:32 -0400
X-Gm-Features: AQ5f1Jr6QN6jniT-TQODJ_8YxxFjZq1wvjuil1EsgVPT_xGsnF65ZNPxsL_Gs5g
Message-ID: <CAJ-ks9kjY0i4ZHe6WJ=6Peo+6nN-5cPkuWQu1iYva_mH=356cw@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] rust: reduce `as` casts, enable related lints
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org
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

On Tue, Mar 25, 2025 at 4:23=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 25, 2025 at 9:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Changes in v7:
> > - Add patch to enable `clippy::ref_as_ptr`.
> > - Link to v6: https://lore.kernel.org/r/20250324-ptr-as-ptr-v6-0-49d1b7=
fd4290@gmail.com
>
> Please slow down -- at least wait a few days between revisions (unless
> there is a particular reason that requires it, of course).

Thanks, certainly no urgency here. In this particular case this isn't
a true revision: the difference between v7 and v6 is the presence of
an additional patch.

> We are in the merge window anyway, so there is no urgency to resend
> since these cannot go in, and you may want to rebase on top of -rc1
> when it gets released so that you can cover most/all cases added by
> then.

While it's true that this won't be picked up for some time (and that's
ok), I wanted to get Benno's eyes on it sooner than later. Is there a
workflow (within the mailing list) for such a case, or do folks go out
of band in this situation?

Thanks!
Tamir
