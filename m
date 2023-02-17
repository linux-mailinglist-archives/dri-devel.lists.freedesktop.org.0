Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E71269B520
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 22:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE1E10E46C;
	Fri, 17 Feb 2023 21:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E82910E46C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 21:53:10 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id d24so3241216lfs.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vrYTA9ehfsvjQ2qG5X1k0zYCEbq+LYYxzJxLjm69hqo=;
 b=QOYBkUXHs2WGR2RY9Cl7thRfNc7rrF6Ki0EE4FKplBKuWQ3y9zQiUR/SP1/8768+Md
 m7px3SfKFTU+A4FgIpUNECBrtYZv8FeScl+A32VAkUgdA+nd1KqFI2ry1MAAPtlltxgd
 knzyDJqLNL3HubGVKEHzTlJnX4nBiDt2Adk2fFW8loBYRf3uM8q+YHHMwRR3misgi8SR
 Fc+KpgG6056leD9Vj/q/FAtnsIKKBbZfhJbVgXhoXkykeCg3omZNYEbg9hsotJ3ZC6fI
 aMeIMtVYq0VPiXQIpUlC0akEU/cfE6vXCSKB0plmgn199AS70Hq/qBNGozUCOC/9JRqW
 J3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vrYTA9ehfsvjQ2qG5X1k0zYCEbq+LYYxzJxLjm69hqo=;
 b=qNZ2mxdq/KWXnKki5godxSiPPnfktT8d38Hby+bGmiijTwKDqbPYyJ3Nd6LLkwXV3T
 z78dHvW/BRPDksEE3keITTlopLX7ctsWaEq4S7RldoNC86W8P6faRXqI+cPz3pufOM9e
 F8EiQj13wHkI26TbyYX92olQv2whJs8kyGw5Mq6jCzEryfusCUEg+cHurty3jkmCSBze
 HRa30Nfh2OGa64S1mvrqd4E7JEBnRpjN/yHnb7nhgkrWXu9FGutyaD/kikadm56xnxcN
 j8jg846OS42WqSvNf9WgmW7AvyBz0Zr8OR8CXwz7i+uxswaNA/Q4zPpXgLRxyV9hmZi7
 FPVQ==
X-Gm-Message-State: AO0yUKVsW8Gz43H4C5yjnw8uFj/l1nO5bDevKz/7MFvSI/rPFkeEvwO0
 2GTEgPk1CcC56mGaBPimyDFFRA==
X-Google-Smtp-Source: AK7set/lwfUg5aQxQh5XTDxnNOktYivNX1xwI+g+h8QmaqrpaHYpf2rRQUZ8wDRxH7BzUCeYprXFPg==
X-Received: by 2002:ac2:4c8f:0:b0:4d7:2187:e1c8 with SMTP id
 d15-20020ac24c8f000000b004d72187e1c8mr499038lfl.44.1676670788426; 
 Fri, 17 Feb 2023 13:53:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t1-20020ac25481000000b004d16263b36bsm786961lfk.111.2023.02.17.13.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:53:08 -0800 (PST)
Message-ID: <7ff320ef-22dc-a3fc-764e-bfc50079dfdb@linaro.org>
Date: Fri, 17 Feb 2023 23:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v13 13/13] drm/msm/disp/dpu: update dpu_enc crtc state on
 crtc enable/disable during self refresh
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1676219337-6526-1-git-send-email-quic_vpolimer@quicinc.com>
 <1676219337-6526-14-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1676219337-6526-14-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/02/2023 18:28, Vinod Polimera wrote:
> Populate the enocder software structure to reflect the updated
> crtc appropriately during crtc enable/disable for a new commit
> while taking care of the self refresh transitions when crtc
> disable is triggered from the drm self refresh library.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

