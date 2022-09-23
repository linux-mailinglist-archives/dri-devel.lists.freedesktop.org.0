Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF165E7D22
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 16:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D502010E341;
	Fri, 23 Sep 2022 14:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8652210E341
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 14:33:11 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id w28so477390edi.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=JcLccmLtichVQvIjuBsBYfgR6Tl0L9ItGMwduiQP5RU=;
 b=N1FDyXNxx7GKDn5pw04aLrkqj3YsfyCHDjiwdabJmWdWqWNQhUTpo+fPEN2XRVXhe1
 ejCiZnSnNoANy2V1T3Mueo4FY01XvPX14egCssivRzTNQV1IC2BNigQkH1xYkvpKO9CU
 LMQHhQ+fgqXS4JBTLSKrGCTEkcTdIMgxan9/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=JcLccmLtichVQvIjuBsBYfgR6Tl0L9ItGMwduiQP5RU=;
 b=SH44+YKVnS/8f+tCXtyXsK8GK5fxAwSJYgZvR1NiBa2GqQ0uQ10UOlWrZYDIMoZjOb
 sYrYsmEekkw2EvIHs1dTUa58Bw/jY6Ki1magPu/x3OX8lVFn5+ZKqxmDbPoKFgYhXFGd
 800gvY3ueZjR1vS2MQihiDfq0zm05jM1/ZeBaDtsXFqMnK/5iQJ9GqxySM9OmyN3BaAE
 LYgW++n6TykGr8oTgvM2m6ixHbx0MbwKjfmmBYl2HV9CO8/c3NDpOTt2kAER5wyKvRQa
 +VxoH+Ywkqlbh5pUBL53XqTSudUOM5tnxw3Pur28rx78wwqxgwSS+2OmWNBPJ+QfzqzQ
 eSXw==
X-Gm-Message-State: ACrzQf2LSJsCgk7NJCURBUgCto0N1UaKQJATGRdXXYvvE0xIRvqF83j/
 wb0ttDsc1AnHIwytK4/kiIHBnC/kCRexbVwS
X-Google-Smtp-Source: AMsMyM40s/P3UVOaYPE/N674v7TH9rzKOayWeV5B76LdrY6riXfH4q7bOw4V91js1QZgNsyRaFXMsw==
X-Received: by 2002:a05:6402:284:b0:454:3e53:feae with SMTP id
 l4-20020a056402028400b004543e53feaemr8604362edv.280.1663943589735; 
 Fri, 23 Sep 2022 07:33:09 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 l18-20020a1709060cd200b00772b5835c12sm4165124ejh.23.2022.09.23.07.33.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 07:33:09 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 u16-20020a05600c211000b003b5152ebf09so878697wml.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:33:09 -0700 (PDT)
X-Received: by 2002:a05:600c:5488:b0:3b5:634:731 with SMTP id
 iv8-20020a05600c548800b003b506340731mr4723210wmb.188.1663943588804; Fri, 23
 Sep 2022 07:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220923085028.306790-1-sean.hong@quanta.corp-partner.google.com>
In-Reply-To: <20220923085028.306790-1-sean.hong@quanta.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Sep 2022 07:32:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WQs1EcafhPL0jh0Uj=LHumL1AT_YriibzGY6hvhxBNYA@mail.gmail.com>
Message-ID: <CAD=FV=WQs1EcafhPL0jh0Uj=LHumL1AT_YriibzGY6hvhxBNYA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NT116WHM-N21 (HW: V8.1)
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 23, 2022 at 1:50 AM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> Add support for the BOE - NT116WHM-N21 (HW: V8.1) panel.
>
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

As with previous trivial patches that just add an entry to this
structure, there's no reason to wait before applying. Pushed to
drm-misc-next:

43bee41415a6 drm/panel-edp: Add BOE NT116WHM-N21 (HW: V8.1)
