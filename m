Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A73D9F9B44
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 21:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD62010F04C;
	Fri, 20 Dec 2024 20:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zcna6xRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DB510F052
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 20:59:03 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3022598e213so23817491fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 12:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734728341; x=1735333141; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eTXfmCPQpqaSsnBYjJTKGEssZ1+MNZ8axMaFGfX2txw=;
 b=Zcna6xRpIO1E9X+g40QBx5UG/Z9z6xuCz9+2iKWVtVzqsgqfV0FeS7A+c7pQmwRbo3
 FjOPEyZ5al+R3tmshOlY0P35IJiGipOso6VMmJvc9rdMGyxFHJbKeDLUL9jbEaa+WqVX
 XNKGfPfYKwrXr5YNm3NHpBtEuvSTxWHXTM57YWMdt71XiJz/ysh8z7xix6JgwPwJkUda
 6epurSDiPokG4emeXjY/8h+d1jM1y0sOSpdD0z1NCIZRYYabnhaJEmmSJjm3z/FOMBW5
 cjMUClRNLPRtIJR/nCeECjfm777HIvuLxVvSjqenZm+g42KpfWfA1vVb7L5nf+XwQ1Dv
 Iq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734728341; x=1735333141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTXfmCPQpqaSsnBYjJTKGEssZ1+MNZ8axMaFGfX2txw=;
 b=PdEt+bqTOgjg7Z8UFwyOlZIgUKgwsnUx5D6gqfhWcBXpmSQTp0KlBoDSOxPS+Bm2iM
 bgd7bN1kKOouqnZ7gE7DomeDPDkpreNGphkLt8V8L7AYB5zmX9oCOdf7W93aXibFflcW
 DCRoUCRhEmXuqqK1mlp2R2O44gZy9JDSFlrXQfnn2EEL3badp05vpXNxwHu9rsEU0UPS
 nyas4CWn0Vz7xJ1c+jrWNuW/pyZIBRXHap7/WHJclRnKivcx82mWKeBv6bweFIeccY9H
 1S+7ztMjlJBrK/vBrK65o9eEDhTzQBrrhNEuQ+giQb5MFA8D9coCmYlBvBxrSApjBAos
 dotA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOyIu3Iq5rVva+GSEGstASeGIRH1R0dePeRVNwcq+OI853EoDqSaYVFvvwtGUdIIrPu/Zflr7ta+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfqwqJR6WJs9WSSpgsObI94gUE/5H2lVoo4SSo01FSfU0kSI2+
 vmjbYS2NPpQ/CXI3zDSSDLP8d5nanuExNeh2ycgOZb0AwBvaPFLboiS9mH2ATUk=
X-Gm-Gg: ASbGncu9mEhVgwVzwEm9KYlAUDdhgrOcs7PRcgNYyRUmzqw9osQna0z6QfW412sOvdK
 fIj1UbLeuZXkl01mfRYLQP24RcpS8lLcReImJaNSGzcsFcZSUliMXREDbB5jqhnAY1xBbGlf+/p
 SL7gd3LJeodDKhCfM3UckVBwb9dGdcHKxJuxyzn+8Lz166omPd5RIgFcpwCdEjV2NBff+cT0fnG
 GQDyvU+x5bvcCQL2Me1vs8jsmiCcdDwANIfWzgeCV02fPXIx44K4P6H2gmLv25HEKvMMIONDn4C
 Sl7hsjbXJBqS/JZQBwGE2k/NENW0+z9zeFqf
X-Google-Smtp-Source: AGHT+IF06lbDnsdPix2JuyrjcK+9hqCW/H2TA06DYnRKwBgBAUcigA0Qx8udGG+5W57u8WPQftM6JQ==
X-Received: by 2002:a05:6512:128f:b0:542:214c:533 with SMTP id
 2adb3069b0e04-5422953c131mr1457338e87.30.1734728341318; 
 Fri, 20 Dec 2024 12:59:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422382fa84sm563119e87.233.2024.12.20.12.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 12:59:00 -0800 (PST)
Date: Fri, 20 Dec 2024 22:58:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3] drm/msm/a6xx: Add support for Adreno 612
Message-ID: <jsuzytkpcs7xmsaaedypz6w5d4ia6rckxjqg2x7mp4sidxxtqk@t5ukbn3sv6oa>
References: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
 <df25ffe5-b20c-41a7-b178-b191d332cb19@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df25ffe5-b20c-41a7-b178-b191d332cb19@oss.qualcomm.com>
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

On Fri, Dec 20, 2024 at 08:56:31PM +0100, Konrad Dybcio wrote:
> On 13.12.2024 12:46 PM, Akhil P Oommen wrote:
> > From: Jie Zhang <quic_jiezh@quicinc.com>
> > 
> > Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> > A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> > of A615 GPU.
> > 
> > A612 has a new IP called Reduced Graphics Management Unit or RGMU
> > which is a small state machine which helps to toggle GX GDSC
> > (connected to CX rail) to implement IFPC feature. It doesn't support
> > any other features of a full fledged GMU like clock control, resource
> > voting to rpmh etc. So we need linux clock driver support like other
> > gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> > Since there is no benefit with enabling RGMU at the moment, RGMU is
> > entirely skipped in this patch.
> > 
> > Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> 
> So we talked offline a bit, and the RGMU requires a piece of firmware.
> 
> We concluded it's best to describe that from the get-go, so that the
> user doesn't get surprised when a new kernel update brings new firmware
> requirements for previously-working hardware.

I'd say, please make sure that the RGMU firmware is also a part of the
linux-firmware from the beginning.

> 
> Please wait for the new revision.
> 
> Konrad

-- 
With best wishes
Dmitry
