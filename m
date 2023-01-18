Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B699767109D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A4610E639;
	Wed, 18 Jan 2023 02:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4181310E62F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:26 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mp20so33230387ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c58v4Ko4NI3Uuss/PDRkANW5YkUAQ7jYBjFl1RBOCWE=;
 b=zI3Kd8HSToOskAIYJ9AMYdGk6gK9HAUtX3cB3qe1xpw8qzqulMdjlmcOl836QQsfzK
 TDsz3LHpGt6jmgbELXDThvifG8xfdgkLYxVtcUjmObM0xAETlJ1iBw/kjBG3FZSotuew
 QFdVXf9gCetL3S/VHhgnWCDxyCJi0WuYquBrokne6kJApWwtM3FiVeD2wslf3XKAJnDs
 U1NK64J8TNee7r9NFXGfZuC9iIUheGnip3wWhTrQsTUPxz/dheaJXAPVE6AojJHv39a1
 yxyQp0ztyn2WjfsU/0Ge+UOLY5qacBIrERfRW7zRXlvGMkco3kjKxcwdZRkzOmQ5IwOo
 0MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c58v4Ko4NI3Uuss/PDRkANW5YkUAQ7jYBjFl1RBOCWE=;
 b=vEIkCqlDRPru8yCaME6blHxxbCg3iyMzlY/rLgPlio4xnAHhsvUxtkwXqOCf2sAvou
 14giP9nx92zzJhieP3pBEa8y9x/zHoGrgaOr1Gu9q51A3QrsxFGnwNCiYdHqo9ZEZRFI
 eIDI1PBEmdSVgyr6QGPIz9Tr9Q+3E279etE6hIz2ywW/crJAPdrtcWGGMxLclfkHA2G1
 Iif8FH76hm6qiStpVrR23xYkigHxcMrXAAzsjuHiJifyIo2lk308q9uccmXJ6wGqZCR4
 rdVzcRr9zWrtvuIHGFw9R2xNd/yqsi/qEP9kL0dHQSoZCAL7yU/HXOqFGg7pcPiFjKvh
 etTA==
X-Gm-Message-State: AFqh2kpihiBosdPvkRPSixQaON3SYPex8vTDyZ4kzXFu4Gv2sOkE2BRJ
 VGnw635UN0fme6KvlBTfmNv9NQ==
X-Google-Smtp-Source: AMrXdXt1XoRpqpsessMQOJ9ZPWckw/DSv/pfowSn+SixvFGSTvatonHQdf4eFrMQmt8g9fnnGB5+Ow==
X-Received: by 2002:a17:906:6c8b:b0:867:f167:43be with SMTP id
 s11-20020a1709066c8b00b00867f16743bemr4551084ejr.77.1674007584823; 
 Tue, 17 Jan 2023 18:06:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/dpu: remove dpu_encoder_virt_ops
Date: Wed, 18 Jan 2023 04:06:07 +0200
Message-Id: <167400670543.1683873.6925891527169997140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
References: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 02 Jan 2023 17:47:47 +0200, Dmitry Baryshkov wrote:
> Struct dpu_encoder_virt_ops is used to provide several callbacks to the
> phys_enc backends. However these ops are static and are not supposed to
> change in the foreseeble future. Drop the indirection and call
> corresponding functions directly.
> 
> 

Applied, thanks!

[1/2] drm/msm/dpu: remove dpu_encoder_virt_ops
      https://gitlab.freedesktop.org/lumag/msm/-/commit/59f0182a291c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
