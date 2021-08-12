Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50A3E9BA5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 02:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62096E209;
	Thu, 12 Aug 2021 00:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DAA6E210
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 00:31:12 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 r16-20020a0568304190b02904f26cead745so5596276otu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 17:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PLCgWUlIwJKxfCShn29qzVeYMAxb9Jy6/zN3VIhO6gc=;
 b=F+OYirtrBGe89AnSkLHY5okk962mMXPAjiVYp3bwDE3Y0e6yJEGiSoJa1Amx7Jm/zz
 fSUSKYN5T+ZdYRgOOq1FEn2NxKXPC+HEYR9HYicAEF4RmfkFpX5U9cbrlwF+eUFD03FY
 Tq0DAX9aAxh4iU/4ulEK/J7zMULXUXeWovJbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PLCgWUlIwJKxfCShn29qzVeYMAxb9Jy6/zN3VIhO6gc=;
 b=ZpVcOygXehjdOo2dd7N4vTBSPggGQzckUOoc93Lt0mOhCT9a7XnioK7lv8LOdkm+67
 A0rdzfz+yRlSGL8p/JfiqtdzyG/haPr42bQK+24qXO3dW3U5Ggm2SVkLttDJW3c2gvwT
 bOrFPhFyoswaJQw+lkv691ZFtlAXxksuDDYzQAkqqnP2fy8VBn4cpufJpqYV6Rgq1Y+L
 r6F2V1H8ucClEsLp358PFBYUgkeZMc/nEfTpStkkgC3GfjLvzhZmzSow9uspFHKWq/s9
 tu0HSs9jpstSgaVi/aeEoSlH+TGZKOsb3ER918bMTyvHMFTk3Fla5bCDMbt3dddjbaQ7
 Hyow==
X-Gm-Message-State: AOAM531WawajNvA9TX0cpkoTiCaSXA9S0RM/zHSdMZc12qjj/r+HWT1Y
 eplkbi0EFO8M6eK8jrEdyYVyNg1GrSJT0clo9ZS/JQ==
X-Google-Smtp-Source: ABdhPJyG97deqUVD5kKCSHP4TSJP+P7NfrbuOt/mh2i4whlYEQ588RKKNWLWiM2kuB+OHQvyR9jjX5MbyQcTVdydZn8=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr1286181oti.25.1628728271301;
 Wed, 11 Aug 2021 17:31:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 17:31:10 -0700
MIME-Version: 1.0
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 11 Aug 2021 17:31:10 -0700
Message-ID: <CAE-0n50RF7fCC+Vic9DpT6gjcYrmTzd+7M6Y9SAhgLoD=_Sq7Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: Add SC7280 compatible string
To: Sankeerth Billakanti <sbillaka@codeaurora.org>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org, 
 mkrishn@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-08-11 17:08:02)
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to msm/binding.
>
> Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 64d8d9e..23b78ac 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -17,6 +17,9 @@ properties:
>    compatible:
>      enum:
>        - qcom,sc7180-dp
> +      - qcom,sc8180x-dp
> +      - qcom,sc8180x-edp
> +      - qcom,sc7280-edp

Please sort this alphabetically.

         - qcom,sc7180-dp
         - qcom,sc7280-edp
         - qcom,sc8180x-dp
         - qcom,sc8180x-edp

>
>    reg:
>      maxItems: 1
