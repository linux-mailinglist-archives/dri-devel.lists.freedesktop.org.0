Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56993F7BC2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 19:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E226E3F9;
	Wed, 25 Aug 2021 17:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26406E3F9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 17:50:58 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so47384862otg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 10:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=joeEMSfwbKFOWf42c6X25rE4u+SwXoFheY/55rlm6LU=;
 b=KQ/HOnYdFw+ZF7qnp9jzF+z2MCLSv7IKlKnFCKpkaTpBdl0IV/CWYsbPjRASTs3VWj
 C8D+/SNYVY9IGiA27L3o8j3qjmjjMV97Yu49ksmzJ38yL5BetbwX6MhIAwcJao+hAYSH
 jTyNQJKSx3VVVhDdnWLkrTjoCNTbzOFv6mOCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=joeEMSfwbKFOWf42c6X25rE4u+SwXoFheY/55rlm6LU=;
 b=LnPE+QFiJ/wZbPHFwfTslLA1Z1BypzjgaiG0a+upcLpYzwDKBonIuy/pKEYkdd2n/Q
 fzOhDMFe8+Htg8WK86VOtGl/TNbLzVCK474oPhB4SyOypD6tzNSBhs4NOVt9hAed9HHQ
 tLOmEjZEMowALoLqLySKYN2SsnOPUVmbb0VPGsNUI4Ytyor6+7zuF7x+IhLy2zSRysyf
 WhSl7dKYQgR7VWZI3rTquMfrjd1USpalk9kgFkqPnvC8XkiMUQySHc+GcFS1xUHqLT6G
 2s06F4R18iEdPDrru5IWdeQaGNE+fcLzOfgrFvDy1HgweN8MKODj04y7QQaR6/wdtNJL
 +b8w==
X-Gm-Message-State: AOAM530z9iUsrxkEVK5fH/IrKYDkhH60SX+bRpU9Njt3aOp/ENL1/+WO
 3mg9XY+sJdZm4EtX8l2qulps9uHi4emYeNMaNxyBrw==
X-Google-Smtp-Source: ABdhPJymKW+Q9r5NjGs3NkVet38E9V3EJHm+kKtdiXNkSMyDOfTN6qr7Dk5rQ6mPq/5GfCmqKJ5umNsFLQNCvxojzg8=
X-Received: by 2002:a05:6830:2b24:: with SMTP id
 l36mr21464418otv.25.1629913858077; 
 Wed, 25 Aug 2021 10:50:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Aug 2021 17:50:57 +0000
MIME-Version: 1.0
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 25 Aug 2021 17:50:57 +0000
Message-ID: <CAE-0n536PraSR4oqGNtxcDnR0+H-N3eQTpsgTt84oU3NAXEjeA@mail.gmail.com>
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

Also add qcom,sc7280-dp here?
