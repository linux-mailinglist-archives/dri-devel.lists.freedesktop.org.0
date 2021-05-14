Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567838191C
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 15:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A837B6E405;
	Sat, 15 May 2021 13:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F07A6EE8F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 14:12:02 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id f18so6944144qko.7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:cc:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Jwd1P1JHHf9PFyiIr+/zIkvbqGvzxkc5EOYFoSXG/cc=;
 b=GnfmSUUgE8e3pRIoPt+8zGnFtlQqa4HIXpmlO4vOt/zSkmlSR3ZCUIl6qWQrnimTEt
 YdujpPnu7mL4+XUlaTsqUMyWHIOdozU7pe5SIYy79oVQXDT5SgIVzcjqNlKM45TT2slb
 G+b+nxBqVSA/nyaEYzC8UJKZ+BfFo2fXDEWu+XMc1fg73l4rTQWLDrcjEfRi0NU5uXAE
 wV125438oaRa8bAGpq3jwhgTr+g1Taza7wrs3mFFmaH2lo+E/GiLL8PEUgu/nQuCcSdM
 ihbDObH83jDtfixgpumGgOy2TOY0Gf+EQ8pcO9IwNk1H6vA4WDrpp5Lu7zzi4PR2rWka
 LREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:cc:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Jwd1P1JHHf9PFyiIr+/zIkvbqGvzxkc5EOYFoSXG/cc=;
 b=M/c2mZqEoe6dkDokJBEMEXxruBlLnxSo+sF9W74FOFBpEGfQ2+AbbbTIkH2rjRFQka
 m+BIhjCsWojm+5372nF34wvkguk+sNoWuWFXkIMrO9PlKfi68k08ifta0lc6Ru0s9ujE
 ttG8ytC/WFNUt9akUBtUQpGC/+RHYpsYCCTuhbSBb+cMstF0KNf3yPN7lfSTvDSZ0sz0
 NoZFgR4bpYgidCk5ebCw25Jc7iQ2TNFkrC8yEmR9+8elS12ka02W1lWkfFx0UtbfFi1A
 v8gxAXgirhPSzg29nksCMSgNQqd9D9e7nP24MVLoclGdMpBEZwU2M3/ql22fI+tEaXbj
 H4RQ==
X-Gm-Message-State: AOAM532yb4ID05h46gopkbrdzVes8rREKe3FQJERX+VH74YGIwsm7q1G
 1d2mI1v7UOqqWWkBvK47hGwQq8BbrXONEA==
X-Google-Smtp-Source: ABdhPJxerWa6xZdyNiwrGEblWJgWcOVaqKmW+9tecZxGpN4xfZgN08kGafoeC1ivQU7/PrutK6D1Fg==
X-Received: by 2002:a37:6891:: with SMTP id
 d139mr44052291qkc.466.1621001521243; 
 Fri, 14 May 2021 07:12:01 -0700 (PDT)
Received: from ?IPv6:2804:14c:125:811b:fbbc:3360:40c4:fb64?
 ([2804:14c:125:811b:fbbc:3360:40c4:fb64])
 by smtp.gmail.com with ESMTPSA id g6sm4495207qkm.120.2021.05.14.07.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:12:00 -0700 (PDT)
To: adaplas@hotpop.com, akpm@osdl.org, jsimmons@infradead.org
From: Igor Torrente <igormtorrente@gmail.com>
Subject: Mysterious operations in sysimgblt.c and sysimgblt.c
Message-ID: <027b5b6a-54ea-37e6-7b9f-26f4bad29514@gmail.com>
Date: Fri, 14 May 2021 11:11:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 15 May 2021 13:35:18 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everybody,

I'm Igor, I'm participating in the Linux kernel mentorship program and 
working to fix some bugs found by the syzbot. I'm currently working on 
this bug below:

https://syzkaller.appspot.com/bug?id=071122e4f772c1ec834c7a6facc0b5058d215481

The bug consists of an out-of-bound access of an vmalloc vector at the 
imageblit function.

At this moment, I'm trying to understand what is happening between the 
IOCTL and the imageblit function. I tried to follow the commit history, 
but even with the entire history, and after reading the code several 
times, I have no clue why some operations are being done. Operations like:

Lines 148 and 177-180: 
https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/video/fbdev/core/bitblit.c#L148
Lines 251-256: 
https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/video/fbdev/core/sysimgblt.c#L251
Line 190: 
https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/video/fbdev/core/sysimgblt.c#L190

Anyone know/remember what these operations are doing?

Thanks for your attention,
---
Igor M. A. Torrente
