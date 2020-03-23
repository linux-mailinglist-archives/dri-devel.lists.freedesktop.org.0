Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CCD18FDC4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 20:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029096E2B1;
	Mon, 23 Mar 2020 19:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C986E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 19:36:04 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id a20so8350010ioo.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 12:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3mkiUpmYaWqeC/9fVOMmUolcEDs7SdX572qqK/WHG1k=;
 b=QppUeP639mAcPABDXdrP+AoyM4RrEei3fC1ch5z7NwBAvKx0A4ZmiAg4iYT339upit
 UtSUiD2dZXiXtk6NP/r1F/vSESehsIZc54np5UCAfOSzy+ULV07Ynn2X5QghhBBAAgOP
 XJbhdvzCUIq8mE8z+ourXrgftdklxhYmoPW5Rgaz4E0ggbR7a2C75WQhNCYLAVs4y3Id
 /TZq7373uAemW1TtLPCBzVv9LhsgllY4DyUhf/QInd/FpX7rQ//nDvnjwHyxsvHL7k05
 ZP0V4z4HnkaLgVP0Y9Vk0nXBgbQVfSj+sQJSBkHwCvX1lOw5N4FqIftJuizjgiRbnMr4
 RlAQ==
X-Gm-Message-State: ANhLgQ2TovLoD8TOsYnYAw04Np1DyqDmc9ZBrfq5Mzs34tAcRqimsosK
 3my1eKCfCX1vevEVoSlYlg==
X-Google-Smtp-Source: ADFU+vtIcAv5y12f47+MkcXTNTAvWLJ98g9D7CVFcGDkK6sgqnjzg0FRX1r8Nvkvjh9Ami3EEIH0qg==
X-Received: by 2002:a5d:8d90:: with SMTP id b16mr21124412ioj.9.1584992163562; 
 Mon, 23 Mar 2020 12:36:03 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id y1sm4614140ioq.47.2020.03.23.12.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 12:36:02 -0700 (PDT)
Received: (nullmailer pid 6841 invoked by uid 1000);
 Mon, 23 Mar 2020 19:36:01 -0000
Date: Mon, 23 Mar 2020 13:36:01 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1] dt-bindings: display: rockchip: convert rockchip vop
 bindings to yaml
Message-ID: <20200323193601.GC8470@bogus>
References: <20200306170353.11393-1-jbx6244@gmail.com>
 <590762ab-db79-c8b1-7f0e-b653ed4b1721@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <590762ab-db79-c8b1-7f0e-b653ed4b1721@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 07:55:22AM +0100, Johan Jonker wrote:
> Hi,
> 
> Question for robh:
> 
> In the old txt situation we add/describe only properties that are used
> by the driver/hardware itself. With yaml it also filters things in a
> node that are used by other drivers like:
> 
> assigned-clocks:
> assigned-clock-rates:
> power-domains:
> 
> Should we add or not?

Yes, only pinctrl properties are automatically added.

We could change 'assigned-clocks', but for now I think they should be 
added.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
