Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21E1997D30
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 08:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B7610E2B1;
	Thu, 10 Oct 2024 06:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jjkLrOxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33D710E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 06:28:22 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso4622085e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 23:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728541701; x=1729146501; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w9dxwcXVFs3vnkTzThkLKa7FVga4fnERpw3hSn0gAas=;
 b=jjkLrOxi3KSTs2l0CX991Kg2uYK1O98ACWIlnfwB3Q9QgPAWOBGa49vEe2Dn8xLX27
 ifgj8967yGpQGy2ONmpjV5y3w5Xq1c2Hm5195Ly8P/KQidCCoHIHH+JuL1lICbEskTHz
 i9GkGjts/k+axw8NQj7JC6SS3nAgjOc6YgkJRhQ3e0U5KtffngFVzAgaAMF70X5RMchj
 ArNymyjGcCmvHOgi8/MUMG3e4NRNVPNADFnQ8OQVyiy1LzWaqPbXi2cIJU/d8sl/Ks6H
 AOGlKREucY8EJCia6B1O0MsOu5NZKQlJQrxqFaPS6YH9O64bUn3+vfarOTRxn8FxJ9Hc
 iouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728541701; x=1729146501;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w9dxwcXVFs3vnkTzThkLKa7FVga4fnERpw3hSn0gAas=;
 b=paP3+7PLA1v8JlB+eNUUbl3KDHEcl5OaP603yy7nz9VePNEg6g+AiLjNFnSO0EZYiN
 oiIM6n0JZTnRy2hBm3KYeFBSKFPLQWfRZHAi7jlvJkOtec2wgq2tKwFy0CLhDr1iF17d
 WHbvCh1z3Lpxm0YVXnnCj8n9SJhjqlD3BlkXDUNRNluhWJ4CxIviTIJ8n5bKYClvUSiE
 OJkNLw9D6m5OD4X7AzvyJr+fmcDmLMrDvJ8KR9jb/P3eQ5n1ytPdUcq+2vIekjBOkvk0
 kNppEdp1B1DaMObbaSdILGHNqZZOPxzj17OJ/jahR01rQzGI1BLV0QTJkO7fGWzD1zHQ
 quEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD12QjXmjJLEdtyJ7xVrMG+p8IOKGn5Q6mM3twLeDk6xmH2RLYQwg6Rv8z6IEzyieRXVPguo7T1ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAM6sPrhhOhbZCcRp+t1Kk9ZdYOZ5JdcH/xLEDl0C6O7cBzjct
 VBu6TeNYQLLseRsmMNmxtbb2+jN6wGKYJ4soalrzkURBaWDbSK4cqIIwgdA6bPM=
X-Google-Smtp-Source: AGHT+IHC0o9tqFtiDG4GnzxZXvNF3ZFqzwHj0uJ1SCAz4Q/E8H+XfyWulVcSrjl1hk3YLD9AEqhUwA==
X-Received: by 2002:a05:600c:3b9f:b0:42c:bd4d:e8ba with SMTP id
 5b1f17b1804b1-430ccf0928fmr41157205e9.8.1728541701026; 
 Wed, 09 Oct 2024 23:28:21 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7ca3sm6172505e9.2.2024.10.09.23.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 23:28:20 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:28:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, skhan@linuxfoundation.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] drm/xe/guc: Fix dereference before Null check
Message-ID: <c2a9c4ad-ce50-42ab-8dac-65914e188cac@stanley.mountain>
References: <20241009213922.37962-1-everestkc@everestkc.com.np>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009213922.37962-1-everestkc@everestkc.com.np>
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

On Wed, Oct 09, 2024 at 03:39:20PM -0600, Everest K.C. wrote:
> The pointer list->list is derefrenced before the Null check.
> Fix this by moving the Null check outside the for loop, so that
> the check is performed before the derefrencing.
> 

Please, mention the effect on runtime if it's not totally obvious.  In this case,
someone reading the commit message would think that it leads to a NULL
dereference but actually the pointer can't be NULL as I explained so there is
no effect on run time.  Say something like:
"The list->list pointer cannot be NULL so this has no effect on runtime.  It's
just a correctness issue."

Change Null to NULL so people don't think it's Java.  ;)  Also dereferencing
has a typo.  s/derefrencing/dereferencing/.


> This issue was reported by Coverity Scan.
> https://scan7.scan.coverity.com/#/project-view/51525/11354
> ?selectedIssue=1600335

Don't line break URLs like this.  Just go over the 72-74 character limit.

> 
> Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")
> 

Remove the blank line after Fixes.

> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---

Otherwise, it looks good.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

