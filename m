Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F256079AB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 16:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF8710E315;
	Fri, 21 Oct 2022 14:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53AB10E315
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 14:34:36 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id m16so6585232edc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lD0xgbVkvhygXmPzL7EMrxyMcD+kjNgjJAnULQCkoIg=;
 b=lTprzbMUXUupoaSFA6UAyc6cElH1N3JEnI4k13G0pTpJEu3Ej0mzoFZlr4CF1+Ud8m
 LB7R/XAZOjZJogN8NRAuhbD5TEmx0KAlank7AwEpw7IoWJZ7WZ/lwKt5eK0cQYJxk7pj
 AO004nZp+ikIUmXX3fN47RsgS16YuKigjcD1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lD0xgbVkvhygXmPzL7EMrxyMcD+kjNgjJAnULQCkoIg=;
 b=Ah4nu2aJOSkcN2TjUwOP3MKV5RXGo7QyLNjZtOsQg00PVPTH5cVFRuOGPWuU/BgmLi
 yy93mWxfwD1aa81d77jmSdRNig+tsaYEiRZaJg8KIeRqdQM4gOes34zjxQeSL3l+iesO
 zMP9G1nfExnpg+rbF7a7UYA3RUU8i5/veZXMJo0v4iNved5J5Xzei/zzDXYpJecPY1SO
 lnjIX4ORa5oO9kCE+YnKx926queqZNWJNv7ktKbgjl/7FuYGoLf3S+NoCHxfQh5QBvPv
 3Dl+x5k4KVamFdSX37911wE23VcNfIc7WZB8l1IWe9Gth5ItkuAaHZB6Z6yX26Mswnii
 i2VA==
X-Gm-Message-State: ACrzQf0SBJcRZ+ti0ha4xkEXmsewDuBoPQ6kMUOj7xCy3a4gLVc0u/ig
 79Lq3XRlRZoj/UnDrMmPEO1a4X441qa+oO3Q
X-Google-Smtp-Source: AMsMyM78TiJ5bQgfCo1nRA10FwOOD1BwQAy6kE6IFKC0UoZN9ey3r9IqKcVB5NuZslauvogo4/k41g==
X-Received: by 2002:a17:907:b01:b0:78d:ce3d:905d with SMTP id
 h1-20020a1709070b0100b0078dce3d905dmr15603857ejl.45.1666362874896; 
 Fri, 21 Oct 2022 07:34:34 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 a13-20020a50ff0d000000b00451319a43dasm13742384edu.2.2022.10.21.07.34.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 07:34:34 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id bv10so5160740wrb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 07:34:33 -0700 (PDT)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr12861240wri.138.1666362873435; Fri, 21
 Oct 2022 07:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221021025801.2898500-1-sean.hong@quanta.corp-partner.google.com>
In-Reply-To: <20221021025801.2898500-1-sean.hong@quanta.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Oct 2022 07:34:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUXFO8sM_y-keP+Qvy7qVPrxguTnD1YyL5rmgpK3dVPg@mail.gmail.com>
Message-ID: <CAD=FV=WUXFO8sM_y-keP+Qvy7qVPrxguTnD1YyL5rmgpK3dVPg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add INX N116BGE-EA2 (HW: C2)
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

On Thu, Oct 20, 2022 at 7:58 PM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> Add support for the INX - N116BGE-EA2 (HW: C2) panel.
>
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

For these simple table entries, I don't see any reason to delay before
landing, so pushed to drm-misc-next.

4ab5953f0af7 drm/panel-edp: Add INX N116BGE-EA2 (HW: C2)
