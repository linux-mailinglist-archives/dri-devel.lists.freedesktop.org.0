Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ED4147344
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 22:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B016E14A;
	Thu, 23 Jan 2020 21:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67A96E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 21:41:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 20so4144345wmj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 13:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2GCMYMgHsu/wM9l7JJ8Z74aHwHnhBl2g4y/vKsOsxj8=;
 b=KJr6Bn+SBiRjwJUmw92jKBOi+I1S5WywVYiWhhmu/1YaqaDUxj0Dll25Xf/lmzfiB/
 4xPjrw3WsQksmFwM/wRGpM20UQbWLGwd8tJ1j98pzVOz8w0eVNt1ab0Gtr4ntrflyKBx
 EEW1u9Xjw1/PcoNU4kkP1Hp06zP5u9GnthSlsmF4XDN2SYNDtxAX7atgDJsYbuFTvpwq
 lJYKVexzfBxPBmZzwV2Fyqmh5yr1EPHmmFGEiTo30yf/G6F66dGPqHH/wKfEUNZ5fogA
 NHYrjQWu2FZl+LVqiD4zTJFrvkxj9lg0XYAAUHN/pDGxGRuxEjw+Er5qStTr9S0EPsi9
 EubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2GCMYMgHsu/wM9l7JJ8Z74aHwHnhBl2g4y/vKsOsxj8=;
 b=cKwhU0pMFl7drlHctR6AKew5u88hTVPEt4+EX44qen33SqmfMNnQ5yIcVqMLpQ4nH3
 Uy0YtmiJDlbBqTkPWL6WEJo+8dI8D3Y0j2KSH1LSNtVnNghXu7LE5Iio1RW4aXgT1QwB
 l7LlU4ALIR7KZ1uuyxpObCSPpeTRDaIRwIWkutE0SUTHmWKqDMBDmDg7DoVmFhWNvhsg
 Cljvo//Mw4ZqRhowDj0BahBlw/tDOAmMvooIKupKydGiRTkChQAnXSe3WcwZR7KySBjr
 SKPGmcyhp8zvxKpG52YakvHA+Y/p3gU86lhwp+uQfhx8WvOFbPP5rB5gK7+yvjYhFdf6
 eDyQ==
X-Gm-Message-State: APjAAAV2Ytj3mUGvebORkWzXcUwHGvqHy0K+MMOwUgLCr3HZjdZ2DFDe
 UScMUf8+lNk0Ly12+8G0Xl7bOy9b
X-Google-Smtp-Source: APXvYqyh6JB7Ka8AD9Y0f3Q74IR1T+d99nHd6wcffECAimvQr+Kai3O7nEaQJ/Lev0p+bi9bMASOJQ==
X-Received: by 2002:a1c:7e0b:: with SMTP id z11mr35424wmc.88.1579815687353;
 Thu, 23 Jan 2020 13:41:27 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id l7sm4597532wrq.61.2020.01.23.13.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 13:41:27 -0800 (PST)
Date: Thu, 23 Jan 2020 21:40:42 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200123214042.GA20040@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-Wrd3rT0VxX@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-Wrd3rT0VxX@https.bugzilla.kernel.org/>
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

On Thu, Jan 23, 2020 at 09:21:05PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=206231
> 
> --- Comment #34 from Jacques Belosoukinski (kentosama@whiteninjastudio.com) ---
> > > Windows version which should run at an average of 70fps during the...
> Ultra settings with 8xmsaa, no vsync and 1920x1080....

So you say that: everything to max/ultra/on + 8xmsaa an 1920x1080, on windows,
you get avg 70fps? yes or no? If yes, what are the max and min fps?

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
