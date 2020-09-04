Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC8425E26D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 22:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804F46ECBE;
	Fri,  4 Sep 2020 20:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AE46ECBF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599250198;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6rQ59xajIxGZbPw2cjujt12Zk2m76tYPqmr/VnwJAs=;
 b=f08N05jFtntfr1r0YE8YMyA/JF0OcIJwsP6tqcDGJAHloIN+hQ+Exju+I9lUYzO/89xDao
 fWUkoFvIpEM1kOzBFy+OQq7smXofha4pQXkrXvdWMcEAksavBJkoKHR98oiiWmWPU29bdk
 PqSRxoAPnZLR4pMa9tR95Es85oA917E=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-S6ZUf39lNAqr9m2EBS-F0w-1; Fri, 04 Sep 2020 16:09:56 -0400
X-MC-Unique: S6ZUf39lNAqr9m2EBS-F0w-1
Received: by mail-qt1-f197.google.com with SMTP id s33so5087413qth.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 13:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=/6rQ59xajIxGZbPw2cjujt12Zk2m76tYPqmr/VnwJAs=;
 b=e0lL4cNrvJ8yQSNy7CoVyKDpDR8I+bQnwI2zFaCiw8PBQAfPlspMRw7Tv/vd20AGON
 o8j0pT3VTOx/qCSy/3fza0c7u6bb3naDvgbs+PjP+u2Mlw4OuiQfasubigMNBNclFCAr
 2BEUSMJ37xwbtk8Ed3/yRjEZ4oefurMmIuoQwFQdzU1JX6luuzSWigUphGeBZNl6//5g
 LFlltTlv40bspwP+fTnHdY0X/DBzfGdoSa1Ot0OrykpTi3lPW09Ezhg/KRbZpn7Jqkf0
 xlR/S3hnkXLZLdkzyQ2//HnKY86dAJo4ccMmwVY067tNQ7j7tuLOKU6Gsi0MuJGjGI9+
 fqzA==
X-Gm-Message-State: AOAM53359BdYSMf3L6JVNJ1Qzn2+P4uTdxDlgVNVh3KcWnT/8ZKv90O4
 Oi1Q5QJrgS+L3FiNXcKE0HSPZfHv3/7lOCYA6Kjctu5ewRlo8p9KJyGd4TT18aYZafsLPmstO1h
 slvv0vctHITa3MKEMho8dNUQTyef0
X-Received: by 2002:a05:6214:5cf:: with SMTP id
 t15mr9719545qvz.119.1599250195764; 
 Fri, 04 Sep 2020 13:09:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztmzPw1zc9Dzwgd/OFB+NA4j8aAzrnN18BGv9RW3sYRkPfbBPFjmwSkQEXWsyYAC+TW//Olg==
X-Received: by 2002:a05:6214:5cf:: with SMTP id
 t15mr9719529qvz.119.1599250195510; 
 Fri, 04 Sep 2020 13:09:55 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id h199sm5269843qke.112.2020.09.04.13.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 13:09:54 -0700 (PDT)
