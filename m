Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F35F720C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 01:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B90F10E8E2;
	Thu,  6 Oct 2022 23:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E6410E8E2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 23:48:34 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-132fb4fd495so3941855fac.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 16:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pJMiQ46/KiBnfg6+facy6y32ur475qAL7V2FIVVnoOc=;
 b=H1uJFisEq86b1igTJeZ3icitP5usONcBgntp3Bmdfd7L7c+PbhZBFOBQP0sdQg07ow
 qxLoPLeON8LDcpeAyeJpP8HIJaym87ZqEiNnbYwcA07TYw/IVxsX/YQ5VYNjq29zKAWi
 PPHD1nPoH08WKswGp2QF09NZBEnNJqKOysIbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJMiQ46/KiBnfg6+facy6y32ur475qAL7V2FIVVnoOc=;
 b=zu3xve6Eu7abFRY0ztMh4gVdZ3d9BHRLTDumPouZhvhFe+Xe5uwORy2rd+00n3G7f1
 XRWzKKVyLToVSuGod4Y9YDk95aXC7V5ffTRB7FBHcu3yYi+5K5Fc3LkaUtT86osFXPVY
 mzeB2dW+lcgHRn6D4EqqpshRgbJdZzdYguMu1ywISM4s0M5vOspAAv6iJVQYhZdCjlwL
 ELmZr6JfrDO4DaJlo+zGewGpfUb79MYS2H/NFhqjoocIRmXOuAvkl2tayDpuNBjtBDdM
 moqRCsEU0RFjXFVKNIi+pjslDYMWyxnMKI93ix5ALqB2Xrfxusbn2G0kSwu9ZWC9RNPe
 465w==
X-Gm-Message-State: ACrzQf0hLFPoNeepMP1GCsnGJqyqX6mIf0nApwAIanxmrxGPKxjuN9IC
 HVVq5TYIx3/n+uH3dF3Vg5indmgBKDivIA==
X-Google-Smtp-Source: AMsMyM7nzLQX/V8D0IGnOJHC9JIKPrFXOnNvg88z9ZO3B/sKa6lBpYoXSHshDXgbMyHy2hVunKUEiw==
X-Received: by 2002:a05:6870:ac2b:b0:132:f761:8f4c with SMTP id
 kw43-20020a056870ac2b00b00132f7618f4cmr4052535oab.17.1665100113429; 
 Thu, 06 Oct 2022 16:48:33 -0700 (PDT)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com.
 [209.85.161.44]) by smtp.gmail.com with ESMTPSA id
 p18-20020a4a95d2000000b0047f72b6988fsm223702ooi.45.2022.10.06.16.48.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 16:48:29 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id
 m11-20020a4aab8b000000b00476743c0743so2476788oon.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 16:48:29 -0700 (PDT)
X-Received: by 2002:a05:6830:611:b0:65c:26ce:5dc with SMTP id
 w17-20020a056830061100b0065c26ce05dcmr1007394oti.176.1665100109301; Thu, 06
 Oct 2022 16:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <Yz6W+j+l0cJbr5dX@debian>
 <CAHk-=whR8T1x6DRnOMJsorajT3A-y9+j5Mpeh0zcUXcJiJWheg@mail.gmail.com>
 <202210061328.37FCC30@keescook>
 <CADVatmMOEtX_vpR2iv9r7n5x76xjuyHwx6duERqjMutb=AKrhA@mail.gmail.com>
In-Reply-To: <CADVatmMOEtX_vpR2iv9r7n5x76xjuyHwx6duERqjMutb=AKrhA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Oct 2022 16:48:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh2P3=W3iAsuhiMWMZSBPXQQJXudRAONp0xSuCQ218f_g@mail.gmail.com>
Message-ID: <CAHk-=wh2P3=W3iAsuhiMWMZSBPXQQJXudRAONp0xSuCQ218f_g@mail.gmail.com>
Subject: Re: mainline build failure due to 5d8c3e836fc2 ("drm/amd/display: fix
 array-bounds error in dc_stream_remove_writeback()")
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
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
Cc: Kees Cook <keescook@chromium.org>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 6, 2022 at 1:50 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> > And it looks like Sudip's proposed fix for this particular code is
> > additionally fixing unsigned vs signed as well. I think -Warray-bounds
> > did its job (though, with quite a confusing index range in the report).
>
> Not my. Linus's. I just tested. :)

I suspect Kees meant Stephen's other patch that Hamza pointed at, and
that is perhaps the cleaner version.

That said, I hate how this forces us to write random code changes just
to make a compiler just randomly _happen_ to not complain about it.

                   Linus
