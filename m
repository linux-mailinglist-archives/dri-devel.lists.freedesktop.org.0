Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A6B1B066B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 12:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65876E4FF;
	Mon, 20 Apr 2020 10:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4786E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 10:18:51 +0000 (UTC)
Date: Mon, 20 Apr 2020 10:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1587377928;
 bh=qJz6QU9la/MBLKxC++RHua/fTTckbEfsgGnmW3CWFIk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ED8PiZxCcCx1bWadhGT8Q6snjpVwUaxbKozTxovp8Vz/ldvOG6gQxZMpgMtf6h9eF
 /pjtZqCbt4HI/YgAcQKgc2zvgrYghg2oXcQU1TLA/Z4Zw5eGdowCoXRcoE9Y/2Crxh
 qQ522UFQU1HWqY7P0RvbPGgtnZpNOQlLiTYLlNZc=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed by
 another driver / privacy screen support)
Message-ID: <V8lvxC6bp3xKCKOae73L1-LYfchQWljMFwZv5sfFxC7AyW9NM4BdQrHM60KK6GqCjsLuaKXvd5wO7Unbx-CY3uNdzxUH_0TdOUFKBWGRtkQ=@emersion.fr>
In-Reply-To: <20200420130420.1a24197e@eldfell.localdomain>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <20200420130420.1a24197e@eldfell.localdomain>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Pearson <mpearson@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Nitin Joshi1 <njoshi1@lenovo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSdkIHJlYWxseSBsaWtlIGEgZHJtTW9kZUF0b21pY0FkZERlZmF1bHRQcm9wZXJ0eSB0aGF0IHJl
c2V0cyBhIHByb3AKdG8gaXRzIGRlZmF1bHQgdmFsdWXigKYKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
