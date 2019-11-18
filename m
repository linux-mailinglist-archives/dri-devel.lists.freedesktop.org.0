Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1AF100D1C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 21:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029BE898C4;
	Mon, 18 Nov 2019 20:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6F989856
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:27:27 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-9dsYt_FyMbeWNyZRwkaf5A-1; Mon, 18 Nov 2019 15:27:22 -0500
Received: by mail-wm1-f72.google.com with SMTP id 2so701868wmd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4CSRr0wqSYSaWBGreVA5UshqfJyUlItqJkHJJ7DXvXA=;
 b=QTIggWYHsMwzWjpE5V7U2O/3C+rHGvZPRqCgYVvDQMb7TAtk/b//2viWbdyUQBmc3f
 Wvu1oCCwKCvPDYJ3WsRMuNGpQpYAn1/0XPDeVxWAWw2IxV0dSaRR85hyaS7bKuLfFaPK
 We+WLKZZnz2n901GLjdBxJChgD+Ps5gYZ02cIcFEivST21uNMVjswO0Jb6jbfQ+Ulxgm
 HXVoUA0cHKwbA5OXQ51deCIIItfVJMawZyZvZiCot5xUGf0aEg6M7UhLM2Wn+I8u4LTr
 qYbQwtwlNCE9bC0Fq6VDdfVEnmGvN1HyTnJ8eI7paRWQscpc63nkQKWxoP65qgJOHUcY
 qIkg==
X-Gm-Message-State: APjAAAWPI1+4YsDl4EojG9FxJjq3ZzDKEzWW+S11wPDHPOrJ3BxA7QgO
 0M9e4mwLVF2m5dgujYCyVskn+rLnCnpvkFBKD6sEXDhBREdpX4kBmentYvsXrU2tY6CstsM+5v6
 I4v0fPsmP6kTbuLspAYA/ifFLX062
X-Received: by 2002:a5d:490c:: with SMTP id x12mr19881088wrq.301.1574108841336; 
 Mon, 18 Nov 2019 12:27:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqw31yFDrp/nUVQehJkoIE0NmJKGe+zacK1mZHaf8dckH0iFWZ5NwNGMNlo/b/EQ1sdZlgIyIA==
X-Received: by 2002:a5d:490c:: with SMTP id x12mr19881034wrq.301.1574108841171; 
 Mon, 18 Nov 2019 12:27:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id l10sm27849030wrg.90.2019.11.18.12.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:27:20 -0800 (PST)
Date: Mon, 18 Nov 2019 15:27:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Message-ID: <20191118152642-mutt-send-email-mst@kernel.org>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
 <20191118134056.GJ3873@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191118134056.GJ3873@mellanox.com>
X-MC-Unique: 9dsYt_FyMbeWNyZRwkaf5A-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574108846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrzR/CZ37kLKu+aMpz2wgHs5trU1arLDMcmgOmdvzKE=;
 b=PUCYM14KywdSyVuRQS5XSnuYCLip4NjEHHW8e5agAcwlmAT59SIZ0WIT7fH0WxY5Bpy7M0
 Fxiiz1NNzA/M3PSPxYfptEmNzSaEsC57KMq/vy9yTQCXOU6thw0PJw3uL3Wl7CYf8fPyst
 Bg3NUoOlZYsOEu/tK9HGCb+OPOtjYVE=
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
Cc: "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>, "airlied@linux.ie" <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "aadam@redhat.com" <aadam@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDE6NDE6MDBQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDA2OjU5OjIxUE0gKzA4MDAsIEphc29u
IFdhbmcgd3JvdGU6Cj4gPiArc3RydWN0IGJ1c190eXBlIG1kZXZfdmlydGlvX2J1c190eXBlOwo+
ID4gKwo+ID4gK3N0cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Ugewo+ID4gKwlzdHJ1Y3QgbWRldl9k
ZXZpY2UgbWRldjsKPiA+ICsJY29uc3Qgc3RydWN0IG1kZXZfdmlydGlvX29wcyAqb3BzOwo+ID4g
Kwl1MTYgY2xhc3NfaWQ7Cj4gPiArfTsKPiAKPiBUaGlzIHNlZW1zIHRvIHNoYXJlIG5vdGhpbmcg
d2l0aCBtZGV2IChpZSBtZGV2LXZmaW8pLCB3aHkgaXMgaXQgb24gdGhlCj4gc2FtZSBidXM/CgpJ
IG11c3QgYmUgbWlzc2luZyBzb21ldGhpbmcgLSB3aGljaCBidXMgZG8gdGhleSBzaGFyZT8KCi0t
IApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
