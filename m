Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB3463ED7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 20:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0AC6E20B;
	Tue, 30 Nov 2021 19:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F7F6E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 19:49:21 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b40so56622152lfv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 11:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8K75pVFsuu8ZCXFfc/CjEJw0NCecB4BfF8ToqD8iFqU=;
 b=mNBFAamRrWUChcG1gwN2S41gFDJuZl+hJqwDvHWXC1pAjUfZ73Qy7FxUF/+msZIqt4
 xSsRIv2kantBGIJ0Po01y2iiGpz2kjnLf20fHkcUZvoI1JCdBdzvzUuimKkTJfqnmfvV
 V53d3TdLXTfTH0MQeuuIO3E94J0MahA5HOrJN+3qTLc/IMYdKIWWOWnIdBNEiLskcAt+
 Yt53OOWFGel2vvm4YfCm3MhTFityzuP0epHuFa7MtFZK2wyJc8XTWasVmWT205/OnjR4
 xs5cyLh1aOdJ0J2POgs5DoAOYUYd1H/B9DZAfmZ5RjW37BGEH6HUA5DGp9l0WRZgDl7F
 jMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8K75pVFsuu8ZCXFfc/CjEJw0NCecB4BfF8ToqD8iFqU=;
 b=tjVQthaCdugdgRR+iHzm9Dqq19opEEuw8tHtRhOCOJs29x5kXZjQJ6mi0EY5SWVM0t
 42vyfv1CjHFNR/fWN3L0RWerdBLRX6JewIGllTviC+T8FrcgYsg+yMLn0sp7QuEwy9Hu
 Two1ZpGzk/2ycGBBYivS/ZraSjSdDwIZsW+VSXk4lPLbhTDHsDbtrLwfjAY+e0IGH8DI
 QCeUZsuAh0DfIoyDzMU1wNBeJUHGQ4i3mMNJns7SYu/ebfGno54viY5IiRJLCreH6tQS
 RtlPSP6P1tnMONc9Mz9XYYTMAP1VdlFVAEjjGu8fk6BPMex4+rZO9S9yqBiXBVPUwhXK
 G4yQ==
X-Gm-Message-State: AOAM530LIySJph084rl0i19/87YLDeWcJBUX+yu82MepwoTLBXOcOsVx
 AzbHma6KOR3lPTkjkAEi8k4=
X-Google-Smtp-Source: ABdhPJyfLfsplPH1dyeuTC5k0IL6oVboNjjg/uJwyDib4wGkyfThoCn7gWsr6OdT6/+lwmdIYoxq2Q==
X-Received: by 2002:a19:48d7:: with SMTP id v206mr1311365lfa.102.1638301759348; 
 Tue, 30 Nov 2021 11:49:19 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id d39sm1814715lfv.78.2021.11.30.11.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 11:49:18 -0800 (PST)
Subject: Re: [PATCH v1 1/2] dt-bindings: sharp, lq101r1sx01: Add compatible for
 LQ101R1SX03
From: Dmitry Osipenko <digetx@gmail.com>
To: Rob Herring <robh@kernel.org>
References: <20211114200717.28986-1-digetx@gmail.com>
 <20211114200717.28986-2-digetx@gmail.com>
 <YaVG93LCF6MQYiSi@robh.at.kernel.org>
 <a8f05850-1c18-1a7d-e529-08d9a6bd9923@gmail.com>
Message-ID: <1420eb9f-c5d9-c9c3-b71f-37f4f3475c67@gmail.com>
Date: Tue, 30 Nov 2021 22:49:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a8f05850-1c18-1a7d-e529-08d9a6bd9923@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>, linux-tegra@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

30.11.2021 18:54, Dmitry Osipenko пишет:
> 30.11.2021 00:32, Rob Herring пишет:
>> On Sun, Nov 14, 2021 at 11:07:16PM +0300, Dmitry Osipenko wrote:
>>> From: Anton Bambura <jenneron@protonmail.com>
>>>
>>> LQ101R1SX03 is compatible with LQ101R1SX01, document it.
>>
>> Then sounds like '"sharp,lq101r1sx03", "sharp,lq101r1sx01"' would be the 
>> appropriate compatible value. Do that, and you don't need a driver 
>> change.
> 
> Apparently you're right. The "sharp,lq101r1sx03" should be a slightly
> improved revision of "sharp,lq101r1sx01". I see now that LQ101R1SX03 is
> sold as a spare part panel for ASUS TF701T, hence these panels should be
> entirely compatible with each other.
> 

I mixed up the panel model which TF701T uses.

I compared datasheets of both panel variants. These panel have
differences in the pins configuration. Hence panels seems aren't
compatible in terms of hardware integration, although the difference is
small. They should be compatible from software perspective.
