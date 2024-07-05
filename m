Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9639928AC3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 16:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015D110E25E;
	Fri,  5 Jul 2024 14:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C1+hn8F6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53D210E25E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 14:34:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52ea33671ffso1204198e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 07:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720190074; x=1720794874; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LEJHO7rkl+xJJJhR/OlOUSXNtS4l+Ak5HXkZa8xkzw4=;
 b=C1+hn8F6MF2TaB0L07eFkdpiKq1L720gMf0kNH5fDnp+xsdOrBPBpSUveLG3RYrOhQ
 dz9/xrKkIH8qftBKBDO/HPwsv5FBu36TJlQVahsHr67MCmxaRlwqQUtmv89LmoAcMUw9
 TmuwDvoQzU9WUjxwpMaLf8Y8gFKhg/CZFsamBTrrKPre6qrg6Z7MQEquo7FwtdGD2jUZ
 fhP3MfJtrdC5U+ahK8Smd0wKrjbUUUjgUCcYPz9bj+BTfQUbuFCs7eMiZJqgPkyb64Sk
 sFPOOxE5WqF0l0PKDNM+gfZVtcb6O/oCyMOOzp4vv8SFtT2OEATtBLmGenbARPouL/HD
 a+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720190074; x=1720794874;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEJHO7rkl+xJJJhR/OlOUSXNtS4l+Ak5HXkZa8xkzw4=;
 b=LhQYwtDAn3WCkOPhR+dFu3Zr3OiJu+V+yBt0b2l3BhWxPbyluveZbsaFe1aCvPwA+i
 mnCKB5WrUk/op25NE5PisdF+cspR5QLl2YfJ+XT86viqoI8SEG/faOCCykBwM6nN8h5N
 sMY/c1oUBqZLhMYyN94zn4CpnXSTZpscDmF/cndKpsAxASfSfpILTE0xJ+qVIRMg8xEE
 JHcVYksFOgMqYQFvu7YsHhogiI9tfJKFLkLdVlBpRXCmuYNtEdf7VvsYkMUxGNHNuuLU
 cFVRzmYSD3vSl9IPSTSjHfIcol9UOrnaJwWmXgQ4asvzgcj9ymg2z50e5hnilUBjmiRd
 X3UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs4MLwynml2vTqFHJb9ZpqYXHRsi6/v8OwLpAM/JAPpykkbxl+Bcu5ZhLGTllBFikbv6MAm0pATXGkG2gQOWOVY0fq8Hx4qJB+jzKWXqL8
X-Gm-Message-State: AOJu0YyGRPRly6h5m/ZP4OcowHx5GAk2ynec+WhE+ejgsTC/o7kdhpFH
 mBpD63yoJ/Q5tLHesgR05pn9mpbbn5mIxrQD0/4DIjL1kvj1AO4WHDbcldgEAwQ=
X-Google-Smtp-Source: AGHT+IExpSPLbhdfXO79t1NxOiXDtAHEROuoPPAPjqvX+SJpApir1f2/GJTe7nfTqsNHoDT+/oAc+Q==
X-Received: by 2002:a19:6a1a:0:b0:52c:f521:9423 with SMTP id
 2adb3069b0e04-52ea064ee3dmr2962725e87.26.1720190073677; 
 Fri, 05 Jul 2024 07:34:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e9f183e00sm575303e87.305.2024.07.05.07.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 07:34:33 -0700 (PDT)
Date: Fri, 5 Jul 2024 17:34:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
Message-ID: <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
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

On Thu, Jul 04, 2024 at 06:45:36PM GMT, Marc Gonzalez wrote:
> From: Arnaud Vrac <avrac@freebox.fr>
> 
> Ported from the downstream driver.

Please write some sensible commit message.

> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/msm/Makefile                   |   1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c                |   1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.h                |   8 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c            |   5 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c       | 789 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/registers/display/hdmi.xml |  89 +++
>  6 files changed, 893 insertions(+)

- Missing changelog
- Missing a pointer to bindings. Ideally bindings should come together
  with the driver.

I'm not going to check the math, but it looks pretty close to what we
have for msm8996.

> +
> +static const char * const hdmi_phy_8998_reg_names[] = {
> +	"vdda-pll",
> +	"vdda-phy",

Unless you have a strong reason to, please use vcca and vddio here, so
that we don't have unnecessary conditionals in schema.



-- 
With best wishes
Dmitry
