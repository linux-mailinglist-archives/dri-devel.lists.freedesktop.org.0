Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A76181A6D76
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 22:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC07889B7B;
	Mon, 13 Apr 2020 20:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3E089B61;
 Mon, 13 Apr 2020 20:42:46 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id bu9so5085191qvb.13;
 Mon, 13 Apr 2020 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1mj+zoPGRVqWrxi/vvLzrvA5AEZNWCyvl7tzM/qPtFc=;
 b=LnaJmW1uo4IPSACFJhtZVeJJPJqKj/pM31yQfUa02ZWgGNFDHIiEM2viym6/A4Jwip
 H/SvYmxHQi7Z9abTF87JeF0/6e2mBCiXgPdzGlMOGf8h7briaICgskM7jliuRQ8A62ek
 F2JsJozQ9zM2I25fdUTTgm/ODu7EFug955vlNzj4qco1jLzNs3uLWWGp1R3Hii6Qncmc
 JAk/A5lVYsfI91a+fJc0JECEocip8W6LuGOibiUay5oFDSNhb+KzC0O6e32Uip/MxbET
 0y6tz9QOvyz0V1i914snrtmCmeF+/7VTjiY78yznKfZLzCgk0Rwzy2RP13YdOLjkIIWV
 ao/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=1mj+zoPGRVqWrxi/vvLzrvA5AEZNWCyvl7tzM/qPtFc=;
 b=JY5qW0qEbNjixahr21Oi9O28DWERRJprX69lHbo7zO7qfVy367zl4ltP2iO8Rq/9vF
 zglUgIM7juVyEWO09kjOOW0ypi6nlv5/mdCFYFlkQcp0x3ehd8GlghSZUNe+nkB2ln/5
 9ltlN9rN+xZ8hL7nI11uRTW6yNETySj6+TrvUi3f+g6WPLxRL+jms8EHHM0HcguFIVDd
 iDWRl1xPms4bubQPUKqfM668UNOX6AO9rmEedw3RHMcDA+HQO0g/jB8FNLbO9YGX3RA+
 GVd+taTRIgHaEpdEsD/d0919L4y2bk1aZFzHrXdorRu6sze9F1son5tyJNJw80g5pnt9
 YX7Q==
X-Gm-Message-State: AGi0PubHwKFS8V+oehxX4oGKJ2rll/F0V97ZfaakzdaRJYLrQ0E4Uu8y
 cC7WkbfCw/iLSA5FoKPXk5s=
X-Google-Smtp-Source: APiQypIyKqzTfr7aXMKcUHjgucIatzgk06mFeQ4P6AU7xMuMjtSMR7m3JauQN/p39x+cCVx/GxM3fg==
X-Received: by 2002:a0c:df02:: with SMTP id g2mr5818617qvl.115.1586810565321; 
 Mon, 13 Apr 2020 13:42:45 -0700 (PDT)
Received: from localhost ([199.96.181.106])
 by smtp.gmail.com with ESMTPSA id 63sm3743142qkl.64.2020.04.13.13.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 13:42:44 -0700 (PDT)
Date: Mon, 13 Apr 2020 16:42:43 -0400
From: Tejun Heo <tj@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/9] drm/vblank: Add vblank works
Message-ID: <20200413204243.GL60335@mtj.duckdns.org>
References: <20200318004159.235623-1-lyude@redhat.com>
 <20200318004159.235623-2-lyude@redhat.com>
 <20200318134657.GV2363188@phenom.ffwll.local>
 <e4fb0c39ec024d60587e5e1e70b171b99eb537f4.camel@redhat.com>
 <faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com>
 <96cb912809f99d04cd5cdd46c77b66b8c1163380.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96cb912809f99d04cd5cdd46c77b66b8c1163380.camel@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Mon, Apr 13, 2020 at 04:18:57PM -0400, Lyude Paul wrote:
> Hi Tejun! Sorry to bother you, but have you had a chance to look at any of
> this yet? Would like to continue moving this forward

Sorry, wasn't following this thread. Have you looked at kthread_worker?

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/kthread.h#n71

And, thanks a lot for the vblank explanation. I really enjoyed readin it. :)

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
