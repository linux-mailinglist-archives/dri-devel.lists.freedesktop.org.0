Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984431D59A0
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 21:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE596ECEA;
	Fri, 15 May 2020 19:05:55 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ABD6ECEA
 for <dri-devel@freedesktop.org>; Fri, 15 May 2020 19:05:53 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id z1so1866595vsn.11
 for <dri-devel@freedesktop.org>; Fri, 15 May 2020 12:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ILTNxRMhVaU1ppwKtb504YY35g+lEq0QuWy+iVUE2z8=;
 b=bMZEoYevT52u61nJD5we/u1JaG8jzU7khHbEmIItRoRo9c67denAC2dZI5n/GtGcte
 O6CuOaJk4AYaDQX4yq+aRjJIGv63nxepgB4RHH9gODQ+rlXq7MTS7sE4DkPKkJ4+uXL+
 cADO8rOPfT+7ANv5baePtF9UpQd+3uCS40EDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ILTNxRMhVaU1ppwKtb504YY35g+lEq0QuWy+iVUE2z8=;
 b=qi8SH5eIImUz1KVIqT8lJ+fVXz+dte4pU8UhSIhbVnRh0+Dbf3UMv1koLV3rLoB6ld
 i0QyVFWJ9ongn7P0THznO3RE+NACSmPt/eZn2YYlEf2efI94n9yURsTJHvbeLPrjsmro
 y3oYvbAEySsifiCqeO6PFYsNeKa4PPTIssZDgSqy/2x2PrCILVC0wXWOVu7d5CWIF54I
 y6QKGB9ghHVzrIK7EqOsp9Xd8E7K1YsAOupE3ZCQLjwjPgeU6y4gzefeDaH0WpkZl+iN
 HIWNB7UrNwq1wiN5D9iKJ+7p9khP7NLaiqTE+gaehhCjpz4C+4u2KSFnxwmkrDO5Pr4q
 gc8A==
X-Gm-Message-State: AOAM533V6ZQNHg3SxVIcRWue2TDaR5kOoSzHxraj1fNTSbc3jp6sdMiD
 dSigLqbiVPaeLYvz3AdDN0VF4lW5fq4=
X-Google-Smtp-Source: ABdhPJwRoU4hCV39hJswlB/bKhhJJgPWhjNm2XKzVroT15Dfa0KYAEackQwebiSbODvzx5iy/hExSw==
X-Received: by 2002:a67:df86:: with SMTP id x6mr3716031vsk.94.1589569552711;
 Fri, 15 May 2020 12:05:52 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54])
 by smtp.gmail.com with ESMTPSA id k24sm630352uaq.20.2020.05.15.12.05.51
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 12:05:52 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id l15so1602vsr.3
 for <dri-devel@freedesktop.org>; Fri, 15 May 2020 12:05:51 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr3909984vsq.109.1589569551204; 
 Fri, 15 May 2020 12:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
 <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 May 2020 12:05:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
Message-ID: <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm-smmu: Add sc7180 compatible string
To: Sharat Masetty <smasetty@codeaurora.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch simply adds a new compatible string for SC7180 platform.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..986098b 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2
>                - qcom,sdm845-smmu-v2
>            - const: qcom,smmu-v2

Is anything blocking this patch from landing now?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
