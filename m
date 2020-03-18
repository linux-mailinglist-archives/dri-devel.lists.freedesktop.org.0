Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC5C18AE00
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793CC6E9A0;
	Thu, 19 Mar 2020 08:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE716E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 13:54:09 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id q73so3460672qvq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=0vAK6bgP1fJk3zBsCQu8c0nozdF7vV0PFML1GwgRVhY=;
 b=olu0AYnQdt38yfSM/uRMmwlq7V45qWh0JqyEUbyuygUPtzABU7albZvdxuE+nxxtiD
 pL0b/kF03f7TghMHoycWrMrkSwTOVr9YN7W8uf2Er2ZmoQsNODQMYvN03EjRI8LH7fvG
 DaoCFnA+OUFiFft81i2QtjDkgMBllQN57Ll+1PE9DB3s/R95U56ZGrbVMOkmA2suCttS
 dC6/7qhB9kOjoxqdBVEBeZF7J5RPt8JmJxKDH2i1PfZEoYQvsifCx8rlDVOoFAHJ8w8q
 9dG26ALcFxvW+Obnrbo9vggQzPsfz59AEpEq5pdwQ57NfC/sKA+KX8IboYFL49gtUGVF
 3bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=0vAK6bgP1fJk3zBsCQu8c0nozdF7vV0PFML1GwgRVhY=;
 b=oQMwWMCeaQFJc2yByogxKx9eonijcbtDOSSR3HqhjclJ004LB4uloDtpjUibOojGRq
 iRE+0RlxLGnmq0DBLUsrAnObPVRE2nCrt0XT5taYkehqAsgs/LhLLqkz45QsnxJr9FYZ
 lG4y/YStDCo32WsRxhAAZluz3uihU74bdZ0Dti+dgZi6pyVoges9n6IFfvPcwNtMDMmt
 HhtUzcsd/nbq9CnYn4lPxG8GsGGRO6cJloNK3hAdZB7VLcXes6HxSQUNzm++Kd/+v09r
 VFLhUQ8VemftlSlAebjuQp+lSWKJ4s/kHc9fsa8cMzfZo+xIj20zg0s1aG28g1btx69Q
 Hdgw==
X-Gm-Message-State: ANhLgQ2U3UBZNzQvFGTh+SuQ1JA1q7Iqdx0RpvwYZ7jABte5LSzWZ9zI
 mQhd7edwUkJNlRmhJECQtxFOyQ==
X-Google-Smtp-Source: ADFU+vvl5wY5Nwjh++sNYGXAhGqQmb8F+Dg5/kLkl/TkBDgPXSBvyT6A5zAaMj45MijllChuvIFwIg==
X-Received: by 2002:a0c:c344:: with SMTP id j4mr4384963qvi.51.1584539648117;
 Wed, 18 Mar 2020 06:54:08 -0700 (PDT)
Received: from skullcanyon
 (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
 by smtp.gmail.com with ESMTPSA id y13sm1221167qtk.6.2020.03.18.06.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 06:54:07 -0700 (PDT)
Message-ID: <133fd2afd3b5add0f376b73f0f70b369b418a34d.camel@ndufresne.ca>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, Lucas Stach
 <dev@lynxeye.de>, Jacob Lifshay <programmerjake@gmail.com>, Jason Ekstrand
 <jason@jlekstrand.net>
Date: Wed, 18 Mar 2020 09:54:05 -0400
In-Reply-To: <14115064-24e5-da2c-38c6-f3ba0d447b18@daenzer.net>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
 <14115064-24e5-da2c-38c6-f3ba0d447b18@daenzer.net>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists .
 freedesktop . org" <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyY3JlZGkgMTggbWFycyAyMDIwIMOgIDExOjA1ICswMTAwLCBNaWNoZWwgRMOkbnplciBh
IMOpY3JpdCA6Cj4gT24gMjAyMC0wMy0xNyA2OjIxIHAubS4sIEx1Y2FzIFN0YWNoIHdyb3RlOgo+
ID4gVGhhdCdzIG9uZSBvZiB0aGUgaXNzdWVzIHdpdGggaW1wbGljaXQgc3luYyB0aGF0IGV4cGxp
Y2l0IG1heSBzb2x2ZTogCj4gPiBhIHNpbmdsZSBjbGllbnQgdGFraW5nIHdheSB0b28gbXVjaCB0
aW1lIHRvIHJlbmRlciBzb21ldGhpbmcgY2FuIAo+ID4gYmxvY2sgdGhlIHdob2xlIHBpcGVsaW5l
IHVwIHVudGlsIHRoZSBkaXNwbGF5IGZsaXAuIFdpdGggZXhwbGljaXQgCj4gPiBzeW5jIHRoZSBj
b21wb3NpdG9yIGNhbiBqdXN0IGRlY2lkZSB0byB1c2UgdGhlIGxhc3QgY2xpZW50IGJ1ZmZlciBp
ZiAKPiA+IHRoZSBsYXRlc3QgYnVmZmVyIGlzbid0IHJlYWR5IGJ5IHNvbWUgZGVhZGxpbmUuCj4g
Cj4gRldJVywgdGhlIGNvbXBvc2l0b3IgY2FuIGRvIHRoaXMgd2l0aCBpbXBsaWNpdCBzeW5jIGFz
IHdlbGwsIGJ5IHBvbGxpbmcKPiBhIGRtYS1idWYgZmQgZm9yIHRoZSBidWZmZXIuIChDdXJyZW50
bHksIGl0IGhhcyB0byBwb2xsIGZvciB3cml0YWJsZSwKPiBiZWNhdXNlIHdhaXRpbmcgZm9yIHRo
ZSBleGNsdXNpdmUgZmVuY2Ugb25seSBpc24ndCBlbm91Z2ggd2l0aCBhbWRncHUpCgpUaGF0IGlz
IHZlcnkgaW50ZXJlc3RpbmcsIHRoYW5rcyBmb3Igc2hhcmluZywgY291bGQgYWxsb3cgZml4aW5n
IHNvbWUKaXNzdWVzIGluIHVzZXJzcGFjZSBmb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4KCnRo
YW5rcywKTmljb2xhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
