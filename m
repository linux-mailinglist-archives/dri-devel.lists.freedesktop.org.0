Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AAE663B0C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3D610E565;
	Tue, 10 Jan 2023 08:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F066410E0BB;
 Mon,  9 Jan 2023 23:16:07 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j17so15535439lfr.3;
 Mon, 09 Jan 2023 15:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQwDBfqkurhgjNXU0QKC0PjFG76vM9b8TjKB0PaMvXw=;
 b=SqMxWZDzvqcnd4VsGn02ROGADSumLx9BSN8MB31bs3DrTrebdrbk649dIlJYjdQVYI
 Jyit7fGBQBIlayPVkbESvPA5uj2HvBlWpIXz/QLbJaBMJHyk/gqUvz8txxloW3/kg/h4
 8fKFPj/dF5RTTeQUIg3DdaB1Lykoi623x65aXh+oxADVw1V2VLeTyO3F0EsK1OAEpRJ4
 n//iygvdu0aDZMi6Vwz2oguE6dgJY+85pwWO278pxCRVFL97CcTJQWU9+JL5qi3wyYZN
 0QKPRAvwdjkjlglmNCrgQBlGzC4DPggg0NdqqAF2aeYDXgPv05Ztfe7nzrLdWkjmD0Im
 uyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQwDBfqkurhgjNXU0QKC0PjFG76vM9b8TjKB0PaMvXw=;
 b=DQYxhyWbFtq1LjKzS9XvyaHAhxj4yj2lGMRrZfiyrjy/ikEPZGjnCPKEM4qJDxNToP
 KSArvY5iMKA3FiJ9g/lgV/xlJ+Zkx0UIaibjKpDMDlt8ItOZ/b+pmczz3RE1RWIFBsNB
 tYIEwQ6IsOuWrsS73grpZf4LceJt7TWzsUAm6AEkb7Tx6Kk1DbL/SZy7BA9YheLxhPvI
 QvARaOxlh4xvQJcjXnMHnx+4vi7JYgZxWQCEassuAZ570HbROjm3pxJU00amFbSHDyzy
 eP/tTdzS3363o8kvtkCStvldOSdXv13i7n2fFCeCJy/qCzlcZ2OjaOPAF0QPBYXGh+Cd
 rAvA==
X-Gm-Message-State: AFqh2kpaWNbs81CNVE+PAK8AhvXEbpNC32TIb2vo0P1zrP0IvH46QvVN
 GFtVkRoBRqUIJ3VVafD5ad0=
X-Google-Smtp-Source: AMrXdXsxlo89Tk1v8oWLh9mQW/RBULg2GePp3d7816B4+khN0j3h8rEZ3+fD5AU+CLlRhohD3mhCXQ==
X-Received: by 2002:a05:6512:c03:b0:4b5:a4ef:fca3 with SMTP id
 z3-20020a0565120c0300b004b5a4effca3mr21624685lfu.38.1673306166159; 
 Mon, 09 Jan 2023 15:16:06 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s6-20020ac25fe6000000b004b50b4f63b7sm1814075lfg.170.2023.01.09.15.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:05 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
In-Reply-To: <20221231170532.77000-1-a39.skl@gmail.com>
References: <20221231170532.77000-1-a39.skl@gmail.com>
Subject: Re: [PATCH] dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible
Message-Id: <167330408780.609993.10652879591606544377.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 31 Dec 2022 18:05:32 +0100, Adam Skladowski wrote:
> Document omitted 28nm compatible which will be used on MSM8976 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/852f489b36aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
