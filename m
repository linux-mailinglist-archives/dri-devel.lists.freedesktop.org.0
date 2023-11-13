Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCC47E9EFC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 15:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD90010E379;
	Mon, 13 Nov 2023 14:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CDF10E379
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 14:43:47 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32dc918d454so2660465f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 06:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699886626; x=1700491426; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vNnR04yCNnmtJJPXHpBhPgt3OU1li3/fE3RG16gZ0bU=;
 b=o2O5h7LR5K0vOqRWGQmo9yPL++PvsC8RktkVFinvg7/3CU0ad05VMskPQKO09ER2ne
 7UYS/D38uGpYHvpKW/qIJ5d3hLdiHdg27x4L7TsUai1b91RDzIKDjH1eDKIY4SOBAW2o
 lWGCP3o2gYvFAAS4bhwSpW9jjUaurG9F6CY7M8XXbtrmOouQe5W1uiuw5V5Asbg6W+uY
 H1e1uDoNYT/GPIiH4dkaOtVPAPUCogapgfLuOAkpM7AByrhosxKUatcYF3Mqa9e6LbdU
 OukSq1j2vcFr1hanYxHjI/QzfmJchZsSG8N0OXx5t9640rKfEF/0v2DVUmgT8G8iCB+e
 559A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699886626; x=1700491426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vNnR04yCNnmtJJPXHpBhPgt3OU1li3/fE3RG16gZ0bU=;
 b=HFsiT/UFndtAW7ZxSRAVWKpuXWulgCXy2bsNF0q/FLKZIbEQZIaK/C0hn3Kwp/+EYJ
 RLIYlAdeHqsBsMjDYbo2fTGS05wG7JKFVDYvkt6t45IfLG03853HdPCrm1Ps6mE77Dbk
 DkDFqotorkD1i7IzB8LtelLnni4xgzNoBxvzhc/OzhPhPnYsFvHbr/nmTPphGXtUUYJQ
 FAEwSRqOdaTIPbNNm5w5twv5rvF8kveWg6R+5gZF8CVck6mQFDn65r2w1u2EZTjVRAjE
 3heRd2dX1TrbdAh9HaxH9AmSDAFmvtgg9PpLtngJVfj/wZmJcwDagJDHtBih7w8B+AUH
 p9SA==
X-Gm-Message-State: AOJu0YzT9bTlqwPmo54+TLB7Xih52uMBRqSS3R4bg4xdPnM3uPFGFHdq
 HGZYlg6A8KQJLn2DKCbIVV3pGg==
X-Google-Smtp-Source: AGHT+IFyl4KKFJvEAx90PJK12JnmMzqY/5jHnJCgMk1zVzPkN1C68bLXevTx5IpixEgyODWdzc7+bg==
X-Received: by 2002:adf:a3da:0:b0:32f:7db1:22fb with SMTP id
 m26-20020adfa3da000000b0032f7db122fbmr4253284wrb.28.1699886625790; 
 Mon, 13 Nov 2023 06:43:45 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a05600010cb00b0032f9688ea48sm5574339wrx.10.2023.11.13.06.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 06:43:45 -0800 (PST)
Date: Mon, 13 Nov 2023 14:43:43 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v2 1/1] dt-bindings: backlight: mp3309c: remove two
 required properties
Message-ID: <20231113144343.GA264383@aspen.lan>
References: <20231025155057.886823-1-f.suligoi@asem.it>
 <20231025155057.886823-2-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025155057.886823-2-f.suligoi@asem.it>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 25, 2023 at 05:50:57PM +0200, Flavio Suligoi wrote:
> NOTE: there are no compatibility problems with the previous version,
>       since the device driver has not yet been included in any kernel.
>       Only this dt-binding yaml file is already included in the
>       "for-backlight-next" branch of the "backlight" kernel repository.
>       No developer may have used it.

I'm afraid I got confused by the fragmented MP3309C patches from all the
different patchsets.

Please can you rebase whatever is left on v6.7-rc1 and send a single
patchset with all pending changes as a single patch set.


Thanks

Daniel.
