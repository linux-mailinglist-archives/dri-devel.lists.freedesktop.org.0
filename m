Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EFD145F28
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 00:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483806F932;
	Wed, 22 Jan 2020 23:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9230F6F932
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 23:35:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j42so1027591wrj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 15:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oNOR/S+xCo7NUtNGeBMW46UNwNYb54zqL/iWXsUlpHE=;
 b=ggFNEofwqj/nwpPCBlX85WE10/AhY3D719wo94YcZq+NP+F5C+Ycojv9Iz62q8kUMy
 eC91zHq/obvJajw3u8ktYNO+9Xg6d1P5gvFVBHyfwe8X4CYT9z/E6uz8Ws9M5owuA2yF
 8KtTvEE7nAEPy0MZzIv3xw+rQwK7RNoD37Lm93q7Z/V1h538qH3JoHw0L7wmqWU0Uoqg
 3j41xhO/I7rBm4GuXkNayoMpIE1kZgPRPWkaF4j0TgYqCoABDd3eClYXvmAy99waet8h
 E+FgpCNhovQ1IkqUG0+2ntPsWZhTqAe3hWIQx3iNWKsUYmtQTrqOcaFljiNbXYVqKr0X
 6Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oNOR/S+xCo7NUtNGeBMW46UNwNYb54zqL/iWXsUlpHE=;
 b=OP1afU7bqZHFXyqCeybjqRZIksC2mSUYgblo7l2/taw3oGRvlq52uvIiewwH5T6PBw
 TM5gBQa4Q8aDyoIGWhQI+hOxVCu1jnK+f2N8ZHEGt9nS6qUYKULBZchV15FwKTTYmIU3
 2H9InOU4bwGZuSKKC1/mAKjBIaruScNf/4f9c3U6nuEvlu3aROxamQbUCwEwsgRUwbIg
 DhQipqm9VuaB6JpQMGKhGWwxAxraDyaT6sRxdJKwWshRnoLJ57uPY8O/t8ZTeOgLqWQG
 F1f9Tb4E25HvWMu/EYjd8K9hMDd+gI8klc7dLIknvlUxekqatQgBpb72ZGX7e0KDN2W5
 b6gg==
X-Gm-Message-State: APjAAAXdsygDlZRsBniMaDM+9R8vYc9Bvvpf3ejwhw999BYvQ4kCx9um
 7vlxJQcGnrK3S8SkK3g90wk45cfT
X-Google-Smtp-Source: APXvYqwiYjJKJ1VVR5zCHEJp7hEqYtOB6SDm0a25ZcA+QJLiR5TPmQlPysbjKOC6sMf2dHOF9TbJGA==
X-Received: by 2002:adf:e58d:: with SMTP id l13mr13748362wrm.135.1579736141076; 
 Wed, 22 Jan 2020 15:35:41 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id b137sm308244wme.26.2020.01.22.15.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 15:35:40 -0800 (PST)
Date: Wed, 22 Jan 2020 23:34:57 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200122233457.GA26980@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-C8tRYav3hS@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-C8tRYav3hS@https.bugzilla.kernel.org/>
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

Dirt Rally is a GL game, not a vulkan game.

It happens I have it in my library even though I don't recall to buy
it.

Anyway I did run the included benchmark:
  - cpu governor to performance
  - monitor refresh rate 144Hz
  - 1920x1080
  - 8xmsaa
  - _no_ vsync
  - everything to max

avg fps: ~48fps
low fps: ~30fps
max fps: ~60fps

I get several GPU vm faults in dmesg too, but no crash (like in vulkan "rise of
the tomb raider").

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
