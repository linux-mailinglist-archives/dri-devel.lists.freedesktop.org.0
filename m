Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A2467D4CE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BAC10E978;
	Thu, 26 Jan 2023 19:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0CA10E978
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:09 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id tz11so7852753ejc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6/hgeihi7ZjGYYdLqZARIRAYjr8aF0qhlO8SOLhtlp8=;
 b=qndTHlbjpfaL6qbJ/TvhR317D4OWWuUDGHqKGvEvJGVZMtUSWBCvv/fbfwkd49hUiQ
 z6tgwBIqOisziUxGn3G5MR0YEe/SQLl4hSZX6ISXXw+aL05DsyTFplYtqN5OZuaXE35N
 m4c+MEHsQ8f9oIrxbnTqQAyHli3m0WXvwjS01o74nplXedX6pgel4YFGDBoeCdZu4Dhr
 J8D23fLhzTjqcWYWMpmofj6GunWPTssTaEjYj3HIjME37A4jcNjGOSOsmlN0Qes+DGoV
 3KLIssWXrBdbaNQgnhUBqmGPzhbt3UKCh5nwIkjyj0SGSRKbjH1dYhN7hg9zsN+4K2HA
 kQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6/hgeihi7ZjGYYdLqZARIRAYjr8aF0qhlO8SOLhtlp8=;
 b=P+GnBvS8Q3qZ7KZbUYTEUxOyxDfP7IhbCPCVjmTadhS78eMTE9S2sNBqfTTlCQOcwb
 rkzB9nJB8KX36Z/gwxyN1Sl5RO2U1WE9E8Ylcc5vuigcP4o8uBursG2/dPfPb1eJf3D3
 /Y+q9q3pXCw5xAtGrJgoFknVV5OniSeYhV5nadrtPliTN0okAon4yD8fp9fH6zvu5g8s
 pZfItdKyBMBCFDyKmy25jygV5+bVeFmBQMAsqf+55bhT0s4eFjEpRcmjvf/To6wh3aRS
 peuGAhKY6+b4AmrswHdJOfPdvNSmzyG8/XqlJRElrOBHGb1jXqNfWVRX1ATQPIhoOvvt
 tQdg==
X-Gm-Message-State: AFqh2kq7Ypn2CQ5gDH+yw4Yn9UipHgX1ZdrfenvsSXh347JAytxYlT3f
 ZOomsFvNyPQX5TOgA+sD9dakUg==
X-Google-Smtp-Source: AMrXdXtE8qV5H9Cp8tQfmuHwc9+X5j6HSC+5QPwvvBHlPV3xWsNS21kkvSCJq1otXOROOXqurM207A==
X-Received: by 2002:a17:907:9150:b0:84d:150d:5006 with SMTP id
 l16-20020a170907915000b0084d150d5006mr34691515ejs.49.1674759667959; 
 Thu, 26 Jan 2023 11:01:07 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v9 0/2] mdss-dsi-ctrl binding and dts fixes
Date: Thu, 26 Jan 2023 21:00:52 +0200
Message-Id: <167475959094.3954305.603604364773846840.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118171621.102694-1-bryan.odonoghue@linaro.org>
References: <20230118171621.102694-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 17:16:19 +0000, Bryan O'Donoghue wrote:
> V9:
> - Adds Rob's RB to #1
> - Fixes two check splats - Dmitry
> 
> V8:
> - Squash first and last patch to fix bisectability
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0c0f65c6dd44
[2/2] dt-bindings: msm: dsi-controller-main: Document clocks on a per compatible basis
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d10bdc6ec6ac

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
