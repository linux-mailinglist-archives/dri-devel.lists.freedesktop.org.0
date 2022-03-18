Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693414DD1BE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 01:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B2910E8F4;
	Fri, 18 Mar 2022 00:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EA810E8F6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 00:13:04 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z92so7517303ede.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivABL/zW17W3xsGsFU4NNFD2vIhj9kJM89ziwsXeP4A=;
 b=I6jh5qUUAfPbuFRo6X1vzR4jyxk+Jwj+tM+hcWGcNJ80NKQdHD3dt4WyBUnPLaQ43u
 fY4hRGaRDpfdxsttq4ka6QQ3hsN/FLOiF/BWyTy1eAv5/n1k20hVkDNHY/wy2ucHyIUT
 LyPuzoXHOq8/3MYayGZMQIPpAv4JbHhGQwbek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivABL/zW17W3xsGsFU4NNFD2vIhj9kJM89ziwsXeP4A=;
 b=QGSeIYw6UCncTtU6srf5jFLG5SqxQHl85LUSGbYZnUx631J+eipaIuQpHXrrrwASG/
 fyYMXVG6SCtXGddKfclBWsUi7vFEWuUlUmQTT4+OO7+dk1gHhne2B9U0ZMJLsU9xklZB
 hK+nsgkqCHeEfkwp+ZyeIIuJK15ZOZTbw2v42rxsFkjX6EICekxxv9aPkYopIZD1jOjy
 EttYQ8N0L33IXIo98+Dwe1cPgZUrJDb5m/c0Ne932SH7ZPIdNOMgNX0eP9TDrD91lOA6
 /32q/kYsKBCuny7N9Uu7CMigSU69WFscX3F2oKbQLNPIyfPB7rTuqaFmWDqCCEk+HzH6
 oIxw==
X-Gm-Message-State: AOAM531zxf5XkN4idjaajA/eAbSPXxFHCnjPgHi8gKyVHZfaCjoPRxU2
 9WMVB9BkQIPztuMC+WQj1nIM4J46oJ4p9kVhfmM=
X-Google-Smtp-Source: ABdhPJxqi1KvvBWK1iyd6d7cb8cc2AZw2s9c4dUWNzatW5D95IqWYrT49FtfY3Wj0zQA3fA9UxE6AQ==
X-Received: by 2002:aa7:d7c5:0:b0:418:e694:77d5 with SMTP id
 e5-20020aa7d7c5000000b00418e69477d5mr7062642eds.150.1647562380875; 
 Thu, 17 Mar 2022 17:13:00 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 bc14-20020a056402204e00b004186d45f8b2sm3330523edb.43.2022.03.17.17.12.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:13:00 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so4034673wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:59 -0700 (PDT)
X-Received: by 2002:a05:600c:3c8a:b0:389:cf43:eaf6 with SMTP id
 bg10-20020a05600c3c8a00b00389cf43eaf6mr5932331wmb.199.1647562379575; Thu, 17
 Mar 2022 17:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-5-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-5-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:12:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VQV-2LTmVEPuJJYUhTpBT15A1fKAsRbZgpni8rGNNFsw@mail.gmail.com>
Message-ID: <CAD=FV=VQV-2LTmVEPuJJYUhTpBT15A1fKAsRbZgpni8rGNNFsw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: sdm845: remove
 assigned-clock-rate property for mdp clk
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> This patch is dependent on below patch
> https://patchwork.kernel.org/patch/12774067/
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Similar comments to patch #2 about the commit message, but otherwise:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
