Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E2BC3B88B
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7278F10E8E2;
	Thu,  6 Nov 2025 14:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SKJOV6V8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8C910E340;
 Thu,  6 Nov 2025 14:02:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 47DA66021A;
 Thu,  6 Nov 2025 14:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6B1C4CEFB;
 Thu,  6 Nov 2025 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762437745;
 bh=hiQQw6k86ZVHtOXveAjwjSs/SFXI36atd+KcmN4uR6U=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=SKJOV6V8NNXUmOgJUCVDxPTxCRUG3LhVH2hz17HmwIjUL1VOET0PiuylvL2SNqvEX
 iVUbC5eumzOQrcsBCPramUlOdj4PswFkDO7xSzdW+KOE0YLYna1sOw8yonXiq59R+h
 K1sEiPkHqyUGoOzsnfMX8UwJ/JsqL23kruSnhMWWxsq5An2Yca5SRQTUsI13CBbWRv
 3GnIzJyDDLu0ZeBqvAeVxVRJfJhUTkheJTiSx74WC5HnWhwII3ZRMcYs3l8nUm2LcF
 KpjfG96FvbJnWdIpG2eqFTTOG0wTdV0kk8HrFmkXA6R3y5iR5ZgxAToVMnwiJJwiED
 aAKIrGYjx1KXw==
Date: Thu, 06 Nov 2025 06:02:23 -0800
From: Kees Cook <kees@kernel.org>
To: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 Amit Dhingra <mechanicalamit@gmail.com>
CC: =?ISO-8859-1?Q?Timur_Krist=F3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: linux-next-20251029 - build error in amdgpu
User-Agent: K-9 Mail for Android
In-Reply-To: <105884.1762399131@turing-police>
References: <1043551.1761844832@turing-police>
 <32ed124e9d603cad950c4836c7a14a3ba8bc2068.camel@gmail.com>
 <1296761.1762045181@turing-police>
 <CAFF-SiU3XL5pZAzsB=eXi7e1LKzx5XwiNOyfGpPXOnnc6uo2cw@mail.gmail.com>
 <CAO=gReF+sWpKZFa+wbtGxa3+wSjAQG1UMG3iJaDt2EOPmH-7mQ@mail.gmail.com>
 <105884.1762399131@turing-police>
Message-ID: <A9C2FED1-EFBF-48AD-A3C8-41DDD16F8AA1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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



On November 5, 2025 7:18:51 PM PST, "Valdis Kl=C4=93tnieks" <valdis=2Eklet=
nieks@vt=2Eedu> wrote:
>On Wed, 05 Nov 2025 18:34:05 -0800, Amit Dhingra said:
>
>> I have the same problem=2E
>>  =2E=2E=2E
>
>> Setting RANDSTRUCT_NONE=3Dy seems to stop the error=2E
>>
>> [1] https://lore=2Ekernel=2Eorg/all/2025062439-tamer-diner-68e9@gregkh/
>
>Wow=2E  I wouldn't have guessed that RANDSTRUCT would be the cause=2E=2E=
=2E
>However, RANDSTRUCT_NONE=3Dy does make dce_stream_encoder=2Ec compile cle=
anly=2E
>
><insert Twilight Zone theme music here>
>
>Adding Kees Cook and the linux-hardening list to the cc:, hope somebody h=
as an
>idea what's going on=2E

I'm surprised the stable team didn't find the associated fix in your linke=
d thread=2E It had the right Fixes tag:
https://lore=2Ekernel=2Eorg/all/20250502224156=2Ework=2E617-kees@kernel=2E=
org/

Regardless, just remove the "0" from the dce110_an_str_enc_funcs initializ=
er; that's an older code pattern that isn't needed any more=2E

Randstruct requires designated initializers, though I thought the macro tu=
rned that on universally, so the fact that the error is only present with r=
andstruct seems like a separate bug=2E

-Kees

--=20
Kees Cook
