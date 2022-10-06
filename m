Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDCE5F6E4C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 21:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804DE10E885;
	Thu,  6 Oct 2022 19:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21EA10E4DF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 19:40:01 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s192so3206371oie.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 12:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2rfFLTjrQP4Fs05vC2spzCNZmbqViurrXQPntyMULUc=;
 b=YOZJVG6+3eUoB+z47gniaYwRj4q892BGbzsUmXa8JZ749nhmg4i+5R9Xkmj7Teg7Ts
 qUsfZETBoSEUctCMzSHOHnJyiQnagLgha0o6TI8FZi2nYSdju6Q10U7rXsMWGIcI8QfE
 sZdoeav9x+37Lg1XTxyJ0M4yci7/w3Xooven0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2rfFLTjrQP4Fs05vC2spzCNZmbqViurrXQPntyMULUc=;
 b=grtOUDAypXe9YvTYS2G7eKwnSIenofOgDBj504NVvg6BR/HCofk7gVBWvux8HVVLGJ
 vNsDCaU4GUFUozzZB3OiTAKQU3nVLWI3HE88f6s7omT5vhy6SIIe26+AOVMm1UHx6JZn
 8LJQ/JLrHtH6PWAbs7rW69JxWLgfsCvbQQs0zL7Mo5udh/l3tqZRNvLKqv4Q4Lg2Ab35
 z2B/PUNc4+TLuqa9vqklwOScpN8Fye9hPAF2T6gtIBKKlsT0+B2rEWR7HX8Vg+f9EzDV
 9J0p718ia9Zh7sgSgEEuTSenCJclJyCS5pVtxMd9f8inl3ksdpIhUDqQxD+0mZlnKJmw
 B+hg==
X-Gm-Message-State: ACrzQf0fe879dT7i8Ox9LNAxjpZ6nYN3gcah/E0myN1cgSOIPT/R8QdR
 6Rzk5uW5NJTzOILncWFU+cZFBiJuVyF8oA==
X-Google-Smtp-Source: AMsMyM5iXYeRkBd0Ol+2/cWjKkFlrBDS65XMUFEC0CWncSaWmi3jVjAIAd+oq0LSoeNLQ4S++A2qmw==
X-Received: by 2002:a05:6808:1a08:b0:354:2875:3d63 with SMTP id
 bk8-20020a0568081a0800b0035428753d63mr583920oib.241.1665085200238; 
 Thu, 06 Oct 2022 12:40:00 -0700 (PDT)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com.
 [209.85.161.50]) by smtp.gmail.com with ESMTPSA id
 w19-20020a056808141300b003431d9b3edfsm44152oiv.2.2022.10.06.12.39.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 12:39:57 -0700 (PDT)
Received: by mail-oo1-f50.google.com with SMTP id
 q70-20020a4a3349000000b0047f9951ad3aso1594998ooq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 12:39:57 -0700 (PDT)
X-Received: by 2002:a05:6820:1992:b0:475:c2c0:3f92 with SMTP id
 bp18-20020a056820199200b00475c2c03f92mr493824oob.96.1665085196830; Thu, 06
 Oct 2022 12:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <Yz6W+j+l0cJbr5dX@debian>
In-Reply-To: <Yz6W+j+l0cJbr5dX@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Oct 2022 12:39:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=whR8T1x6DRnOMJsorajT3A-y9+j5Mpeh0zcUXcJiJWheg@mail.gmail.com>
Message-ID: <CAHk-=whR8T1x6DRnOMJsorajT3A-y9+j5Mpeh0zcUXcJiJWheg@mail.gmail.com>
Subject: Re: mainline build failure due to 5d8c3e836fc2 ("drm/amd/display: fix
 array-bounds error in dc_stream_remove_writeback()")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 6, 2022 at 1:51 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> This is only seen with gcc-11, gcc-12 builds are ok.

Hmm. This seems to be some odd gcc issue.

I *think* that what is going on is that the test

        j = 0 ; j < MAX_DWB_PIPES

makes gcc decide that "hey, j is in the range [0,MAX_DWB_PIPES[", and
then since MAX_DWB_PIPES is 1, that simplifies to "j must be zero".
Good range analysis so far.

But for 'i', we start off with that lower bound of 0, but the upper
bound is not fixed (the test for "i" is: "i < stream->num_wb_info").

And then that "if (i != j)", so now gcc decides that it can simplify
that to "if (i != 0)", and then simplifies *that* to "oh, the lower
bound of 'i' in that code is actually 1.

So then it decides that "stream->writeback_info[i]" must be out of bounds.

Of course, the *reality* is that stream->num_wb_info should be <=
MAX_DWB_PIPES, and as such (with the current MAX_DWB_PIPES value of 1)
it's not that 'i' can be 1, it's that the code in question cannot be
reached at all.

What confuses me is that error message ("array subscript [0, 0] is
outside array bounds of 'struct dc_writeback_info[1]') which seems to
be aware that the value is actually 0.

So this seems to be some gcc-11 range analysis bug, but I don't know
what the fix is. I suspect some random code change would magically
just make gcc realize it's ok after all, but since it all depends on
random gcc confusion, I don't know what the random code change would
be.

The fix *MAY* be to just add a '&& i < MAX_DWB_PIPES' to that loop
too, and then gcc will see that both i and j are always 0, and that
the code is unreachable and not warn about it. Hmm? Can you test that?

And the reason gcc-12 builds are ok probably isn't that gcc-12 gets
this right, it's simply that gcc-12 gets so many *opther* things wrong
that we already disabled -Warray-bounds with gcc-12 entirely.

If somebody cannot come up with a fix, I suspect the solution is "gcc
array bounds analysis is terminally buggy" and we just need to disable
it for gcc-11 too.

Kees, any idea? Who else might be interested in fixing a -Warray-bounds issue?

                 Linus
