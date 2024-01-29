Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5586E8402AA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7425E10FEA3;
	Mon, 29 Jan 2024 10:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A7510F40B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 10:17:41 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40ef64d8955so7133625e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 02:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706523400; x=1707128200; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NKy2gXfjJl67cLJ142YEpKmEzsXs/wjVnlS7KJyhEVM=;
 b=bXs3lBG0uMYdFxm1+fgfR2j6Zj/64PBvAMDx1KCqzcxKJztp7j1nyc/MeYLOqc7ohc
 WuSpUjMUwO2hNw6qpGbfwV1waq3Mfnv3hJ4FQ5nunbab84B1qmloDObdlWOPJk/70oZT
 o+kxH+4Os0MOa8Omb6eBJG7gnGnq/aBJrZ70o8y4bNV0GapPqcq3nlNaNgcavRIAOQO9
 GeGQgZSuDjOFnPSKGaNZdepINn+VpWNy1GJlnrOGV1Fx1ZLaHBM/8PCgVFoge1k+5pXh
 KTaczOg4NURbwZYK2URIF5xsczbQOgbFH2p6oeEtwOr6UXa5PzkkpCAhS1R7v7/2LaaF
 xgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706523400; x=1707128200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NKy2gXfjJl67cLJ142YEpKmEzsXs/wjVnlS7KJyhEVM=;
 b=oAPpxjfWtqvJTdvjSOz0Iz5/+vRosU7FBqSNPx1FnPZG7VsdLCP8/hmrpcUyy8Lj4i
 QDtGE8Dtg3yDEf+mAn2BNQydKQwm68/a0POpmbCUJa22ypauyAXBdDhK8L+8cTZs8BM7
 Ch7paY+0+Dps7r7BOsBdIlvA5TQtLGcFBsGyXSK3KODM1+vLsVDe+75he4gdPHlzUXCX
 uyuZTXLEXY6snFXj6zUCOcTl1vX/+JOE5X4SPyAPru+2CJzDJ8sdaF8pXTQk7/YpDCN+
 AaCmKzK0vvm7itBfjRCaM5wYdLt54u0EyZ05cOrtxWoFNJc542i/6pD+mg0VunI93mUP
 dx5Q==
X-Gm-Message-State: AOJu0YwOzEFNlDVgNUETKb8/X1XuHCghq/m40s5SNmkq/NtEnu09g1Sg
 e49h2mGctoOh7z9ml6GQXEe0Hek5W4FOv9/N8paqJ/lL6sXCqo1RmEZ+RRQTLjg=
X-Google-Smtp-Source: AGHT+IH5bjN8ErIkVNKTlTrzFnhf+0GWnSJB3KhJvYnwW8dR3tdpM+mdQ3RTeCDlNT0u0sOij3Dtdw==
X-Received: by 2002:a5d:438e:0:b0:33a:e478:94a6 with SMTP id
 i14-20020a5d438e000000b0033ae47894a6mr3466412wrq.31.1706523400116; 
 Mon, 29 Jan 2024 02:16:40 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 cl10-20020a5d5f0a000000b0033aeb20f5b8sm3292519wrb.13.2024.01.29.02.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 02:16:39 -0800 (PST)
Date: Mon, 29 Jan 2024 13:16:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH next 10/11] block: Use a boolean expression instead of
 max() on booleans
Message-ID: <6eaa0f91-104f-4efb-9ea3-7c7f21e75842@moroto.mountain>
References: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
 <b564df3f987e4371a445840df1f70561@AcuMS.aculab.com>
 <87sf2gjyn9.fsf@intel.com>
 <963d1126612347dd8c398a9449170e16@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <963d1126612347dd8c398a9449170e16@AcuMS.aculab.com>
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
Cc: 'Jens Axboe' <axboe@kernel.dk>,
 "'Matthew Wilcox \(Oracle\)'" <willy@infradead.org>,
 'Netdev' <netdev@vger.kernel.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>,
 'Christoph Hellwig' <hch@infradead.org>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 "'David S . Miller'" <davem@davemloft.net>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 09:22:40AM +0000, David Laight wrote:
> From: Jani Nikula
> > Sent: 29 January 2024 09:08
> > 
> > On Sun, 28 Jan 2024, David Laight <David.Laight@ACULAB.COM> wrote:
> > > blk_stack_limits() contains:
> > > 	t->zoned = max(t->zoned, b->zoned);
> > > These are bool, so it is just a bitwise or.
> > 
> > Should be a logical or, really. And || in code.
> 
> Not really, bitwise is fine for bool (especially for 'or')
> and generates better code.

For | vs || the type doesn't make a difference...  It makes a difference
for AND.  "0x1 & 0x10" vs "0x1 && 0x10".

regards,
dan carpenter
