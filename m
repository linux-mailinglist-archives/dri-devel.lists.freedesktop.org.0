Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2398E349E7E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 02:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED81D6EE9A;
	Fri, 26 Mar 2021 01:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A516EE97
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 01:17:48 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id v8so111898plz.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 18:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=MXU0W4hXQSn5cT7nm9jJj1Hb0+VGd0Zn55IsoZ/3xBk=;
 b=ExHK77K4VDDdqJH5CuFON7d7VeJ6QZbD6RH8skpBGIrkJjX9bY2zXQ6ZIFA9k2iXcT
 IdF3zJ0D9RFCU2+qYJBYJpSNK2wIZ0cLm/0XUr43gRoroudO+4DLsCuNR0OvM/AdLBiK
 68KfdHjYt/Qwr3Iw0gWJGQhVghgZKnTC7s7oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=MXU0W4hXQSn5cT7nm9jJj1Hb0+VGd0Zn55IsoZ/3xBk=;
 b=omc53QeqFyTG1lfe4GBGjSMTXgXi442cguP/KoE3tSUur7mFlqYUa4Uu5DpapzkMVK
 tb/srly4/PtCPZwH7nCg2WOwxpZgr8HHJwMSIZCSRoZgRBz47WgR3h67Tw3MF+9PGOzo
 ATGLfao6K+Nh4v5/1NjpqTzr0VDkZYFtnCbSEHHD5UQ2cG4XbdDblVAwnOTW2gyVElT9
 0apOMpcc9hmhGIwlcmvLwKApY7Fkc96xkEX+TplGIVsHFkDWWXj9vIeePaqan2Pzy0+v
 qya3IEivMwtBj7b809oAlfLPqzmG7qQ3lugta3xKbEBGElnqa0g5BjQxet0bef0C1aM+
 fCdA==
X-Gm-Message-State: AOAM532AEAxSz0q03BfDgMqlxV+krcZzeGtsH29Ffma+0HGGnzBv8XDJ
 LsZegn3tgLvz2jfSf7CAXzD9Vw==
X-Google-Smtp-Source: ABdhPJxVdMESi38YKv6tWdoN04fZg2j9Ch/YSvv1lfeNHE28AamjYJomTaTYGm57PsOUU1cZ1UNVLg==
X-Received: by 2002:a17:90a:bb91:: with SMTP id
 v17mr11019736pjr.24.1616721468438; 
 Thu, 25 Mar 2021 18:17:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
 by smtp.gmail.com with ESMTPSA id x7sm7453681pfp.23.2021.03.25.18.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:17:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1614971839-2686-2-git-send-email-abhinavk@codeaurora.org>
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
 <1614971839-2686-2-git-send-email-abhinavk@codeaurora.org>
Subject: Re: [PATCH 2/3] drm/msm/dp: Fix incorrect NULL check kbot warnings in
 DP driver
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Thu, 25 Mar 2021 18:17:46 -0700
Message-ID: <161672146644.3012082.15695024069473643069@swboyd.mtv.corp.google.com>
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

Quoting Abhinav Kumar (2021-03-05 11:17:18)
> Fix an incorrect NULL check reported by kbot in the MSM DP driver
> 
> smatch warnings:
> drivers/gpu/drm/msm/dp/dp_hpd.c:37 dp_hpd_connect()
> error: we previously assumed 'hpd_priv->dp_cb' could be null
> (see line 37)
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
