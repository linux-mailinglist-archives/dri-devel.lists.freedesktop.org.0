Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D414906A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 22:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3B972BD2;
	Fri, 24 Jan 2020 21:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9308072BD5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 21:47:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so877255wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 13:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0IyS/jCA0o0kw0QwY4aUT2O0o3p6aj14K4YVwtvCYQM=;
 b=pu8+RgJ8DsS5/oDpAWez9EEj19KNk4fdxZxdiF76iCGVYO/1xhIj5t3Ef+UYykXpn9
 Bb3LkHU9gNJY/n7YSJhmua6UlHtjEyGOFQwenO6ht+FPZqLBwnsc8JLUwRHaY7jfp7WG
 3k1axYtTHhKiQl/ELf0NhHy79ods9o3BkwM+s98G/zy/SkDlp7KnEH4yTio2xAkEA+WF
 Bmi/TvYrSGqTyQV9SjgK61Ur7+wmO+3fVVBP64qOWAKuh3nTAchMWlsHsvNncL9ylcm3
 DVnA3jx9kgx52Ia6XF1ZewMA6mkD7WWM0X8zDw7gU52EQ6Yz70hs6jTneLU7H4CKMzEa
 +ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0IyS/jCA0o0kw0QwY4aUT2O0o3p6aj14K4YVwtvCYQM=;
 b=DT1tWGbM7WixqGXd1nrGIPDjC4G+UAirwjWnwSf3fmqH4d+0wF/FbZ/sikRTd7dJC8
 liiW/u9vkU6YbhXXzqqoxk66IO//WahM/WLp3N/65oac47V7xAa0tT+3QV4UdLX5/Ylv
 HHgCOtcnez/JVORaBRHC5hMfeNPXwtKk2/XnEEvtLYiHBNPuRcZNYJp6HtJucUQqIwqP
 WBQuRf8Rum00V3Qvqnq1ZQn5zTIkgho0AB/IojLqUcSOYuGqyIdKPHhi+r2ENOOg595u
 +IM4fe5WmPov/aQSN//vX/h10EgmSymwg6eXZm56zhf9M2o5pfPoOVmuGgOZCjDtM4lY
 j3kA==
X-Gm-Message-State: APjAAAUkMCLqEoO0JgyYCvgzmaBvMLXgu1f0X1m1WpGSrW0BtfWlddbZ
 W1Tuwd09IGwto5PX+UFZ+ZN9zs3k
X-Google-Smtp-Source: APXvYqwfW3Chv6Qo6kSHKSscitZEacPfIKrx7flmU9lFhHHP/terhEIHF4Fh+f/IspnbSpUOzaNF4w==
X-Received: by 2002:a05:600c:291e:: with SMTP id
 i30mr1165519wmd.40.1579902461200; 
 Fri, 24 Jan 2020 13:47:41 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id x18sm9354233wrr.75.2020.01.24.13.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 13:47:40 -0800 (PST)
Date: Fri, 24 Jan 2020 21:46:54 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200124214654.GA15196@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-PR750TEbp6@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-PR750TEbp6@https.bugzilla.kernel.org/>
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

On Fri, Jan 24, 2020 at 09:24:57PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=206231
> 
> --- Comment #43 from Alex Deucher (alexdeucher@gmail.com) ---
> The first time you run the game the shaders are not cached and you may see
> large compile times.  The next time you run the game the shaders are cached and
> you avoid the compiling delays.

I did not erazed the disk shader cache since the first time I did run the game. Then
the game is loading the shaders straight from the disk cache.

In other words, this presumes the shaders submitted for compilation by dirt
rally engine are different each time the game is run ???
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
