Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6FA42FE0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 23:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B902910E049;
	Mon, 24 Feb 2025 22:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kZ/s8bUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F210210E049
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 22:17:33 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-220bfdfb3f4so110041085ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740435453; x=1741040253; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MIAmGwREzfChZxhZrA3OzxmyUXhIuIWMIVivU3ALR/o=;
 b=kZ/s8bUvIP37211I73IBQT9Jsz/efLU9dIgjnITl52ME/9pOzFubmXV7IatnNfu0wm
 sROaWx5OCld6xl/QVlAnhzZqbF23JN96oyd8DQdPQm1fvS9ZZ4glN/yfnZwLhXo+fXAG
 IzwgDsDDN2dlop3364KShugHy5a+KlRoaTVGenbqToZQgycf5hkFfdPE+sYmdml6iaH8
 8aZ3nTrZyE5mHw4OsCoQg3o3F+aj1e8zc2r+OptHkxoQ4Bw1itoliXA5vSxYxfSRBhMW
 vWy/cvnWCp+ADcL7lQ36Z5hvIbEt7qeN/7h6uwFOD6H31Tz+/lxD11oEsXNhBu12k77M
 +CdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740435453; x=1741040253;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MIAmGwREzfChZxhZrA3OzxmyUXhIuIWMIVivU3ALR/o=;
 b=V0Jh8in8DjY0/+GvldviCflks+L+zGZXno+J9HTKGbAoR3Yhj2lY355hW5q621THB7
 QOqqSECfdPcuEDGb61wmfuBug2DMXh1WhQOp4jiJMGtDXZg/zHsbHQa7nVwa72exdgjO
 61BiJA7ws1/iPUOcltAt68/prtjhWKE7LJ5m0v8J/Fac2VahiVlr5kyg7gFZzxwCIWzF
 26pAsbNE0FVt8NyFFHmCHgt4dsUbK4uinb4IYMW6JvU/PpvNiSVYGT+Mgm/SytPYBP5+
 7g0WBPMEKdxAUX6FAYXq4yZi+0r1MWzBeJKFBkjRB5WC4bfvwDCf8YaYJgWZrxOCxAfk
 zIAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhcOHXGmxhEAek10vLKdLDn3HYemSEJyuetWVI3VTgjIqnBqMAfTTs2Yy26ZWufq+1ABKTUCxEbys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4bIMv91idORV3ya0LvhfoAKkBS21EVXeO6pWbBqB/Y5nShewu
 zj+IXx/nILF6YIBOvAwHU7uPaf4C78UMpzB+l9bqqWKtMi0KiU6s
X-Gm-Gg: ASbGncup1Fsh1v9oJy0NfQJxczgi9VuqpSmr0EnUUFB8rjgvOD1VS6bU6hsm1Es4VU5
 8E9I0UN6I5v4xSW8wzTWsgHd2y3l0ODUyVVd3pYMItHvylcOnOJ7Z8odyz2UoBHonKWKAxgPAL2
 uSEP/npzi0+TNccvfvHz3M8rVVXPTSg5hTRCZTnkyK81GNsJggBym4k03M32+AVHnLClQKRAlpj
 6G4pu8KYgh5EO3tDHjUIKhd2lLwjc9CdLlalcuCh40o0/KF6n5YWv2gtcG/HIGJxV/A8JV7PCHN
 sEwON3lyu9eGm4gx4SNlpFawrU4454O3B4ycOaftSQr9A6jDMw==
X-Google-Smtp-Source: AGHT+IHUNZzOI1ZFK/Wig2ECxEjG2LCeoTVF/IwXlP7H5EbtmMAu2d6RHqgduSyhdb+wHec1lfRRUA==
X-Received: by 2002:a17:903:2a8d:b0:21f:6584:2085 with SMTP id
 d9443c01a7336-2219ffc4928mr267486635ad.42.1740435452344; 
 Mon, 24 Feb 2025 14:17:32 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a01fe28sm1125415ad.100.2025.02.24.14.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 14:17:31 -0800 (PST)
Date: Mon, 24 Feb 2025 17:17:29 -0500
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, mingo@kernel.org,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
Message-ID: <Z7zv-c4A76jeMAKf@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
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

On Mon, Feb 24, 2025 at 01:55:28PM -0800, H. Peter Anvin wrote:
> On 2/24/25 07:24, Uros Bizjak wrote:
> > 
> > 
> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> > > Refactor parity calculations to use the standard parity8() helper. This
> > > change eliminates redundant implementations and improves code
> > > efficiency.
> > 
> > The patch improves parity assembly code in bootflag.o from:
> > 
> >    58:    89 de                    mov    %ebx,%esi
> >    5a:    b9 08 00 00 00           mov    $0x8,%ecx
> >    5f:    31 d2                    xor    %edx,%edx
> >    61:    89 f0                    mov    %esi,%eax
> >    63:    89 d7                    mov    %edx,%edi
> >    65:    40 d0 ee                 shr    %sil
> >    68:    83 e0 01                 and    $0x1,%eax
> >    6b:    31 c2                    xor    %eax,%edx
> >    6d:    83 e9 01                 sub    $0x1,%ecx
> >    70:    75 ef                    jne    61 <sbf_init+0x51>
> >    72:    39 c7                    cmp    %eax,%edi
> >    74:    74 7f                    je     f5 <sbf_init+0xe5>
> >    76:
> > 
> > to:
> > 
> >    54:    89 d8                    mov    %ebx,%eax
> >    56:    ba 96 69 00 00           mov    $0x6996,%edx
> >    5b:    c0 e8 04                 shr    $0x4,%al
> >    5e:    31 d8                    xor    %ebx,%eax
> >    60:    83 e0 0f                 and    $0xf,%eax
> >    63:    0f a3 c2                 bt     %eax,%edx
> >    66:    73 64                    jae    cc <sbf_init+0xbc>
> >    68:
> > 
> > which is faster and smaller (-10 bytes) code.
> > 
> 
> Of course, on x86, parity8() and parity16() can be implemented very simply:
> 
> (Also, the parity functions really ought to return bool, and be flagged
> __attribute_const__.)

There was a discussion regarding return type when parity8() was added.
The integer type was taken over bool with a sort of consideration that
bool should be returned as an answer to some question, like parity_odd().

To me it's not a big deal. We can switch to boolean and describe in
comment what the 'true' means for the parity() function.
