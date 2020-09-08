Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B272627EB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0F56E9E4;
	Wed,  9 Sep 2020 07:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D566D6E062
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 18:57:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id g29so220129pgl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=bZ0hdB3aDnQdw+HPiv6w6/rS4ctBv4+DDy7Q7mzZQJA=;
 b=kQSLq1W11bCof3VZGivNs9jhTs6eQXMNg151pVMeum5ivTvrGyNKTmBC8o3aAVTMCD
 fWHq03en9zOkEUNKYb6mITKGyBNqVTB2ceHUt93ApjVkk5vDvZP7SZyD5G3hpSk3mpff
 TpEU3uBAzAcI94SB+dVKpTJKqYy/8/3vpSWho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=bZ0hdB3aDnQdw+HPiv6w6/rS4ctBv4+DDy7Q7mzZQJA=;
 b=t/wjnFrcAP/1Ryjfbz9MDVns5gDWaZbtqggqEZpJAJ57BsCVdlc9QgrLXZNlsAtosU
 rtN97ARh3KB183eCwRYT22eHRo97FyNjug3/QUhxZ9AStHmcEyopzOOBaeyyCnjf9/B+
 tQcekB19mtQlYmjPTyI2PjcVL5Cpi5TGDc3zfNDob23zQyzrXNsP69klRisGmjlgYWI8
 xDmZpLMA40g2eyLauTsIe2JZ4Jv7cPoz02kAdoRv61nSlGbNUNKefdg5YAcTAyQYAi7d
 FbWJtyRR5cRJq2zNjMulwNN0Qr2wWrmDaTSUxkMtDEezxtAvp8cHosNL0QzVwrKdxQgF
 KdUg==
X-Gm-Message-State: AOAM531CQD9NZ1Qz5Aj6qFIrY1czuECwgWPUDGrJHBgVJK3rBE3saYUC
 1+ZuMIZSQqJPMHPbh7iggz1emA==
X-Google-Smtp-Source: ABdhPJwf6IhPcHFN4xXP49f62bCdnIGRRPklRPb2u3kzC8iwzMNMbimK4omnPZ6atruNND3LgaRG1g==
X-Received: by 2002:a63:b202:: with SMTP id x2mr126839pge.432.1599591441474;
 Tue, 08 Sep 2020 11:57:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id o6sm44291pju.25.2020.09.08.11.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 11:57:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <010101745aaf685e-49eb2897-ee17-40bf-89e8-2adebe8d022f-000000@us-west-2.amazonses.com>
References: <010101745aaf685e-49eb2897-ee17-40bf-89e8-2adebe8d022f-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH v5] drm/msm/dp: Add DP compliance tests on Snapdragon
 Chipsets
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 08 Sep 2020 11:57:19 -0700
Message-ID: <159959143931.454335.4137726843867018185@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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

Quoting Kuogee Hsieh (2020-09-04 12:54:39)
> add event thread to execute events serially from event queue. Also
> timeout mode is supported  which allow an event be deferred to be
> executed at later time. Both link and phy compliant tests had been
> done successfully.
> 
> Changes in v2:
> - Fix potential deadlock by removing redundant connect_mutex
> - Check and enable link clock during modeset
> - Drop unused code and fix function prototypes.
> - set sink power to normal operation state (D0) before DPCD read
> 
> Changes in v3:
> - push idle pattern at main link before timing generator off
> - add timeout handles for both connect and disconnect
> 
> Changes in v4:
> - add ST_SUSPEND_PENDING to handles suspend/modeset test operations
> - clear dp phy aux interrupt status when ERR_DPPHY_AUX error
> - send segment addr during edid read
> - clear bpp depth before MISC register write
> 
> Changes in v5:
> - add ST_SUSPENDED to fix crash at resume
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> This patch depends-on following series:
> https://lore.kernel.org/dri-devel/20200818051137.21478-1-tanmay@codeaurora.org/

Can this be based on v12 of the patch series? v4 of this patch was based
on v12, but this has regressed and gone back to v11.

v12 is https://lkml.kernel.org/lkml/20200827211658.27479-1-tanmay@codeaurora.org/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
