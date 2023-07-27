Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8D76538B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 14:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072ED10E57B;
	Thu, 27 Jul 2023 12:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783C310E0E6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 12:22:21 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-997c4107d62so116663366b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 05:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690460540; x=1691065340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1SBb6yr6qVk1D7aIwvF+MuMXcq5rUsptu3VpKsdh/uY=;
 b=E/t0YpIRUSdA8qUkKEVwwAbxzJDIw7ZP8JFIlc4qS696AzVGKHZQqeXa5X0v7ynftz
 gWjhCDZ/sxQETJ8KDD0mumZe4SiyyMPQ30LOis/xGakb3U6B5WDQd8yRw9xu73MkEsWA
 vz4knJda8i9mkCBSvKIrANnBbYbWWaaAxjIhLUU5d58Ic+TjSHFelYYLCSlX7YJO+c3M
 nq3lpVGn5sOsQlJ4riCSXqZ2XOmZ7L54K7y5cabw9RIVyZ8BCx2HVtkELtmhASi1FNiP
 7Ty9Nt7wnId/CX0VfxeopkjJChIWLPn5B7UTa+0HQO7nLKyWgzl9aYPVG4xRtdK17s1Z
 Vdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690460540; x=1691065340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1SBb6yr6qVk1D7aIwvF+MuMXcq5rUsptu3VpKsdh/uY=;
 b=TubNhJxZUAoSNGjkPKtQb1Kp9ahq3+oe1F9WXTBXMZTmOKDVh0DE5Jb3fHKxQhO2LX
 E+tvc4G6JXRM5LFdFU1se2C/5BQXINsmJrXGJbt2v9s0O27iFTSc7qyVvcRFlrc+0lm9
 5Pi3Yk9llUS0aplVrBMmlQSGNiKSt/So34GtMrva7Xx/wnBrhSjGnJagFti81gKhfY2c
 lUER4tKzNfz+X2kI9bwxgwDQW4apY34EKLwpgDvi1ZbsmJsLQzgnOPqunf3N8bbP6j4P
 mLP/qqhRs+uQOaQ1TNGkntudjvatJ8b/2jwe86ekVC96x840KEkMjIYADkgwuGfJO8Ed
 15QA==
X-Gm-Message-State: ABy/qLbp6GRkFL8hfm6VhfrHvAF7rjj6PfZap/MQGt7asJvlcwo8+edh
 G9HRfrxckqgJPFpiRNybfp5OGQ==
X-Google-Smtp-Source: APBJJlGMdqN9pdEZl9yeo9ApSXHdIn1KgioXc6BrkcQ3JO+iOZr18yfYrhhsELVum+BCBEMCfSnItg==
X-Received: by 2002:a17:907:a057:b0:997:decf:11e7 with SMTP id
 gz23-20020a170907a05700b00997decf11e7mr1850833ejc.12.1690460539893; 
 Thu, 27 Jul 2023 05:22:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a1709067d9700b00993860a6d37sm717844ejo.40.2023.07.27.05.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 05:22:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v5 0/5] drm/msm/dpu: Re-introduce dpu core revision
Date: Thu, 27 Jul 2023 15:22:16 +0300
Message-Id: <169046051039.1413710.6891392677797766408.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
References: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 11 Jul 2023 18:19:58 -0700, Abhinav Kumar wrote:
> With commit dac76a0144d31 ("fetch DPU configuration from match data"),
> dpu core revision was dropped in favor of using the compatible string
> from the device tree to select the dpu catalog being used in the device.
> 
> This approach works well however also necessitates adding catalog
> entries for small register level details as dpu capabilities and/or
> features bloating the catalog unnecessarily. Examples include but
> are not limited to data_compress, interrupt register set, widebus etc.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: re-introduce dpu core revision to the catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d5ffd30bf168
[2/5] drm/msm/dpu: use dpu core's major version to enable data compress
      https://gitlab.freedesktop.org/lumag/msm/-/commit/51e9b25c7818
[3/5] drm/msm/dpu: rename all hw_intf structs to have dpu_hw prefix
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4c6df9a40bbc
[4/5] drm/msm/dpu: rename enable_compression() to program_intf_cmd_cfg()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/143dfccad3da
[5/5] drm/msm/dpu: drop DPU_INTF_DATA_COMPRESS from dpu catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/781452286aeb

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
