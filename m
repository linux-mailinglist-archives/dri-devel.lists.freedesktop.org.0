Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F8A663588
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC9710E47E;
	Mon,  9 Jan 2023 23:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DC810E513
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:04 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bt23so15577894lfb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJYCXzCwWlmnquQ5yNkG+nGz0jiVnLUqp4W9MaxrD4s=;
 b=RIPP0LX1WVF/EwnvQtIj9jJQabFc2G1iyrCosOv6yvEXLxKIHVdJDa5nwzFlLU/isO
 0xnLLL5EcOekI5uHkhLcnOZkUzGqP13Fl069NnVwv590tcKGPg3rMP2n6zpfmK3YDaJE
 eGnaxtnchWCtqGKaR7uPRGw4kb7tdACQwLpKtFyBC1DWYDTAqRDvA+S7+tDj+oXg4mY3
 v1iTvaAsh+tf7nI/gZsUcWZzWx/htWgqmh1ovXPig19o4FEoJuvEvoo2Q9SpbcWXGL9H
 kYb169Z+TIdUuBIzLlqfhpKvwMDvzog7fpoE/POg+/+ckFqidCkW+15WFd1r42qEAkIk
 Z2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJYCXzCwWlmnquQ5yNkG+nGz0jiVnLUqp4W9MaxrD4s=;
 b=czM7MSndkoeITxGxV1hB1Rhqh2GJ1JRvxsqdrlIQYAeufBfdIGUlqcjSTAZkf5qRZX
 oDOdyBf/WGXKVdAhx/8H9b0k1+egxmGj/UJx11aB1jRqx7WZVklldKdhP+EEoF1MOnzZ
 yIUtxqBh+d4SSY2hVcP4+wtmst5dvQ6xrKo0hpG4XvaFLraFt2hDEpl9zNT8XohMwQ2q
 3FWSQ+oAS0iybvlmntDIQPs4buk4Xpl0x87rMjgyHRZoKnLxxPBqY/sQXdhF9rTW8YHd
 zClr0OlTzVzI3Q9hvI/UOwLR+XPbL0TlKp7OmdnP8tI4mqPO34gzNfkJir5Mv/Pkcs10
 ocZA==
X-Gm-Message-State: AFqh2kqTpoOSCCzDWqO0BC334kC/RY5kI0O/lVtHMVB67U21TJR2iAkB
 HXV+6AoJhqc+ROQy7WrIvQcFsQ==
X-Google-Smtp-Source: AMrXdXvhuCtr9p3TaitJ7JU10h9BQxbrBE5HONX1QxhdjdTu1u8Jk5LG3EXWzIioN5/bOobU+UeVjg==
X-Received: by 2002:a05:6512:3f0c:b0:4b5:2ef3:fd2b with SMTP id
 y12-20020a0565123f0c00b004b52ef3fd2bmr21828551lfa.18.1673307844326; 
 Mon, 09 Jan 2023 15:44:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, swboyd@chromium.org,
 quic_khsieh@quicinc.com, johan+linaro@kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm/msm/hdmi: Add missing check for
 alloc_ordered_workqueue
Date: Tue, 10 Jan 2023 01:43:48 +0200
Message-Id: <167330408781.609993.12402793226257634056.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
References: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
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


On Fri, 06 Jan 2023 10:30:11 +0800, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference in `hdmi_hdcp.c` and
> `hdmi_hpd.c`.
> 
> 

Applied, thanks!

[1/1] drm/msm/hdmi: Add missing check for alloc_ordered_workqueue
      https://gitlab.freedesktop.org/lumag/msm/-/commit/afe4cb96153a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
