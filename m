Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD08F349E7C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 02:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9A06EE99;
	Fri, 26 Mar 2021 01:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC586EE97
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 01:17:30 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so3450558pjq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 18:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=J8nMLjAEeKpV02aUXHe43+I2wZF8cyZVnRX+KUOYqss=;
 b=cQhkxLDX3nfXrkWTIxByCJ4xpoDKyM+27Txt7k5RBYAWHPGDhWWVlsBwOwNencRKz/
 Q2i6Cln6j2qCOHTzvLLP0Kc6mdXJfSQNrNG3hV2Lv69JaILutM8Gp5OboWcWt3j8Yc92
 ftttjrTuBnhcKtjGGvJeQrGhq8aXAM9g+IWXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=J8nMLjAEeKpV02aUXHe43+I2wZF8cyZVnRX+KUOYqss=;
 b=hc+ZevHfyTZBuSn2pCeLfYRaYb4akB6ZUQDvD9WbusnFX5SUK6iQY0E7kmaq1O2Hns
 gdFkTN0mEm9o7xwPuM/jWeecpkV7PzoiMraI7L39P7KI2pZs5FE2lvGEOYSiUnoVGxpb
 8IAhU1pA6e1vE3J1dIKH3jM2ID8wyO9aHGCAB8licK+JwLogPtwZraccH488M/aYJGUV
 sck7/6Y80vOWwkeGYIgnJLoaRypwvffBxKvpOFK5AdlUF464yTuSgh3s/qSwr6Ecd/Iu
 +DgBbmik/D5nzTunAY9t2MFwfWkJd8WwrN2lL6ZjzCN4uFMglyBrfEDXuU9c/RMS7aiZ
 PILg==
X-Gm-Message-State: AOAM530FvgK0fA7DfwZwUhhTySmRR/05EpD+lLKCEs2bUx8UwJ84rPH0
 KhuVrNm6+pheaSnhm1hBOCWQiQ==
X-Google-Smtp-Source: ABdhPJw7n1WJkB8t3PJN5A8OrPXJszf8d70/YXB8F0M2+OC2bcrP01DdXIMGtmX33dBgo78OsqXA9g==
X-Received: by 2002:a17:90a:c249:: with SMTP id
 d9mr11398591pjx.104.1616721450015; 
 Thu, 25 Mar 2021 18:17:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
 by smtp.gmail.com with ESMTPSA id u17sm6642910pgl.80.2021.03.25.18.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:17:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
Subject: Re: [PATCH 1/3] drm/msm/dp: Fix indentation kbot warnings in DP driver
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Thu, 25 Mar 2021 18:17:27 -0700
Message-ID: <161672144775.3012082.15468817158271994036@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 khsieh@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2021-03-05 11:17:17)
> Fix a couple of indentation warnings reported by
> kbot across MSM DP driver:
> 
> New smatch warnings:
> drivers/gpu/drm/msm/dp/dp_debug.c:229 dp_test_data_show()
> warn: inconsistent indenting
> 
> drivers/gpu/drm/msm/dp/dp_power.c:203 dp_power_clk_enable()
> warn: inconsistent indenting
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
