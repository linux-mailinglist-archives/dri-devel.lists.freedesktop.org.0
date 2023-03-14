Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ED86BA23E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 23:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD37710E8B6;
	Tue, 14 Mar 2023 22:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7471F10E2D2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 22:17:49 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4Pbnvx05qwzDq8H;
 Tue, 14 Mar 2023 22:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1678832269; bh=xB41mv+6lZQlGhC2XAUN+DGghAX/AIlUyHtDQl425qA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GX+tgvA8e6VnGLf07yMf10Wum5Ix2SHFZzB1ggPPeoWeT4LcN/2n8am8aSbc6hj/g
 NSBEcv84EOcQMpQkVTweBEChgOxzOKkxKYE9rrhZAcSDkA5Q0aw0z4geLf73+XN6qq
 B4d+LLLqRa6mNAiYC5eFO0b132ol/+cqaC96LIL4=
X-Riseup-User-ID: 4B5AC371F982BCD0C1125DE785A5FC19298C3B2648B94D914222CC7A03DBF34F
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4Pbnvq5WYkz1yX0;
 Tue, 14 Mar 2023 22:17:43 +0000 (UTC)
Message-ID: <23609fe6-3413-e034-6900-5ad3be082ca4@riseup.net>
Date: Tue, 14 Mar 2023 19:17:38 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] drm/format-helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20230311125141.564801-1-arthurgrillo@riseup.net>
 <20230311125141.564801-2-arthurgrillo@riseup.net>
 <87cz5b40cu.fsf@minerva.mail-host-address-is-not-set>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <87cz5b40cu.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, mairacanal@riseup.net,
 tzimmermann@suse.de, jose.exposito89@gmail.com, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Javier,

On 14/03/23 16:08, Javier Martinez Canillas wrote:
> Arthur Grillo <arthurgrillo@riseup.net> writes:
> 
> Hello Arthur,
> 
>> Extend the existing test cases to test the conversion from XRGB8888 to
>> monochromatic.
>>
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>> ---
> 
> Patch looks good to me:
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Please let me know if you need someone to push this to the drm-misc tree.
> 

It would be nice if you did, as I don't have commit rights on this tree.
