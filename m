Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98E2F462E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BA36E102;
	Wed, 13 Jan 2021 08:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB36C89BAF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:17:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id lt17so1825276ejb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=uGhXqU7hxs2ksJvamUTOtyrixejaQ5V9rW5Cd2iDASw=;
 b=Hx14Igh/838jtmxgF4yYXEIPuzaln9Xh2PzKmYabYUrzgDvSdxkqryEVRPQDCWND8v
 IL4PT5dteHI5XwrPxw8pe/C6ajiujPilKW4jWENYq4xWxXL+DowjWbF+HTv85wFpGsUa
 XuNxeSYYQIiUnftq5tpIgku6eauunIfPs36EhI0P0pauWKmagWMjP32nhrHnEVA4jZn1
 8r/KJFAB316++kllZaeCB9JprnrOQ99Tu3Ny8HfN9trVOzUFyc9ETZAQWyS1aICIpCSK
 D0G5lo4Nh8Cu0+TyOEuAqziTDbbF1ij54KUk+0AW38tUiduOuzN0oAjSRCwWAaaQxGRS
 Tcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=uGhXqU7hxs2ksJvamUTOtyrixejaQ5V9rW5Cd2iDASw=;
 b=FvTrS2fG5kHGZU+7BC5hbBL46elxCuV9+6oorhxWuOqXmRFLLN82cvn7I4kjhS2UpR
 E2OtUrNS9k2MM7Juwb3iM9x13tBe8IpTsRaqO2JSIm336aLCnwEU9QJrw/fzzpxj9qWA
 CtyoEjFgzDBAXGpB09QEyuLG2XVbBLBmvR9EsLrBZC9n73O4qWD7q4vRlnTIQl4CR8yt
 cHAcRxL9MfhKTzIV4/eipTsIxZxcz45aiG5IX4YcnqtzIKbzz/6X4q+mOHLe+MnVDWkn
 3swj238iOgNdJ/6Za2I5ZLJK3hsd2g7LQc1valR/zRZzV4MoJZ3+H9I1lMBj0n2uFayR
 1aUw==
X-Gm-Message-State: AOAM532FBRdyPnwxBEJ97r+AArpKC/OAHAhISRyPwig1Uc5GY304R29k
 /uRYWqQfNvh2NX1u8K9XbjCe3N0dS6RCyQ==
X-Google-Smtp-Source: ABdhPJxat8zzsSQR7f493W9n+o96U5I/8e6U7KxapwTb1bv+O+pBWFgui4jnkqCTOICSjJQWJoBlsA==
X-Received: by 2002:a17:906:7d98:: with SMTP id
 v24mr723423ejo.129.1610525864480; 
 Wed, 13 Jan 2021 00:17:44 -0800 (PST)
Received: from [192.168.0.2] ([158.181.74.209])
 by smtp.gmail.com with ESMTPSA id ko23sm31740ejc.35.2021.01.13.00.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:17:43 -0800 (PST)
Message-ID: <5b628ef817e0701786be2a17e1f3627a95a726f1.camel@gmail.com>
Subject: Re: r600/nir: enable soft-fp64 for evengreen class hardware - brake
 compilation of Mesa git
From: Gert Wollny <gw.fossdev@gmail.com>
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter@nuetzel-hh.de>, DRI Devel
 <dri-devel@lists.freedesktop.org>
Date: Wed, 13 Jan 2021 09:17:55 +0100
In-Reply-To: <0e2432a06cc0baf01ea59c83af910d30@nuetzel-hh.de>
References: <0e2432a06cc0baf01ea59c83af910d30@nuetzel-hh.de>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dieter, 

I guess you did a release build? The build failure should be fixed now,
someone else had already opened an issue. 

> Maybe I can do some testing with my Tursk for you.
Thanks, that always helps :) 

Best, 
Gert 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
