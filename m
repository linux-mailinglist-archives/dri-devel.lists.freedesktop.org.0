Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE491670F7B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 02:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34DB10E61F;
	Wed, 18 Jan 2023 01:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142CB10E61B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 01:06:32 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qx13so21226108ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 17:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ShTmxSJXe9bG7EdfM5n7W4obQRT36vojvBzqe2LAzEY=;
 b=pZshoTDIWonMzbts+iSk6eqAXIty/XSzGtUDl9PJeQ8XVUyN/eHTt2p93ttz9KQgTu
 9wfLh03a2Yb3RFXF3Sru73t0ORxZsuNA+p8nNqcl89jHRmba9Nt5u7K6/H0O2u8Dy6Qq
 I5UHAGKvsW2h2rCWGoKhMd7Zbo7kvESJIZWJ8RX79n7YMMu1z7Nz1jxAKVxhutkTa5OL
 3lZJt4S31txk7HCAkWRoOz4c+86BN1b5X+30T1zblG8B/4T9LZDn6c8diFa/F/Fhl5r8
 b5BLOL4Pz7VtVUp68bH80NkeocjPtgKEm4YLe8ons9LlWTl/LkY870OpXlxUItBZHYpG
 qKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ShTmxSJXe9bG7EdfM5n7W4obQRT36vojvBzqe2LAzEY=;
 b=4mgPi7LBFUwQB6duQba0fIHArqf9j84D+a2DVcQBzkxIsIS5WCGtS+nXrUqZxtkyFe
 o8SNCUi/giz5LjI4AIKzNJ9SWF5gcgakzjp3Hvl3azjcy1uTq/HB5sgLFEyAev2IlTpb
 jqLgbKKsic31Md3pSnUpg8kKIY8DC+T620RZTOWxAjiV4B7NAXy73YETmY9xkjsWgGTf
 P1P1vis0Z5Da06GhZTDrVBkDOl+OYgFrrzRyv7YxYZOGQwz91QH1ecf1I1JxrJZQc974
 +nXFXAmIkw1spqSnF1TGMt7TWMQl9R0B9Hhrk+6Hys2jWA64atOxoyjJWljgUdyhKJoc
 h5Cw==
X-Gm-Message-State: AFqh2krlVIIOfM/NEqePpujTnrJWD82KXxQMVKlgRLCYWITBNaRAWt/n
 H1/KjOvK0KbtUebW2EJHk4UQQw==
X-Google-Smtp-Source: AMrXdXtu4QsednS1nJEdQYpyn+WjmVTWu3VSvaUMOChD1AOs4/QnNcqLZuuyzhNt6LzroTs4JBrteQ==
X-Received: by 2002:a17:906:6844:b0:86e:f478:f598 with SMTP id
 a4-20020a170906684400b0086ef478f598mr4836197ejs.44.1674003990637; 
 Tue, 17 Jan 2023 17:06:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906210a00b007c0f2d051f4sm13786939ejt.203.2023.01.17.17.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 17:06:30 -0800 (PST)
Message-ID: <e14e929b-884c-4250-bce8-0c21fe4f1c8f@linaro.org>
Date: Wed, 18 Jan 2023 03:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/gem: Add check for kmalloc
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, sumit.semwal@linaro.org, christian.koenig@amd.com
References: <20221212091117.43511-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221212091117.43511-1-jiasheng@iscas.ac.cn>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/12/2022 11:11, Jiasheng Jiang wrote:
> Add the check for the return value of kmalloc in order to avoid
> NULL pointer dereference in copy_from_user.
> 
> Fixes: 20224d715a88 ("drm/msm/submit: Move copy_from_user ahead of locking bos")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

