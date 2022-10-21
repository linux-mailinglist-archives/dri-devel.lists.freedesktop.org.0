Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC66079AE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 16:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E1A10E328;
	Fri, 21 Oct 2022 14:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951F110E328
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 14:35:37 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w8so4300943edc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 07:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cD7mqBkh5qwfVTvi95wXIFTJK3itHGA52frEt6EKQdE=;
 b=TAUhFVPuOmb+DlZVZ8ohiV0s+oEoLMyPa0PBQM4UUppI4TJRvnNHUVrR++1mnpHJsO
 bxWyvsLaaSNBlXMQdsBm7Enjc9CYJW1rEURQda/VxZicmXxez6isIJfK+2QmTS8CrFM0
 OMSl9f5xvWS8YBhDjRhBIcxoXNQckGAR+epT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cD7mqBkh5qwfVTvi95wXIFTJK3itHGA52frEt6EKQdE=;
 b=pZK5n1SH9B1tpkIPLX6saX+Z6Txh7B/5PLDEB/wqgEHPM8bFje1mQrX1Qj/kk2AxxX
 8zyQadW4Kavq/H2U9HV5YthcRLBle2FJB+1VNWRqxqgzqr4YWc7GwTJ3lvu5BzfTCxWN
 Q0UxnkRQhprC8meehC3kaBH/z469C91mPnVdfmExhu3i0w+QtbiRB9UFwVclyclxT5J7
 hen/GmQ7tBnrqyHYBOMuKEpqfPdWHXp0F4Z+dEUUJNJihYc6tcQ5P6L14BBdHSsxyQu0
 Pd/4DVLYgWmaSvqZx7xYYUejGbvbu5T1FG2ZCYL4nrV+I1zzHZYGQOrmLzJZ1/4Cba+6
 1Feg==
X-Gm-Message-State: ACrzQf3u46/Cr9aOyqmmbg8gcAZFLjHisnLQRZVhToZguAC2nM6eoGZ8
 ke7u/YJN+DMILjerD3daUSXTzJ2HFbXRo7zn
X-Google-Smtp-Source: AMsMyM6y24EoSa4DRjzrZWuFeygee4Oowd6JWqZS30VgQjynPCsWaIFwqlHDS9ED3zaQBZ/ovoRAaQ==
X-Received: by 2002:aa7:df16:0:b0:45b:f51f:ab73 with SMTP id
 c22-20020aa7df16000000b0045bf51fab73mr17675046edy.366.1666362935658; 
 Fri, 21 Oct 2022 07:35:35 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 u9-20020a1709061da900b0078e0973d1f5sm10769152ejh.0.2022.10.21.07.35.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 07:35:34 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id l32so2313986wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 07:35:34 -0700 (PDT)
X-Received: by 2002:a05:600c:4b19:b0:3c6:cc7c:763c with SMTP id
 i25-20020a05600c4b1900b003c6cc7c763cmr13608198wmp.57.1666362934256; Fri, 21
 Oct 2022 07:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221021031024.2899082-1-sean.hong@quanta.corp-partner.google.com>
In-Reply-To: <20221021031024.2899082-1-sean.hong@quanta.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Oct 2022 07:35:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-71=PsBHf51thsBN=G=2NhxK-_UA2yxpEiX=FrB1fsg@mail.gmail.com>
Message-ID: <CAD=FV=X-71=PsBHf51thsBN=G=2NhxK-_UA2yxpEiX=FrB1fsg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add INX N116BGE-EA2 (HW: C4)
To: Sean Hong <sean.hong@quanta.corp-partner.google.com>
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
Cc: sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 20, 2022 at 8:10 PM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> Add support for the INX - N116BGE-EA2 (HW: C4) panel.
>
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

NOTE: please send patches in a 2-part series in the future so I don't
have to resolve the merge conflicts when applying.

For these simple table entries, I don't see any reason to delay before
landing, so pushed to drm-misc-next.

3facae064964 drm/panel-edp: Add INX N116BGE-EA2 (HW: C4)

-Doug
