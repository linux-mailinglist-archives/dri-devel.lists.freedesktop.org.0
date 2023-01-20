Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 839EC67582D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 16:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B3910E107;
	Fri, 20 Jan 2023 15:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7F710E114
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 15:10:27 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id e8so4352217qts.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 07:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3qynH7wRRlnqTqa2NIiMdtT+b1iluHvbfZvKdXE4uF8=;
 b=AOxownWYi1lRgUTXvK9o54UKSBae7UVLgmMr12UgRHKs42DWHSP3bGyWesy0YD9DdO
 KdCKIbl479liOXVSdm+8ZVN7ZXwEErbpOBc9aVzGR608vshsSJt51MWmPbH4YcSWH7Wu
 h/Ia/2EEYh6zx1ljxSMZ8xsJeHcapUz6gPIPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qynH7wRRlnqTqa2NIiMdtT+b1iluHvbfZvKdXE4uF8=;
 b=LZCWfh79L/y6Cmt0H8zVYfSb2dN9nfq5u/2ooAAUNtPhJY3Djox0bkNv3DfiXiXX8s
 0PwyYDHhQxGJC1DxaTyRT6Y5Jjeq+eyDOM78tbSIbissURPAaOtPtlcE5d/KAiTH2w4L
 WAalofjifzsB4TmHD/RrSdtYH5nSzZ296B5JFUL1v0OZA8thk6bUXZ4jduK4aP6PDIUh
 hdGFElzf7H6p8REriLtA1tb9BB95PNkcHNJH6E+k1KZfKr9HTh9okik2rqGquaehdkwV
 ffu6nNJlPSutAQNM5+n4I0Lx5N1+v7lsrD/AYgd4Qxzg9b8OZbfKPAtc5KJOAX8Tivxy
 WwDQ==
X-Gm-Message-State: AFqh2krX29dEDSSNzC3V0qy/fpZj17u6vmo1mVHGyccrhYOa+A45Lzpc
 +quPeuIyH78BIR32KWyttVrPBQ==
X-Google-Smtp-Source: AMrXdXuZEDWx9RpG93Q8i2C8MXF9ZEaEQMBHhvpqOaUuYD6TE0O7mJk8AO2PqUhi2thJTS1H4LwujQ==
X-Received: by 2002:ac8:730a:0:b0:3b6:3a71:e939 with SMTP id
 x10-20020ac8730a000000b003b63a71e939mr21813597qto.7.1674227426855; 
 Fri, 20 Jan 2023 07:10:26 -0800 (PST)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
 by smtp.gmail.com with ESMTPSA id
 cb15-20020a05622a1f8f00b003ab43dabfb1sm7786009qtb.55.2023.01.20.07.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:10:26 -0800 (PST)
Date: Fri, 20 Jan 2023 10:10:24 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: pr-tracker-bot for drm subsystem?
Message-ID: <20230120151024.nflfvgl55wfl6ppj@meerkat.local>
References: <87a670spdw.fsf@intel.com>
 <87a62dadi9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a62dadi9.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 tools@linux.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 09:09:18AM +0200, Jani Nikula wrote:
> 
> Konstantin?

Sorry, I didn't mean to scholz you around. The pr-tracker-bot is very much a
bespoke solution for Linus, so adapting it to other subsystems is not very
trivial, which is why I've been sitting on this request without any movement.

The code for the bot is available here:
https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/pr-tracker-bot.py

I can take a look at it in the future, but at the moment I'm still not able to
work on it, sorry. :(

-K
