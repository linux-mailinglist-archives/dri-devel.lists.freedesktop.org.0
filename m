Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0931845E3BC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 01:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29C16E20E;
	Fri, 26 Nov 2021 00:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086E36E20E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 00:37:39 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id t11so15429338ljh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 16:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nMCkcNkVJHrUMMEDkKpjCXIAHsxHK0m1G/QamSr9K6g=;
 b=UOqnunqsnMn5D9EP50S6+aOvQtPLUoltWmiTz6HxAhNzfbeySPSOPGeOl6o9gABXgU
 R4ubclYHdlRX/BhMdfS1jWkG+fx/GwEjHYhLmMyhYRbVU5p2soAScnBgla+f61DspLaW
 QvobT/wWL/czGrNtFt6a5rHvXebhv8swzGkNZJ6DFxe41OVxtfJs5md2N7rp0rN2Zdx8
 wMILAGpUX4RVGbQ+122bfZuPENrC4mmZq/HHdW7BujRF/sVVeOFFYgRyChokKnOP9JlX
 mBxaFOVisanu7dN4p6ozGotLMcmu+jTYYrUalnhR9hvpXuj3j0qijHE1mQwao6xSQv/B
 xJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nMCkcNkVJHrUMMEDkKpjCXIAHsxHK0m1G/QamSr9K6g=;
 b=epkJnPpIf/r8MkmQTYjqE85Q1n+1P7neLpUybDullKPclS2BRPlOcwtXuHH/etPoJb
 qpAEaNLSVNZ6IzslZfeVMGt4wjSjX9/nI9p+UB9/OthC4Hl6dw0Nl3r2bcACRsi6MMvy
 fZYGOWZcfkE0/VYvpP0SZ9adEAyTh0KW4pqn7Z4L+l9waDMVlrUtRpX0s9relrA/nSsu
 1yAbanV2I4sQSXwe8lsXnsgsaSniIqZXaJq5Ao2G1TJAc9RWatbecxjsLLJUvcnTXmQ1
 TJSMQ0YhKO10Ko+fAInoHfyocagI0LVCZkOQffu1Z/Q/Kxc7qAE+7MyFu2lkdOa11amj
 VwvQ==
X-Gm-Message-State: AOAM531CwKh45VCEEEu/Jcr44G+pblqUluTa34DZ23bOniViK8lQTWcz
 ugiVurm/saebyHoScIM3sx8=
X-Google-Smtp-Source: ABdhPJyRX2L7hSbd3SNG4rggc/Cqlf6BaeolJPYAw1mQLBCAr4IT8k78ET/p4iE+e6YKJMpdWksvAg==
X-Received: by 2002:a2e:a4ba:: with SMTP id g26mr28851298ljm.152.1637887057377; 
 Thu, 25 Nov 2021 16:37:37 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id e5sm377433lfs.51.2021.11.25.16.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 16:37:36 -0800 (PST)
Subject: Re: [PATCH v4] i2c: tegra: Add the ACPI support
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Akhil R <akhilrajeev@nvidia.com>
References: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VfPPpTNCaM+GhcqZS53ts-20GBzm+4OWLAjND=z79pgxg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <aa63a45d-43a0-9aaf-cad3-2f4f66d707e7@gmail.com>
Date: Fri, 26 Nov 2021 03:37:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfPPpTNCaM+GhcqZS53ts-20GBzm+4OWLAjND=z79pgxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

25.11.2021 22:28, Andy Shevchenko пишет:
>> -       err = reset_control_reset(i2c_dev->rst);
>> +       if (handle)
>> +               err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> Does it compile for CONFIG_ACPI=n case?
> 

It compiles and works fine with CONFIG_ACPI=n.
