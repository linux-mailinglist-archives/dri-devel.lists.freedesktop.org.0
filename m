Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C22331EEA7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 19:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90B989FAC;
	Thu, 18 Feb 2021 18:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1495789F41
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 18:47:13 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id gb24so1871992pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 10:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=hwGMhFSpUZ+8IXq8QZ1Gz3vsECNheP1SgnkaWXhUlaI=;
 b=Kg+PGRM3gO7wDPL6kZftJKUY6fnhghWTbGzTjonou2e29fwKEEp4tLMknMlps5QGVK
 Ayl7L0eGjQ+wvpr+dILJrNVED75qRl3QnWmwdg9FB1ZOGJDMejCfWHwrxnNip6AxOZxg
 6WqLPlXDR2vCxTVPYkOpgpxL4OgTM/Cm55CTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=hwGMhFSpUZ+8IXq8QZ1Gz3vsECNheP1SgnkaWXhUlaI=;
 b=NJFWEeBlLaYwBMh/HrHkgbSP1G4j9r2zX1n8hFkzeIr3jK4XgcYVKGZXHv0PJwRT0E
 4U8qRhSMgDtH8iyV+H1E0gqtQE3ypmyaOTkgm2LpcZupmBP/8MwwTlz4QKgZSwHcGXqV
 B8/VxcKi65ZONbieUm7XqbDM60pX8+WhkC4LbP7/0Ysemd/uxcTtHfQfpz7DREvu+NxM
 8YNTD3heGSEocSkiQGjovV4XatjW5juRUs+i321sE7hXz67dhmIoktVhlBJKtL2/pwUQ
 /L3Nh74nLgI1jTHQ1sSJSE4VGMTyAXNnbIzzpDqH1oKl9vgQkkXg/i8u4rN52C5ietBu
 iXNQ==
X-Gm-Message-State: AOAM533oHzFuP8vhGsUHcesfCOs3d+dweIy+S+/CtlFtfksVpb/OCEP4
 rf0CA0L0MrxXvp4zXV4gv0Z6dQ==
X-Google-Smtp-Source: ABdhPJzXASW7UW1qP+wySWhkiDv0DfzSYH/2XlmgQazxzKYmSoEl0w/SmWQge0xYnKEw7PYvWKuZVg==
X-Received: by 2002:a17:90a:b292:: with SMTP id
 c18mr5216701pjr.134.1613674032774; 
 Thu, 18 Feb 2021 10:47:12 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:ec84:ed2b:a796:b756])
 by smtp.gmail.com with ESMTPSA id 8sm6379722pjl.55.2021.02.18.10.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 10:47:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
References: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 2/2] drm/msm/dp: Drop limit link rate at HBR2
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Thu, 18 Feb 2021 10:47:11 -0800
Message-ID: <161367403102.1254594.2276430831177324166@swboyd.mtv.corp.google.com>
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

Should also say

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
