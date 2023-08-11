Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A680B779D85
	for <lists+dri-devel@lfdr.de>; Sat, 12 Aug 2023 08:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7191710E068;
	Sat, 12 Aug 2023 06:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A9710E0FD;
 Fri, 11 Aug 2023 19:00:12 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9bf52cd08so34431171fa.2; 
 Fri, 11 Aug 2023 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691780411; x=1692385211;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=2tX4f5CxXwqQixuwBvoHfWLxIWpN0kImRL3p6vNuUzM=;
 b=j8vSASKGirWUNk7iguwpnl+3vF0oqWasXtQrqVt7wt2BgyqwPkXWDwha9gLLISBUKV
 iGKi6QH63mKvDBPYK9oYrIHZNzFjdXUGKEbNc0PX6OCa28t1kouW1WUl+wxSDG2O5W6B
 snxBGmnneshbH6UEnINoRg0LEvGLK+19Ar9/pGo93D15GGpvCa/DNaT/Y6esnTX7izXV
 d2PwV3nEnHbB9plozz05AiLJ6TAzZJM0nNytcxCVS77RDKFjVy4a8wMk8Rv2VLamrXWO
 b9IfArlNA6LSxpXONDCSukiteldSR7UB00rvPbvj35Imt65y9XfKOGuyj3R6ZYMTXjyl
 yZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691780411; x=1692385211;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2tX4f5CxXwqQixuwBvoHfWLxIWpN0kImRL3p6vNuUzM=;
 b=U655M0ZUDWxFGudiDVgBB8Pf/ojoy3NSIv2me3ouRkEV6UNSp3LEimUKl3ptTutL/a
 ZyacjZWmDCNzkNuOjFpQR0yDpastW7SSgtzIyfs8L8nmI/idUL1vbIjGEWmSzPCv5QIZ
 LBEz97Btg2ghQD73hFbg7L4tb2YaOieMQ8JxlpEKeCalTqCFpj8TMfbozuR6Ww/P8+0e
 IepeXvMUT4gvQA5+Mv/NRi6Xy+G+zr68FTgAKxBhpO1Hrx+zqZQFkZ5L3CaLnyBHSvqB
 IdVuO4hb/PJz657VBB84mOK9IUlCzMV717uhv4C0MB+4WeTzJCBNLep0HrgnjT5JhblT
 eFbQ==
X-Gm-Message-State: AOJu0YwLQjCbV7/5VGg0JCUUH//68fw9X+QcndvUFWeCK/zU8Q2IavbJ
 SdgR5fSPSC9L1rbSOoHg5K8=
X-Google-Smtp-Source: AGHT+IE21JkPWy5VzYd+vFT13uAi07aShArndTFVzf+n/csoJ4n2q0W2aKxFaqnloQOGjW/oW/mniQ==
X-Received: by 2002:a2e:3518:0:b0:2b6:e283:32cb with SMTP id
 z24-20020a2e3518000000b002b6e28332cbmr2320415ljz.23.1691780410463; 
 Fri, 11 Aug 2023 12:00:10 -0700 (PDT)
Received: from razdolb (95-24-154-238.broadband.corbina.ru. [95.24.154.238])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a2e9792000000b002b6e13fcedcsm1002637lji.122.2023.08.11.12.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 12:00:09 -0700 (PDT)
References: <87v8dmr6ty.fsf@gmail.com>
 <f32b4636-969c-3b9e-6802-5991f511739e@leemhuis.info>
User-agent: mu4e 1.10.4; emacs 29.1
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [REGRESSION] HDMI connector detection broken in 6.3 on Intel(R)
 Celeron(R) N3060 integrated graphics
Date: Fri, 11 Aug 2023 21:10:05 +0300
In-reply-to: <f32b4636-969c-3b9e-6802-5991f511739e@leemhuis.info>
Message-ID: <87il9l2ymf.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Sat, 12 Aug 2023 06:10:23 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, regressions@lists.linux.dev,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi, Thorsten!

On 2023-08-11 at 08:45 +02, Thorsten Leemhuis <regressions@leemhuis.info> wrote:

> [CCing the i915 maintainers and the dri maintainers]
>
> Hi, Thorsten here, the Linux kernel's regression tracker.
>
> On 10.08.23 21:33, Mikhail Rudenko wrote:
>> The following is a copy an issue I posted to drm/i915 gitlab [1] two
>> months ago. I repost it to the mailing lists in hope that it will help
>> the right people pay attention to it.
>
> Thx for your report. Wonder why Dmitry (who authored a4e771729a51) or
> Thomas (who committed it) it didn't look into this, but maybe the i915
> devs didn't forward the report to them.
>
> Let's see if these mails help. Just wondering: does reverting
> a4e771729a51 from 6.5-rc5 or drm-tip help as well?

I've redone my tests with 6.5-rc5, and here are the results:
(1) 6.5-rc5 -> still affected
(2) 6.5-rc5 + revert a4e771729a51 -> not affected
(3) 6.5-rc5 + two patches [1][2] suggested on i915 gitlab by @ideak -> not affected (!)

Should we somehow tell regzbot about (3)?

> BTW, there was an earlier report about a problem with a4e771729a51 that
> afaics was never addressed, but it might be unrelated.
>
> https://lore.kernel.org/all/20230328023129.3596968-1-zhouzongmin@kylinos.cn/
>
> Ciao, Thorsten

[1] https://patchwork.freedesktop.org/patch/548590/?series=121050&rev=1
[2] https://patchwork.freedesktop.org/patch/548591/?series=121050&rev=1

--
Best regards,
Mikhail Rudenko
