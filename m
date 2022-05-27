Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D697953673D
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 20:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CF710EED6;
	Fri, 27 May 2022 18:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0512810E68E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 18:56:41 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id d22so6502278edj.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 11:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RfwT51YIqiYd5ibTdUamz1XGFhmTQ28EDmG0aaTf+6c=;
 b=Zd43f84anz/1MDnBpNRhme0VM/VDM9efZyg7kzvwJCIPRe7WsoHX6NZEhlRRDgh07F
 CCeI2EYNvK8lwhIjNU81XIyx4oJ4aco7cSoQqCaK3/N8YOd0PmWmcofuENeQZITKhs69
 ZoL9O8f+NtvFHmnkQR5B5xBjvKdlpQhw2b4BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfwT51YIqiYd5ibTdUamz1XGFhmTQ28EDmG0aaTf+6c=;
 b=s+cxBeQHWEWmZisu47/utRVsI2SdLd9lt7IVpw+cyPPi7cFOEAQwS7kdXDJXqbSKob
 fBd+T0a7jTfF/dqosi+klj7LjlGQUJfuVRvlHqYLjySu8+EKhikTPJg1/IOUtT1onNBy
 XKoGTM09ixn4AqlobZhrJfxwHFkw0BUuKoIjpHs6R9Wofc7TCUVK/XsfWlSTLfDAZZpo
 QFbdPoU9lXA4j7ds0VvjXoQCVSe8azlABrbBH2DqAOV7dChFewtynG8ARIx41SEgBTxD
 s5HG3pZEtoajKSKv4EAM3RC4hytYDivmwfLgzrJ/cgDkLsiShhB3Cauy+NM1DWu/iV0c
 6aww==
X-Gm-Message-State: AOAM531M3DdLBZm5VOo4AgnjlpJMqcy9U4rvmzUtO+DSchBjgmMAUjPr
 VNc9wOF5lZjp5EujLF3WLyUPITc0172QWZDJ
X-Google-Smtp-Source: ABdhPJxqiDJN8/x4BxZ4auxWdBxUafs4PCix0PN3yw++HTziHo2eHAMg78jP9uw+AWfMtKb7WRIELg==
X-Received: by 2002:aa7:c615:0:b0:42b:cdcc:5844 with SMTP id
 h21-20020aa7c615000000b0042bcdcc5844mr13947981edq.312.1653677800194; 
 Fri, 27 May 2022 11:56:40 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 h13-20020a170906590d00b006f3ef214db3sm1720533ejq.25.2022.05.27.11.56.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 11:56:39 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so3212765wmz.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 11:56:39 -0700 (PDT)
X-Received: by 2002:a7b:cb91:0:b0:397:3225:244 with SMTP id
 m17-20020a7bcb91000000b0039732250244mr8295511wmi.68.1653677798704; Fri, 27
 May 2022 11:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian>
In-Reply-To: <YpCUzStDnSgQLNFN@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 May 2022 11:56:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
Message-ID: <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 27, 2022 at 2:07 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
>         declared with attribute error: BUILD_BUG_ON failed: sizeof(*edid) != EDID_LENGTH
>
> And, reverting it on top of mainline branch has fixed the build failure.

Hmm. That BUILD_BUG_ON() looks entirely correct, and if that sizeof()
doesn't work, then the code doesn't work.

I'm not seeing what could go wrong in there, with all the structures I
see being marked as __packed__.

I wonder if the union in 'struct detailed_timing' also wants that
"__attribute__((packed))" but I also wonder what it is that would make
this fail on spear3xx but not elsewhere.

Very strange. It would be interesting to know where that sizeof goes
wrong, but it would seem to be something very peculiar to your build
environment (either that config, or your compiler).

                 Linus
