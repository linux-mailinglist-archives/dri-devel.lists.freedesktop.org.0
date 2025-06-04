Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197BACE3A9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 19:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6C110E75F;
	Wed,  4 Jun 2025 17:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GVYjfYr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CFB10E75F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 17:30:47 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-60700a745e5so1581480a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749058245; x=1749663045; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VTP8yObExwFLrSuZsJ8d0cIpVtNnBIjCqJ6qq7uMBQI=;
 b=GVYjfYr327pL/cVqf0dz6tcTZ2DrM0f19nzHGXrvo1q/32zjv61u7iEHt2o0nB3sSt
 cFWlTdNEKvHpQ+RlTacroMJiy8eLlVeqeD7498KKDEp98kFrjFaa8ZgwRbzCqf95kFwK
 3LPSPbBlzvqus6homUc6/YOy8BdqGtRm2UaOOx9fXaBLNR7OnJpi7Zn46OctrwgBFhEq
 RiTvmH/lWOjkSJtxdt0i5y0wYVOiXdCn/w8Rf7S2AWA4KgaYAQTDKOkbSQmgH8NcJPEg
 IPyJuwwwNtKa4WYGVQD7bjSFuLZmKZ85qKAfMC+38yHyMQd5DlIkOqC0S4ydgI0BNqxN
 LzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749058245; x=1749663045;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTP8yObExwFLrSuZsJ8d0cIpVtNnBIjCqJ6qq7uMBQI=;
 b=veZNYhtNVPdA1M1sLWFQMLANroCruMhW0tUUIO4VGY+k4e7iXKfi7NtpQiLOl9D/sy
 AeLH5G1yrd1S5Uztri2JuWGPKSnz0YCTmcq4RJGl5AIQFeNPrGH+takWtJUa4M1I+FUo
 qlRd1j10qWyoS3LSWdsciwTpHWDSzv7JrLkHNQb+IL4WhRtvG77VVqJqoKsO0hYObfuf
 aVoHWYnHyUaf3gngqZ63z/hKilOF2qbF0cz7H2Nu0/rqyzlZfDGUG0Xx5ngRVQCS0pWb
 G5deUqntTgLWwZqHdh8lGwyPQZeKMfaYYVbNDL7gqHsnVZbbo8KFKDgWDOZViCzJYaN6
 KhJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Csm1T5cIy2n0YRIqW9i6+EY9/pr4tvvTUgiHT1cb6LQ7lPb/oTLQKNaMKtWW5T0OcZUAsWwy9fA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK0O2Ri4tI9zQ+mltOWe6pRH69Np0QRPryW9202CG3suUgsiaQ
 dhQusw3PGjtnFhImbtjuZPN745zLX/WDulQV0yrtL+PZ2uUMTsglhzL5eIVecdHEK4Q=
X-Gm-Gg: ASbGncvfdMfVXMzQdg8JFsqVo0QFmPwCjSWiLYfrdG6mZd0Kie0E1r6UAOXK8XXGtL5
 hrnRGirF+axGegSNanv6cFKSra178OuPXXY5+SnK8lp18G7GxrBL5WBFySa4BQI3IvDA6vdXQwz
 Yrv8ioHsfCRtCJxHqvqHpsamW+NFjBRK2iKp3U4deEOZz0S2GtvX/6RF4GKChL+/0u2HFQZfa3s
 CIp061rZgMA923x64YMw3vUYL9GTec7tGqPIRijDFkSag8QFI9Ip6F6pHvthb5i2TlFZQLxlxBQ
 r2f8idcjnE7eltasUO3jwFZK3lOk+s0v7piwrw8m37eLQuX9CZSg/3s=
X-Google-Smtp-Source: AGHT+IHMbpNobcGhf8u1NkCYsfc6cgq22A6GsdCftAQGwTdTJIr3/4zn42Qxn/bHns6QSssKDLwTKQ==
X-Received: by 2002:a17:907:6d0d:b0:ad1:fa48:da0a with SMTP id
 a640c23a62f3a-addf8ea6c55mr326456166b.35.1749058245497; 
 Wed, 04 Jun 2025 10:30:45 -0700 (PDT)
Received: from localhost ([41.210.155.222])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ada6ad3a6b6sm1144489066b.142.2025.06.04.10.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:30:45 -0700 (PDT)
Date: Wed, 4 Jun 2025 20:30:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [bug report] drm/xe/svm: Implement prefetch support for SVM ranges
Message-ID: <aECCvh--XuQYFdAU@stanley.mountain>
References: <aDSDfusiM8QGQwFS@stanley.mountain>
 <0183ca8d-4347-48d9-a783-361c6543db14@intel.com>
 <20250603222952.GD407166@ziepe.ca>
 <aEBeM1sWuSNWNij6@phenom.ffwll.local>
 <20250604145657.GB17991@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604145657.GB17991@ziepe.ca>
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

On Wed, Jun 04, 2025 at 11:56:57AM -0300, Jason Gunthorpe wrote:
> 
> A WARN_ON would be reasonable

Or we could add a WARN_ON().  That's also fine.

regards,
dan carpenter
