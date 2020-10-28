Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE4229E5FA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D446E86A;
	Thu, 29 Oct 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7358889B8E;
 Wed, 28 Oct 2020 11:03:07 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id dt13so6540386ejb.12;
 Wed, 28 Oct 2020 04:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=crsJn958YPx+DfiUeCUXF8zFkw8B7ZgM1ok7UnCgjBc=;
 b=SpU9X23c0TEXgzS51opwaIWf2xC0Vz5Mon/ZEP0E0lIupE5LmXZrhj7AOIdodA/mzF
 SPMP5bd+zN5zwp6EoeedpLXqljCllRH1ennrUZ1C1gIrcbywAcJDLtvAsvE7h6PwR9Ge
 HQKj+nRElMTqbeFrx2zkyvP/HGotboA9G3EV2fm61FDxdW224daICDMqU3YyN4uiZ2Qf
 qSvGnPqK6Xc+GZQx9O1oWc+ko4hUfTcYiu3KwHsGXuzXZt2pAJnLaRGNLEZ6C/cHruBz
 P/n3NREfc2KNd/zJeaJ11ebVmxIKxuLUz+1la0xdkxxDf3YzNzwUs7Qpoafwc2YAX4yU
 W13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=crsJn958YPx+DfiUeCUXF8zFkw8B7ZgM1ok7UnCgjBc=;
 b=Bmu02xumgFBYv/67JfgBgPuxp+SKrkj9BPuioyD+F4qrJswBv2RFx08qyYMRsK8H4z
 34TGefMzj0F4LY7Y6LordVoLDORvy5zLPIpK6U/zEKMnFeQ+RhFdDIrIh0baY/J2wrgu
 TgLVZzXkySAj8WF5mOK4yiHB6/WwaIYpRXgMBcM/Hv2kEKV5cymeszUZ3iCI2TZTvykx
 dHPapeLumBdiREvXpGdW5eNsuoXJ+hP3qK8KEZuNJC6b38ltgSSHacdWq4uHD244pWFI
 YPYGSgWWoaHnRl3m6h7w1uloYorrEFwiceCbFRmIed+C/YCyiHuXKCQMHDsg2fhG06+a
 uHCg==
X-Gm-Message-State: AOAM533W3LeaKmHsHn4D9d+fsi3Eyv8urwlju8rglWo5ZKjxeOcK6lor
 RQPGn7SWFH033X4kwmjWdsyN6rsEz1zDQ5bhYLk=
X-Google-Smtp-Source: ABdhPJwoGVdRqfsqvWuWzdPRnNZe3lb2Vi57v7g4MvL1w570aMKiksqMTfhLx8AO2bJTRqclXeS9Facr25x2VLhnKkk=
X-Received: by 2002:a17:906:ec9:: with SMTP id
 u9mr6992083eji.400.1603882986071; 
 Wed, 28 Oct 2020 04:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-3-frank@allwinnertech.com>
 <20201028102942.zc5hgqpo2bfrn6in@vireshk-i7>
In-Reply-To: <20201028102942.zc5hgqpo2bfrn6in@vireshk-i7>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Wed, 28 Oct 2020 19:02:54 +0800
Message-ID: <CAEExFWvNgK2wbvmxZjsJR4g-VBq=ggsBLew77rzmNdkpqTRuDA@mail.gmail.com>
Subject: Re: [PATCH 2/3] opp: Add devres wrapper for dev_pm_opp_set_prop_name
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: Nishanth Menon <nm@ti.com>, freedreno@lists.freedesktop.org,
 Frank Lee <frank@allwinnertech.com>, airlied@linux.ie,
 Viresh Kumar <vireshk@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, dri-devel@lists.freedesktop.org,
 gustavoars@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, kholk11@gmail.com, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 6:29 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 12-10-20, 21:55, Frank Lee wrote:
> > From: Yangtao Li <tiny.windzz@gmail.com>
> >
> > Add devres wrapper for dev_pm_opp_set_prop_name() to simplify driver
> > code.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> > ---
> >  drivers/opp/core.c     | 39 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/pm_opp.h |  6 ++++++
> >  2 files changed, 45 insertions(+)
>
> On a second thought I am looking at dropping this one as you haven't
> added any users yet and I am afraid it will stay unused.

Now it looks like that dev_pm_opp_set_prop_name() is used relatively less.
Maybe we can wait until a caller, and then pick up the patch.

MBR,
Yangtao
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
