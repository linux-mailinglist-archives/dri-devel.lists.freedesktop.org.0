Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798814C335B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 18:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E893C10ECB3;
	Thu, 24 Feb 2022 17:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5DC10ECB3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 17:18:03 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y24so5096775lfg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 09:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZEF24tzNN36Ad6E2QTpV8p5Sa4Vkb2AWklLMy5ayQGA=;
 b=WpodwI797Rwd5d3Bqh4Ioe16qGHmgCq95omZ7cEKxJIStGiKXtvn5YYQjBCG/MVoE8
 MkrwSod9DOdWu4ufQ+G6EJFktP0MI/vAE6Le/k5cqnofP06II26wzYqlo76bLeUJjd35
 2cFTI4mclwQkDi6QC3k6FkF8igTaePP3nExo/K1Ej+6j86esRvLEyiH/1ZD5jg7YCHj3
 ZS7Yl+8PEvwRYuu9QiLQUoFQ/CXYn94/JoMIK4q1YyWuDNQxlt/Fl2DvOxUalyML7Y4z
 5yi8KpjOiqVXI0B3YzIdHebbS++F8NDtdXjqDbIL3s/ck6WVzw235HOsEEA3P57iHDam
 FM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZEF24tzNN36Ad6E2QTpV8p5Sa4Vkb2AWklLMy5ayQGA=;
 b=4xBimeq7Rz8CdI6PCLWYa0Cu0cEH/mwIffvh/MDqm7e58XUwtC7w+QEpZFLXnPxsUv
 /VV7Id8U4mcypUacYxupD1ozIZX8AF7CJKAJV2oRMR6QL6XxmT4xGd97GREiyJM8IlJV
 RNDtCg7PoHRYt7+mnXWF+5hw63G5KklRFInUr6kMHwb8GnT1O/k5JxzsLFfO/FkyGqgT
 4k3l4EHeel/Ns3EqwDTZ/C7VuVWs4wFQ7VsEe6Y+qnG6/tEaIuMYGw7SIyyEg5/uD0sq
 s91msHxNORcSUIf8QHrWYXA47F0fcIUkbiuKaSIXgf4DrtJyclymNzLBBSW4cSXDpHyN
 69/A==
X-Gm-Message-State: AOAM530v4QIjNRCszw9Wqfajf1w056PoaA107i7tqnluB9UDkti+wsv5
 0dw6a4obp51BF9xwEHS2uow=
X-Google-Smtp-Source: ABdhPJwcR7KJ1sG1dWn4HB4VUsHPfcXidHtpADKlS/xYTpv7jH43cB37PGeqQzvuPx8FQvhZsYDIFA==
X-Received: by 2002:ac2:5148:0:b0:442:f24f:1aea with SMTP id
 q8-20020ac25148000000b00442f24f1aeamr2421864lfd.20.1645723081906; 
 Thu, 24 Feb 2022 09:18:01 -0800 (PST)
Received: from [192.168.2.145] (109-252-137-194.dynamic.spd-mgts.ru.
 [109.252.137.194]) by smtp.googlemail.com with ESMTPSA id
 n23-20020a2e86d7000000b002460f3e885asm20837ljj.20.2022.02.24.09.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 09:18:01 -0800 (PST)
Message-ID: <0a550dde-7c06-c61d-2cbf-e63ad1a7dcc5@gmail.com>
Date: Thu, 24 Feb 2022 20:18:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 05/25] tegra: Add flink helpers
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <20220217191625.2534521-6-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220217191625.2534521-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

17.02.2022 22:16, Thierry Reding пишет:
> +int drm_tegra_bo_get_name(struct drm_tegra_bo *bo, uint32_t *name);
> +int drm_tegra_bo_open(struct drm_tegra *drm, uint32_t name, uint32_t flags,
> +                      struct drm_tegra_bo **bop);

drm_tegra_bo_open() isn't a very good name for a function. How will you
name dmabuf and handle variants?

In grate-drive we're using these names:

drm_tegra_bo_from_name
drm_tegra_bo_from_dmabuf
drm_tegra_bo_from_handle

I suggest to use more meaningful function names before will be too late,
especially given that this is the upstream libdrm.
