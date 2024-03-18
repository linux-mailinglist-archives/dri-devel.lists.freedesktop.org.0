Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D3287F069
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 20:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D4410FE0A;
	Mon, 18 Mar 2024 19:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VabCl7Ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E04B10FE08
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 19:26:30 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d29aad15a5so58568591fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 12:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710789988; x=1711394788;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=xvwBqy02Lt//XY7TKf5p6Szodv2siVQMtlWkmKgSadE=;
 b=VabCl7IbsKnw8R1sT5EpIepwRphz8Vo6CqtGwXOtSdFcaBkfglMclbzg2oAZqp6O5A
 3oo39f+CI2GNqTExetKDd6buVuhxnF2UcwdEl+viP4Mr/X12Mr8gdCHAvZgxU99bY535
 R3swwGI0VCYBhCtQXAck2pGciP+zgQePkOC4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710789988; x=1711394788;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvwBqy02Lt//XY7TKf5p6Szodv2siVQMtlWkmKgSadE=;
 b=jgpxSUtj/cu2U3NPZ180g0MPHIA2YwzWl07knsekkBg3MOQDoKv3shlUNNYqDwZhTD
 iTtHfwuxlwpWWj/yuzzZUsBBYpaX2k83nw5xmdHci5c3ejw/y/Nshd9rgI9Q+2/peak1
 uJm72zdIM3nRhbIuqvy0SR6msFiokBJsbOJAyc6ky36KEjcBd2/vlUDbPXHnlFCco0MK
 ZGXahHURxKWMPmUVYhocaSpwaN2cRangx+sIqfEUZ4ntpb6cLwGNUeWnvb/dOQ1lAGn7
 iL5hSlC4T369ECWhL0Ej2S7U8G/wkK8S7lnDSmE+Md6s1+ASL9wIz3+VjLYRu2J+eiI1
 3rog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO/K94tUvBsX5m1mxq5TVCa6vwuNODdJVmxXTikqm9D+Y+a6tJbnCP/8CkrUSIdE8hPqySwTlftv3QC64KCROY5JbPcWktURmb540aavqR
X-Gm-Message-State: AOJu0YzRdgsjICR6o4F+D+OH90GGQFriVAfGNqd8qRYa1s+5aTnHngCP
 /ni0oaDC70LI9d8MPD3ASiqjWMP7csVB/K9xqRiQ3kQtJjmPm0gddjH0oE1iI1ShjTryEBVXgRc
 u/SAWDBWho2hzYLeUm9vkRdZFF89gEIQXGI1d
X-Google-Smtp-Source: AGHT+IFe4SIqBk2a4Gcqz06qiXmOLolMnAnmlf22UjLfTc3cWz8vho8vUCaBS8BcelwlfYICaPBpPRtqxlh+N67N26o=
X-Received: by 2002:a2e:7c19:0:b0:2d4:b061:d9f8 with SMTP id
 x25-20020a2e7c19000000b002d4b061d9f8mr1711566ljc.39.1710789988109; Mon, 18
 Mar 2024 12:26:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Mar 2024 12:26:27 -0700
MIME-Version: 1.0
In-Reply-To: <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Mar 2024 12:26:27 -0700
Message-ID: <CAE-0n51baqN8cEubSqDegqDwL7O6=iEfN5Ho2OykqjmkjQDcvQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Fix typo in static function (ststus =>
 status)
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2024-03-15 14:36:32)
> This is a no-op change to just fix a typo in the name of a static function.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - ("Fix typo in static function (ststus => status)") new for v2.

This was sent at
https://lore.kernel.org/r/20240306193515.455388-1-quic_abhinavk@quicinc.com
