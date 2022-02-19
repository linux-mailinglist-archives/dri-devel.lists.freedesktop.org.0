Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84854BCA4E
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 19:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8A610E1CD;
	Sat, 19 Feb 2022 18:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666CF10E1CD
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 18:54:23 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b9so11337495lfv.7
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 10:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=Ci6QRGwAlkUphSDT6SSS26W4w72+zrbvF3RFtSti1zA=;
 b=hxmOALR7fu4NSCDBQpNlkYo3cbQuBRUGBm6lqCfXOABtakxfFcfezKMvO+rZUKfYYB
 K7nd2fsc2Y2y8Fo3EbiQKJsxIpdlW68MopfYn9lH59b5EvdJSK/rc2co4kiBiHTMCxJr
 5mixYHCQduWGM1vSXhLxd7X44w9m6tHtBzUxgCM5DcUFR6pfYQFRDt1VBtXLR1G6ZMkA
 AWDtx6ST7x2efloQyAMVCN7wXJfIUwUAAApgInco0cEY8j5L/B6gEXM3Qv/aViH93nPc
 ku0aOl5uiULvMBHjnODgB2UFdF1T4J1TGbSbktZ4H9hnay+tfEw7SGlajbPSd69mgFyN
 sy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Ci6QRGwAlkUphSDT6SSS26W4w72+zrbvF3RFtSti1zA=;
 b=zwODtHntJSGL4K1BGjDNGJi9S0Z2LFJAle5OQCVow+TKTDN2UZ04lrGiQVVlwyJqNp
 es0TOMqZhSszvM4PGZnLSZWFDPzzUsFGMy1HUdnbGoU2k5hIKpHmMF7LF5hAClnJ9aUT
 Sv0cdQ+zSdrGMKKuQJ06XCMjyVgHI8N1gojoV+1igDod0S7tHt0WzTrLBftAyTsYpZWZ
 e7deg0ldCW/fOLUOMvcjt6KwcSOBE0luWL9X/sWHALNyhWjIx1+f3L2eMaULh1wdfIlx
 iE91WbHaEw/GdwVVRnDQ/QT+PYHaq6QYzhJNfQ0D0epPHA82G4lk9/c1B7/OK5jXkm2a
 vz5A==
X-Gm-Message-State: AOAM531YhN2XU0fQysG3bEI4kY9jzPqlQKiIjKQg0ZKrc1ks/l1OrETY
 W6UAtc6UazqUs8bzYrpQ1iQ=
X-Google-Smtp-Source: ABdhPJxmMnmGlPqJgyh+vYOuXmx5fXZ96x5FviI71xKObjIWMROoDlv5HlFyEEe4tE1z3VFN7Oh3sg==
X-Received: by 2002:a05:6512:220b:b0:443:3113:ef90 with SMTP id
 h11-20020a056512220b00b004433113ef90mr9303085lfu.475.1645296861746; 
 Sat, 19 Feb 2022 10:54:21 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id h11sm638555lfr.208.2022.02.19.10.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 10:54:21 -0800 (PST)
Message-ID: <7f4e4c47-59f1-1def-36bf-a2ded912f76d@gmail.com>
Date: Sat, 19 Feb 2022 21:54:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 8/9] drm/tegra: vic: Implement get_streamid_offset
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-9-mperttunen@nvidia.com>
 <b1df816b-6838-c435-1a23-5029144e4cfe@gmail.com>
In-Reply-To: <b1df816b-6838-c435-1a23-5029144e4cfe@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

19.02.2022 21:49, Dmitry Osipenko пишет:
> 18.02.2022 14:39, Mikko Perttunen пишет:
>> +static int vic_get_streamid_offset(struct tegra_drm_client *client)
>> +{
>> +	struct vic *vic = to_vic(client);
>> +	int err;
>> +
>> +	err = vic_load_firmware(vic);
> 
> You can't invoke vic_load_firmware() while RPM is suspended. Either
> replace this with RPM get/put or do something else.
> 
>> +	if (err < 0)
>> +		return err;
>> +
>> +	if (vic->can_use_context)
>> +		return 0x30;
>> +	else
>> +		return -ENOTSUPP;
> 
> If (!vic->can_use_context)
> 	return -ENOTSUPP;
> 
> return 0x30;

and s/ENOTSUPP/EOPNOTSUPP/
