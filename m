Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794893FCF96
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 00:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728A389FD9;
	Tue, 31 Aug 2021 22:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797A689FD9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 22:32:46 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id r26so1282961oij.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 15:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g6D38exB/Nb9kQ3rq5Ht426/g7o8xbXiI53vXw3Leoo=;
 b=MynaNV+j5kFmDDSkLECd4Klu1+Wu7KviuDg/KuQogQlce1HrSjvfajpyV7+rC3XDEq
 xBVrY2Bicmbpg9bgN+Y1oUPjbd6R4KTuZ0ARnsjpRt7xmJcrElrKgmT4BLLZQwFdeuJT
 27tmEwtAqyOybdO9RJTEct3Al4tQ1x2JQiAeJwIiuGafbWV2PZp0CF4P5Ijb/76JTRAk
 mznifVodFnl1B5GpTV4KKIbIIOCfXQwxV0E77DINS+j0Hydel99vOyoD1y4mGFOWdxqf
 5pCMAxPWT3R1Ur9DTwJ4bWIs/RE20LGP2aiTQxsgGGsSbQ+Stl9M10MaUz2sJUmfeurd
 qMhA==
X-Gm-Message-State: AOAM530L7j9043izZuQJSOJwAWMKRc79onUO3sBeJU7MhOxf8od/YSRy
 6aBpHmcWBIQf8k4YhXZrM8kjkamZTA==
X-Google-Smtp-Source: ABdhPJy/LrzRncvMJD8g1bJs+UutiJZ7WjP/8yf47rdUTkA6whSbhnEbeH51oAPVboJp2H4aaVmrog==
X-Received: by 2002:a05:6808:2cd:: with SMTP id
 a13mr5040179oid.3.1630449165761; 
 Tue, 31 Aug 2021 15:32:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k8sm3832850oom.20.2021.08.31.15.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 15:32:45 -0700 (PDT)
Received: (nullmailer pid 762341 invoked by uid 1000);
 Tue, 31 Aug 2021 22:32:44 -0000
Date: Tue, 31 Aug 2021 17:32:44 -0500
From: Rob Herring <robh@kernel.org>
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie,
 dianders@google.com, devicetree@vger.kernel.org, daniel@ffwll.ch,
 Douglas Anderson <dianders@chromium.org>
Subject: Re: [v4 4/4] dt-bindngs: display: panel: Add BOE and INX panel
 bindings
Message-ID: <YS6uDL6X1CJeJaNX@robh.at.kernel.org>
References: <20210830023849.258839-1-yangcong5@huaqin.corp-partner.google.com>
 <20210830023849.258839-5-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830023849.258839-5-yangcong5@huaqin.corp-partner.google.com>
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

On Mon, 30 Aug 2021 10:38:49 +0800, yangcong wrote:
> Add documentation for boe tv110c9m-ll3, inx hj110iz-01a panel.
> 
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
