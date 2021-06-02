Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DBB399412
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 21:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82446EE53;
	Wed,  2 Jun 2021 19:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C3D6EE53
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 19:55:46 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id d12so2753911qtq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 12:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t8u4p0mRfsdYCtJTM/K9Y8fUxpv3fGAAMx8yDE7edtM=;
 b=HsQThjsbdcgxS4Sauu7xku8z2h1uwLF/YPWdO1UOAI9HZDGPb7fUQoXB6idd3xfv18
 i7HuJMXCBFL7mA3gPVv3GVJiOuGtYyNhWodZ+KsqW9K8AdbJyCAZnDN9DdTx5pYLelTj
 RF1p+HGUT84HhloeqrFD8xLpnmqkQsw1qdNrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8u4p0mRfsdYCtJTM/K9Y8fUxpv3fGAAMx8yDE7edtM=;
 b=UG6985iTREa+hiZzxTxhhCO3vs/azvqCmWDJzkXfT/YEH/57OSYttzQetS+wydCQHO
 7Y2QhmY6j8gaac2map5pUlJZ1llVKq/cxwcnsaBWPGNqAhEzR6F7afdEI/ZzMk2NiIYX
 C03WwOF4H/D9vjGuftWu9Revfj4DMWIX3YXqcdTdf58ajjyncy5T5SOSW3Yda+019kHM
 0DIGVPrtkk6eDl0ua3poGSD3Eem3amh6boOyQciNdIlCGaBvgzL1iWnAMDMDwOcNHW7d
 DIQ1P40Mt15LD8pN0bbbykw4FnpgG6yDT0qEbykaj45G1M6uCfUQCu+YGfkQy2rPJjF9
 XIjQ==
X-Gm-Message-State: AOAM533yUzthi1pp4mGXTve3Is8WRkQBm0L6xhvcTe4ryxvDOEPzBx60
 nYj8LpXSlET1Eef1YJ0DrbFBQco8/NJyFg==
X-Google-Smtp-Source: ABdhPJymHpIxhqLFkicwgx0YYNOWn8ewO0UVih1vzgwKhbslxnvm4bcXQX//UPWve/Q5gDBDSvVs0A==
X-Received: by 2002:a05:622a:1185:: with SMTP id
 m5mr25955106qtk.140.1622663741864; 
 Wed, 02 Jun 2021 12:55:41 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172])
 by smtp.gmail.com with ESMTPSA id f8sm525091qko.131.2021.06.02.12.55.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 12:55:40 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id z38so5514359ybh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 12:55:40 -0700 (PDT)
X-Received: by 2002:a25:ab4b:: with SMTP id u69mr11929577ybi.276.1622663740165; 
 Wed, 02 Jun 2021 12:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
 <20210602181621.GB3692772@robh.at.kernel.org>
In-Reply-To: <20210602181621.GB3692772@robh.at.kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Jun 2021 12:55:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyXfi-v6zO_v3YDN71OrXsOVkf1W5h5gV4zwJ4_fBzQA@mail.gmail.com>
Message-ID: <CAD=FV=WyXfi-v6zO_v3YDN71OrXsOVkf1W5h5gV4zwJ4_fBzQA@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] dt-bindings: drm/aux-bus: Add an example
To: Rob Herring <robh@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 2, 2021 at 11:16 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 24, 2021 at 05:01:52PM -0700, Douglas Anderson wrote:
> > Now that we have an eDP controller that lists aux-bus, we can safely
> > add an example to the aux-bus bindings.
> >
> > NOTE: this example is just a copy of the one in the 'ti-sn65dsi86'
> > one. It feels useful to have the example in both places simply because
> > it's important to document the interaction between the two bindings in
> > both places.
>
> Don't forget the 3rd copy that exists in some .dts file most likely.
> That's 3 places to fix when we improve or add some schema.
>
> I've generally been trying to de-duplicate examples...

I'm interpreting your response as: please drop ${SUBJECT} patch from
the series and leave the 'dp-aux-bus.yaml' without any example. The
existing example in the bridge chip is sufficient.

-Doug
