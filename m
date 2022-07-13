Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A7573F62
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 00:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ACD9BECC;
	Wed, 13 Jul 2022 22:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141849BECC;
 Wed, 13 Jul 2022 22:05:56 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id a15so402111pjs.0;
 Wed, 13 Jul 2022 15:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ra9hdzLCWwjPPBDp9cn53pB2Ci+cucubpWeaOQOj3nY=;
 b=Gqwc3+E6w0EUF/ryvZOM4ovQz3n3gcYqACQv2dejPsJfA5O/wU8nGEQUcv61RAF+cb
 hLl/cPYFWMfQCVdBsDh6NhSQWFAwOX8Vzp7WHXgVlMcXiSnFD5P5ZzxZh8QG5d2xHvML
 XMB2H3z/CnPx5yyHH/mxTYWTjLppLYUzCxWY5yP5dgOvi3W/TnIjjEchOdsaW7R2yhsR
 qXFwX9JnouBnIsaXd2fJHfUPY8wMNFKW7Z3oDBI4id2Z4vAU3i69EMRG958N2WGRYieX
 VmkGpHLFCwAH5dkmV521bX0NiGRWhSmQFJjy3YB49acExMxjqrhUmNFEdW52xyjux/ol
 apzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=ra9hdzLCWwjPPBDp9cn53pB2Ci+cucubpWeaOQOj3nY=;
 b=PfAHEaPrWRlWjZr541xer+mBX+4Kd9IaIwwXfgTC3LJ2J1RigvQxg4VGj3Cu14yxLy
 EOQOVqD1aKtYqcNG62BaNNm9+VTZsHj7wkwv7SFgeeBPheSuV4KiRrIRAGD7lXCcDKZX
 3SOUDHuN0Rh9Xhr95U52IRBBdYT2u7QYJSW9GfHZXD8lF2OO7jhna9ZVg8IXZ3YcTweT
 IJeidXnnKTaB2rOmHHYzrDQdSvTH20zgpYlbbly5Rkdi1LpmVP99VhOwivIOw1mck9kX
 0BHeytivn/L11QWZujnFqZIzGoH4VemoD8WX/bCiWcqcOHemAwG5A46QHWxZCVuSCTlE
 x9Iw==
X-Gm-Message-State: AJIora8a/VoHVD2Vg89TxEO6bQPFZLY7RuEKFdK56S6UCT0EXnoFwU0i
 N7LrD4pRY9XmdpJv8GHoOtU=
X-Google-Smtp-Source: AGRyM1v3IuZuzLMmogJuClkxEYuGp/WqF2V6GQmHWVJT2/8FMaDWSfVLQo+pCfmtMA2ZAHXPmlphXQ==
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr12406264pjb.164.1657749955684; 
 Wed, 13 Jul 2022 15:05:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 mi9-20020a17090b4b4900b001ec84b0f199sm7050163pjb.1.2022.07.13.15.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 15:05:54 -0700 (PDT)
Date: Wed, 13 Jul 2022 15:05:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags
 for PPC64 builds
Message-ID: <20220713220553.GB32544@roeck-us.net>
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
[ ... ]
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

No idea. Maybe ppc:allmodconfig only builds DCN 3.1.x, and other builds
don't use -Werror and the warning is ignored.

Guenter
