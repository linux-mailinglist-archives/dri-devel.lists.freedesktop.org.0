Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 414E44A9794
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 11:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7440D10F555;
	Fri,  4 Feb 2022 10:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DEF10F555
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643969864;
 bh=X1MRy+vD8CkfqTDx60skeng1J5c/t86h/L2dzUIQEuE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=WkG0g8mbgE8JR1nDOYhROOrodWj0VgSymyNNZStbEWPfFii1uVbuLaNLzedlLg2dZ
 4G7jML8yU0/jJEP+ngjJMnGs9YeSbGv2l4OZEKLkuurt3i3aYaOk98ZswsGwawoNTx
 UV/B3yeIcG8kKp5C+W8bEy7/YO7voAdtKsZXo7M4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.130.18]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MoO24-1mR8S01qzg-00ooJ8; Fri, 04
 Feb 2022 11:17:44 +0100
Message-ID: <ee851128-1080-d0ae-6c55-e1816bc89e74@gmx.de>
Date: Fri, 4 Feb 2022 11:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 3/3] fbcon: Add option to enable legacy hardware
 acceleration
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220202135531.92183-1-deller@gmx.de>
 <20220202135531.92183-4-deller@gmx.de>
 <CAMuHMdWTuFt12faj58sLv3H9rN0xK-+CCTkFeEiKdLSQTU2Lmg@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdWTuFt12faj58sLv3H9rN0xK-+CCTkFeEiKdLSQTU2Lmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HKEuiiAMmlsMFrW99nar/Wg5BrbdO7q6w9mqNlZShmLcaHlsfgP
 Sl0IMPACLyRZ+tieczUNkQuD2iWb6voEYM0pfb11cvHoRAj87JFHdgpnUid6cAidgYJgSeQ
 hsykB/okcmrN3/I7lFzKT4r9JZazHiaZ5SHU8N5womQB6LdH9M0t/ppbeMS2UN/ttVwGNBJ
 wIVHSil1w6DWDfp/dZJyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZJRa8nzcCrs=:mZtuzVp3chq7a2URU6E3ww
 qNLHahlbA3Z6+4/r0HHFl23OZ+XW9U8df5XgVPkG0XGrQJ9BMFtlfkMCyHPvxFqbkuZaS4nuD
 enFXdGN/paHVgwrcJRG8dOPBxoqiDqvXIZDPeoh7IAXxeM2QHIwzXDITPqlxdpYVfKxAHNi2h
 gwlTqv+PS/1KwQtF0iEHJ7ggRjcVISJ0x/KZPGvQo04vNT8ov9cZ8iRGp8iyfk7EOvEpW5hBv
 xoPSBG9IqHVH4aVGI6XaDa/3gfZ5PkKY1reEBNA8fXbofwp8nnon6zKGjp4mfxmmSUpANpirr
 jAdibd+nPaTQYXblA1SOfa8+pnGGF26kRVdSSSg15IixvvurHKgwQuldZ7ojahXmXLGJDz/wd
 bwL49XrzQZfrsBrr5qfgVHIum9X7gUBwG96y9LJqbJAp4KFLHByrwqEdSCSdT3evmBlsmUad7
 9X7i6ITTyetalhtZYDqsQ5+yioI0yj1Al7WeeMTzHVHgJIlQcSVg3IKrS+As0frhK8I/zCc9S
 rA2lNTQxCXWKaflAso9drg2YhxAxoNC4MuGx5tgxFpR29dmz1+cZHSaU1B2TZfDcbeRx9WoFF
 0UorULX2xpAdcEyyusH09rXDg8Qg9DgvLzqs5mkyPNr4p/bXgKHrJ/FHV6TJKn7ltfcLUT1yb
 OI6m0TwviCgtBfPVPlympvwVKY4b0oGWs8ZGkVI0Hin5HAtta2g+SwNGpk4ZcHdSmQ6KXoni7
 fAiJ7eh7XztUpEU32NiyQAkGR+6XB5tmN3LcOmZESLaa7mZjscQ+wgogJYfy1gaXAQjI13rCi
 D4SI7y+JS5HcEkHgc852+ZXGT1ZOSIEa2maM5TE7roc7QKXRFYnyHggzfcxbIzdqxBCGoZ79x
 y977XB3TT5Ce8H1Vppu2p9KDW4sh2qges/neOqNQNaTC2p40HulimVOKIk9LuBW3E9xixbYHs
 oZ4F+fq4UcQ3M5NorsOQQHLSK4hcaNxIhyAmIpPRcEjR0u4pX9qIXhLNnEzwja/kGrK8uBm63
 u9SjYrT5JkwXGO0CURmPw4egorQ1nzvzMLOzHQjEiRaNJg4/EM75d/AJaGTb05aciqfN4hb4e
 mPe4356Da/Bc4uxLRmlv8zpgcvzXCdMh/xdDm5wnXR0dWDyMuF/VGwLs4wim2T3Tv0xqewu9F
 wUHFx7dQSdNF1DXMnaa/xlqKY6gtSmttuD3SGPkd/2piLibtJnFjGls2N0strJX18cwtJov95
 iJGo66NzURZinqkBwnXwPodkcntyTmFT1Iudw6hX600r6U1/mRf9RHQKG3eK1nzjkgVLpMvA1
 ngvXQTv9pHG0ZH3j7O1P23KBBLkxsgwMsIlZL6/rQ0y1UFjuegfsemXpquDBX8qRbdxRx9ec
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 2/4/22 09:37, Geert Uytterhoeven wrote:
> On Wed, Feb 2, 2022 at 8:05 PM Helge Deller <deller@gmx.de> wrote:
>> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
>> enable bitblt and fillrect hardware acceleration in the framebuffer
>> console. If disabled, such acceleration will not be used, even if it is
>> supported by the graphics hardware driver.
>
> Note that this also applies to vertical panning and wrapping.

That's correct.
Would you mind to send a patch which adds this info?

Helge
