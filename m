Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7E36527C9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 21:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C8110E3E4;
	Tue, 20 Dec 2022 20:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F8110E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 20:21:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b3so20379173lfv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uem/Rg0y7RK0QKRnhhb+pOTt6PVpCehNtdD/fJMouvo=;
 b=n2RYVym0j++xBdJtTs4jg7kJ6kCMuuFIVQy8UMoq3D3cChxpobhm4EnaHRumBO3T6c
 n8HhrHZRe6UaO7eYyTBwSlP+0mkd4ZkkKAb1TZx/TfXAAGhKnHcrXg3m1kSycklnNo8b
 OYuVVUb8eF4pBTGpvfC8YHlV+JPyUDc7YY9txn0/p/KOaz/Nfuej9WaP0d2ieVWP/Pf0
 ml1amYkOw92Z9rXLpnTeq+ch/Rs9y6Y/naGXrsq0C2acTynwGu7WQazalH8yD4seB8Dq
 XBPBak24O5Fmxfzm2tZTu5f/Qn3HKJKxIpGAEW0I1gDMA2K7tRMhy8/X28gncf44dScD
 QZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uem/Rg0y7RK0QKRnhhb+pOTt6PVpCehNtdD/fJMouvo=;
 b=GibxbNn9bVknYBQ+lEoJVaT57xadalk53dFvnF7JT9Kenr+U3zrHy62FgwKc3bU44/
 Q3lvnpzZpUWoS6Agh8evlCsVNU0gEQZiaMf3LIFpDbkkmBDrFdppKNIiJqEFPZYJddrs
 mAVRm0kfpIIYIlHoXqMUwDwbz/Va/NbuuKz31WQahE0PRaw6YWF+58hSJ4GqK/LMeAvz
 EslZHTt88JOVIYWOaoSE/9nTS72lfR7vyoopEOP3jjc0okpRLE8G9BH9n3B0vkY8R5O4
 +DUCiTode2sR0eLdK/1xjx16bmuqEuhHvXQpQkKEP1ejrY9sUJNRENXtv8E8VQLv8/+k
 DmIA==
X-Gm-Message-State: ANoB5pmkNWQV8yWPjS3s5gBUo9+l6Xx6FQ4Nb/TBvVQ97ZHADZxKlubm
 mWnluRvcq/KH5tfmgH1GI8k=
X-Google-Smtp-Source: AA0mqf50xiaxLBBtKZY+3R63yU+WhzuT/XVOd54mJpdrGz3UjV0WgTPmLiUveiXcBdAvF7VTtc3LxA==
X-Received: by 2002:a05:6512:260c:b0:4b5:8e1e:867b with SMTP id
 bt12-20020a056512260c00b004b58e1e867bmr16677059lfb.59.1671567717063; 
 Tue, 20 Dec 2022 12:21:57 -0800 (PST)
Received: from [192.168.2.145] (109-252-113-89.nat.spd-mgts.ru.
 [109.252.113.89]) by smtp.googlemail.com with ESMTPSA id
 s1-20020a19ad41000000b004b59c9b7fb4sm1573738lfd.126.2022.12.20.12.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 12:21:56 -0800 (PST)
Message-ID: <a99fa7e5-31bc-4286-17e5-6ba6e4932bcf@gmail.com>
Date: Tue, 20 Dec 2022 23:21:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 00/21] Add Tegra20 parallel video input capture
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

28.11.2022 18:23, Luca Ceresoli пишет:
> Tegra20 and other Tegra SoCs have a video input (VI) peripheral that can
> receive from either MIPI CSI-2 or parallel video (called respectively "CSI"
> and "VIP" in the documentation). The kernel currently has a staging driver
> for Tegra210 CSI capture. This patch set adds support for Tegra20 VIP
> capture.
> 
> Unfortunately I had no real documentation available to base this work on.
> I only had a working downstream 3.1 kernel, so I started with the driver
> found there and heavily reworked it to fit into the mainline tegra-video
> driver structure. The existing code appears written with the intent of
> being modular and allow adding new input mechanisms and new SoCs while
> keeping a unique VI core module. However its modularity and extensibility
> was not enough to add Tegra20 VIP support, so I added some hooks to turn
> hard-coded behaviour into per-SoC or per-bus customizable code. There are
> also a fix, some generic cleanups and DT bindings.
> 
> Quick tour of the patches:
> 
>  * Device tree bindings and minor DTS improvements
> 
>    01. dt-bindings: display: tegra: add Tegra20 VIP
>    02. dt-bindings: display: tegra: vi: add 'vip' property and example

This series adds the new DT node, but there are no board DTs in upstream
that will use VIP? Will we see the board patches?

In any case, given that you're likely the only one here who has access
to hardware with VIP, you should promote yourself to the tegra-video
driver maintainers and confirm that you will be able to maintain and
test this code for years to come.

