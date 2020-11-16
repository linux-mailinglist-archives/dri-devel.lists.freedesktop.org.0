Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E572B4B5C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 17:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21511898F1;
	Mon, 16 Nov 2020 16:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F804898F1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 16:37:00 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c66so14665351pfa.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 08:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=yLK0YefjqI/ofrvGLRI9PF6mEhApltQ9WFNjF4sfzTQ=;
 b=As6eHH7yhCY00UQseE1WqoSu7u5z+DnwPVBIz0Q3jbM98KsDbYfGwiykW6jyaaCBP2
 LYucuAwcR7l1l+lBqCcs65jBCOm///O05uh8ZUlKG9dcyYI0XYGwnE0jDV6Ptftpe+Gr
 u0YbFjy5HlelKyWJcbbQ1JdaAjfByM/dv+oR/emqRrgkWg+pEQ2Z+YHa3yH3nNcgMdaG
 eOzUAP0gqHIhZNohrXzEUSHnAeJnNGiBzp/cD1ORTY01XuxBtPKYKYQcKkTzR/By8TAd
 /eDx6Almi4I12MgzHzLJTnBI/E/2fcnuSKDIhDsluPzVBCzAlL26hb1AMkM/vz8bRFC3
 wNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=yLK0YefjqI/ofrvGLRI9PF6mEhApltQ9WFNjF4sfzTQ=;
 b=mJ27LuUWjMFsN7f+hHKl2BtkEoiOKzLtn+OrACLNmn5DI1NcN9c2C4DDZUpN64yBQL
 /DSKSbNpIawkvpzxJBxVDpHldsWglhInOG25zDmZMw68vm8H67pFmGe1WfsmayJCPdI5
 fJbWuGWJxAM+w8xRhpxX7wJd6AUUKT5u2hvQ9H6pKJaWJOJWfa/Bh8+qAU8NmrMyhqY6
 HqFg+MevDP3WYZyIwGvKe1GeQJ8MQyyZA454OyIezZ+BK/4l33YaUJdiZBrQsFhFwTqK
 HktlR0lraw61fDGsWCmJcp3Y1xi8rNTloywPHBOiAfKuX196OGI+2FDK1y3LNlGws3VB
 GVKA==
X-Gm-Message-State: AOAM5305uAkqrWOnHwUz+em2WkkifJMDL9hm8DrsU0XuUBuev39GO59t
 Y7iatcR43FJfEEVgY8i+zMXxC3L0p4s=
X-Google-Smtp-Source: ABdhPJy8FnC63TOw0kLsOO9973sRG/2M24oPbfARtr53E8ADKdcz/n1KwCx7bp8Id8rFZ4wpH0vw/w==
X-Received: by 2002:a17:90a:fe87:: with SMTP id
 co7mr16549370pjb.151.1605544620021; 
 Mon, 16 Nov 2020 08:37:00 -0800 (PST)
Received: from [192.168.1.8] (50-47-106-83.evrt.wa.frontiernet.net.
 [50.47.106.83])
 by smtp.gmail.com with ESMTPSA id c22sm12094153pfo.211.2020.11.16.08.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:36:59 -0800 (PST)
Message-ID: <ddbd2bb0c54863809c521c0c3b8635ba965580f2.camel@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 16 Nov 2020 08:36:58 -0800
In-Reply-To: <20201116095840.GZ401619@phenom.ffwll.local>
References: <SN6PR11MB2558D831991447B9B5C8E646E2270@SN6PR11MB2558.namprd11.prod.outlook.com>
 <121f5f8df1e56294ade98f08a943b9fbb514c5e0.camel@gmail.com>
 <45960d1f-5304-1d5a-53fd-9896e4c322aa@suse.de>
 <2a46700700085e7e2588bb8120595968aae7f8a6.camel@gmail.com>
 <e70a2528-ae5a-f855-ae77-b0bb0a7239af@suse.de>
 <20201116095840.GZ401619@phenom.ffwll.local>
User-Agent: Evolution 3.38.1 
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
Cc: "Tang, Shaofeng" <shaofeng.tang@intel.com>, "Huang,
 Yuanjun" <yuanjun.huang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Fei" <fei.jiang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> > > 
> > > Hi Thomas,
> > > 
> > > I am working on adding gen2 VM support and cursor support. Also
> > > for my
> > > next interation moving the driver out of tiny. Progress is slow
> > > lately
> > > as busy with other stuff at work. Hopefully I will be able to
> > > finish
> > > during coming holidays.
> > 
> > I see. Thanks for the update. I'd suggest to clean up what you have
> > and
> > send it for review. Having even a simple driver in upstream makes
> > it so
> > much easier for others to contribute and you'll get many of the
> > upstream
> > improvements automatically.
> 
> Seconded, once we have some basics (like gen1 only, no cursor
> support)
> landing incremental changes tends to be much easier than the initial
> driver.
> 
> So adding more features and trying to make it as complete as possible
> before you want to land it might just be detriminal to overall
> upstreaming
> speed. Usually at least.
> 

Thanks Thomas and Daniel,

I will quickly submit a patches with gen1/2 without cursor support
later next week.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
