Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69442221C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 11:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470866EB2B;
	Tue,  5 Oct 2021 09:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EE66EB2B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 09:21:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r18so8827798wrg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 02:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YyFRyEHqynJbmWmKpAdZjz+T5rvFi/tpprXJLcyRG+c=;
 b=zU6qTFB44YrqG7QPOsXyenlqdjTTnsITuNv4caDgpwMUfUfDza4ur1dItnA+o5tCes
 BABj0CwihjxhMiEdeRqfM6eeHaNAJu/wLcb+30V83CgVz3MiPZNuT4JJKieDuqWj0iiX
 HPFdKAz3Vb0jzuzfvLnA9IhCPn5vBxXkprMTYCB/Fezv02qH9csTJlqzipGQsHtFckzV
 q3ek74KvDAO+ZHK5DEfC49BwDZDX6YF065rWYDXU9sR4UI5q33IMFUMLHdpZp84I8SUp
 fhYUq1lL0T01Y5DJl0yf2qDytTHBQMzDOhPTTBv6hbHbYoNemG+UzYKdAL3w8MvYjbfd
 ABzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YyFRyEHqynJbmWmKpAdZjz+T5rvFi/tpprXJLcyRG+c=;
 b=KYSQWQkMTr5mLk7jP5s8mxW/LOmGcqSiB0i1Bz5125eGLVYqC1o2+9NSc48IY2QRrw
 s3YaKzOgeGE3kOPUc0lDO1TH6EHFxMIYG0uvY8r2bGmxHEPYakug5vkcksX7RD0CX0sx
 D5VwDxmtFx5XTQtKrtLKAPDp9cryPMto8Cs6FhsT+VhPr6Lzaa4gXs+LLf/jLSLQ15EX
 6PJCG8Wid6HtyuGUT+U9k2sQHClkTOs8ipE6K48jPx2h4fRPk5YC7GyTwZw2ZzBshl2c
 bPpW+t7kcs/qQwSy1yYPIFv/hDQwFmtsWS+zch6b2XruDM0p/MbNPqdQ4BI+lLLi6Hq/
 qTLA==
X-Gm-Message-State: AOAM531LKMkRqnwnUUCG+b5TE0iIaIMi5WCLnSxHfABUA02sqEm2Bdmv
 Dcm1DB6SbTncnWS/Ce+tVfC+Bg==
X-Google-Smtp-Source: ABdhPJxGEywgmrBoEZ6DWLGsjAD6iNKNcElVuvD49frLRb7/uaoZeADnEzDGMaHNCxL23n45nw/LPg==
X-Received: by 2002:a5d:55c3:: with SMTP id i3mr20343391wrw.87.1633425682881; 
 Tue, 05 Oct 2021 02:21:22 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id n186sm1266882wme.31.2021.10.05.02.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 02:21:22 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:21:20 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] backlight: qcom-wled: Provide enabled_strings
 default for wled 4 and 5
Message-ID: <20211005092120.pe3z6jzs4bzc2zrx@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-8-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004192741.621870-8-marijn.suijten@somainline.org>
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

On Mon, Oct 04, 2021 at 09:27:38PM +0200, Marijn Suijten wrote:
> Only wled 3 sets a sensible default that allows operating this driver
> with just qcom,num-strings in the DT; wled 4 and 5 require
> qcom,enabled-strings to be provided otherwise enabled_strings remains
> zero-initialized, resuling in every string-specific register write
> (currently only the setup and config functions, brightness follows in a
> future patch) to only configure the zero'th string multiple times.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
