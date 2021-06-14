Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B783A6221
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 12:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8657E89DB9;
	Mon, 14 Jun 2021 10:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFC889DB9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 10:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VoOXBYQoNpXYT3w1BPyLiV7o+d98v5UBO4hXeER4kZQ=; b=JAUNC+vyg1343ls6J2N3Kj/toU
 pHZFHz+LgFYUcNfdiPz8qAz3BuwrRUxDB4NePkRtyC8xP+T3MsKy360fm+Wk5zvSGHUM+2siv+fzF
 FWSRfQYLJeiZ/2ptKsES86xzQ6GnGe57IR0jmQuVDfFe/v+tlMV66n9wrrfc3vgopijYZOduorsKg
 iHJIMPniftB79hGL3l//nXXfCujfLx2eIaBXN1l8O5E/9q7/Gys49e7UUeO4lRN7upUXMw/3ZxQTX
 3aBMZBgj35ENltXxvCwvCBs2r4ijD7sZt7/UJBObsV7NX3v/9EXRFW8HuFfOGucPbYHcNZY9vrZWA
 SWVEIvcA==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=60065)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lskEC-0005Kw-QC; Mon, 14 Jun 2021 12:54:00 +0200
Subject: Re: [PATCH 1/2] drm/dbi: Support DBI typec1 read operations
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20210611212736.668563-1-linus.walleij@linaro.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0ca2b143-6508-e8ee-3012-3c4963d3168b@tronnes.org>
Date: Mon, 14 Jun 2021 12:53:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611212736.668563-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 11.06.2021 23.27, skrev Linus Walleij:
> Implement SPI reads for typec1, for SPI controllers that
> can support 9bpw in addition to 8bpw (such as GPIO bit-banged
> SPI).
> 
> 9bpw emulation is not supported but we have to start with
> something.
> 
> This is used by s6e63m0 to read display MTP information
> which is used by the driver for backlight control.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
