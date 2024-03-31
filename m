Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FBD893390
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 18:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFAB10EACE;
	Sun, 31 Mar 2024 16:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PZ9D70uV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB97410EACE
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 16:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 7D1A1208CF;
 Sun, 31 Mar 2024 18:43:49 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8B0iyqHsjZA; Sun, 31 Mar 2024 18:43:46 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 4E98D208CE;
 Sun, 31 Mar 2024 18:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 4E98D208CE
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout1.secunet.com (Postfix) with ESMTP id 404DA800061;
 Sun, 31 Mar 2024 18:43:45 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:43:45 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:36:27 +0000
X-sender: <netdev+bounces-83536-steffen.klassert=secunet.com@vger.kernel.org>
X-Receiver: <steffen.klassert@secunet.com>
 ORCPT=rfc822;steffen.klassert@secunet.com NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAPDFCS25BAlDktII2g02frgPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGIAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249U3RlZmZlbiBLbGFzc2VydDY4YwUACwAXAL4AAACheZxkHSGBRqAcAp3ukbifQ049REI2LENOPURhdGFiYXNlcyxDTj1FeGNoYW5nZSBBZG1pbmlzdHJhdGl2ZSBHcm91cCAoRllESUJPSEYyM1NQRExUKSxDTj1BZG1pbmlzdHJhdGl2ZSBHcm91cHMsQ049c2VjdW5ldCxDTj1NaWNyb3NvZnQgRXhjaGFuZ2UsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1zZWN1bmV0LERDPWRlBQAOABEABiAS9uuMOkqzwmEZDvWNNQUAHQAPAAwAAABtYngtZXNzZW4tMDIFADwAAgAADwA2AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50LkRpc3BsYXlOYW1lDwARAAAAS2xhc3NlcnQsIFN0ZWZmZW4FAAwAAgAABQBsAAIAAAUAWAAXAEoAAADwxQktuQQJQ5LSCNoNNn64Q049S2xhc3NlcnQgU3RlZmZlbixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9ye
 TogRmFsc2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: a.mx.secunet.com
X-ExtendedProps: BQBjAAoAJWsFfe5Q3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAHAAAAHN0ZWZmZW4ua2xhc3NlcnRAc2VjdW5ldC5jb20FAAYAAgABBQApAAIAAQ8ACQAAAENJQXVkaXRlZAIAAQUAAgAHAAEAAAAFAAMABwAAAAAABQAFAAIAAQUAYgAKAF0AAADpigAABQBkAA8AAwAAAEh1Yg==
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.36
X-EndOfInjectedXHeaders: 15161
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=147.75.199.223; helo=ny.mirrors.kernel.org;
 envelope-from=netdev+bounces-83536-steffen.klassert=secunet.com@vger.kernel.org;
 receiver=steffen.klassert@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 75874207FD
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

