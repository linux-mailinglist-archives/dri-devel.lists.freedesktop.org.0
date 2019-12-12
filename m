Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7504A11DF57
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA396E2C7;
	Fri, 13 Dec 2019 08:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FFF6E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 21:25:37 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m30so349669lfp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 13:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=cfioP8TA6Qxn5hTnDGWlQXnlscIlc+Oj+KVTI7nJ630=;
 b=q9ZQcchLHv3SGiyoQEHnkwKhUoakKzqNaOWbi6H59YvWZwEebPKXsi22aLIe1Hgm7k
 J5UDAYaxxcafuug8V51WlYMq0QuGKZyveBciuj9MhgkCAkjtPOhFJUSGCJZ4kpgUK1sh
 GuzOfj1opHoB9HBj1yaSd6+u51m+TD9Cn0iRKrJENFLcb6kkKWAt5eAjSd9cZUeuD4B9
 ML4vqzAxrzNBJ42Ag9TK/b6uVokS3WwNYnKTOb5Khj6hrvH4mPNziTgpsHlP2H20Jws8
 rarQ326mfbRurc1nU1D6RZ3L3skNxHVYAvl0Xy558Sgw7LD/EVFQanzccD0sRMmbEo0k
 u5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=cfioP8TA6Qxn5hTnDGWlQXnlscIlc+Oj+KVTI7nJ630=;
 b=cJ7dbU00J87RKuQ7N9gBq5nCFz/9sZjjXnJ51kz0jn9wPetaBDdQ1R9DYYCxfzHcWH
 4IvrwOwIMz4kGBo2THDvswS4FNIV3/5HGqQyL0VK/WJT3sLwaIDYu23v+O707Z7anvKm
 kwHmtNSjt/TIw2WNTSzrrmP+CsCrY68EPkaBAAj7uTvY9rqovx+olK+fC0c415JyPscT
 FWtP8f/g2ptEca/q4xlmN59G6On0NXIXfZvr3DFL56YxbSKN236Z6VKzcjTXH/0l9OmE
 77sEAVhlFu0Z4WM+dxpxN0ro3rxmi96LBNiRih4/p4WJ0IpMsxjeaYdpmLo/vqpg3CO3
 iqiw==
X-Gm-Message-State: APjAAAV5ElawY3ucv7LYfhMW+WrvaTWx8QEc+wa3OBceF3NkIBYLigDl
 T7/lSVtPiwYGHyoQn1OfskF0ZxBJ
X-Google-Smtp-Source: APXvYqzLtZroQjuryJb8lSL+00HYlTr1/QqVaJGT9/s9FSf7zMAVpREbFJwso4UUFgliw8MCeM8vnQ==
X-Received: by 2002:a19:c648:: with SMTP id w69mr6925147lff.44.1576185935031; 
 Thu, 12 Dec 2019 13:25:35 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id u13sm3496798lfq.19.2019.12.12.13.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 13:25:34 -0800 (PST)
To: Thierry Reding <thierry.reding@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
From: Dmitry Osipenko <digetx@gmail.com>
Subject: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Message-ID: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
Date: Fri, 13 Dec 2019 00:25:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thierry,

Commit [1] introduced a severe GPU performance regression on Tegra20 and
Tegra30 using.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.5-rc1&id=fa6661b7aa0b52073681b0d26742650c8cbd30f3

Interestingly the performance is okay on Tegra30 if
CONFIG_TEGRA_HOST1X_FIREWALL=n, but that doesn't make difference for
Tegra20.

I was telling you about this problem on the #tegra IRC sometime ago and
you asked to report it in a trackable form, so finally here it is.

You could reproduce the problem by running [2] like this
`grate/texture-filter -f -s` which should produce over 100 FPS for 720p
display resolution and currently it's ~11 FPS.

[2]
https://github.com/grate-driver/grate/blob/master/tests/grate/texture-filter.c

Previously I was seeing some memory errors coming from Host1x DMA, but
don't see any errors at all right now.

I don't see anything done horribly wrong in the offending commit.

Unfortunately I couldn't dedicate enough time to sit down and debug the
problem thoroughly yet. Please let me know if you'll find a solution,
I'll be happy to test it. Thanks in advance!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
