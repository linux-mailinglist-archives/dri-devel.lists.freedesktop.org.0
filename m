Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8EB589672
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 05:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36ED010F2A4;
	Thu,  4 Aug 2022 03:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B2F10E411
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 03:16:23 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s11so12284638edd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 20:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=wj0kgv0pnjnnbWFGkf+hEd4TCjrKHOM5nUix2QrFsQw=;
 b=bpDvUsZA0TLrUjL8H2WcV1GfxfOqks5KNFE4Hq0lW07or+QMD6LEMvvn3eE0frYDSK
 OMMHG1YR7BpMjYSuqaU55EU8q+I5Kos5EmrrzzxbaYou6iJOD1on17NCVFWzaW0Z2z/p
 TXp+yaSJmcpSy7WeCzT87R1HZEhrs8gJYEtzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=wj0kgv0pnjnnbWFGkf+hEd4TCjrKHOM5nUix2QrFsQw=;
 b=gGn54+WbadXhogtFqJ8pkprVTnlHed2kuKGjJkD/C2sPYRltZ0KVi8JOUrEKtQ+N7Q
 Fx788COTrABnkXsGHTZ0khs3KIeSFytAHRqJKTRStUYPEx6G+MyGZodiRtLjoc0vmELU
 PV7xHzc6m/04mbSjLysN4dNEHf9T5s72OXRmgRMGh/naeLKeRZrvbti0FtV/K/Udg+uR
 5su0wmOArN/oqpmcm/g8RzLlbx53ZOua77atbfh6xUgxUmbnwoY3TwKgT16mt0pUSwt8
 9hSfConyX+hxWcPeI5e1qNsqRSKhgVm5ln+XVl3bueXkQQ4db8103oeyqK636FRe2jhj
 S6gQ==
X-Gm-Message-State: ACgBeo0FdEtN5tDSZjkd5F5mkd4RlpgeEC2s0JJ9pRiuh5KOmPJg3dLd
 MQdd/KIKKHi0loJGuLDKpYX+dV9sLMLtlAzL
X-Google-Smtp-Source: AA6agR7LlS2XkXIAhY/fphBkfEM9/2RIBR6RiDNyZ9O3zWFBkZpXOPPdk99NaaVvo2FARCzSPFKODw==
X-Received: by 2002:a05:6402:34c7:b0:43e:4237:e57c with SMTP id
 w7-20020a05640234c700b0043e4237e57cmr5708646edc.171.1659582981631; 
 Wed, 03 Aug 2022 20:16:21 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 u1-20020a1709061da100b0072ecef772a7sm7824987ejh.160.2022.08.03.20.16.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 20:16:21 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id z16so23637880wrh.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 20:16:21 -0700 (PDT)
X-Received: by 2002:a5d:6dae:0:b0:220:8005:7dff with SMTP id
 u14-20020a5d6dae000000b0022080057dffmr1710958wrs.442.1659582980728; Wed, 03
 Aug 2022 20:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
 <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
In-Reply-To: <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Aug 2022 20:16:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
Message-ID: <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.20/6.0
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 3, 2022 at 7:46 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I think I have it resolved, am still doing a full build test, and will
> then compare against what your suggested merge is.

Hmm.

I end up with *almost* the same thing.

Except I ended up with a

        select DRM_BUDDY

for the DRM_AMDGPU config entry, and you don't have that.

I *think* my version is correct, in that clearly the amdgpu driver now
uses that buddy logic (just doing a random "grep drm_buddy_block" to
see).

But this was messy enough to resolve that I think people should
double-check my end, and maybe I just got confused at some point in
the process.

And while I seem to have gotten the same result as you did on the i915
firmware side too, again, I'd like people to re-verify.

                       Linus
