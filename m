Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B129265C28
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D295B6E39E;
	Fri, 11 Sep 2020 09:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6E66E398;
 Fri, 11 Sep 2020 09:05:52 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id w23so2758991uam.9;
 Fri, 11 Sep 2020 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jH7JkBiuZ9sVw7vzrouZ9jGYwqPEO3SQXnY4jpBJ1lg=;
 b=CvFBFtLvADTL+ZXLIuyymiu4NtrOuc23XOu6Bg+3E7IXB5v8ZHkiVSGa2kWClggfeC
 fwxohmyS4adJoFsi9/PlwNCBbgcHuAD9zYE24YqwVX0iLyNh+cSGPII1CnWkJpiZY790
 rw2e88e80/RMPnWca8tMuGFrCCjAw3BkFhFGmMlv/0wYWMpKWPacYr/inv5g32zHMSiI
 Mx0ayPNUzuFv15Ky4SUc19u5pVHCqAXUFh2zMStaJ2QvuZ6GDncoSVJLNbf0GadC8Rw7
 E6vbug4oPWOLoWFglsRzvcP8gRWJb7fuJZDF6smLfWG0sbp/PSUpwp/1SaLH+iY2g/aV
 fBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jH7JkBiuZ9sVw7vzrouZ9jGYwqPEO3SQXnY4jpBJ1lg=;
 b=iidb6gMyqFAy1GzaytSHth/ZLbivdkM84fcVthlcPiTFSU7jFOqI2TmwaDvlxuDSQf
 vGNUZcLCmXKcXD1NNa1j56O/t02YxYiZ2mh2bf2D+Lg8si5wdCna/kwOADuNbWtJy0Fa
 qZI8UrKX8qKcwiHBVHActbcVUXzQwDtbHs5zrf8XC2plEYiwsncGQDe+n/FkaSQqhcPQ
 4QcYT5cJUFgktM3SmulU6McbXMz6Z6lXu33awnczY9wP7Coc3/7obAoNdRn9pV/JaZON
 dD0ppP9Ggn0GuhVQCjiNO0aAIwxE5BEKgXCwyzTSoOFXbLT0GbaDgPX3vHFNgrotGyW4
 o2Kw==
X-Gm-Message-State: AOAM531Fx5VYSDHcLKuuDK5mAftH0VNSFDPsEvf49j6xpobhQlARFaan
 qrX8P+YqRq9O/3tQah4aPDWXcb1X7/C1ijJrzK8=
X-Google-Smtp-Source: ABdhPJwqljlKSOdXZEO+eXrSHtmP1N51bpykO9Hj/AjC2dKQqQq03LZ/AFLt1QdN7o1M+yvJaxHsDNOxmb0QkvYgHZs=
X-Received: by 2002:ab0:2652:: with SMTP id q18mr367153uao.124.1599815151793; 
 Fri, 11 Sep 2020 02:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200814090512.151416-1-christian.gmeiner@gmail.com>
In-Reply-To: <20200814090512.151416-1-christian.gmeiner@gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 11 Sep 2020 11:05:40 +0200
Message-ID: <CAH9NwWeBGBrX=+_2hGRbh4MwKTmK37FvrvHd2-YxSK6eHRmJhQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/etnaviv: add total hi bandwidth perf counters
To: LKML <linux-kernel@vger.kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

almost one month has passed since I sent this little patch series - is
there any update on this?


Am Fr., 14. Aug. 2020 um 11:05 Uhr schrieb Christian Gmeiner
<christian.gmeiner@gmail.com>:
>
> This little patch set adds support for the total bandwidth used by HI. The
> basic hi bandwidth read-out is quite simple but I needed to add some little
> clean-ups to make it nice looking.
>
> Christian Gmeiner (4):
>   drm/etnaviv: rename pipe_reg_read(..)
>   drm/etnaviv: call perf_reg_read(..)
>   drm/etnaviv: add total hi bandwidth perfcounter
>   drm/etnaviv: add pipe_select(..) helper
>
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 78 ++++++++++++++++-------
>  1 file changed, 55 insertions(+), 23 deletions(-)
>
> --
> 2.26.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
