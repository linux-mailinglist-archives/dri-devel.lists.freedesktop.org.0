Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB20587D2C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 15:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7A311B874;
	Tue,  2 Aug 2022 13:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3F511B26D;
 Tue,  2 Aug 2022 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fwo6WykRfnhHjnEk1i7dDohr9Ek6DQruaBKzVUzk+jI=; b=O6KPrWVLyPLkUhm3jXsG0AyY5c
 HeiblfKLHksQE0XuCVJqKU3DhNq9lM1GlVQH3e3C1olABLSkCRmkMrxyMQpFYPSzrozW8u00TONpx
 NVHnYoMElNL2ZPB/jyE7zINl4QU3yEoRVt9YaSM8Jdg9AZW1U7viOlILUfEtGv9XISQTorJGNHx1t
 RQGHnBDaQFBwTDhtW5BzWKXgADazX5dAvcLBBWsVEjkzu036X9vMF6hSF9BGPNseKzWJASrrchhjk
 4Cv9s9KJ7lb8zOToX5+F9Dusvfn2HzHCGcJG4S1Xi4PVlacp08NHK5+1J0ioRkk+LZdRx6xij01Mn
 KxlGXQbg==;
Received: from [187.34.27.134] (helo=[192.168.15.109])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1oIs1k-00Ehs8-8s; Tue, 02 Aug 2022 15:33:40 +0200
Message-ID: <a6dbbd10-9638-bd1b-9a68-17c79cadca3d@igalia.com>
Date: Tue, 2 Aug 2022 10:33:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: remove DML Makefile duplicate lines
Content-Language: en-US
To: Magali Lemes <magalilemes00@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220802120406.88845-1-magalilemes00@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20220802120406.88845-1-magalilemes00@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: siqueirajordao@riseup.net, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org, isabbasso@riseup.net,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Às 09:04 de 02/08/22, Magali Lemes escreveu:
> There are two identical CFLAGS entries for "display_mode_vba_20.o", so
> remove one of them. Also, as there's already an entry for
> "display_mode_lib.o" CFLAGS, regardless of CONFIG_DRM_AMD_DC_DCN being
> defined or not, remove the one entry between CONFIG_DRM_AMD_DC_DCN ifdef
> guards.
> 
> Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
> ---

Reviewed-by: André Almeida <andrealmeid@igalia.com>
