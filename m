Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E6089332B
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 18:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3D610ED51;
	Sun, 31 Mar 2024 16:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PZ9D70uV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 479 seconds by postgrey-1.36 at gabe;
 Sun, 31 Mar 2024 16:36:37 UTC
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE6010ED50
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 16:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 8E17A208DC;
 Sun, 31 Mar 2024 18:28:37 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdgYfLKVeVlx; Sun, 31 Mar 2024 18:28:37 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id AB5F1208E0;
 Sun, 31 Mar 2024 18:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com AB5F1208E0
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout2.secunet.com (Postfix) with ESMTP id 9D894800059;
 Sun, 31 Mar 2024 18:28:31 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:28:31 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:23:59 +0000
X-sender: <netdev+bounces-83536-peter.schumann=secunet.com@vger.kernel.org>
X-Receiver: <peter.schumann@secunet.com>
 ORCPT=rfc822;peter.schumann@secunet.com NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAJ05ab4WgQhHsqdZ7WUjHykPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGAAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249UGV0ZXIgU2NodW1hbm41ZTcFAAsAFwC+AAAAQ5IZ35DtBUiRVnd98bETxENOPURCNCxDTj1EYXRhYmFzZXMsQ049RXhjaGFuZ2UgQWRtaW5pc3RyYXRpdmUgR3JvdXAgKEZZRElCT0hGMjNTUERMVCksQ049QWRtaW5pc3RyYXRpdmUgR3JvdXBzLENOPXNlY3VuZXQsQ049TWljcm9zb2Z0IEV4Y2hhbmdlLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUADgARAC7JU/le071Fhs0mWv1VtVsFAB0ADwAMAAAAbWJ4LWVzc2VuLTAxBQA8AAIAAA8ANgAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5EaXNwbGF5TmFtZQ8ADwAAAFNjaHVtYW5uLCBQZXRlcgUADAACAAAFAGwAAgAABQBYABcASAAAAJ05ab4WgQhHsqdZ7WUjHylDTj1TY2h1bWFubiBQZXRlcixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc
 2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAwapAQuxQ3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAGIACgBnAAAAqIoAAAUABAAUIAEAAAAaAAAAcGV0ZXIuc2NodW1hbm5Ac2VjdW5ldC5jb20FAAYAAgABBQApAAIAAQ8ACQAAAENJQXVkaXRlZAIAAQUAAgAHAAEAAAAFAAMABwAAAAAABQAFAAIAAQUAZAAPAAMAAABIdWI=
X-Source: SMTP:Default MBX-DRESDEN-01
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 15383
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=147.75.48.161; helo=sy.mirrors.kernel.org;
 envelope-from=netdev+bounces-83536-peter.schumann=secunet.com@vger.kernel.org;
 receiver=peter.schumann@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com 226AE20199
Authentication-Results: b.mx.secunet.com;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PZ9D70uV"
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PZ9D70uV"
X-Original-To: netdev@vger.kernel.org
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=10.30.226.201
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1711852445; cv=none;
 b=Pj9ztFoeNFC8W8Bmk7O2Z5NF1FqYCQSQXvXHwYXp92impW8yqIqXKztodGBRpXQU5wfGBPjF30T0jKjGp+dRMIVrE9+rHt+E/sK11cG0ccYiCxhujgs6p0ewfBT+tyH81Ba1BpjFwcgtUyVZk4Fx9c+IJDc8Pbb3UqAFDp4kjvQ=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1711852445; c=relaxed/simple;
 bh=+9xtEveTESmqEmgqfqi/AHy+l/CY7o7HoCu99ORDDcA=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=PCxe4cBbfRJV3gpTvYKFbbR/6Oo8CmYNpvDoIAdyEoT+Fst6iaUXtghvq3ijq3w1+V6jl8iuUhxs26iFUlXrzTxzkigqaTs5dnoEnR/bLxwsiIwpFFcP1wwql0Rd0L+n+/bc3NcLBp7LSIEUyTq3KbDcKWe4NXrWGbBy3k5Tsu0=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=kernel.org
 header.i=@kernel.org header.b=PZ9D70uV; arc=none smtp.client-ip=10.30.226.201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711852444;
 bh=+9xtEveTESmqEmgqfqi/AHy+l/CY7o7HoCu99ORDDcA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PZ9D70uVOm8Q1eV7TepfO1FkN+1k1kWNkT6Ku6f/2s6iTAOV7tZxn2zhkvPsVyaFX
 RPw7j/3dyOXbWPTqh7GDBBmESHoa0/CSjp3BgTh7gbx5KJ1tdiDym07g+AY4FzPgQS
 DKX7tgoR9K9mHdV/+tGZPsttPaEAScJJhqA81HNprVN9Fu9EJ0XTEzkGTvbaVJb6Hx
 Qzks5PLB5vorWVg53klblNq3phtjvnvFZqLRpBY/lb0TuCBuxS4GgeeCTYGb+VI6ok
 zfc1qtwfOHsXCTucSL4Xb61hPPubFgtHkxN2eCV1J182QybCpwgfTt0/4sSb25g/FL
 PUk6ZaAAFbN5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDkGXqULJb0iTE30zok3Z/DcAitzYB9HUyf5pQ/qSbH7TnoDghRS696d3Z3Bc7u3vJtKOCIyp0hkqFnVKFWXLHRnz0A8czvwM7M2KtNDkdHOpr2c074bO9nltfNZLNpXSwZIksKCLZNGtZiA0bHX646SeY+kLLS+WUzjnVm4MKEuoM
