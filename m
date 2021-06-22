Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0851B3AFB91
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 06:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D61189ABA;
	Tue, 22 Jun 2021 04:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8FC89ABA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 04:03:44 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id p13so15434882pfw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 21:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fDlc9TgaOD99jTxAWrDaocLPhWL0A0Lj9SHYh7Mvk9o=;
 b=o0yFPlq7pxYmbagKCCg+kimNiPNQn/TmmpLhgBCc4+gKAdI7guTaFh2HLcqRgOS+Y2
 N31G1dYSTwJFSZONsIs6aTmlvFyMWs7sUSs6w5r2lIeIl7U7eAi64P51JFyLNIVopMIe
 clgwoPZrwBAPqe177UXF7XDOkjJEPcpxs/DLMSjcqe+emsSTFic8ZBcNj2+ZCBmsRZSL
 pIaW4QYUGKMmZVLpKimMt2ZiXi24RBko8/fxW56iwZZhUKa4Z5Yz0RJB7pLrd6CGGysv
 4XFfuEt1cuayw5S6wYtqWNXLKq10QMJK/uZ2WyJulx4ckrvePNwDHZkP4e9ANEJGr9uu
 3nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fDlc9TgaOD99jTxAWrDaocLPhWL0A0Lj9SHYh7Mvk9o=;
 b=n3gCvWngsnDWp74K6Rj99AMirjFvgoeBjNezkoeUB6M/3QUW/JSlayPrsMFh94pTPx
 nvmljsXWEGBEJ5ST2Nd9mVSquKFN79K6Z1elz93d0WH549PoCQupvRBWZ5B4dcZObWRL
 oiUlM1OUjtCvjvEKdr0p3eqbUDI2CvdY9Du9suwSUT5WvGvGk8KjuX8t79a46krlaFmx
 uvzqzt3dC/IUqUDlOGh6uKleUKxzGGI545sW/HlAfqK+jFQq/KkaTfawiRVvBWIts8wU
 paTMLUfgzC5Z5yyDiA0kf/xpUp0DCv4jyLXg1rfkTSRL1sUtZX1PxYYnKBJ43ORiL0cz
 3RpQ==
X-Gm-Message-State: AOAM531bWgrjuHdivtdeJ+R06IzHLlm2xBRbYxMG+U5u1fk79K4gm5fH
 ay5Pc5GZZAyl6aewnZLY7Yld1Q==
X-Google-Smtp-Source: ABdhPJyDcxIlsiXjWflxT5mU0F4cuX1u87XCPF+dYg++suxUBJdfPBs1yWMuqJH0lAgAd7Abm8KHjA==
X-Received: by 2002:a62:b618:0:b029:2f9:f3b1:8afd with SMTP id
 j24-20020a62b6180000b02902f9f3b18afdmr1572467pff.81.1624334623646; 
 Mon, 21 Jun 2021 21:03:43 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:5192:32ad:e5be:23cd?
 ([240b:10:c9a0:ca00:5192:32ad:e5be:23cd])
 by smtp.gmail.com with ESMTPSA id 20sm16946099pfi.170.2021.06.21.21.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 21:03:43 -0700 (PDT)
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
From: Esaki Tomohito <etom@igel.co.jp>
Message-ID: <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
Date: Tue, 22 Jun 2021 13:03:39 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Enrico Weigelt
Thank you for reply.

On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote:
> On 21.06.21 08:27, Tomohito Esaki wrote:
> 
> Hi,
> 
>> Virtual DRM splits the overlay planes of a display controller into multiple
>> virtual devices to allow each plane to be accessed by each process.
>>
>> This makes it possible to overlay images output from multiple processes on a
>> display. For example, one process displays the camera image without compositor
>> while another process overlays the UI.
> 
> Are you attempting to create an simple in-kernel compositor ?

I think the basic idea is the same as DRMlease.
We want to separate the resources from the master in units of planes,
so we proposed virtual DRM.
I think the advantage of vDRM is that you can use general DRM APIs
in userland.

> I don't think that's not the way to go, at least not by touching each
> single display driver, and not hardcoding the planes in DT.

Thank you for comment. I will reconsider about DT.

> What's the actual use case you're doing that for ? Why not using some
> userland compositor ?

I think when latency is important (e.g., AR, VR, for displaying camera
images in IVI systems), there may be use cases where the compositor
cannot be used.
Normally, when the image is passed through the compositor, it is
displayed after 2 VSYNC at most, because the compositor combines the
image with VSYNC synchronization. On the other hand, if we use vDRM, the
image will be displayed at the next VSYNC, so it will be displayed after
1 VSYNC at most.

Also, since the compositor is a single point of failure, we may not want
to make it dependent on it.

Best regards
Tomohito Esaki
