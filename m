Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214513111
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 17:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446136E7ED;
	Fri,  3 May 2019 15:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3A46E7ED
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 15:21:21 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id g127so3822432vsd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 08:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0YvezgGPDJSlVp+4pyrdMSxCwplXXL5FvIIpwQyP3xc=;
 b=sposKRo/Hjy9aMDCbmBs3EnIKfzne6WDlGlHJ78bAcLSALk7y+AOt5iYpDjETCMOXM
 dzq8SRhigCFUi8jXA9FyWHDAySqnzpO0T47nxE0dcVbow2rmolXBsZpIr4v4zBxMpja9
 oE98b/hW8dLLUFi+iWIs/sP+Kha7cnFHjxvlDiRQzJ+5tY+TX6vC2ha11KyyXSHqTHuY
 x/fDWKyGR3BiSunqpdzZZ384MP2Y+JmHrZrI1maP8a2FuqfmYYFfQ5MjnM6Y7URDOzx+
 XXSiP8X3kPLMAizxpKejqjkpGwPsDjTVa5bg0n+LgODQtLaK2oMAImQAmGWrEkbphwh9
 AhWg==
X-Gm-Message-State: APjAAAUDKVvNZhPBkKJPVqC2vE/ppggvVSU/cPX2pkhuCAHzEV2wzt52
 p1MTFbxzFJedjH1QbtSyjtdy03H1F/M8Sw/pozI=
X-Google-Smtp-Source: APXvYqyxBvrGoe72nbdViqQQ2ybJXYNgIavfQGAk7WNf9SHSWFdN0BEmB4amWmtpnQUZ1LeefcElEI2PALo+F62TZT0=
X-Received: by 2002:a67:8201:: with SMTP id e1mr5983335vsd.138.1556896880507; 
 Fri, 03 May 2019 08:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190429220825.156644-1-olvaffe@gmail.com>
In-Reply-To: <20190429220825.156644-1-olvaffe@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 3 May 2019 16:20:33 +0100
Message-ID: <CACvgo50_m8S+pEHJ42di1ysHCsS_W0gKOpzdKcZ26ATfRZ2fzw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/virtio: set seqno for dma-fence
To: Chia-I Wu <olvaffe@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0YvezgGPDJSlVp+4pyrdMSxCwplXXL5FvIIpwQyP3xc=;
 b=P4l8s6pSUCPvnQKJL01eqUtriRyW/oNGxF+onhRlldwLnmamgLnRoVHVurx3nU2G9j
 T89i4nellXJ7+zP5G0Phib6wvuU9EhMsuVrJYuN+Fcg/p1bk6rqOo6a+wqnOlpU4h/Tl
 Z8UeqRDExFStlaZra5vjEHEC/fCKAzMYQ9BRPbbj1rzi/q/t6C/ULR+pZ36a6bhbMYOM
 5Bact4rs+JYlLC3viDjY+MJaxeundb0jwVDol4j6L2DPozJCBL8eBsvu3xdwmzqCZFm2
 YHMskmtWDx3Eak44yOBDBEJ9VHLHfoqmik7aQykS3S7wQrReSkeunUko/2uQV5aObZaj
 hCpQ==
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hpYS1JLAoKT24gTW9uLCAyOSBBcHIgMjAxOSBhdCAyMzowOCwgQ2hpYS1JIFd1IDxvbHZh
ZmZlQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGlzIG1vdGl2YXRlZCBieSBoYXZpbmcgbWVh
bmluZ2Z1bCBmdHJhY2UgZXZlbnRzLCBidXQgaXQgYWxzbwo+IGZpeGVzIHVzZSBjYXNlcyB3aGVy
ZSBkbWFfZmVuY2VfaXNfbGF0ZXIgaXMgY2FsbGVkLCBzdWNoIGFzIGluCj4gc3luY19maWxlX21l
cmdlLgo+Cj4gSW4gb3RoZXIgZHJpdmVycywgZmVuY2UgY3JlYXRpb24gYW5kIGNtZGJ1ZiBzdWJt
aXNzaW9uIG5vcm1hbGx5Cj4gaGFwcGVuIGF0b21pY2FsbHksCj4KPiAgIG11dGV4X2xvY2soKTsK
PiAgIGZlbmNlID0gZG1hX2ZlbmNlX2NyZWF0ZSguLi4sICsrdGltZWxpbmUtPnNlcW5vKTsKPiAg
IHN1Ym1pdF9jbWRidWYoKTsKPiAgIG11dGV4X3VubG9jaygpOwo+Cj4gYW5kIGhhdmUgbm8gc3Vj
aCBpc3N1ZS4gIEJ1dCBpbiBvdXIgZHJpdmVyLCBiZWNhdXNlIG1vc3QgaW9jdGxzCj4gcXVldWUg
Y29tbWFuZHMgaW50byBjdHJscSwgd2UgZG8gbm90IHdhbnQgdG8gZ3JhYiBhIGxvY2suICBJbnN0
ZWFkLAo+IHdlIHNldCBzZXFubyB0byAwIHdoZW4gYSBmZW5jZSBpcyBjcmVhdGVkLCBhbmQgdXBk
YXRlIGl0IHdoZW4gdGhlCj4gY29tbWFuZCBpcyBmaW5hbGx5IHF1ZXVlZCBhbmQgdGhlIHNlcW5v
IGlzIGtub3duLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hpYS1JIFd1IDxvbHZhZmZlQGdtYWlsLmNv
bT4KClRoZSBzZXJpZXMgbG9va3MgZ3JlYXQuIEZvciB0aGUgbG90OgpSZXZpZXdlZC1ieTogRW1p
bCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCi1FbWlsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
