Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8B302E00
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 22:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2091D89B22;
	Mon, 25 Jan 2021 21:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C44789B22
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 21:37:12 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f1so10125464lfu.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 13:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XNwBZ3uUnUb6Ispb11A6Ynn8ywRI2rWh9CboV8C5Qnk=;
 b=mQqP0hPmK8AL9hwA46BPP0fAkOQ+2S+3v8D+yIF1BGI64yaCzmtjet9Azij0dS+oag
 oQx/W4C2Q6+1Gi7L26OrkEc+pyBzLRv17WDCGEhCz3305HXkApZY7M63fmZHvb3S04HI
 hVsQgwlMCeOTHCNxLBQhMVi+/Dak8Yzu2HWA4mK2xSnSCL6H7WJpRpAkzPVg9beNMS3w
 3u6o2DhTZ82O2qcxvC2uz5FiHbe6S5PzSPTWmmohyTzI40jSz1RsifLSGH+rXtUQYHfN
 Cf3r8/f40Edkc1QImHhT0IKNeCx+9fqHTgdaYCjp8y5N2rQplEltM92lh6ZwaOaeXl3d
 In1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XNwBZ3uUnUb6Ispb11A6Ynn8ywRI2rWh9CboV8C5Qnk=;
 b=gQEsA0dVWp0ZdD2M2olKUBTyvy8MPqoJbpCGMbfFdqioWxU3uz1DLwVLuDY3eSXzQK
 ntSKzVbSMDx+55ZylQge0eY3ym1fH7NCXa5KEWcQBjrAbUs4Yeo2gyBbGil5MkzHP6fT
 5v6vVvFpyopLY3Ul8t1tuzPMBXTRLWItR2nW00lDLrpM661BcHWEa/kcgaCpkgF81RlN
 jZGFEWAv6DmTtw+Yf1FNgh7BJPTyrpmI9HDqzFioRYIuZdAi8hMlbOY5kIHaa4tjrAca
 VOEZxz+LcONyW97ggHdZJIywQCckmXna9LTPcILo6cb6ONRu4K1KbZVxQVT9yXa5O/M6
 YzyA==
X-Gm-Message-State: AOAM530H/yRqzqopuXWC23fj1qQwq+1e+yxB0EWTwG+UnQXvISqwuHJa
 1/8N/nEiUYZkrDu4twEquy8Au2If9GgjIp76Ui4=
X-Google-Smtp-Source: ABdhPJzI9r1h6MStmuIfDO08jOyhr0/Qd7bFRk1fQL8XaCinMVzX+rLNP6mlN9l3feMzj7VUszRNgy1j+rpnO4RQOjA=
X-Received: by 2002:a19:488c:: with SMTP id v134mr1093199lfa.229.1611610630782; 
 Mon, 25 Jan 2021 13:37:10 -0800 (PST)
MIME-Version: 1.0
References: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
 <20210108214313.GA7979@ripley>
 <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
 <20210110153532.GA7264@ripley>
 <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
 <20210110200606.GD7264@ripley>
 <CAOMZO5DJUm4zutTB1oi5M0zj4_PFZEAbGzX6_LUAkX_dvEz=Qg@mail.gmail.com>
 <20210116124856.GA3406@portage>
 <CAOMZO5DKann0ojZrhjyXOqrRq9owtgrrZTGwttD_bU0-KO=aBg@mail.gmail.com>
 <20210125212917.GA4177@portage>
In-Reply-To: <20210125212917.GA4177@portage>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 Jan 2021 18:36:59 -0300
Message-ID: <CAOMZO5DiTDQneYMtNBDpyqtYUYJ3AZ_fqWNSyfxWB5AfaNfULg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
To: Oliver Graute <oliver.graute@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oliver,

On Mon, Jan 25, 2021 at 6:29 PM Oliver Graute <oliver.graute@gmail.com> wrote:

> Ok I fixed the pin conflict with regulator-gpio and added a 5V
> regulator node in my dts file. Now the display is working fine!

That's good news :-)

> I'll post the dts files soon and check if there is something to
> improve for this patch.

Did the panel patch I sent earlier work?
https://pastebin.com/raw/diTMVsh8

If it does, I can send it formally if you want.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
