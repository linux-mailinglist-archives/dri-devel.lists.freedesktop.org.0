Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535D514740B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 23:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBAE6E162;
	Thu, 23 Jan 2020 22:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA176E162
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 22:53:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s144so2856601wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 14:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RzehXyFhk4RWmRYlZn82JGLOATp9zf+NH5qUKpcy8D8=;
 b=rQTZHwC4w47mEt2wu/i57DaU5ir05X12biMYMATiYCpFyTU/Yx9scpC9Ty9NWMSy3A
 IlMObCRB0HOVQVJ+sJjK5u+piYKQIx10EIyNA0GEnOzzkggch6l/6+aIbgjSVB9sKp6A
 Ynh+xJb3m5s/iSK+G/D47DejRG7yPMuU6+7zrwAMOqrUyKq2OCYC1tbtSCOAgBdLr1od
 1dRsUAYs2rQsKlSArQ3R3uvWJpJzkZilCqCJEJzrtGAcw7rPQd6WGYUXgDblznksXRks
 4cxd+Y4GDmrixDgQI6xyQDr7PMJdokt+BWmfoT9n+LKbd0/SPb8p/cFNoJtIPW3tabUE
 Jl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RzehXyFhk4RWmRYlZn82JGLOATp9zf+NH5qUKpcy8D8=;
 b=IXhB7iOfec/thZroe0WlX+UsPsM9D+HuEWl2bKgu6IM52MdeKHVlk6KGEEi3AhNrtG
 VfX5WBXdGFFY2wFNB8QsSwgy78nbPeRBzW1XT8L1rDVgvl1yK86geGQfwYOOg62hc1TJ
 uqphp6BHv3s5MiWJ/m5Nfp2GbNLKUrkCGYV++Xtc/YrO0Awcft6yQXQfwjpb2WcQqVpv
 I3WqqRKwx/Oq9h0xAEqdum+5ycfmkW0j0dujidU3VdAlo4ht8fAWnW+yuLD6WRyCJBMw
 xQjOpPKixv4izzy6lcV7h5PN9Z/XeRjekHGmOhJ1Nin2Dm3yRQHRO1vsCjZ41dgCHx2y
 ELSg==
X-Gm-Message-State: APjAAAUDANItgjTc7OkPi0k+E1UzNKHDAQj06dG7BZOTu3LKwdZbBhT+
 P05ZONoWHeBek7HT6KcbJIP6GMO4
X-Google-Smtp-Source: APXvYqyteXcIypkCMWGoF47BYZ7jeLl7uCgPYqlZtRJpurOtADMWmWdZc2lJ6n0nSR23UehcsvcozQ==
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr217603wml.138.1579820021216; 
 Thu, 23 Jan 2020 14:53:41 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id n8sm4864837wrx.42.2020.01.23.14.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 14:53:40 -0800 (PST)
Date: Thu, 23 Jan 2020 22:52:56 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200123225256.GA14725@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-YtDvlCsOCZ@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-YtDvlCsOCZ@https.bugzilla.kernel.org/>
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

On Thu, Jan 23, 2020 at 10:05:26PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> --- Comment #36 from Jacques Belosoukinski (kentosama@whiteninjastudio.com) ---
> No, I do not have Windows on this computer. There are several benchmark results
> available, moreover I noticed that Mesa has much lower performance compared to
> DirectX on Dirt Rally and other games.

ok. Then we don't have numbers to compare to and weight how much mesaGL is worse
than dx for dirt rally 3D engine (modulo the hardware bugs/gpu vm faults/etc).

> New bench with ultra settings, 8 xmsaa and 1920x1080:
> min: 14fps
> average: 19fps
> max: 27fps

I guess, one would use the presets to get a min fps close to 60fps and ajust
with the advanced settings.

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
