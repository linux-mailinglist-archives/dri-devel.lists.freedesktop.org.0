Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83214440E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 19:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5C56EE0F;
	Tue, 21 Jan 2020 18:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF5B6EE0F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 18:10:33 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id t23so336864wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 10:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=agd8ini5M78BmTi/abObkUtQodvDqApdRk0YAlwZztE=;
 b=VauA6swvnaVlhwEreSigzM5P+beWOHmNQZsZLI+3U45E4HAyI4AflpOmtMKy3j04Z5
 Ey9jClvfEhx4V2oijoItj8T14fRT8ZHdi1JX9OhtoiG2LSqL5+B1eGPeNDz5hOwHySVe
 HenYtvk99eqvKWOdqbiwszORZRjHgavDEJxCWS9if4L7QQZchzoGDYUkV2hL2g85Q2Im
 MLZudj40x1uiAA3Srze3yZ3H9drVeGhVQWxNzwnfZouyEO7O021V/eLo0AG0FTY2V0jQ
 tYS7j0Dpcd2UrsHU2rEnzVomg2pXucDa4eEMN0GEEFfINGoXmJdM+K/d3J8n7sIWZrnU
 46vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=agd8ini5M78BmTi/abObkUtQodvDqApdRk0YAlwZztE=;
 b=KAHVUjAqvtbV+aKzQ8I8QxOGWc/H+miOfn4p+bw7rkymk0GSFPab8/yufSONjWUWwP
 5CHvf5gnTTbr4RP72xfmo5PC3hWRrOn3ANLnXzZbh4ZjXUjH75/DFGN60vwA62/EXK97
 FoqsUZOpj/IuL85zhR97ru+DnmxU/EP/zZ26RxxoopMiOdD5GiAB3qZ69OARgBLvV9uP
 BGDVMHmmXtcL+vxQ9xfHRumnLTq3dEWxQfWRXbkaiTj09WvAlJ6nC7XDYrVdig4RWRzU
 tnvIom0qZCcpjhCMtpUht45STiRaxEC3eCdhqhJOf+23KWHmQPLkayvcAzYqTJXB5Orn
 PQHw==
X-Gm-Message-State: APjAAAUrjQCHvL1cQnEVzVG/h++7B1tD491Hhj2tO5cw6CD3cRgYt6un
 zLMmUQjzWDDkWNKIvy3tRIZuagMX
X-Google-Smtp-Source: APXvYqzOKrARt9F9a1jmvFeJg+CJmS2qbMy6rjrDY7m4F7kIfgw7s6/2Ceb48rKP9DOajs8aQOBoFw==
X-Received: by 2002:a7b:c946:: with SMTP id i6mr5557946wml.28.1579630231871;
 Tue, 21 Jan 2020 10:10:31 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id u14sm52137211wrm.51.2020.01.21.10.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 10:10:31 -0800 (PST)
Date: Tue, 21 Jan 2020 18:09:51 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200121180951.GA6624@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-tuvVPV9Sy9@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-tuvVPV9Sy9@https.bugzilla.kernel.org/>
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

> --- Comment #23 from Alex Deucher (alexdeucher@gmail.com) ---
> Is this roughly the same model every GPU vendor uses. GPUs are complex.

No offense intended! It is obvious that the maths being the same for everybody,
sensible hardware models will all look alike. It was more to underline the
significant "technical cost" difference between GL and vulkan.

To come back to this issue, I was willing to help this user "secure" a real
issue by reproducing it (since I run everything git) and provide a reasonable
context (free as in free beer) for you guys.

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
