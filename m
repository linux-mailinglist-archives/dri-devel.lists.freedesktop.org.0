Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B95757EC9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B3410E348;
	Tue, 18 Jul 2023 13:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A265710E348
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 13:59:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-314313f127fso5377753f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689688753; x=1692280753;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RXleX6XvvB8s2zv+8403BipvUjhdpH3QcnVr9tTY4To=;
 b=VnRGLNeoQQUF47khlmuiG/klpnEz5qvVaWLVP1MJUxcPIay7CLiE9lphF9tt4Dt2e5
 sefNUJ3alEo/N0vcTGK/OfkCmj6PZO2p14iBqEUW4gp9s54Fm4mVk5Iqu+3UqXbrjbZC
 ux0ay/58x0RzyZUZ7bTTlxZRMBlXP29iHGKC0wwq1ZNKQULtImwGe2hU4vG/J23IWbTe
 RRnUUmGztG88H0LtWHQBmlnW3PBV9RtcnFwtITmUg072tN7SSryXyvdCpj7J6Hdsk+Mb
 ie30Xf6Pgz8FW0onDTyh3O8kaRyiq7rOE2+S+AKPIXsmDutCTT4yGU5R9OxRsuvYKB3p
 PwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689688753; x=1692280753;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXleX6XvvB8s2zv+8403BipvUjhdpH3QcnVr9tTY4To=;
 b=l625jQlM5QVK8Po+IYBflTFwG+ZsqvXyk5eLfpXStNEB31kyfnyVRwOWRJJzb6bsl2
 Oa1u2nXXiMn9XMd0bL7cjqrVY8lyNJqbph/5UJ7pluQH7j+T7TyQo55q0T7L1lSj6/xY
 uNLljWMd0yUitXHzprIW+ex/Cs3P2cfTQzBT0RKlljpGLiyT4YNRuxUbb76bcdrnAsKn
 NG/CsUyjJuQXmfZGhbyx9exeolOgDyDBBaNeuv/Gh+ICuAC0JIoLRY68e4KBGllf73i5
 BzKQPVFmO9dHk1LVcYJj4FJHkAeISmFogobl+s0eZnr7MLfGf+hmJihESjpgWSs3R9jQ
 s2xw==
X-Gm-Message-State: ABy/qLYukJw9w1e8W+ailT+SfHHakShth8ufd++BK9G3hHNPiEV1Exkt
 4qUVlBwwg8rs6f5ykftXPyRoDQ==
X-Google-Smtp-Source: APBJJlE2aGTv6/ZrrbbuY6xcrXmRin1I65DSj9S6kIoU5CkYvf2LieqWPg0OxxnY6PI2NvcELdgn9g==
X-Received: by 2002:adf:f805:0:b0:313:e920:639b with SMTP id
 s5-20020adff805000000b00313e920639bmr12048664wrp.28.1689688753536; 
 Tue, 18 Jul 2023 06:59:13 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b00314172ba213sm2434596wrw.108.2023.07.18.06.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 06:59:12 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:59:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: suijingfeng <suijingfeng@loongson.cn>, conduct@kernel.org
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
Message-ID: <90d22f14-c912-42f0-bf33-eb4297fe9fa8@kadam.mountain>
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
 <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
 <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

People have suggested that I misread this and that "bare brain" means
through code review instead of testing.  In context that seems to make
sense.

Sorry.

Anyway, the fixes tag is warranted.

> > Even if the fail happened, your patch is not fixing the root problem.

What is the correct fix then?

regards,
dan carpenter

