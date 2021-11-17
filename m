Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC875454112
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 07:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E2E89B68;
	Wed, 17 Nov 2021 06:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3C989B3B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:43:28 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso2912802otj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 22:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=//I1TVp7dTuZFMgwOKyJoAu2cQfvXhC1d7f5K65wAYg=;
 b=W4+dGHWHFret9QtsEmcwlFjLqGEyyi9t7/oCkJZ/TwkTYuYEa/jV1aBJZC87aZFH+Z
 ZcwfLRewlOAYtKlQcrcRTwVVUovIj8uV2Ks+n5lVYIbDuJKeK22Y7wufVsX+8XFaMG9j
 x8SAYO9b7shYj3pUqD4qzMX1wOtDq01iBWKQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=//I1TVp7dTuZFMgwOKyJoAu2cQfvXhC1d7f5K65wAYg=;
 b=MlECniJg4a0SwfUQvCEVXc7RC4bWNg1NtysVVeli7AJeysMFHx531nxPDy+Vh42svO
 EOKE6uHdv31Sz1WjuZ1/YyWSUUc5pu1CNhyCAjnzWOB0JNmC692/eZvDWN0tEv5rdlx8
 ECGoLzQVWgmX78g49QMsPAmD7aVkGQwYm00mHLA4c4tbQPe2lZfxuYdh6jvZTYUaVZHV
 JhoXfyT1FW9yF1JuTJLHFtHM/oz58BvQeXxgKbfvoR6Elw+RUBAkZ7J6CKpSysIpOxb3
 5GI+HBlXIchpvovP6wCHNATWlv5CVrV2vFOEqyjjmA9pVdopScC0Dvppzq4pxG0C58AB
 ldQQ==
X-Gm-Message-State: AOAM530re4LXDhJVFehGtxSvAOmA/Nuq+YN9SX03F+yIODYJOWx0N9sV
 ZyBJys+eK0YI8NBltvxFGU+xxFRQnTtCy5ITewGTgg==
X-Google-Smtp-Source: ABdhPJwsKo1fEanM9NX3oCL5hyNK8f/aAd2sJcSS0+gxRvzjdO1BOo0snB/j/kUcnxhMJsS/ejuxg0vZQzHnPyroIEs=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr11596628otl.126.1637131408127; 
 Tue, 16 Nov 2021 22:43:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:43:27 -0800
MIME-Version: 1.0
In-Reply-To: <1637046458-20607-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
 <1637046458-20607-2-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 16 Nov 2021 22:43:27 -0800
Message-ID: <CAE-0n50cjm3O+i12Jxvfe6DdVDVG3cRrmz0ej6bMCKAeL0zHCA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: phy: Add eDP PHY compatible for sc7280
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, seanpaul@chromium.org, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-11-15 23:07:36)
> Add compatible string for the supported eDP PHY on sc7280 platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
