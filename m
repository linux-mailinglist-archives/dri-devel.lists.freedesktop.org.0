Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163781516C3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35CF6EDDE;
	Tue,  4 Feb 2020 08:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B80E6E431
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 20:32:56 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q8so8145153pfh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 12:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:from:to:subject:cc:user-agent:date;
 bh=cZVOQPzRauAIXrx2DHSAhNTQEM7p146g+MumciHO/jk=;
 b=iFNn11J47AdMwBbDn4XXUTKPj+dhk6monov0dMi9b/hlWuI+g8yYn3J5j92biCTPa2
 AC0mtcVc/K059lQy5yIcBtvwCD1intDx2U8PTBbTTrWEbsS5GXr7AyJpGUYonuLUFQ8A
 RSqiPHdQghgzuJD1923MCF9rxM3AMYzfrogOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
 :user-agent:date;
 bh=cZVOQPzRauAIXrx2DHSAhNTQEM7p146g+MumciHO/jk=;
 b=QXrOE7qFsAc9E7NLnoXmQnBYGlqLdyuH3mw6EgFKCrohpZSPR/Fw+2CN2fi5xEnRtd
 Sqi6HDWxYeO09zR6RGM2KMRYWvK8Nlgza7aqfxmqUub9S0TOavhVGV/+jJqVdIYtheHi
 1Uj0rr3oNh+LcsQUu1kUtB/il3vSwpC6XjKbfo0L0j7PeJanh75HVFWt9bnpjfzx6rwq
 4yrJOQW6+Jnb7ZonHX5DqQejhiny9l3omaGynuvdadFY+PfMEWgBbryOnzDKv7Edfslz
 svjzAuovIP/GGzABJhHFUiXnlbZIeLW9t95n1Ca3y10bOvKY+7dzrQ3Hw+m91sHqLVbc
 JujA==
X-Gm-Message-State: APjAAAWavUDZW0zrdX5W9rFjRPq/39CJ3DLO/fmC4GRf26UNr3Q/Ttq9
 PxepgTkW8aQe2lg5yVaA61IuBg==
X-Google-Smtp-Source: APXvYqw3Dt6FatPcHevWvl6417lDVwr9Hhkc8+lkqq4H/ei6Dgfgjv156vLllcBrCe730kTnkd8arA==
X-Received: by 2002:a63:214e:: with SMTP id s14mr26679454pgm.428.1580761976230; 
 Mon, 03 Feb 2020 12:32:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id g8sm21252615pfh.43.2020.02.03.12.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 12:32:55 -0800 (PST)
Message-ID: <5e388377.1c69fb81.e9add.a3d4@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <90542e32913e315bae02865e1d18a622@codeaurora.org>
References: <1580168406-23808-1-git-send-email-abhinavk@codeaurora.org>
 <90542e32913e315bae02865e1d18a622@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: abhinavk@codeaurora.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: Parse Colorimetry data block from EDID
User-Agent: alot/0.8.1
Date: Mon, 03 Feb 2020 12:32:54 -0800
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
Cc: adelva@google.com, linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org,
 seanpaul@chromium.org, Uma Shankar <uma.shankar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting abhinavk@codeaurora.org (2020-01-31 13:01:38)
> Hi Steven
> 
> Any further comments on this change?
> 

No. I was more of a drive by review comment on the previous patch.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
