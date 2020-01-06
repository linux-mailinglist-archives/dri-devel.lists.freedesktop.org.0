Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572F2131128
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 12:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB266E25C;
	Mon,  6 Jan 2020 11:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CBE6E25A;
 Mon,  6 Jan 2020 11:08:15 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id t12so31355646vso.13;
 Mon, 06 Jan 2020 03:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DmvJO09F5LptWX15W1OhA2q6USBr8Wc7nFJ/W9cZZHw=;
 b=FojhqejLBBf4FzD/fo8Nen8d6lR5fKNNbSgmVyxYY/nxqx7Ii3l1aUp6lnO/QqX2Pz
 w+aNWTUNarT2cSeO3gTxZ3qloDraoApx3WowgZzn5BL6DrXazw4aWE3R5S6N2o9dsEzk
 R8p/I3mmrgYXrARi8y8yfLdYKOQNZptGr0Db+7+pfO8A2eVeGloRoTp5utubqlVS1vC1
 aMBxdHRRa37K+vX8iaAJYXqVisCw0gpCwHcTSrWE5YkZJSneaf/vlIIQxbjB11sCwHns
 3u3ge8PL+/W/7ptPyjn5w7Y6rwkEVF/xogLScbAKh1ZzpvYUS120EzNl+0BFwXJkDVcx
 8iSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DmvJO09F5LptWX15W1OhA2q6USBr8Wc7nFJ/W9cZZHw=;
 b=WlvJ9uHfKmUa4D9bReTaevWCxQl3XDeQNA7wCzgQPZBlL+A4Zocmxch9Qizr7i4kT+
 +ENIRDde3EusjpRp+D+bkGYCo+7lZAz4JuxfSpsz5K2TYmIAa6dS8JOIVG9CbG/x2KbI
 FLULWmfQ3385NWJeaZUyteFaUHcbZjgwVfvaHwUNmV5NcQsX3hJLpn+Gqw9M0lh+cIvw
 3eqVhw0S+UG+n3jISKdx2NC+0hGV2XpFhpACvz4rbOi2DmPyThRFEdDmYOCPtEq1bOl3
 ug4mS+syuwHUoKa12W6hM4hajeKJ+T7TsRVqkUXUR6CsP+mFcQcSRxtv0/ITymQyP80E
 kUIw==
X-Gm-Message-State: APjAAAWfkGJ3wkBeArKZZlaN/D0LbJMgBwljDm/yw81strZVSEMKOeJX
 MIiV9QJNxbUC8Ni+CkU5t3XMwKPStqH4zn7Fc98=
X-Google-Smtp-Source: APXvYqzCfUVATQvg/zXG1j+6zPEZgU57DcHIyiKn603xj48o6dgKrjMZvKdDl97D0pHfO2pv/C7JgQe+IiZk0tYoQJo=
X-Received: by 2002:a05:6102:227b:: with SMTP id
 v27mr40176369vsd.72.1578308894437; 
 Mon, 06 Jan 2020 03:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
 <20200102100230.420009-4-christian.gmeiner@gmail.com>
 <15ed7b85a13e220a533a800b9c04f13b1c747c1c.camel@pengutronix.de>
In-Reply-To: <15ed7b85a13e220a533a800b9c04f13b1c747c1c.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 6 Jan 2020 12:08:03 +0100
Message-ID: <CAH9NwWdKVrp=oN9cVWq+aLqhUDsh8PpC+bkeihDfMTnsE60U0A@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/etnaviv: show identity information in debugfs
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Am Mo., 6. Jan. 2020 um 11:08 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> On Do, 2020-01-02 at 11:02 +0100, Christian Gmeiner wrote:
> > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > index 253301be9e95..cecef5034db1 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -868,6 +868,18 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu,
> > struct seq_file *m)
> >
> >       verify_dma(gpu, &debug);
> >
> > +     seq_puts(m, "\tidentity\n");
> > +     seq_printf(m, "\t model: 0x%x\n",
> > +                gpu->identity.model);
> > +     seq_printf(m, "\t revision: 0x%x\n",
> > +                gpu->identity.revision);
> > +     seq_printf(m, "\t product_id: 0x%x\n",
> > +                gpu->identity.product_id);
> > +     seq_printf(m, "\t customer_id: 0x%x\n",
> > +                gpu->identity.customer_id);
> > +     seq_printf(m, "\t eco_id: 0x%x\n",
> > +                gpu->identity.eco_id);
>
> I like having this info in debugfs. Most of those seq_printf don't need
> a line break though, as they fit well within the 80 char limit.

Ok..

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
