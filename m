Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E0EB56245
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 18:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9EA10E15D;
	Sat, 13 Sep 2025 16:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="ERxBgOrC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4958D10E15D
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1757782652; x=1758041852;
 bh=VRyCCFGTy4GGFNWO81YA+MF/hD5hOxRGRAxn1FFoDWs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ERxBgOrCkNtF+YJOAT1GgAMtvhHYiMGPY8yAKodLNzB/XoAS+acYd2eMQrlZA0Sss
 rbgZqboTimn/WpYhh5TkGuRFZqUhDn7DshnUvRYmF+R0F19Dzm0bm06cnOuTHjaip1
 STwrVSZEklD6HHERNAZuQOXpk5cPhsaB6wtbHsY1c96bUSbxJNrBOfYykAM97jP266
 KqJUDN4c40kaQjkAhHmljWro8WmVw3F7nGGhQakzvXZkWQzxho8AKB2la8LZRM98sl
 78Sre47ryEmsUxNn1WMS26CMHy1QOS36KS9GhkLh4sjvEafcGaaPdPYfOumd8tIxGH
 /dfUn/ddN17+Q==
Date: Sat, 13 Sep 2025 16:57:26 +0000
To: Maxime Ripard <mripard@kernel.org>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
Message-ID: <87plbus32o.fsf@protonmail.com>
In-Reply-To: <20250827-cherubic-tapir-of-wind-5cf0c4@houat>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
 <g5n4vx5hkreacrtjrbzsefnctvki6d7oh7qyjrb6wtqvzp7adl@rzmxiyblpnsz>
 <87ect61txs.fsf@protonmail.com>
 <20250827-cherubic-tapir-of-wind-5cf0c4@houat>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: d6976cf9619b1bafd78468ee96fbcca38d5dfb00
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

On Wed, 27 Aug, 2025 08:57:58 +0200 "Maxime Ripard" <mripard@kernel.org> wr=
ote:
> Hi Rahul,
>
> On Wed, Aug 20, 2025 at 04:46:52AM +0000, Rahul Rameshbabu wrote:
>> On Tue, 19 Aug, 2025 11:06:40 +0200 "Maxime Ripard" <mripard@kernel.org>=
 wrote:
>> > Hi Rahul,
>> >
>> > On Mon, Aug 18, 2025 at 05:04:15AM +0000, Rahul Rameshbabu wrote:
>> >> I am working on a drm_connector scoped backlight API in Rust. I have =
been
>> >> looking through Hans de Goede's previous efforts on this topic to hel=
p
>> >> guide my design. My hope is to enable backlight control over external
>> >> displays through DDC or USB Monitor Control Class while also supporti=
ng
>> >> internal panels. In parallel, I would like to improve the driver
>> >> probing/selection mechanism when there are different candidates for d=
riving
>> >> a backlight device. This initial RFC is mainly intended to sanity che=
ck
>> >> that the plumbing I have chosen for extending the DRM connector
>> >> functionality in Rust seems reasonable.
>> >
>> > It's a great goal, and I had that same discussion with Hans recently
>> > too, but I can't find the link between backling/DDC CI, and Rust. Can
>> > you elaborate?
>>=20
>> Hi Maxime,
>>=20
>> Sure, let me elaborate on this. You are right that plumbing DDC
>> CI/backlight support at the DRM connector level does not need to be
>> implemented in Rust.
>>=20
>> If we look at Hans's proposal, the suggested phase 2 was to add a
>> drm_connector helper function for plumbing a pointer to the backlight
>> device implementation. I had some model differences with regards to how
>> the API would look like, mostly stemming from concerns about providing
>> better runtime overriding of the acpi_video_get_backlight_type based
>> backlight selection. However, I am aligned with the direction of scoping
>> at the drm_connector level. I basically was interested in implementing
>> this helper functionality in Rust instead of C, which is where Rust came
>> into play.
>>=20
>> I was also interested in declaring and attaching a drm_property in Rust
>> for controlling properties such as backlight rather than updating the
>> drm_connector declaration in C as an experiment.
>>=20
>> Let me know if you feel like this work would be better off as a C
>> implementation. I can also send out a detailed architecture proposal to
>> the mailing list if that would help.
>>=20
>> Link: https://lore.freedesktop.org/wayland-devel/0d188965-d809-81b5-74ce=
-7d30c49fee2d@redhat.com/
>
> Thanks for the explanation.
>
> I'm not sure Rust is at the point where we can use it for the framework.
> If we want to make this work useful, we have to make it consistent and
> usable across all drivers, but we do have drivers for architectures that
> aren't supported by Rust yet (let alone tier 1).
>
> So it feels to me that it would be a bit premature for that work to be
> in Rust. If you do want to use it from a Rust driver though, feel free
> to write bindings for it, that would be a great addition.

Hi Maxime,

Thanks for the follow-up. Sorry for the delay in my response. I was
preparing a slide deck for Kangrejos 2025 (Rust for Linux conference).

https://binary-eater.github.io/kangrejos-2025/

The above discusses the architecture I had in mind in greater detail. I
am working on some last minute tweaks. I wanted to do a couple things
with regards to this topic.

1. Send a high level RFC describing the architecture / functionality
2. In parallel, maybe further evaluate whether Rust could be viable for
   this effort. I hope the slides I put together help.
3. If the discussion in point 2 seems to suggest that Rust is not
   viable, do the core implementation work in C.

Let me know if this seems like a reasonable approach and thank you so
much for taking the time to respond.

Thanks,
Rahul Rameshbabu

>
> Maxime

