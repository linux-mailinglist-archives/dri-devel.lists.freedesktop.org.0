Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D16B647A56
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 00:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAD910E205;
	Thu,  8 Dec 2022 23:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8339410E205
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 23:47:54 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3b56782b3f6so32591257b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 15:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nKV6BT6LEw5+/sJcf0i0xfNz3b5Jl8HAfbTDKPVt8Vw=;
 b=VZPX0cvTBVVGGwtx4GT5F80JCgxOkH+f87BOJ+ZLvw4+FASwy5Jevkv3jxFtS24CTr
 7EOmoqAEmxhSdrFH54sTdwuYaLF8GC90mMIOv+WdwXKI3nif4JGFq3MmUeEkMZLr2HCp
 NwUSRTz8OkShpdsrbAZcCAVypQLDquNJZbETLv3hT2iAefubao/lEJqmXaKR5JCrS+X8
 a6EuY1TKZnxrEDADa+DLnGxSYiR6p2zEfgTS88G8CXIMilXSFNTK7H6MID+vZ2H8kID2
 Ttj9//d6z3hbpT95cK0Pz1B+NuRbXS2QkJGI4RoVsAuygMwo4VgxhBWPPBGUQJ3fgcXn
 mFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nKV6BT6LEw5+/sJcf0i0xfNz3b5Jl8HAfbTDKPVt8Vw=;
 b=bb+W+6UgaoAxSJD/ECilR6y5D70Utk6J39yl6pWoa1tw1187ONav7W+8Xlikru3V/N
 k2SCR6O+9ugkvoa9833c4EZsChrw+gee/KV0dtlIufTU0AnJZUwGJp5JFaoIa9DE/FZ0
 iAO9mtpWiX1Mk0FiKxbde+WWXpogAhKLU+TDgpPx1r93wtsv9LtfZ7VAalBY+KiIOnmk
 V7EDJu1bgQULTu31lKu/jiZW8mPhCzPtJk1w+Q17K8IU9wnmAFJQUDmRNrfEotu+c48/
 PugyLxwMpDs3lcM97kp5xExqqVx9tU54V6QsTtChS7ink6ocNBj+45BI4IZtIUZTClVz
 6J8w==
X-Gm-Message-State: ANoB5pm9Jm8jrTtdMfkLWb2QU7trePq2/aTP6L4LaNs4RcJoDuGh816Z
 uT6UnWgEkssdPfRjvBLAQvyt3YEQwp+LT3QvOfjpUg==
X-Google-Smtp-Source: AA0mqf6nKXdmqB7cAUt+vD3PhoN3eOlGWsTR4vgctHBKq07KXpsU91IQFVITL+i9eN10ZoLyicieXaZaj4sh1tbG05Q=
X-Received: by 2002:a81:6704:0:b0:3d2:61bc:e6a with SMTP id
 b4-20020a816704000000b003d261bc0e6amr39962281ywc.132.1670543273423; Thu, 08
 Dec 2022 15:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20221130135807.45028-1-konrad.dybcio@linaro.org>
In-Reply-To: <20221130135807.45028-1-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Dec 2022 01:47:41 +0200
Message-ID: <CAA8EJprEq6F3T7iz-oMiagosR+rdPo8Z05vgz9jNjaq2uFv4MQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vcca-supply on 14nm
 PHY
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, patches@linaro.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 krzysztof.kozlowski+dt@linaro.org, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 at 15:58, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On some SoCs (hello SM6115) vcca-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX line, which is
> voted for in the DSI ctrl node.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 -
>  1 file changed, 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
