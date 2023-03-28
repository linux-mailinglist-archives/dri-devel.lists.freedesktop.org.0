Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5143B6CCD67
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D0310E9FE;
	Tue, 28 Mar 2023 22:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCFA10E9F5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:14 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id z42so14148930ljq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALXG480xc5Vr4OawogWrdD2rMqv6eGKjSBs+zM3zYaM=;
 b=ZnE7Q8sUOjiqKZEboynjLw/+ePjw37a8mPY7dc9ZWIocCk5H6ZEdBmGgD949C1HmO2
 osgYB5U3gaRjuZu3vALD7fvCrLe2CChixj3Smn2DJ9goJ2li26clkYLVYgfG4fbNGUaT
 o7+iwdt3KRAh7nS3OtWvbI1bkdBjvYIz4axSVPbX9xSxkR7aOCDvFbjzPrwDluUz3E0U
 8z8KPEeP4ctRqHdA382W+kq1N1FqTvpz4jRBENcP+AUdfmzCxx9CzSI/RSfItZ+Axzfs
 uxBSpA6SOGlj+d1cZ7rBPeQMdw15xDaThvq8l0Mni18Td1Oppg2FBXxqkkH9It2wzVIh
 Qp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALXG480xc5Vr4OawogWrdD2rMqv6eGKjSBs+zM3zYaM=;
 b=KxIOFAnHxsoYdjJQbwH0ZW04b95Sz5FLHoY+YN6ZbcASMp3vxoYMsiOt0jVROyi8EZ
 vAayTDFVgqM0nOkCzD3Bz1u6n+oaT1B2T3mbJocnxL+rZVHsrOXAmNg4mr7CP55OT0GL
 gp1EM5VF04DUlbqGKF0Vhk+g1viIvpxPSMlNGNct1YdE7biUy7tx3K+TwBoOUpSciO+k
 xRACEsSjlll17UvvFQ+Mj/iG+GYr/JVmXu2SQqJE/0YPnk1+V7leh1ZSuGJYucIAP6d9
 QmDZtu21GXksovoHB+uVz/SuwqqKyEBsTh2p+qY/9p4T0bp+aavMC7YJ87Ehm3CkeUY4
 rEag==
X-Gm-Message-State: AAQBX9dObYcmULUpX1CHnzW14SkqBn3b25KQRPhePG9pcfeAj3NSC/0/
 pKPjpjIL1172e11G0/AGFT5kZnO66D516DmeLLY=
X-Google-Smtp-Source: AKy350aFicRWvswRoDZ1yiFEWcuTzTmpHjlmzTrMbuXCU8Hhw3+v9Dh3klrbsvbczbJGUmIMYntQ1w==
X-Received: by 2002:a2e:9883:0:b0:293:5164:4f2b with SMTP id
 b3-20020a2e9883000000b0029351644f2bmr5174878ljj.8.1680043093924; 
 Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kalyan Thota <quic_kalyant@quicinc.com>
Subject: Re: [v12] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Date: Wed, 29 Mar 2023 01:38:00 +0300
Message-Id: <168004255467.1060915.667380054091133744.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com>
References: <1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 marijn.suijten@somainline.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 27 Jan 2023 02:14:47 -0800, Kalyan Thota wrote:
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
> 
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
> 
> This change adds necessary support for the above design.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4d5e5f04e596

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
