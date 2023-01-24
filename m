Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459167930A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 09:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450E310E62A;
	Tue, 24 Jan 2023 08:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1102410E62C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 08:26:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g11so11929095eda.12
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 00:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2e7HEaZzLpkgKJ+mpx17xzcEDMDD/CmZJqe3c3ax7l0=;
 b=zncYDCgpGkMatClGm2DMi0c0OdVcLDIdyt7Rb9+a8egPe9nKd5uiikyemO8vz+bfmB
 MRPOX3cmhv3RPVHso+TAS6TGx4StMby9I+rUgSgSdmNgKT5Bu7Plj2aTZuXe/G6qJDo2
 PdzSVUP4Tb8Yy3YhDaqgb3xOfjH5NRGzuZ693taFd9cp1UHCKtOYffDhVD51TxOxVCam
 0V3SJOEUEPz1BXoNVDwiW0nZr+5pLlbwVB4+UUjOn8DF+FdHa62vDoI2AyUOttcEU2r5
 yo+jAqoE+tumTM8Hu0xcYUo2N7F4cDEzhbZcFCRszTe6mIm8ySrNBALs4B415aOnQZo1
 D6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2e7HEaZzLpkgKJ+mpx17xzcEDMDD/CmZJqe3c3ax7l0=;
 b=F+pPBJ69ibo2Wju60WpHdmpCs7MdE0oADMX85ZM2pvKPkC9fJh4PQnRiXvewdoL3Ed
 NkfWQkxz47uPYuRdSGlSwJWCkdJJYgRP5/vr6NQq1kzsCxh+bIw71jMdvFKXRfmqY4Gd
 Sg4vdX6lvuTKP5SUxWjSUtuCaD+woEY6sf2nsrP5ApmDc9MKi7AY/PEAMYSY+BUzN3e0
 ti+/Yr0n3WESlPRm7IRhTLQ3VSUN/ASAS80y7NxFL6FCgFO7I6f97/n6l4HNujpgcfF8
 WVZBUaPHNSWRFA89cUkgMQ28Tv9XQ8Yseh5QNfkhpmfmFsfxkZvA7tAdHFIhWluAcw7X
 2Rlw==
X-Gm-Message-State: AFqh2koF6u9e5l+sjqLh27jJvwHX0hg4leHBmvdPDtzA0itxN4PEsNdJ
 7byBoXtT2rH2U28yKpB5VgOlSQ==
X-Google-Smtp-Source: AMrXdXvTlmdYJDkk7HNWHOpnCfo2eeTcCcUwQ4fhimZfI+UQoykA0RByBJDf74eFAZPIC7GmmB9kGw==
X-Received: by 2002:aa7:c9ca:0:b0:49e:28c1:936c with SMTP id
 i10-20020aa7c9ca000000b0049e28c1936cmr26949737edt.26.1674548773533; 
 Tue, 24 Jan 2023 00:26:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b23-20020a17090636d700b0086dd8f20a6asm561330ejc.77.2023.01.24.00.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 00:26:12 -0800 (PST)
Message-ID: <b8a3b544-daf9-a357-1ab8-236da345a413@linaro.org>
Date: Tue, 24 Jan 2023 10:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/mdp5: Add check for kzalloc
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, quic_jesszhan@quicinc.com, ville.syrjala@linux.intel.com,
 yang.lee@linux.alibaba.com
References: <20221206074819.18134-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221206074819.18134-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/12/2022 09:48, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer,
> it should be better to check the return value
> in order to avoid the NULL pointer dereference.
> 
> Fixes: 1cff7440a86e ("drm/msm: Convert to using __drm_atomic_helper_crtc_reset() for reset.")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

