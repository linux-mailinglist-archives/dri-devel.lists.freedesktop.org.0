Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0B2A10BFA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CF910E3D8;
	Tue, 14 Jan 2025 16:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LEMu0f/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EE910E3C5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:16:04 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaf8f0ea963so1106084466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736871363; x=1737476163; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Hy75zv0jPNz/NadWI9ulEIuyrYJnMlPP/tt3Y0Pl4XQ=;
 b=LEMu0f/XLJFxDU5Up1RiposF1oAXwGFnPYJ9fhWCc63jBcmsrsLLqPKwYgk0X/ZVqu
 2Ei+BL7hQuxtLSCBfBsmns/UD6kyA9yXFAkYhq+Pzx/A5ktSsiU2rsmD2SDvRO7ftYLJ
 V8vI4cGnyPAmR5wmfXc8POhZVYGtJF/NSJ6os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736871363; x=1737476163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hy75zv0jPNz/NadWI9ulEIuyrYJnMlPP/tt3Y0Pl4XQ=;
 b=kWMbuLWFtyAYbe+vy86N6nSQBGFwPW7VIo5ZYObE/WjRWv6a7seJv7ek+D1JSax98Z
 0AFr30O9Q1/+TqSF247zBmUJHFyA5oxYCu4IKZWIOv0oYt4M2+X40Yi8BEdBfC67yIZj
 BOetqrLxHJGgQb9uhJCa5PwJm5++pbhUlvT/henZSk3LU49Nj/0VS6PDFbTUwBrploAB
 rQa0KnIgAfYk8o0unl5biQJPHpPZ1Z+1Wk4k2iWoNNAwh3QCtDoXsagcYHl49RxoVtjo
 QTdZebEFwmDlpSFAVOPd8Aa5sqx6EDMqm/KN0v8sdF9mLuGKTvw9NJQT4Gme1JpJ/cX+
 dOxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9gsuOKmU05Vq1D96XlpkueXGT3cpGHUijzOeAAY2FOibJoRcFwGcxeXj8q1Oh5VucnCLg2QbVCQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpeAzZbBKlxGDet1bG33JCpQKxmAKxdsexujFLHuda/euh+uxz
 qTLpTsJKEh5ffle0nUsRoMl7xH26F421JBrQ+7O++AmGetVHPtaS0HLO5iXos30=
X-Gm-Gg: ASbGnctwOEKoKe9+WNgLN93DoxvvEyItpHcwb50qkyb43J3SxPUJ/qVvh1boZakgnKS
 Wr90LntpAaTDg4nRalibVo8OeprYmlcRq/CVmYTEt2YMPSADlQ99PopuLtOb6/EJvmfEnOe3dOr
 +JpntjkHCm4gdxu4RYXvYWK438xjSWiX8TyG1RX0bNdhNiVNBgT7yLk3a5ozCsuTait7hCxld3b
 5Hh/naU8e0WQMkHA7IbY7zSG5EdQ1kbNSAw8vwBqvfWHo/QIReQZIVoWBikPCS8ZND9
X-Google-Smtp-Source: AGHT+IEa8aQlIaJMwuoQ73JQ3b72nneYqB3RAVByBgtJRXcY8/paCVUpEXat3jH0K1HK9c0pr/tM+g==
X-Received: by 2002:a17:906:2617:b0:ab3:30b5:fa62 with SMTP id
 a640c23a62f3a-ab330b5faf1mr416873966b.24.1736871363033; 
 Tue, 14 Jan 2025 08:16:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90dc101sm655539766b.56.2025.01.14.08.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 08:16:02 -0800 (PST)
Date: Tue, 14 Jan 2025 17:16:00 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Sasha Levin <sashal@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <Z4aNwGys3epVzf7G@phenom.ffwll.local>
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
 <2025011247-spoilage-hamster-28b2@gregkh>
 <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
 <Z4WKIbVzo8d-nln3@lappy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4WKIbVzo8d-nln3@lappy>
