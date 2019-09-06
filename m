Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D48CABCB4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 17:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA0A6E301;
	Fri,  6 Sep 2019 15:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D096E2F2;
 Fri,  6 Sep 2019 15:38:54 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id i78so5991715qke.11;
 Fri, 06 Sep 2019 08:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=IfEA3mYf468EoRCLgCuICwMuS6+N1Np5xB000oVK2PY=;
 b=AVJ47msEi+EypIHjIJO+JdbkAcn/2m6mwBkUUlBAjtToBFkDGKXcPutE6HdeZ0AAvT
 YyoGda2udXI9mL1sSZIUTaDpjheisUKEYXp2/FIhZAt0yC+hNlbnvNRcoVWuT6GcB5AP
 P6LxPeC6ixUP50PZT/u0QoxP1xdM5xIFTv3SblSbzTIaTzmnfIdmEzU9GxXObWwFY+Ld
 TBB8IqS6eL+CGrF3PkSmd/s18ggS5Z4IPYE6Ogs7+9ClKeI3QjXt302nHFBj/VUpnYrU
 zZgupYD7biqS6yJqiIywbVU1XZ7alo2uBOb/Bat8Rq+zWBMQaVpE0DkU3DAY6Ras92E8
 s1FA==
X-Gm-Message-State: APjAAAW0rkOldnzAA3UPLZwFpB9RDFknSJ8Za9dk6eww1a92tEApKKhB
 MpLMWiInoN7DES7JSz/AmGo=
X-Google-Smtp-Source: APXvYqxYhuc7ftHE4EyK+xubhMWGCo+lI3aMyvBILLGMbAXC9NCNN/ngV096ExeZiRtdj/MUEPI13A==
X-Received: by 2002:a05:620a:12af:: with SMTP id
 x15mr9275261qki.148.1567784333465; 
 Fri, 06 Sep 2019 08:38:53 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::e7cb])
 by smtp.gmail.com with ESMTPSA id x33sm670379qtd.79.2019.09.06.08.38.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Sep 2019 08:38:52 -0700 (PDT)
Date: Fri, 6 Sep 2019 08:38:51 -0700
From: Tejun Heo <tj@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC v4 01/16] drm: Add drm_minor_for_each
Message-ID: <20190906153851.GO2263813@devbig004.ftw2.facebook.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-2-Kenny.Ho@amd.com>
 <20190903075719.GK2112@phenom.ffwll.local>
 <CAOWid-dxxDhyxP2+0R0oKAk29rR-1TbMyhshR1+gbcpGJCAW6g@mail.gmail.com>
 <CAKMK7uEofjdVURu+meonh_YdV5eX8vfNALkW3A_+kLapCV8j+w@mail.gmail.com>
 <CAOWid-eUVztW4hNVpznnJRcwHcjCirGL2aS75p4OY8XoGuJqUg@mail.gmail.com>
 <20190904085434.GF2112@phenom.ffwll.local>
 <20190906152925.GN2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uFQqAMB1DbiEy-o2bzr_F25My93imNcg1Qh9DHe=uWQug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFQqAMB1DbiEy-o2bzr_F25My93imNcg1Qh9DHe=uWQug@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IfEA3mYf468EoRCLgCuICwMuS6+N1Np5xB000oVK2PY=;
 b=UHqDdPUbhmJl/liWV/vdWohn99T8cEN8CSdvJiDh3FkPJTs2NcuPaTj6XoKSZW60gD
 CY9TO9zm+/2VlkWn3kisviE60JrswKHcXVLhWL4UkP5+G9+wjUA0sgzW65JNwAA+6lF8
 PEJ9aPbLOWwJjYVRO5CNK+ZgASCWdlmVXUe2CRKfF4BDFAat9/+FIDUqrht1n/3Avu5p
 6UNDrjA8ITaPD28ZJEQdtJ1wcpkXEAdEXKN76MpyNfuFBiGPQ7S2yV9E1W+MyKS6Ub1c
 bRdpSUCerFi97U3jG15d4bV4AcgtaGwtvKjflXscvy0rpoGzmns/jAPB6UaIktQOkETM
 KBxA==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Kenny Ho <y2kenny@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sIERhbmllbC4KCk9uIEZyaSwgU2VwIDA2LCAyMDE5IGF0IDA1OjM2OjAyUE0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gQmxvY2sgZGV2aWNlcyBhcmUgYSBncmVhdCBleGFtcGxl
IEkgdGhpbmsuIEhvdyBkbyB5b3UgaGFuZGxlIHRoZQo+IHBhcnRpdGlvbnMgb24gdGhhdD8gRm9y
IGRybSB3ZSBhbHNvIGhhdmUgYSBtYWluIG1pbm9yIGludGVyZmFjZSwgYW5kCgpjZ3JvdXAgSU8g
Y29udHJvbGxlcnMgb25seSBkaXN0cmlidXRlIGhhcmR3YXJlIElPIGNhcGFjaXR5IGFuZCBhcmUK
YmxpbmQgdG8gcGFydGl0aW9ucy4gIEFzIHRoZXJlJ3MgYWx3YXlzIHRoZSB3aG9sZSBkZXZpY2Ug
TUFKOk1JTiBmb3IKYmxvY2sgZGV2aWNlcywgd2Ugb25seSB1c2UgdGhhdC4KCj4gdGhlbiB0aGUg
cmVuZGVyLW9ubHkgaW50ZXJmYWNlIG9uIGRyaXZlcnMgdGhhdCBzdXBwb3J0IGl0LiBTbyBpZiBi
bGtjZwo+IGhhbmRsZXMgdGhhdCBieSBvbmx5IGV4cG9zaW5nIHRoZSBwcmltYXJ5IG1hajptaW4g
cGFpciwgSSB0aGluayB3ZSBjYW4KPiBnbyB3aXRoIHRoYXQgYW5kIGl0J3MgYWxsIG5pY2VseSBj
b25zaXN0ZW50LgoKQWggeWVhaCwgdGhhdCBzb3VuZHMgZXF1aXZhbGVudC4gIEdyZWF0LgoKVGhh
bmtzLgoKLS0gCnRlanVuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
