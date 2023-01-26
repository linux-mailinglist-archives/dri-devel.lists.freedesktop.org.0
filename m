Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D247E67D503
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C853410E98B;
	Thu, 26 Jan 2023 19:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FE010E97C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id rl14so7748012ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/MQtjH1mkm7AqWVUG8R8PxBUPeeTUYPrWIK/5+KgiA=;
 b=BUicY8w7Cg4CvvVRquFV+WJ0QeOwi6vsbrxmHOhMGwV25qxRXRkUT9iPFTPebUc/88
 g9f/A7OOf1p2fdc/6q8kVGk7cH7/HBZFHg+7sOuL/OmO0FVYpXHAd350rwqRm15A6KKy
 aOBpNvSsoTfUN45J+ewLql9fUXdHwPOarMsXRbuu61l3OQLz0HV7HaIVKHvKi2e1bXJd
 sUlqHs/0NZKIxqoaH3Ih3XlZIa4BIRysmWxdhg4gnOgfdoMPMW0MceWRR9VcPKBLjFfa
 pBOMZBlqowhKoCBDFLv6a0BUnSqNlWM5iQ/zNQoAr7/hj/2mwE1icrYn0ALppYxhmTJW
 tuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/MQtjH1mkm7AqWVUG8R8PxBUPeeTUYPrWIK/5+KgiA=;
 b=wsF+C2Z0o9ngFlSZbZwUCsjBCsePRxKCVfdkcaHD3VqyKG+VABHvOwoqpCegjhj9+x
 8HqG5RRem9v/HFzSTrOxRE8ArSQ+ma2j77g1VcqoBFxsJ9Q1WlI5OKS+g+avWhVuDD+Y
 Wy2VtudAh3/jPBUFFnbeBODozFuvL93hzDspP6sGx00rWsmOP+ChU6nHJFWiT+deN8xP
 h/zffVxXI7izfsXxyDjhUcQOQS0PVCZDP0GV4/6L0tBk8cLno7NhaoXwvnAl7wLZY4bU
 LAJI42/6CXuW64NasZRQcTxffSgfXYiDL3FMYIizX3WT4kqCyJwEqyJdvFfoC4d6XtyW
 Y8lg==
X-Gm-Message-State: AFqh2krbbLHGonTMmflMx/oIP3XsQbEj/jP4GVhBgwBd4LPbw6XFK0U5
 BAiQ91oHEYsIhn/Q2LAwty47Cw==
X-Google-Smtp-Source: AMrXdXsXfrQy45Ya6lKA6L50vJMUW7P5TrZp7aWrVmJXxSfb3EXhEPKbWX5+uG1SZBE6FL4mJZco+A==
X-Received: by 2002:a17:906:9e20:b0:7c1:10b4:4742 with SMTP id
 fp32-20020a1709069e2000b007c110b44742mr31676549ejc.55.1674759681746; 
 Thu, 26 Jan 2023 11:01:21 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 ville.syrjala@linux.intel.com, yang.lee@linux.alibaba.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm/msm/mdp5: Add check for kzalloc
Date: Thu, 26 Jan 2023 21:01:04 +0200
Message-Id: <167475959090.3954305.15850906427772630673.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221206074819.18134-1-jiasheng@iscas.ac.cn>
References: <20221206074819.18134-1-jiasheng@iscas.ac.cn>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 06 Dec 2022 15:48:19 +0800, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer,
> it should be better to check the return value
> in order to avoid the NULL pointer dereference.
> 
> 

Applied, thanks!

[1/1] drm/msm/mdp5: Add check for kzalloc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/13fcfcb2a9a4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
