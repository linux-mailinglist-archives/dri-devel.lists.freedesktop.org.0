Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8583E34E207
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 09:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DACC6E864;
	Tue, 30 Mar 2021 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7876E864
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 07:21:57 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so8986335pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PSq6DhHZ17SSR0hD3afvhBzW8Nbjp13pkdoj8e4op4o=;
 b=Wpk7ZHmI24lbm0lREwmt4FgB+PoQmBhscx0Msy4G7nxtg+l5pzG4e/OUjGzo1LSKE7
 FjrgjY0485V1nDXiHKO82Zpetwjrgk8abFAF7Jzb4vkWhaEpLXtzVybFYyyNlJ4XRhHZ
 WPut5FzG7ATtfEcESpmDuNAq0XwNXnR77P0sA2jMJr5C3oZfTBjWd4RXC8qmFE2MgXWX
 H+V2kLeiQpSDDOT7jpbmy4k3/CNdb1siXgwIshCQZERo++4jXZ+xnAyj1D82uHb1vVuC
 kAoNs40VI8nC/eWnmMWrPSEUvvs/1tyh0eFNjlqnHvSjwXYBpuomjcG4mZRlYQbSeFil
 mxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PSq6DhHZ17SSR0hD3afvhBzW8Nbjp13pkdoj8e4op4o=;
 b=Q4/EcUHNikSsSpSj/ack+2yphfhbQim+8h2f0iSKte85DFXZo5aVjDvHeYd/729Mhz
 cIB32thbcUTSXl6uIWJRNF6sjIJIlS/UHgup/v080eyJQkxJNeKAPJWtQBzgmvWupTY7
 aQoOq+0aD0e4420lzlBiUSfXGj/kTubm+ZNCKzIJB14/UMu/lVxHRu+fMyc2VDFt872m
 ThOtjTyYl/1eOkwrldHaAxeqMoUYBhrGBUTvL8bffzeLBkaLMSG0GoI67QuyhP41ExiU
 UVqBQ9lc/VSBamIFQE/bezbFkLNRM5hXdnLFCWK0KoqRrwjPhtt8t6ZTveUMJ9mKIsLA
 6cfg==
X-Gm-Message-State: AOAM531T35FoQY/0ADpI5gQxJ/UHu6ynqqhjeG+3nlVbUGgcnD8Y/t9m
 riE6uXY1+yrZkPtEUD/Fy5c=
X-Google-Smtp-Source: ABdhPJw7q0qHayC7JzyVW5ZMjugnrrDfPnEQJVDhEmuAyth8iyBCeEU1jHDc8WZ4FOlsl4iQPQphCA==
X-Received: by 2002:a17:90a:a898:: with SMTP id
 h24mr2962057pjq.9.1617088916998; 
 Tue, 30 Mar 2021 00:21:56 -0700 (PDT)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id s19sm19612940pfh.168.2021.03.30.00.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 00:21:56 -0700 (PDT)
Date: Tue, 30 Mar 2021 15:21:52 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: fbtft: change '16 bit' to '16-bit'
Message-ID: <20210330152152.00003f82@gmail.com>
In-Reply-To: <YF3rt28vKzt7CDIh@kroah.com>
References: <1616767770-70063-1-git-send-email-zhangxuezhi3@gmail.com>
 <YF3rt28vKzt7CDIh@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
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
Cc: zhangxuezhi1@yulong.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Mar 2021 15:12:07 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Mar 26, 2021 at 10:09:30PM +0800, Carlis wrote:
> > From: "carlis.zhang_cp" <zhangxuezhi1@yulong.com>
> > 
> > Change '16 bit' to '16-bit' for a same style.  
> 
> Why?  This is up to the author.
> 
> > 
> > Signed-off-by: carlis.zhang_cp <zhangxuezhi1@yulong.com>  
> 
> Please use a real name, not an email-alias as a name.
> 
> thanks,
> 
> greg k-h

OK, i will undo this patch

thanks,

Xuezhi Zhang
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
