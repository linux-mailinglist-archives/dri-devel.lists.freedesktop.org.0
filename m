Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA409F08BC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAE410EF8B;
	Fri, 13 Dec 2024 09:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a79nI7MJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2050C10EF85
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:56:23 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso15793575e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734083781; x=1734688581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGeui2qDe/QtAAEccy4jcbt4DaQGI+3seLjp4RFZd0I=;
 b=a79nI7MJ3cBfEXv0aPAYSOBKlfTMPW4uza3NRpIzMKy7Pwn1ELTCgHxlX79TOzZZMf
 fhcAki1CCJ/IGoUdJzdc7jGTMtYcJboIh8V45yfVa9SLs2lqJJIBWL/l8nd6VvgPXNFr
 yLY8LFSvF40UcOJ3zApdml9pGZ7+Y8IRPS+ILc1Lc0Ms1dCz34itT0MMsGmBH4dBL6fo
 eovvOT8cpPFQJkEONCbc+Xtf/bbyDFly1lBskK1jeAgZI3TE3E1I7s9AUYGNsKdrxGQg
 BS+JsYT+3gNGbR7A3SZ3Hx5dD2yRwHxgQ9afm7ARlxHwh139wznUII3kyN9ShQ8odj1V
 YQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734083781; x=1734688581;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGeui2qDe/QtAAEccy4jcbt4DaQGI+3seLjp4RFZd0I=;
 b=ZViM0eZcWhty2jj4GjRQkqXjhQP2jUArgc+I+akQiL8BxhYk1Ag0DFLyM/0+1gTEi2
 D/x57wNsIg1MxxtD6G/M13vnrfWb5zirvzuqZYQ9hQlHe4uzEuJeThUtEq4BM1gpDwJL
 A8EvPyZJ9QW9Qti90nGiC42weXEW7A1DnBDZSVEddWl23kEMhyruZ7MjY5aas5O9jLrY
 gHc3tPvPKcIBLTu1n9GuJqvhz0UbBYTH69Rl6O7nMOWD0/Lzay7t834q61I477XsViG9
 GXo2LtN/5aTc1fIioCHtlGqO/nUrK/yATwkTW7y207X3RtYq7+iGuATP5/EJqhOdXfAT
 QEAA==
X-Gm-Message-State: AOJu0YzHwQuRexNFKV6RJf/Z7TfnQdIK2+lQs+e6oMkUvH7lpGjudq61
 DYvGvXk4L2y6zUEVlacOPMCB/a1bfGuotCYLb8bPgoUrf4DgXwO0F6otITXPHL8=
X-Gm-Gg: ASbGncv071KHsa3ReS7wqR1vX7FRHSF4EHZM6Sr05lhNI89VGOV5a6Rk7noM8EmzLO3
 MN6u+7kakvxXxCY5XmijmhRwuyJRDyZ0K8bakFtb10Edk3NGKkMvRMDjEKGUeuXHgXpHpT++lpN
 2j9rMM5nR/6t++h4SXEttEtAryK/2YxLRkAmvzRUjt9LASQiK73Q45tpKN234bVCR0Sx3RQNaV0
 NKRTMqCu/eOfCuqijL5yOUXQNBQ3GieR3ndLzKl0KcY6Icr+q5mG083E0XtkMA+wgFDz5tHKzFZ
 nw==
X-Google-Smtp-Source: AGHT+IFZfbMEqrznb25Lz3Td3kWe8f4ExhAY8H2uztH0xDwis0bnhxlzH0bK9MnmAjSNta3KsGOkiQ==
X-Received: by 2002:a05:600c:468b:b0:432:7c08:d0ff with SMTP id
 5b1f17b1804b1-4362aa9745amr15191465e9.23.1734083781565; 
 Fri, 13 Dec 2024 01:56:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625706c77sm43616845e9.34.2024.12.13.01.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 01:56:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 angelogioacchino.delregno@somainline.org, sam@ravnborg.org, 
 marijn.suijten@somainline.org, 
 Yang Yingliang <yangyingliang@huaweicloud.com>
Cc: dri-devel@lists.freedesktop.org, yangyingliang@huawei.com, 
 bobo.shaobowang@huawei.com
In-Reply-To: <20241029123957.1588-1-yangyingliang@huaweicloud.com>
References: <20241029123957.1588-1-yangyingliang@huaweicloud.com>
Subject: Re: [PATCH] drm/panel: novatek-nt35950: fix return value check in
 nt35950_probe()
Message-Id: <173408378059.189325.14590971819444041890.b4-ty@linaro.org>
Date: Fri, 13 Dec 2024 10:56:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 29 Oct 2024 20:39:57 +0800, Yang Yingliang wrote:
> mipi_dsi_device_register_full() never returns NULL pointer, it
> will return ERR_PTR() when it fails, so replace the check with
> IS_ERR().
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: novatek-nt35950: fix return value check in nt35950_probe()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f8fd0968eff52cf092c0d517d17507ea2f6e5ea5

-- 
Neil

