Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF51D5DFC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C10A89E05;
	Mon, 14 Oct 2019 08:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F06D89E05
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:58:15 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r9so14091414edl.10
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 01:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=IAI2lUgyEQOj+0ZRS5Q8Y5emicMRFkBUCp4oBKdksF0=;
 b=V/S+q2J2lnbRy0TJUMvILFJTRyCqphZexRyHPQnxFOfBHFZYb8kQU2515GfTP+Fzn9
 3GyzuAe9njQNidhOP4xT+yNbi7RNQdD1qzILl420FXbR93xTEAJvWMgrz+y/S1l8kxC+
 t9n/4K3MyQEt8lxlc0CCdgn2AzniL3tTe3DmB05QNHEasZJxn0/awchfmZ3zuRL05+pQ
 WWYGtL1B5VTk+Fg4t47o8c8uPK8RIXto88VKCiclwgD9T25iUaEYlTs4WvzVTIq43Yya
 XsCCJ2bE0586iT3Ho+rHNpwCVNgRMki53X1tArKpiAP2QHRD1/nUfkIlTNn2Li5EHG+E
 W1FQ==
X-Gm-Message-State: APjAAAW7BPpcHZ2VKu/wN+1LF/GRkqQKkTk53zN4j97SzHByxdTMLLmn
 HckXmKrLdgOwhTuKeFOl1YKUzg==
X-Google-Smtp-Source: APXvYqz1oxDrLx2ydbGRBLlqyUlZ19lf/ht31+w1Zxqaa6hQ9I9alT0DObnK9/w+P79eyzAmi4wd7A==
X-Received: by 2002:a17:906:5388:: with SMTP id
 g8mr27305579ejo.278.1571043493601; 
 Mon, 14 Oct 2019 01:58:13 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z65sm3135675ede.86.2019.10.14.01.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 01:58:13 -0700 (PDT)
Date: Mon, 14 Oct 2019 10:58:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4] drm/ioctl: Add a ioctl to label GEM objects
Message-ID: <20191014085810.GG11828@phenom.ffwll.local>
References: <20191011143009.17503-1-rohan.garg@collabora.com>
 <CAPj87rOMMdi0zUdjEKeiUsLpfQkTPf3adEfw13ur6UQtNdNUxQ@mail.gmail.com>
 <41425496-d121-8d51-991e-b3025b787c49@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41425496-d121-8d51-991e-b3025b787c49@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IAI2lUgyEQOj+0ZRS5Q8Y5emicMRFkBUCp4oBKdksF0=;
 b=boCEcF0f1Lx6louPX4nvW/pUvDlYIGHcJcBy1iYL/Zq9myHs2Mig8H/kzmvJCpmbeP
 Eo0Zn71i2lXwteiY3wnfmYAvja3dc8aPWPg7H6uJvPyZfB++XA5SRi+z6nU9M3fhswSf
 robCVHG+h9gT5QpN5Se+YBarD2be46YSVqE38=
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
Cc: Rohan Garg <rohan.garg@collabora.com>, kernel@collabora.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDc6NTU6MzZQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAxMS4xMC4xOSB1bSAxOTowOSBzY2hyaWViIERhbmllbCBT
dG9uZToKPiA+IEhpIFJvaGFuLAo+ID4gCj4gPiBPbiBGcmksIDExIE9jdCAyMDE5IGF0IDE1OjMw
LCBSb2hhbiBHYXJnIDxyb2hhbi5nYXJnQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+ID4gPiBEUk1f
SU9DVExfRFVNQl9TRVRfTEFCRUwgbGV0cyB5b3UgbGFiZWwgR0VNIG9iamVjdHMsIG1ha2luZyBp
dAo+ID4gPiBlYXNpZXIgdG8gZGVidWcgaXNzdWVzIGluIHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMu
Cj4gPiAKPiA+IEknbSBub3Qgc3VyZSBpZiB0aGlzIHdhcyBwb2ludGVkIG91dCBhbHJlYWR5LCBi
dXQgZHVtYiBidWZmZXJzICE9IEdFTQo+ID4gYnVmZmVycy4gR0VNIGJ1ZmZlcnMgX2Nhbl8gYmUg
ZHVtYiwgYnV0IG1pZ2h0IG5vdCBiZS4KPiA+IAo+ID4gQ291bGQgeW91IHBsZWFzZSByZW5hbWUg
dG8gR0VNX1NFVF9MQUJFTD8KPiAKPiBUaGlzIGNoYW5nZSB0byBidWlsZCB1cG9uIGR1bWIgYnVm
ZmVycyB3YXMgc3VnZ2VzdGVkIGJ5IG1lLCBhcyBkdW1iIGJ1ZmZlcnMKPiBpcyB0aGUgY2xvc2Vz
IHRoaW5nIHRoZXJlIGlzIHRvIGEgYnVmZmVyIG1hbmFnZW1lbnQgaW50ZXJmYWNlLiBEcml2ZXJz
IHdpdGgKPiAnc21hcnQgYnVmZmVycycgd291bGQgaGF2ZSB0byBhZGQgdGhlaXIgb3duIGlvY3Rs
IGludGVyZmFjZXMuCgpXZSBhbHJlYWR5IGhhdmUgc29tZSBJT0NUTHMgdGhhdCBhcHBseSB0byBn
ZW0gYnVmZmVycywgbm90IGp1c3QgZHVtYgpidWZmZXJzLCBzbyBHRU1fU0VUX0xBQkVMIHNlZW1z
IGEgbG90IG1vcmUgcmVhc29uYWJsZSB0byBtZSwgdG9vLgoKPiBXaGF0IEkgcmVhbGx5IG1pc3Mg
aGVyZSBpcyBhIHVzZXJzcGFjZSBhcHBsaWNhdGlvbiB0aGF0IHVzZXMgdGhpcwo+IGZ1bmN0aW9u
YWxpdHkuIEl0IHdvdWxkIGJlIG11Y2ggZWFzaWVyIHRvIGRpc2N1c3MgaWYgdGhlcmUgd2FzIGFu
IGFjdHVhbAo+IGV4YW1wbGUuCgorMS4KCkNoZWVycywgRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
