Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55E1D5C29
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019D56E115;
	Mon, 14 Oct 2019 07:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7AC6E040
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 16:04:29 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.155.250]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MMZck-1iRY9X1pYU-008HQo; Sat, 12
 Oct 2019 18:04:17 +0200
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: drm/nouveau: Checking a kmemdup() call in
 nouveau_connector_of_detect()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5ff56ca3-0e20-2820-f981-d2d37dded133@web.de>
Date: Sat, 12 Oct 2019 18:04:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:eSnIYSIfwQ+qZ88AQSHhpkJEQSkiQV8bWwDZf3F/859qwwhUw2p
 yjCEEUP2esK1O7eoNBr+i2vPIvHTcJKyh/9qIA6rC7yig/ErwTU4gVgD1jwFG72yLowrxvC
 EZ+Xn1E6Br2aEk5op+xfHL+vpOsBkCiP0+GUvtvTyuGYlRhFgLuyj1O8rF2kL6XpwXVdhJ4
 SQOrJ1nQazQiiF3oBgnGA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TGctBN2vpf0=:Zm0dRMNMZuTyFvygAuu02A
 F9VWPbYChpxZwCmUIkNRdvOVLJQnxefkbpM1KuYofME+BWFRgBw1VlFC7ZVcweFcVGykeM8R1
 mSoX1mUYuLqn1dtHTLwhnwgX9NafAI7fzSDs9ZaIT3bBpJgVv735Gp2EQHbin3UGVBzJ7xdFF
 M42tRX+yXFznT6q0ptDrWWHhZ9o3URJ87SLN+EgmV3jmuCLYYlzam8p47i8aJPkWY7YE5M7dY
 nQpnNsssy1rQaG7g7zZx4jCpGf0Ctnkypl3A7xWvN9BrabtdnxxMs94UuToZoIN3r13FvSX8g
 Tc7yquinUVopfAWTBEntKYYXywTnIgNjG6L+0Hu2ZPNrB5TuemO7Z2qDltY8lLTc/C6anJZ4B
 KFlkew493gdqV5EdaGy0JeFIcaW/PJipetSMmvKyMCiIbJvVA6rrawH2O/VkBOnf2imlG+It6
 5VptJTTjm2coejql5g9rioBYY/D+wv2Crl3KxPlbZ2qapeaCqL1Tmh/sp9yMYDaXdGS8UdVs2
 T/pmXrt+pKi9bvXG8/fXVABrA0vPJPcBsykNWyaG3cmB6ojvn7GcI4eVquhtULfPjFDkZkQm3
 19KpklM7Jy38gJItXaBpSALijAA+2IQpAAAjaoOBWFiwjAGP+jQMXBDboc7JouNFJJt5AzA60
 TWC+OAa9dK7QMvmjGG3wRBYKnrUYw6TaySdNr3+NXkvxFr93sP5XiIy2o1x6xiW4JntYkBLeE
 cFhnzrzs3jMjSQAv+EqXRQgYW1fmY59xnSuk1n774vJx/SzjDlb5SCA754kL/cC+gMdTC7v5T
 LUzV4pGJuMEUD94ipy+Hz6SQJPe5Juu2Eq203B0azkWXKeG2Snotj/d0y6ZYd4dxz49I51l0I
 4G413AJJ8eXTgA6BtJuDd3WYvIYb6CDRy6uKIpsYCoT8zKb8yvNfxCgMv/EnxiWpTKiWUiL0z
 OJi5Tyv+s/kgUErWiPRr5KmZX2Nk6wSUak079Ors5vsqr3gNjPQvONr4xZBPEvcr7UlEaqM8D
 hvxdMYtflQTBYTnIAQC/f6qu/cxE15+7meOntNU4bEMpyCmhhkCqEEs8udiBts+T20Fi54Y2H
 FHnF+R1G3M0Kt//M422ZtfAGVAhNF7wg4QnuAPjo3dMox+pPjw9eZ+Xcd9y0+PWp6LGRBhnZe
 c8+X1RcSTq/sINC/x7DwgivPeu3WMd4RaV6PhXwgXMlxVJutkOUXO0lMQNEBc/7xd70uOXOUr
 IlCc1dzWnvwBzkacPLuwDFHBNpQ162igkmIJdobG5vQVHOIfpn65FNtt+cs0=
X-Mailman-Approved-At: Mon, 14 Oct 2019 07:17:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1570896257;
 bh=OLEXXVfve/Mn5qOXyqXGU5UQD25/gN2N9FJAnOdynQo=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=sJDOD02wHxRvR0HLbLlzPOhA2+i1S8gpYVHOfavP/cvrq2DXrOUJtOpKT+bQiMagl
 ZGibU2BelHoZnWpXddGVQq5nNp62qpQlVBr3/soHYX8ReeccJN3rptaenvSxzlmSbG
 V4K5E/DKnkvgEJ5pd2LTVAuWXCum/Ordqp9wdz4k=
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
Cc: kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJIHRyaWVkIGFub3RoZXIgc2NyaXB0IGZvciB0aGUgc2VtYW50aWMgcGF0Y2ggbGFu
Z3VhZ2Ugb3V0LgpUaGlzIHNvdXJjZSBjb2RlIGFuYWx5c2lzIGFwcHJvYWNoIHBvaW50cyBvdXQg
dGhhdCB0aGUgaW1wbGVtZW50YXRpb24Kb2YgdGhlIGZ1bmN0aW9uIOKAnG5vdXZlYXVfY29ubmVj
dG9yX29mX2RldGVjdOKAnSBjb250YWlucyBzdGlsbAphbiB1bmNoZWNrZWQgY2FsbCBvZiB0aGUg
ZnVuY3Rpb24g4oCca21lbWR1cOKAnS4KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYz9pZD0xYzBjYzVmMWFlNWVlNWE2OTEzNzA0YzBkNzVh
NmU5OTYwNGVlMzBhI240NzYKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuNC1y
YzIvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMjTDQ3
NgoKSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBpbXByb3ZlIGl0PwoKUmVnYXJkcywKTWFya3Vz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
