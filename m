Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CABF98A4DA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BF210E4B9;
	Mon, 30 Sep 2024 13:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dxUF1aX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA84010E4CA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 13:27:11 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2e084dc44bcso733043a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727702831; x=1728307631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIo2EVmaU3JV8w7AaTi/2KQOMC+Cl9QGe3PeB8CxDUM=;
 b=dxUF1aX9nj4YBE2UqyQvL0cyMmbBCw9D6TkWqIFKG8fyqKRAW4dUTYuwlnXk5nIr7G
 rIv2L0ggkxrjoT2qQ3FvwszgqhcyYVYdd1ctkYqtHYwtxjKiSvuaxCVXjBkNOBsD3/MJ
 slW1SLbpurEwt8LAFj8HxMDol+inbZXm2XoOkWA6snhS6YWATiLAKC4O6znAzMWsNzeb
 Indpx+gK4o7x0f+BOlqqz1XlkbqbUjsvCLPRXDmlFvXceNOPwHnFxlz1WCAsUG8J/ql+
 0WVmnwkSsJ7TxQalWcrz8MApGZXrT3mkWWaQSifKYrtyOSuANw1E2dB3KNbD2sTrfNeH
 gZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727702831; x=1728307631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIo2EVmaU3JV8w7AaTi/2KQOMC+Cl9QGe3PeB8CxDUM=;
 b=vGZlIxdjaHo8p5c1z7JsxqYnC+AfDNze1VEpJNbtT169w3ozuPXQZdJ43ZROp85UMo
 AAtD9wbmlgJBqj/5on81IF3kRYBoSn88z16U3o4u2Bii2gBonnaGEa8sF3smdaulkXQr
 YF8sXXJwZ/x8GdzEC7Swmid3FseDOeV2GYNcRnTnQLsV2AVgZtsmNGAVi5dxAe/ZOtK1
 Z2hqtGC/0+TsFrV3GZqPDX7jykBYAfGj0nTxAy70QNDFliSAdVW3r9PCK/9ITp/kwdC8
 SwcKGFNuD9zZfChdV56lwRdd8xmtg3YSgjJ8iWaEXWGGkKYDeri6rZnHzabhrkKlN95B
 XfVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+iVhCWPU3JUZohj34pAJ1k9gPXwRd5Qe2BGaWyXAdQ4EdSOf7TuOZX0wF5Y276UwLbk89rrhLM5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1bleJ+wCyJpV5LEn6/fpg/lwtsTS3CNofHGbQkBcdFLulpG2b
 /IZ7y6FmdFU5hI9XEQ6bH2BM7HQyluedvo38fbks0XnEc9EU8HIbbrLQqn2U862LXO6vc9RTlcF
 zaNJyla9QFXckY6KGaQH6xZeSokw=
X-Google-Smtp-Source: AGHT+IETAvZExG+ZPhYX1kIVzzMlQnafA3k2Y/saw7HytqtbGnbbr73zHZVCDZ5DCA3CFTqgB0AkONsC72G4WnUZmrg=
X-Received: by 2002:a17:90b:1d0d:b0:2e0:8305:5c53 with SMTP id
 98e67ed59e1d1-2e0e70dc9f9mr4338072a91.7.1727702831302; Mon, 30 Sep 2024
 06:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
 <37D93804-DC55-4B2D-A82F-85BD45D9E131@xenosoft.de>
In-Reply-To: <37D93804-DC55-4B2D-A82F-85BD45D9E131@xenosoft.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Sep 2024 09:26:59 -0400
Message-ID: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
Subject: Re: FSL P5040 board doesn't boot after DRM updates
 (drm-next-2024-09-19)
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alex Deucher <alexander.deucher@amd.com>, 
 developers DRI <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, 
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>,
 hypexed@yahoo.com.au, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
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

+ Wu Hoi Pok

This is likely related to the drm device rework.

Alex

On Sun, Sep 29, 2024 at 11:33=E2=80=AFAM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hello,
>
> I tested the latest Git kernel with my VAPOR-X Radeon HD5870 1GB GDDR5 PC=
I-E DUAL DVI-I/HDMI/DP on my PASEMI Nemo board today.
> Unfortunately it has the same issue like my FSL P5040 board.
>
> I think it depends on which graphics card is used.
>
> It could be, that FSL P5020 boards are also affected.
>
> dmesg (via null modem RS-232 serial cable): https://www.xenosoft.de/PuTTY=
_P5040_U-Boot.log
>
> Please check the drm-next-2024-09-19 updates: https://git.kernel.org/pub/=
scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Dde848da12f752170c2ebe1=
14804a985314fd5a6a
>
> Thanks,
> Christian
