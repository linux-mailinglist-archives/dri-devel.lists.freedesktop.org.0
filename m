Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF07999ED3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 10:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C982310E118;
	Fri, 11 Oct 2024 08:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aNT9g9YP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F9F10E09D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 08:19:25 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-37d5aedd177so134693f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 01:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728634764; x=1729239564; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6J+uE5iMA3/H+CWTUJR3uTJQSjnSupLoaiF+Mj5l3T0=;
 b=aNT9g9YPYTRgQNOrxR1j/wfyDlvYwPBKSlPMrR6/k6nVj4+pXi1/9SXOOq8QRYOzCv
 xxKMdzXDvmu5omyaUjuAxV6wTkMC9v4WuRL/03Twpn4bbwUHSInLo/HBqbpNTPSB4TNX
 at8cmT11TzWn9tqx16bG5nMhtPTf22KXfqg6C559qOuCPL1tcgTY/yRxCtj/F/CzoFtG
 TS6Qli28VXK46bRn9Plzb01Hm5Apm6YD8iyu+qTnBCg413/CcSVdgRVSPzl/uwHgrInL
 EW94hgs8pl0DLmtX96Vrgd8db6D41/pVMxUPlphKy3qz6GAqaGdzod9m0v+yjnqTb2VE
 XZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728634764; x=1729239564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6J+uE5iMA3/H+CWTUJR3uTJQSjnSupLoaiF+Mj5l3T0=;
 b=QxZW6WU9DAL37cg65Y1cgSV2vTiR5hvFCaga2Gog03wYbeP3fwhDSRjyRpnKSC/iuO
 oeH2K8tX9RROp7iAwefZjW/MiJQhWHBmcSUSWjRSquSlIFoppuPba1bOzpH7Kn74/xfi
 SierTtt2B20LUWTzMEFo8hFmeph6+ouK4ZIWyRpMHJmgfIKtHDDsqUWHmojVb2HGsawO
 xoUYpZKKGkOhFD7tjkd4ariPO0KJgpIHYfd1tjArlv02n858+kmiFUPuOp/iFGSOMSi5
 ajroKD+pVfudULuHS3GU5iL8CbhgH7K7YLz/Ey0+vGkRtvI3ffIMfKgdz3ZmEa+04mzV
 aFPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHwPSQrgO7yEh46OKbGifRDDjPwSwUP2aDTkij5uSRaH+KP4jvEbj2C25t556JCfDXOp5w8o2eGdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzev5taJmGKKzYGYPXwJRHF3XhBsXG/Qwe5L/2hz8/rfzMlrq6u
 olYn2RM/pPu/VRJ4/sI2IeI205EXGc6io7bzyzv6aCPrX3zYyjnh87jQfSE0FBc=
X-Google-Smtp-Source: AGHT+IEh1qHegvlY8LqZOcJFQcPmv4Q5bDdymgLxEN3Xxvmlyb6iR2FO3wDaCT1RCr7OgyZ3OSgJ4Q==
X-Received: by 2002:adf:e908:0:b0:37c:cd0d:3437 with SMTP id
 ffacd0b85a97d-37d5530438bmr1300655f8f.58.1728634763634; 
 Fri, 11 Oct 2024 01:19:23 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6a87d3sm3346373f8f.11.2024.10.11.01.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 01:19:22 -0700 (PDT)
Date: Fri, 11 Oct 2024 11:19:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 skhan@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm/a6xx: Remove logically deadcode in
 a6xx_preempt.c
Message-ID: <ef752080-130f-463e-bcd4-e1a33fc962bd@stanley.mountain>
References: <20241011052315.4713-1-everestkc@everestkc.com.np>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011052315.4713-1-everestkc@everestkc.com.np>
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

On Thu, Oct 10, 2024 at 11:23:14PM -0600, Everest K.C. wrote:
> The ternary operator never returns -1 as `ring` will never be NULL.
> Thus, the ternary operator is not needed.
> Fix this by removing the ternary operation and only including the
> value it will return when the `ring` is not NULL.
> 
> This was reported by Coverity Scan.
> https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600286
> 
> Fixes: 35d36dc1692f ("drm/msm/a6xx: Add traces for preemption")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

