Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5627FDC0B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41E610E62C;
	Wed, 29 Nov 2023 15:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE31110E630
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 15:56:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40b30308c67so52773445e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 07:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701273413; x=1701878213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWLHEFrv2BwaYku/k8VggqgQo9KNbBhgRAz3EGBg5pk=;
 b=RijMuYcbAPNYDAcRKkepGLSRXRFZRTiAL517JxkQVUc5h1BE88GEO1cFzqM6zgH4XT
 aJVlgbMXpb66v7u7lEQPEkCqXD2ho1936J6iJ1SrYFNFTmcceLb3BqDhupsHFjuM4hfP
 EvFN5FM4sTExX/KbJWEfxPWMZfH/sb4qDLQ2hoMOAMnxncDs47wzGt4HNqIVJhx/PPNu
 hOsdLBFbvlFdSvERtFQdyK7Am2xD+dcOrEK1kKeGCxj/wffwolYTzIBpRlLQbw37DoSg
 WxA3g9H4NmJ5SOQcf2tcoJzCUMMddBWZnzhpjrWg7xPW9MKtmIYNThQko/UFyDlnq410
 /bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701273413; x=1701878213;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWLHEFrv2BwaYku/k8VggqgQo9KNbBhgRAz3EGBg5pk=;
 b=dJMB43x0xaIIoXyQTlnxg1Ojs6o1wOBX6hLNUKpgufzbbnW5fbFASdMeNiwzORC4YL
 lPdXQLEviGc9nx6P6QAwGga9eLLAoh4gWvT1z/S6SMQCNe6NNoRNbioyK23IN8Ug/jxQ
 ed8zobAntIznJmR4AvRjUW3/sTgsDuLCKyHmvZOJOmgz0wjm9IsSrV6L2Z0njduy9QP9
 f8YX/Pj5fWR2pU3pgWAmpjyoV1xVMe4Jt9QPb5zwA8YXf+6Xx5nwyzu20Y1E+tRotO1D
 oiZqrylqaxIjDb5AmLzbTRMkF3JUZ+PDivwWKMZk3vApXSH01mgw/k+JacDOPuvO5Vjt
 GTxg==
X-Gm-Message-State: AOJu0YwFM4K/DXIpUUaFAz/s+1elwvMwW5o3AngvJxrlVPds23tAffuI
 CgxCUHCDDJYwduG8VCQIyNQchEqCQXWbnprMXbxL6jb9
X-Google-Smtp-Source: AGHT+IFdbNo3z+8x1UUW1CCiP2ozkJtXusVbV9X1N5i66hWegOQJhdjuZgdVRHiZEMY3jImzPnrhew==
X-Received: by 2002:a05:600c:a49:b0:401:daf2:2735 with SMTP id
 c9-20020a05600c0a4900b00401daf22735mr13856317wmq.31.1701273413198; 
 Wed, 29 Nov 2023 07:56:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a5d56c5000000b00332cbd59f8bsm18213464wrw.25.2023.11.29.07.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 07:56:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Yang Yingliang <yangyingliang@huaweicloud.com>
In-Reply-To: <20231129090715.856263-1-yangyingliang@huaweicloud.com>
References: <20231129090715.856263-1-yangyingliang@huaweicloud.com>
Subject: Re: [PATCH] drm/panel: nt36523: fix return value check in
 nt36523_probe()
Message-Id: <170127341246.3123416.15554035702614580461.b4-ty@linaro.org>
Date: Wed, 29 Nov 2023 16:56:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: mripard@kernel.org, lujianhua000@gmail.com, tzimmermann@suse.de,
 yangyingliang@huawei.com, quic_jesszhan@quicinc.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 29 Nov 2023 17:07:15 +0800, Yang Yingliang wrote:
> mipi_dsi_device_register_full() never returns NULL pointer, it
> will return ERR_PTR() when it fails, so replace the check with
> IS_ERR().
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/panel: nt36523: fix return value check in nt36523_probe()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fb18fe0fdf22a2f4512a8b644bb5ea1473829cda

-- 
Neil

