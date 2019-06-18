Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783D498A3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 07:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D42D6E0D5;
	Tue, 18 Jun 2019 05:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 571 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jun 2019 05:27:38 UTC
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639C86E0D5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 05:27:38 +0000 (UTC)
Date: Tue, 18 Jun 2019 05:18:01 +0000
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm/vkms: Use index instead of 0 in possible crtc
Message-ID: <WQuF2MGabt8DxA1rdWhTcZIGSaXav-5XOae4hkdkxq51gom6tklMqrfOLnyN6WSm9TY5sLXp_fxoNQhtC3E7zY9A3dLEpfZ1phdw23m0SI8=@emersion.fr>
In-Reply-To: <20190618021944.7ilhgaswme2a6amt@smtp.gmail.com>
References: <cover.1559860606.git.rodrigosiqueiramelo@gmail.com>
 <e3bc263b273d91182e0577ed820b1c4f096834ec.1559860606.git.rodrigosiqueiramelo@gmail.com>
 <20190607073957.GB21222@phenom.ffwll.local>
 <CADKXj+7OLRLrGo+YbxZjR7f90WNPPjT_rkcyt3GrxomCAjOjHA@mail.gmail.com>
 <20190607150420.GI21222@phenom.ffwll.local>
 <20190618021944.7ilhgaswme2a6amt@smtp.gmail.com>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1560835085;
 bh=ROX6bjPyMCjURrFP35KVTXnHB9n+5ry9VMvQqgDRnxs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=A5W2o0HxvP2s920wLWi3sSQvkYYoUu1v9V6xJZwg0tGUAIcxCec8MHDd5Yal57vnR
 uPZAIAwajPfNNDS1N4QayDL9CFvSyvAs64WDV9CRw4DtRGi4vg87uHf/2hqGUOr1Z8
 yjnjFJUp70yORYIvnVHGveLvz4Vb83XIGODkYL5U=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgSnVuZSAxOCwgMjAxOSA1OjE5IEFNLCBSb2RyaWdvIFNpcXVlaXJhIDxyb2Ry
aWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4gd3JvdGU6Cj4gSSBtYWRlIHRoZSBwYXRjaCwgYnV0
IHdoZW4gSSBzdGFydGVkIHRvIHdyaXRlIHRoZSBjb21taXQgbWVzc2FnZSwgSSBqdXN0Cj4gcmVh
bGl6ZWQgdGhhdCBJIGRpZCBub3QgdW5kZXJzdGFuZCB3aHkgcG9zc2libGVfY3J0Y3Mgc2hvdWxk
IG5vdCBiZQo+IGVxdWFsIHplcm8uIFdoeSBjYW4gd2Ugbm90IHVzZSB6ZXJvPwoKSGksCgpwb3Nz
aWJsZV9jcnRjcyBpcyBhIGJpdGZpZWxkLiBJZiBpdCdzIHplcm8sIGl0IG1lYW5zIHRoZSBwbGFu
ZSBjYW5ub3QKYmUgYXR0YWNoZWQgdG8gYW55IENSVEMsIHdoaWNoIG1ha2VzIGl0IHJhdGhlciB1
c2VsZXNzLgoKVGhhbmtzLAoKU2ltb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
