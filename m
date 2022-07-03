Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5E9565ACD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB3A10E690;
	Mon,  4 Jul 2022 16:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D86010E082
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 03:57:14 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so8815157fac.9
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 20:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8pyUyqVKFfsPns6kkRYcl2oPKrKQVySYYiE4xgpYN7k=;
 b=sg0Mf81AA/jHMB1Cnn1hgvmo9Je2PEjby6cq8FtWMppDV0dwTUm//kJBHbv8pR4BwB
 j/FtBj4e+TRgW0b8LLpE75Wl/UfDgN709J3WOsfkzkGqFrIy564VLTVlm0+sHgOW5DKX
 MSChhovfWwB/MwOeg3N7teweUFs8YJabN58sYDuRd6ZkoX14s1xq1HxH6K3VyF0Bwjry
 i+veKmfxr+3s/KqsXC6tv8EpMERmtrqerMQkdN72RjBqsfbB4eGnIPTLngTx4y1hItZk
 pcd18M4XQ7uT8kIY6cHEz++jthJoe+kJSmxLt8i7cpOKc53OBfjFf7+CQSb5Ufla3+Re
 QOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8pyUyqVKFfsPns6kkRYcl2oPKrKQVySYYiE4xgpYN7k=;
 b=beoxqVpFL7lbRB7loiO0FNVPvmOpw5gT7ZiTY9gUnsNpOPVI+wFuVdEJnKpeJjV+DH
 Ha7TUBL6z6xHRIHzTR133hhJ52KCDYBSFhm70H3W9gjIfPNKvvQktAdYdMwyddo6rKEn
 Dmd+EbE2J4qceFjHx6agiyJOaEisPP8pkgHC1L3sZ55MG9tvjZiekKky1euCP5zyJhZ+
 WJO/cyRctTB7u0Cr7RAoPjVwATXfPy4pTVJkVj/mokfCu6Gr88WD7PWCNeuWWcDqf4/V
 AWQFPNX/oxyUmXgIo9k35FJXul6nlF6uTTAq1z+0S1GkS/mUPmJRrh31c2fe0jwIlcgP
 Vrxg==
X-Gm-Message-State: AJIora/KRm48XS7m3419Cp7TtN5i3UjHgAah4mWvg+7zCy8HO200CXkK
 6Jhluk6VuMhW0ycXD7ebLGDQ9w==
X-Google-Smtp-Source: AGRyM1uiElpgE5xH020B9DsxznQsQNmrJaanTne9n2tfx5H6+oy7R6pbP02jWzluWtfowxz9M4K1wQ==
X-Received: by 2002:a05:6870:8292:b0:101:c67e:1b4d with SMTP id
 q18-20020a056870829200b00101c67e1b4dmr14586983oae.88.1656820633300; 
 Sat, 02 Jul 2022 20:57:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 20:57:12 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Jordan Crouse <jcrouse@codeaurora.org>, Emma Anholt <emma@anholt.net>,
 freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH 2/2] arm64: dts: qcom: sm8250: Enable per-process
 page tables.
Date: Sat,  2 Jul 2022 22:56:09 -0500
Message-Id: <165682055971.445910.5959383973914812219.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220614230136.3726047-2-emma@anholt.net>
References: <20220614230136.3726047-1-emma@anholt.net>
 <20220614230136.3726047-2-emma@anholt.net>
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
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jun 2022 16:01:36 -0700, Emma Anholt wrote:
> This is an SMMU for the adreno gpu, and adding this compatible lets
> the driver use per-fd page tables, which are required for security
> between GPU clients.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sm8250: Enable per-process page tables.
      commit: 213d7368723709cf4567488e63dd667802378202

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
