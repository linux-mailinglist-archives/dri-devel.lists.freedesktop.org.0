Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E6776318
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 16:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E94B10E087;
	Wed,  9 Aug 2023 14:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B415B10E087
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 14:54:42 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RLY4L2HstzDr98;
 Wed,  9 Aug 2023 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691592882; bh=2JulFaTebYAVsF7n86PqB5YB7EuyNaO3N2WCi9PrHLU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UJ+me0amPgpZExkdSn/m0br5OC1ne/Uw44pQ6zQKgRQGRBGf9WiK+oaAq5Gh9J93+
 ux8R7JcbCQkF5e+lDQfUZdwRcLRHdeITj9qgPeYHhg85yj4ALQIWPPwKARvA0Nj2ho
 QyL03lUM8HliyyX37O+KZjVN0X6PlIYlnP5OR2IA=
X-Riseup-User-ID: DBCD7967F10AA7D529BAD90688BCA62D2BA24AAAE5AD03696D0ADCBFB3212DE0
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RLY4H1rGWzJnsZ;
 Wed,  9 Aug 2023 14:54:39 +0000 (UTC)
Message-ID: <d341d7be-d048-49bb-94da-273b5f2217cc@riseup.net>
Date: Wed, 9 Aug 2023 11:54:33 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] drm/format-helper: Test default pitch fallback
To: Arthur Grillo <arthurgrillo@riseup.net>
References: <20230721182316.560649-1-arthurgrillo@riseup.net>
 <20230721182316.560649-2-arthurgrillo@riseup.net>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@riseup.net>
In-Reply-To: <20230721182316.560649-2-arthurgrillo@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: tzimmermann@suse.de, tales.aparecida@gmail.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net, davidgow@google.com,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Em 21/07/2023 15:23, Arthur Grillo escreveu:
> Test the default pitch fallback when NULL is passed as the dst_pitch on
> the conversion procedures.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---

With Maíra's comment about the duplicated drm_fb_xrgb8888_to_rgb565() 
addressed:

Reviewed-by: André Almeida <andrealmeid@igalia.com>
