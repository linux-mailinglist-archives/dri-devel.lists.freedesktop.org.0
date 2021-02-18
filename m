Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779C631EEA5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 19:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6366EA54;
	Thu, 18 Feb 2021 18:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4426EA55
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 18:46:46 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id lw17so3237656pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 10:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=TYSvMCIPacqOphOa16rzA+X+0GuBxuIS4Qj5ygoV2IM=;
 b=aWV5hnEy8rnECOEGtDuAcE+s4yLDrZzLFVj+vn97GLn50xSeuxHfgdHF7Yz6jpcksB
 CYfZpw1Zh4nmKvytWq2vjdYlJZlmbDpatiO45blzVexSo6J8CdGpJ/r3/Jfht+NfQhSW
 LOtBc1iiEAii0nADT1I0ZZyiE9uk7n6kjhupE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=TYSvMCIPacqOphOa16rzA+X+0GuBxuIS4Qj5ygoV2IM=;
 b=P7OIPRrSJKgDpwZg+zfdeV6G41loGu9rWm3qRH0l48bk6f1R0MLfO1ovBC2NmsiN02
 45+wqn8apTpY41Hn3282VjcpL5l3nyVW3gKxokuHF46SKtLUmK2wRkASGQVubP4TYpSr
 WSr4kiFVWni8lPgDH/Yjy2haQl7CpWz3MupjGejR9AlguVA3JukZsQ0DPZlpL4/FMWIl
 6Or0suz4QQB8SfhejKbAchIaexyTw75i193WUwwBIuX15qby9igKATA3N6Q800fCai7c
 WDilQRxOmAGQDnsUEdc0WGECmIPHNAmcQCYQO82zu+8Lfuu10Sk81dJyiy1lJBCzc7WQ
 E7wg==
X-Gm-Message-State: AOAM530zc4J6nCVhCuM+sKrXkVF6l7BCWRudAgaXDDce1xE+XfXRoNUf
 VwqioMxhh+c9RlFDQbKOZf7nYQ==
X-Google-Smtp-Source: ABdhPJxCmb8Y1Km73TqeTEgYOkLH188D40vElREuf0w7ub9wbnNw7oCNpoGFosfaLftBUBdQlyWCeg==
X-Received: by 2002:a17:902:aa03:b029:e3:721:c093 with SMTP id
 be3-20020a170902aa03b02900e30721c093mr5267903plb.50.1613674006193; 
 Thu, 18 Feb 2021 10:46:46 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:ec84:ed2b:a796:b756])
 by smtp.gmail.com with ESMTPSA id 25sm7127704pfh.199.2021.02.18.10.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 10:46:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
References: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 2/2] drm/msm/dp: Drop limit link rate at HBR2
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Thu, 18 Feb 2021 10:46:44 -0800
Message-ID: <161367400432.1254594.2213007173465217655@swboyd.mtv.corp.google.com>
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-02-17 15:09:57)
> Drop limit link rate at HBR2 to support link rate
> upto HBR3.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
