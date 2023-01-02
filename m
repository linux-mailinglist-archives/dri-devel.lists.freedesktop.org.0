Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0233F65B5A8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 18:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B244D10E1AD;
	Mon,  2 Jan 2023 17:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D1110E1AD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 17:11:01 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id e205so25342851oif.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 09:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fkrlTW01QZiW+rfRh4HCDBkrk4FHHNPvdhykJiEQI9E=;
 b=PSrfo52rXafgrME6wfouzPUZakPSi4zMi0esKLyfcUTdw3ZaLwczE7cqwq4+MAKDTp
 OPl7k/UcH/KvwiuB2Ijya3ZTt/RKJkdMX+lFk1LSSQFO/zSpVva0jt/XMT+DFhJyXmtv
 Dlg+29EtE39mSsu0+YR5gcVXPIgrI3oD6ZWMXHSW6Ja0FiNjgFuWd/WMvpBPRYm+Y2/M
 58YQCvE3Lxv7wYTUSWuWAcFMnMtr18bpUR8C+elEZ83RfcTyOs+rzRY011f1EPN5s+pi
 XWz0wLru8QmRF8N+6vF7Vn/3sS3eBC51zuFFPivBzOGyGSRasKOasO1UrkShD5TdzviP
 m9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fkrlTW01QZiW+rfRh4HCDBkrk4FHHNPvdhykJiEQI9E=;
 b=CFY5okolnQzRoFgPHulCTO7fFjKQOz1hQfvkBKoiX67jXtvp8XSaeFDm4adVWIJvwB
 IP76THf5iCwe06Z0Or4/NY3X9BuDDq510SOO4cqN/XTRWVE5Ko0rXGcV69OX/IN3A6Zl
 C4dfPvrHPbXDiasxc0sbnOYHwDHyde8JlXwvX8/t9bnOjI+UGt+Y35Ig4gJg863jd0fU
 uHFum/A0+tTgQE/C1VRG5XKSH5EQPFtTy0EkFTNiHZEeB/uPaf7DLPn1HOCXFwDzjEfu
 jDadxDu/EIttqapnAzzkgF1uAFZd/KAXVFaEKkIUJNIbxeYVYGNIYyc/rloktt1/Tm8d
 eWDQ==
X-Gm-Message-State: AFqh2kqavBUJuT8SH0JHWaUYyT4VmlrWPJdrf8goQANZ7epz+2v8i/jU
 ERB5trsy8WpBkeka0Q0eyUDbZOHX0tJRKS8x+ZD75A==
X-Google-Smtp-Source: AMrXdXudAWzRSkReGXrlA2k8y1GjMgzJ0Sqz2gL9E0bvitUpLzt30zx7sw5KpOjYmAMpIKholY97galZNRmQhhE4MY4=
X-Received: by 2002:a05:6808:3090:b0:35e:5a1b:825c with SMTP id
 bl16-20020a056808309000b0035e5a1b825cmr2536418oib.155.1672679460249; Mon, 02
 Jan 2023 09:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-9-robert.foss@linaro.org>
 <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
In-Reply-To: <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 2 Jan 2023 18:10:49 +0100
Message-ID: <CAG3jFysU84LRcqQOspub+9vtsP3syiksrGX6D7i3ff+X6+mbTA@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] arm64: dts: qcom: sm8350: Use 2 interconnect
 cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: konrad.dybcio@somainline.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liushixin2@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 quic_vpolimer@quicinc.com, vinod.koul@linaro.org,
 Jonathan Marek <jonathan@marek.ca>, quic_khsieh@quicinc.com, agross@kernel.org,
 quic_jesszhan@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, a39.skl@gmail.com, quic_abhinavk@quicinc.com,
 swboyd@chromium.org, robh+dt@kernel.org, sean@poorly.run,
 loic.poulain@linaro.org, andersson@kernel.org, dianders@chromium.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, vkoul@kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 30 Dec 2022 at 17:12, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/12/2022 16:35, Robert Foss wrote:
> > Use two interconnect cells in order to optionally
> > support a path tag.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> >
>
> I think you need to rebase to include:
> https://lore.kernel.org/all/167233461761.1099840.5517525898039031248.b4-ty@kernel.org/

Ah, I see. Functionally I seemed to do fine without those commits.

>
> On which tree/revision did you base this?

msm/drm-msm-display-for-6.2

>
> Best regards,
> Krzysztof
>
