Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5C7B4C61
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F2B10E210;
	Mon,  2 Oct 2023 07:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE3989065
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:11:56 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5046bf37daeso15795299e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 00:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696230714; x=1696835514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebhLT7Bk8BegSoKqGP/uGHgUFUu9P9Y8HhtEWWMfVHo=;
 b=gdnqxFrUKfKAz3/odmvfpgNTtR1y2RE7nnGe05K+cFqNnq7jUGKiBbwuNHO/Pc19b4
 7DWh3Dh6GXc7cSm8dmi/nafbcPHBk2Ggh7sNHHH929hyN6BbVShH5HFWr+dUoeKSZLU5
 fS2OPu8kGZqSnaidak8HIVvSmPO3g3DJAYhIL37i7vDwbQiHzuRHdV/FtqP+vOLyHEc1
 KOOm3LioQmMApa6WBBsoVJuPJ9bAaGwa+yE+EozE2nN50k/dLTMk8AEVPnQai7SGe/K8
 R+Yrj4H8H14l4WlDXxwiQC9H3Hg2uFWsbYtcMMCgCMLaAnPmJNCtBSHe63fGF9t3v87R
 oMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696230714; x=1696835514;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ebhLT7Bk8BegSoKqGP/uGHgUFUu9P9Y8HhtEWWMfVHo=;
 b=k6a85ckm77YwZhMd1uKqee2jUxyy1wikvWPhFvklyNgfWzUcKJLWKC2rIZjXt7KscT
 71YIoXJ4q0mXSUyTu3/uL982a7jUacL4L/KQHgZ3GINsQsJHJ05ZJZY8IZiB7K2+fXu0
 w49kkkdTQblrnuZWsrqwtfqCF68LtSpkF7xGvExqfUBS53KZ9lvmZRNUfrsKXHR/I3kU
 rpryIx1MQmRPVrMFN9yvcaUeYZQGExm9qbL2rDxU5beSbxwFCw9ylpbthktZin9KVUnk
 mcZvcwsFPQrw50hYSK7yTEoXLTtUrD/t75F0PWkCx+JxHqDUGdoIzmPllSOiXFxtNqEq
 41Dg==
X-Gm-Message-State: AOJu0YyRoc1THwunC1xMPXmt27O3RzutCc+Tl3IljKSXopZCd+i0lUzS
 oFDigm4/AG4kHUzalFuizP5oXQ==
X-Google-Smtp-Source: AGHT+IHuSrV2k6DA9B2OyyK5jQodlrfkuCDECVUkCMO3P3mkH1WF48HtXVeYwdF/JDJumnd9eE3aWQ==
X-Received: by 2002:a05:6512:3986:b0:501:bd6f:7c1e with SMTP id
 j6-20020a056512398600b00501bd6f7c1emr10840429lfu.33.1696230714694; 
 Mon, 02 Oct 2023 00:11:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b00405623e0186sm6601371wmj.26.2023.10.02.00.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 00:11:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230927-topic-fp5_disp-v2-0-7b5e1d1662a6@linaro.org>
References: <20230927-topic-fp5_disp-v2-0-7b5e1d1662a6@linaro.org>
Subject: Re: [PATCH v2 0/2] Raydium RM692E5-based BOE panel driver
Message-Id: <169623071357.3600226.13335704878597295966.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:11:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 29 Sep 2023 14:54:19 +0200, Konrad Dybcio wrote:
> The Fairphone 5 smartphone ships with a BOE AMOLED panel in conjunction
> with a Raydium RM692E5 driver IC. This series adds the bindings and driver
> for that.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Raydium RM692E5
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d1fd19e6bd7d276cf2290300cc563e2e5ac4ebf7
[2/2] drm/panel: Add driver for BOE RM692E5 AMOLED panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=988d0ff29ecf7ab750b9be29fddae588156c3d03

-- 
Neil

