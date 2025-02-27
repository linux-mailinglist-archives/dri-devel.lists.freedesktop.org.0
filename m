Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D17A4748E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7660310EA27;
	Thu, 27 Feb 2025 04:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p3gi+M/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2969D10EA2B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:41 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so648067e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631059; x=1741235859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYSgKUYrO2YlmDkolp8bEhCgpgQOBl0qveOjHBhwpts=;
 b=p3gi+M/drkwULihc4DgpJhjZWB53IziljPAg4bvrNdzhwIpU+0NYI+fJMdaT3qLC1I
 cUlu4KtV+liKiD5gxPHUQdWLQa3oooUwEdewemtYhcPWWvuREw+QMb6LLoL2jgywG2Qe
 vqFmI9ulO39qycjqfTlyOaWI4CSccz965k+Jfyafx7RufbYlFvQ8Koq8lYI97snACtfv
 XlFr8sEOdR1gi+of2EuysdvCFOJJZZ2mQ8w7hHjKWSyYefLZAc4Lajpye0PNf4RBYELP
 T/cpWHBUW28orxgO3H3AfxTeu64w7d0T6QasLm4RlsgT06K5MPv+Ws4r4IibYziIaxHW
 EBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631059; x=1741235859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kYSgKUYrO2YlmDkolp8bEhCgpgQOBl0qveOjHBhwpts=;
 b=TzLZFpiqgPqpOMjHqq9tBDh4KZ0BBpgEmYhpmykLaZWKBoGaN0kON29yORJxhInEXX
 2PMR+PuiHd66OZ8p42iMYbjqNkB2ylUyjAWKxq8vQAxPohwPZfoiJOnB+6iGwCU6eLCn
 637eh3eZ8EyaGZHuBN8CYN8KztWwUnb3gAgPQDYOFzGxH712samYYQW7AwfLcbesuWju
 xq6Ftrebp1z7OcuDZpZ/bn//deLzYEsmi5830TwBESPvMMqP6l9P8cUUCJero85T2np6
 mkqKKJvWMonPpFuOv7yIir6CZnYqT0RV6PxXQoXbgJc0P3ruDKwgkKTVO3p28rr5TFVx
 Bfeg==
X-Gm-Message-State: AOJu0YxC3PORGT2odQh+NJi5CiJsGBWN3ZWAi/iNVQ+OCsSP7a+mja5e
 hF/lrquUM71ZxV4q71B3RQ12rEUy1LLRWxYIwERyn+/tcBw2vQ5HQe6M7W7g5pM=
X-Gm-Gg: ASbGncv94VkrzccPFRhkk3wim9/zpPfvYQ2mFq1NrIr8G/8H9MB/zbqnKVTsWO116Sn
 LRU+Cpr0oOBxsUfeFMFh5die57W3MDkYoAlJnqFB4W3dj23nUztemesNhzQo/OuiRfAbCF9KPgW
 8YvJiKpiHAB2nFk3g5CTtbh+VUmiZsEq/Uvxjp6uT3WGCfheia6JnnJgMVRrbDiWV8k1r4jVlaE
 FmDTx1PgPTZdfsBOqRZI57Dcc02sYzMlrN7agOX7w3A3KGqzF/hwJPggYGVRM+2khxdRemkR4/P
 Rl7twHWslECaHnwhDJmjf2lkzRSANEiXRfRaLIqKbA==
X-Google-Smtp-Source: AGHT+IFJTbOhodvzE89VyWlm98mXeqCjUzL4IWC2ENgI8KAMI2IbCSRQGTMlBENkiboZNnQ5ghsFCA==
X-Received: by 2002:a05:6512:3b9b:b0:546:1ca7:81a1 with SMTP id
 2adb3069b0e04-549432ccb18mr616846e87.3.1740631058787; 
 Wed, 26 Feb 2025 20:37:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, fekz115@gmail.com,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/4] Add and enable the panel
Date: Thu, 27 Feb 2025 06:37:22 +0200
Message-Id: <174063096229.3733075.14794380891862567011.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217222431.82522-1-danila@jiaxyga.com>
References: <20250217222431.82522-1-danila@jiaxyga.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 18 Feb 2025 01:24:27 +0300, Danila Tikhonov wrote:
> This patch series adds support for the Visionox RM692E5 panel, which is
> used on the Nothing Phone (1) and then adds it to the DTS.
> 
> Before integrating the panel into the DTS, we update the DSI code to
> allow bits-per-component (bpc) values of 10 and 12, since the Visionox
> RM692E5 panel operates at 10 bpc.
> 
> [...]

Applied, thanks!

[3/4] drm/msm/dsi: Allow values of 10 and 12 for bits per component
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b0e71c2637d1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
