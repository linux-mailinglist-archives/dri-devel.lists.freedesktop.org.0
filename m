Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D83EFCAB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B85C8922E;
	Wed, 18 Aug 2021 06:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D9389144
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:27:26 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id a21so1112880pfh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ynpJGQ+aoMGoVR3/TzuLa6jhj83G7NCnezbFysKyDck=;
 b=rkMxRzllxsu72p9VoE+F1Y2uNFqfHroY89seElO0F/IF9+njGBhH+JhTjiV6p10xBW
 RZkVVmBoHTbmBO5qy0Cu5P7Yjfpn+Q0pDbpgd//DyVd9iIE8FToCC+snGEMZelh3paY/
 +hPtSq0td+yzw80H6HXZomYGW6ujPphQgl+LDlsExLGmraR/J0ZHNe7yOVInyCFXmT/P
 91wgqIKeFsyocJA7qECcUweDwMNTMng3I+m8yWPcUOWHp3ukJGcj7wwvK4fm1T2uIjDm
 QM2rYu2cAoeXaM+8hLCXU5bhhQmCXVpZaudJg93f24DbqOKNah/15WaZUn/RqJ/MrtRh
 mNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ynpJGQ+aoMGoVR3/TzuLa6jhj83G7NCnezbFysKyDck=;
 b=iMtcgFXTPe7AUOTMXlwGsXqcKyPlyM+ax2yc7J8uzt1Yk3yBoEet1JeLhIOr9TdWqT
 1WG0eFYqSIb6lISpOBR5L9saqSNsXVePib06BEf+YPGfjisnXVVfheye5vIoQCA7QKig
 4L8aOExaZQKtNAoksb9SrzOdYJfsnfXoolWPjkYF6QpEdwel0eA7HE2Soap5du/jFtIp
 hkxwdrK2+O36YQ37O1GCx/TGXVsuHDdpQEjfzvxtj35eeGbeHPr/fzF4ZC4n6keWPzw8
 rl7ue1K3qZKED5+HkvLet0aD6MuLZyY19lH2vGMhBQ2Hi5x7WoMdKiDV+CWF2MFBcuor
 qPDA==
X-Gm-Message-State: AOAM533xsLgdrEBolsIffG17WP11qsOmrS32KTON/htOKvmLiMAZuvxp
 BuFjiFrfwGzf3vu3UZrd43/Ylg==
X-Google-Smtp-Source: ABdhPJyUhfdCbjMBESEOiqAS08eZgxAs7V5/0XRqW4UZTe3K4OmwyniXAPYZlVBrx4vmpFlW5lQzVA==
X-Received: by 2002:a62:ea0f:0:b029:319:8eef:5ff1 with SMTP id
 t15-20020a62ea0f0000b02903198eef5ff1mr7706167pfh.74.1629268045601; 
 Tue, 17 Aug 2021 23:27:25 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id l12sm4457595pff.182.2021.08.17.23.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:27:24 -0700 (PDT)
Date: Wed, 18 Aug 2021 11:57:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
References: <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
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

On 18-08-21, 09:22, Dmitry Osipenko wrote:
> 18.08.2021 08:58, Viresh Kumar пишет:
> > What about calling dev_pm_opp_set_rate(dev, clk_get_rate(dev)) here
> > instead ? That will work, right ? The advantage is it works without
> > any special routine to do so.
> 
> It will work, but a dedicated helper is nicer.
> 
> > I also wonder looking at your gr3d.c changes, you set a set-opp
> > helper, but the driver doesn't call set_opp_rate at all. Who calls it
> > ?
> 
> dev_pm_opp_sync() calls it from _set_opp().

Okay, please use dev_pm_opp_set_rate() instead then. New helper just
adds to the confusion and isn't doing anything special apart from
doing clk_get_rate() for you.

> > And if it is all about just syncing the genpd core, then can the genpd
> > core do something like what clk framework does? i.e. allow a new
> > optional genpd callback, get_performance_state() (just like
> > set_performance_state()), which can be called initially by the core to
> > get the performance to something other than zero. opp-set-rate is
> > there to set the performance state and enable the stuff as well.
> > That's why it looks incorrect in your case, where the function was
> > only required to be called once, and you are ending up calling it on
> > each resume. Limiting that with another local variable is bad as well.
> 
> We discussed variant with get_performance_state() previously and Ulf
> didn't like it either since it still requires to touch 'internals' of GENPD.

Hmm, I wonder if that would be a problem since only genpd core is
going to call that routine anyway.

-- 
viresh
