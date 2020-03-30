Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F3198839
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 01:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F6F6E4D0;
	Mon, 30 Mar 2020 23:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996C76E4D0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 23:26:09 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id y14so2644661iol.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 16:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y63T0wbyLEmYwE9gAEI8Zr/6EzaOspBnb441laqbZEg=;
 b=cnZ6F+970G8l/rC5K+Dw2lzxtXTT8wLOkRjk5QV+S+EHFWfy+LU4PhrIeNjsdrzxVy
 EPtYYAEolujpa760AZMUuKzp+0ztoFaPD8mpkiDMjXkXvJkfZudBwOpS7LdT0Yq21V7/
 Qq02lysn3ETfU3UjiZENItqhj6YzU8gUiMQXuxftMZdirkmgzQQ8jmyMN1FnG04TXyUU
 PXH2NSskDw98qiq9KH1RcavIa+nRwPHH6O1SNsm3paD8aIMtAWA7f4OwevfsNQJ9hWX+
 q69PPLTIB8h9+V5tFwLvZMvcnAgJnN+MfCwPpoCudz0MffJsLSGqTcaNeVsWjFotFPjU
 nmKQ==
X-Gm-Message-State: ANhLgQ0kv6yytJ1NHCRMEc2arbNplJqzWF42x2SVTDi3wJnjEItwRLJa
 m474yhaiEOP6FP9ihYJU1g==
X-Google-Smtp-Source: ADFU+vsym9bSX5N8kLEnjs2h8aexWHp7cTlvBkEIiGLT5gJ0zfPAzGevnq6xwHKXhFL2KDACD/7Tbg==
X-Received: by 2002:a02:3842:: with SMTP id v2mr13498145jae.9.1585610768816;
 Mon, 30 Mar 2020 16:26:08 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id y6sm5293221ilc.41.2020.03.30.16.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 16:26:08 -0700 (PDT)
Received: (nullmailer pid 24877 invoked by uid 1000);
 Mon, 30 Mar 2020 23:26:07 -0000
Date: Mon, 30 Mar 2020 17:26:07 -0600
From: Rob Herring <robh@kernel.org>
To: Pascal Roeleven <dev@pascalroeleven.nl>
Subject: Re: [PATCH v2 3/5] dt-bindings: vendor-prefixes: Add Topwise
Message-ID: <20200330232607.GA24820@bogus>
References: <20200320112205.7100-1-dev@pascalroeleven.nl>
 <20200320112205.7100-4-dev@pascalroeleven.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320112205.7100-4-dev@pascalroeleven.nl>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, Pascal Roeleven <dev@pascalroeleven.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Mar 2020 12:21:34 +0100, Pascal Roeleven wrote:
> Topwise Communication Co,. Ltd. is a company based in Shenzhen. They
> manufacture all kind of products but seem to be focusing on POS nowadays.
> 
> Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
