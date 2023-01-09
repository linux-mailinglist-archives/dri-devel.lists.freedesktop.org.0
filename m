Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7861663B0D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFF310E566;
	Tue, 10 Jan 2023 08:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A534B10E0CF;
 Mon,  9 Jan 2023 23:16:16 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bt23so15494042lfb.5;
 Mon, 09 Jan 2023 15:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRAyi2n2FSarDTatQAHom6gbymd5CATd4MjDLdYU+WQ=;
 b=b4Uv+CXMXlZtwqrSfCLoi378tjvHb4etfrlxpdyXiDHBq7dB/wgK/wFs2oFjtEpZel
 2uMQIPeZHEicJmOV5pgaZMFP+j+G8HG1c4VW34jTAe5Woj80MxYYnZjTY46Sfn5dnoLU
 TfAts+Yt8I5Xje7dHjt7FbXC49EfH6ifC3otMRvAV5BJyeyEYZnp4H20bJtWyVTkM8+u
 Zbg+o3NNTTyU7OLYnwncMsNfHiKrTnJeOlhGuiz9PctdldrTlfacprZgTKAkhjyHkbM9
 aCir3j8BceK1rPwaamM2iE8F1/vCx+xKyQGtRYcCAeq0cXbG6rx2qR3u/fdxp3jDg/tk
 oTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CRAyi2n2FSarDTatQAHom6gbymd5CATd4MjDLdYU+WQ=;
 b=Qn3jOv0vnu6Cl3TYDc+0Zs32xFQlqMztrr8GQSZvY5MM95zMoDcayh8yro5OTmQrmD
 wO5yfckIg2kyyJvkubrRTiNDov0MQ/kuW+p6DMFuwJ/tJBr7H9gxPOJAiq+sc5mK4nSs
 xdw+ISS35/8HHNbSi5bb5nGUJ4bBcHodCyr4yBvM/fUv52K00CAFu9+oB4qa1Dq1RcT7
 IwwVKy21m1e3FlA6xlyY1gpRwc0J2nh08xQpMEC+2/DTdKlPyQQQ2Bc0/e+OIAzXKtZn
 TThm1wBmj+45IwbWMxMOlP+dpC/YbC8JtCF/4h7E3Nb1cMbPLHZtbmle8HMjnfzDiuuq
 rUqg==
X-Gm-Message-State: AFqh2ko2N9ILoDoj0ViIA6JA75NkjyxenXfd5tmtz0vMlfp+3+30vFt3
 M2yLmhIEQsUeEvNWeKZRt20=
X-Google-Smtp-Source: AMrXdXtIwEE5Za8GXe9lgmkNcC7x8cBRABMaPprXpAMFBHNbva3FqyXnd7ZAu+nw15tNw/d530/K9w==
X-Received: by 2002:ac2:43a4:0:b0:4cb:3a60:65cb with SMTP id
 t4-20020ac243a4000000b004cb3a6065cbmr6861205lfl.6.1673306174920; 
 Mon, 09 Jan 2023 15:16:14 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a18-20020a056512201200b004cc59b46f74sm1819042lfb.106.2023.01.09.15.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:14 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221107103739.8993-1-konrad.dybcio@linaro.org>
References: <20221107103739.8993-1-konrad.dybcio@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu1: Remove INTF4 IRQ from SDM845 IRQ mask
Message-Id: <167330408784.609993.15717302243167908042.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Loic Poulain <loic.poulain@linaro.org>, patches@linaro.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 07 Nov 2022 11:37:36 +0100, Konrad Dybcio wrote:
> SDM845 only has INTF0-3 and has no business caring about the INTF4 irq.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu1: Remove INTF4 IRQ from SDM845 IRQ mask
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a685d27f2201

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