Message-ID: <57c23dd39dba145f0c4de978d1fd05e8f26af774.camel@redhat.com>
Subject: Re: [PATCH v2 00/18] drm/i915: Pimp DP DFP handling
From: Lyude Paul <lyude@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Fri, 04 Sep 2020 16:09:54 -0400
In-Reply-To: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2lsbCB0cnkgdG8gbG9vayBhdCB0aGlzIHRvZGF5LCBpZiBJIGRvbid0IGhhdmUgdGhlIHRpbWUg
dGhvdWdoIEknbGwgZGVmaW5pdGVseQpoYXZlIHRoZSB0aW1lIG9uIFR1ZXNkYXkKCk9uIEZyaSwg
MjAyMC0wOS0wNCBhdCAxNDo1MyArMDMwMCwgVmlsbGUgU3lyamFsYSB3cm90ZToKPiBGcm9tOiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IAo+IEF0dGVt
cHQgdG8gZGVhbCB3aXRoIERQIGRvd25zdHJlYW0gZmFjaW5nIHBvcnRzIChERlApIG1vcmUKPiB0
aG9yb3VnaGx5LiBUaGlzIGludm9sdmVzIHJlYWRpbmcgbW9yZSBvZiB0aGUgcG9ydCBjYXBzCj4g
YW5kIGRlYWxpbmcgd2l0aCB2YXJpb3VzIGNsb2NrL2JwYyBsaW1pdGF0aW9ucy4KPiAKPiBBbmQg
d2UgdHJ5IHRvIGVuYWJsZSBZQ2JDciA0NDQtPjQyMCBjb252ZXJzaW9uIGZvciBIRE1JIERGUHMK
PiB3aGljaCBjb3VsZCBhbGxvdyBzb21lIDRrIGRpc3BsYXlzIHRvIGFjdHVhbGx5IHVzZSA0ayBv
bgo+IHByZS1pY2wgaGFyZHdhcmUgKHdoaWNoIGRvZXNuJ3QgaGF2ZSBuYXRpdmUgNDIwIG91dHB1
dCksCj4gYXNzdW1pbmcgd2UgZG9uJ3QgcnVuIGludG8gc29tZSBvdGhlciBoYXJkd2FyZSBsaW1p
dHMuCj4gCj4gSSBkcm9wcGVkIG15IGVhcmxpZXIgcGF0Y2hlcyB0byBhbHNvIGhvb2sgaW4gdGhl
IERQIGR1YWwgbW9kZQo+IGFkYXB0ZXIgcHJvYmluZyBzaW5jZSBzYWRseSBJJ3ZlIG5vdCBhY3R1
YWxseSBzZWVuIGEgRFAtPkRQKysKPiBkb25nbGUgdGhhdCBwYXNzZXMgdGhyb3VnaCB0aGUgaTJj
IHRyYWZmaWMgZm9yIHRob3NlLgo+IAo+IE9ubHkgcGltcGVkIHRoZSBTU1Qgc2lkZSBvZiB0aGlu
Z3MuIE5vdCBzdXJlIHdoYXQgd291bGQKPiBiZSByZXF1aXJlZCB0byBnZXQgaXQgYWxsIHdvcmtp
bmcgZm9yIE1TVC4KPiAKPiBWaWxsZSBTeXJqw6Rsw6QgKDE4KToKPiAgIGRybS9kcDogRHVtcCBk
b3duc3RyZWFtIGZhY2luZyBwb3J0IGNhcHMKPiAgIGRybS9pOTE1L2xzcGNvbjogRG8gbm90IHNl
bmQgaW5mb2ZyYW1lcyB0byBub24tSERNSSBzaW5rcwo+ICAgZHJtL2RwOiBEZWZpbmUgcHJvdG9j
b2wgY29udmVydGVyIERQQ0QgcmVnaXN0ZXJzCj4gICBkcm0vZHA6IERlZmluZSBtb3JlIGRvd25z
dHJlYW0gZmFjaW5nIHBvcnQgY2Fwcwo+ICAgZHJtL2k5MTU6IFJld29ya2QgREZQIG1heCBicGMg
aGFuZGxpbmcKPiAgIGRybS9kcDogQWRkIGhlbHBlcnMgdG8gaWRlbnRpZnkgZG93bnN0cmVhbSBm
YWNpbmcgcG9ydCB0eXBlcwo+ICAgZHJtL2RwOiBQaW1wIGRybV9kcF9kb3duc3RyZWFtX21heF9i
cGMoKQo+ICAgZHJtL2RwOiBSZWRvIGRybV9kcF9kb3duc3RyZWFtX21heF9jbG9jaygpIGFzCj4g
ICAgIGRybV9kcF9kb3duc3RyZWFtX21heF9kb3RjbG9jaygpCj4gICBkcm0vaTkxNTogUmV3b3Jr
ZCBEUCBERlAgY2xvY2sgaGFuZGxpbmcKPiAgIGRybS9kcDogQWRkIGRybV9kcF9kb3duc3RyZWFt
X3ttaW4sbWF4fV90bWRzX2Nsb2NrKCkKPiAgIGRybS9pOTE1OiBEZWFsIHdpdGggVE1EUyBERlAg
Y2xvY2sgbGltaXRzCj4gICBkcm0vaTkxNTogQ29uZmlndXJlIERQIDEuMysgcHJvdG9jb2wgY29u
dmVydGVkIEhETUkgbW9kZQo+ICAgZHJtL2RwOiBBZGQgZHJtX2RwX2Rvd25zdHJlYW1fbW9kZSgp
Cj4gICBkcm0vaTkxNTogSGFuZGxlIGRvd25zdHJlYW0gZmFjaW5nIHBvcnRzIHcvbyBFRElECj4g
ICBkcm0vaTkxNTogRXh0cmFjdCBpbnRlbF9oZG1pX2hhc19hdWRpbygpCj4gICBkcm0vaTkxNTog
RFAtPkhETUkgVE1EUyBjbG9jayBsaW1pdHMgdnMuIGRlZXAgY29sb3IKPiAgIGRybS9kcDogQWRk
IGhlbHBlcnMgZm9yIERGUCBZQ2JDciA0OjI6MCBoYW5kbGluZwo+ICAgZHJtL2k5MTU6IERvIFlD
YkNyIDQ0NC0+NDIwIGNvbnZlcnNpb24gdmlhIERQIHByb3RvY29sIGNvbnZlcnRlcnMKPiAKPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyAgICAgICAgICAgICAgIHwgMzgyICsrKysr
KysrKysrKysrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyAgICAgICAgICAgICAg
ICAgICAgfCAgMTkgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5j
ICAgICAgfCAgMTEgKy0KPiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1
Z2ZzLmMgIHwgICAzICstCj4gIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlw
ZXMuaCAgICB8ICAgOSArCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
YyAgICAgICB8IDMwNCArKysrKysrKysrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwLmggICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2hkbWkuYyAgICAgfCAgODIgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2hkbWkuaCAgICAgfCAgIDIgKwo+ICBpbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmggICAgICAgICAgICAgICAgICAgfCAgNjMgKystCj4gIGluY2x1ZGUvZHJtL2RybV9lZGlk
LmggICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArCj4gIDExIGZpbGVzIGNoYW5nZWQsIDcz
OCBpbnNlcnRpb25zKCspLCAxNDIgZGVsZXRpb25zKC0pCj4gCi0tIApTaW5jZXJlbHksCiAgICAg
IEx5dWRlIFBhdWwgKHNoZS9oZXIpCiAgICAgIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
