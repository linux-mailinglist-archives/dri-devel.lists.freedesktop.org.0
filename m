Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807BC859E76
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 09:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906F110E192;
	Mon, 19 Feb 2024 08:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bsb2EJRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AB110E195
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 08:37:18 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a3e87b2de41so59613166b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 00:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708331837; x=1708936637; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ojbVELbGUO0Fdw1LO3aSx5BEslcvMdmSrG39OaZaxOY=;
 b=bsb2EJRkFeVY9wwZ/hwUX7bO9dOXHRumJJ5r3bKIk7v73WRa0yGy5+B5ywqaPQdLpG
 E+j1IIJoRNynaIj/Q3m3y589M8dLuoPj2TnVC3+z1ay4pWmojsLQ83hH6JtR7wUYpdN8
 T5jBL2zKtgPnjKmxqyKVH7FUanr9nzuW2YnyO0fdu1lnZsXY/XrHyjBJSHsI79acZR/y
 tH/2slR3YdxgI9ozYzvU1s+EKdJOmdsQwDk8N0XZUzxygqYxW+Nvozl2velN9Gs03Yee
 uO8OTQcdt5S83N1w/tnQ3A/b6CVrFcwm/9eDMxLrr1NSm+AWPiwHL6+dOfL8tUHPSvg0
 ODUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708331837; x=1708936637;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojbVELbGUO0Fdw1LO3aSx5BEslcvMdmSrG39OaZaxOY=;
 b=osP/egQk+IeMwZxoHV4Yo8LgwteTHeAqD5IR691Hb7uuSAocomvAasv+ITNFVqKn6P
 yJbuv7hcaa6RMG431hOIB8kl5ll4aHtMGngke/ZGyHyrOdvIfvbbCJ1a+KEh7HQ8SPJm
 NnMqBdLWfYVCAwJr7ut/KcpIq9VlwYbVGmrqSJbt4RrHhW0cLJWgLx27+TQLwXPHzDaw
 LhLf6Zj0NEAWHrMsomInaraWiDV3O3ZlQTzYyDTGIngCC37KoyQlLv3LhxPnAD+S9Lfv
 /sTjs6PPwuyX+WRS8YxDOa7B0SqBAARbF2Xb615UpLlVYBPx4KN4/sfwyI/EJfrLjtHp
 ujDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjhYEfBguuWSMynaldnYvXauG/jtFryefBvGg9uSRv7rtsuF1qvpwnBkRfW1q/qrl57DqkU0qJrwIYYarqqjEOVHWyvm3U3AzRamvHEWKX
X-Gm-Message-State: AOJu0Yyr5eh2glxB0fMBlKQ54GO1OR4djlyH3aI1HiGVeLkaosjiOB3N
 iimeg7E01HI8Ju5BiEfmDg9pr61VXBM8ib8K9VgrD3dpW8ggIx28+CauXjvrz04=
X-Google-Smtp-Source: AGHT+IHPRRVfa7/lTL/FAHCnZ0EhKSDENbaTpEre/56m0a9j/pZ89HxBxVne3vEkeUmJJ840QF6VYg==
X-Received: by 2002:a17:906:fcca:b0:a3e:473e:26a0 with SMTP id
 qx10-20020a170906fcca00b00a3e473e26a0mr2936656ejb.51.1708331836826; 
 Mon, 19 Feb 2024 00:37:16 -0800 (PST)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 th7-20020a1709078e0700b00a3e059c5c5fsm2695590ejc.188.2024.02.19.00.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 00:37:16 -0800 (PST)
Date: Mon, 19 Feb 2024 11:37:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gustavo@embeddedor.com, keescook@chromium.org,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
Message-ID: <91d964c2-3d5a-4e96-a4db-e755455c5b5c@moroto.mountain>
References: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
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

On Sun, Feb 18, 2024 at 06:46:44PM +0100, Christophe JAILLET wrote:
> If 'list_limit' is set to a very high value, 'lsize' computation could
> overflow if 'head.count' is big enough.
> 

The "list_limit" is set via module parameter so if you set that high
enough to lead to an integer overflow then you kind of deserve what
you get.

This patch is nice for kernel hardening and making the code easier to
read/audit but the real world security impact is negligible.

regards,
dan carpenter

