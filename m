Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B348BAD13
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 15:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0763C10FC23;
	Fri,  3 May 2024 13:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="NuRkhnQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44E910FC2A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 13:04:20 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5aa1bf6cb40so5959034eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1714741460; x=1715346260; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=T24fsb6UmCj1BuBe7A8xi01GqDYWjj7XjEjPE3iHXwo=;
 b=NuRkhnQP7PP+PVbcjBXjJs4a9XtSihwCwN2mJew2iZ51BBlh9ofwN+QNfxnxVPuTNa
 UQ1egdJpESZTc18+m6Pn1ti4n+D52WPc5XNT+sbvg77fInGwGRgIsjkPguraQQVuo+Ed
 toGELxcx9uW392DoDJXz8KMs4u3zqF699Ft2h0SrP/yZBShxhqZOpBrvS+ydhpsukGMw
 /eCVB4KlTjNBm8nqP3ixvuo6ljUGvJxKaEYiwKv/XX8f2jM/DmI5zO3DHWpqM+vNqocB
 0UcnU4GZvMkVi6uyM7OuWv2MWNn0yYfdNbVh8xKu1GPguJeZol6G2M4OfsfiowNuZ3IS
 1Kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714741460; x=1715346260;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T24fsb6UmCj1BuBe7A8xi01GqDYWjj7XjEjPE3iHXwo=;
 b=dP4RLDS9hWNM2wGkCDs9xqnDFx/KrTYXrAPpk78nqgMTNSCL6pD2ULa2o8PjMd1rwT
 eCPtwFArxrFTaFB7e05KSv4gSz3PvdF85dyX7ax7/1pQwkSVyFs2/yKM15i57VYWUfZ7
 4x8lKdWGDHfv7UBgOvO/P4zkVeu+e1sckcOtza+n/DY3JXEmrsL0gepCb4InXSPZTfnB
 zZjtvkcp44l1ve9S9Lah3NpIxNODtPULaOeyChfDrMiiPpP6kL93/90LYoC78Cn1gwPs
 f1elHkiqyex3QaWE/jsuz+/iC9SpcMY0otse9xkWpzpePyMiNiLZ1qslMskUqNzEfunA
 GJ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/JTrwnV8psWopNcll49wiNuRjw3dEKtcqkylf0jGJepB9BO/lIVeXPsMDhoeRfHrmOYWPP/HMv2M6SWK4BHwM+6BGXzMmoXQJEqcfJsKN
X-Gm-Message-State: AOJu0YyNL9biku1/yDY568rzwcbatxziD7q4LJtuYgA0nYTxE3zNSo7G
 v3lNoRXPD/3aAyDyiWU5qcLILFAsHSNhQB99CHmcDVsbSlDEtndVsC04VrSoH/U=
X-Google-Smtp-Source: AGHT+IFkDVZmGphlJUVtShrOiyFDXAxL2dqwcQGk35D/hs5G0hXFSbZERBs+fJjVjtBARWifNREq9A==
X-Received: by 2002:a4a:4bc6:0:b0:5a9:cef4:fcea with SMTP id
 q189-20020a4a4bc6000000b005a9cef4fceamr2843172ooa.1.1714741459559; 
 Fri, 03 May 2024 06:04:19 -0700 (PDT)
Received: from ziepe.ca ([216.228.117.190]) by smtp.gmail.com with ESMTPSA id
 gr5-20020a0568204cc500b005a4bb400a0fsm620032oob.4.2024.05.03.06.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 06:04:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1s2saG-006Wjv-Qi;
 Fri, 03 May 2024 10:04:16 -0300
Date: Fri, 3 May 2024 10:04:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org, Leon Romanovsky <leon@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Lukas Wunner <lukas@wunner.de>,
 Dean Luick <dean.luick@cornelisnetworks.com>
Subject: Re: [PATCH 3/3] RDMA/hfi1: Use RMW accessors for changing LNKCTL2
Message-ID: <20240503130416.GA901876@ziepe.ca>
References: <20240215133155.9198-1-ilpo.jarvinen@linux.intel.com>
 <20240215133155.9198-4-ilpo.jarvinen@linux.intel.com>
 <26be3948-e687-f510-0612-abcac5d919af@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26be3948-e687-f510-0612-abcac5d919af@linux.intel.com>
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

On Fri, May 03, 2024 at 01:18:35PM +0300, Ilpo Järvinen wrote:
> On Thu, 15 Feb 2024, Ilpo Järvinen wrote:
> 
> > Convert open coded RMW accesses for LNKCTL2 to use
> > pcie_capability_clear_and_set_word() which makes its easier to
> > understand what the code tries to do.
> > 
> > LNKCTL2 is not really owned by any driver because it is a collection of
> > control bits that PCI core might need to touch. RMW accessors already
> > have support for proper locking for a selected set of registers
> > (LNKCTL2 is not yet among them but likely will be in the future) to
> > avoid losing concurrent updates.
> > 
> > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Reviewed-by: Dean Luick <dean.luick@cornelisnetworks.com>
> 
> I found out from Linux RDMA and InfiniBand patchwork that this patch had 
> been silently closed as "Not Applicable". Is there some reason for
> that?

It is part of a series that crosses subsystems, series like that
usually go through some other trees.

If you want single patches applied then please send single
patches.. It is hard to understand intent from mixed series.

Jason
