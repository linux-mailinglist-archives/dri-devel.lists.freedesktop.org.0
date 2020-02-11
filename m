Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61215A32E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38506E9CE;
	Wed, 12 Feb 2020 08:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2A26E2B8;
 Tue, 11 Feb 2020 20:39:38 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id d3so11549696otp.4;
 Tue, 11 Feb 2020 12:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=FkiL+nwntyVL1Depk52x54ARrFLNbJ/q2cGreWUpoIY=;
 b=guvCAd2UOUpE5ajI+DyZuXuN5tRzCg1lxnzXs01Bvu2MlthWaB0XogL0T0x015uMCv
 0Nvd5+Ig7erzbpig7CWn1Kiws8zHYl44P3bOkicvZaw2f51Qe4Ml6z6VRCQrCpJq24EY
 DR4ynLgVuwECElLR2xmeFY2msAViOtRDcH1POsBv6CnnIHmPgLjAvG1MkNVIFWcMD8Te
 UQDPiEB+WG1wY2ilnvK8g2oK/a8t9J2lFGd1pqTUbTOmoXak/wg6m63A9+dH4OIwsiJJ
 RpARQc1c+3yEtHkG8gD7JGSh/lnpYuRTLockpE32Egd1RdTirJy3ErA0i2yfaNgW3aBD
 rM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FkiL+nwntyVL1Depk52x54ARrFLNbJ/q2cGreWUpoIY=;
 b=VuIYVujWbq3LknC3lveMJ4IsbrXN1Wun0BT7r8ckIshwk3YE+6Ud36nSPnbckcs7VU
 zG3EaJD7yZwdowk3yubiSCJW18fIZ7T6Z3S+GlHMfpWZWTcpA1Pvq3dEzjHAaRmX65S8
 Hh0brO5WQLhB6oqytqEx/Chbkgd/7QCuCxL5lSbei36QwZNecZndxwgxpbNV5euX31JK
 PLx3SXBUjzuel6eoIWfeHmPO0RUPizXYn0uQTf93vuj+axwYqmQNeAf+umbRRIruj+fF
 E843XsOxoP3ue5fUiFhOc6HRFGSGl2oitNB2Nr8Jzufu4DE7NcWPOD2F2dhZXqhiGcFV
 XGIw==
X-Gm-Message-State: APjAAAVTv8ugubrkAj6NHBF92yOFyvJPCMdG4D7Txkr+a7vHm5f+b8Gw
 VLu7IA9AE/HlXu0G8Duj8Jo=
X-Google-Smtp-Source: APXvYqyRcLhd1pYN0o8cVbwvTHy9UM43N0APlTdoi5+8CTIzfL2EpJ/miK1zSlKVRAdQyxB4Sxva+g==
X-Received: by 2002:a9d:64ca:: with SMTP id n10mr6692357otl.325.1581453577909; 
 Tue, 11 Feb 2020 12:39:37 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id w8sm1537795ote.80.2020.02.11.12.39.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Feb 2020 12:39:37 -0800 (PST)
Date: Tue, 11 Feb 2020 13:39:35 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
Message-ID: <20200211203935.GA16176@ubuntu-m2-xlarge-x86>
References: <20200211050808.29463-1-natechancellor@gmail.com>
 <20200211061338.23666-1-natechancellor@gmail.com>
 <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 10:41:48AM +0100, Michel D=E4nzer wrote:
> On 2020-02-11 7:13 a.m., Nathan Chancellor wrote:
> > A recent commit in clang added -Wtautological-compare to -Wall, which is
> > enabled for i915 so we see the following warning:
> > =

> > ../drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1485:22: warning:
> > result of comparison of constant 576460752303423487 with expression of
> > type 'unsigned int' is always false
> > [-Wtautological-constant-out-of-range-compare]
> >         if (unlikely(remain > N_RELOC(ULONG_MAX)))
> >             ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> > =

> > This warning only happens on x86_64 but that check is relevant for
> > 32-bit x86 so we cannot remove it.
> =

> That's suprising. AFAICT N_RELOC(ULONG_MAX) works out to the same value
> in both cases, and remain is a 32-bit value in both cases. How can it be
> larger than N_RELOC(ULONG_MAX) on 32-bit (but not on 64-bit)?
> =


Hi Michel,

Can't this condition be true when UINT_MAX =3D=3D ULONG_MAX? clang does not
warn on a 32-bit x86 build from what I remember. Honestly, my
understanding of overflow is pretty shoddy, this is mostly based on what
I have heard from others.

I sent a patch trying to remove that check but had it rejected:

https://lore.kernel.org/lkml/20191123195321.41305-1-natechancellor@gmail.co=
m/

Cheers,
Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
