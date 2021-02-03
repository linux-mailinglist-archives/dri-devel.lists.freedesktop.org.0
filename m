Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CA530EE61
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECE56ECBA;
	Thu,  4 Feb 2021 08:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673B66EC4B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 23:42:37 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id o7so872088pgl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 15:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=yHURpLyu/TquLwx0y6eDJwaaKqJ+uw0cFvyf4JRgnoA=;
 b=Xbu8iTy1ZRPuaYXRVmxobKDV5EKGQvnequV/L0RekgYt4FzgK9lp0xnGDN73+uQyoI
 ytcu36a54c33UIBrX2kuE3aKpL+gwWCeMAsiadVMATEvvyhykfzqXLIj75BPw6+eCBgM
 +vD8KVcdswPshqB4gWnt5M3kUDKl0LXXsgLx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=yHURpLyu/TquLwx0y6eDJwaaKqJ+uw0cFvyf4JRgnoA=;
 b=YZfx8RXpPO2/ZKjrP6lcdEKp7zSeiaeJszfkKFkE7p+d0vRu9/7tDUwQ6SZr2PTNX2
 /1CIc9xUVzSWFriCGiKScTX0CGmr4Fy7fJzDf3M5QUhGsgCdMhVJz1/FM02AvdeuF71h
 0714KPyCY60E7L3YgqjwE4850nFk4lNdU69aOVYnBjNovKnl8h9GTecqiPwXrfN8L9kK
 0KPfXNaHybBxyLs+9xkBCEYlDzSyV3Q8th8Gl+DfU3iep8ui1/9bAlC1m95YPbdxkifu
 foQ0//R2Owy4y6xa2pUg9SfEHx4gtY/uk9RMHCZpM3228YLVu3URrOk5G4JCIqOPh+7e
 IC1Q==
X-Gm-Message-State: AOAM532ZtJFXeuf/cyRtkPeUzQzMSoDxDfPiKwjY8EUILPr3SUmS3z98
 KqBukRdrp3hrphh6FVepHLWrGg==
X-Google-Smtp-Source: ABdhPJwhsJh7E/fIDVP54k0kiykGJypLBRTzhIYCPpD8yyPHqosMKVlqghMEgmQEviD79/BVAuLORQ==
X-Received: by 2002:a63:454e:: with SMTP id u14mr5968407pgk.113.1612395757069; 
 Wed, 03 Feb 2021 15:42:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:59f3:e03b:c082:48d])
 by smtp.gmail.com with ESMTPSA id r189sm4026820pgr.10.2021.02.03.15.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 15:42:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210129094416.53601-1-vulab@iscas.ac.cn>
References: <20210129094416.53601-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] drm/msm/dp/dp_ctrl: Remove unneeded semicolon
From: Stephen Boyd <swboyd@chromium.org>
To: Xu Wang <vulab@iscas.ac.cn>, airlied@linux.ie, chandanu@codeaurora.org,
 daniel@ffwll.ch, khsieh@codeaurora.org, lee.jones@linaro.org,
 robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org
Date: Wed, 03 Feb 2021 15:42:34 -0800
Message-ID: <161239575441.76967.11776777354164899550@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Xu Wang (2021-01-29 01:44:16)
> fix semicolon.cocci warnings:
> drivers/gpu/drm/msm/dp/dp_ctrl.c:1161:2-3: Unneeded semicolon
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
