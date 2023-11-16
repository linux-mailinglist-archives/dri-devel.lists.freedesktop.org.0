Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FC57EDCDB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 09:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C8010E243;
	Thu, 16 Nov 2023 08:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E40D10E243
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 08:28:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32fc2720c47so147396f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 00:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1700123282; x=1700728082; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HoR8YFv2MRX2a6fvRuNrZzhShp2SKZc+/FizpnyYo48=;
 b=XAjjTBnO07lllD42MnIBZtU8Nvz+rPwvgtLunR4p2z2YmEvKeVXLPY+yoCt97CSL9+
 XCB74760nEI1zrWFiuIKz2GDkvKZMW0oIUg+7d6wXBoqq9hIzMv1/jpQMo+sIvXykDwL
 XZOpe7vahtU4emPvOF09T1K13nU8IbFLrs/WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700123282; x=1700728082;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HoR8YFv2MRX2a6fvRuNrZzhShp2SKZc+/FizpnyYo48=;
 b=OYqt79hvQIq/OUdlhZiSmvXOQC/KOgl8Rb/veSUgzOP2JIlzmsBbL5zeXXGhajMP3u
 qYiJKana6Yt0XKXGntoPzQ4g4nU68Noyy7sOzrtwu/u1w8k6ZtJqjp4Q3dlysZCjKJYW
 QeBOEpsUpfoZpFIPLlrf/RluRDnd2DXVFlqe+EufVIGh5qtwVAil5br/1/SAANxUlph7
 mmr4dogLb56UYiCDrCvNoobR6TSjxfSnDncV/Us3vix2czzZ7Qprga9QRsVOCP5thVjF
 2jT5xoI3+SaCoqjAfmW5NCU0tm65tpcFphfRmMESK9G2f78ThnHlotMQft6X513EADgT
 zFxw==
X-Gm-Message-State: AOJu0YyAiExQkZv14xl0tZIjfVYLz7y5whqO+Gp8WEsbJlfv42TwA6l1
 seFmxt5orsnsnm3febAzYhYGkA==
X-Google-Smtp-Source: AGHT+IFWJ7X36hbELNZsu2Qoy7W883Jbwkj5/xgqtPBcjfnu1qrR6mv1JUwfPmOD8HEOYxyeIbfYIw==
X-Received: by 2002:a5d:6d85:0:b0:32d:c217:8307 with SMTP id
 l5-20020a5d6d85000000b0032dc2178307mr5571891wrs.5.1700123281310; 
 Thu, 16 Nov 2023 00:28:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j30-20020adfb31e000000b003197869bcd7sm12910569wrd.13.2023.11.16.00.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 00:28:00 -0800 (PST)
Date: Thu, 16 Nov 2023 09:27:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@redhat.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
Message-ID: <ZVXSjt_1uWHuYXsq@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@redhat.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
 <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
 <20231114134506.2ba0de1f@canb.auug.org.au>
 <530b6100-4f4e-4b3d-8fea-5b316e989633@gmail.com>
 <20231114140855.0b259b2d@canb.auug.org.au>
 <f1b21cbd-5bb6-4030-ae7d-a0ca2fbc76a9@gmail.com>
 <73cg637ax5cahqocscx5cjvtqkwlt4ves6cxgprbwqllasxq6v@gk6vzsqfc46j>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73cg637ax5cahqocscx5cjvtqkwlt4ves6cxgprbwqllasxq6v@gk6vzsqfc46j>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Luben Tuikov <ltuikov89@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 09:11:43AM +0100, Maxime Ripard wrote:
> On Tue, Nov 14, 2023 at 06:46:21PM -0500, Luben Tuikov wrote:
> > On 2023-11-13 22:08, Stephen Rothwell wrote:
> > > BTW, cherry picking commits does not avoid conflicts - in fact it can
> > > cause conflicts if there are further changes to the files affected by
> > > the cherry picked commit in either the tree/branch the commit was
> > > cheery picked from or the destination tree/branch (I have to deal with
> > > these all the time when merging the drm trees in linux-next).  Much
> > > better is to cross merge the branches so that the patch only appears
> > > once or have a shared branches that are merged by any other branch that
> > > needs the changes.
> > > 
> > > I understand that things are not done like this in the drm trees :-(
> > 
> > Hi Stephen,
> > 
> > Thank you for the clarification--understood. I'll be more careful in the future.
> > Thanks again! :-)
> 
> In this case, the best thing to do would indeed have been to ask the
> drm-misc maintainers to merge drm-misc-fixes into drm-misc-next.
> 
> We're doing that all the time, but we're not ubiquitous so you need to
> ask us :)
> 
> Also, dim should have caught that when you pushed the branch. Did you
> use it?

Yeah dim must be used, exactly to avoid these issues. Both for applying
patches (so not git am directly, or cherry-picking from your own
development branch), and for pushing. The latter is even checked for by
the server (dim sets a special push flag which is very long and contains a
very clear warning if you bypass it).

If dim was used, this would be a bug in the dim script that we need to
fix.

Also backmerges (and in generally anything that is about cross-tree patch
wrangling, like cherry-picking) are maintainer duties in drm-misc and not
for committers:

https://drm.pages.freedesktop.org/maintainer-tools/maintainer-drm-misc.html#maintainer-s-duties

I think it'd be really good for Luben to go through the docs and supply a
patch to clarify this, if it's not clear from the existing docs.

We have some wording in the committer docs, but maybe it's not clear
enough:

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#merge-criteria

"Any non-linear actions (backmerges, merging topic branches and sending
out pull requests) are only done by the official drm-misc maintainers (see
MAINTAINERS, or ask #dri-devel), and not by committers. See the examples
section in dim for more info"

Minor screw-ups like this gives us a great opportunity to improve the
tooling&docs, let's use it.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
