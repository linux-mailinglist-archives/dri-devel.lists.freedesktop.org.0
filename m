Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D068573FEE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 01:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E665792E99;
	Wed, 13 Jul 2022 23:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A59F92E78;
 Wed, 13 Jul 2022 23:09:20 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id l124so292667pfl.8;
 Wed, 13 Jul 2022 16:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j+8RK9v8gWGa5a91FxFwYr8BWqBvGM+/s21xcS2xt8M=;
 b=iA7WMNFyc+2XPTgeCCgE9e/euFNEX10zqaFS1iIgoVZCInr/5Sb6xcueFpO3imu4iG
 enBbTqueyvLuuPDOVSAzW2/AbYP8h+2TBN58ChG2YJb/EpEU2Mf5kxQxA+0Tv2ra+sg8
 Lnq6gWbxojeU68uDvp3yCP888hp9nsLwZ4zMKGlYRkb9XfyqSGJAvNpRg97TH0kmb825
 qtiyXzCD6cVYRC7/tj/WNz0DbR5MLgVz6NsTLYhVOLpqLMRk1yRlcvFcGA2pAQNjHNz1
 7QMOph3xxPFAPDnRNUeJyLHrnFw/VjPeJswM9sSXayWF7HWPVCF1vOD0tuz9G0Hu63EN
 8SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=j+8RK9v8gWGa5a91FxFwYr8BWqBvGM+/s21xcS2xt8M=;
 b=g3lTsvbaktRNz19r3a2l95T8CHkKkUAhkQGd2YMzwNIBwd3ckMVrM6CImHUqbpoHhO
 YvSWPl1MjjmcsxFei3Ia91o/0PI3aJ/U8ndJBbFPYm/f9U8l1s5GmqYvst/DCPZk7o6w
 UmqqIT8Ipf6gr9ftZCSKZTJuhidsZG0MNkEXX7O9muJc+ZQDU7LjFu9eub4mRVlU2Xmp
 Jtm5yw6W2dsc4KV8EHa+VQtJtPXyClmUQTUbZ8zVTRCxH+OEmJUHQF1EYzmFaaBxY674
 yf8j1+JUq9DyBBA2mZpS/g6GaPk17P3FmAekU4NYEusR525RbpCMKJlu4jY6iLCPS95N
 gGyA==
X-Gm-Message-State: AJIora8so1MC/6d1cmPijotNJWugrEo9YFH1bYhMcTemRHMETehB8yt7
 hLWIpaxt4BXECon9TXYGBWU=
X-Google-Smtp-Source: AGRyM1sbZBfhPjfNH4IFyitf+1xGqss1Qja+bIDVjylaz/VxJhz5dXPtuOpvzJN6BZkHP1Y5/Smlug==
X-Received: by 2002:a65:464d:0:b0:412:6e9f:a4e7 with SMTP id
 k13-20020a65464d000000b004126e9fa4e7mr4709555pgr.104.1657753760197; 
 Wed, 13 Jul 2022 16:09:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a62f801000000b00528c26c84a3sm84399pfh.64.2022.07.13.16.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 16:09:18 -0700 (PDT)
Date: Wed, 13 Jul 2022 16:09:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags
 for PPC64 builds
Message-ID: <20220713230917.GE32544@roeck-us.net>
References: <20220618232737.2036722-1-linux@roeck-us.net>
 <584fc348-7a60-26a2-af61-9edc4f4830e4@amd.com>
 <CADnq5_NkVWqcxwLMBeskqpcSEYCEjUAK0hqvA_PAo7ACHKL2cA@mail.gmail.com>
 <6a026c9a-c4ee-deba-e028-4c0f478c1911@roeck-us.net>
 <CADnq5_OrxMMkazXEPHeZXp_bV890=r21DRx2QsqLXUFj4t8aYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_OrxMMkazXEPHeZXp_bV890=r21DRx2QsqLXUFj4t8aYg@mail.gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 05:20:40PM -0400, Alex Deucher wrote:
> >
> > The problem is not the FPU operations, but the fact that soft-float
> > and hard-float compiled code is linked together. The soft-float and
> > hard-float ABIs on powerpc are not compatible, so one ends up with
> > an object file which is partially soft-float and partially hard-float
> > compiled and thus uses different ABIs. That can only create chaos,
> > so the linker complains about it.
> 
> I get that, I just don't see why only DCN 3.1.x files have this
> problem.  The DCN 2.x files should as well.
> 

Seen in drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile:

# prevent build errors regarding soft-float vs hard-float FP ABI tags
# this code is currently unused on ppc64, as it applies to Renoir APUs only
ifdef CONFIG_PPC64
CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn21/rn_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
endif

Does that explain it ?

Guenter
