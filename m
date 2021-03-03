Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DBE32B5F2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 09:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F9B89E39;
	Wed,  3 Mar 2021 08:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E8689E39;
 Wed,  3 Mar 2021 08:31:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id v9so17989068lfa.1;
 Wed, 03 Mar 2021 00:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dA8KKHZiMQ0M1dMyQ+8WM+bKH9WXXF3VYD9qxoBSYVM=;
 b=Q2BL7+lc+ylMlu+ydH2KPz1PqTODp5OqgVZiHR9jqO4OZm50aqIxSjjmz78JiiooFH
 i7YC35lXSOUX9yg/ckanbCMcDnIlEnFIWaLOgdtj+UDXrH5hO9M8tW0d4lY0F73Zgtv0
 EP4JLr8ALm6ZBEyiThejlCrrfIVjY9pIOHj19FhIOTMenDf39h9gGiIWXvyNDLGkM5mo
 m/2nGyP009dWktprR8h6cgF5Vdo4NdkfBfb3BDPwDqJkwoi523txy9Y1R+1aHRYDxFMU
 pbUa9veKiX8fC3Qy7J68bxgQZFZPn42rhUh6PUmrP6NqhAMjEwXXM5pQ+2lI5jRGc3fG
 Miaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dA8KKHZiMQ0M1dMyQ+8WM+bKH9WXXF3VYD9qxoBSYVM=;
 b=O8tSQm2rEWF+y/zOCKn3nfGRy0rbv9wfk83b5G6xYk1CVjaxTQst83QlT/DZX9TyLL
 YWmn5lxh3SR6/sj5atoE9LursAebKnNKftuxsap+QUcOxjE5CobSFmbNK/0j87MXinMg
 yyAjePOY6cM5ROZCSBebQesgCyX6aX1uedSVzqUB4mzx+iaTFXruPK1l+LhUk534gl+4
 6twKH6liHUcjo0tTu94UEC7FDLlpyH2r2SQ57CT/59I5kS5XFtFd9OjSYAV65pmkU1N9
 lOug8sW3L6yqWPTL4hag8elcQMqg7DSWqGh96pJGCAgVO3LTzJOhUGWkBDohcTponcK6
 JlGw==
X-Gm-Message-State: AOAM532o+bGFZLxdWCFTnWzhk6lhYqB58E7e+hSKMkPM6fXk4MczXvOI
 y3Dr8GyRrKT2pYUkTqE0AaQ=
X-Google-Smtp-Source: ABdhPJyVYXtuCpQJixD14PrCS9E2RYkwzmpI6ancOTzzhejj1erUKOBHDXNJht8WUd/TI7wGU6pDCw==
X-Received: by 2002:a05:6512:110b:: with SMTP id
 l11mr15110220lfg.468.1614760301712; 
 Wed, 03 Mar 2021 00:31:41 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id 192sm2767251ljj.95.2021.03.03.00.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:31:41 -0800 (PST)
Subject: Re: [PATCH 00/31] Introduce devm_pm_opp_* API
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <6bd6730c-6f4e-df93-65cd-93fa4785a8d8@gmail.com>
 <c7a246a4-ab25-a193-f74a-98351780135e@gmail.com>
 <20210303040119.hpeybankxph4fyuj@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9e5edc16-abfa-632b-97e9-1367c24ef8bc@gmail.com>
Date: Wed, 3 Mar 2021 11:31:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210303040119.hpeybankxph4fyuj@vireshk-i7>
Content-Language: en-US
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
Cc: nm@ti.com, ulf.hansson@linaro.org, gustavoars@kernel.org,
 jirislaby@kernel.org, airlied@linux.ie, linux-mmc@vger.kernel.org,
 stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 bjorn.andersson@linaro.org, natechancellor@gmail.com, thierry.reding@gmail.com,
 tongtiangen@huawei.com, groeck@chromium.org, marijn.suijten@somainline.org,
 steven.price@arm.com, mka@chromium.org, chandanu@codeaurora.org,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jonathan@marek.ca, cw00.choi@samsung.com, adrian.hunter@intel.com,
 vireshk@kernel.org, linux-pm@vger.kernel.org, kyungmin.park@samsung.com,
 krzk@kernel.org, jonathanh@nvidia.com, Yangtao Li <tiny.windzz@gmail.com>,
 myungjoo.ham@samsung.com, alyssa.rosenzweig@collabora.com,
 linux-serial@vger.kernel.org, airlied@redhat.com, smasetty@codeaurora.org,
 linux-imx@nxp.com, freedreno@lists.freedesktop.org, kernel@pengutronix.de,
 tzimmermann@suse.de, linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, jcrouse@codeaurora.org, broonie@kernel.org,
 rikard.falkeborn@gmail.com, kalyan_t@codeaurora.org,
 linux-tegra@vger.kernel.org, varar@codeaurora.org, mchehab@kernel.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 akashast@codeaurora.org, rnayak@codeaurora.org, parashar@codeaurora.org,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, rjw@rjwysocki.net, agross@kernel.org,
 harigovi@codeaurora.org, linux-kernel@vger.kernel.org, miaoqinglang@huawei.com,
 hoegsberg@google.com, yuq825@gmail.com, ddavenport@chromium.org,
 masneyb@onstation.org, shawnguo@kernel.org, georgi.djakov@linaro.org,
 lukasz.luba@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDMuMDMuMjAyMSAwNzowMSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMDItMDMtMjEs
IDE2OjQwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDIwLjAxLjIwMjEgMTk6MDEsIERtaXRy
eSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4gMDEuMDEuMjAyMSAxOTo1NCwgWWFuZ3RhbyBMaSDQ
v9C40YjQtdGCOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaHNldCBhZGQgZGV2bV9wbV9v
cHBfc2V0X2Nsa25hbWUsIGRldm1fcG1fb3BwX3B1dF9jbGtuYW1lLAo+Pj4+IGRldm1fcG1fb3Bw
X3NldF9yZWd1bGF0b3JzLCBkZXZtX3BtX29wcF9wdXRfcmVndWxhdG9ycywKPj4+PiBkZXZtX3Bt
X29wcF9zZXRfc3VwcG9ydGVkX2h3LCBkZXZtX3BtX29wcF9vZl9hZGRfdGFibGUgYW5kCj4+Pj4g
ZGV2bV9wbV9vcHBfcmVnaXN0ZXJfbm90aWZpZXIuCj4+Pgo+Pj4gSGVsbG8gWWFuZ3RhbywKPj4+
Cj4+PiBUaGFuayB5b3UgZm9yIHlvdXIgZWZmb3J0LCBsb29raW5nIGZvcndhcmQgdG8gdjIhCj4+
Cj4+IFlhbmd0YW8sIGNvdWxkIHlvdSBwbGVhc2UgbGV0IG1lIGtub3cgd2hhdCBpcyB0aGUgc3Rh
dHVzIG9mIHRoaXMgc2VyaWVzPwo+PiBXaWxsIHlvdSBiZSBhYmxlIHRvIG1ha2UgYSB2MiBhbnl0
aW1lIHNvb24/Cj4gCj4gRG1pdHJ5LCBpZiBZYW5ndGFvIGRvZXNuJ3QgcmVwbHkgYmFjayB0aGlz
IHdlZWsgd2l0aCBhIHByb3Bvc2FsLCBwbGVhc2UgZ28gYWhlYWQKPiBhbmQgcmVzcGluIHRoZSBw
YXRjaGVzIHlvdXJzZWxmLiBUaGFua3MuCj4gCgpBbHJpZ2h0IQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
