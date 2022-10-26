Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E04160DAF7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 08:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B67610E40A;
	Wed, 26 Oct 2022 06:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C0810E440
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 06:08:57 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b1so26603998lfs.7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 23:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AQkFYRMFfXcuqnRcd5m+fYI759MoxQcwxUzEDkbo1SE=;
 b=weuKcUHywG8ZesBbFANZ9FB0o9RqWvSCMP2tlTH+iTy81QUj/HHOydfK9fF46TXkVV
 hn0aoQM/4wY04vxz/lHIFwW8KpuP1rJROqiGCoCmlxHUCgJybETGbvNzcdvbbq2kTfBd
 FUwTqq+1dctUt2C/B72NWmH5BBJNErQ4i29z+/Sbn1dokL3edOjfqUuRiySRiQYSfMwS
 ewLEzfs3QpAwPY+THp+zKuWET4/axtn4NnR+16aBdXfrXHu0QlXEgqKETc3e38lCzt7l
 vL2ktf2IbcZbzjQNXA75f3nNvrX8hcm1dDgtZb1vAY+11heBsAfYwhdXvb1ebsRQvR8G
 RpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AQkFYRMFfXcuqnRcd5m+fYI759MoxQcwxUzEDkbo1SE=;
 b=zYLItACuROsEZzOtPpuNeBVjgW0iaXh0Sq221fz9cmWMSRM1Ilxf0p4KRYrYHhKTYQ
 p1eY0opSVk6YZbF5kqk5xXSHtsJLAtGOnRZpOXuWuW04sX/RBYqeYQnWcQNUHi77rcXO
 XZEph4PIeNh8VZ0ILGbKAVpbMvdDt19Ll12ofdM6SYPy/WnpVgR39yfRsyyLvdM5YFU0
 zUU9AUiszCUdJBF5EiGEYv+kO9xwdgHxfmE8ULgsKcVqGtVhUR2LyakaaBY1AlMBqQrB
 LOknS13eC3FFQU9lRGQgVdd3cT/Pkwen2lDoyVtOuXOKh8UPHMzYOiAgRaAQ2g41IS+l
 GKoA==
X-Gm-Message-State: ACrzQf0ouUPG4ZCGFJ6d/Qd2e8pGjFJwfYwaEwtiYQice54l4jInQkKn
 GoP1/JhyI1VVWw3W7VFEU3i6IQ==
X-Google-Smtp-Source: AMsMyM7aBlusqzl2oZMMOP75nbW9SLTYRVvCS1Z9KkDA0+hM7L4qVTHgav6Vj9SBZUpunCdpnGWYEA==
X-Received: by 2002:a05:6512:108a:b0:4a2:7ec0:2fb7 with SMTP id
 j10-20020a056512108a00b004a27ec02fb7mr17134312lfg.553.1666764535618; 
 Tue, 25 Oct 2022 23:08:55 -0700 (PDT)
Received: from [127.0.0.1] (85-76-42-158-nat.elisa-mobile.fi. [85.76.42.158])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a05651236cb00b0048af3c090f8sm726299lfs.13.2022.10.25.23.08.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Oct 2022 23:08:55 -0700 (PDT)
Date: Wed, 26 Oct 2022 09:08:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 09/12] drm/msm/dp: HPD handling relates to next_bridge
User-Agent: K-9 Mail for Android
In-Reply-To: <20221026032624.30871-10-quic_bjorande@quicinc.com>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-10-quic_bjorande@quicinc.com>
Message-ID: <5974CB5A-699F-4768-9DAA-FAE507CFAD53@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26 October 2022 06:26:21 EEST, Bjorn Andersson <quic_bjorande@quicinc=
=2Ecom> wrote:
>From: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>
>The DisplayPort controller's internal HPD interrupt handling is used for
>cases where the HPD signal is connected to a GPIO which is pinmuxed into
>the DisplayPort controller=2E
>
>Most of the logic for enabling and disabling the HPD-related interrupts
>is conditioned on the presence of an EDP panel, but more generically
>designs that has a downstream drm_bridge (next_bridge) could use this to
>handle the HPD interrupts, instead of the internal mechanism=2E
>
>So replace the current is_edp-based guards with a check for the presence
>of next_bridge=2E

This does not sound correct=2E The next bridge might be a dummy bridge, no=
t supporting the hpd=2E Please change this to use the enable_hpd()/disable_=
hpd() callbacks=2E This way the drm_bridge_connector framework will make su=
re to enable hpd handling for the bridge that is actually supposed to gener=
ate hpd events=2E


>
>Signed-off-by: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>
>---
>
>Changes since v2:
>- None


--=20
With best wishes
Dmitry
