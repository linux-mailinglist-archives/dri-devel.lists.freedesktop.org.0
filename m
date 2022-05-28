Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 787C453698C
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 03:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD45910E1E9;
	Sat, 28 May 2022 01:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62D810E1E9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 01:04:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id q21so11587634ejm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 18:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/a8ecIYHg7QlH35fGGSVeTBLl6RR/RV9nck1HQAe+N8=;
 b=SsVTwOnhWJT6nMnX54zeDkwThE54QCBhjL5oOAtESV+ElK1rhuZi4yfjiIkJid5QVn
 oPRMlhPY9Ha+TivafeKHuoBSIFj52kqDM9s2LYRerxU1+rtPdhzC1Z11bpZ1PJ4rVfpk
 f8tVQQp7rCAJPhDmpX2a9i4lP3pbTSoBarH80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/a8ecIYHg7QlH35fGGSVeTBLl6RR/RV9nck1HQAe+N8=;
 b=Zzf2rEfdttcgYUhGDFVR25wH7ZC0GW0wCoZ/RtTs6Jr2iq9EP49WnJbSwuZEwlXONR
 6QM0Fs/XI6nOgzaEuybt50pr8Cq337meAGTbE2AWm8RMHtC4+FiMqSG+OpGX8CcClkVl
 pPVSVgJN04Sp3jdtb/8tK6/+Xh7mK2W5KV3IvB8d9P/ubqm3OETZ892kQM1fYbFGpNjL
 FIFortHE8SBVfYXYih3FuEF4A0iW8MWWwhAmZaPsT9wZRz7tPdraTU5UntjyWgDnOZrJ
 R1uw6UAJiwS8WxdS8nR6UOWInTi/N2h2FysOaSv304whwL49sVzZke7S52Z5MGmGMwGa
 2osg==
X-Gm-Message-State: AOAM533/WR21eWboVvn8dWYNeDjq/ZwYy+FjG9y4FW24jySqpLPbiicD
 /z1feI9hCm2h8TJY7WgnYq4+EjNTxo3ec/5T
X-Google-Smtp-Source: ABdhPJxlVeoLfWW1Qdm/ijVOJUhVGVbnFRM6AWwL2ha2xyz46efBgGIKFvF8NEqFWHwaUSeszjj1lw==
X-Received: by 2002:a17:906:5251:b0:6fe:98cb:d1 with SMTP id
 y17-20020a170906525100b006fe98cb00d1mr39654361ejm.156.1653699872689; 
 Fri, 27 May 2022 18:04:32 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 r15-20020a05640251cf00b0042ab02e3485sm1320837edd.44.2022.05.27.18.04.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 18:04:31 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 i9-20020a1c3b09000000b00397345f2c6fso1051022wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 18:04:31 -0700 (PDT)
X-Received: by 2002:a7b:c4ca:0:b0:397:3bac:9b2a with SMTP id
 g10-20020a7bc4ca000000b003973bac9b2amr9089329wmk.154.1653699870656; Fri, 27
 May 2022 18:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
In-Reply-To: <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 May 2022 18:04:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
Message-ID: <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
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

On Fri, May 27, 2022 at 4:41 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> I just tested with various values, sizeof(*edid) is 144 bytes at that place.

Hmm. What compiler do you have? Because it seems very broken.

You don't actually have to try with various sizes, you could have just
done something like

 int size_of_edid(const struct edid *edid)
 {
        return sizeof(*edid);
 }

and then "make drivers/gpu/drm/drm_edid.s" to generate assembly and
see what it looks like (obviously removing the BUG_ON() in order to
build).

That obviously generates code like

        movl    $128, %eax
        ret

for me, and looking at the definition of that type I really can't see
how it would ever generate anything else. But it's apparently not even
close for you.

I suspect some of the structs inside of that 'struct edid' end up
getting aligned, despite the '__attribute__((packed))'. For example,
'struct est_timings' is supposed to be just 3 bytes, and it's at an
odd offset too (byte offset 35 in the 'struct edid' if I did the math
correctly).

But it obviously doesn't happen for me or for most other people, so
it's something in your setup. Unusual compiler?

                  Linus
