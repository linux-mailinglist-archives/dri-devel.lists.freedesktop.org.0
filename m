Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71975EC7A7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 17:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2524D10E95D;
	Tue, 27 Sep 2022 15:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036E810E95D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 15:27:09 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y2so227334ede.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kankTRCISUIsAfog0Ofr/wisbx67a2Kvj+VX7g1I/LI=;
 b=fzlkqVQyXabwlDt2N0VtOlZfwq/BadBHEJVad/oL8TIoAObPV8J8nucnuONTqoz6pL
 rGORO7KYTtsOa56o+iY0kBZMd2rY2rhb4ZJQhJLZq/4i6iThyDiQJASbCbTuiZHaRetW
 lLsOxX2O89w45itZoNoHky2l2m93ECHjj6dHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kankTRCISUIsAfog0Ofr/wisbx67a2Kvj+VX7g1I/LI=;
 b=3a+cXjuHrpD26UHYY48Mkr81CrQOeaePlEqJg32diq252TGhT4jImJvZ1o1KkZ79pL
 badF7cD6r2izZ5vA05rbghmJb4Wpg74kCX/829jC+XBnzAgrWsAUgBDsuribTWx+Mnjz
 YX3ROpZKjkLeuy1wKI3Azg6V1csvGV3+XTQMdaq7RjTrGHfrQ6rtYyh6oi2zGrwR6VXb
 myltFqDA+/7nzPO82ElJ6/yMhxiZNRmccyo3eVOFLHgYGKITzhlPbCy2hb1BfOKcEA6V
 B2edSm0fW7zBRz6mXaPcODJtjKbuCtiV8roXAjJfDVtmcPRNTbC55A/w8v1J8hhfsUs5
 yUag==
X-Gm-Message-State: ACrzQf1/0xMtUF9MpBB1QPjutzRc3NI5VLhVw/BO/hCglOlXbtA65Fxl
 huU2Ix6U7jUFqvsExc0qGQBPpAh/Xq9eZCAI
X-Google-Smtp-Source: AMsMyM5QL7UHmzIHCY16QSikiJo55jBLExCrBjDI4fJIt1bbHpvYKxcAUPe1GcgEWQOllZS6J2q23Q==
X-Received: by 2002:a05:6402:34cc:b0:451:62bf:c816 with SMTP id
 w12-20020a05640234cc00b0045162bfc816mr28611105edc.213.1664292428231; 
 Tue, 27 Sep 2022 08:27:08 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 12-20020a170906318c00b0073dcdf9b0bcsm981254ejy.17.2022.09.27.08.27.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 08:27:07 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so5642215wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 08:27:07 -0700 (PDT)
X-Received: by 2002:a05:600c:19cf:b0:3b4:c8b6:15c6 with SMTP id
 u15-20020a05600c19cf00b003b4c8b615c6mr3232537wmq.85.1664292427539; Tue, 27
 Sep 2022 08:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220927063524.493591-1-sean.hong@quanta.corp-partner.google.com>
In-Reply-To: <20220927063524.493591-1-sean.hong@quanta.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 Sep 2022 08:26:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WQXOTJu-YUWyBjdoq4wPrwQYoo68FCJBF7EJfdf+9SrA@mail.gmail.com>
Message-ID: <CAD=FV=WQXOTJu-YUWyBjdoq4wPrwQYoo68FCJBF7EJfdf+9SrA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NT116WHM-N4C (HW: V8.1)
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 26, 2022 at 11:35 PM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> Add support for the BOE - NT116WHM-N4C (HW: V8.1) panel.
>
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Wow, another panel?!?

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc:

2f24fe8c54cc drm/panel-edp: Add BOE NT116WHM-N4C (HW: V8.1)
