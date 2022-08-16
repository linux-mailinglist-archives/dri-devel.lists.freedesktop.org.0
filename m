Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28552595D81
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 15:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF23A11364E;
	Tue, 16 Aug 2022 13:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE26AB6E6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 13:37:59 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4M6XK25PnyzDqB1;
 Tue, 16 Aug 2022 13:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660657079; bh=e1NAneVpie+FMvLSmWkFYcTAXo3RG8Tqm3ms4ywkUas=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qoTVEtuiyoWct7y/0DKg619AgFoIX0pL5M1BoKEHf6fdcqr3UXw749SSCV0W2Gbfd
 toFXFjMHkzmvpK4c6Bwk8o0FxBXBWeVBarnsPpBSkHIpUgmzPKRPWED4IoVt8KL1xI
 f2yCV430SkTr/w6PO5+pZiJovYG6ETHvuGXiYIkY=
X-Riseup-User-ID: 1BAFF1A5DB19634CA94E4BD39F28FA2FE8D6237420E2EDDB661A052CFA0F22F9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4M6XJx2Nzvz1y9N;
 Tue, 16 Aug 2022 13:37:53 +0000 (UTC)
Message-ID: <6761eeb7-eedf-c9bb-4f7f-d42e3c6e8ae4@riseup.net>
Date: Tue, 16 Aug 2022 10:37:49 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] KUnit tests for RGB888, XRGB2101010 and grayscale
Content-Language: en-US
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 javierm@redhat.com
References: <20220816102903.276879-1-jose.exposito89@gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220816102903.276879-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 magalilemes00@gmail.com, airlied@linux.ie, tales.aparecida@gmail.com,
 dlatypov@google.com, linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 davidgow@google.com, isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi José,

Tested the whole series on UML, x86, i386 and PPC. All looks fine!

Tested-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

On 8/16/22 07:29, José Expósito wrote:
> Hello everyone,
> 
> This series is a follow up on my work adding KUnit test to the XRGB8888
> conversion functions. This time RGB888, XRGB2101010 and gray8 are added.
> 
> Best wishes,
> Jose
> 
> José Expósito (3):
>    drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb888()
>    drm/format-helper: Add KUnit tests for
>      drm_fb_xrgb8888_to_xrgb2101010()
>    drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_gray8()
> 
>   .../gpu/drm/tests/drm_format_helper_test.c    | 190 ++++++++++++++++++
>   1 file changed, 190 insertions(+)
> 
