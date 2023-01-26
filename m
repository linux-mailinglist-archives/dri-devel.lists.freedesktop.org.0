Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FBD67D4F2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDF310E982;
	Thu, 26 Jan 2023 19:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB89610E987
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:20 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qx13so7606550ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+PV3o64mySToMwB+lYwZix37qEFlzbLtvyQStVksaE=;
 b=br8II8E3lVtGw4b1UqtDJw9xLmFQVU23gZp5vs8W7xufTsvviQxqJs7JuOPE1U0v5k
 yVDsOWYlyobuD2sEN4bAyoiufOthIExRq9MUIkTNQ+v69C8It9cxqlbv4rQpHdcbplwl
 /FEr36Ej1VaUmZ9mrkaaRuwjDnebICJ7FUuPEUDuDtzFEmvFppgdmW6gjS08oYGeRr3C
 RsOvP2y7O5KSyQkJQs92M+Cqv6JOVFi7BatoWKa10JqlzP28OgzxbZ+cex6KxOZ487UX
 GXDlcvHrxkz3wlLT+nA058ePpcggG99nhrlsoDpgFHXWx1fQkLC29qMQJE/6Ie+aWjPt
 xPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+PV3o64mySToMwB+lYwZix37qEFlzbLtvyQStVksaE=;
 b=lQ/70T2kQkAgtfmsCNXtW9skuFSJDVeXmJrvnfVTvhXpkgDeFGNngk+/2aY+Hf7Ojb
 720Ha/w4Oi/w2Eclc87qL7T5oC4GzbxBzAVQv6usNd06aXO36XpBzLTlz0GTx83Bj/Ao
 AbtljUqIoOLFb0m/NAnmyI9CxAneWvgT+sZzHsuuZLcH2qSYfMioIiC+3w0a23BTTIUJ
 OaHTxPVvvkGSKF5roQDQPmvwdO/qvIqFOYQ5vgIhw7vE7lr14weJfZ2eyzxdkOCgjB7M
 rqvMA3Qx3sHQzudjhAV1IqwMpdbDOKUSPcedJBudqxsgNEyc9Dxz3CZINR7lnWW42WUb
 dnrQ==
X-Gm-Message-State: AO0yUKV7/JpE3vCybqRqiEdjdWoUEp7PBFVCF4Q1TLQgOA3oNqmYYORQ
 LZj8S15KGQbdKfM7eVNqQE5hGA==
X-Google-Smtp-Source: AK7set+i6HKxfdpJxTA7ijTraS9Vw4nPNPJJDNQ8xDtWwc9qKbtnSjGlUTVe66JQ+Y82lX7IY88ZvA==
X-Received: by 2002:a17:906:d974:b0:878:7a0e:5730 with SMTP id
 rp20-20020a170906d97400b008787a0e5730mr1936103ejb.56.1674759680548; 
 Thu, 26 Jan 2023 11:01:20 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 ville.syrjala@linux.intel.com, yang.lee@linux.alibaba.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm/msm/dpu: Add check for pstates
Date: Thu, 26 Jan 2023 21:01:03 +0200
Message-Id: <167475959090.3954305.1335839969306082106.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221206080236.43687-1-jiasheng@iscas.ac.cn>
References: <20221206080236.43687-1-jiasheng@iscas.ac.cn>
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


On Tue, 06 Dec 2022 16:02:36 +0800, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer,
> it should be better to check pstates
> in order to avoid the NULL pointer dereference.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add check for pstates
      https://gitlab.freedesktop.org/lumag/msm/-/commit/93340e10b9c5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
