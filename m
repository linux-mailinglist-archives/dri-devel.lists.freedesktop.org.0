Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0101419DF
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 22:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C736E155;
	Sat, 18 Jan 2020 21:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994C96E155
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 21:32:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d73so10719053wmd.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 13:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=L1vSeZFmXvHt/uQ8479verhJwy04xHCeS9XQTiRSutA=;
 b=DMeetI65OHyvS+mGh2Q/EVmE0uSwCWg3tRdpzUCXyq6R7lrbaNzAibc3azMlyRzfj+
 zKCYl4/qaeT8tzNix7knoPnVe4LRVb17hFfG4Q+NfuBgVaYGCd6BIyT9m4yt2LRz/Bce
 T+UQTvYkdEpEGVaVwhz+yrGqfYzrN4y8dQ6A0qeeet58mf4nIZy6KZexQGkPWwxdvv3P
 RX2II0EBoJE1RWcm6HWmh7jcP2axJEwqFYKbHjlo7+OZeSA0kOo3x6gSrTUI3eKBsZp3
 NkSHqVCBl62iqV14pvkipx3fCR/AINeoZGb8QXPJAmYtmUFwoirhx6Al++aVaimQgUH6
 vsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L1vSeZFmXvHt/uQ8479verhJwy04xHCeS9XQTiRSutA=;
 b=gKRfB699jOLjwQcldlEizqU5lUeJIiYMuxdkwpZTqIShAexsGXOEljKKPXF2OCxB/G
 uuHWWRiWSXnGy3qpcuhACVxkUIfkDoLnZcjilqS6KszMU/nkSG7PgYH6LbNlg8picGtD
 R32prU1gzv3v+t8HYbarUkJo9YjTgx7YYFxlJCrY4A+kZQtcNSoZ4/OaBJaYEmRLTjD7
 PSkDc2rz9i3iQxGtLeYtWXNE31JdKUdggjRgi9QvrC3KYWwN/4sqvnZhdWXzNfPV8EzA
 jb6/YhhhVCGAx1yIByIZFXCOmRxQLvZdm4oSpWYdv1eNN143pRFKCITqkPG1kOhMLMdv
 clEw==
X-Gm-Message-State: APjAAAUlxqsCDeHUDwDgMw6jVH7Is/NYMzL3kA0HdfbY7SHAwuJX8rzB
 OGDpLs5smxS5jtn72yfwuc5ue/tL
X-Google-Smtp-Source: APXvYqyBsbK2OAhg/0YM+ft9Rs4EJ51yuXpp6IgBlgcELJATgRMda/8w8f0HfiweDLw0ZhQKASMvLw==
X-Received: by 2002:a05:600c:2c2:: with SMTP id
 2mr11748647wmn.155.1579383134283; 
 Sat, 18 Jan 2020 13:32:14 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id p26sm15047315wmc.24.2020.01.18.13.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2020 13:32:13 -0800 (PST)
Date: Sat, 18 Jan 2020 21:31:41 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200118213141.GA1027@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-68jgyvsfvW@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-68jgyvsfvW@https.bugzilla.kernel.org/>
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

On Sat, Jan 18, 2020 at 08:59:14PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> I downloaded the Vulkan DLC and active the FPS in Dota 2. I get between ~80 and
> 90 fps :

I have ~ the same fps (even though it can go somewhat below in intense team fights)

> For CSGO, i get between ~70 and +100fps :

I have ~ the same for competitive maps.

For danger zone maps, namely big open maps, csgo 3d engine has disastrous
performance. Valve is aware of the problem. It seems there is a kind of cpu
cap somewhere since max or lowest 3d settings does not seem to impact
significantly the performance.

Don't forget: I heard southern island parts suffer from a critical mip mapping
bug/slowdown.

----

The real benchmark is how much time and how often the fps goes below 60 in the
worst realistic conditions (average does not matter).

---- 

I did re-install "rise of the tomb raider", I still get gpu vm faults.

If I recall properly "bioshock infinite" is gpu nasty even though it is a GL
game.

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
