Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EBB6D22DE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 16:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D8C10F26D;
	Fri, 31 Mar 2023 14:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1730810F26D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 14:46:13 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id cf7so27677248ybb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680273972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrHq3nvdZgYqWKc7TXYHf/S8IML0/6fKVdabRYk6kRs=;
 b=FSshoQjBEuyysNCAr4gfKkkGjn4WnfdI+qOqlOkmRGkMNcnt/lTDYQWC74sG1SCNSr
 yA//YZ5ueiDN+mks0OSAOUFD/ujtg6ET1DLreUtSgU2q+etoIHNRF5G933Ped6CgeRI0
 QL92NvVIMFSNYUE9bbc+c64MKwS4aI45gJ4usYlHz/B9dxSZDWGpJNnepadvvprJ3kWU
 SKpZLhDKTfmBr40947S5E077bALebDfpjQNAUSNpdXB1O3cKgF35WnBhuNFcnqVd7wUt
 A6CjUPwCzxd3uRMQakcZWQUV83AYiGZuKUHKAi4faRjl4QKYjuM1EDYKaRJyy4uYt+ir
 Oukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680273972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZrHq3nvdZgYqWKc7TXYHf/S8IML0/6fKVdabRYk6kRs=;
 b=IdF3aAfHCSDP/+GF93QjmQPyzc7j6KKyF6P2OfT+b+kk++99GRO5b/EZV4cIvJALmQ
 TV8m8cZV4lCfxrvfGDkYNPuqvaD+RdHgtPSXdj6MTwSH7i4nnTGONBA4kgxmHdW82Ech
 qzNOVDulfRDSOuS+8Ytl4yLZ9udAbkkdLla3MRRzIOhP2x2vaYWZdMnC4O7AKI/VG+R+
 1pvjMnHnbRIsb3ziCnpEc4+Ncn83VxtPtOG9N/+yWM388tryR7cpUDSubbflQKwZfqqK
 jqT7gXlo+KyYOtiIGFQXK1ftTt00V6x2nN7lOHAB/HnSkFCvQUzdnd6EEVVONPXZ02E1
 0YQA==
X-Gm-Message-State: AAQBX9cZ0u8zuQrQW9Iu0BbbxrdppULoiZUiODWMvxVEARPmXcgDmAPr
 9lkwz8z60sLsuuo8o/nIi/ktXZPW/9YaXQenni+DQA==
X-Google-Smtp-Source: AKy350bPOqn4cx7f84281++qJEmUbQ+CCAD8rP4eVc4hTLCXDTlkGh1wbgDJB5qJk6X6yqA4dryEiDQ+tlglpoAIfVU=
X-Received: by 2002:a05:6902:1501:b0:b4c:9333:2a2 with SMTP id
 q1-20020a056902150100b00b4c933302a2mr14740974ybu.9.1680273972110; Fri, 31 Mar
 2023 07:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-3-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 Mar 2023 17:46:01 +0300
Message-ID: <CAA8EJprG5g2jzfkez1V0HHO0X_8WDfA9cVfaY3K3cUByW58A1g@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] msm/disp/dpu: allow atomic_check in PSR usecase
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Mar 2023 at 16:59, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Certain flags like dirty_fb will be updated into the plane state
> during crtc atomic_check. Allow those updates during PSR commit.
>
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
