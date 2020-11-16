Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9824E2B5163
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 20:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5B86E0F6;
	Mon, 16 Nov 2020 19:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910E66E0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 19:43:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d12so20044974wrr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 11:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=T3bQsgj6/TdWyaR1j/y5LeOnUCmki2zEPh5MGH2qIZI=;
 b=cq7nQaf4tCgFGEJgMtaGf0UnLrWyEvgcD/PbOLhv94FymY97OT2tyyLmYgWLmR7Z3p
 j5tb+7NxPIOjMpw5PuG/PMn0/6Sf5DZYwKbsIjHJNeL7y18Tm3Nhpt59FH7x7aIIb7Gp
 d2F5kmF7Xdi3JsoMFlw8RLMVWcRpIBm7i8OhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=T3bQsgj6/TdWyaR1j/y5LeOnUCmki2zEPh5MGH2qIZI=;
 b=rR0pX+cA9w38DvTwD4fUecoCbLCr/BiK+nqfMnclA5dr4sPyEkR+95TV889X2wlrw5
 re69or2vXsQsVbuyVQzcurSeSI60up4b3BcEpt5x8feZuje9tIMaKvzkAvqPCUCcaGqO
 al1cSoE0VOVfXbl7eEzzE8A61imVf5dfoEssTQzUdFkxjjy6nS3USyhCeExKKEEqJaPZ
 qUwmy1Y/lhNXAiPUYv0V+S81wVES6cB36YB1o8269Iu/z6JVmBZnQpILQkhiX2PSjsq7
 p6zuTPcWD5feo3EmnqeRt/s5DIDYWXgTj/yJ4tKDemWTTvb7UM+dsivpxXxcC7k8Ytly
 RqkQ==
X-Gm-Message-State: AOAM533KurlR2cPISqS4krjmQ9b5jQk68zw+4TgwP9T/TA6nXIBWVh1/
 bX+0snszVvEuNXGW1GJKlB2RGw==
X-Google-Smtp-Source: ABdhPJwKERkzMl0LaPFGiAEbmO0JIhahjV99lnngXah18p5ORSHJ7NHB9nGBIQOsW67X2oo2SrIEMg==
X-Received: by 2002:adf:ea03:: with SMTP id q3mr20016106wrm.141.1605555823876; 
 Mon, 16 Nov 2020 11:43:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t11sm355613wmf.35.2020.11.16.11.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 11:43:43 -0800 (PST)
Date: Mon, 16 Nov 2020 20:43:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 10/27] video: fix some kernel-doc markups
Message-ID: <20201116194341.GE401619@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Bernard Zhao <bernard@vivo.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1605521731.git.mchehab+huawei@kernel.org>
 <21661aed9892a1bacc7ef76a5dc9f5c7b37f5d8f.1605521731.git.mchehab+huawei@kernel.org>
 <20201116153606.GC401619@phenom.ffwll.local>
 <20201116173804.7d64f55f@coco.lan>
 <20201116172404.GD401619@phenom.ffwll.local>
 <20201116181112.GA103421@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116181112.GA103421@ravnborg.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bernard Zhao <bernard@vivo.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 07:11:12PM +0100, Sam Ravnborg wrote:
> Hi Daniel
> > > Feel free to just merge it via your tree. Patches here are pretty
> > > much independent ;-)
> > 
> > Ok I put it into drm-misc-next. I kinda assumed since there's also a huge
> > effort going on to shut up warnings, plus I think kerneldoc issues are
> > reported by a bunch of build bots nowadays. So assumed you pile this all
> > up.
> 
> Any reason "drm: fix some kernel-doc markups" was not applied?

Oh somehow I thought that one was only for i915 issues. I guess I'll take
a look.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
