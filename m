Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD65A474674
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 16:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5834010E554;
	Tue, 14 Dec 2021 15:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1C610E554
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 15:31:16 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b40so37464473lfv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 07:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cew1bsVh+uPPxFCPvivLMvnMySnBo7QVXMyLf4NUogc=;
 b=EIBs/m05yVAVjNZxKsVu8Oh0Ra+ssLFinvG7LKfMOy1Tb+DDQFa83JoEpSp/kyJ20f
 vtvaLZfleYaQEdO83kKRrCP8Y1G2P1VVBd1C8H/rC2FEvRABY4qZuLZF9MfzdbRNDmow
 cGRJTZrbJmdGnvJe7MN8XhbpvUlkpK10PBqiVAoE8HuxHw13OwKud0XkPDg5fcAHJYnV
 DUKRpnGNMPgJ7sbEiuJYUCWQTbbeQh0lDx39iMitKSXkglOeja3j0JlYaUtRccSzzC+C
 igtqlbPFWaGY1CMcs+PW8sdRnRh3ONs1rCgNZ4xxe4sqUVtqBu0PNS8azfyALy+nPF5r
 Y88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cew1bsVh+uPPxFCPvivLMvnMySnBo7QVXMyLf4NUogc=;
 b=4yCzHs1si+9g9/GzinPbtO0zNAzCKJzwX9PMl8TOY2UGzBF0JrWzEkoMlhkQG7Ier7
 mVRDz51wQAif0SwX/k7yiyZsHwkHj1fTmNWkjyyDHqfpslNa5mxmJVU0dQwN7IIJ41h1
 MnspzxaFVwklcW7ckuwS7mNuoSe4gMJedE10baoABPiiPvnHLseihkGg7G8PygpS3AqK
 yQwbMZ2sjIBxByMFf3A/VwPy0qBcsZeNas9ZUqoShVr8ESHL6qazlbYG2Ioz4lb+hL+X
 OrFivWUtCEkCOg7nk1PVX3ktEDRkSdGGxI/kxSKHzn4PnVGoueRy5tMnon8IY3V2ilKi
 sbRA==
X-Gm-Message-State: AOAM530S7nBmTAs1s3hpLASUM3nscjv85kzPFwN9bRKdixsXiw5zEqRW
 qATDByEC8IJMj0fdpjnS3O4=
X-Google-Smtp-Source: ABdhPJxmQNB9Dr/Fnytdwhc2WP3yKSVRtKMT+07lahidhyWpm3qWdRsLiGLH2I4Htvoh4G+FR0Ibzw==
X-Received: by 2002:a05:6512:3053:: with SMTP id
 b19mr5387718lfb.276.1639495874691; 
 Tue, 14 Dec 2021 07:31:14 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id s4sm11501lfp.198.2021.12.14.07.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 07:31:14 -0800 (PST)
Subject: Re: [PATCH v2 0/8] Host1x context isolation support
To: Mikko Perttunen <cyndis@kapsi.fi>, Jon Hunter <jonathanh@nvidia.com>,
 joro@8bytes.org, will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
 <10de82cf-27a5-8890-93a5-0e58c74e5bcc@kapsi.fi>
 <c382fb0e-6b73-5ca0-7f63-d2843351325e@nvidia.com>
 <91dddccd-a6c1-21b3-34d6-6a8082a386e7@nvidia.com>
 <a507b10b-395b-1f6d-87b9-7c7c436cab0e@gmail.com>
 <a62602df-91f6-783d-60f3-d9eba10da543@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <be8aec02-8651-0b12-ff13-237c75a5b29d@gmail.com>
Date: Tue, 14 Dec 2021 18:31:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a62602df-91f6-783d-60f3-d9eba10da543@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

14.12.2021 17:53, Mikko Perttunen пишет:
> On 12/14/21 16:35, Dmitry Osipenko wrote:
>> 14.12.2021 11:05, Jon Hunter пишет:
>>> Hi all,
>>>
>>> Still no response on this :-(
>>
>> I see only two patches on Tegra ML and others on DRI ML. Might be good
>> to start with re-sending this whole series and CCing MLs properly.
>>
> 
> All patches should have been sent to the same set of addresses. At least
> LWN's archive seems to agree..

Indeed, I see that Tegra ML was CCed and I see all patches on Tegra
patchwork, but I don't see them all on lore and gmane.
