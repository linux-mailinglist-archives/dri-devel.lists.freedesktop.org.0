Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21764765AF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 23:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0BC10F9DF;
	Wed, 15 Dec 2021 22:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2442110F9DF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 22:27:55 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id t19so33749348oij.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 14:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0k/4WghU8oFurHJHEHSouu6Us6eVLuVOzOhdp+JcH0k=;
 b=NeDhHnDzQKmHQdukLfPb57fcY9sRvEeshRGWjl6VbHYN/VNd2WIdiGucN3VyQHfHyi
 ODX0tPBTzdHUhS/K/UFskuk3zbVPplOGuu1x/3hM6Od2OgzHrir6KktuGRDLF4LOX+Vz
 smHiXw5l4g/gYIGX3S+KGZWonIZx7TDqmoQI+DekZRsEy3SrNmlSXlyCCG5uZAu0Yfzf
 LJrhT5CgejLIjStw/okC2VQgzpIsD4mkhq6Jnn8j/tcQRpqfLEkVXuhlhZMr5QdglWyz
 S7wASV77km5m+lI0oQ4m2DMor4fr4TyP/uoOVeJECDFrpy5pBzEl3XpiE4O2sXMtjjSt
 YvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0k/4WghU8oFurHJHEHSouu6Us6eVLuVOzOhdp+JcH0k=;
 b=ZanPu79/1WAD+5xq/lfOy6BQlgbWsweGlmccP/oyovmxQwsxm4bGqXptRPiZ3FKHwh
 ad+N8SWe5BQobiyR4ojjypszfk4BkwnacY85j/CYPSL+BKv+Z8WDwMQSGar+mFayEjuQ
 yzFAACdCefHo4im1RjCi1+tjACZEzWmAwhB2zS1FILPxeW4eQugxdCaLDGBKA3Kn1wBC
 yuIhwscOM3AKULhGaFNTCEO8xH37/OLdOzdwygd6BPyKPz8e/CtBMQx09KnFrCH+KfEM
 DhAdWxw9Z1puSMP660m43oW7cTROdGimGTsieX9ZA0kzgvefuSP+9BbKNc4AUGsZQUzU
 S7ug==
X-Gm-Message-State: AOAM532yHEgszfQxFfLl5L5vlZRAg+8aKfSZ6jf0Ir/G+PoVeiXfRS7n
 Wk2/DvjBZfUOpEoG82lQoTL0fAOfWGvhBw==
X-Google-Smtp-Source: ABdhPJyiZGSg7nl3iPZNacNkzzIriIsA8K+pbTW1R7BSm60R5ayfzMXsdIZwV+OW92zh2rfswPUntA==
X-Received: by 2002:aca:1202:: with SMTP id 2mr1806801ois.63.1639607274378;
 Wed, 15 Dec 2021 14:27:54 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 14:27:53 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: (subset) [PATCH 00/10] dt-binding patches for sm6350
Date: Wed, 15 Dec 2021 16:27:26 -0600
Message-Id: <163960723734.3062250.16152122166909189415.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213082614.22651-1-luca.weiss@fairphone.com>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
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
Cc: linux-fbdev@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-watchdog@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Manu Gautam <mgautam@codeaurora.org>, linux-pm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rishabh Bhatnagar <rishabhb@codeaurora.org>, linux-phy@lists.infradead.org,
 Zhang Rui <rui.zhang@intel.com>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Dec 2021 09:26:01 +0100, Luca Weiss wrote:
> This series adds compatibles to the dt-bindings documentation where it
> was missed before.
> 
> Finally, the last patch solves some further dtbs_check errors by
> modifying the sm6350.dtsi to match the binding docs more closely.
> 
> Please note, that the first patch from Konrad is a resend that wasn't
> picked up when sent to the lists in August 2021.
> 
> [...]

Applied, thanks!

[10/10] arm64: dts: qcom: sm6350: Fix validation errors
        commit: f56498fc6a9364a35dd74af791bd1251467e9cc1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
