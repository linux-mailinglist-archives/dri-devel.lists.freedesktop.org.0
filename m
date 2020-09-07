Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E27325FC16
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19136E486;
	Mon,  7 Sep 2020 14:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CFA6E334
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:08:44 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y4so15008226ljk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0EeRRCsUX1Pk+YbMl4DUIAE6pTvHy6ihuYS6GV/X928=;
 b=IdEg4JME3TQqAQEKbVk9FfxPYBWwBbP8Fykj5xICjYIjjM82tDwRqM5Pl75eBTRrZC
 pUl0Z2y/n8Ax+xua1B6iDo0flvfRRQNiPHJp4XGmR0ijvWutEmEy5I2pl0b/V/S+1Z7F
 mJCFsXoaLqV8ZW1Z5Bq1KkBmwPj+bZebMor9PLa9+BIL9yZGh1ddBjx+0Wk3GuxHaqwz
 L8P5VxsAEvX34lRX9mcbiJmZNvuot1SDcEnKgFKQnksH5Oa+p4+zuciN0vOPzdBAi4SW
 zK4T5ECQ1B17qaqkhMzaJK/KV41lqzZ5At2rbiu7ID1yvZvHcmJoTksc67Mt2v7k6Bqm
 GOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0EeRRCsUX1Pk+YbMl4DUIAE6pTvHy6ihuYS6GV/X928=;
 b=ni5hkcf5Dpe1Ao9XR4NANrW5FnHFKU5D1KEG3Ygv6hF956vkjd+rTYjNIMfAymXodf
 qHzVvcXRhTm+MymD4NTdZ+zO/c3VXg1nsChG4SEN6OMNShwW7F/O8XJTutn1rsj7QfIE
 C9it35PP9iuvnLX1q5Hk9tJDsjRzNu6JBeeAYPzf4ro3/HtvjiF3pPeds4+1RK3iza1K
 jhqfJVTi4MJk9jWQDLvoIPcA3NF5wJd3zCOKPJ8+7uT3usxGk1dOV+7y1JuBCdb0QCnI
 ismAg09gpiTFn83itd6ZyTdf1pLSaBAitL0+2xvwLRr2aF6gwmqmcnrknLwc1iA25KO9
 J9xA==
X-Gm-Message-State: AOAM531Q+OI2JScLU5SpaLozvLVtw65b/3szw0kK1280CnHJAoIbicWF
 JUu3C/ywaV/f9Nege2GHJ2LpeWLoVVl/Yw==
X-Google-Smtp-Source: ABdhPJxC25zywKFu0tljNIevPK3kmOkCAt026EhxTMDv3XS1YYe4L8NkoIWFqZS3TSgl4UQnGDnaLA==
X-Received: by 2002:a2e:b0f5:: with SMTP id h21mr9557847ljl.448.1599466122723; 
 Mon, 07 Sep 2020 01:08:42 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276?
 ([2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276])
 by smtp.gmail.com with ESMTPSA id i187sm6747245lfd.65.2020.09.07.01.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 01:08:42 -0700 (PDT)
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Laurent
 <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <f106c6df-b85a-1850-d36a-ac18ec629986@gmail.com>
Date: Mon, 7 Sep 2020 11:08:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Sep 2020 14:29:04 +0000
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
Cc: Linux-DT <devicetree@vger.kernel.org>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.09.2020 5:59, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch is test on R-Car M3-W+ Salvator-XS board.

    Was tested?

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[...]

MBR, Sergei
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
