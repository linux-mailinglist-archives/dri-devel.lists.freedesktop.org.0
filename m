Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B5A2FE566
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EF26E51C;
	Thu, 21 Jan 2021 08:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5232289EA3;
 Wed, 20 Jan 2021 16:01:26 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f17so26646906ljg.12;
 Wed, 20 Jan 2021 08:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3vLouel+HcUHHsPlMzqt3dQ9xZtrUWZy628SJkSoWOA=;
 b=So3BD8K3remfQXHH4nf3lm2QXaIQO4LrSFWPfSDvDdczajiT1zZjM+X6Pyp7oVzACX
 DQUhSNJKGaVBpUrEqB2a/mHhoP+IRYbbfm6S1exUM7PYOdO46swf9U2vYc08fUMud/Om
 KNU09pGDtuJ5Vrzf8SK12hTxQWfkm/uNAwh3DapnBcYJxtZFkfX9+19cfAiUdqMhHp16
 Qh5kUbWPdBWb+x6KeA5VyA2mjFhWlxuF9ELdk4uBa2909R4NP4kq2b6Y9+Ktn17HGRJk
 Pd0gmvlCI6tzooR9HKEBx0LTif4oRiwF3FqvYNnvRW5pmoLQjfOeSrfixFQbqTUF4UZU
 rZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3vLouel+HcUHHsPlMzqt3dQ9xZtrUWZy628SJkSoWOA=;
 b=kRiV6aSp7WWWCAfIOZrwwUMGcggEPkQAhWfJTQVLZu4ugaIpwmXGlROTqr12+oOhVe
 Sql1laXrxCxarCYIyDajs9+7dLxb+eeWax88oHUnspX/4ZT3vxHdp+0q8m5oxPVDdobH
 twK9EXmJJ5TT8s4caoTZXWHK4P994B0/89sYSCUmnzMHjgAMR2ioOLnDoyAA6tUVjHI9
 JI2rBXa/yodfNQWn4zH9/HPgavz/GV8xBCOuzNPWPTQ8NO/ZTySLHruCgeWbkeNP8Qrx
 k6c6E64xLlWvaErLmqGMoFjJWrHdbJsDFhRv1FUZDT6VbPH844g7tq1ZVO3NaXSsaKMa
 0TNA==
X-Gm-Message-State: AOAM5310SAJLVa750rRdTGhbb/WzBrk07/e9FGkh7g+UqSn4qmTf79vN
 4qBADy+bOCqq839uIu1jJaselGo04uY=
X-Google-Smtp-Source: ABdhPJxufcMcdT1icHlQjBl7jPyg+FoY9nCNToNRuMAX2IYS0ZUuPjE9ss2lk3IaPlt5ucol79aNfw==
X-Received: by 2002:a2e:a310:: with SMTP id l16mr4849551lje.142.1611158484855; 
 Wed, 20 Jan 2021 08:01:24 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id i14sm234976lfo.189.2021.01.20.08.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 08:01:24 -0800 (PST)
Subject: Re: [PATCH 00/31] Introduce devm_pm_opp_* API
To: Yangtao Li <tiny.windzz@gmail.com>, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, krzk@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robdclark@gmail.com, sean@poorly.run, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, stanimir.varbanov@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
 lukasz.luba@arm.com, adrian.hunter@intel.com, ulf.hansson@linaro.org,
 vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, ddavenport@chromium.org,
 jsanka@codeaurora.org, rnayak@codeaurora.org, tongtiangen@huawei.com,
 miaoqinglang@huawei.com, khsieh@codeaurora.org, abhinavk@codeaurora.org,
 chandanu@codeaurora.org, groeck@chromium.org, varar@codeaurora.org,
 mka@chromium.org, harigovi@codeaurora.org, rikard.falkeborn@gmail.com,
 natechancellor@gmail.com, georgi.djakov@linaro.org, akashast@codeaurora.org,
 parashar@codeaurora.org, dianders@chromium.org
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6bd6730c-6f4e-df93-65cd-93fa4785a8d8@gmail.com>
Date: Wed, 20 Jan 2021 19:01:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:32 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMDEuMjAyMSAxOTo1NCwgWWFuZ3RhbyBMaSDQv9C40YjQtdGCOgo+IEhpLAo+IAo+IFRoaXMg
cGF0Y2hzZXQgYWRkIGRldm1fcG1fb3BwX3NldF9jbGtuYW1lLCBkZXZtX3BtX29wcF9wdXRfY2xr
bmFtZSwKPiBkZXZtX3BtX29wcF9zZXRfcmVndWxhdG9ycywgZGV2bV9wbV9vcHBfcHV0X3JlZ3Vs
YXRvcnMsCj4gZGV2bV9wbV9vcHBfc2V0X3N1cHBvcnRlZF9odywgZGV2bV9wbV9vcHBfb2ZfYWRk
X3RhYmxlIGFuZAo+IGRldm1fcG1fb3BwX3JlZ2lzdGVyX25vdGlmaWVyLgoKSGVsbG8gWWFuZ3Rh
bywKClRoYW5rIHlvdSBmb3IgeW91ciBlZmZvcnQsIGxvb2tpbmcgZm9yd2FyZCB0byB2MiEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
