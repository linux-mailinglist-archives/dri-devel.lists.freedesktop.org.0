Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B7ACA068
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jun 2025 22:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD8310E13F;
	Sun,  1 Jun 2025 20:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T/8IALDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE16910E063
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 20:50:39 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ad69e4f2100so554428966b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jun 2025 13:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748811033; x=1749415833; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Sb2xhB5TGExC404/TTG6KUuHUH8xU1/mhMLupfDN8ms=;
 b=T/8IALDnvD0c8NEoBF7PPuhoRdgAqPbaUTreu/lJaKnVBo1LcAxHf7KOYc203Tt+mW
 iz21i7DM7fdgka5UyryyxH3k4rj6KCATDzFHb+mBwlHdwuOMK6/WOvTYLWL8sO/BBLls
 LQUz9UZ/Rt/9PgTXMpSR3lYR0i/ypQFNbtxinSRYmOvgjs/bkI5P41n1Ijxj2zppJrru
 2+GYmbdLXou0lCgnYL/OjhEYVyvQd76F2LTLzMhjAIAwp8fpLeYY6NuTJvJSN/LjGAIe
 kv2W81l47TO26pAdKX2wGFAx8sgWP5sCHOLi7U38MQ001Tm5ZW5RjX9TMC1i+EmKqkkQ
 U8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748811033; x=1749415833;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sb2xhB5TGExC404/TTG6KUuHUH8xU1/mhMLupfDN8ms=;
 b=MIxDlE3pZTHtM253VkQDRc+0kFLdsDQ3O6Crc/ioyxPy37WagOJKyCXq/TYOPoTPqz
 5MSVL6/Ct3wOKVuHdq75wk5P7AOCW91LhJShSCYv7OcxorxiAe1Ujlh6LkcQHA8/ZZEc
 InTp/ccdrp0ENs78XWeXVuMsnl7MrPEnU9W8mcaHXyG8jiOZs1JkSZRjHhG2GCd/aawE
 kdgJl/fzyiNDN3lvGSma2gEB7rxdLtU7FVLPDTvgKI6SZBonecEf2e0wmQKqbQPGjqeM
 6TLSzzvD7VPqVC9WHNe4kUygfHmzLwMk4yKB803S4/Nr2SC636XTbZc+sxWT9UsUFdby
 44rw==
X-Gm-Message-State: AOJu0Yzm51303lLoqJQZKbXg05mCSnRLFPBTmEB18ILLU/KDeOI3K5EP
 qmcIlLjxjhQiCuWmjCxYIkkCN1Di3IQETb7qDhJ9cXMqcxuCiEa2AUGEs4Rs1734n5ShgISI91Y
 K9Kty2Dviu1nMzyCBolorTTFkhgsLNxHMG6R8IOU=
X-Gm-Gg: ASbGncsOcrsZRxx+6GABy4UaUT1iNHPNuya62CaeMukCHPKrSWnZeOU4AfZdttD0HdU
 eUXSrHcHamYrvOfxh6CoV1PUPxSDY2haO+b0JJjHKQGxseYU7a04ElxeuhlcppN/Yr7tkjDym+q
 9Q0B9Ycq2DklKwlbQLs6TlX71SafalCuJVc3ugBYxqxQ==
X-Google-Smtp-Source: AGHT+IFW1g9TC8wP2HJXplVcvuZO/N2uclOggcT73Xqc/pCbwvRTJfGqX8pQNI1STg/+cb2yx9nkgzhIVPDIFa/qccc=
X-Received: by 2002:a17:907:969e:b0:ad8:9b5d:2c23 with SMTP id
 a640c23a62f3a-adb36b2327bmr931901866b.10.1748811033009; Sun, 01 Jun 2025
 13:50:33 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 2 Jun 2025 06:50:21 +1000
X-Gm-Features: AX0GCFsypfqmVPhWH7PNxr9oT5yzxtk4sMIyPw4RT6uxk0rSn8QjeBipPuLEBcY
Message-ID: <CAPM=9tx++LWvKMfS556+CDcw-bWxf6vD6JtiwpAjspuc7Qeh_A@mail.gmail.com>
Subject: ttm vs aarch64 mappings
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Will Deacon <will@kernel.org>
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

I've been playing a bit with nouveau on aarch64, and I noticed ttm
translates ttm_uncached into pgprot_noncached which uses
MT_DEVICE_nGnRnE. This is of course a device mapping which isn't
appropriate for memory.

For main memory we should be using pgprot_dmacoherent which translates
to MT_NORMAL_NC,
pgprot_writecombine also translates to MT_NORMAL_NC.

Now I'm not sure anything gets this wrong right now, (except maybe
nouveau), but I'm wondering would adding a ttm_uncached_ram caching
type and rename ttm_uncached to ttm_uncached_device, if that would be
a good idea?

Has anyone else come across this problem with TTM on aarch64? or
understand if I'm missing something.

Dave.
