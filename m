Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB0536CC7
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 14:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F6310E039;
	Sat, 28 May 2022 12:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344BB10E039
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 12:13:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so5913528wme.5
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 05:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mNWkEQxztGAhGpLE9wPG3tVmhXvaKJfP7n8Uzm8Bfkw=;
 b=o9WofFj3GcLbd+k+AYKA1UTxb45ypSG2boO+2oiAK7SNNOQ/Ty0npbI0vcWkhRLHdb
 GjhopuD9/iRAftrX/lu1dQBlnkoTu8UKJJHc4Qf3IZ0j22MmsmA146pzgWNTi4VCgJAo
 FivfWqDdOjsjKfbTRNIuYtG4YjavKDSRP6LBjYxThm8Hxhly5mzKnmbabDoSb0RbGuvy
 7L7j9LApPKZkQJUpgxuq1ZSW2d/pEvjhmNgUYWPO6FdEOn5gl8dOxZhniC45akGfvC5v
 6ArW94J3e6eiq8+91roYXcGCC3XIJM940Ik03ScgLa4XkAv9nN4wInUA9vmuc0T0OSd5
 V+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mNWkEQxztGAhGpLE9wPG3tVmhXvaKJfP7n8Uzm8Bfkw=;
 b=3b3IsH4wvhTX0uXhfks9Sr3fWiFaPhWsM+ZLAR0iw3aAFB6mV0rAIQQ3E3kjHrEzap
 XFV2zN+xTJyF2539k8isWrT4vsG+jvw0y/5+UUadOaRpSuNekwAlRY+QwkrUnJ+2Mfop
 5izbN77hQlK+I3mHOexmd6aKkjUs92UdH2mwms4kkRwBPgM+6Et5gCwPld5juaJS9puS
 e5XebCMA5gHIbUTyOFSZO23hcTnNXoCSgdMP1FT4YafuJjo+78T0MeXFsksj7nvhKvnz
 2PP6bUHnjOG4uLPaKiQSD8TKZ4BcLRKsUuFnlEqDAipQlcAYZOf9htDanPog8GGRBg+t
 d6Zg==
X-Gm-Message-State: AOAM532TxaJefX/oRhnTgA1SKWQAaE3Bi70G6IMopaJ7vTEfLsBo4cck
 CdoP9pQIyflMfRCeQmm8bgw=
X-Google-Smtp-Source: ABdhPJwSesuiohtxkUoHbYH8eErO2XjkbMpb70PMEusTxdlGejP/SYYtqgq55+BC7kt8MImi3WSkog==
X-Received: by 2002:a05:600c:4e4d:b0:397:5009:bcf1 with SMTP id
 e13-20020a05600c4e4d00b003975009bcf1mr11091743wmq.66.1653740013611; 
 Sat, 28 May 2022 05:13:33 -0700 (PDT)
Received: from debian (host-2-98-37-191.as13285.net. [2.98.37.191])
 by smtp.gmail.com with ESMTPSA id
 az18-20020adfe192000000b0021020517639sm1420829wrb.102.2022.05.28.05.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 05:13:33 -0700 (PDT)
Date: Sat, 28 May 2022 13:13:31 +0100
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
Message-ID: <YpIR67FMtTGCwARZ@debian>
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
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

On Fri, May 27, 2022 at 06:04:14PM -0700, Linus Torvalds wrote:
> On Fri, May 27, 2022 at 4:41 PM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > I just tested with various values, sizeof(*edid) is 144 bytes at that place.
> 
> Hmm. What compiler do you have? Because it seems very broken.
> 
> You don't actually have to try with various sizes, you could have just
> done something like
> 
>  int size_of_edid(const struct edid *edid)
>  {
>         return sizeof(*edid);
>  }
> 
> and then "make drivers/gpu/drm/drm_edid.s" to generate assembly and
> see what it looks like (obviously removing the BUG_ON() in order to
> build).

just tried this with
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- drivers/gpu/drm/drm_edid.s

> 
> That obviously generates code like
> 
>         movl    $128, %eax
>         ret

and for me it looks like:

.L1030: 
        .word   .LC40
        .word   .LC41
        .word   -1431655765
        .word   .LC39
        .size   drm_edid_to_sad, .-drm_edid_to_sad
        .align  2
        .global size_of_edid
        .syntax unified
        .arm
        .type   size_of_edid, %function
size_of_edid:
        @ args = 0, pretend = 0, frame = 0
        @ frame_needed = 1, uses_anonymous_args = 0
        mov     ip, sp  @,
        push    {fp, ip, lr, pc}        @
        sub     fp, ip, #4      @,,
@ drivers/gpu/drm/drm_edid.c:1573: }
        mov     r0, #144        @,
        ldmfd   sp, {fp, sp, pc}        @
        .size   size_of_edid, .-size_of_edid



--
Regards
Sudip
