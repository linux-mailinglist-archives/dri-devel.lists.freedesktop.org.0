Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049F541E068
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 19:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730A06EC3E;
	Thu, 30 Sep 2021 17:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41046EC3E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 17:58:27 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id t189so8360369oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ODaJrzhlII7IaX+qlNLhzszeBmnqReAaw8HMQDA91KQ=;
 b=bTQg8VLL960aI4MFPT4bL+ziwayamEyzDehDR1iOJFMPkxj/2Nk4rKVj9YVCEdzD6b
 UrAEhn7yK+oZWFVFV9a2Vsk+1xTPbIH4KRcCLTJq6nYecBRghntzlrD0p0OATanZSj0t
 St0+87W3xKmk6mTdbO+IC0+LpfWha2ZwUXZQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ODaJrzhlII7IaX+qlNLhzszeBmnqReAaw8HMQDA91KQ=;
 b=KlKWv7JVJYH71jMUVYI0pwgXtuAT38Yzw1yHQMq0rdKlfBptyV62H9PcHMz7asct78
 qphvexJlkBa1T6GhYxhyq1OsITO5kMNJTGv9SQx9hII5gxN2Qrbz48h+GZoUHfBJWNw7
 SJD0ihAzA1e8D+B2ujO5beHKUCLQWC3f40bcA0XfxbFzKA8AtZTT8l/pFjKBq8lYNDOx
 3mLAdwae3hW9Q5WOfxCyOmICUp4ExZ93PHEyrRDhuMddE8ex6i7OBjP07dFp5DK0zowB
 1llV+C/i1M+7LOWIln6/C63tVLUQM6bjHj7OCkUdSCeFRS0xQF16D7P/A1mavuU0ysO8
 Chcw==
X-Gm-Message-State: AOAM530Zn5KdWdUc1vYPi4bCysmvEeGobKM2jMGvs6z7W5WjTM///5Cw
 2qz/NDWTgJqGCZgCRMm2gcpL8lBdVscPekYkl0Sugw==
X-Google-Smtp-Source: ABdhPJx0TbzSitN4I1kanbYg8IkdrXr3mPw09WhLirZ71+GW8AkE5QIIHBvLl1NRDRFk/IIUhiDGGlyQIyMalzrBWvE=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr501591oia.32.1633024707214; 
 Thu, 30 Sep 2021 10:58:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Sep 2021 10:58:26 -0700
MIME-Version: 1.0
In-Reply-To: <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
 <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
 <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 30 Sep 2021 10:58:26 -0700
Message-ID: <CAE-0n53kQU=8pdcWR0OZap1wDgxxwed0qvfaGruc71YT5Cj1iA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sc7280: add display dt nodes
To: mkrishn@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org, 
 sbillaka@codeaurora.org, abhinavk@codeaurora.org, robdclark@gmail.com, 
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, rajeevny@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 robh+dt@kernel.org
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

Quoting mkrishn@codeaurora.org (2021-09-30 04:56:59)
> On 2021-08-19 01:27, Stephen Boyd wrote:
> > Quoting Krishna Manikandan (2021-08-18 03:27:02)
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> index 53a21d0..fd7ff1c 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +
> >> +                       status = "disabled";
> >> +
> >> +                       mdp: mdp@ae01000 {
> >
> > display-controller@ae01000
>
> Stephen,
>     In the current driver code, there is a substring comparison for "mdp"
> in device node name as part of probe sequence. If "mdp" is not present
> in the node name, it will
>     return an error resulting in probe failure. Can we continue using mdp
> as nodename instead of display controller?
>

Can we fix the driver to not look for node names and look for compatible
strings instead? It took me a minute to find compare_name_mdp() in
drivers/gpu/drm/msm/msm_drv.c to understand what you're talking about.
Perhaps looking for qcom,mdp5 in there will be sufficient instead of
looking at the node name.
