Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4751F16ED91
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088836E8F7;
	Tue, 25 Feb 2020 18:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5CE6E8F7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:11:51 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id p8so368605oth.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UrnALHtlDEqFTXIUDbXk3KceoADMu/thuZsi/4q8zwI=;
 b=ox0+tww6lSUF1eJ5fUltfszx7Tt0iXTahaQcJ0J/EKscbctf9KWBQZUqpYCsbttCyX
 tylD5Pax1zMrVVJ8cBCNsyjqDe6ddLZPPzvrEGNxaIA898EETk+0D4EJBhn6mH7k1qFu
 lnAcpEzIhA+bMeXbcSDf+FIPh2yAejFjxoPn6JFCqRW2AXrBLEOHoVhaGXef4SfIgkk1
 Jbs55pqKUyk7aP93YKrpbXvtTxse8vAMPc3PbPERXX98UDJ8HbfEMHr+8a0SO+9sZphK
 34fOyh4fpcnnbK2eicbzH1T4bRNg/xDFmn3zhHGubcGX0rXlEa/Nhpc1zjTSj1Pa49jr
 rujg==
X-Gm-Message-State: APjAAAU/1ZEtJlrfXP+Kwe/8DPf/x/8XHcb3yqjktkOioBycEUcT5iWz
 AqbkRbh9e6BsSf1kb0YtPg==
X-Google-Smtp-Source: APXvYqzyFO1ShWEDFoKd1t5wCvom/ANQ8PxbXA4NrIRJbZXlbnjudZWkRF22V9hDbNbZ1b7itBeVOg==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr46001282otd.91.1582654310875; 
 Tue, 25 Feb 2020 10:11:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n25sm5527623oic.6.2020.02.25.10.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:11:49 -0800 (PST)
Received: (nullmailer pid 28247 invoked by uid 1000);
 Tue, 25 Feb 2020 18:11:48 -0000
Date: Tue, 25 Feb 2020 12:11:48 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3 v2] dt-bindings: Add vendor prefix for Hydis
 technologies
Message-ID: <20200225181148.GA28196@bogus>
References: <20200223121841.26836-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200223121841.26836-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Feb 2020 13:18:39 +0100, Linus Walleij wrote:
> This vendor has produced a number of display panels,
> including HVA40WV1.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - New patch adding this vendor.
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