X-sender: <linux-kernel+bounces-125929-steffen.klassert=3Dcunet.com@vger.ke=
rnel.org>
X-Receiver: <steffen.klassert@secunet.com> ORCPT=3Dc822;steffen.klassert@se=
cunet.com NOTIFY=3DVER; X-ExtendedProps=3DAVABYAAgAAAAUAFAARAPDFCS25BAlDktI=
I2g02frgPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSX=
NSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAA=
AUAEgAPAGIAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChG=
WURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249U3RlZmZlbiBLbGFzc2VydDY4YwUACwA=
XAL4AAACheZxkHSGBRqAcAp3ukbifQ049REI2LENOPURhdGFiYXNlcyxDTj1FeGNoYW5nZSBBZG=
1pbmlzdHJhdGl2ZSBHcm91cCAoRllESUJPSEYyM1NQRExUKSxDTj1BZG1pbmlzdHJhdGl2ZSBHc=
m91cHMsQ049c2VjdW5ldCxDTj1NaWNyb3NvZnQgRXhjaGFuZ2UsQ049U2VydmljZXMsQ049Q29u=
ZmlndXJhdGlvbixEQz1zZWN1bmV0LERDPWRlBQAOABEABiAS9uuMOkqzwmEZDvWNNQUAHQAPAAw=
AAABtYngtZXNzZW4tMDIFADwAAgAADwA2AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC=
5NYWlsUmVjaXBpZW50LkRpc3BsYXlOYW1lDwARAAAAS2xhc3NlcnQsIFN0ZWZmZW4FAAwAAgAAB=
QBsAAIAAAUAWAAXAEoAAADwxQktuQQJQ5LSCNoNNn64Q049S2xhc3NlcnQgU3RlZmZlbixPVT1V=
c2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1J=
lc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc2UNCg8ALwAAAE1pY3Jvc2=
9mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb=
3VwRXhwYW5zaW9uBQAjAAIAAQ=3D=0A=
X-CreatedBy: MSExchange15
X-HeloDomain: a.mx.secunet.com
X-ExtendedProps: BQBjAAoAJWsFfe5Q3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc2=
9mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAA=
AAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAHAAAAHN0ZWZmZW4ua2xhc3NlcnRAc2Vj=
dW5ldC5jb20FAAYAAgABBQApAAIAAQ8ACQAAAENJQXVkaXRlZAIAAQUAAgAHAAEAAAAFAAMABwA=
AAAAABQAFAAIAAQUAYgAKAF4AAADpigAABQBkAA8AAwAAAEh1Yg=3D=0A=
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.36
X-EndOfInjectedXHeaders: 15141
Received: from cas-essen-01.secunet.de (10.53.40.201) by
 mbx-essen-02.secunet.de (10.53.40.198) with Microsoft SMTP Server
 (version=3DS1_2, cipher=3DS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sun, 31 Mar 2024 04:34:25 +0200
Received: from a.mx.secunet.com (62.96.220.36) by cas-essen-01.secunet.de
 (10.53.40.201) with Microsoft SMTP Server (version=3DS1_2,
 cipher=3DS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Sun, 31 Mar 2024 04:34:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 6D21320892
	for <steffen.klassert@secunet.com>; Sun, 31 Mar 2024 04:34:25 +0200 (CEST)
X-Virus-Scanned: by secunet
X-Spam-Flag: NO
X-Spam-Score: -1.2
X-Spam-Level:
X-Spam-Status: No, score=3D.2 tagged_above=3D99 required=3D1
	tests=3DKIMWL_WL_HIGH=3D.1, DKIM_SIGNED=3D1, DKIM_VALID=3D.1,
	DKIM_VALID_AU=3D.1, MAILING_LIST_MULTI=3D, RCVD_IN_DNSWL_NONE=3D.0001,
	SPF_HELO_NONE=3D001, SPF_PASS=3D.001]
	autolearn=3Davailable autolearn_force=3D
Authentication-Results: a.mx.secunet.com (amavisd-new);
	dkim=3Dss (2048-bit key) header.d=3Drnel.org
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymmiznFv0woJ for <steffen.klassert@secunet.com>;
	Sun, 31 Mar 2024 04:34:25 +0200 (CEST)
Received-SPF: Pass (sender SPF authorized) identity=3Dilfrom; client-ip=147=
.75.80.249; helo=3D.mirrors.kernel.org; envelope-from=3Dnux-kernel+bounces-=
125929-steffen.klassert=3Dcunet.com@vger.kernel.org; receiver=3Deffen.klass=
ert@secunet.com=20
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com E4C94207FD
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249]=
)
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id E4C94207FD
	for <steffen.klassert@secunet.com>; Sun, 31 Mar 2024 04:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.2=
5.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C02B1F218D2
	for <steffen.klassert@secunet.com>; Sun, 31 Mar 2024 02:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB2C4416;
	Sun, 31 Mar 2024 02:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=3Dss (2048-bit key) header.d=3Drnel.org header.i=3Dernel.org header.b=
