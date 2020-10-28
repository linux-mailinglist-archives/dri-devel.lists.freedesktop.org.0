Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC22A29CE55
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 07:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546E36E480;
	Wed, 28 Oct 2020 06:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EDA6E480
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 06:11:10 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t22so1965254plr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 23:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Jfk3J2HWTP8PctuzhKYdTIaLNJsr6tS1vv/WAefJOL0=;
 b=MY7NJazs/V1vUwMi4z64c6d2TDVii3D2bzDs+hYBOL3KCq+kyeids1ajNncKl+6S4U
 SUpT3/5hpVoT6fVwbwdNMsXA67mDufbWhNjqKj2UJ7pxXVp2jQBLY9uvFaQ+8PalmjKD
 RDNsTp/LvRReFmAdZT64QpwonfJm8PKXyflUxC2nuwlrUcMPWDHJ+OEOe4Lf/Jcuz1Zd
 2NyLCT2ef+4C2hcHL1iJw+IeJ874gHWVmKPpS1ffWMVq+F9r2C9NTTMOCNMeQJgTahE8
 LINwUu5dTDzMSdMC/UaN8kSzEuv/w5BBA9nEmfcFXdiRgseBVErEk9DUyp9wz4AoJLPf
 sbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jfk3J2HWTP8PctuzhKYdTIaLNJsr6tS1vv/WAefJOL0=;
 b=E3rBz1JtlR4FB9TDcswhUkdAHCpvGFxDl03fUbgkuwPkyzTISK1GE7lSTfZrG5g0Yf
 RqEOXNHfSTbRHFO9LhC/LhYZf7Ik28nqnU4fVRzJnCMdi3JTrNiUFqTGXotB8V4csW2M
 EJbMlylzEGRp/EvCGH4ex/SGD7jHWvYLiSOGDy1To5WLJwirp0PljKGzm7qcv/YndqJC
 cKO9YmVzv3Mg6ZlCF1GvJm6C7pXgbKvICgJr/KEzNM9KzrnXwNy0h46IPLG+up9lP1up
 y1bIhjVlFtq6CF723HPxyeFiYxkL8/AT/NFzXnJmQ23fS1rGE8OfXdkgcRW/mn9qZmqN
 TDGQ==
X-Gm-Message-State: AOAM530uBR8UDDHEt3QJHkHqyHayojR5V407IFPca5uxaGvvMNxjbwzn
 VJhgbLMNCFv/O3Hd0nTwWUaZ4zzotomk
X-Google-Smtp-Source: ABdhPJzl3xHaVJZAUQPn41OZaKgSP6iI7ParKyNDpI0aA7iG1PjFKK7B+EOvYd02InEBSYnve9JMkQ==
X-Received: by 2002:a17:902:b113:b029:d3:c5c2:e667 with SMTP id
 q19-20020a170902b113b02900d3c5c2e667mr5709126plr.35.1603865470392; 
 Tue, 27 Oct 2020 23:11:10 -0700 (PDT)
Received: from PWN (n11212042025.netvigator.com. [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id t10sm3819423pjr.37.2020.10.27.23.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 23:11:09 -0700 (PDT)
Date: Wed, 28 Oct 2020 02:11:03 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/5] Fonts: Add charcount field to font_desc
Message-ID: <20201028061103.GA1206440@PWN>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <6c28279a10dbe7a7e5ac3e3a8dd7c67f8d63a9f2.1603788512.git.yepeilin.cs@gmail.com>
 <20201027185935.GN401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027185935.GN401619@phenom.ffwll.local>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Sven Schneider <s.schneider@arkona-technologies.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 07:59:35PM +0100, Daniel Vetter wrote:
> On Tue, Oct 27, 2020 at 12:34:26PM -0400, Peilin Ye wrote:
> > Subsystems are assuming the number of characters of our built-in fonts.
> > Include that information in our kernel font descriptor, `struct
> > font_desc`.
> > 
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> atm can't merge this because we need a backmerge of maybe -rc2 into
> drm-misc-next first. Please remind me if this doesn't land next week.

Sure, thanks for reviewing these!

Peilin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
