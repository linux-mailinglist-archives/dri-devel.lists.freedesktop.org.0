Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB85D589FCC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 19:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA7BA17ED;
	Thu,  4 Aug 2022 17:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC794A17D8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 17:17:40 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id dc19so418593ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 10:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=W3oQTjR935kyPwW8JTzNphawSp0RrVbBZvc3FA95SqM=;
 b=CXWDpj8EE+E/y1A4LLIdWpEV4dz6BU5+YOyxOh/YLtPkJwFlBJB1T2YAT5I0CWpJbm
 VVDqDcqzQQ8s3ioCrfGbckfIaXDN/DMIQcyKDaq2cGGklhoikD/bu8Yh47Rv2wLjHhXb
 ti4AKQ9roXLqZxh+MOQdxpogEjPOBzv2zGxt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=W3oQTjR935kyPwW8JTzNphawSp0RrVbBZvc3FA95SqM=;
 b=SWth4K1PSTkF+5TDmvL2Vq+izAqPqCMFqMuMhEy7bKz0MN0RShbLSaHWU307teHVK+
 P3Yvem1i75laPwmIITuphjCcn6FaEazNLc5yj4DN/aODRwYw6NUtHtJ855KJI9jWxMgF
 e1MkcxqDFH5vsYmEk5NGaLNNFapeHnYyNVrUTh6/zj8i+PbrzPuILSgnEYcaybC6OFad
 lI2w+/f00S+Kf5fkdBFT10KMX1C8CuollDLhxP+BzCKOGM4NQEjODRHo+GtMJr3ppTRO
 2nbDACU1UhYxbBU2ugcbCrc7lT11o7dopuKu3bCVrj59wTmvbKaU6/57pl8HnaWL8gZO
 7joA==
X-Gm-Message-State: ACgBeo1QkGPxc4k4RQw2twY/j94mZhZ0dtW+1/R0SwhTaYywfZMy3ek1
 CHRF1CLG63zIkgX3drsqfagL38sytNUuJMV0
X-Google-Smtp-Source: AA6agR5aNyOGbp8XAomBicyuCIxslPz7GeAWvDz/W49KeLT37SzgZT2y7PVSDaATtcLpeHjt4LDQ7g==
X-Received: by 2002:a17:907:7f24:b0:72b:8e8e:11e with SMTP id
 qf36-20020a1709077f2400b0072b8e8e011emr2123498ejc.429.1659633458757; 
 Thu, 04 Aug 2022 10:17:38 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 a15-20020a05640213cf00b0043c92c44c53sm905868edx.93.2022.08.04.10.17.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 10:17:38 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id v3so577685wrp.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 10:17:38 -0700 (PDT)
X-Received: by 2002:a5d:56cf:0:b0:21e:ce64:afe7 with SMTP id
 m15-20020a5d56cf000000b0021ece64afe7mr2010623wrw.281.1659633457704; Thu, 04
 Aug 2022 10:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <Yut2otE1h2xtC79o@debian>
In-Reply-To: <Yut2otE1h2xtC79o@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Aug 2022 10:17:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjPF0dXvDeqPiSzpev4KhhWU0-R8muaYVF73vy2Vw=QTw@mail.gmail.com>
Message-ID: <CAHk-=wjPF0dXvDeqPiSzpev4KhhWU0-R8muaYVF73vy2Vw=QTw@mail.gmail.com>
Subject: Re: mainline build failure due to 6fdd2077ec03 ("drm/amd/amdgpu: add
 memory training support for PSP_V13")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chengming Gui <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 12:35 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> I will be happy to test any patch or provide any extra log if needed.

It sounds like that file just needs to get a

    #include <linux/vmalloc.h>

there, and for some reason architectures other than alpha and mips end
up getting it accidentally through other headers.

Mind testing just adding that header file, and perhaps even sending a
patch if (when) that works for you?

                    Linus
