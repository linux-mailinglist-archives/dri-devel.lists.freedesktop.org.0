Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA471A4926
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 19:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81846ED24;
	Fri, 10 Apr 2020 17:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083B66ED24
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 17:37:54 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id j16so1952372oih.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vEe+bUuvSM5gxqTCFAjWH3kYOSeAyXRq91CDiiYZ9qo=;
 b=Lv1GmCndMbWjIOzK7fAGMGkN1ZmiBBld0BOyaookcOwO6XpqDl9ErGjl9arhvksWo3
 FnCxsk4xMAa2I2q3BuBKr13siALLoCXbxTRAaliSSpZloLhKh0/tCqmMLVhy7G51RKc4
 M1nMD5MgdqeDpOrHPnKVJ2DtQlq2n/QN7HpFFiORFB6cNzXB9cNl1oJaA9EqU0xZS75K
 xJRiBNKAZC5gEFIAxREihFRVy9pQsXVgR6SY974+jEoQherCAtKWBBhutKaHFEPMSHII
 oKN+zCBL7yu2Rax1FB6mlYPWUZ8eu3K0MNTaVDueKCE3+KHWRx5QKibyk6e2WMyDDVyy
 +/3g==
X-Gm-Message-State: AGi0PubZ2P5EIaaSzgRjnmnJuWjMVvPyu/I1V61nnKlAUwCeV4uw/rjf
 JhpjsPHdkUgrXPDW15Q6+g==
X-Google-Smtp-Source: APiQypKqUHndu/sKIkbRhVVGJoZLdiyzl4gTHIVGT+0qQM7jPIkI4j/9c9wXmTpb4IZFOs8t0Mjh4A==
X-Received: by 2002:aca:5210:: with SMTP id g16mr4252721oib.174.1586540273403; 
 Fri, 10 Apr 2020 10:37:53 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id h10sm1484553otq.47.2020.04.10.10.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:37:52 -0700 (PDT)
Received: (nullmailer pid 5873 invoked by uid 1000);
 Fri, 10 Apr 2020 17:10:09 -0000
Date: Fri, 10 Apr 2020 12:10:09 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 06/22] dt-bindings: memory: tegra20: Add memory client
 IDs
Message-ID: <20200410171009.GA5801@bogus>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330010904.27643-7-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Mar 2020 04:08:48 +0300, Dmitry Osipenko wrote:
> Each memory client have a unique hardware ID, this patch adds these IDs.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra20-mc.h | 53 +++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
