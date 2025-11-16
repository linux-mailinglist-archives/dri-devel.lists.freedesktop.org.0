Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27758C61469
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 13:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9121710E2B1;
	Sun, 16 Nov 2025 12:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s1LZKMYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A038110E2B1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 12:07:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5607644623
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 12:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E47C4AF10
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763294874;
 bh=iNn0qP/249kJDQzGSS/F/L8+NQ46eWkZ/7Q+EwQ3/5A=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=s1LZKMYFBWgmwDlBidQOMDzou8HKuhiJBwX5bCttfTz+vmA2QLgc2BWFnfY+aIyHR
 TQy2J3PyV3YBuUtIcRB5HdHB8D7Nn1qqyCtHs71WO4rv23mEoLNbrLHHM4XYgqJciH
 wXsbPa/jLB5NC5+LqeyTMQLHzE62s7Fpc+XAKdRRvkEZ9ygL2qIYgXl7VUMINOvh86
 pPHR1HweRSzvpBHW8GD6GnxdTyyENVhJpwiGf0oBs/2ltZr95qnwhKLMqYf/EeY//L
 E4Z7daJTCKOfTqojdr4VoYMfLl27x4eDGRVv0VqmA8o9UvLF6P4TZUSZ2CpHNLZQ0x
 vu98s+cCoyt6w==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-378e8d10494so44259731fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 04:07:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX+a4FulPgzkr2nJy2oKJZkshXPQdcBNM2fS/BGvqQNjSzQ/nCVMOkyfF1COAVNUUa4Q+f7iiBwIf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5A2LCYA3PnXvhA0knUjxX/G+M4Qv+jfst8ulH2/HoYVEyZmXa
 9irzcV6eQj1eASm3bwsWuS+ysv/XGK1lBcpV+xR7uYUSf+TnRvA+ATe6sxs1H6BLvIdY7VacuDi
 lHP1k4QkuHohL+lx/5e0o7ijThuIlpbU=
X-Google-Smtp-Source: AGHT+IEvIN8OBOVj188eKaOm21h0kLrZfEbd8gXOEWO1ViahGfGkiAHVWIOgpRFEEEODq4tccJOhUGpdSt0NBiXPH2A=
X-Received: by 2002:a2e:8a87:0:b0:37b:b00b:7988 with SMTP id
 38308e7fff4ca-37bb00b7bccmr18734591fa.29.1763294871956; Sun, 16 Nov 2025
 04:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251116-pigeon-of-optimal-blizzard-2cb3b3@kuoka>
 <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
 <10753322.nUPlyArG6x@jernej-laptop>
In-Reply-To: <10753322.nUPlyArG6x@jernej-laptop>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 16 Nov 2025 20:07:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65tBHCE7RYPBKKD2j5=rwoH1+pYasNbF5X1=GMSumcHsg@mail.gmail.com>
X-Gm-Features: AWmQ_bnmhrPCrlQnEh24KiJ1VDf4jAXcqEIaG3lMOfIOQYYG1c8ox1KSD4eS4QE
Message-ID: <CAGb2v65tBHCE7RYPBKKD2j5=rwoH1+pYasNbF5X1=GMSumcHsg@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33
 binding
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, samuel@sholland.org,
 mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 16, 2025 at 8:00=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Hi!
>
> Dne nedelja, 16. november 2025 ob 12:33:55 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> > On 16/11/2025 12:33, Krzysztof Kozlowski wrote:
> > > On Sat, Nov 15, 2025 at 03:13:46PM +0100, Jernej Skrabec wrote:
> > >> As it turns out, current H616 DE33 binding was written based on
> > >> incomplete understanding of DE33 design. Namely, planes are shared
> > >> resource and not tied to specific mixer, which was the case for prev=
ious
> > >> generations of Display Engine (DE3 and earlier).
> > >>
> > >> This means that current DE33 binding doesn't properly reflect HW and
> > >> using it would mean that second mixer (used for second display outpu=
t)
> > >> can't be supported.
> > >>
> > >> Update DE33 mixer binding so instead of referencing planes register
> > >> space, it contains phandle to newly introduced DE33 planes node.
> > >>
> > >> There is no user of this binding yet, so changes can be made safely,
> > >> without breaking any backward compatibility.
> > >
> > > And why would you configure statically - per soc - always the same pl=
ane
> > > as per mixer? If you do that, it means it is really fixed and interna=
l
> > > to display engine thus should not be exposed in DT.
>
> Not sure I understand what you mean. H616 SoC has 6 planes which are
> represented with single DE33 planes node (see previous DT binding).
> Driver has to decide initial allocation. For example, 3 planes for each
> mixer. However, nothing prevents to allocate 1 plane to first mixer and
> 5 to other. You can even allocate all 6 planes to one mixer and none to
> the other, if board has only one output enabled.
>
> In any case, plane allocation is runtime decision and has nothing to do
> with DT. Since planes are shared resource, their register space can't be
> assigned to only one mixer.
>
> See [1] for example how this would look like.
>
> > >
> > > Describing each IP block resource in DT is way too granular.
> > >
> >
> > BTW, everything is update, thus subject is really non-informative.
>
> I guess "fix" would be more descriptive.

Or maybe be more specific, like "split out layers register space to
separate binding / node".


ChenYu

> Best regards,
> Jernej
>
> [1] https://github.com/jernejsk/linux-1/blob/d93d56d92db52c7ff228c0532a10=
45de02e0662c/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi#L181-L235
>
>
>
>
