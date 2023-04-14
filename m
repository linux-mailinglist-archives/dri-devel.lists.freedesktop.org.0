Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D46E1BDE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 07:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD33D10EA08;
	Fri, 14 Apr 2023 05:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7116410EA08
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 05:45:00 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 w19-20020a9d6393000000b006a43ff0f57cso647951otk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 22:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681451099; x=1684043099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tZiBy+s4nbaVz7xQUBVrE3MueZ5kT0/0OhDxQkzGvLM=;
 b=cRdKXHm2Iu7ZAHJaECDtu7Gkz6V6IpGrHIZvR56cIO2yGB2b0kFl2GQuPXZfvkw11+
 NggdM2nIQxGsFcPhowN8BBT5nQrhm0WAGLsMGcWsFbIz/FLdGt+JSkLyK1+8jXgt95WV
 c2DbkBv0FGrDJZpNL10DWkmkPd2wiRsTpX0R0FnD/Wi8MVxVKejVDBmtCwUIDlIXQDck
 OekcaqkZQfI2y9hj4/tAc5AmtO+yEA5DhUgkDVn63rnj+IIZUJYSRZEupnaSGuRITtk4
 yeuO3MsjLc3Bil/D/7DsHEofqi1X7pz/xsgeAshNalpNOfoDPEBwTUPibTDdGt7gd2UA
 BKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681451099; x=1684043099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tZiBy+s4nbaVz7xQUBVrE3MueZ5kT0/0OhDxQkzGvLM=;
 b=askFZo6KyS1elIFx6Y9ur42DT9MFFec6p5i+vHgP8RsPNEjq8GBtdU14C3iOEnnklG
 rCsO94FR6uB9H4f4tanyFk0KmLd5yi/BV3yApHrUsWMzA8Ba4OKi+kwN5PTG8Zt8nAac
 AnQzcY7Un/pcKcXO0ftDCmAvq31SCRcvXqh/YX0U5Z2jXgoATLL3AoFn3jX3B4gvZYWK
 hd4xE1fCdJznfHil+Jh99stsjkx1+D2g8vwSYxNqIZZswy5OdqFcSOdF//nftCdn2qGg
 y0rf9zag7VBDCZZ+QjHwNd0blIky5aqhtznHSAx845UdvoKS5tXEHU5CFSafGfEgyt9y
 WhgQ==
X-Gm-Message-State: AAQBX9db9BmjJyhJzlua55aB1pNqCX5A8MIzl/6tsEe2KAZL/BPSMBdm
 4KQt3wK++DNfo6zFZ2jCPBmiJ/YLDxCkEv4QlFU=
X-Google-Smtp-Source: AKy350bQAy2QKoumLC+mND63DDJJRSOD4a6K1PX7cJk152u+bCa7CRVsAq8WQXO+qSu+B16s2CI9ta3oOsk5ajmnRSU=
X-Received: by 2002:a05:6830:1bdc:b0:6a1:1b5c:c6db with SMTP id
 v28-20020a0568301bdc00b006a11b5cc6dbmr1159487ota.7.1681451099092; Thu, 13 Apr
 2023 22:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200424222740.16259-1-afd@ti.com>
 <CAL_Jsq+4mf6QHX27knoHTXA4vnsC3swuvAH7zK1DpyaV-p_qbw@mail.gmail.com>
 <f46c097a-b2a6-6368-a8a4-e30995a54d17@ti.com>
 <CAH9NwWeZnDEkundm98=KL6xB9bVO3nOkk48xMF-eQnztP4DD4g@mail.gmail.com>
 <99f1da4f-810e-986d-388a-af136ade745e@ti.com>
 <CAH9NwWcafkmcZd=5WN_hoJmfkwUJJrewaPnSmCK-izrC3hwKnA@mail.gmail.com>
In-Reply-To: <CAH9NwWcafkmcZd=5WN_hoJmfkwUJJrewaPnSmCK-izrC3hwKnA@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 14 Apr 2023 07:44:47 +0200
Message-ID: <CAH9NwWfkWTXMVOY-7USgYJnBtUOYd8=TFVcPxiTgVd9AJAQH=Q@mail.gmail.com>
Subject: Re: [PATCH] misc: sram: Add dma-heap-export reserved SRAM area type
To: Andrew Davis <afd@ti.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew

Am Di., 4. Apr. 2023 um 17:02 Uhr schrieb Christian Gmeiner
<christian.gmeiner@gmail.com>:
>
> > > Hi Andrew
> > >
> > >>
> > >>
> > >> Okay, will split for v2.
> > >>
> > >>
> > >
> > > Was there a follow-up v2 of this patchset? AFAICT this series did not
> > > make it into the mainline kernel.
> > > Do you have any plans to work on it? If not I would like to help out
> > > as we have a use case where we want to
> > > use a dma-buf sram exporter.
> > >
> > >
> >
> > Sure, I've been keeping it alive in our evil vendor tree, but if
> > there is interest upstream now I'll post a v2 and CC you.
>
> That would be great!
>

Did you find time to prepare a v2? If not, can you point me to the
evil vendor tree?


-- 
thanks
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
