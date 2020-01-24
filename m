Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950D148BC9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 17:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0386272B16;
	Fri, 24 Jan 2020 16:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9773172B16
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 16:19:36 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id p17so42547wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 08:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZtTFjM7gwNFyJkqnt0+3c7ymoa36h9gPq1IfauXoWoU=;
 b=C87qLhdLr/SRqiRMt5XD8avoD0P6RV0+kvlLJ1UanuIplfXUVIy7X7uIMx76qchcnf
 qxxk1+Ps68Lm01gN7OMz0CyoIrxwkdRcZlhmiwqJ9K3Ppd24Z7vwTcS5/tGPzogCmETx
 d5yB+uMxqjwGZ+gqKrSjmXnBhqXGLDOE5FyReHSianQZmM9soxZ0tRrzd7ptYwrqZwio
 oTZltS75q2B1zjTab3o8UcTmHKPTbRCiLJre/lJJiiHzucDAgrMbx2fog5amA4byAVzg
 hKZ6iYA9SPdn9TGE2kX8cJ77TlYxpV3DqjdIAZrPyihxUnzcqupr0agyK4tOzkmvjM4x
 +yvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZtTFjM7gwNFyJkqnt0+3c7ymoa36h9gPq1IfauXoWoU=;
 b=pPCOmc3NS8wqBFYfuPlfl+U+vp596Sz26QQojswjyhEJhlbtQZVbBs+UOX92K26Tw3
 B+2IRCfw54bhaPbYqoG3AN+DokUsvzgH8NlZrdBl9wtHVc21YwgjrGEM7nkHvSJ60aEd
 cY2sKz61FWAC4WZ3Sz3SBXSZq9m/8Vt9a+wRYyF4wDiEgwla+M3MBDfE5UrrbuGGIBW4
 Rz/c6QRMj5W7wRmNme50LRjDHeEPfDVXpPju9FuiXzR4OYl4qYwrgDTowIrDrbi79mYl
 jWWjyvvrOSu/YP5oyE+8FGsbNvLFYPeO6A+VbkoI4WqZoh12kx5FcXCp1juUIX5sjhEA
 O2ow==
X-Gm-Message-State: APjAAAU1Z7V7KiqBf2M0fo5Kmj47U7r/qAL+I20kOLJvwkEFKYW4xy+O
 41A1oq+M1TGYCrgYl6jNASZKlCgX
X-Google-Smtp-Source: APXvYqx99Rl5NYGocIM+mk/qyageIqEv6hW82BCIOpSg3nazcy9DNiih0b7hEujf7U1QTMSNvEz6kQ==
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr40544wmf.40.1579882775246;
 Fri, 24 Jan 2020 08:19:35 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id b17sm8119018wrx.15.2020.01.24.08.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 08:19:34 -0800 (PST)
Date: Fri, 24 Jan 2020 16:18:48 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200124161848.GA21856@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-u1O3yJjHWt@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-u1O3yJjHWt@https.bugzilla.kernel.org/>
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

WOW: I did reproduce with dirt rally. I could not see it because the game must
not be restarted to "uncripple" the renderer. I used the number or rendered frames
and I go from an horrible 3000-5000 frames to a wooping 11000 frames, not to mention
the game is now ~playable to max/ultra settings. I had to run 2 times in
a row the benchmark to "uncripple" the renderer, or fool around with the msaa
settings (without restarting).

And I get ~11000 frames with msaax8 or msaaoff (and I can clearly see when it
is on or off).

Since you can reproduce with other games-->Yep, it is very probably a set
driver/weird hardware critical bugs (modulo the numerous visual glitches and
gpu vm faults).

@alex: this one is nasty and probably will ruin the gaming experience (and
benchmarks!) on many games.

(@Jacques: Proton games do not do. Only native GL and/or vulkan, that to remove
any proton bugs)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
