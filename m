Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB111EE80
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981246EE12;
	Fri, 13 Dec 2019 23:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF64B6EE12
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 23:27:32 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id o9so1069866ote.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S4bPNr6OBo/g9aqwSLy55ENKU+9zI0oQQiPkpLV/Jps=;
 b=WRI1lO8/AqntsTaTeXjDa+pxTconx4sSFx9mw4SYcFo2bS6ywuj+H9s5paRr9MOPxR
 SgXK3yhys++6yTUNuOisUsqjG3ZuC3CyeKe37J/EVKfq9t6dtBier6BLzkP8owoRoIxX
 1wMDjVbhWIf8nPYvoOr9uGbV62B1E7QaOrMHwtzjUzvDnFbKo4iWxdUYC/j+G8TyH9Zj
 HMPKgvl9AqjgM2b/v1aeu9lQ0k7IOmoJGitWwim8EnOCau2pQmTVCKo/YWJ6om+gtPoY
 k7Mx0q+bI0CMwwlnQIDgKrF9zaMwtjVNqCXbzL+ykDFg1xZxrz/JrpP2W7PCcPCsHzD+
 vAfQ==
X-Gm-Message-State: APjAAAWOMRBLIpsaPBFUWZwk6AsZ1/NRhouNIr6wCM2MPhz63If8tvPK
 BmVjKZyPPpX8JWg4M0Umng==
X-Google-Smtp-Source: APXvYqyuN0Td4+RfvGK51mEm0cUvXxHhe/hls84mHF1OL3nAxDhPeCnm798ZyCCEISzCWecbI/Th3Q==
X-Received: by 2002:a9d:7999:: with SMTP id h25mr17214493otm.347.1576279652074; 
 Fri, 13 Dec 2019 15:27:32 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y24sm3844418oix.31.2019.12.13.15.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 15:27:31 -0800 (PST)
Date: Fri, 13 Dec 2019 17:27:30 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Frida
 LCD Co., Ltd.
Message-ID: <20191213232730.GA23246@bogus>
References: <20191202154123.64139-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202154123.64139-1-paul@crapouillou.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  2 Dec 2019 16:41:21 +0100, Paul Cercueil wrote:
> Add an entry for Shenzhen Frida LCD Co., Ltd.
> 
> v2: No change
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
