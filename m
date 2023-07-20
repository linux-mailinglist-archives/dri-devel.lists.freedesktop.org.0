Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA51C75A6D3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 08:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FF710E560;
	Thu, 20 Jul 2023 06:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA5610E560
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 06:47:13 +0000 (UTC)
Date: Thu, 20 Jul 2023 06:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689835631; x=1690094831;
 bh=JkqLCS/6N17BbXMQRGntyrD9CaykJUJOUwQT220/XVQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=TnDS6wDtGGPGaRVW1l4dcNH1ZEOfjdcwikYYeb0SXGJOL0sgBhxcPs88hkIpjsNvL
 yILCjrU9P5p4yy/KwTymqLq5hEDAhOKqJWgZclTFmW4GXbZvOxKNwcvcLa03DOW0y6
 yRixXnHkuWPddAm+xZJ0DdVqVOnt6/cF60av3zMJ7JzD/5kogwQcgGZwImJL5OIx/T
 uMbBaFxQ/+dk4klbp1KUE3nkkcq97oTeW/pndnAJfX6kui0DaNvTGlL+uH2dX+bP14
 ojuJSunZeQ5IGZX7lRpkqmMLAL0+amUWXIMyncnaRfZ/ZhWbWVjJHyAgNlzyUqClsb
 rJyjT6U9/wi+g==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 9/9] drm: Introduce documentation for hotspot properties
Message-ID: <xhJhUmlWt6a9ajOdF2Wodjm6IQBab4jqySRdBAPLaA4No87O7zfEX9v4d-ugWWAPgJBIWQeLV4RVuuRoZPK7aTYgNWp2YofiHra2GVLBfpY=@emersion.fr>
In-Reply-To: <41590ef35281fbc54be1ee58d9187ede8bc44698.camel@vmware.com>
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-10-zack@kde.org> <20230719111541.33c05b14@eldfell>
 <41590ef35281fbc54be1ee58d9187ede8bc44698.camel@vmware.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 Michael Banack <banackm@vmware.com>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, July 20th, 2023 at 07:03, Zack Rusin <zackr@vmware.com> wrote:

> I'll give this series a few more hours on the list and if no one objects =
I'll push
> it to drm-misc later today. Thanks!

Sorry, but this doesn't seem to be enough to satisfy the DRM merge
requirements. This introduces a new uAPI but is missing user-space
patches and IGT. See [1] and [2].

[1]: https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#requirements
[2]: https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-use=
rspace-requirements
