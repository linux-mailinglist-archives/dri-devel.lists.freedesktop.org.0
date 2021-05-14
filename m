Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A995A380450
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 09:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7106EE30;
	Fri, 14 May 2021 07:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64496E17F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 02:44:09 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso839332pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 19:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u1+1zBYB4dMhhgTw7UE0zJNj5s29Axql6Hdjn9huxZ8=;
 b=t4zrB+icO6Z/YdbsBN4rsvDAlYRPI7DdH+6cdF58Wu6KpfaFzf5ucAhQNrFzkGLLT/
 PUAVoG+/hnFcWmoJIqOhM6vKAOJj/kYGZeKrvNqJHfFv1VjzReTPlEaHRKebsLO0xKoS
 drRmwm/sbruySUCqVQO0lG3p28FbiOpF9RY0P1WiWJR4rm14cYI/JYmNQMOOYx5JbVPC
 CITkVnHVLsadIDoqrvoD0hXYeLxF0NpiH/zOa593NK2EWshjyB4mfQv+FwHkebLCAyg6
 emIx8s5I3r1uoROi7cdtSjLJMDT+vvMBniHrFOXDWbdUDrCF46eI94PmrdlZJVXGaKb0
 Gf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u1+1zBYB4dMhhgTw7UE0zJNj5s29Axql6Hdjn9huxZ8=;
 b=Ll/diwCetIZNALqjAxniSK0ugvphtSL1LRP+vMKrYszLhK4TRg+/OTrkUShlsYNKzs
 zpHntzc9pNmcAGoNESzHJ2zd9gbSIpj5tWs642OggJLVh52Qu1lOW+AZSsEZ7ekCX9N3
 1O1nABEMERYkNTeKp5L9O7MhcgN5r1+g2e7Cn6OtJjpVJa/bGE8vhBHs2vRQloRyPR3y
 NKB07qpcVLzdjOYwumMI75Nh3uHDd/2dZF7S4xltCcZA5PmgglgpG1P0zRkWcOJEwHgW
 2GK75fWMef/YP/5li8hDKXaqfhDs9Ay5LTqtJUQtgnTdQuiRVnBC9eamIu8/dy2SrWlt
 xR4A==
X-Gm-Message-State: AOAM530rBXlBXpxsgGS3L5Q5pzPkXtP+t+4C4RsUUXIzGQK+I2TFrNc/
 sEy8mShEv05Sv1zP4yxQc7E=
X-Google-Smtp-Source: ABdhPJxjAhiPPqYMlC6IrU45AbRm2lxxF8dtiX8KBea3Q4nlbvdKv82nK1titEvLUA5Zl7gz+ekcUg==
X-Received: by 2002:a17:902:8ecc:b029:ef:6471:dc08 with SMTP id
 x12-20020a1709028eccb02900ef6471dc08mr15634544plo.5.1620960249367; 
 Thu, 13 May 2021 19:44:09 -0700 (PDT)
Received: from yguoaz-VirtualBox.hz.ali.com ([106.11.30.42])
 by smtp.googlemail.com with ESMTPSA id ca6sm8117647pjb.48.2021.05.13.19.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 19:44:09 -0700 (PDT)
From: Yiyuan GUO <yguoaz@gmail.com>
X-Google-Original-From: Yiyuan GUO <yguoaz@cse.ust.hk>
To: gregkh@linuxfoundation.org
Subject: Re: Re: [PATCH] agp: check if ndevs is zero before enabling node
Date: Fri, 14 May 2021 10:43:17 +0800
Message-Id: <20210514024317.63649-1-yguoaz@cse.ust.hk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YJ00C/Kdhe3bSrtH@kroah.com>
References: <YJ00C/Kdhe3bSrtH@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 May 2021 07:32:49 +0000
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
Cc: airlied@linux.ie, yguoaz@cse.ust.hk, yguoaz@gmail.com,
 keescook@chromium.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yiyuan GUO <yguoaz@gmail.com>

I guess it may only happen in theory, but maybe there is no harm in 
adding a simple check?

Thanks.
