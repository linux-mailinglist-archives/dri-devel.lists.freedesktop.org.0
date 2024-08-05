Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F60E94773B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 10:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE9210E153;
	Mon,  5 Aug 2024 08:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [195.130.137.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0782410E154
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 08:25:11 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4WcqHm718Gz4wwdQ
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 10:25:08 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:23c7:e51f:c68a:b0e5])
 by andre.telenet-ops.be with bizsmtp
 id w8R82C00E4yPHVg018R8o2; Mon, 05 Aug 2024 10:25:08 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sat1g-0050JL-9n;
 Mon, 05 Aug 2024 10:25:08 +0200
Date: Mon, 5 Aug 2024 10:25:08 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: linux-bcachefs@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: Build regressions/improvements in v6.11-rc2
In-Reply-To: <20240805080012.239408-1-geert@linux-m68k.org>
Message-ID: <f02ec5a4-2918-24e3-8683-f965e2139830@linux-m68k.org>
References: <CAHk-=wh01xPAWUT_=J1TehFOu3SST12UTNuB=QQTeRw+1N4pDQ@mail.gmail.com>
 <20240805080012.239408-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Mon, 5 Aug 2024, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.11-rc2[1] to v6.11-rc1[3], the summaries are:
>  - build errors: +9/-4

   + /kisskb/src/fs/bcachefs/data_update.c: error: the frame size of 1032 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]:  => 338:1

m68k-gcc8/m68k-allmodconfig

   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_950' declared with attribute error: FIELD_GET: mask is not constant:  => 510:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_951' declared with attribute error: FIELD_GET: mask is not constant:  => 510:38

In function 'decode_oa_format.isra.26',
     inlined from 'xe_oa_set_prop_oa_format' at /kisskb/src/drivers/gpu/drm/xe/xe_oa.c:1664:6:

powerpc-gcc5/powerpc-all{mod,yes}config
powerpc-gcc5/ppc64le_allmodconfig

Seen before, fix available

   + {standard input}: Error: displacement to undefined symbol .L142 overflows 8-bit field :  => 1070
   + {standard input}: Error: displacement to undefined symbol .L161 overflows 8-bit field :  => 1075
   + {standard input}: Error: pcrel too far: 1397 => 1059, 1254, 1060, 1061, 1255
   + {standard input}: Error: unknown pseudo-op: `.al':  => 1270
   + {standard input}: Error: unknown pseudo-op: `.l18':  => 1111
   + {standard input}: Error: unknown pseudo-op: `.siz':  => 1273

sh4-gcc13 crickets

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
