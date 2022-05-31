Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63C539508
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 18:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B90810E68D;
	Tue, 31 May 2022 16:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D6710E64A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 16:41:44 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id t5so18337014edc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2w/DuMKGkCId0IhL+87Rlw/4m47o1ovVQT6DsHSgIE=;
 b=CjjCxMkG9BjYxKYLC9ComQadGerm0pG7maothy8LMYDfIBQ12DEXm8VahwPd0mZNx8
 v3YImB6YIt4mYYLyzpggxjSKvsKNJF/G32PfqlVOhn2iPGRIukb0lSsOPrkKTbno6a2F
 NHCRaxjzPZuwuhN/j0E7W+vBxTRDLSGYdAdCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2w/DuMKGkCId0IhL+87Rlw/4m47o1ovVQT6DsHSgIE=;
 b=b40u3Yt5OdqPzocx5qx+NohCy4tzGd1wglZHJ+/cj+Lo/5LxQEnXYSi/PxakYSa9rm
 ZaEUCu0m6qSV3zNyqO1UaeX90bAfLouyneoOEVJfAhQZr4K06iJHWRNy8oNHVSBvjpKo
 HCSrDoCUdi1a2V0Cy4rpSgI9k1ItJtmf5gki2oeeKK62d5eNkoGYPkdBL8rpR5CtwQbx
 c2hErboEujucrdWx/uEc3hwq9EZ4Av7aKZXggBmbvgCxZiBeL2iHrFUA63wNrGJPnRj7
 xUxpPM0/xpwF89v/OqowUXHksj93iGUEEo+pfpCCDeXjsC52THJFFEd3tdsi1ziOECct
 O9Og==
X-Gm-Message-State: AOAM5308eC3i8lkETjmNnhqexCxkP5V2yhBVieg/VFP0AsVxUN9lv5Sy
 sxu1JJz1AADfaYr1h4JFsQLf9RPntCVr+B6n
X-Google-Smtp-Source: ABdhPJx/Sg2ki0Ohw4ObXxuniUujYvIIFO6nFo1b3dzONs6Mn2xuPiTAcfCk7c3HrZWu5Wx/JqN4pQ==
X-Received: by 2002:a50:d7c6:0:b0:42d:5065:568d with SMTP id
 m6-20020a50d7c6000000b0042d5065568dmr22247966edj.116.1654015303109; 
 Tue, 31 May 2022 09:41:43 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 m14-20020a056402510e00b0042dd792b3e8sm3069503edd.50.2022.05.31.09.41.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 09:41:41 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id o9so8366271wmd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 09:41:40 -0700 (PDT)
X-Received: by 2002:a1c:7207:0:b0:397:66ee:9d71 with SMTP id
 n7-20020a1c7207000000b0039766ee9d71mr24513934wmc.8.1654015300146; Tue, 31 May
 2022 09:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
 <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
In-Reply-To: <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 May 2022 09:41:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
Message-ID: <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, Viresh Kumar <vireshk@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, David Airlie <airlied@linux.ie>,
 SoC Team <soc@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 1:04 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> As an experiment: what kind of results would we get when looking
> for packed structures and unions that contain any of these:

Yeah, any atomics or locks should always be aligned, and won't even
work (or might be *very* slow) on multiple architectures. Even x86 -
which does very well on unaligned data - reacts badly to sufficiently
unaligned atomics (ie cacheline crossing).

I don't think we have that. Not only because it would already cause
breakage, but simply because the kinds of structures that people pack
aren't generally the kind that contain these kinds of things.

That said, you might have a struct that is packed, but that
intentionally aligns parts of itself, so it *could* be valid.

But it would probably not be a bad idea to check that packed
structures/unions don't have atomic types or locks in them. I _think_
we're all good, but who knows..

            Linus
