Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C565A03456
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 02:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3EF10E160;
	Tue,  7 Jan 2025 01:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J+tD7ZNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2510E160
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 01:09:00 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3e8f64d5dso26977676a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 17:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736212079; x=1736816879; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Qu8WQXQCtZnShf6h8tAcD5s24D9ELy391aex/eneOc=;
 b=J+tD7ZNIcrwHMsUywXoTGNedBoeRLFSRf3pK9pf+l/OLTZFkFywd5MQgMGM4Uh0LhR
 ftXiVQq4AD4heoFPQtz0C9UBlyb9OqqHGc2p0H/mI7G9uPwYn2Ir5T4w8eLf00g9UtFR
 OvzIcjiag0zDpIcAXTAzQQZ4jST89ui8VkCWULZYlXDjdfMmWN/PqClJY7K3Ay7DZh91
 FT/d7bx+CUh+edMPAKiDsjjlV7NKh5hqE6+iGglAiDUiTILVCMM+ROj4T0kjvzgnAYr9
 VCOQp5+O8c3Eq8KiFDIOH7GUfkDoPTsBeJbq0TVK9TaYs/hmDoWk/0vgMRvT/RSfjiuz
 raPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736212079; x=1736816879;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Qu8WQXQCtZnShf6h8tAcD5s24D9ELy391aex/eneOc=;
 b=SJgEzB4pAyE/Uxp5Ra0WPibnxGf72r2bhQKxul444zQeOmPUhlU5eyKHcK9kMH2Zsk
 5nv08mBfI9vFIn0cgfUDI187gEztDwOdFL1hdyLEONBaFE2vWrH1cjzrBv1l24gWoTSR
 ku+9cMkE3o57i5PcApNuLjfFCaYvqOVHV6WXNSFTDBv40+rCRDDIZ9AghD2gExL70G4A
 qB4Q22gPJg/PImAL9l/1NZTV8wp1sBHn1Z3u7thjy1XIvaywAfIuwaaKiQrsI+mZbMWD
 oF7AEhlPPgnRbfYK7pYFo+bmnpTKsI6fqk++YAQ6dYsl++fewSRJdgDL1B0QVP0XFXuX
 jEcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFwKpvedo3aw1oluoIhtvSrV7Nhfzg+DEtE43QsjcVA5NC08lDz3Ni+WyQ8vPMBh1FDv0Nv0k0okk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtOmrvZlmSnfmTAg/hkJMlr7LfUwxzz7GgEOL+8jDNLVQTteJA
 1lcLMgjK+71Fe5CO9r1U+jptdt3YyAgBC+KlCARpl/9CQOHXrOYb1MIcxYJXYvE4Gp+LOtNm4TX
 EujoS1g==
X-Gm-Gg: ASbGnctCBHFK9V0HQlasI7xManKYp4YoyLSkPu1r/+IhvO6rIkFcA1vHnMxK4HhXvoZ
 EGxD1RovsC3WICvRoMcLzPbIXQULJtxo38sExFBiu7n/dVJw5R3Xh0VZiHh0asVUwDJEj3HlY+F
 +ZSPTEx6ZGONWpDcEhwMwyvHhNrWXCPt+l7ombQVGgCnPowwI3j3awW2P7cOWI1w8TyvJBydhjD
 itdfl9ng52Nxl8JZ6Fu22N0LS69D8wY0VBjiG6EOrMzW5pjG2515aW7XvmmTnJKD3BFMNOYsWX/
 q2vrdDSyVytpVEg9GWoEla0/giOHFqyD5mgE
X-Google-Smtp-Source: AGHT+IGHVOrjHEa9YHZQLk1c+OGgL7giB+05TWOpDyNnvuG8TPH/ssBfuMDBwWRFHIFp85M+tdvrWw==
X-Received: by 2002:a05:6512:10d2:b0:53e:39e6:a1c5 with SMTP id
 2adb3069b0e04-54229562a91mr18706777e87.41.1736146160752; 
 Sun, 05 Jan 2025 22:49:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813670sm4904307e87.152.2025.01.05.22.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 22:49:19 -0800 (PST)
Date: Mon, 6 Jan 2025 08:49:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Li Liu <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>
Subject: Re: [PATCH] drm/msm/dpu: Add writeback support for SM6150
Message-ID: <w2ybpbn4caps72e6ac45jae3dgmmmhf365ks2sonfmj5uyfvsr@wr5ymif75xbp>
References: <20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com>
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

On Mon, Jan 06, 2025 at 02:39:09PM +0800, Fange Zhang wrote:
> On the SM6150 platform there is WB_2 block. Add it to the SM6150 catalog.
> 
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
> A followup patch to add writeback configuration for the SM6150 catalog
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
