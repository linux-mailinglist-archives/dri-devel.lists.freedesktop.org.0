Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5FC672391
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC51110E79C;
	Wed, 18 Jan 2023 16:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD02210E7A2;
 Wed, 18 Jan 2023 16:39:51 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id j130so29080486oif.4;
 Wed, 18 Jan 2023 08:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+ZXSb+wuKJy9CsgvNawGGP2ozeH0Fnjcyrwu9MbaGQ=;
 b=EQ4ZLbfKnytGyWt094o65WR+m9XQtN7lvDdNBVBjTLc5M1Krq0eGGxnhxLFJ7SxR43
 mnXc38o4UcYML1H0qTrI09i9kr8pL02dXwo6Fjh30L03/733VORc3Pxfz8gGvm5Sou3K
 Xc9p8cl7tDgobR3nv61qM9kvRdjUnnSTTkSjJ6K0M4V1YIx5jutkf2YxKxIUDfEhWe8Q
 Zy24SnuKCVq0Fzxk2IdGiKeTUTspFZLqP4WONiOxkJc4fZFUz7F8eSESFb9MekkXEdpC
 vqRFBAOg8CglKrooqWC3gLUJbVeGzCC/EkXZWTd9+1wKrwMj0Zpmn5QhNszX5xxYWo/9
 0mQw==
X-Gm-Message-State: AFqh2kq8l36w18X6i3hxBt8ZNOotHmp4IByNRgs6c0pXane+0fdq9x6g
 Fx8ZOxY5cSLXr1a8qQ3kOQ==
X-Google-Smtp-Source: AMrXdXtYo14PQwXXS67mJEPz08IMq4NM0IJ4JHsdbSGD2YgudqyJ/HYiI52TTqPoAS2TL0siCnxGWw==
X-Received: by 2002:aca:3d8b:0:b0:36a:7668:9e8b with SMTP id
 k133-20020aca3d8b000000b0036a76689e8bmr2109914oia.40.1674059990982; 
 Wed, 18 Jan 2023 08:39:50 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a056830119700b0066ca61230casm1216089otq.8.2023.01.18.08.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:39:50 -0800 (PST)
Received: (nullmailer pid 135922 invoked by uid 1000);
 Wed, 18 Jan 2023 16:39:49 -0000
Date: Wed, 18 Jan 2023 10:39:49 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: display/msm: dsi-controller-main:
 account for apq8064
Message-ID: <167405998945.135868.8993372876832448793.robh@kernel.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
 <20230118032432.1716616-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118032432.1716616-3-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 05:24:30 +0200, Dmitry Baryshkov wrote:
> APQ8064 requires listing four clocks in the assigned-clocks /
> assigned-clock-parents properties. Account for that.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
