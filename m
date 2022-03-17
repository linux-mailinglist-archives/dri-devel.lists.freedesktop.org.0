Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDDE4DD032
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 22:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DA510E7D6;
	Thu, 17 Mar 2022 21:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327C910E112
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 21:28:49 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so4372507otl.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Wxg6FN4fidpdw1pUe2v+Gv21R1xMKjCVI2Ma6qmxE+s=;
 b=YI0XmL/YEuCwf0gr7y2Jn0qOvFsTIVkrGn7O2oXnejI1FzWaaAXICnzW6eT0NGBp0/
 t5S3QB5hQ5GCTqzWxSIARnPm/lnGHIa5r+7HF8e9E/1MY22QKIGbjLDP0pZWa/36heFc
 PB3PqmNMOxM64rqIgvtk5bgg6An62is7W7S3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Wxg6FN4fidpdw1pUe2v+Gv21R1xMKjCVI2Ma6qmxE+s=;
 b=Z0jIVrnXdOZ6S0cRvhWCmFk7x0lLFXFgHWLU/XRM95lu5IHxo3qbj352coEivG6gJj
 TE9rOkjaeWj9nbu8/uAKK6Tv5gzwyi9xOO2bH5/ir8xhgCGic9rvHF5Warr2qqfBBdvq
 LXY754G/e8xFzCbX2SDV8Fykrwfvy+cV3HcYVUN3TVu/6UqRVHtW09zdcH7GyEwBH1WX
 LWg0BPG6skY7MJYuHgl2fLKkohibYdbKZv/2T1wSjxM5gXMSqUjh/mBysTZaqb7KufGq
 EryCNpOrvxP2t4ejOqFqNReZln5Wl3V3HBKlk5pHiJY7rlC7QGhQZyBSe36TwDzfKYbL
 RZBQ==
X-Gm-Message-State: AOAM533wJV5vmh3k+GRzkfTl0+ZXR4jtW2Bh7ueF3oHCOzaKAG2Q9Tlx
 dLRLtoxbtPfAXqJ5KLa6fHK1Vk0wnaxcqure4j+ihw==
X-Google-Smtp-Source: ABdhPJzfKwOyCQB89/1kypJLAVwmpsZBjI2HMBT6fk9/KnCBqKd71dAxcwXBdFRDHPmVXDNHWkl2g1s53kSR7dGQ/iM=
X-Received: by 2002:a9d:5a01:0:b0:5b2:5b6c:232b with SMTP id
 v1-20020a9d5a01000000b005b25b6c232bmr2272582oth.159.1647552528145; Thu, 17
 Mar 2022 14:28:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:28:47 -0400
MIME-Version: 1.0
In-Reply-To: <1647452154-16361-5-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-5-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Mar 2022 17:28:47 -0400
Message-ID: <CAE-0n51YMT76PTkfMV0dZ2d7e3mbObPvTo+AyuaTn4j0R3OwUw@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] drm/panel-edp: add LQ140M1JW46 edp panel entry
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 robh+dt@kernel.org, quic_khsieh@quicinc.com, agross@kernel.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, thierry.reding@gmail.com,
 krzk+dt@kernel.org, bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-03-16 10:35:49)
> Add panel identification entry for the sharp LQ140M1JW46 eDP panel
> with power sequencing delay information.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
