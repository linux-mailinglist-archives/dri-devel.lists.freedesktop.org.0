Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C64ED940
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 14:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E07910EA80;
	Thu, 31 Mar 2022 12:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B083610F3D1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 12:06:02 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 p4-20020a17090ad30400b001c7ca87c05bso2306009pju.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 05:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=DoQMAhg57Iwj9QRLPIfyxqxqUJPiT17ubOe/gs+XAyZorZBgE6leFUgTZY1kyFbsTn
 vsI7URqxcYEC2pxDtzFp/xu8gnje/C+xIMYHgUo5BvTqB+KcFYvfLs8OmrirjBKLQt0J
 e5ZA0iwW6WMNHEUEkoYbdcr09BGN598PeGRsCTKTj4vHxoc9UozywtmoyigPwc9o1o/6
 QDU9cszOIp+1zbKzqdjjcc7PWB2G1IXRxtFFtNYo4TSeRBXgCHuyy1JXBxUm85RYhUqs
 Vlge+Fp4svEszf6YshAD1fz3kzfZMND7CmED7zfG5SMGKt1Yyqlyfu1DlWQJNdsGn0/9
 cEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=kYN68DNDOktmQfLfIcewD7LqPYzgn8+Q8+kTwm5jkDDE4nowmOFcm35UF1jtXTJFGM
 Utl3xmT44wtEFO+SHZgb0Q/ZZxlf9oE1vEv7DIEnjzjIQDlEmsEcB7Prk5zEbx6nwdBZ
 kRr3AlqGFbCfV4XRZ4b5rhbySGT6AMiguiyTkq/r91J1CHH7trh1ruP82+ijESZrXRn+
 D6DiQd5IwPiFpoCbRzLVKml4wdiBEn/R5NQmtSZalc1Rce9NideyUffTsUyI5laqVRIt
 e7wmabuZXcPvFv8liofJSlpDK00gQtQRXcuoe5za+tpH8bphGSsVYi0uLInviAlw1/oI
 ZRQA==
X-Gm-Message-State: AOAM532+dUqADwX1d+7IphNfQkr7jGurr2CurOC3+vsOBlLRkvNsf4xt
 VFy2jWOSAA52/JYO7X5ncPrRcyUNg7MgCMW1yabt5Q==
X-Google-Smtp-Source: ABdhPJzD49qf/qeIM51tj5LJjmvgLfNLnPUv9s4oXejQybKHNZ6BEL4/Ymi9fAnBSZGKhRRHEIoCf/0RqyuSYv4/0n4=
X-Received: by 2002:a17:903:30c4:b0:153:c102:8b9a with SMTP id
 s4-20020a17090330c400b00153c1028b9amr40894149plc.21.1648728362182; Thu, 31
 Mar 2022 05:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220326073326.3389347-1-yangyingliang@huawei.com>
 <CAJMQK-hA+k8hsQiBq7v9QROQyDkrzy+J40b2uF4AcmrXDe0gKw@mail.gmail.com>
In-Reply-To: <CAJMQK-hA+k8hsQiBq7v9QROQyDkrzy+J40b2uF4AcmrXDe0gKw@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 14:05:51 +0200
Message-ID: <CAG3jFyub2VsKDsiP0gXwEhxSZFrVRjzvuQ_Cb_DcM+YEvm=T7g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: add missing destroy_workqueue() in
 anx7625_i2c_probe()
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: xji@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Yingliang <yangyingliang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
