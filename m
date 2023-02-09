Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A026910A0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523E110EB60;
	Thu,  9 Feb 2023 18:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E114310EB60
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 18:48:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qw12so9282061ejc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 10:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C0XFAAN/R3Nk3WTCxVWqIYm+jEES9opCixMqEiVuViY=;
 b=pUGPWsmzseTiUdXm5Gq5C3eb2NwodF8g8zjRmRTiE7I/5aPZbtQUcYbzWCMFGxDoBf
 bW/uqtss3/h+HTZLyKkgMSMIUJVo6Dv6YAjlisoTh92WIfb8U2pCQbk+pv27kg8WMwuc
 QzAahiEQM7+E3qehrq7vSGtBSOjMvWzjNEZMFbvjZwN5ULMTA9P/IH8Iqf1B5mHAGZvH
 RdIZCHwY/E8Mp2LGeKIJWg5TeixFYr0sHRkG9qG73xlqeImTn/agcE/b6LkeFCja85sp
 LBJcPDXUrVsbSYzZt1Xo3DGs6oVZSmgA2iNfzYh/uPbkCmY86JXSGN1mH0MBqhjqvFGN
 1nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C0XFAAN/R3Nk3WTCxVWqIYm+jEES9opCixMqEiVuViY=;
 b=NIUAjyim/4VZL5WH0kbslfsiDIaaGvpfeeN/3YWczhc/Q4+fmn/JpeKqWEbsj+zTFh
 1YGm7zuTRYwLwFYunFL94BYH50No7RV/rWQbPMikLRyLHKiprp0f0M033wLSsgGSFUp3
 cXmXmwoJ0g7LEs7ST/Asx8k9h5pKVdB4VNIQtVv+EuSwEwDYHu36vE7KDovrou0j+HgF
 yXpog3MkDcuBIGMwCt8nYq2sViRRH/sa+o/OKEcEA4pTIbVtQKLGoNvx1iwMoi3vFrW6
 XM4yIAXVtDKGA33cTteEgN4Z7cUxKyZ6UtHSBlxNohDtZzP2BGsb3SF0xnZ2Taft961P
 96gQ==
X-Gm-Message-State: AO0yUKXzjRnd4GbQisjUZ3HkUKprWqYmfXWqYPDA2NDT1hPQZif0spc3
 5POctsw/3IdLpQHxNbVYolGEuQ==
X-Google-Smtp-Source: AK7set+qkUjZFmf6QQRtEvHs5uIs2uEFZ0sHmBfO82Y5zz2lrkZQXi+23m9SAyU302Gu3nVmrstadA==
X-Received: by 2002:a17:906:b142:b0:7bd:43e9:d3ab with SMTP id
 bt2-20020a170906b14200b007bd43e9d3abmr14772263ejb.52.1675968488402; 
 Thu, 09 Feb 2023 10:48:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a509993000000b004aad231b316sm1144383edb.40.2023.02.09.10.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 10:48:08 -0800 (PST)
Message-ID: <e4c48c3c-b3cc-7760-83a9-7af6eb74bf2a@linaro.org>
Date: Thu, 9 Feb 2023 20:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 2/4] drm/msm: Check for NULL before calling
 prepare_commit()
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
 <20230209184426.4437-3-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230209184426.4437-3-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2023 20:44, Jessica Zhang wrote:
> Add a NULL check before calling prepare_commit() in
> msm_atomic_commit_tail()
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

