Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097E0379A25
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 00:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246046E944;
	Mon, 10 May 2021 22:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF086E944
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 22:35:35 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id k25so17286051oic.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 15:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fUc4hgydM0CmYj7T3eVJGvSCBCFbFHknkLeXpTs7Z6Y=;
 b=SLk9lya6kpODyG3A9aha91IDHmammqhVWHFEBiXDvoQg/K/Eygl/gKDZR6/tL3Yebj
 hDklG7mlvfI9Ci+pM9tIk5a8GIbH+nFzxXMB2be1qS6t9I60mqrkmwyxFWZAjTpYf/2n
 Yaf659jnGqNryNN0ZbPbhm1wM9hffJ4XBddJQfUjWRRLuVJqSAAlfdkUHnJ4Dbwr5PCt
 Nuc5t2GleTZvRizJ4pb6x0Ds08BybB8NTXy6Cgwh+2AMQc2eCSi3hFatmimpUOhFS9cV
 3SJmHiv9U/GxrA3hWaCOM4JrKd1e3HFItKYJQ+U1bLM++X0UZr2rPnvN5cTywazaVgk1
 MbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=fUc4hgydM0CmYj7T3eVJGvSCBCFbFHknkLeXpTs7Z6Y=;
 b=m14PsPMiwbjxcXZO01OPVJKTlupVUzh1FXd6PJDVuiyM1DExJgaVb43mkV3Lu+wAX2
 cm6lgxG8IcsXtqfTZNQ4Bp8qKlU96BOo5iTCc4QOROL8D69Scrjedk5p3cyi9tECo0/p
 mrYg+q/8Yl+i6TqmW1lVg2iS0jPY50OessVycPcJyAPoGQlbLCX2+KeDqDM2OoT99dPP
 AXLipCQltqntvRDH9ERUhZQtcz8p5KmkA+oS10vnNG1BLjpAdA1n38xTeqjJF7QcOIih
 QbNsa6rI11g+SI+h/N54lGr+/pz45DTE/rpeFbm49DJKf4d9bUEpBXz/sI4+Tocx0vLt
 69Ow==
X-Gm-Message-State: AOAM531z0s4JXfQ35mP5mMA2t5aTDE5mgz47Y/vuhGYhY7FjxRyRl6g5
 cMDEUKzxqN3qJvFKkcKjwjI=
X-Google-Smtp-Source: ABdhPJxgFNdDGEUHPyAgN1KF//N7LH3FxagGp6jWy4NeVMTG7lL4PBPgFcGh/CxI8K5qN3VESAycKQ==
X-Received: by 2002:aca:ebc1:: with SMTP id
 j184mr19502217oih.125.1620686135243; 
 Mon, 10 May 2021 15:35:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r17sm2948830oos.39.2021.05.10.15.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 15:35:34 -0700 (PDT)
Date: Mon, 10 May 2021 15:35:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rajat Asthana <thisisrast7@gmail.com>
Subject: Re: [PATCH v2] drm: Declare drm_send_event_helper static.
Message-ID: <20210510223533.GA2335713@roeck-us.net>
References: <20210510123243.hmwar3swmrewskjs@gilmour>
 <20210510131616.544547-1-thisisrast7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510131616.544547-1-thisisrast7@gmail.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 06:46:16PM +0530, Rajat Asthana wrote:
> Declare drm_send_event_helper as static to fix sparse warning:
> 
> > warning: symbol 'drm_send_event_helper' was not declared.
> > Should it be static?
> 
> Signed-off-by: Rajat Asthana <thisisrast7@gmail.com>
> ---
> Changes in v2:
>     Provide full name in Author and Signed-off.
> 

Turns out a variant of this patch [1] has already been accepted.

Guenter

---
[1] https://patchwork.kernel.org/project/dri-devel/patch/20210427105503.10765-1-fmdefrancesco@gmail.com/
