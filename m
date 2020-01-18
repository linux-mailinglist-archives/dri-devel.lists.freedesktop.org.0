Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92631417E9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 15:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE47F6E0AB;
	Sat, 18 Jan 2020 14:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99036E0AB
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 14:14:52 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q10so25283059wrm.11
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 06:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7JQg3YZgRiMa6exgozmm14/TPCIRZ4EFy66XHyy7rMo=;
 b=af8VrJBcAH1I+jAxgMEb+/U68nZj5ED80f8muQgLteYfo9x9n9XaWDKMXsrowOA+bo
 fJyY/tlUGBRZi6q1BPISbB0f1wVrRRr6HW7OB8juWVLIO85epkmqHYW7rlj1Vyg3GJiI
 4Ewt5hLsLAjxdeGh4/CEAagomwhFuC+VWoigw95Fyuj2dL2+uQkWSIike4/CgKrXJB4F
 r2ajVGtB22FHODmZtNJM0YLH4BH1j2CQbBQ3UDI/YBtUkBW6MZJEBp1g643jrlRY4tOA
 +9wm8+FXG3WC0xhbnnyJUHIG7yhg1fEwagLdoOOiQ0BiU7Ts2xJcqNt/u2V8ycCmHh1S
 iIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7JQg3YZgRiMa6exgozmm14/TPCIRZ4EFy66XHyy7rMo=;
 b=GrdeZVBzKxGKWzojwLso2agtULW2gOV8nwKP/HrUg7kSaeFe34mZcoGTlAa1h/njlx
 WVZxvkh0piemXYOeyPu34Prqb+pk4CYBc+9SEczTWbJfPEqMKRTXMUrxqi+X4hwKDKvH
 EGxyk75DqQHikZdPpkoGJHQHXg8oi638aIuBPJriu0Z20VQ1elU5BZTeG/c/xUfeEYIc
 gXqAT/6nQmJnUS2WiELZiA84OICjXthGSLSCjtL50STAydh2pEkmkQP5rEOXwOsU7xT0
 wLjf90bMojn68HgMOoHgNuzd71RzCfaAlqk+PzXvalj4+EoHjUTHJneItE3I7t1rcSRD
 xd6w==
X-Gm-Message-State: APjAAAV1G7TsRKMfP4x1ifVdxIEizBelWPGeQec6xpbJCrXMhd8d9Dqs
 z4vgR6LzVcYzwjMymZt4f/YCL5vx
X-Google-Smtp-Source: APXvYqxodcFrKUvDaNKms3mlWIcWBgtJdw3KTDhXnqFGZMZaLaWDfkZOSQ+D1rm5qc1Am7sMO3JnqA==
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr8928797wru.150.1579356891492; 
 Sat, 18 Jan 2020 06:14:51 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id x11sm4399007wmg.46.2020.01.18.06.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2020 06:14:50 -0800 (PST)
Date: Sat, 18 Jan 2020 14:14:18 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200118141418.GA616@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-jEV1crEzGk@https.bugzilla.kernel.org/>
 <20200118140142.GA596@freedom>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200118140142.GA596@freedom>
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

BTW, your screenshots are of too low quality to be readable.
And what is the tool you user to overlay amd gpu performance? (vulkan?)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
