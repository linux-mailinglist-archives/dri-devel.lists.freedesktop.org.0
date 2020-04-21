Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF5D1B2A2B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 16:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812716E149;
	Tue, 21 Apr 2020 14:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715E66E149
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 14:39:37 +0000 (UTC)
Date: Tue, 21 Apr 2020 14:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1587479972;
 bh=tkI8CnqR7ckfe1W+6qNwI8j84pAE+idUAYDxPPK/TPU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=O93s0qm4aNcsdJ9RCLpGdK4sVH3W2GyqbHdbqri4e2rRXYL7dhvUxvDv65r1k2Bx8
 lwoHbEkJjBjoGhvilqiRXqiaDImF46GAfAFKP4MqE5l+rttO1bpVlHqIoAWxweJiPJ
 2qKMLXipkEl4VMmZZEQyMOlYGb64TguwPrjWN+Cs=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed by
 another driver / privacy screen support)
Message-ID: <uhIuk4Os-r5OPj8b2SpdNj5OJIjVcpKbL2nE_ceMqnhfPMmZMXJu9BLFFIWaISwt5leEn05r21c5-7dp-KfmqrnG98GUVzGRzazt3mA0YyA=@emersion.fr>
In-Reply-To: <20200421173300.3cd078f4@eldfell.localdomain>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <20200420130420.1a24197e@eldfell.localdomain>
 <20200421121552.GT3456981@phenom.ffwll.local>
 <20200421173300.3cd078f4@eldfell.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, April 21, 2020 4:33 PM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> I'd love to volunteer for writing the Weston code to make use of "get me
> sane default state" UAPI, but I'm afraid I'm not in that much control
> of my time.

I'm interested in this problem too. If someone writes the kernel side,
I'll gladly write user-space for it.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
