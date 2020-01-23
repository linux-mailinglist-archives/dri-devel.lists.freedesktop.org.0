Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB3146C88
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 16:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEBE6E0D2;
	Thu, 23 Jan 2020 15:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFD56E0D2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 15:22:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b19so2972393wmj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 07:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=e2kHPGMBRiama9AkUHvjqkcqQa2s3zahlg24ydXowNI=;
 b=pmpB7PBNVY1oggV+Ylrs3gf2zoUl6rnlL9rsOU6/Ji0fSvXQNYNT9EvIi6O9F9l4h7
 fAhgexts00lccoMnCILMyQ/LJ3kL/0rUp1gqQVEqy7qq2i2np+2+vYW+Q/3NlKnzWPAo
 8LhfGHxhnyWWcM/IcBZXqx9enjWcpP8/ZjqoZ8KGC9+7kQLJzL4+3MuOkyptyq3HHQMM
 S39kKpgWudKcbrjkC+UusNz+2iZnA2e7wLpDL3ywJGrXOCA8rxlCHcOZDHa92nrx9M+B
 vsXuUm90bpWjtR+oeD0QnvGh5k9IqSbmEozGCVJmOm0vDjpUFq3+L20+e7EvclY4FzjE
 x4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e2kHPGMBRiama9AkUHvjqkcqQa2s3zahlg24ydXowNI=;
 b=VGsfjnKcUUQNMWpyh70iQ6vpA2Z+56G88OJ9Rr1Kj3fbjXRHc4LYpXU+YSU4Nrx/GG
 jb9y5Wj2Eqw14itgagAvE1+/XL72HUH78Fj+vhuBYsF2RDebm3HUxYE8IbiVttF08FS1
 Jz1k09b84km/uYxWcMQ2shrvNFjzwsttS6uvtXzPYQ1op66P3jsLFHG3+uDUngoquyJf
 ghNcX2lxrx/NLRNtdH0VqO1n3uArZHtUJTSOTcYoT+TEKnUfttu3esDMoaWlxQzNDtMK
 moaZD2zBk6s4ux475+AjT55+9J4qkpk4JjstnT0YETxmn2D0KnrYu9YxvktgUF4yi/9V
 qT+A==
X-Gm-Message-State: APjAAAVYIakBmZcQ42A03FJYdMXE3RkqlvWuRTDmum7mMRI7hDTCNf9M
 v8RPnyrS4iylkMR9ttvDFOPqxkJS
X-Google-Smtp-Source: APXvYqwcEF/HSRY+euzUIo/mu3Q6yQf9H4O45vKfVEq0rM8T21Ci9bBfkrcPFJSRz96P29by8ose+w==
X-Received: by 2002:a1c:2089:: with SMTP id g131mr4480653wmg.63.1579792964662; 
 Thu, 23 Jan 2020 07:22:44 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id n3sm3262163wrs.8.2020.01.23.07.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 07:22:44 -0800 (PST)
Date: Thu, 23 Jan 2020 15:22:00 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200123152200.GA31295@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-HtXRkbMwRH@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-HtXRkbMwRH@https.bugzilla.kernel.org/>
User-Agent: Mutt/ (2018-04-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Is there a reason to have such poor performance with Dirt Rally compared to the
> Windows version which should run at an average of 70fps during the benchmark? I
> noticed that the GPU load was low on the benchmark unlike other circuits where
> the GPU load is 100%.

Ok. What settings did you use in the benchmark to compare dirt 3d engine on
windowsDX and linuxGL(mesa)? all to max(often ultra)/on?  with msaa?

We must run exactly the same settings.

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