X-Operating-System: Linux phenom 6.12.3-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 13, 2025 at 04:48:17PM -0500, Sasha Levin wrote:
> On Mon, Jan 13, 2025 at 10:44:41AM +1000, Dave Airlie wrote:
> > Pretty sure we've explained how a few times now, not sure we can do much more.
> > 
> > If you see a commit with a cherry-pick link in it and don't have any
> > sight on that commit in Linus's tree, ignore the cherry-pick link in
> > it, assume it's a future placeholder for that commit id. You could if
> > you wanted to store that info somewhere, but there shouldn't be a
> > need.
> > 
> > When the initial commit enters during the next merge window, you look
> > for that subject or commit id in the stable tree already, if it
> > exists, dump the latest Linus patch on the floor, it's already in
> > stable your job is done.
> 
> We can't rely too heavily on the subject line. Consider the following two
> very different commits that have the same subject line:
> 
> 	3119668c0e0a ("drm/amd/display: avoid disable otg when dig was disabled")
> 	218784049f4b ("drm/amd/display: avoid disable otg when dig was disabled")
> 
> Now, if a new commit lands and it has the following "Fixes:" tag:
> 
> 	Fixes: abcdef12345 ("drm/amd/display: avoid disable otg when dig was disabled")

This is why we're asking people to include the cherry-picked from line, so
you're scripts can handle this automatically.

Because then you get two cherry-picked from lines in your stable commits:
- one from the drm cherry-pick
- one from the stable cherry-pick

And instead of only checking the stable cherry-pick line you just check
both if you want an answer to the "do I have this one already?" question.
There's two cases:

- You have a backport candidate, but want to check if you have it already.
  When that happens with the 2nd commit your scripts will try to apply
  that patch (because it doesn't match the cherry-picked from you've added
  yourself), which will fail and result in an angry mail to dri-devel.

  But if you instead check against both your and the drm cherry-pick
  lines, you'd know that you have this patch already and can drop it
  automatically.

- You get a Fixes: line like above, and want to know whether you need that
  patch. You already have to consult all the stable cherry-pick lines to
  make sure (because stable doesn't have that sha1 if the broken commit
  was itself cherry-picked). If you instead check against both the drm and
  stable cherry-pick lines then the tooling will do the right job.

Which is why Dave&me want these cherry-pick lines, but Alex has removed
them again because of the last round of shouting about this. Because
without cherry-pick lines you're down to guessing by title, which goes
wrong.

So the only thing that's needed in the tooling is that instead of only
looking at your own cherry-pick lines in stable commits to figure out
whether you need a backport or have it already, or whether you need that
bugfix or don't have the broken commit, is to look at all cherry-pick
lines. And ask Alex to again add them.

> Does it refer to one of the older commits? Or a new commit that will
> show up during the merge window?
> 
> Or... What happens if a new commit with the very same subject line shows
> up, and it has a cherry-pick link that points to a completely different
> commit that is not in the tree yet? :)
> 
> But just in general, there are so many odd combinations of commits where
> trying to follow the suggestion you've made will just break...
> 
> Something like these two identical commits which are not tagged for stable:
> 
> 	21afc872fbc2 ("drm/amd/display: Add monitor patch for specific eDP")
> 	3d71a8726e05 ("drm/amd/display: Add monitor patch for specific eDP")
 
Yeah sometimes people forget to add cc: stable. It happens. I don't think
anything else is going on here.

> And the following two identical ones which are tagged for stable:
> 
> 	b7cdccc6a849 ("drm/amd/display: Add monitor patch for specific eDP")
> 	04a59c547575 ("drm/amd/display: Add monitor patch for specific eDP")

Yeah this is just standard bugfix cherry-picking, except because you
shouted about the cherry-pick lines last time around they're now gone, so
you have no idea what's going on here.

Imo we should add the cherry-pick lines back and then this would be all
clear.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
