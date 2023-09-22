Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281107AA863
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 07:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C42B10E06E;
	Fri, 22 Sep 2023 05:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BE410E009;
 Fri, 22 Sep 2023 05:33:29 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9a648f9d8e3so223902866b.1; 
 Thu, 21 Sep 2023 22:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695360808; x=1695965608; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3S0h9nd7busfk/UjoksU3sgQ7ASJupxUgEIGC1muITw=;
 b=hi1EUFT5b5qnbbH22Ka/Qu9WT1+MiedsFZijUwjTotIMCgWkjQyYcR1US9UpSQu/9W
 /LdrqAQtI3hR8BfWglsQ70sKHCWRMXkDqDUjrwfkSNrVlOZUuxTtTXBvccTo0x67v8dZ
 K/yOPwx9IK/vqfxJC+kObwjY2yIF4AXTEa436zQnpL0S6FpPwJexzeYVWqKgwvD+4Ta6
 EVQ1kfLyY7ojblhZvKB54YAblwPWVve3vPM6UZGfer4+FM0mPBROs09kyNlnaDv/ef4D
 UFJaC7e87mbOEJpUjAw3zNBQFhp78vDKmNluBwCOI4SXyavJfwx+m4XFZhsfdB4I4PIC
 63RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695360808; x=1695965608;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3S0h9nd7busfk/UjoksU3sgQ7ASJupxUgEIGC1muITw=;
 b=DylFPLHzezqxgAqFXTY5awJRyLq8wdFExA2Gt9eAsdUDE+FmmknGy2f9s3jn2HeIyX
 vFz76wCZcvkF55S4qyBrb1royekq+ukkUHpyysdROO3RqtgIGTpguqmQffcG+y1F3X6F
 +bnlSxUCVGJpcS89L0YHAUC8xHU4PnpEvSFwmUOPcj2DgLbqoqlPsDRptBSgSBAPNMfq
 F0gXumXBbOXXsqznLv3ZOG5b7yTHCG07sZNsX6BasHge7N5EEncZNiPyGkAUE8mcMorZ
 rhhNlf/BSz8vtYW5cghwXGNAVP3hgTQRzOL9zS/bZjrRby3ANYvcmcmuJDn853WplvJW
 Xl8g==
X-Gm-Message-State: AOJu0YwYNfFbFxQ4EelMy2KB1MtW2ULB2PWmjps5xUuC6kqXAE/z+u1s
 ZwPAGryjkqMVEfK4lWEq/JI=
X-Google-Smtp-Source: AGHT+IGmZ1JqePVML15XcG2gPt+C2duHZHJDWUa+T6Q71HokBtpH1h5swG1Szsqc6kHFRKb9dkGHiQ==
X-Received: by 2002:a17:907:770f:b0:9ad:dfe7:b362 with SMTP id
 kw15-20020a170907770f00b009addfe7b362mr6251382ejc.11.1695360807734; 
 Thu, 21 Sep 2023 22:33:27 -0700 (PDT)
Received: from [192.168.178.25] ([134.19.96.130])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a1709064acc00b009a1e73f2b4bsm2146503ejt.48.2023.09.21.22.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 22:33:26 -0700 (PDT)
Message-ID: <8be685cb-f44a-1143-60ec-d1073fda8e16@gmail.com>
Date: Fri, 22 Sep 2023 07:33:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/5] drm/amd/display: Remove migrate-disable and move
 memory allocation.
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20230921141516.520471-1-bigeasy@linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230921141516.520471-1-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.09.23 um 16:15 schrieb Sebastian Andrzej Siewior:
> Hi,
>
> I stumbled uppon the amdgpu driver via a bugzilla report. The actual fix
> is #4 + #5 and the rest was made while looking at the code.

Oh, yes please :)

Rodrigo and I have been trying to sort those things out previously, but 
that's Sisyphean work.

In general the DC team needs to judge, but of hand it looks good to me.

Christian.

>
> Sebastian
>
>

