Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014F86FF42
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F0410FF8C;
	Mon,  4 Mar 2024 10:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hehNFxQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F4E10FF8C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:41:35 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-33e2248948bso1279131f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709548894; x=1710153694; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vrHtVTxDzXnHnmBEAwyW6CZO5Ixx5yRmkfq/0NawaJY=;
 b=hehNFxQQ3KWg/H1StI7PfvMtVR3M+4MTFpqy3nLvDMWfARvmiii+yepNlWjG7/2+Hk
 BhhQxInlEfQnVRmVUdyxIlRCjagVrC5WGoXhLx07KW4Sk/qB2wxDFTcQ6JP56EpfSC4I
 JRVNkWKsl5uwl8bo+ZsTEjGJnWt9ydfo2W3lEQOY5Re3PPWLuNrRM2CbBQPdYrjB4Fyu
 l8B6e/jdATN7RZtKSjxkhCiG1eRmwKpEMzes4QYQcfs5UrVuQ75KWt+EW53mSEAZdD3c
 wuwcbjzesqkboT21IL3slvyvWmi6OHO5CHXDuMJfO6hHipu0L5RL14RIP5FwZaOfKbHe
 CFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709548894; x=1710153694;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vrHtVTxDzXnHnmBEAwyW6CZO5Ixx5yRmkfq/0NawaJY=;
 b=W49Gae6OMTNjFNS0ElfZm4pFiYAKT6UXhWRJzlnkAqBkrlhifg1AV8cwutCfcboX8V
 BCrkDy6kU51MAZeFjjus17ne19Mq9FHEjeYVA/im3Scz+mvpCXYZUsLdff8TbB+myzrh
 iTieXNFMzlHWp2elN9JDDuvmakIxG1OnQN9cO3OlNyHt4lRPTvnfU+zdZSmSKxjHebly
 3T3MkapMTGRzFTtNa69Q8AyTP8p+aZPwsnyALXJNQLGPlHT1wGSKWMVNtENNiPyhhggs
 MIShpEueY3uefanEvU1l6rWatXwTFffgUsSarFMpCqYe0hx+bZoRWMoz8huyld2b6Dvv
 5MHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi2dVvoKdTi6IUi3O2H++e0OEwNbTNDeixymaEn/xdZcozRVX/QVbg1+mCqk4qLEtB+G4UEHE/iEMf5vurl64k6n+nyEctlM5IGhl4IzaA
X-Gm-Message-State: AOJu0Yzk50JQnGWGPoYhexqTnG5ay0CGnOYxx5uwY1Hfn7COpqIlZVeZ
 QqLfGoMCAIpfbLg3H8/9qKvokjU/RNMjs5TNSQUVS95wnsZm8bW9o7RiSyHxq40=
X-Google-Smtp-Source: AGHT+IHuTg+L0d+SsYB/hWx+WCbqqhs4YKUOH7u+m5Pfe3qeJQEf5b9S71I7FIfRX9NDNXPeyFgP4g==
X-Received: by 2002:a5d:6986:0:b0:33c:ec8f:7b51 with SMTP id
 g6-20020a5d6986000000b0033cec8f7b51mr6513642wru.16.1709548893708; 
 Mon, 04 Mar 2024 02:41:33 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bp16-20020a5d5a90000000b0033e0567e90bsm12266311wrb.5.2024.03.04.02.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:41:33 -0800 (PST)
Date: Mon, 4 Mar 2024 10:41:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] backlight: bd6107: Handle deferred probe
Message-ID: <20240304104131.GC102563@aspen.lan>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
 <20240304-backlight-probe-v1-3-e5f57d0df6e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-backlight-probe-v1-3-e5f57d0df6e6@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 04, 2024 at 11:11:40AM +0100, Krzysztof Kozlowski wrote:
> Don't pollute dmesg on deferred probe and simplify the code with
> dev_err_probe().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
