Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72934A63352
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 03:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC1210E0C1;
	Sun, 16 Mar 2025 02:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="K3Mx80VS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E743A10E0C1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 02:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1742091648; x=1742350848;
 bh=KkBO96VC2Ajl9ONruM05l7E3RGo1jmxFIu3LiHOqDxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=K3Mx80VSnZPWn0drq3jeNdrbw4DjDTQ8f4VrtBAJ3PfAjR9jqmAfvdTM6XJ5JdW3j
 M+0+jhfXdk7Bxi0o/6VYStF/hCnPXMvZgM1ORyCoyHVQexdiZAkhDNwvYrvw4dHZBz
 aMHadawZKTcEtI7vEMZuMHSbxWdJxvkBl+QCI0PliIVNASW61kTxYif8GXgHBVrDbe
 jzSAx7WqQNST1c+bkPeqCJtIa4HwykRjcrulHzh7P3lQiFhVTCKCPkn51yxFmZqAGz
 zBM4SazogYEGa0i1Y0PcFvAUnNxKNidoEPLi2fxxidEH/oieES5BxN58PKc0P5TQ/V
 6tiTqk72KOCVg==
Date: Sun, 16 Mar 2025 02:20:44 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Julius Zint <julius@zint.sh>
Subject: Re: [PATCH RFC 2/3] rust: hid: USB Monitor Control Class driver
Message-ID: <87msdlhg2a.fsf@protonmail.com>
In-Reply-To: <CANiq72njsmokSeQG=nzRDUUmYHnpRCGNwWJ1ZXj_khxXwrZxEQ@mail.gmail.com>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
 <20250313160220.6410-5-sergeantsagara@protonmail.com>
 <7ajr2aukrd7bdnns34ur7d37xk4aibaqsjyuoc334uiclay3yt@qiym6ju2kn3c>
 <CANiq72njsmokSeQG=nzRDUUmYHnpRCGNwWJ1ZXj_khxXwrZxEQ@mail.gmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 3b508d8e81a47104014adc6c6acf04d2783efd94
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Fri, 14 Mar, 2025 15:41:02 +0100 "Miguel Ojeda" <miguel.ojeda.sandonis@g=
mail.com> wrote:
> On Thu, Mar 13, 2025 at 5:58=E2=80=AFPM Benjamin Tissoires <bentiss@kerne=
l.org> wrote:
>>
>> skeletons are good for documentation, but not really for code review as
>> they can not compile.
>>
>> You should make this patch part of a documentation in
>> Documentation/hid/, and squash it with the next one (having a minimal
>> full driver instead of skeleton+fill in the voids).
>
> It could be part of the documentation of the `module_hid_driver!` for
> instance, like we have done for other of those macros.
>
> (In general, we try to use `Documentation/` for things that do not fit
> as documentation for any of the code "items".)
>
> Cheers,
> Miguel

In general, I will add a lot more documentation in my next revision. For
example, I have a bunch of unsafe usage right now without any SAFETY
comments.

Thanks for the review,
Rahul Rameshbabu

