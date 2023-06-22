Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549637398F5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 10:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C2410E4FB;
	Thu, 22 Jun 2023 08:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD5810E507
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:04:47 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so9458421e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687421084; x=1690013084;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yV5XhHbx7WVjBAK56xogxs0DI729VsAGLQSVMFZOoo=;
 b=YsYTdYuKMnYpr21jHhioM4flvjdtd990RxA2bj3pNdk1NwDuc8/T+tBwi5/1xiAujr
 Gu9zQcidTDIOaBhX7vPfwaUCFBr2OeyocZxut32s5+Nr1BVv3L4Ui6GkZlukC52DH5Op
 PPDlAo+9sPzNDZepVH4tDiCVJh1tC5lnVBLSM/qpiJe03yQgmcwhyx9wJoyttI1uKxuK
 0AYB0LFjhJulQ/c3lZpBsIeop1xQjKBcGpoTSCcNbb3HNLZzjNkbCJ88dey6rnzU8vWW
 Isx/WLAhXd8CITZU8v2JYYSXVTVvuS5CjNm5csLRtZUloZ6Ar7Iy55Zeus19UnVjIHQa
 xmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687421084; x=1690013084;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6yV5XhHbx7WVjBAK56xogxs0DI729VsAGLQSVMFZOoo=;
 b=KnxUPsxHRK/gj5KsMs+6mrFm6FDDPJhPLNoDo+oh8YwYm4KZ2fm/SH1C5vd9Fx8roh
 PWtao/WODLtNQRku0tnNrNctBwUfXxhQKc8yE8C0cWBtQlrjV9Ia/9K8kkfUUgZ9IbL9
 gYmwsH/8mXEERuYsUd4DfoqbLsp+3AS6j8y98q4Pb5MouodOmsD3fFaBtvcadCrU1u4R
 zPLF3diS5V5Q3sDuWlJu15T60ZIs8VXXOaj9G8+r9elRd1kzJMKBAiFHxoKykxN/pz0V
 UbjGmNIBhnaGx8PewPi0WrEBz8tgH2m33S+ZvE3sR/KRZ58gCJ8N+xAnu8G3DUUWMatB
 w0Cw==
X-Gm-Message-State: AC+VfDw7W4NLH+KewRJ6IrXZdTt6cM6OFALRpW8oKAPlOHdGc7ZYe4tV
 k3G69PQKXPp0Krnca6iuOJAa2XV91jVenw3BOn/zGQ==
X-Google-Smtp-Source: ACHHUZ4CNB9Fkt8yj8OV1ia/VeBxm+yrOuHJFfaKzcqafm8SnH1b8ohDmgre6KoSfNUfueHEboJ3rA==
X-Received: by 2002:ac2:5b8d:0:b0:4f8:7513:8cab with SMTP id
 o13-20020ac25b8d000000b004f875138cabmr5960795lfn.43.1687421084457; 
 Thu, 22 Jun 2023 01:04:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a7bce86000000b003f735ba7736sm6950210wmj.46.2023.06.22.01.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:04:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20230620112202.654981-1-festevam@gmail.com>
References: <20230620112202.654981-1-festevam@gmail.com>
Subject: Re: [PATCH v2] drm/panel: simple: Add connector_type for
 innolux_at043tn24
Message-Id: <168742108356.2208960.12772192134430254501.b4-ty@linaro.org>
Date: Thu, 22 Jun 2023 10:04:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 20 Jun 2023 08:22:02 -0300, Fabio Estevam wrote:
> The innolux at043tn24 display is a parallel LCD. Pass the 'connector_type'
> information to avoid the following warning:
> 
> panel-simple panel: Specify missing connector_type
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/panel: simple: Add connector_type for innolux_at043tn24
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2c56a751845ddfd3078ebe79981aaaa182629163

-- 
Neil

