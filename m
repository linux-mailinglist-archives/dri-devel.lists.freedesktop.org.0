Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1E130A310
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 09:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C4C6E44C;
	Mon,  1 Feb 2021 08:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAC26E1B6;
 Mon,  1 Feb 2021 00:23:56 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id h11so15556639ioh.11;
 Sun, 31 Jan 2021 16:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j+6+ulDyi6U2H4iOXB1YcmGEFxqpm4cmiSLEvcnumSM=;
 b=s1g6LEQIF+dRC17p5+kv6440BGJWxhEMy5hCfpxzKTZM8FDxRyxZjUCyPgyDbOrLDW
 U5IUIU6xdJNPdQZRxUMCW1F6bGEAXaIUDUG3ShOpg0/JgZ4/T0lNkGZp86Tj9XNVNb72
 Rsod/lgNXYeNgeX45zAROu1OswZu1yn2DDKxmCpnBnKgffFDoMrXgxrhLnQPR3pN3FXY
 RW+8zoIEwNnmj47+3cmHMKcVGFUBWPH3IOPJorf18yhDEmE8wzQJTcZ+k1Xp3To+T+Pm
 8rd+/Dre/88BjUu2Nifgn4nj2lowDigMcgsSQTXdjgpxF15X1jSucUAe4KYFamWCRnZj
 wpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j+6+ulDyi6U2H4iOXB1YcmGEFxqpm4cmiSLEvcnumSM=;
 b=TaBbzTVrOfJgbXNYdF4dT5E7w+d6/DeW3vtLZYYUTEYYPiukyIm/mzbvOMEky2dixY
 jsZOXdgoy2f/at+bFkFp+phi/OszcC8whUoi5yDLKxrgQE33oYufudy/sCI/O3dOVdhW
 p8ECA7XE9hvSsQ7Vnw2gXRBIGylXTH4ZSgVeqVxFX+wzqA3eIc5l1BZCLqULyOlJys2h
 jRpJbyGoquqVDB/PTWP6ITYOc4texMlT029VNklueKyPh5k74r8RoQHPlp/EsqiT7Coe
 DAk45QAbBPCbsTv4pZV1nPAfA+z+H5YckiYWCfPHcJcAKtt+KAPGohvG5diqs8xx9ypa
 FSkg==
X-Gm-Message-State: AOAM530uxIoDhe5LmLEGpShAkodFmygsVRg2wtHvg6HQWJFScJ1M4wrU
 G6dgukS6juZEj02jbO9uzXg=
X-Google-Smtp-Source: ABdhPJzgviUON/XVeRLneYaAH+MkQxXranKXNIXDdgdgEmilNO5S0tjJHKrvgcRM3w2tULg85ADxfQ==
X-Received: by 2002:a5d:9710:: with SMTP id h16mr4362661iol.192.1612139035501; 
 Sun, 31 Jan 2021 16:23:55 -0800 (PST)
Received: from llvm-development.us-central1-a.c.llvm-285123.internal
 (131.28.69.34.bc.googleusercontent.com. [34.69.28.131])
 by smtp.gmail.com with ESMTPSA id r1sm7874186iot.8.2021.01.31.16.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 16:23:54 -0800 (PST)
Date: Mon, 1 Feb 2021 00:23:53 +0000
From: Vinicius Tinti <viniciustinti@gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: Remove unreachable code
Message-ID: <CALD9WKyonuPTPBzLHyLGd0V+w9SQavPdv0c_nBgLOyr6_5QnjQ@mail.gmail.com>
References: <20210129181519.69963-1-viniciustinti@gmail.com>
 <161195375417.17568.2762721732398065240@build.alporthouse.com>
 <20210130123411.GB1822@llvm-development.us-central1-a.c.llvm-285123.internal>
 <161201071009.32035.9188382145053741268@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161201071009.32035.9188382145053741268@build.alporthouse.com>
X-Mailman-Approved-At: Mon, 01 Feb 2021 08:11:05 +0000
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
Cc: intel-gfx@lists.freedesktop.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 30, 2021 at 9:45 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Vinicius Tinti (2021-01-30 12:34:11)
> > On Fri, Jan 29, 2021 at 08:55:54PM +0000, Chris Wilson wrote:
> > > Quoting Vinicius Tinti (2021-01-29 18:15:19)
> > > > By enabling -Wunreachable-code-aggressive on Clang the following code
> > > > paths are unreachable.
> > >
> > > That code exists as commentary and, especially for sdvo, library
> > > functions that we may need in future.
> >
> > I would argue that this code could be removed since it is in git history.
> > It can be restored when needed.
> >
> > This will make the code cleaner.
>
> It doesn't change the control flow, so no complexity argument. It
> removes documentation from the code, so I have the opposite opinion.

The last change in sdvo related to this function is from commit
ce22c320b8ca ("drm/i915/sdvo: convert to encoder disable/enable"), which
dates from 2012.

It has not been used or changed for a long time. I think it could be
converted to a block comment. This will preserve the documentation
purpose. What do you think?

All this will avoid having "if (0)".

> > > The ivb-gt1 case => as we now set the gt level for ivb, should we not
> > > enable the optimisation for ivb unaffected by the w/a? Just no one has
> > > taken the time to see if it causes a regression.
> >
> > I don't know. I just found out that the code is unreachable.
> >
> > > For error state, the question remains whether we should revert to
> > > uncompressed data if the compressed stream is larger than the original.
> >
> > I don't know too.
> >
> > In this last two cases the code could be commented and the decisions
> > and problems explained in the comment section.
>
> They already are, that is the point.

I meant making them a block comment. For example:

/*
 * Enabling HiZ Raw Stall Optimization, at this point, causes corruption.
 *
 * Calling wa_masked_dis with the arguments wal, CACHE_MODE_0_GEN7,
 * HIZ_RAW_STALL_OPT_DISABLE will cause an HiZ corruption on ivb:g1.
 */

/*
 * Should fallback to uncompressed if we increase size
 * (zstream->total_out > zstream->total_in) by returning -E2BIG?
 */

> -Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
