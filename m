Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802C0A9703F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238EA10E5F7;
	Tue, 22 Apr 2025 15:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lWKLrZDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1B110E5F7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:15:29 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b07698318ebso357267a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 08:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745334929; x=1745939729; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZKF9nOH8sEPJErHTOsvwYFx9dUfb3L1BJmkI6VuiUo=;
 b=lWKLrZDKa+Oc71sw9zGO5Gsm+Es/hJiMx8LIhbVdsod0AVZqTjb5AVva3UpJUgnMdm
 uzYW/39kj4i0TvgmSptpGkFYrdlHnfO5DTYmZxnMkyGmpy96sExrK0rn6J2AKEkceB8f
 WstPrvKu2Dd5MxJJN1BF5c/xCEJ5zaNKYyUPDaTip2m1avH3XPMrHX/j+dsFHhdVVDp5
 MEOj60pmbNjCAPeJ949SxMlEDOCr32uAtPqC8bshu3Q1qNZWbCv/u4S87GEagv9X3+z/
 ck3SZDjm7+8MZGmkTjeERvG5wCPrLKq9Sgvlu4op2eAFfy2XIOLkS+j7rC6u0YEInpNG
 YuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745334929; x=1745939729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZKF9nOH8sEPJErHTOsvwYFx9dUfb3L1BJmkI6VuiUo=;
 b=BE8pYJ1MHNmGVWPlGV3Ca4gnClPyM/hXtT+ipB5vxlXune9ueYlpx4ZhnhQTyqNT2K
 VC5qBQN5LXgVuhyPO1Mw9IMQSPswAAjZVpM5hj0YmKdHooWBU3tOECavPrjrwfGXXE6U
 yz7gJwv+NfQmMH24HV5hiIN9kb3O91ozjvsYV1qbwL43E34qTy5r2gBjb1ui3kiN7h7x
 GmplIYGA3m0Gl94l6Wyb68N6XRZxuYsiIlO0eSamkeI5xn7YOrdzxWGr5LSJSDzwtlqQ
 MZhWnPPiA/BaDn3TRspfv580dvnJrl4wN+OpY0BS3Unq9tVjeslU5xQip6cZP7yTYdNL
 kqDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9pCeLAYIU0o56nea0QgMpmOu3Qw//HX9Z0hzh0dp00dQUP+bV2hVF6wA75RgIPY0sjQyu6wX2svQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1EbckDFEJoamQ1X2rhIRfm6xWtLA4kgzMaHmGBTJGD1esfY66
 AlJsxZ90dYq4dvMMWXQpRNm3O7uO2M2lGLRAQw7KCcXgHJEE5ftMDHNaASF6n8LTM+lUT9rXsJk
 PF8Di8yfY429OUy2BffgwDY9J6Y0=
X-Gm-Gg: ASbGncs465zX91sUub0yeqkdoecvtSPglEoNRUMAaOJfjKAqsAwQ6D6H2xbn5uggOIs
 jB/dxGs6pJIb7aJlGe2j4KFaaoL4jcXb4FTPRj0WyjGEJY1wMz1pH9ZtkyYz5iEsVviw1GD5IG9
 oMjZahk1CbqUN1Og19ueJ60g==
X-Google-Smtp-Source: AGHT+IEuT6KxYsdhSw5cCeMrUaqYdXW9YE/wChmli/G+cfCYNzLRiA7m7gmwaKew+OoBnqvuuEbFo8HJGHR2tvaOM7M=
X-Received: by 2002:a17:90b:3501:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3087bde06ddmr9204562a91.5.1745334929331; Tue, 22 Apr 2025
 08:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-4-18ec29b1b1f3@gmail.com>
 <68014084.0c0a0220.394e75.122c@mx.google.com>
 <CAJ-ks9muaNU9v2LZ5=cmfXV6R5AO+joNOoPP=+hs-GJN=APfKQ@mail.gmail.com>
 <680160b8.050a0220.223d09.180f@mx.google.com>
 <CAJ-ks9=TXjk8W18ZMG4mx0JpYvXr4nwnUJqjCnqvW9zu2Y1xjA@mail.gmail.com>
 <aAJrOV88S-4Qb5o0@Mac.home>
In-Reply-To: <aAJrOV88S-4Qb5o0@Mac.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 22 Apr 2025 17:15:16 +0200
X-Gm-Features: ATxdqUEzkXpfnBhiY7k29QsDY3HizJvfa3BhU5YB5Skka6eAvbENy4JVzwfqVy4
Message-ID: <CANiq72meaJr5noasX+4p7r5BM1H4tCa33eLrsta00Vpk-cF7VQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/6] rust: enable `clippy::as_underscore` lint
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
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

On Fri, Apr 18, 2025 at 5:09=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> I'm leaning towards to 2 and then 3, because using `as` can sometimes
> surprise you when you change the type. Thoughts?

Having explicit functions sounds good to me, and would also help
migrating later easily to anything else (because all cases are
explicitly tagged and easy to grep for).

Cheers,
Miguel
