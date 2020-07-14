Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A0E21E4FC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 03:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D666E85E;
	Tue, 14 Jul 2020 01:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71646E85E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 01:12:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id j19so6823214pgm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 18:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5yjaTy96iRFPTsi26P18yq64D5S2151Zztu56aP2UQk=;
 b=DKREwuM1AdDK/M5PRjMceNQQ5PSr4Xfy3P/tz5j9KLqG7xpQvwFBtF6iqOKNiHJeHz
 0LtGhspN0cAeU/1/I6hlmRFzPP+PakMNDDWkk+6neyLAw6VjOq3PKxLlGjVYFwnl71jY
 CvuZix9jHtiIZKtZpVPiMHxs6yo596oGk6UAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5yjaTy96iRFPTsi26P18yq64D5S2151Zztu56aP2UQk=;
 b=nzmLbe4Surj1nXni82fTEdXt9KB1VMADaXx3HNjdbBYagRvwvW+Y4BT8aPAymS0AYF
 n9TzQWvGpbyYaFL+TQuv8ReBGJfUy3FbuAEmQdZ/I3+YbgF2nFQS3+TEqD9GafS/jtPC
 b8jKKBnZQB+gz596xD+rYxkgJ/XkHZLNjmUTSeyW61Q722Mici/ksR9V/5si6Y/h/3c5
 aqCpdjvWWNXaVHVPD1FqJtI8bFJ8spcFgUamwV8HS/k93g9RefWSJncy+WVR9S4ZCbjF
 YcOBOxfWaWhcNQB+rjVpOrXCXWf4EMFbF9gBP4NDkNKegAAxy3NS9Kt6Q2uyWUvUFidC
 qMSQ==
X-Gm-Message-State: AOAM530KUJxfwes/Y2r7xd3Xrl/8C+vA67IqLuMh8RYAI3oiZ65U+01E
 ZQiJzy35IKBuqTpnjTshjTpGiQ==
X-Google-Smtp-Source: ABdhPJzURU5w7Tj+O39sbKidAAXjNVHx+XXYlAgKEyC4g8eI7DWw01L8nI4SKvyRTPsf2//G04xEaQ==
X-Received: by 2002:a05:6a00:14ce:: with SMTP id
 w14mr2275557pfu.121.1594689141507; 
 Mon, 13 Jul 2020 18:12:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id e8sm15972489pfl.125.2020.07.13.18.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 18:12:20 -0700 (PDT)
Date: Mon, 13 Jul 2020 18:12:19 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [v1] drm/msm/dpu: add support for clk and bw scaling for display
Message-ID: <20200714011219.GQ3191083@google.com>
References: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, mkrishn@codeaurora.org,
 linux-arm-msm@vger.kernel.org, travitej@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 07:38:41PM +0530, Kalyan Thota wrote:
> This change adds support to scale src clk and bandwidth as
> per composition requirements.
> 
> Interconnect registration for bw has been moved to mdp
> device node from mdss to facilitate the scaling.
> 
> Changes in v1:
>  - Address armv7 compilation issues with the patch (Rob)
> 
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

It seems this is an evolution of this series: https://patchwork.kernel.org/project/linux-arm-msm/list/?series=265351

Are the DT bits of the series still valid? If so please include them in the
series, otherwise please add DT patches to allow folks to test and review,
and get them landed in Bjorn's tree after the driver changes have landed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
