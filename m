Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EB23D69CD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 00:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555CA6E951;
	Mon, 26 Jul 2021 22:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017A86E951
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 22:49:36 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id q18so10454546ile.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2IlFJeLoX9S6E38ixxClAC75U16CkOL1MsQpQIY5pms=;
 b=SgKVRXIzRwQmo1axieE3nt8pDfhuQgjVI5ybeIHRbbMGcaDxOkz8QSrzNyZbosIEaY
 XPP98j+KtyGmWqJujNWMh4XOf1CcgkpqUo6KT3toMaX0PaMtlNJ+6jxHBxhK12j8qerd
 LBhO56jQiAaGw4SvkO4AaMvOdvBto9gbbtAL3WctSPV9MTwH41dIdIVTWjG5nMfZPI9s
 494D7+oPgefTM7LBrjgmruj3J2srpC6IUxb09J6Toe1zCPGIYjnwuvALO/V3KRdT129O
 D+jN3rbNkJea4/8V2RKgDrEBnKdqg0w6pLVbwVOrzes2vcgEP9ABG+ZGydiZ7sbgzTb9
 DuKg==
X-Gm-Message-State: AOAM533ECt31SpKyyrxz3p+kVhbZbjuaFp1xzWs0ldiViATo57tNHdN3
 z/KEe5JfmUJiJTkYtfzx6w==
X-Google-Smtp-Source: ABdhPJy/fSCdGZmYVDrgIYVzg7FLjRghDAeypciSTLfXvOna/mS0cUY4SC9USb5fKw61r2pAz5aLOA==
X-Received: by 2002:a92:c206:: with SMTP id j6mr14771530ilo.152.1627339776143; 
 Mon, 26 Jul 2021 15:49:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id x11sm614696ilu.3.2021.07.26.15.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 15:49:35 -0700 (PDT)
Received: (nullmailer pid 1020860 invoked by uid 1000);
 Mon, 26 Jul 2021 22:49:32 -0000
Date: Mon, 26 Jul 2021 16:49:32 -0600
From: Rob Herring <robh@kernel.org>
To: Artjom Vejsel <akawolf0@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: Add QiShenglong vendor prefix
Message-ID: <20210726224932.GA1020830@robh.at.kernel.org>
References: <20210725221527.1771892-1-akawolf0@gmail.com>
 <20210725221527.1771892-2-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725221527.1771892-2-akawolf0@gmail.com>
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
 robh+dt@kernel.org, paul@crapouillou.net, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Jul 2021 01:15:25 +0300, Artjom Vejsel wrote:
> Add vendor prefix for Shenzhen QiShenglong Industrialist Co., Ltd.
> QiShenglong is a Chinese manufacturer of handheld gaming consoles, most of
> which run (very old) versions of Linux.
> QiShenglong is known as Hamy.
> 
> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
