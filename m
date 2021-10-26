Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9143BADD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 21:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BF06E860;
	Tue, 26 Oct 2021 19:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9756E860
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:33:13 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id y128so126970oie.8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 12:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=N+6YPLFrjwgdtCUJfPROJUL3QTAN19p6nyz5HyyDtK4=;
 b=bwQVfE1iYX9MIZ9fiCHs3adkHdyfOkx5hhBzkC7jWLgIdcSsCSYWq2QLllwOfVVG9j
 /qobU+jHLvUR++xcY972QXpv1OVxCGwsmhZmihMcmoSLl2uPPg+9RbhrGjogeCK4mDBF
 FsDc4/q9pdianaa3KZJ9DpZsajeQI3ERC7dVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=N+6YPLFrjwgdtCUJfPROJUL3QTAN19p6nyz5HyyDtK4=;
 b=KUXbLIVbaorQXDCBo/m2AQQ7Yx6CWem3w7fZSPiu8K4B8krNWdGIkDvutV8qs2sBVh
 82stKBobIzL4MY08UHDb1EnsrNglZpbiedyAUCHi6EH07scnJtQVWdQ6QMEuZAGOnFKF
 z9sw3v+tDT4P5w1dPr74WBqH75hvz90JWfK1OCbog6fnbXVNYObPJOdwXfELAUDGWn6x
 MoGMco5sA+uF6kRnFR26YyDhIs9WjyCZqDwT8T8q7L659nhJ4IJnz5PQulUyXzbRNt2j
 0FUddjGkpdo71O6IT6I8uG4YsFkt6T75BysPDEbj5y28lG2XV5ZBY8I8oCPzbSIQ5bYP
 CrJA==
X-Gm-Message-State: AOAM532+Xzpn8aqpot6dpPRjNtgWLDnQB4ojfWVvtbA7T7omWClZfD0c
 uPGdEFiN13YhoZ/Jhg+zd0rduT4hN8fkkeFTJavoNA==
X-Google-Smtp-Source: ABdhPJz2feIZoXb0OU1UFvKLPQtsVf3EiA3LjrGD6qfKLOXPs1wesM0P/U/URyOya6G/f7joJZ5ris8KEn2SD03vMv8=
X-Received: by 2002:a05:6808:1d9:: with SMTP id
 x25mr555758oic.64.1635276788733; 
 Tue, 26 Oct 2021 12:33:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Oct 2021 12:33:08 -0700
MIME-Version: 1.0
In-Reply-To: <202110262230.8EQoYnHj-lkp@intel.com>
References: <20211026000044.885195-4-swboyd@chromium.org>
 <202110262230.8EQoYnHj-lkp@intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 26 Oct 2021 12:33:08 -0700
Message-ID: <CAE-0n51k5HnvVuXgRvuOtpUovceTBeqnQdh1hhKzPV=qB0JjsQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/34] component: Introduce the aggregate bus_type
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Russell King <rmk+kernel@arm.linux.org.uk>
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

Quoting kernel test robot (2021-10-26 07:02:03)
>
>    drivers/base/component.c: In function '__component_add':
> >> drivers/base/component.c:858:13: error: variable 'ret' set but not used [-Werror=unused-but-set-variable]
>      858 |         int ret;
>          |             ^~~
>    cc1: all warnings being treated as errors
>
>
> vim +/ret +858 drivers/base/component.c
>
> 2a41e6070dd7ef Russell King  2014-01-10  853
> 3521ee994bca90 Daniel Vetter 2019-02-08  854  static int __component_add(struct device *dev, const struct component_ops *ops,
> 3521ee994bca90 Daniel Vetter 2019-02-08  855    int subcomponent)
> 2a41e6070dd7ef Russell King  2014-01-10  856  {
> 2a41e6070dd7ef Russell King  2014-01-10  857    struct component *component;
> 2a41e6070dd7ef Russell King  2014-01-10 @858    int ret;
> 2a41e6070dd7ef Russell King  2014-01-10  859
> 2a41e6070dd7ef Russell King  2014-01-10  860    component = kzalloc(sizeof(*component), GFP_KERNEL);
> 2a41e6070dd7ef Russell King  2014-01-10  861    if (!component)
> 2a41e6070dd7ef Russell King  2014-01-10  862            return -ENOMEM;
> 2a41e6070dd7ef Russell King  2014-01-10  863
> 2a41e6070dd7ef Russell King  2014-01-10  864    component->ops = ops;
> 2a41e6070dd7ef Russell King  2014-01-10  865    component->dev = dev;
> 3521ee994bca90 Daniel Vetter 2019-02-08  866    component->subcomponent = subcomponent;
> 2a41e6070dd7ef Russell King  2014-01-10  867
> 2a41e6070dd7ef Russell King  2014-01-10  868    dev_dbg(dev, "adding component (ops %ps)\n", ops);
> 2a41e6070dd7ef Russell King  2014-01-10  869
> 2a41e6070dd7ef Russell King  2014-01-10  870    mutex_lock(&component_mutex);
> 2a41e6070dd7ef Russell King  2014-01-10  871    list_add_tail(&component->node, &component_list);
> 2a41e6070dd7ef Russell King  2014-01-10  872    mutex_unlock(&component_mutex);
> 2a41e6070dd7ef Russell King  2014-01-10  873
> 748369f5c5e62a Stephen Boyd  2021-10-25  874    /*
> 748369f5c5e62a Stephen Boyd  2021-10-25  875     * Try to bind.
> 748369f5c5e62a Stephen Boyd  2021-10-25  876     *
> 748369f5c5e62a Stephen Boyd  2021-10-25  877     * Note: we don't check the return value here because component devices
> 748369f5c5e62a Stephen Boyd  2021-10-25  878     * don't care that the aggregate device can actually probe or not. They
> 748369f5c5e62a Stephen Boyd  2021-10-25  879     * only care about adding themselves to the component_list and then
> 748369f5c5e62a Stephen Boyd  2021-10-25  880     * waiting for their component_ops::bind_component callback to be
> 748369f5c5e62a Stephen Boyd  2021-10-25  881     * called.
> 748369f5c5e62a Stephen Boyd  2021-10-25  882     */
> 748369f5c5e62a Stephen Boyd  2021-10-25  883    ret = bus_rescan_devices(&aggregate_bus_type);

Ok I guess I have to print a dev_dbg() as well to silence this.