X-Gm-Message-State: AOJu0YzWfQ4zDI0K2CTviHTVM/YUaXaFBBv4MmJVL07IxX6zt/sEhULv
 8wYbpd4A6ohvhE1X1s1afNGS2g9DPx2m3V/0v8z3Oa7dpCwciQaRAnkxDrAd98WqSrH+OiQMNXB
 qPMEzBdnsGuo/e1Si+icML8zVNFY=
X-Google-Smtp-Source: AGHT+IGpEQPL0v7g3+p+5E8g7HGnWQKzlMop6CryhqCRVmhK61t313PDdp5vf1ukKDWFXpyLX2tmge1Ix/vKXAwQ4u4=
X-Received: by 2002:a2e:9914:0:b0:2d4:6aba:f1a9 with SMTP id
 v20-20020a2e9914000000b002d46abaf1a9mr4254960lji.40.1711852443253; Sat, 30
 Mar 2024 19:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
MIME-Version: 1.0
References: <20240326144741.3094687-1-arnd@kernel.org>
 <20240326144741.3094687-2-arnd@kernel.org>
 <87jzlohhbc.fsf@intel.com>
 <cb853762-06d4-401c-a1c8-07a0c031b499@app.fastmail.com>
 <87edbwglle.fsf@intel.com>
 <07c604d1-6304-4ff8-844b-03c3d5c727ad@app.fastmail.com>
In-Reply-To: <07c604d1-6304-4ff8-844b-03c3d5c727ad@app.fastmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 31 Mar 2024 11:33:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmABUDDTFtp_HCqKid7=8011wk0HMgHYGHWOLunhpxXA@mail.gmail.com>
Message-ID: <CAK7LNARmABUDDTFtp_HCqKid7=8011wk0HMgHYGHWOLunhpxXA@mail.gmail.com>
Subject: Re: [PATCH 01/12] kbuild: make -Woverride-init warnings more
 consistent
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>,
 linux-kbuild@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Joel Stanley <joel@jms.id.au>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On Wed, Mar 27, 2024 at 6:23=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Mar 27, 2024, at 08:50, Jani Nikula wrote:
> > On Tue, 26 Mar 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> >> On Tue, Mar 26, 2024, at 21:24, Jani Nikula wrote:
> >>> On Tue, 26 Mar 2024, Arnd Bergmann <arnd@kernel.org> wrote:
> >>
> >> It works now.
> >>
> >> The original __diag_ignore_all() only did it for gcc-8 and above
> >> because that was initially needed to suppress warnings that
> >> got added in that version, but this was always a mistake.
> >>
> >> 689b097a06ba ("compiler-gcc: Suppress -Wmissing-prototypes
> >> warning for all supported GCC") made it work correctly.
> >
> > Oh, nice! Then I think we'd like to go back to __diag_ignore_all() in
> > i915 and xe.
> >
> > The diff is below. I'm fine with you squashing it to your patch, or if
> > you want me to turn it into a proper patch for you to pick up in your
> > series, that's fine too. Just let me know.
>
> I think I'd prefer to keep my patch simpler for the moment and
> get that merged through the kbuild tree, it already touches
> too many places at once.
>
> It may be better for me to just drop the drivers/gpu/ part of
> my patch so you can just just take your patch through the
> drm tree. I actually have a similar patch for the amdgpu driver
> that I can send if you like this option better.
>
>     Arnd
>



Applied to linux-kbuild/fixes.
Thanks.

--=20
Best Regards
Masahiro Yamada

