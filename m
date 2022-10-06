Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152CA5F6E64
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 21:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887F610E4E4;
	Thu,  6 Oct 2022 19:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5810510E4E4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 19:48:06 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id l5so3216631oif.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 12:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ooBJ63voK+T4xhw7PLOjKLg/v7+jeOQeInbK0q07EDY=;
 b=YUgBKmPubr3qEDT/uQzIu40ebZdL46QgivXJHjm7SuA5KBtGisGZG8/SWXBwMMh5id
 qB3UA/SZZ6VP+mEKxdXSpnHHRzxqSnllv+Hy0WnVO9aHP/O6Cb2bpmxd07axJQzzgetn
 mEkWiEUw3DnRWOFq7bexOR+HwYCNKj+NNnoXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ooBJ63voK+T4xhw7PLOjKLg/v7+jeOQeInbK0q07EDY=;
 b=VjOwg+0iZI9m4dYsMEYRlLI032ABh4ugfvkAiyA2XWhYPwIVkA6P+XL5AbjjnQng15
 Y8q/W15XCfmhuGaI7X++mnhgEqzWC1RRiVNYC2WXTcOZvI0BkHv5kmHSDb5gJYoK8a9Q
 W1nh/Q6kLzLUZosOSnCAI2esXxPW2v39Zf2j6hUyMEbP3eQnVoi6tccpw4J+pntZtfR/
 yIoygiXvdgMlM7XS2v8mi1lTykacwTsFki9s69bkNWahXOUkKo7eg6J8n45eTCxkBW22
 5dtRuUc4Z4/ggmYWmDtnANLCfUzNFzYlx/N/HkndyxWrS4YjokXbFoFBScvyLRMeNrTe
 /oNA==
X-Gm-Message-State: ACrzQf3EnCZfq46uh4QsGiCW2IV1t9wDTemo6WBS+QTVm+ko5cBzEgiq
 t9zt3jbTOpL29+WR1jimwSlWuH3yWCHshg==
X-Google-Smtp-Source: AMsMyM7FsNL2xu1mY+2UXUcqgYcpykYzmOLaV7io4QuN4THUsTf852+wm1keArpVo2ZmNqQpB2rh1A==
X-Received: by 2002:a05:6808:ecc:b0:351:5b2e:e161 with SMTP id
 q12-20020a0568080ecc00b003515b2ee161mr5504072oiv.259.1665085684954; 
 Thu, 06 Oct 2022 12:48:04 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com.
 [209.85.161.41]) by smtp.gmail.com with ESMTPSA id
 k13-20020a056870d0cd00b0011bde9f5745sm299604oaa.23.2022.10.06.12.48.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 12:48:02 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id
 m11-20020a4aab8b000000b00476743c0743so2124343oon.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 12:48:02 -0700 (PDT)
X-Received: by 2002:a05:6830:1e43:b0:660:fb97:9313 with SMTP id
 e3-20020a0568301e4300b00660fb979313mr648468otj.69.1665085682355; Thu, 06 Oct
 2022 12:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
 <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
In-Reply-To: <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Oct 2022 12:47:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
Message-ID: <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Alex Deucher <alexdeucher@gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 6, 2022 at 12:28 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Maybe you are seeing this which is an issue with GPU TLB flushes which
> is kind of sporadic:
> https://gitlab.freedesktop.org/drm/amd/-/issues/2113

Well, that seems to be 5.19, and while timing changes (or whatever
other software updates) could have made it start trigger, this machine
has been pretty solid otgerwise.

> Are you seeing any GPU page faults in your kernel log?

Nothing even remotely like that "no-retry page fault" in that issue
report. Of course, if it happens just before the whole thing locks
up...

                   Linus
