Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D422E91F0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6389889D61;
	Mon,  4 Jan 2021 08:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACC589B8F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 07:29:12 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id be12so14097984plb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jan 2021 23:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6Zvxtbmv5cjWfnu1yO+roj3Dc1+V/ym+utFrtEq4q1w=;
 b=yUnt4D9QZPzTzHiQfNHCY4vTXTpeUS/UUfHnzvHnrTWEugOOWnaZGI954o2u3qkZuY
 fImRZTEb3rwAFcY1KurJl4B9HCpMlf1QRzxWRG67NvMSD0ZjvVwZvCrN7dmy+kMV7xG+
 yQ7zW1YERjJQVLO3Ba4i4zHq1VMVq5CCSlT+yHhOja2+p6brdVyQnzIVtgOQLb0qN1cM
 fWEQvPM/g0d0JCo8yoeZI6QjtX3OaB47hiPe7pIic6MgwP6hltnXkl4DxNtTLExxU+Je
 DGAHwsSoJapNF2ij8MvE/M4u1Qt9idjEjKXj6uQiJOBUlB93wOX9oaiaQZaA8BMQfEyx
 D22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6Zvxtbmv5cjWfnu1yO+roj3Dc1+V/ym+utFrtEq4q1w=;
 b=c3EfDFSlFghoPSLGIOq/gUFaTDEbP41byGkO3nSoqoA13TeB/yItu5fhq4KuuRP0Gk
 KLMq+MBgCazQ2+dOhmLCvSJX0XNtG5ewcDzCkcfzGYsbs6/JlxhcD0pI3lBJL8TbYynx
 cCAG3jr6YJg6oCF+z1LLj+MKbVaQITrsMJJE6m45dSv/rigt/ObQep+xkUujk7wgtyMv
 UohC8bKwrImknSZozGlPWtaEUZQ57QLrmHTuyFUJ5sJaxjl4B9pvlu4i82REWkuAi7Hn
 wDYbxZJzXSaPLOcJL4G5aNTIDOrgeN5Zs0WtUqoypOTEa7O1Sga7Lg0FhNmgax6c/5ak
 sgsg==
X-Gm-Message-State: AOAM531dKzeEIBA18qBFDfy1u0TzffVgpw8q0Uv634soHlsGcsnzRYg7
 CM/FaAsDdY8Qvr4uPsviqwPKnw==
X-Google-Smtp-Source: ABdhPJwV300N5jYEvScTM6CF7cxYiELUrIBZ9hm6pD5g6IeJYKyQcCAUKuneByouRbQaXtOx/PQf3g==
X-Received: by 2002:a17:902:59dc:b029:da:84c7:f175 with SMTP id
 d28-20020a17090259dcb02900da84c7f175mr48374386plj.75.1609745352302; 
 Sun, 03 Jan 2021 23:29:12 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id o9sm21032135pjw.9.2021.01.03.23.29.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:29:11 -0800 (PST)
Date: Mon, 4 Jan 2021 12:59:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 00/31] Introduce devm_pm_opp_* API
Message-ID: <20210104072909.7bdkvckkmddsgqnj@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
 digetx@gmail.com, steven.price@arm.com, mka@chromium.org,
 chandanu@codeaurora.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jonathan@marek.ca, harigovi@codeaurora.org,
 adrian.hunter@intel.com, vireshk@kernel.org, linux-pm@vger.kernel.org,
 kyungmin.park@samsung.com, krzk@kernel.org, jonathanh@nvidia.com,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, linux-imx@nxp.com,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, broonie@kernel.org, rikard.falkeborn@gmail.com,
 kalyan_t@codeaurora.org, linux-tegra@vger.kernel.org, varar@codeaurora.org,
 mchehab@kernel.org, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org, akashast@codeaurora.org, rnayak@codeaurora.org,
 parashar@codeaurora.org, tomeu.vizoso@collabora.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, rjw@rjwysocki.net,
 agross@kernel.org, linux-kernel@vger.kernel.org, miaoqinglang@huawei.com,
 hoegsberg@google.com, yuq825@gmail.com, ddavenport@chromium.org,
 masneyb@onstation.org, shawnguo@kernel.org, georgi.djakov@linaro.org,
 lukasz.luba@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01-01-21, 16:54, Yangtao Li wrote:
> Hi,
> 
> This patchset add devm_pm_opp_set_clkname, devm_pm_opp_put_clkname,
> devm_pm_opp_set_regulators, devm_pm_opp_put_regulators,
> devm_pm_opp_set_supported_hw, devm_pm_opp_of_add_table and
> devm_pm_opp_register_notifier.

You can't put so many names in the cclist, we are getting failure
messages while replying to your patches now.

Put all people you want to inform in the bcc section and only the
important ones in to/cc list.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
