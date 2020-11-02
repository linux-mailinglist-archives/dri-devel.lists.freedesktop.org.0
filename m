Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F92A28D0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 12:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E756E4B7;
	Mon,  2 Nov 2020 11:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EFE6E4C1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 11:12:57 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f38so10511492pgm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 03:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qCgiqZXGNwvNh2nZMtUDnqrlrZqGGd0+W48CRCFS5Bo=;
 b=g3oyj/8BectFHMWdpOJLUmTdLl6ao46UPyBqt4FGqyBVKmWGt5uTsIVrZlIeUg1kKp
 BBgtWX3kj4FS86SKaIeAwtMdHwt92nFpIAVanSryUOtS79J+OMzAjXRuwKG7yRz4Q2Jd
 2YqA+/Rr5omjYftodpgfkeo2fVcimWdr9Jty4R5BaiXWsIpYYbdvxyxNOt83QtgY1Em8
 nkFfjzgRFv1w4XLjnRsfzoTnaxg0gl6R+7Kt4wD0XKpn9prfm6SeaZyIjvU+i9TjGvvR
 mKotJYuoYwAmT7GuZn9jTBKaZtrrWzYZMqWdL9nsHHVapaaDei+Htw61qhtLV7EF9d8E
 5+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qCgiqZXGNwvNh2nZMtUDnqrlrZqGGd0+W48CRCFS5Bo=;
 b=A81c5dG4jG5Y9tax+R2k5IYTaINR0Ap9xXLBi1oUUMPHVTxmI3M6ni6+5lWuAeT5MC
 cfpusKnKJgp6KvYvgJWFYOX/SubwfDMidiPO8aym3Z3XXU8eOMAmtnYZe/xcT77vpfGY
 mLrTadc3CONcNPla+OoD+RWqSN2SPPWRzt7td/7XjW/lRJTZc4voE5FOZOlZH2RLhcX7
 Lz8hLuPytZ8NFCI2YVCAcxRnEcD39eeEwcqr7DcS/d2IVLmXhw4Nfk5xcP/6aE0O1m6B
 utD7/VBfGM/gQo+SMj/Acw/YIee9V9V2CLEIwE1bHyc82soAmK4U2WGjKUjWvPP4n1ft
 diOw==
X-Gm-Message-State: AOAM531VkeuHrV7tQ8+DzKJrypKgMvGf3xsA7Tbc+X9kxQn5+scU5yXG
 FZNmZxw7krhkXO3CO0xl9g==
X-Google-Smtp-Source: ABdhPJyKj6yz7vBgyoh7xhGNMnD24Vj1loJ7dkpZAbbMnfJNoJPPQas76a/fl61lg2hFJOnMRs6fDg==
X-Received: by 2002:a62:64d1:0:b029:161:ffdb:e07d with SMTP id
 y200-20020a6264d10000b0290161ffdbe07dmr20737550pfb.71.1604315577377; 
 Mon, 02 Nov 2020 03:12:57 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id m2sm13516592pfh.44.2020.11.02.03.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:12:56 -0800 (PST)
Date: Mon, 2 Nov 2020 06:12:48 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 2/2] tty/vt: Avoid passing struct console_font_op to
 con_font_copy()
Message-ID: <20201102111248.GA1558630@PWN>
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
 <72c954371ed9b1d050901b2d498a979017de8a3c.1604306433.git.yepeilin.cs@gmail.com>
 <20201102101044.GM401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102101044.GM401619@phenom.ffwll.local>
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 George Kennedy <george.kennedy@oracle.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 11:10:44AM +0100, Daniel Vetter wrote:
> I'm not sure switching from int to unsigned just here makes much sense.
> All the console code is still using int con to index all the various
> arrays (I just checked fbcon.c code), and using int to index arrays is
> pretty standard. As long as we have the con < 0 check to catch evil
> userspace.
> 
> There's still the switch from op to int for con_font_copy, but I think
> that's better done as part of the larger cleanup we already discussed. And
> then maybe also include patch 1 from this series in that rework.

I see. I think at the moment there's not much we can do for
con_font_get/set/default(). _get() and _default() use *op, and _set()
uses all except one field of *op. Maybe we can change the type of *op
from console_font_op to font_desc, after cleaning up everything else?

Peilin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
