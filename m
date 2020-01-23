Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA53B145F8D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 00:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C836F942;
	Wed, 22 Jan 2020 23:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153626F941
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 23:57:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so1122916wru.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 15:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a6irJNFq+Hm555xZ7PM0v3AwpF4Ul3QXGUL3OMAhyNk=;
 b=r9tiEXA0d7r+bZpw+1pFDr1beBTRjsYKhGxXgrYsctYdkpfu3uDwfGp+EsFNiw5qmx
 xSqGQ8SSPeZyBkEZIQCjoN+TH9ei7ajRB4VMtis0RZcX9IqkfLTMJ9oNLtNnC6Xsq8YD
 hTAs1qAyIAhJ0o+DoF4yuApdF4hztp0gdNdoMeIzhSwr0qshGJQJ4Ss9p1auwIZm+02y
 p6AXsdZ/QnM3q59CU7ai9xr3t1cU6+Dfw3ZTBoZ/eUOxSDEbn3xjBIXf+GGf5dcLX09U
 v4w+KPbupLWkUMFXMZtDoklKMHCPyXRujJDoUwWHB6NV2KpFpgGczoXDiVpyzAUm3zwJ
 UYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a6irJNFq+Hm555xZ7PM0v3AwpF4Ul3QXGUL3OMAhyNk=;
 b=MiRvm79BStgs6fa71mlkeL2qUR2Dts/RdXOBZFyPdVlbUpqEz90PulOX72+StRMMfN
 PwDrscoS3W0rrIf/spjvSIopblF1EFTBGPPU5kH3CTkJ2colE5GD0PctRwqhhwsZZR5l
 7dQEPALUadCfJaS6WncOuoZ4VT0REjTlP1mwQsQ5go84VM+dCsEBJ7QhTCkWW/Qbp7xc
 vrNrQyc0a7Bg+0Ts6T1D+8Jr7sQfCBtJVO6S1Sfm6E9XryrMsYWpbmty2Zwt29LvSm/h
 +F4xlq7ilfhjUOHLOXZsOY2A47p2r7Vt81i+hs/UvGrx09pspDEfcO9F8V+hzkjHw9MC
 +8/A==
X-Gm-Message-State: APjAAAW5Sbxu5nyqLsepMs0fcybWCIBKoQX95xViBwQwGoJCJXwBNhvl
 ZiZqDledvQnwZSHMWRjgCCyzR6jM
X-Google-Smtp-Source: APXvYqxf3/XUipDv+uwmw8OtV0tRy/0ag46PQl/w2hkwPONPI27Pe1uI8TADQoKgYstSSwNiEzKf9g==
X-Received: by 2002:adf:e6d2:: with SMTP id y18mr13710357wrm.262.1579737424744; 
 Wed, 22 Jan 2020 15:57:04 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id z123sm344636wme.18.2020.01.22.15.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 15:57:04 -0800 (PST)
Date: Wed, 22 Jan 2020 23:56:22 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200122235622.GA15172@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-s1m200HsCZ@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-s1m200HsCZ@https.bugzilla.kernel.org/>
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

Actually I should have restarted the game.
I did reboot in a clean state and did set "performance" on the gpu as well.

Here are the results of "clean" benchmark run:
avg fps ~ 20fps
min fps ~ 15fps
max fps ~ 40fps

Still getting gpu vm faults in dmesg.

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
