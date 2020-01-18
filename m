Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73449141892
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 18:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8323F6E0FD;
	Sat, 18 Jan 2020 17:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C0C6E0FD
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 17:02:57 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b19so10320929wmj.4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 09:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PfadaV8EFp4KK2W5X3H4MBDfFV6XYgyutOQn+1WTFwc=;
 b=r4svhnkPs++vI51zGgJpBz33BBzm0J7W7I0SiqU535c83QNhPKD6AbM0WZJfiv5fKN
 3C+vACfTyLyc1tn1F7m+ojDrL4s2YEUK6Wzq2cbuvE3rujPA9jSsnpDv6jJKXFlfjfri
 DpJ5vT+p6LpDdY9E3wayiffOqhFJe/MJuakPTdZTf6mP2fiTdwR9wXTFe7MOKREmvFJu
 z56NjA3LH11CnQ8S1d/ZWx/oRVbzaCS4UdcIwd6e/kMw08XK3xhSOXj2plQiMt8IEMSS
 RdN1QMcrmaiO/98hcEs6Dl/NGdTGyq1KdIFnIGDRL7CRtdUlUg73Ex3WJQKvuNTtw+K4
 B5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PfadaV8EFp4KK2W5X3H4MBDfFV6XYgyutOQn+1WTFwc=;
 b=OIrwmQMrRIUTre/8lTPUMyMYKnnADYD9eJdCEe7rknrgXvMLcMFVHITjFAgiXrXKDZ
 /WSkdngIUXmAskT2qD9Fq6eJ6UoWMOCm6tjea8fVx29p+QCg6Zs/5UP3TOQ6nJn9uYA5
 DVvIrmMIlk7yVipzWfyRZZ75VKTRAL0G6j8tMxuNJGnMtcjsnkYos3eD/FUJBphfz7j/
 29TEahqiGqegEv3dJvr+krJa9QJvHnUkU44F4bKEY13vSKAphkdf+rXi91rgVOEZ2xeI
 bghELSzhexbHxcEKiDqiRJEDRtbH96d+wcAE7TKsZnwFw94ABLW8EVf/8Xbdo3tE/8v9
 YQrQ==
X-Gm-Message-State: APjAAAWU1YU/sIL3VgA7mkvx/zVeX/9hg090IWt67ZKiiwiCsCfmd7zM
 qkA4dWbJHXOsXEZwSCrXp8DcXKix
X-Google-Smtp-Source: APXvYqz2JuJm7eHlhRtoMDdRtUQOKvtVurTPYhecTpsHqJJuSbJ2YJ1RaCTJIgfNgr7+IGFltZl8iQ==
X-Received: by 2002:a1c:9c87:: with SMTP id f129mr10904892wme.26.1579366976318; 
 Sat, 18 Jan 2020 09:02:56 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id q6sm41263834wrx.72.2020.01.18.09.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2020 09:02:55 -0800 (PST)
Date: Sat, 18 Jan 2020 17:02:23 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200118170223.GA1228@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-KGKjrBMn9J@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-KGKjrBMn9J@https.bugzilla.kernel.org/>
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

On Sat, Jan 18, 2020 at 03:00:49PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://ibb.co/GCmHFkf
> https://ibb.co/ZXsvNZL

Still the unreadable screenshots. huh??

> I use Gallium HUD with this options :

Gallium HUD does not work with vulkan (as far as I know), hence for dota2 vulkan.
In dota2 you have an option to display the 3d engine(valve source2) fps.

In cs:go, there is a way to enable the 3d engine(valve source1) fps display.
It is via the "console", see google.com.

> My is CPU is an AMD FX 8320

I have a FX9590, then our benchmarks should be mostly the same.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
