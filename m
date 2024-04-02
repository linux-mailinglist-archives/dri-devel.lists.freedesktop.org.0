Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C736895738
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 16:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0693C10FD88;
	Tue,  2 Apr 2024 14:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JmejiIBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D0210FD87
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 14:44:25 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-56c1922096cso6709371a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712069063; x=1712673863; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=llvWiU6WYMOEo8iT+6jDXsiJqq1fV6TG+kjDiXbKQ00=;
 b=JmejiIBasiQD+OOJi3l0+3OxDGoBPC5fBNPeRb5clNYHodne0eyuhLBSNhQaFmo/nJ
 WkGGnIn38fqKqGwn73WijMLm65LtHeTfg3H1Cvks1PzQG96qRbVfjN+PEY+tk6qPcs43
 XjnwMvTVdqtbdR7t3168/SGXRB6LXSx1h8FStshejb8hrPMAuyDy4ybS1lgeNdVFBLnx
 cvaAxd7obo19GUVCPgRfwj0PsA8S1MZGs7mF6r+xP+5HbNG58zX8naVvPAXbwSyQG2hc
 rrQ/R5+79AsTMMyAcl+k1taxZAjYxrFDtwKP7G8CacvoTHBEu+Gkn/ZHNichxP+UkDLX
 k6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712069063; x=1712673863;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=llvWiU6WYMOEo8iT+6jDXsiJqq1fV6TG+kjDiXbKQ00=;
 b=Sgt/IdH29ajZ3P91Eiyy0BXM3cOKjOEZi9L9jT2zA6Pgm4m8OFCkUQFTQcWwt43M6C
 CM7UokWp2CUJfbt3kRLkOIVfRQjpQOevMNyx9mrQwzs7jSUiowKiTAKy++K/8W5v6eJ7
 fLbwuZHcgq3xwiURKkqk0+o0eF6LK+zhnKzcScKv4dkRcnm9AQLE3JR/VjmH6vJyx1PI
 Uc5F7W26x5IdgQx1I9DVt05WGvQOZUu26V4N0h9aGRY/OGyR/ecLizk2+Lk+ZpwW2meV
 Grp4pa3YwN2dHE8D2G4DJP8cLjWTzxzMCsJqFTvG8UTDMiFusCYQuQTZe3FL1drzugb3
 GrfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJsIkVIXWu19hMJAD1Ga0AGzDvybX/Lxb6uhfRu+CDmNnPzCrkQ3gvZDU0HPXCvrJSaCTo9CWXc4rbllhDWAn3AjCO1nCMUv63i0RW5NVl
X-Gm-Message-State: AOJu0Yy2DSjYnV2BXKcgAWK7jv3sNBJKj+7/JOU4h2s8Ic1UPvTRhG1Z
 /xGqi5BmZuBbmB8bW8VKYHt6MYzIzzAFfG/OFLMkZNqYpjDMOrQLuWcCcus/BqE=
X-Google-Smtp-Source: AGHT+IGHCy6AW5RJuX88eDfDpaARDXtUhVjEm97XYVInHvyg/NeNlnam7roamuVmcsfAR6UYhzSKPg==
X-Received: by 2002:a50:c318:0:b0:56c:16c9:bd2e with SMTP id
 a24-20020a50c318000000b0056c16c9bd2emr31946edb.9.1712069063270; 
 Tue, 02 Apr 2024 07:44:23 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 bf18-20020a0564021a5200b0056bd13ce50esm6951480edb.44.2024.04.02.07.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 07:44:22 -0700 (PDT)
Date: Tue, 2 Apr 2024 17:44:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, error27@gmail.com
Subject: Re: [PATCH v3] drm/panthor: Fix couple of NULL vs IS_ERR() bugs
Message-ID: <91e25b42-c3fa-4b69-ab8c-5d79610e757b@moroto.mountain>
References: <20240402141412.1707949-1-harshit.m.mogalapalli@oracle.com>
 <20240402163838.34003a10@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402163838.34003a10@collabora.com>
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

On Tue, Apr 02, 2024 at 04:38:38PM +0200, Boris Brezillon wrote:
> On Tue,  2 Apr 2024 07:14:11 -0700
> Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:
> 
> > Currently panthor_vm_get_heap_pool() returns both ERR_PTR() and
> > NULL(when create is false and if there is no poool attached to the
> 
>                                                ^ pool
> 
> > VM)
> > 	- Change the function to return error pointers, when pool is
> > 	  NULL return -ENOENT
> > 	- Also handle the callers to check for IS_ERR() on failure.
> > 
> > Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> 
> I would explain that the code was correct, but the documentation didn't
> match the function behavior, otherwise it feels a bit weird to have a
> Fixes tag here.

The code wasn't correct, it returned a mix of error pointers and NULL.
So it needs a Fixes tag.

regards,
dan carpenter

