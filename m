Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC89212FEEE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 23:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7896E35D;
	Fri,  3 Jan 2020 22:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788CA6E35D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 22:44:23 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z8so42942431ioh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 14:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zL7lXPN6EMBAnzsaSWaNynU9nZ8SUyCQnluhdY1uUrg=;
 b=iZo0nUO/4q9FRuW92XbdOnyTf1l1c31R7rmduRP7S0qGI3nglja74xyIo/QXMK+I17
 nNs50B0qQhb6LwdVg1gK6JXqGlAciWSfR58Rv6ftZ+Hum1zndmETY8Ckd4JK97UG7JdL
 WSMnVcllXMqEfuL/xp3kXVQ7hUAb7s1Qiqg5tsX4Uv8mJfTQlmWOu4WVqlnImh/RtS9z
 6GzAfq0VTyzleZLYanLp8hx63CBmPtUs4v9tLFicABQsdnNP+YUbPC3hFsv0EbG7NdTw
 LXIT2mDM+oaXIu3BnqgvDcA0Ys2+SsBam87qZ7Xib6twlU9rfAk+uwkTVciXnulyJyh7
 AWtA==
X-Gm-Message-State: APjAAAVytbi3Fgj8xKSOU7sC25x8/dvoCQrygvtO533mtnpCdNQtQO75
 jMXDHTeznigKLh5lZNh7QOxt19w=
X-Google-Smtp-Source: APXvYqytf+ZqjRhWdOPADhUiGEAx26OFGlKkz3lnFDG404wZGmjn0a6UP0Jzk89EHCmVnV5jlb1ZRQ==
X-Received: by 2002:a02:22c7:: with SMTP id o190mr73423857jao.64.1578091462505; 
 Fri, 03 Jan 2020 14:44:22 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id y9sm15185317ion.54.2020.01.03.14.44.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 14:44:21 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219a5
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Fri, 03 Jan 2020 15:44:20 -0700
Date: Fri, 3 Jan 2020 15:44:20 -0700
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Message-ID: <20200103224420.GA24988@bogus>
References: <20191203150606.317062-1-paul.kocialkowski@bootlin.com>
 <20191203150606.317062-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203150606.317062-2-paul.kocialkowski@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  3 Dec 2019 16:06:04 +0100, Paul Kocialkowski wrote:
> The Xylon LogiCVC is a display controller implemented as programmable
> logic in Xilinx FPGAs.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../display/xylon,logicvc-display.yaml        | 313 ++++++++++++++++++
>  1 file changed, 313 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
