Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB46B38002
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 12:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8D410E7A7;
	Wed, 27 Aug 2025 10:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="H07DyHX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EED10E7A7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 10:39:38 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7f7edf7621dso34662385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756291178; x=1756895978;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KdUUYdYYMaA5K4ETaZuOUOJJM1a2acdPrTwBBDRRG4w=;
 b=H07DyHX1DmCyRKQ9TUyXw5wMscDrhGjwmn7cH1Pf5A8p5SCEaURTxDX3iE02FcBgry
 gk2jT/XqO/MY2f9sOUSux3Dz/ZRfK4p/te1iaYWqg9odf00PmxsByzOJt6ELWHkM5cx5
 U+/LaLLTEyTPDkDUeXvJcOG0WfLC4B6Zn1yVfQuoqlkbu8uR1HQLAmt00PqY3KJ0RgCh
 QddOUA6kZ+g5DWUVZDaK3ztwh3+q4UzjXd/5qa4zwdlaw6qZmHXcVX8JGBu31PXY3jh8
 i1DZ9xADs0G7CWks+U2GEKU1f9feyij4dntvNne9YK1pnIfzQ0vWdZSCJE9cNjXSGHGg
 UcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756291178; x=1756895978;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KdUUYdYYMaA5K4ETaZuOUOJJM1a2acdPrTwBBDRRG4w=;
 b=NAliY4DghXal8hefHrHo5l5wGqV3ekTVrTc5GqDosGBaJxoSdKc6TJgdi9J/0IW0QR
 GeKvXlQh0P0qDaCh9zbsORv+Vu533N5kZXCTWo+Gw51786G0igOGBw54Kcb5AfwXBZeD
 7LTGKufZSu/okt+HHdK+ImQA27Q33cBWGstpnRt5OfWkDPEXTT8ezTbsi0WbHwFYNhNg
 NG+5pxxkgeemtbi9mXmDxyBQAFZ180Ggy6IBf1kgyoOmuRBHjYwjno0Epx+FNUItC7XJ
 rTRd0XrcVIzjC16sf/GOtJCMDLIgzHMn+Ro4H2BBD6pTpFSlvL7iGAQMOS2QvTb1mDAZ
 Y7WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV43YRUlQbE5tZ4Du96S8hq1wGqm9pxBlW1ebRC+bOX7mkzW7QkJD103/wRlVDhwjx0RPIUQ/V5VOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqAYrQquPXBX6HB5LxWdPHzvQ1/3MVCKJ5NziR4cL/9wrF9P7f
 4p+XsdS36kDe3946iQupmE6G+AyunMJre9yTmJKjyfvzcwrsQsTg4aEIOPyZOMC7+WvLwd8D4l2
 BjbM0SSNjwLPHqILST2gylkAjsqAEk7NsdndpvzEdIQ==
X-Gm-Gg: ASbGncttKigBIT7vbGRwcF7r3pX7XJhhfU/ylrF434FvFvKsNW2FJpNhth/caIfhPwR
 q87NWVF9Bd7Sm81Kb0385sQ5AvXO/I5dnTkjlH3R+tE6KrsyAhUNZQ+oR8ANwczqdxnYNJEn+3G
 LQdMIF0n3lWn0JEHScSnuKj35MnDs0FD+IBQgUti9Sc1ShsLmZ1DFzHJLdYtRB0GlNP7h72MD2Z
 l/XeD9F+AKPRGvnqFxEsMA0ke8=
X-Google-Smtp-Source: AGHT+IGICLeibcQmnZWYFS/brOl+88R3Na1uvRw0VQWTlZaKJUHWBkBh81Tx23IIhL3FKds+ZF25D4ZEHOiVNLlKiOo=
X-Received: by 2002:a05:620a:ac15:b0:7e9:f1c3:6851 with SMTP id
 af79cd13be357-7ea1108f69amr2193999385a.71.1756291177899; Wed, 27 Aug 2025
 03:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aK1hPoCmLziaPPOd@xpredator>
 <TY4PR01MB1443219A9870877AF120FE63B9839A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <20250827-imperial-mongrel-of-dignity-712fab@houat>
In-Reply-To: <20250827-imperial-mongrel-of-dignity-712fab@houat>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 27 Aug 2025 11:39:25 +0100
X-Gm-Features: Ac12FXwa0ndxe4WhxS64VBVPx8pzaNWj2GmesKshpkeIDruMRsTSCWY0sc4CrIA
Message-ID: <CAPj87rPhK+E2FP62fnNxFySDOkqqKxo_oa94i7DR3_6a1j1o1A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
To: Maxime Ripard <mripard@kernel.org>
Cc: Shengyu Qu <wiagn233@outlook.com>, Marius Vlad <marius.vlad@collabora.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com, 
 siqueira@igalia.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 contact@rafaelrc.com, lijo.lazar@amd.com, jesse.zhang@amd.com, 
 tim.huang@amd.com, dark_sylinc@yahoo.com.ar, mario.limonciello@amd.com, 
 alex.hung@amd.com, aurabindo.pillai@amd.com, sunil.khatri@amd.com, 
 chiahsuan.chung@amd.com, mwen@igalia.com, Roman.Li@amd.com, Wayne.Lin@amd.com, 
 dominik.kaszewski@amd.com, alvin.lee2@amd.com, Aric.Cyr@amd.com, 
 Austin.Zheng@amd.com, Sung.Lee@amd.com, PeiChen.Huang@amd.com, 
 dillon.varone@amd.com, Richard.Chiang@amd.com, ryanseto@amd.com, 
 linux@treblig.org, haoping.liu@amd.com, Relja.Vojvodic@amd.com, 
 Yihan.Zhu@amd.com, Samson.Tam@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Hey,

On Wed, 27 Aug 2025 at 10:41, Maxime Ripard <mripard@kernel.org> wrote:
> On Wed, Aug 27, 2025 at 12:26:56AM +0800, Shengyu Qu wrote:
> > 1.Can you send patch with only i915/amdgpu first? It's a long-needed feature
> > to deal with some monitors/TVs with broken EDID.
>
> If it's to workaround broken monitors, then it's really not something we
> should be doing using a property.
>
> Most likely, those monitors don't support YUV* output and will just need
> to be forced to RGB, so it's not something that the user (or the
> compositor, really) has to care about.
>
> And it would be broken with every driver, not just i915 and amdgpu.
>
> We already have some quirks infrastructure in place, the only thing we
> need to do is create an EDID_QUIRK_NO_$FORMAT, clear
> drm_display_info->color_formats based on it, and you're done. No uapi to
> agree upon, support, test, and it works with every driver.

There are other reasons to have uAPI though ...

One is because you really care about the colour properties, and you'd
rather have better fidelity than anything else, even if it means some
modes are unusable.

Another is for situations which static quirks can't handle. If you
want to keep headroom on the link (either to free up bandwidth for
other uses), or you accidentally bought a super-long cable so have a
flaky link, you might well want to force it to use lower fidelity so
you can negotiate a lower link rate.

I'm all for just dtrt automatically, but there are definitely reasons
to expose it to userspace regardless.

Cheers,
Daniel
