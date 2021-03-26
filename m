Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E2834A504
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 10:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB226F39E;
	Fri, 26 Mar 2021 09:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6DA6F39E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 09:57:17 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id g10so655568plt.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 02:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IV75pZ2r/lTsGbcVB2HXKVQUuEN280uU9C5RzK68fYU=;
 b=Q3rWXH4gNK6ohJquLwTkSl66Qdoxp6MTOgiXSDiftgNaBe/5H+stw2V/iZ+pl35nVc
 B/QZKZFVXGmObWTqMrfutIeevZt2Ht5zWHTPj6WFFw3kQwdVuoEU3e1fsIyiSJYjHHHg
 HC9nhqFM9YOuRLJZVNqydWrEVjC6spa5H8BcN1P0Rhee5XzSeEFEUn+U7SC9wUpf+Ny7
 YvRfaMgXAHZ+NluNeUtlO9mlqL/2AKFSkMLRW4v+sz9OfgJkfXjbILveGHRMY/aFSz4f
 9m0hEJ8tssrD4d2h73/PlM0qWRwIE3Ac4aBKsZw11/ygsZhBGJPgP8L3829shuktto1J
 f+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IV75pZ2r/lTsGbcVB2HXKVQUuEN280uU9C5RzK68fYU=;
 b=DGOtj4rwRD14ZusJaPIlO/1Q//4RR9Idhz1CA1++Fa6gxGnl4WYxn8rffB97mubvFZ
 1UP33FAg8rTYGy9OungOKqXPwWDVMSi7JDBpfpXTPP7lx2kIoHF2dV34QIA6GiJP7dZu
 HW/xcHJQ+dKE06vbJ5z1VmvUUwr1hrMtlbOG/s1j8zP01bWObhQtRGMyPATbaf4BiShV
 kCKHgOQ8B+Cn+tItHvW4hLHYkDGdSFLYJsU4qYJOBbykFNo9FVEW5DqBX7wbBzvpR0W4
 4w9KQ1yodqS5/mw1JWvRw74qHFT35y+aEnnfd1xB10gQZjCvN0T3wW3u2RhsAsvj8fOG
 iX8A==
X-Gm-Message-State: AOAM531n7jh303640EQlqwta/dUmPM1mje/ywuWKoQoqApCoa+Xurcyn
 PISuKTOnZLimJH0MGX6KOis=
X-Google-Smtp-Source: ABdhPJwwEZXFzZ/RNYveH7mefeJwagBObcPX98zYirGFuzA6NDif9CDcB1Ouvm7REbJkongZ1JDlZQ==
X-Received: by 2002:a17:90a:a414:: with SMTP id
 y20mr12906128pjp.77.1616752637305; 
 Fri, 26 Mar 2021 02:57:17 -0700 (PDT)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id n5sm8997971pfq.44.2021.03.26.02.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 02:57:16 -0700 (PDT)
Date: Fri, 26 Mar 2021 17:57:11 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: fbtft: fix a typo
Message-ID: <20210326175711.0000684f@gmail.com>
In-Reply-To: <YF2qhUD1lz3LbEhC@kroah.com>
References: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
 <YF2dXIxMOUyLzfnQ@kroah.com> <20210326171634.000011f5@gmail.com>
 <YF2qhUD1lz3LbEhC@kroah.com>
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
Cc: zhangxuezhi1@yulong.com, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Mar 2021 10:33:57 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Mar 26, 2021 at 05:16:34PM +0800, carlis wrote:
> > On Fri, 26 Mar 2021 09:37:48 +0100
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> >   
> > > On Fri, Mar 26, 2021 at 04:05:15PM +0800, Carlis wrote:  
> > > > From: "Carlis" <zhangxuezhi1@yulong.com>
> > > > 
> > > > Change 'tft' to 'TFT'    
> > > 
> > > Why?  What is wrong with "tft"?
> > >   
> > I think abbreviations should be capitalized.  
> 
> Why?  What requires this?
Many people use capital letters for abbreviations in comments, which I
think is a good practice
> 
> thanks,
> 
> greg k-h

thanks,
Xuezhi Zhang
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
