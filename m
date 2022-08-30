Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC995A67AE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 17:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F4E10E153;
	Tue, 30 Aug 2022 15:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA06E10E153
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 15:47:47 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id 62so9569286iov.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=9f2bO9sEBdq+wgciheHTKF7TZKiz92E+7DCQ/5qexd0=;
 b=hbufoTwEPykpa51OHC80c1lNeHDkPA9Syp/0nviAloJ905gGMGBophKG498BPZGv0g
 xN7wqPhyjGhJ6x/9aWVh0LFYBT6YB/GustCVXqbxObHu3yKIXR2NjGKpcjuXII6wIrQ6
 cEpQZ/2nb7f/UbVFFeBpheb9gb7G8k6uanF60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9f2bO9sEBdq+wgciheHTKF7TZKiz92E+7DCQ/5qexd0=;
 b=y4GzOTC7sB8+yTf17EALVwWMeOGcriZOLAis5lDJHebG6OmgDqY5FuTDLklmFJCEm7
 TsncRvyDE5IGVtS7XzqeD+c1RxW0Bu5JUP3DBoO1l8P/+XdLMDBYni/zp7hAed5P2/7P
 UkgS1VN3eltG6QFI7oVh+g/ZuXlqt5/XVdN1t+VpSiYK3uej1UnKWGbC3fFa/yW7dvim
 bLP9D8ve5oaqDXfow3QoHlXfr8exOh8/gRll6DMTaJ+f0TdcG5oBVF7wTXpomLai6boJ
 67s1aMDtaebTBAtowjqKhbG3vGMRHax5N9j1HuSuMs7N909+2Rcg3oD8UvMciPojPbV4
 U/Ow==
X-Gm-Message-State: ACgBeo13prnT0vo/ODbxH1GiQ5rkBmfvjjv7pRWMLQdZDIe330ZTsK9Q
 S9lYF5xk3NW41VNL9VHvyJTzjN7/aCXQ6EIe
X-Google-Smtp-Source: AA6agR7Sb984JY3s2wGAhJDq1QPW90W0ORFcjkPiF7Ngn5vCJr7xff1X2FQdTnXBjP24CsQbrSc3nA==
X-Received: by 2002:a05:6638:2411:b0:346:86a0:d325 with SMTP id
 z17-20020a056638241100b0034686a0d325mr13195842jat.28.1661874466577; 
 Tue, 30 Aug 2022 08:47:46 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178]) by smtp.gmail.com with ESMTPSA id
 u127-20020a022385000000b00349c6e9f804sm5656326jau.81.2022.08.30.08.47.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 08:47:45 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id l6so4656297ilk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:47:45 -0700 (PDT)
X-Received: by 2002:a05:6e02:1789:b0:2ea:ccd4:d0ed with SMTP id
 y9-20020a056e02178900b002eaccd4d0edmr7210776ilu.177.1661874465309; Tue, 30
 Aug 2022 08:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220822105340.1.I66a9a5577f9b0af66492ef13c47bc78ed85e5d6b@changeid>
 <YwjhxQjiJeQ0u5rh@ravnborg.org>
In-Reply-To: <YwjhxQjiJeQ0u5rh@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Aug 2022 08:47:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+2OJzXvkXKbvm=veJeoxpHs_sHhs-maNGCWjPowCeJQ@mail.gmail.com>
Message-ID: <CAD=FV=U+2OJzXvkXKbvm=veJeoxpHs_sHhs-maNGCWjPowCeJQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as a reviewer for panel-edp.c
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Aug 26, 2022 at 8:07 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Mon, Aug 22, 2022 at 10:53:59AM -0700, Douglas Anderson wrote:
> > panel-edp changes go through the drm-misc tree (as per the "DRM PANEL
> > DRIVERS" entry in MAINTAINERS), but ever since splitting panel-edp out
> > of panel-simple I've been trying to keep a close eye on it. Make that
> > official by listing me as a reviewer.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Pushed with Sam's ack.

e6545831a17b MAINTAINERS: Add myself as a reviewer for panel-edp.c

-Doug
