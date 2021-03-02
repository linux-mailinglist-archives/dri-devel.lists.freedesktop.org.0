Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C567732A10C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 14:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A746E15A;
	Tue,  2 Mar 2021 13:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B436E15A;
 Tue,  2 Mar 2021 13:40:38 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u4so31343320lfs.0;
 Tue, 02 Mar 2021 05:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sy2937whkD36NnxmnEnOHu/2WmMpJHhESVIp923Q2ms=;
 b=WR417b2TXL4XluWU3Q62QUJQT2KHPwbcPUhvSl9ZQVrVxjti1bnY0rVY28lskvQOQ9
 Wd4ONpWLQsrq2U9ZfDpZJ9FfQ0enFUDeq957Rh8PhHNklfHjRCfh4w3CGHcGpKedn3JL
 JU325/yJb/LyWrSRbGakExDJSSgUVg+qczoU+PFZZ2dZHklZkgt4nYBqwUHa/sX6A7Vq
 KcMVXJKg88SR6oBSveZT8yEuJBNqlxOaa9sbDxhpRkGsJXaBT3wgy8o8QOEuUJEnZHii
 cNSLUqZnaK/Zmp1Gtp5hNnFenxB8+j+e6Auapc+QBS0WcKBPGyzm5C2dO3+rub2odxvy
 Guzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sy2937whkD36NnxmnEnOHu/2WmMpJHhESVIp923Q2ms=;
 b=TF6Klfh3Kt/mZ4HoDj0yPurw16CcIDK0IpwvWNa0ksEH1nlM7kXNIlG6J1dhdI6Gos
 XH+P1JcnsqBbxQNdMth3syA++E4mdkz5Bf3Q3WMxX61sV8kSVcDGXNao8a7/JrPxkGdQ
 zLAYwMtW37dfsvs9CSQHO+b6YUq4pvjeHqAw8rYNnPduoMSdOfPipMMaZK2Y8fiXzYEH
 9NFe62yKXwv8oaLERIy1vXsqy6cPFiDqjXXfAD7qPGSXoe42EadTI25O0rBXALK8+oN0
 fAvCV4R492+CFq63obAnHVJjg+ryICgjFa3GcmodFYfY3217Lf3slL/IXfUmFfp4Q++0
 r1Qg==
X-Gm-Message-State: AOAM5329n1ZuC3L6l+jLtt1RHm3w3AUtfuIHGoTruqIZ91FGejuB0mZu
 AHm5ZjXdCdP6QReA54Da/Uc=
X-Google-Smtp-Source: ABdhPJxRPWPVr1JuoC8bNRBtDqyUDprT1LYGiwQlldtoe/FBCoxaKt0EfpMAr+/aLHyNPv+Ih4vpaQ==
X-Received: by 2002:ac2:4ecd:: with SMTP id p13mr5165188lfr.421.1614692436754; 
 Tue, 02 Mar 2021 05:40:36 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id 192sm2462749ljj.95.2021.03.02.05.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 05:40:36 -0800 (PST)
Subject: Re: [PATCH 00/31] Introduce devm_pm_opp_* API
From: Dmitry Osipenko <digetx@gmail.com>
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
 <6bd6730c-6f4e-df93-65cd-93fa4785a8d8@gmail.com>
Message-ID: <c7a246a4-ab25-a193-f74a-98351780135e@gmail.com>
Date: Tue, 2 Mar 2021 16:40:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <6bd6730c-6f4e-df93-65cd-93fa4785a8d8@gmail.com>
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

MjAuMDEuMjAyMSAxOTowMSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDEuMDEuMjAy
MSAxOTo1NCwgWWFuZ3RhbyBMaSDQv9C40YjQtdGCOgo+PiBIaSwKPj4KPj4gVGhpcyBwYXRjaHNl
dCBhZGQgZGV2bV9wbV9vcHBfc2V0X2Nsa25hbWUsIGRldm1fcG1fb3BwX3B1dF9jbGtuYW1lLAo+
PiBkZXZtX3BtX29wcF9zZXRfcmVndWxhdG9ycywgZGV2bV9wbV9vcHBfcHV0X3JlZ3VsYXRvcnMs
Cj4+IGRldm1fcG1fb3BwX3NldF9zdXBwb3J0ZWRfaHcsIGRldm1fcG1fb3BwX29mX2FkZF90YWJs
ZSBhbmQKPj4gZGV2bV9wbV9vcHBfcmVnaXN0ZXJfbm90aWZpZXIuCj4gCj4gSGVsbG8gWWFuZ3Rh
bywKPiAKPiBUaGFuayB5b3UgZm9yIHlvdXIgZWZmb3J0LCBsb29raW5nIGZvcndhcmQgdG8gdjIh
CgpZYW5ndGFvLCBjb3VsZCB5b3UgcGxlYXNlIGxldCBtZSBrbm93IHdoYXQgaXMgdGhlIHN0YXR1
cyBvZiB0aGlzIHNlcmllcz8KV2lsbCB5b3UgYmUgYWJsZSB0byBtYWtlIGEgdjIgYW55dGltZSBz
b29uPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
