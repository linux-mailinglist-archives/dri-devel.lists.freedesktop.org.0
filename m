Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD00131423C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 22:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B6D6E88C;
	Mon,  8 Feb 2021 21:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD3B6E88C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 21:50:10 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id k25so13534865otb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 13:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BwpHaJPHT9hwbQZAIHBuEis2Nw2MqCWdqmW8x64JWp0=;
 b=QSP7F1xbhAe7N/s5a3lX2PtUMkPSddY91DDVyLxn2ziokMrk/oYgON23B12xQO94xw
 zDIPWjpiEJ4H0ATqhabMy9NLadWJi59bTHYzG/FmVFT2zeuHti1UyGnttkIqHz9C7yQr
 A7kKp0pqY1HblIhmWgDxiIl7jRzqOH7sb5f/G8L1cMu5ZEg6LzXOKzxDWS0dFQVSmvrs
 h12yXuBHFlXiKNkXBo3u5oifCxmq/UIHVL7e8w7a+9GzJCm6tVJf8tqYA5aoGDb5DqPe
 xGpeic1QzvLEwfGMwTllKmwmnelxVFO76bcFkRma1l4PHtQIJvWZcWrgJaxJCWx+Mb2z
 B4SQ==
X-Gm-Message-State: AOAM533UVWjrE2Rk7cqc3p4u96sQ051FMhTCGeUPfuQfURbf8DxRG3Ia
 44fzrFqofM58G2txLKSZQQ==
X-Google-Smtp-Source: ABdhPJyxT/PQgj7oJF26Sa0uel4nUG2DgEpWm+NsrJts5eqFEtl51umzi+NDwtHflzXRubGqKByvZg==
X-Received: by 2002:a9d:7519:: with SMTP id r25mr14493915otk.339.1612821009979; 
 Mon, 08 Feb 2021 13:50:09 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v6sm451634otk.2.2021.02.08.13.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 13:50:09 -0800 (PST)
Received: (nullmailer pid 2081875 invoked by uid 1000);
 Mon, 08 Feb 2021 21:50:08 -0000
Date: Mon, 8 Feb 2021 15:50:08 -0600
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: dt-bindings: display: simple: Add
 N116BCA-EA1
Message-ID: <20210208215008.GA2081820@robh.at.kernel.org>
References: <20210115224420.1635017-1-dianders@chromium.org>
 <20210115144345.v2.4.I6889e21811df6adaff5c5b8a8c80fda0669ab3a5@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115144345.v2.4.I6889e21811df6adaff5c5b8a8c80fda0669ab3a5@changeid>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Jan 2021 14:44:19 -0800, Douglas Anderson wrote:
> Another simple eDP panel.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - ("dt-bindings: dt-bindings: display: simple: Add N116BCA-EA1") new for v2.
> 
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
