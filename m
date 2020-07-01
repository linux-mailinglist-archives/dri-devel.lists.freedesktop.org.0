Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F19D210E8B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 17:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BAB6E91A;
	Wed,  1 Jul 2020 15:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B846E91A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 15:08:55 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e18so11856466pgn.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r//RURoO3TnB3wTz8mwe3gfHxqmQYWwVK9iwzBO1A80=;
 b=UO8tTv46sKsUUVWPDwHcDgy4ubT579oFxF+ACPnaKkPTqHrHqlrIIsdao1sYMGriZ2
 IyR0/1tFThmpImSrIF0wLRAHLfL0ADbk5GXoyYXl5tml6omd9DrB6qbEBmOvltPHmqlV
 OrcuwgBj3IcMBg2pIX/SCjhXT7cklFQpHIV2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r//RURoO3TnB3wTz8mwe3gfHxqmQYWwVK9iwzBO1A80=;
 b=Foe/BCyQoAdrCVIxSZqUHnR+UQV5Zeba2wXvv7+hIVwzyUtejgY/AfA+9YTMwAfizS
 fZLliocK0pGDk1t1tbrTMDzU4t/n80B/1dYs8nWcQq++6S9gWUI5ZPMmmc+EpZfKPcXA
 QR39TIqoKCE6WIfWArF5eayFQVUEPuRY3zXQP8dVtru8IVkTSayskLi5rOEVi5vLZVN3
 SWDpU+CZmVjpn6Lv7qdtgCMIKuPA5nuI1ZPAgcTW6o6QPRRrzXky1jbXXdsCfzjU/pXK
 Abi5w11wjx/Hv4X7IBczFHDE8L0jAW2ZWEVS/yFHzc5KF4a3rTH+UO4GRvgJOGXvcs3H
 dM1w==
X-Gm-Message-State: AOAM533Ibpdt4zBxdrxtwMAJJJlQkOAwEVzHp57VAWBBvly6vaPR42cc
 NAdYIjh9lluVsNHm/9r0iJVttQ==
X-Google-Smtp-Source: ABdhPJyUHWfSn4p4nAusnO2St4+eWaSv2zhKgithl7JoGjHXORjuhCmtCWuk9nCPfc66aRvEn++/ww==
X-Received: by 2002:a63:7c51:: with SMTP id l17mr20058757pgn.303.1593616135540; 
 Wed, 01 Jul 2020 08:08:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id g12sm5965952pfb.190.2020.07.01.08.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 08:08:55 -0700 (PDT)
Date: Wed, 1 Jul 2020 08:08:54 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 4/4] arm64: dts: sc7180: Add DSI and MDP OPP tables and
 power-domains
Message-ID: <20200701150854.GN39073@google.com>
References: <1593518176-24450-1-git-send-email-rnayak@codeaurora.org>
 <1593518176-24450-5-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593518176-24450-5-git-send-email-rnayak@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 05:26:16PM +0530, Rajendra Nayak wrote:
> Add the OPP tables for DSI and MDP based on the perf state/clk
> requirements, and add the power-domains property to specify the
> scalable power domain.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
