Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF0031840A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 04:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D9A6EDE8;
	Thu, 11 Feb 2021 03:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528646EDE1;
 Thu, 11 Feb 2021 03:40:35 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id o21so3286354qtr.3;
 Wed, 10 Feb 2021 19:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jy8TwQ9J8I3zdoXkycD6WlxbE6nIvABZoAByZOKkXPI=;
 b=mEYWfhCGJKsG/WfDMij28AVXL92G4onC0k4bnBj2VTqHRYRyC9GmlYf0dzX2QTmuco
 Rcr+u6dNeoV9qvHES+OHtI9daW7lT0g1dpjbKgFwVA8Oqg/A9OGTc1wtEVjunpBhY0Yi
 Js1ujz+Rwy/VXLg4kTG12RGcuV325yBesoDlMBj/qs+xfX+bjVSBbyenb9fOPfwsN09Q
 ZTnaV6Krr7UpYciInPyUf/NAGjBTmo7JqVcgbg6fbsk4hdjrfNC34Luy9uyyAkAJAieZ
 WPE1Ra0ddXZ4ruWPdZbZaQZtSYtTcP3jvhUaRJUGAVZ5KoZcLElKFxJxrf9PqjJXHDTU
 RB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jy8TwQ9J8I3zdoXkycD6WlxbE6nIvABZoAByZOKkXPI=;
 b=DtpLduu23yE6s1JouI35bIFFNiGbQAwNArBxujG1qs9c3iQgoa+imf8msgJYiigSPF
 Va505+2boihwXGtpB0uzSzV/b3+un6hvs5VuSSX4BOXYnoC4z/X47uSIdzrQ+HPbz8yh
 BiH+dV/L/HpAnhmwZdcq9Ik+N3MKHZLIa2v4lVviIepnme18DW5Iz5LbgAeo2oouV+xb
 W6eyTpyv+VKdVM5LCveywSlAIfzuli4ZsAqnru2shY/X/IfL10s3s9oKj7rZgThjrBUS
 Hp2Q/8BjYllu8U9Q93z8uWug+1QoAKn3J2mkco17wZZ0rh44RbHqseZPNrXkdvAgnvtX
 X2gg==
X-Gm-Message-State: AOAM530Xv7GxRVwg9yMb8jsmUSU4bmrtz0ETU472csoWVHq2LnyTgLXN
 I/IRXDdbdiChOS+iOQcA40h7syclmo0ZbA==
X-Google-Smtp-Source: ABdhPJzUTpTsQAq0hQZ0YzYh4iAuqc4CDM7p3L5kvb88XMbxUvS/sWHQYvpZOyautPdLNqA/7qjvLg==
X-Received: by 2002:ac8:59d6:: with SMTP id f22mr5975489qtf.230.1613014834162; 
 Wed, 10 Feb 2021 19:40:34 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
 by smtp.gmail.com with ESMTPSA id m190sm2967164qkc.66.2021.02.10.19.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 19:40:33 -0800 (PST)
Date: Wed, 10 Feb 2021 22:40:31 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Omar Emara <mail@omaremara.dev>
Subject: Re: [Mesa-dev] should we do GSoC 2021?
Message-ID: <20210211034031.GA23116@localhost>
References: <CAHUNapTB1tt6T931LfBWVWreXGFwd6tTPqH58i7s3WKivCDT4g@mail.gmail.com>
 <C95UP3DDQ1NM.2OISU75W7OYFU@omar>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C95UP3DDQ1NM.2OISU75W7OYFU@omar>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mesa-dev@lists.freedesktop.org, xorg-devel@lists.x.org,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Omar,

On Wed 2021-02-10 @ 02:31:11 PM, Omar Emara wrote:
> If applying to GSoC will not take much time from you, I think you should apply
> regardless and leave the acceptance decision on a per-project basis.

GSoC works, literally, the other way around. Unfortunately GSoC doesn't start
with students expressing their interest, then organizations applying based
on the student interest they receive. GSoC starts with mentors willing to
volunteer to mentor, then organizations deciding to apply based on the level
of interest expressed by potential volunteers, then google selecting which
organizations can participate, then students expressing an interest.

Without a proper task list XOrg will not be selected by Google to participate
in GSoC. Google has always been clear that the task list is one of the most
important criteria for deciding which organizations they pick to participate.
Mentors need to update the task list with ideas they're willing to mentor. So
far nobody has volunteered to mentor, and by extension, nobody has volunteered
to update the tasks to fit into the new constraints Google is applying to GSoC
2021.

Organization applications close Feb 19, if there are no mentors we can't
possibly consider participating.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
