Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7889FD306
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 11:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE4710E2D9;
	Fri, 27 Dec 2024 10:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cK8MmOpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBDB10E2D9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 10:33:20 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2165cb60719so87167345ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 02:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735295540; x=1735900340; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/9Jxj5WoOGdaR6yZnJLdK5T66rYjkJpwQm1hwVxy9b0=;
 b=cK8MmOpkM8rPB7xYR5as9BGwvbwDGaUeEEs26i+LcN59IK3aXsTckD/3s6SiGmyJsU
 4VEL/LfBBr+DNbJlVF48xBx9DeEZSP+U4YjMay3Zf1K2xYsLcN+Rc2O0HiZxd//HiN6B
 tBjaoUnXhv+s4flFoLnCWq8PKVnSt+acJKA3zNPTG5Zh5292Kn9XcZ4vDYjz4BHvhei+
 9P60N/ENNqmea4vcflPoD6dqoXdXwQG+ZtI2GFPOvQY+yPColxA/9SRZci0T3YIquLj3
 luv7pS0sekXzKjT9PQf6GHWmkO70xYFhHVu4edyPa09xpSnC0tYc9ZyabhH+0ygfiP/N
 F5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735295540; x=1735900340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9Jxj5WoOGdaR6yZnJLdK5T66rYjkJpwQm1hwVxy9b0=;
 b=rjxQidVKbRW/W0wPkrZlWJjLIkLTK7K+Ks74q3PvhxVVsBd9bd23KGXwcKKVOExzpM
 X+2krfvCYvsVR0Z5tCPLOGHW3a3Udc3M2g6pOHV3ygnWkCGmKXkO/Lfbbte7Y+mRd4Ad
 cIU9VO0zfaICVjtv7BNeM2UICrlq1y0ZHbgSb4v36SHgyeCgKrZxofvPYzizbfNXC1ik
 8cIIx6542JohoCj7BeEYh2Jm74JwqM/J5iwB2rg3PihcHTn1cOCbJHo7hg5LAS4klqw4
 K1gu0c9NsoFMDp3t1n1FI5oEP6W/UoJDYMPIz+CSQ6zFJDPkxlHV4tqir7bxdePQn5y5
 kk7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi4IJLeQJBJRgwxAs5exx7im0ru5z1gFPQx289dyG026vACzvLdNCdQw128VQKHpK891CrA8PDkGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLhhHM0lxa5aEhaZ16pK19dglcteQR4j45Xj2ca0b0GqLdeKtW
 jNAv3v6XJqQ+btZzhLvKdJybAaDV8bKDKfl4IzFhvumRTCnNvpldXFKihaSi
X-Gm-Gg: ASbGncuD+LW4uySfVRPdqm/9eOqF2u70erIxeTBEDtw7IagpHhxlYF64VOdrSafeul4
 zKnEFLH8pBtN75p/ETgCYcWz+yATwFUQliTGm0+ogLvgNZG1pc1TuXvMgs+VYWnK9ALfZBm7FOH
 eQyhxIfQ5+K7KE8FiysZJNvlDS8C57bxJHEfkvAHO8XKrOI6Of3ea0Tx9tiX9PDzLy2efMJk1Gb
 wxfJrVGrzd61+k4XHom2xJn/9n2K9wTrmUuejVklOiQnuu4BVbxeso=
X-Google-Smtp-Source: AGHT+IHcaM7vwaSQBhJYYWdpl2IDIifRWBpL4TAL8gw/pXtf7ybDIRxltoR9Sgb6wZBcdOwqTBzFXA==
X-Received: by 2002:a17:902:dac6:b0:216:59d4:40e7 with SMTP id
 d9443c01a7336-219e6f25e08mr254176955ad.55.1735295539726; 
 Fri, 27 Dec 2024 02:32:19 -0800 (PST)
Received: from Emma ([2401:4900:1c96:94e2:5054:ff:fe53:2787])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dca01931sm133186115ad.245.2024.12.27.02.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2024 02:32:19 -0800 (PST)
Date: Fri, 27 Dec 2024 10:32:13 +0000
From: Karan Sanghavi <karansanghvi98@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] drm:sprd: Correct left shift operator evaluating
 constant expression
Message-ID: <7a4mwth3m6s2vrdskga225bomgg77tz6w7gn4saoaexwz4cnom@3omyqhmgp3kz>
References: <20241108-coverity1511468wrongoperator-v2-1-72bc73d8691f@gmail.com>
 <exeho44dd45ujgha6jmnvt2idbq4twfm3d7lxmhbfgfeujyhmn@tohr2hoytwhl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <exeho44dd45ujgha6jmnvt2idbq4twfm3d7lxmhbfgfeujyhmn@tohr2hoytwhl>
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

On Sat, Nov 09, 2024 at 09:27:36AM +0200, Dmitry Baryshkov wrote:
> On Fri, Nov 08, 2024 at 05:11:25PM +0000, Karan Sanghavi wrote:
> > The left shift operation followed by a mask with 0xf will
> > always result in 0. To correctly evaluate the expression for
> > the bitwise OR operation, use a right shift instead.
> > 
> > Reported by Coverity Scan CID: 1511468
> > 
> > Fixes: 1c66496b1391 ("drm/sprd: add Unisoc's drm mipi dsi&dphy driver")
> > 
> > Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
> 
> Please drop the empty line between tags.
> 
> Also see Documentation/process/stable-kernel-rules.rst
> 
> > ---
> > Coverity Scan Message:
> > CID 1511468: (#1 of 1): Wrong operator used (CONSTANT_EXPRESSION_RESULT)
> > operator_confusion: (pll->kint << 4) & 15 is always 0 regardless of the 
> > values of its operands. This occurs as the bitwise second operand of "|"
> 
> Is there any kind of a public link for the report? Should there be a Closes: tag?
> 
As mentioned in the earlier mail, there is no public link to this, there is only coverity scan link which would require you to login in the portal to view the whole error reported by it. 
Here is the link 
https://scan7.scan.coverity.com/#/project-view/51975/11354?selectedIssue=1511468

> > ---
> > Changes in v2:
> > - Added the fixes tag
> > - Link to v1: https://lore.kernel.org/r/20241105-coverity1511468wrongoperator-v1-1-06c7513c3efc@gmail.com
> > ---
> >  drivers/gpu/drm/sprd/megacores_pll.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/sprd/megacores_pll.c
> > index 3091dfdc11e3..43c10a5fc441 100644
> > --- a/drivers/gpu/drm/sprd/megacores_pll.c
> > +++ b/drivers/gpu/drm/sprd/megacores_pll.c
> > @@ -94,7 +94,7 @@ static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap *regmap)
> >  	reg_val[3] = pll->vco_band | (pll->sdm_en << 1) | (pll->refin << 2);
> >  	reg_val[4] = pll->kint >> 12;
> >  	reg_val[5] = pll->kint >> 4;
> > -	reg_val[6] = pll->out_sel | ((pll->kint << 4) & 0xf);
> > +	reg_val[6] = pll->out_sel | ((pll->kint >> 4) & 0xf);
> >  	reg_val[7] = 1 << 4;
> >  	reg_val[8] = pll->det_delay;
> >  
> > 
> > ---
> > base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
> > change-id: 20241105-coverity1511468wrongoperator-20130bcd4240
> > 
> > Best regards,
> > -- 
> > Karan Sanghavi <karansanghvi98@gmail.com>
> > 
> 
> -- 
> With best wishes
> Dmitry

Thank you,
Karan.
