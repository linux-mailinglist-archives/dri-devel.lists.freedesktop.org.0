Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F1816682A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 21:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10EF6EE0E;
	Thu, 20 Feb 2020 20:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B1D6EE08
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 20:15:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id c84so3438653wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 12:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FgSsJPrG7i3H1/P1wfClm4Sm/Z2WH9l2hJI5jyBGgD0=;
 b=HHqosREl8dN4QjAFRLYj7nHOEtXkMhcO46Pt0D6Gbjhl6hOTbB/IDpmrVXYuXkAgNP
 9hiIQEQYB4TvlP1CByHq5b6DfX9ZjBuUHSNvgOyso6Dj95SMTKWIcq30JwiJ2LMU3OSv
 hN4DmnAxXVou7gD1+LMuF8qky5HB/xsZzKkKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FgSsJPrG7i3H1/P1wfClm4Sm/Z2WH9l2hJI5jyBGgD0=;
 b=pBl32aGWVEeK261U9/ikRgzVmkQokGm7aWGL5TM4qsVvtOuvMC8HUh/5A6124r+fJN
 cu3l7dtPRsVaLpVpnPI+u6fR5z0S6SZvrw4/+sbywxKrTNZOsZcYs82bAb0YrvcT2NLV
 8hcpJf/UUV67FXcm1iqMtQErMT0CPNEwOn/CvkYXJIhKVaUolBPYq3qLhg/vpKE1bNEu
 SufePiXHAi/Lh6ZQH58JKg5Jltdl3Xoy6HbXH3XYwCxIg2BJecTIEQL6PyLTcNKM73Ap
 DovBouH/l2z9kwxo0UL99Rj2Q7+lNIMjtaUaZSsssFRxvX9subAig5fATBXb9QbWOOp5
 C2UQ==
X-Gm-Message-State: APjAAAWWtdzRJlYMZjQiNS1erfEhFPinEe+agNZf49SYNmVY1WE6ysi0
 M5WqYpTwslY1z0X26Kpa7n8HlA==
X-Google-Smtp-Source: APXvYqyGHvsM2LdvWnjpzNh3zGB9gq3OQpdnC/EfNAUdMmS+m3NYGg26WGyzD6yKRi5lM6RROUGGfQ==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr6619725wmb.137.1582229700772; 
 Thu, 20 Feb 2020 12:15:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 16sm570510wmi.0.2020.02.20.12.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:14:59 -0800 (PST)
Date: Thu, 20 Feb 2020 21:14:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: jsanka@codeaurora.org
Subject: Re: Support for early wakeup in DRM
Message-ID: <20200220201458.GB2363188@phenom.ffwll.local>
References: <00e901d5e81d$fd609ac0$f821d040$@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00e901d5e81d$fd609ac0$f821d040$@codeaurora.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: 'Sean Paul' <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 10:45:57AM -0800, jsanka@codeaurora.org wrote:
> Hello All, 
> 
> I am seeking recommendations for DRM compatible methods of updating the HW
> other than frame commit path. When exiting idle/runtime_suspend, the driver
> votes for a bunch of resources including power/clk/bandwidth as a part of
> first commit handling. This usually adds a few millisecond delay before
> processing the frame. The requirement is to find possible ways to reduce
> this delay by providing an early intimation to the framework to "prepare"
> the HW by voting for the resources and keep the HW ready to process an
> imminent frame commit. Especially in performance oriented Automotive world,
> these delays are very time critical and we are working on ways to mitigate
> them.  
> 
>  
> 
> DRM framework converges all the parameters affecting the HW in terms of DRM
> properties in a single COMMIT call. To address the above issue, we need a
> parallel channel which should allow the framework to make necessary changes
> to the HW without violating the master access privileges. 
> 
>  
> 
> Before resorting to custom downstream ways, I want to check with the
> community for folks who might have encountered and resolved such issues.

Just enable the display, which will grab all the clocks and everything?
Once the display is on a commit should be possible on the next frame, at
least for well-working drivers.
-Daniel

> 
>  
> 
> Thanks and Regards,
> 
> Jeykumar S
> 
> Qualcomm Inc.
> 
>  
> 

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
