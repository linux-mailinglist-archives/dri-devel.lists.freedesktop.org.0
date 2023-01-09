Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C750663B0A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F162F10E563;
	Tue, 10 Jan 2023 08:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4295610E0CF;
 Mon,  9 Jan 2023 23:16:15 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f34so15492568lfv.10;
 Mon, 09 Jan 2023 15:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJYCXzCwWlmnquQ5yNkG+nGz0jiVnLUqp4W9MaxrD4s=;
 b=YTI7W3G4y1L5rwesm0WF5z+DsXipiyuGioX3bnzpjRNpUysDgdGM+otXAgEBLyVaY6
 pRsclm0+HmfVrySDdrkWNefV0vsp2ds+8TU7Kf/4Row5Jsc2YYP967SJlts5bM/090BB
 18hHtVNVZPgzuISKTp6plNDiXjsbLtRPduh4gY2DC5mYpHvreu8Ekri0NmfR2ti76yoK
 wD5faO4UmJtaeTQDqGjRT3ojvEpevC9CsZP+Pnunct7wAPNxfhJh73egSgXsnph2DMsx
 NyA7C3vs1UcakHvqXMPnwHgz8hf8l+iPwNA9Nsnz8Y/hdFQF0rJp8L7SayU6JZ066Qlh
 LPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJYCXzCwWlmnquQ5yNkG+nGz0jiVnLUqp4W9MaxrD4s=;
 b=Gs2Hr4pzqJaAQyXmgXTsSdpRCLIb2WvECaG1d/j87Sy5awWV2izW81FE/zmLi3z2gG
 hd8rbPGgJyrrGskCdZGb44Z2LFKUn6PzbvWt+zO0rkDPfCl8/JXtSWE/42vnVkrHXAeX
 DL8VNVagb3Qs2VHItTKrql0HtC3IIDbtWaReNeA6ejaldbVy9+MUk6WcvtJ3wu2XG/02
 ZyyOGBOrWv0s79i2Y3TeeAJMapz262vvuM3hXXOPsaf89+55qLdlQNpcPCsXGIzMMkX0
 Seb6ch6W07xldxYxJMmpSCxd7lLkfjFLIRjlfbj4QsQrnjhQPEzC/Lrgk9HfrdwVvo0h
 m3Jg==
X-Gm-Message-State: AFqh2kq/9O2BKzr7WIQaJ3mPuiwbe3gIVjwFH0ygNHcCJgT3/u4O2Tsw
 qfsrfXEoMUryC7xKYpS7smY=
X-Google-Smtp-Source: AMrXdXvXSiOF4gRJTLJ3TV58YDP0SSl7wPd+ZUlMGSvcU+i9HSGuoSykydyjYrIW2CK/p/5AMFd8bg==
X-Received: by 2002:a05:6512:c1c:b0:4a4:68b9:60b0 with SMTP id
 z28-20020a0565120c1c00b004a468b960b0mr23307701lfu.59.1673306173615; 
 Mon, 09 Jan 2023 15:16:13 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 d7-20020ac25447000000b004b40c1f1c70sm1837407lfn.212.2023.01.09.15.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:12 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, swboyd@chromium.org,
 quic_khsieh@quicinc.com, johan+linaro@kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
In-Reply-To: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
References: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm/msm/hdmi: Add missing check for
 alloc_ordered_workqueue
Message-Id: <167330408781.609993.12402793226257634056.b4-ty@linaro.org>
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
