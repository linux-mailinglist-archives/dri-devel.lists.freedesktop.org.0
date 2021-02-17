Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6538331D3AB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 02:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7C889F0A;
	Wed, 17 Feb 2021 01:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A31C89EEB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 01:12:43 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id fa16so473943pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 17:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wNVZYewXDzKdq3nivCVCuJM93zq5lmDXKFfuCe08TZU=;
 b=lze8dBm3rNnLESFrVkK3G9iztt0PsgOI/qDTKzkgci30CWAZwENz2kt4IoLhdNYWTd
 4DGVKvBwUnm1xVNxS3o/C1Q+TDopRCdasjx38BwpwAEIKNq4MIqlm0MB25PGq0GokhY5
 CDYZ/yslGXhBJGQH6VEvEzVOrXW6lNco4g42us0/5lVnH0wf7dirjcj44TtQuATNUnYh
 TFWxjJzEVbwAKWT0/JA8tzzlTI46uPvxTauJdd4XakpCu80NxofMqf4j7gd7Q2eTOxtX
 1bcQz+ndQ8NhF7H61meQMPZ2TE/vbNX/bNhLTmOwsZKXWyRsmvx0XreYPXkN5fj1E1RM
 YrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wNVZYewXDzKdq3nivCVCuJM93zq5lmDXKFfuCe08TZU=;
 b=dFwYN9xnDNJiOrriC4pMcCI+91IrUhCl7NqKQlQoqWyQPNhw9DEmv4MedN1BOxA85l
 KjeN5qe5lyxfDFCX4tlHW/U4ZC2NN9SGrfsbdLfYl+BkDFUTd5lHf+pYLPGbr4ZOXBFh
 8yEblfqNcCAejtOszlOK6gNQ+J9Oc2YmpszS1W8Nf1fDDcN2aIjcLzF6VueUq4XBDGL9
 kS9OZlKcNKZV0NV5E+UZTpGjjfVJrsiU66oAtKfCeTgMEYIG15GjR8nH9tOPWCk/dps/
 KmRxU4cT+ksuGPf/4+/40MaZUnGFKEoHasL1dPr42U7/AwwA3a0XFDUdpVsJrlkAEeN0
 Ca5Q==
X-Gm-Message-State: AOAM533wdV8TveezKxQpbwIYZ+cSb0glB8bCd9c6lJk5RleDn5h1uPFS
 b4fJTw6ptBOcHGpNZZXiFag=
X-Google-Smtp-Source: ABdhPJxI42w5Dp3+mhtK9Eu+GOs7t/DjNXtsyX/1HLRij6cQkCWDcR+YtmZ70nMLW3lATeCUnw7Fxg==
X-Received: by 2002:a17:90b:17c7:: with SMTP id
 me7mr6781873pjb.205.1613524363086; 
 Tue, 16 Feb 2021 17:12:43 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y22sm326153pgh.19.2021.02.16.17.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 17:12:42 -0800 (PST)
Subject: Re: [PATCH] Revert "ARM: dts: bcm2711: Add the BSC interrupt
 controller"
To: Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20210212191104.2365912-1-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6ce9e820-992f-7f97-ccaa-f8cb99698a68@gmail.com>
Date: Tue, 16 Feb 2021 17:12:39 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210212191104.2365912-1-f.fainelli@gmail.com>
Content-Language: en-US
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, maxime@cerno.tech,
 dave.stevenson@raspberrypi.com, maz@kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, tzimmermann@suse.de,
 hverkuil-cisco@xs4all.nl, mchehab@kernel.org, nsaenzjulienne@suse.de,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/12/2021 11:11 AM, Florian Fainelli wrote:
> As Dave reported:
> 
> This seems to have unintended side effects.  GIC interrupt 117 is shared
> between the standard I2C controllers (i2c-bcm2835) and the l2-intc block
> handling the HDMI I2C interrupts.
> 
> There is not a great way to share an interrupt between an interrupt
> controller using the chained IRQ handler which is an interrupt flow and
> another driver like i2c-bcm2835 which uses an interrupt handler
> (although it specifies IRQF_SHARED).
> 
> Simply revert this change for now which will mean that HDMI I2C will be
> polled, like it was before.
> 
> Reported-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to devicetree/next, thanks!
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
