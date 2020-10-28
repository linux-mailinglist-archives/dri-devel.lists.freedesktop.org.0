Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C35929CE3E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 06:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5926E462;
	Wed, 28 Oct 2020 05:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C764C6E462
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 05:43:15 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id p21so1991789pju.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 22:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ilRPL3DQy2H6Zk6HIeE59f6ZVzkXagVII22DPJDLAag=;
 b=oMgPjhgxZddy2MlRFdbHYzpkCf87TsiBUTX9Ks/FpT3aQndQx4GqWe2bP+n/EbYvLK
 G1tltXAUtW51uKPeWm+onBtFrW91UIbBqzugq8Yge5v2RSaqWZBehWsQj8RJtV73/pFL
 d6gkE0MOVrqCTFZ9MOCF8Vuw/OHrI8fmqJO0nwMxLplEKOEqIP6uE2tJ5wp6HfoZEmdd
 Cq8O68SQLUe86Aj1FuZB3sd2PzhWfvWAOn86z0G60wA3vX6KoB97+w3XzD08OI/asmn8
 jxuPOWBYul5ybPvb8jmYyUZiDSC5cNjKx0wg2DN1ileDgwWqwlqxtlcoUC4KMxA82yyA
 TMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ilRPL3DQy2H6Zk6HIeE59f6ZVzkXagVII22DPJDLAag=;
 b=ROxCe+B6cSIT9kWPKUJ/5Y49A80r8pG+muLnI4DBPGpIV7P1Imix3HTqTxBqqXL3mc
 g/nchR8MkWwepdCwSrPdidywJk9RLKV/lXG62WC5xbtHGTNQn1YQ63rQxhBjfjeGObse
 A10+4h0m/mPw4ck1GS4JHuHDwpmjovy0mVDwMYsHnMCOCaqL3ZRMKWyrRPbdEyMO+xLV
 7FnefKVt/2whvtgWKojQEN4RR/HtxQbRBZUmHZ/P7vPY+ziW96P7Lp6642fRWZLNRJNL
 YLfnQZfQpTQRqf3dlLvp1EaZmbhxM1ATYvh5crASDEwg6XZbW0OEdvQiGUW1h0pQs6jh
 ecAw==
X-Gm-Message-State: AOAM533Vi8vlGWG9VIMDk7hLTMNhbBKI6/pxKKaghmods8+uKYAR91Bj
 XIN8KZlDhSM6zbLCaaAhCw==
X-Google-Smtp-Source: ABdhPJyLn0I7cW6/sgcaJEeTzSzspFyQyOpnfBVX38qqSHlqULuJKLLKtI8EzomBKUQCoIRROFr/3w==
X-Received: by 2002:a17:90a:14a4:: with SMTP id
 k33mr5177792pja.236.1603863795449; 
 Tue, 27 Oct 2020 22:43:15 -0700 (PDT)
Received: from PWN (n11212042025.netvigator.com. [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id 10sm4008324pjt.50.2020.10.27.22.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 22:43:14 -0700 (PDT)
Date: Wed, 28 Oct 2020 01:43:07 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/5] Fonts: Make font size unsigned in font_desc
Message-ID: <20201028054307.GA1205568@PWN>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <20201027185058.GM401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027185058.GM401619@phenom.ffwll.local>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 07:50:58PM +0100, Daniel Vetter wrote:
> On Tue, Oct 27, 2020 at 12:33:05PM -0400, Peilin Ye wrote:
> > It is improper to define `width` and `height` as signed in `struct
> > font_desc`. Make them unsigned. Also, change the corresponding printk()
> > format identifiers from `%d` to `%u`, in sti_select_fbfont().
> > 
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> I'm not entirely sure of the motivation here ... height/width should never
> ever be even close to the limit here. Or have you seen integer math that
> could potentially go wrong if we go with unsigned instead of int?

Oh... No, I have not. I just thought we shouldn't represent a length
using a signed value. Also, width and height in console_font are
unsigned int - that shouldn't matter that much though.

[3/5] doesn't hunk properly without this patch, I'll send a v2 for [3/5]
soon.

Peilin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
