Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B374F6D7211
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 03:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8777610E81B;
	Wed,  5 Apr 2023 01:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E9010E316
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 01:35:55 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g17so44694814lfv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 18:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680658553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tulV5ogKne61CvTx3N1p8N7DixxtemOMi19lt5kisEM=;
 b=oBWXa8quJmIhbfFcgTMTnWLgS3FQpza4p/q/HkajSsbK7khXQJTGyyMK2xKzZVlZ2h
 jbGnMmEuyLGY30SLn4T9dXyGQPiwKbFp6O6vDO3FmGKOqznCbZndNWDVtdmDbI9DwU22
 FhtTCl0ESlvLOjc+nEnNFe4VwKt1ohLDxvrCzQsNUZaNxghNkflAQEuToZn6vCTOH7eJ
 giL5JhsJi33xTKsAjkqzB9DspIfFGRrs5A0POHilsD1VfXdKJJtLRRg4+kvv0wQKgCAT
 +h4weL2I8PN7ieo7z66Rd7cL04IVD54haZZA4AmHrVEvDdsEakL461bkC02cu7rB2oXj
 WAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680658553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tulV5ogKne61CvTx3N1p8N7DixxtemOMi19lt5kisEM=;
 b=AywLXRIpntFh7QeLyANGl8nDqrwRUJuAHxnfP5G+zq2JlfcxTvDachHasZRSaPKHHk
 iLZTt5dNda25p4L/biOBJT//Y02KmSXNy338s/wa+yOauan2xe9O4i2VKrl1KlNxOKIh
 ExgEu3pXHmbexfF8Y32HLmG8gF0z+UDCQ+3tvH0rxmRk8MR7b3fT957noocH2uumRdsT
 f2BS1cqpN9W2Vt6hoSdVTE7DEyNYNTmsC7fUX2t2zKTHlBJ5+bX8ERSSJN1nyNWa4ujl
 9QT16osMetr+fJjWySbyWJiiB+S6DTKYqlab10OgrvDUuNh13qsw0NGR5K3IvH9Sv0i8
 pBfg==
X-Gm-Message-State: AAQBX9eAqWKK1sSg7Mu1zHMRu/nd4b7DZNmFo2SV6ey4xM09H1PzFVIO
 UFd3NYBuwmzHIUv3dWIGCDdzGQCFclznwWdhPGJalg==
X-Google-Smtp-Source: AKy350YXg+Yy8O1YhBnYb7hKyKfe7DS5UdKpd65XaMLUwi+nGhiD9izKwxXwL3jLlSo5OQdV8gn3xg==
X-Received: by 2002:a19:7603:0:b0:4dd:9da1:aa82 with SMTP id
 c3-20020a197603000000b004dd9da1aa82mr1022262lff.29.1680658553130; 
 Tue, 04 Apr 2023 18:35:53 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v26-20020ac2561a000000b004cb8de497ffsm2572326lfd.154.2023.04.04.18.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 18:35:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kalyan Thota <quic_kalyant@quicinc.com>
Subject: Re: [PATCH v4 0/4] Reserve DSPPs based on user request
Date: Wed,  5 Apr 2023 04:35:49 +0300
Message-Id: <168065850334.1260361.1390147834885277965.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
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


On Mon, 13 Feb 2023 03:11:40 -0800, Kalyan Thota wrote:
> This series will enable color features on sc7280 target which has
> primary panel as eDP
> 
> The series removes DSPP allocation based on encoder type and allows
> the DSPP reservation based on user request via CTM.
> 
> The series will release/reserve the dpu resources whenever there is
> a CTM enable/disable change so that DSPPs are allocated appropriately.
> 
> [...]

Applied, thanks!

[2/4] drm/msm/dpu: add DSPPs into reservation upon a CTM request
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1a9c3512fbd4
[3/4] drm/msm/dpu: avoid unnecessary check in DPU reservations
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8b1ed0088e21
[4/4] drm/msm/dpu: manage DPU resources if CTM is requested
      https://gitlab.freedesktop.org/lumag/msm/-/commit/34c74e76a6a5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
