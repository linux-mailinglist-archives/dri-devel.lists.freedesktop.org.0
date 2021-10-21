Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CB1436AB2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 20:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737F76ECDE;
	Thu, 21 Oct 2021 18:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D856ECDE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 18:40:11 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id e19so1310042ljk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 11:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9wIvFY66/uQWTspqneatru5hG7uYgyRnzp2YO0R4wtk=;
 b=G3z7ykO4X+E851ch43bnUaOUol+AD2Au4q7+vF6L6OnedzItcq6j+AyjMJZXgsAm5G
 4NgVlSpK4iGvkeRhMO9xAtHEGdamb8cY8PdA+i1c+0A5VFd2nzixjtDM1AQC22Rs+rEH
 bUBS1kF+LNZPPSXCD2ajaZyd0w2InOGOf1TuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9wIvFY66/uQWTspqneatru5hG7uYgyRnzp2YO0R4wtk=;
 b=sSFFSeGOoH5LrdinLAFbCo046hFBcizZ1GaVLrSs0qgMa9DO/bL0cboO2PW/93sFTe
 607GbvNzScdmIMvHAtvqo7C9scdzRuueL8jaYu7Z3iI0qMTXEL5GUm3Ffo/3gLSFCgml
 winrGcRU0sjqJOpaU863l22+bcKkm57B3Kc0I8MVTCJn7fpu/wJGH9CmoWKmKJk6xTab
 n808DgALTJG8TGDe/dCc2uy9uzTvENZzIAO9q1zYZ57+CRK63qJiobqbDk1PKS5NPuYl
 Nsb1FW6lpLeYYxMTuSacOF8RKSi1fPU2kB4Z5JF1PQ+t6C+Is6jIYPW0heVHZ3okU1Hw
 kK7g==
X-Gm-Message-State: AOAM532GBJvKNgMmHq74GEuBgwT5hK5LVe0z1RNXdW/vndUKszC1OefC
 k6zRqdXXQlMJvakG9oW1pB8dX8KV6irnTaVopzCjVA==
X-Google-Smtp-Source: ABdhPJxRC3Uf92k15ghzxzXlSSeSrHGQSqtbHF/z5u6aHclpYNvhUUJfMMIi/ktRjLpdoaeaGzmBSam4G9bujYQeCd4=
X-Received: by 2002:a2e:4e1a:: with SMTP id c26mr7489198ljb.351.1634841609244; 
 Thu, 21 Oct 2021 11:40:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:40:08 -0700
MIME-Version: 1.0
In-Reply-To: <1634738333-3916-2-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
 <1634738333-3916-2-git-send-email-quic_mkrishn@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 21 Oct 2021 11:40:08 -0700
Message-ID: <CAE-0n52Me9UkR2Fk=x7QKxNy8PdjB8xPNsp3h=gN1ubMEgyzDA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sc7280: add display dt nodes
To: Krishna Manikandan <quic_mkrishn@quicinc.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kalyan_t@codeaurora.org, sbillaka@codeaurora.org, abhinavk@codeaurora.org, 
 robdclark@gmail.com, bjorn.andersson@linaro.org, khsieh@codeaurora.org, 
 rajeevny@codeaurora.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
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

Quoting Krishna Manikandan (2021-10-20 06:58:51)
> Add mdss and mdp DT nodes for sc7280.
>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>
> Changes in v2:
>   - Rename display dt nodes (Stephen Boyd)
>   - Add clock names one per line for readability (Stephen Boyd)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