=3DZ9D70uV"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.or=
g [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA3D184E;
	Sun, 31 Mar 2024 02:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=3Dne smtp.client-ip=
=10.30.226.201
ARC-Seal: i=3D a=3Da-sha256; d=3Dbspace.kernel.org; s=3Dc-20240116;
	t=1711852445; cv=3Dne; b=3D9ztFoeNFC8W8Bmk7O2Z5NF1FqYCQSQXvXHwYXp92impW8yq=
IqXKztodGBRpXQU5wfGBPjF30T0jKjGp+dRMIVrE9+rHt+E/sK11cG0ccYiCxhujgs6p0ewfBT+=
tyH81Ba1BpjFwcgtUyVZk4Fx9c+IJDc8Pbb3UqAFDp4kjvQARC-Message-Signature: i=3D =
a=3Da-sha256; d=3Dbspace.kernel.org;
	s=3Dc-20240116; t=1711852445; c=3Dlaxed/simple;
	bh=3DxtEveTESmqEmgqfqi/AHy+l/CY7o7HoCu99ORDDcA=3D=0A=
	h=3DME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=3Dxe4cBbfRJV3gpTvYKFbbR/6Oo8CmYNpvDoIAdyEoT+Fst6iaU=
Xtghvq3ijq3w1+V6jl8iuUhxs26iFUlXrzTxzkigqaTs5dnoEnR/bLxwsiIwpFFcP1wwql0Rd0L=
+n+/bc3NcLBp7LSIEUyTq3KbDcKWe4NXrWGbBy3k5Tsu0ARC-Authentication-Results: i=
=3D smtp.subspace.kernel.org; dkim=3Dss (2048-bit key) header.d=3Drnel.org =
header.i=3Dernel.org header.b=3D9D70uV; arc=3Dne smtp.client-ip=10.30.226.2=
01
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71FCC433B2;
	Sun, 31 Mar 2024 02:34:04 +0000 (UTC)
DKIM-Signature: v=3D a=3Da-sha256; c=3Dlaxed/simple; d=3Drnel.org;
	s=3D0201202; t=1711852444;
	bh=3DxtEveTESmqEmgqfqi/AHy+l/CY7o7HoCu99ORDDcA=3D=0A=
	h=3Dferences:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=3D9D70uVOm8Q1eV7TepfO1FkN+1k1kWNkT6Ku6f/2s6iTAOV7tZxn2zhkvPsVyaFX
	 RPw7j/3dyOXbWPTqh7GDBBmESHoa0/CSjp3BgTh7gbx5KJ1tdiDym07g+AY4FzPgQS
	 DKX7tgoR9K9mHdV/+tGZPsttPaEAScJJhqA81HNprVN9Fu9EJ0XTEzkGTvbaVJb6Hx
	 Qzks5PLB5vorWVg53klblNq3phtjvnvFZqLRpBY/lb0TuCBuxS4GgeeCTYGb+VI6ok
	 zfc1qtwfOHsXCTucSL4Xb61hPPubFgtHkxN2eCV1J182QybCpwgfTt0/4sSb25g/FL
	 PUk6ZaAAFbN5g=3D=0A=
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513d23be0b6=
so3396180e87.0;
        Sat, 30 Mar 2024 19:34:04 -0700 (PDT)
X-Forwarded-Encrypted: i=3D AJvYcCVDkGXqULJb0iTE30zok3Z/DcAitzYB9HUyf5pQ/qS=
bH7TnoDghRS696d3Z3Bc7u3vJtKOCIyp0hkqFnVKFWXLHRnz0A8czvwM7M2KtNDkdHOpr2c074b=
O9nltfNZLNpXSwZIksKCLZNGtZiA0bHX646SeY+kLLS+WUzjnVm4MKEuoM
X-Gm-Message-State: AOJu0YzWfQ4zDI0K2CTviHTVM/YUaXaFBBv4MmJVL07IxX6zt/sEhUL=
v
	8wYbpd4A6ohvhE1X1s1afNGS2g9DPx2m3V/0v8z3Oa7dpCwciQaRAnkxDrAd98WqSrH+OiQMNX=
B
	qPMEzBdnsGuo/e1Si+icML8zVNFYX-Google-Smtp-Source: AGHT+IGpEQPL0v7g3+p+5E8g=
7HGnWQKzlMop6CryhqCRVmhK61t313PDdp5vf1ukKDWFXpyLX2tmge1Ix/vKXAwQ4u4X-Receiv=
ed: by 2002:a2e:9914:0:b0:2d4:6aba:f1a9 with SMTP id
 v20-20020a2e9914000000b002d46abaf1a9mr4254960lji.40.1711852443253; Sat, 30
 Mar 2024 19:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326144741.3094687-1-arnd@kernel.org> <20240326144741.3094=
687-2-arnd@kernel.org>
 <87jzlohhbc.fsf@intel.com> <cb853762-06d4-401c-a1c8-07a0c031b499@app.fastm=
ail.com>
 <87edbwglle.fsf@intel.com> <07c604d1-6304-4ff8-844b-03c3d5c727ad@app.fastm=
ail.com>
In-Reply-To: <07c604d1-6304-4ff8-844b-03c3d5c727ad@app.fastmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 31 Mar 2024 11:33:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmABUDDTFtp_HCqKid7=8011wk0HMgHYGHWOLu=
nhpxXA@mail.gmail.com>
Message-ID: <CAK7LNARmABUDDTFtp_HCqKid7=8011wk0HMgHYGHWOLunhpxXA@mail.gmail=
.com>
Subject: Re: [PATCH 01/12] kbuild: make -Woverride-init warnings more consi=
stent
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@kernel.o=
rg>,=20
	linux-kbuild@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,=20
	Alex Deucher <alexander.deucher@amd.com>, =3DTF-8?Q?Christian_K=C3=B6nig?=
=3Dhristian.koenig@amd.com>,=20
	Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.or=
g>,=20
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mrip=
ard@kernel.org>,=20
	Thomas Zimmermann <tzimmermann@suse.de>, Jakub Kicinski <kuba@kernel.org>,=
 Paolo Abeni <pabeni@redhat.com>,=20
	Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij=
@linaro.org>,=20
	Joel Stanley <joel@jms.id.au>, Alexei Starovoitov <ast@kernel.org>, Daniel=
 Borkmann <daniel@iogearbox.net>,=20
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kerne=
l.org>,=20
	Nicolas Schier <nicolas@fjasle.eu>, dri-devel@lists.freedesktop.org,=20
	linux-kernel@vger.kernel.org, Netdev <netdev@vger.kernel.org>, linux-mm@kv=
ack.org,=20
	llvm@lists.linux.dev
Content-Type: text/plain; charset=3DTF-8"
Content-Transfer-Encoding: quoted-printable
Return-Path: linux-kernel+bounces-125929-steffen.klassert=3Dcunet.com@vger.=
kernel.org
X-MS-Exchange-Organization-OriginalArrivalTime: 31 Mar 2024 02:34:25.4166
 (UTC)
X-MS-Exchange-Organization-Network-Message-Id: 95989cb8-1654-4156-ee8e-08dc=
512b14cc
X-MS-Exchange-Organization-OriginalClientIPAddress: 62.96.220.36
X-MS-Exchange-Organization-OriginalServerIPAddress: 10.53.40.201
X-MS-Exchange-Organization-Cross-Premises-Headers-Processed: cas-essen-01.s=
ecunet.de
X-MS-Exchange-Organization-OrderedPrecisionLatencyInProgress: LSRV=3Dx-esse=
n-02.secunet.de:TOTAL-HUB=3D408|SMR=3D329(SMRDE=3D004|SMRC=3D324(SMRCL=3D10=
2|X-SMRCR=3D322))|CAT=3D078(CATOS=3D001
 |CATRESL=3D028(CATRESLP2R=3D022)|CATORES=3D046(CATRS=3D046(CATRS-Transport
 Rule Agent=3D001 |CATRS-Index Routing Agent=3D044)));2024-03-31T02:34:25.9=
41Z
X-MS-Exchange-Forest-ArrivalHubServer: mbx-essen-02.secunet.de
X-MS-Exchange-Organization-AuthSource: cas-essen-01.secunet.de
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Exchange-Organization-FromEntityHeader: Internet
X-MS-Exchange-Organization-OriginalSize: 9587
X-MS-Exchange-Organization-HygienePolicy: Standard
X-MS-Exchange-Organization-MessageLatency: SRV=CAs-essen-01.secunet.de:TOTA=
L-FE=3D117|SMR=3D022(SMRPI=3D020(SMRPI-FrontendProxyAgent=3D019))|SMS=3D094
X-MS-Exchange-Organization-Recipient-Limit-Verified: True
X-MS-Exchange-Organization-TotalRecipientCount: 1
X-MS-Exchange-Organization-Rules-Execution-History: 0b0cf904-14ac-4724-8bdf=
-482ee6223cf2%%%fd34672d-751c-45ae-a963-ed177fcabe23%%%d8080257-b0c3-47b4-b=
0db-23bc0c8ddb3c%%%95e591a2-5d7d-4afa-b1d0-7573d6c0a5d9%%%f7d0f6bc-4dcc-487=
6-8c5d-b3d6ddbb3d55%%%16355082-c50b-4214-9c7d-d39575f9f79b
X-MS-Exchange-Forest-RulesExecuted: mbx-essen-02
X-MS-Exchange-Organization-RulesExecuted: mbx-essen-02
X-MS-Exchange-Forest-IndexAgent-0: AQ0CZW4AAX0EAAAPAAADH4sIAAAAAAAEAI1UTW8b=
NxClvmXZjuEGuU
 99cQJItuM0TmIURpMcCgdwW7QGgp4Mapdasdolt1xuFN36j/p7eu0v
 6eNwJduADVQiVlxy5r03b0j9s/2zoc8qHdOVdHT6ZkynJ6ffkfR0dn
 766t+//v7lit47k9IH5bJCGkPfS7z+EB7To1Rd0NJZr853RxcY9BDY
 OKCdvD1/fTKmT9Jo+kkv6lzeJhLnXdcK8WcxldMO7hEfPM5MF7cInH
 52h/n05XmYPcJ88Qj3QzUvlDMqP7Iuu8/dKLj0tLRuUZGxy6N7O9dz
 RdbpTBuZ081NqmV2ozNjnbqRef78BVmTryjVKWlPM+soS5LJW5KQIK
 f2i2pgpiqRdaXIz1HWUlakjfYaCCsySqUqJW+pqsvSqapCgDPaZBWH
 NwiZ9STTEKlNhPmiXKWtGdO09ljRFQPLfClX+KFCV14u1P1yzt6+m5
 68eyNPzqaSnh8ktih1rtwEqs/ptzX/5DOSKyiYlPDK+lWpqgagkcal
 Qj5rts5D1o8fPx68oEKmKlgR7KTEOqcSn6+iiOa8zMdkdKK+Dd4aug
 zSzYKW6jClXC9UcCKzNJXJIkwf8lybCKXfvXzNVn9VdxlCz1I9mxEs
 maocLaXLw4Jm2ihaaj+nla2p+rOW1TyUArXgwZqjUvoE8lCbnkWsEL
 qUxlPBwnztTEjQBi+SYE+pmjS2JIRjp9QQX5ehVQE3QlXKaVWNuXmH
 VZTjrT2iT3XlKVfMsWhOYEhZW3MJZ9CYGZiAvVCqpGLVkFa6KNFAJv
 eou7CFglqYEhAy5eNZKXAdwiGbO1tnc45cTGudY8kpXCCUJHOnZLoC
 RZ3MY7+hDg014MploqpwJa1J1EYfcOUKFmN434iIPv0RSkrhDlOlTo
 fDepyV9TF0O8CwvbdVsP+USBMz+RFO75223BUfklNXsHg0l2Tia75M
 c/lFoS9wRefybmOCDFmkUNCo4fqCNZdMWykcIz1jGfEUhgtlS48b1p
 S3Ljt8wn8Mv8bv+7LMdbzEuTb110k093imv6oKeddzaRZhsjuaTHZH
 HxTK+1Vl0qXw+UpWcq6dpd8lbo8MQUK0Racjep2W2MEQ3bbodkWv3e
 oMhBiIIeZDMeq2xK7o9UQfuz2x+1BKHym9lugJjAGy+mLQEzsxst0S
 2xhhjsgBY27/X8x7gE8eAuxvRO5xWCfAPkUkwDtiHzHD1ta+aHeb3R
 DfCRQhHYy9FlJFS7Q7QclOrBrzLTFCPMKGYgujK7Y5AII7CBiILWYP
 kQhD+kA82xF7w6AfW0ES5k/F1kjsAzNwMWYUEEG2xLP2ugQg9HgSd2
 MAHLirvL3W1hZPIjuXOYjzjexNeo/1t5n9Hiw/wciu9qO2zRZPUPuw
 z8531si8vhN1xqo3KVjZ1MhSG0mYx3WGCtbhdcBOxt2IGXuBJ+d2Nz
 ojLyNEW/qRq+nduuo41hoidR86uWs9bs1wUyYo+jgtvL6xZQPFu990
 xR5SAlfoZp9dght7se+A7f8HnaT+4RQJAAABCrECPD94bWwgdmVyc2
 lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTE2Ij8+DQo8RW1haWxTZXQ+
 DQogIDxWZXJzaW9uPjE1LjAuMC4wPC9WZXJzaW9uPg0KICA8RW1haW
 xzPg0KICAgIDxFbWFpbCBTdGFydEluZGV4PSI0NyI+DQogICAgICA8
 RW1haWxTdHJpbmc+YXJuZEBhcm5kYi5kZTwvRW1haWxTdHJpbmc+DQ
 ogICAgPC9FbWFpbD4NCiAgICA8RW1haWwgU3RhcnRJbmRleD0iMjkx
 Ij4NCiAgICAgIDxFbWFpbFN0cmluZz5hcm5kQGtlcm5lbC5vcmc8L0
 VtYWlsU3RyaW5nPg0KICAgIDwvRW1haWw+DQogIDwvRW1haWxzPg0K
 PC9FbWFpbFNldD4BDLEJPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZG
 luZz0idXRmLTE2Ij8+DQo8Q29udGFjdFNldD4NCiAgPFZlcnNpb24+
 MTUuMC4wLjA8L1ZlcnNpb24+DQogIDxDb250YWN0cz4NCiAgICA8Q2
 9udGFjdCBTdGFydEluZGV4PSIzMiI+DQogICAgICA8UGVyc29uIFN0
 YXJ0SW5kZXg9IjMyIj4NCiAgICAgICAgPFBlcnNvblN0cmluZz5Bcm
 5kIEJlcmdtYW5uPC9QZXJzb25TdHJpbmc+DQogICAgICA8L1BlcnNv
 bj4NCiAgICAgIDxFbWFpbHM+DQogICAgICAgIDxFbWFpbCBTdGFydE
 luZGV4PSI0NyI+DQogICAgICAgICAgPEVtYWlsU3RyaW5nPmFybmRA
 YXJuZGIuZGU8L0VtYWlsU3RyaW5nPg0KICAgICAgICA8L0VtYWlsPg
 0KICAgICAgPC9FbWFpbHM+DQogICAgICA8Q29udGFjdFN0cmluZz5B
 cm5kIEJlcmdtYW5uICZsdDthcm5kQGFybmRiLmRlPC9Db250YWN0U3
 RyaW5nPg0KICAgIDwvQ29udGFjdD4NCiAgICA8Q29udGFjdCBTdGFy
 dEluZGV4PSIxNTMiPg0KICAgICAgPFBlcnNvbiBTdGFydEluZGV4PS
 IxNTMiPg0KICAgICAgICA8UGVyc29uU3RyaW5nPkFybmQgQmVyZ21h
 bm48L1BlcnNvblN0cmluZz4NCiAgICAgIDwvUGVyc29uPg0KICAgIC
 AgPEVtYWlscz4NCiAgICAgICAgPEVtYWlsIFN0YXJ0SW5kZXg9IjE2
 OSI+DQogICAgICAgICAgPEVtYWlsU3RyaW5nPmFybmRAYXJuZGIuZG
 U8L0VtYWlsU3RyaW5nPg0KICAgICAgICA8L0VtYWlsPg0KICAgICAg
 PC9FbWFpbHM+DQogICAgICA8Q29udGFjdFN0cmluZz5Bcm5kIEJlcm
 dtYW5uIiAmbHQ7YXJuZEBhcm5kYi5kZTwvQ29udGFjdFN0cmluZz4N
 CiAgICA8L0NvbnRhY3Q+DQogICAgPENvbnRhY3QgU3RhcnRJbmRleD
 0iMjc2Ij4NCiAgICAgIDxQZXJzb24gU3RhcnRJbmRleD0iMjc2Ij4N
 CiAgICAgICAgPFBlcnNvblN0cmluZz5Bcm5kIEJlcmdtYW5uPC9QZX
 Jzb25TdHJpbmc+DQogICAgICA8L1BlcnNvbj4NCiAgICAgIDxFbWFp
 bHM+DQogICAgICAgIDxFbWFpbCBTdGFydEluZGV4PSIyOTEiPg0KIC
 AgICAgICAgIDxFbWFpbFN0cmluZz5hcm5kQGtlcm5lbC5vcmc8L0Vt
 YWlsU3RyaW5nPg0KICAgICAgICA8L0VtYWlsPg0KICAgICAgPC9FbW
 FpbHM+DQogICAgICA8Q29udGFjdFN0cmluZz5Bcm5kIEJlcmdtYW5u
 ICZsdDthcm5kQGtlcm5lbC5vcmc8L0NvbnRhY3RTdHJpbmc+DQogIC
 AgPC9Db250YWN0Pg0KICA8L0NvbnRhY3RzPg0KPC9Db250YWN0U2V0
 PgEOzwFSZXRyaWV2ZXJPcGVyYXRvciwxMCwxO1JldHJpZXZlck9wZX
 JhdG9yLDExLDI7UG9zdERvY1BhcnNlck9wZXJhdG9yLDEwLDE7UG9z
 dERvY1BhcnNlck9wZXJhdG9yLDExLDA7UG9zdFdvcmRCcmVha2VyRG
 lhZ25vc3RpY09wZXJhdG9yLDEwLDI7UG9zdFdvcmRCcmVha2VyRGlh
 Z25vc3RpY09wZXJhdG9yLDExLDA7VHJhbnNwb3J0V3JpdGVyUHJvZH VjZXIsMjAsMjIX-MS-E=
xchange-Forest-IndexAgent: 1 2885
X-MS-Exchange-Forest-EmailMessageHash: 121D0850
X-MS-Exchange-Forest-Language: en
X-MS-Exchange-Organization-Processed-By-Journaling: Journal Agent

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

