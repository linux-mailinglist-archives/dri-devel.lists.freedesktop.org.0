Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A524A4E09
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 19:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9228710E325;
	Mon, 31 Jan 2022 18:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2100B10E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 18:24:40 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 4so3879410oil.11
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DMU9AZ9IHe9vHLy7t44zKNg+xudXJC08v+EXB0Qau88=;
 b=eE3owyETd86rhiBoFQjfQCbd3zoTyOn7J7I7j1tKYVNaybZKuI+UYZX5/rrH5IkNbn
 qPD2IHMEzaWJYo1c021WfPL23XeASt8IK96uh5ZmHK5/Vj/pqZKu6Df6IkRYF5upCWlg
 ZkzT8Qgs9dv7S6deVCH5YPSH1yIxG1/OUYu1bY1DTiHcS12IiWKHLkIDFU66V2pPO7N4
 tGBFXcUF8mxqa4xiIePkiADB8nkstet9ECvfZxsnGMfkU+Bci+rkMNbP6vLUUDIguoNX
 DSeJ6hXDm9kPwj3lyJEAoJNxhIjcdjWR1rCQK2YkH122o3j3uSZMr6gIbjCQOhIW9GM+
 hVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DMU9AZ9IHe9vHLy7t44zKNg+xudXJC08v+EXB0Qau88=;
 b=4+FZ1nKJnzhosMPHbY4OzdQTDx82WqXaPlJciEdhU+PdaE/10hwcGStsbrkG/e/7Ty
 9C5/ANyQYBz3YPsVl8fsUiYAPpvYd3nZ/8OVPReJtTjD1I89nFkvBI0UqoIaF9LzXz6Y
 7WV+KlhvRW+DS+UPapSDd0qVAmpJ5TuqZu+cnsyxih67fS0M28zecHVrv2Au/+1h25BS
 yttEq9f77Eaig+8RxvQ+QgMSuBnxVGJ5a9o35GZ9dhaFrL0RGMMRr9yQqXRpxqUaUUPP
 tcMWmALC6IdLNOuL/K15sf6dwy4dftZBZvLUNh4PY6AmsbMaXtmBQb9olhRVGnaAPEWP
 Z3rA==
X-Gm-Message-State: AOAM530Vr9RN+DPEEM5ozeoyB0yjA3ldKPspD2pNggXnOPrDF/0gKgW6
 LycOB8SVEKXVSuvCsea6wgUqqoMVkaWYHA==
X-Google-Smtp-Source: ABdhPJxt0KJaiklBho/V1Ui+XsEAZA5Z3/ybA635AsaKfaB6rAOtODj3zteALDtbdIVqTZwrEtYSGA==
X-Received: by 2002:a05:6808:1247:: with SMTP id
 o7mr17349933oiv.75.1643653478569; 
 Mon, 31 Jan 2022 10:24:38 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:24:37 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sc7280: Add Display Port node
Date: Mon, 31 Jan 2022 12:24:26 -0600
Message-Id: <164365345128.3009281.16859131025980734527.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1637580555-1079-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1637580555-1079-1-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 swboyd@chromium.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 quic_mkrishn@quicinc.com, seanpaul@chromium.org, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Nov 2021 16:59:15 +0530, Sankeerth Billakanti wrote:
> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> 

Applied, thanks!

[4/4] arm64: dts: qcom: sc7280: Add Display Port node
      commit: fc6b1225d20de0298a7b0e52eb3843d71e1992e8

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
