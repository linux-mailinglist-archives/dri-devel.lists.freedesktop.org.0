Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06761157BB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 20:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770766FA81;
	Fri,  6 Dec 2019 19:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2296FA81
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 19:24:17 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-sGYhjMSRNJOtm2kmSsYD-Q-1; Fri, 06 Dec 2019 14:24:14 -0500
Received: by mail-qt1-f197.google.com with SMTP id v25so1285138qtq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 11:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=S8lr3mwGxXhI82WmKp3XKXy3xSh21+B3Dvk4LNThQO0=;
 b=qLnlQOYF+myrKuOy6ujyptiy3ibR/bOBHKUEmh5PbE99OinMpVuk2ybp2ZHZKJVIGR
 e8zVYARI4Xnk3abSCtURhxGT5R4DuKSCzGwaZAYfKi9p7LwM6iowW9aVblnJse+Nwzw/
 50vrrE/Dt2KyLJ1/lMIXy/twOEJNMjfUbYx0cB3F+RDOnZOOLMNUpbmRPtKQduLtyM+W
 bKLp1/YVE0DYPcC3Nh7s9bA8ZBsSu5Cw6iFwjSUNhSxBeDWV5i9B/qPtsSAL0MuM19oO
 1EYBrIATQPGgczDdYMUxKjA0bA6F9WfkCRIyBXloJ4PopJ0yaeV0F3Oc6KnXaLVCBkp4
 ZEtQ==
X-Gm-Message-State: APjAAAWX8J58Ycc3QZ+MI1nas8kgyMH37A+dUjHlnNnHpPQs4EO3qbRG
 jRXZ1ZorXilSR/xeSh2IqanRYwbTubVgC0/Pdf/7mwLU7Mu0bA6teWpqvlERNzzTpbjXkn4KWbN
 L4OELuBMbGCfVVA9akuavKnzC7hRD
X-Received: by 2002:ac8:67cb:: with SMTP id r11mr13999618qtp.54.1575660253732; 
 Fri, 06 Dec 2019 11:24:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwX3PjTHrOow2vN7EK2A8jxrFjf0XyZzUwkotrX3+LAqSHG3uRAB0KHOmew9nARPynN51H3Ug==
X-Received: by 2002:ac8:67cb:: with SMTP id r11mr13999592qtp.54.1575660253395; 
 Fri, 06 Dec 2019 11:24:13 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 17sm6285222qkk.81.2019.12.06.11.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 11:24:12 -0800 (PST)
Message-ID: <a6c4db964da7e00a6069d40abcb3aa887ef5522b.camel@redhat.com>
Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology mgr
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Fri, 06 Dec 2019 14:24:11 -0500
In-Reply-To: <20191205090043.7580-1-Wayne.Lin@amd.com>
References: <20191205090043.7580-1-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: sGYhjMSRNJOtm2kmSsYD-Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575660256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8lr3mwGxXhI82WmKp3XKXy3xSh21+B3Dvk4LNThQO0=;
 b=KWUGTQ1CGpBVYm8UZLUE+wHC5StPlofU7iNWayPSrfyI4mcHU2qVsyuzVDWSDXmw0m7t08
 +TrEumcu6SVsSgq6WFUafD4L/JRuAdLu+rTYCk2BAGTWkTx+VnbMHQwrPjs5ZuRTmU53R3
 +JTNAoPepOYjllwCyPSZAlqY8yRkdJ8=
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
Cc: jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpJJ2xsIGdvIGFoZWFk
IGFuZCBwdXNoIHRoaXMgdG8gZHJtLW1pc2MtbmV4dC1maXhlcyByaWdodCBub3csIHRoYW5rcyEK
Ck9uIFRodSwgMjAxOS0xMi0wNSBhdCAxNzowMCArMDgwMCwgV2F5bmUgTGluIHdyb3RlOgo+IFtX
aHldCj4gCj4gVGhpcyBwYXRjaCBpcyB0cnlpbmcgdG8gYWRkcmVzcyB0aGUgaXNzdWUgb2JzZXJ2
ZWQgd2hlbiBob3RwbHVnIERQCj4gZGFpc3kgY2hhaW4gbW9uaXRvcnMuCj4gCj4gZS5nLgo+IHNy
Yy1tc3RiLW1zdGItc3N0IC0+IHNyYyAodW5wbHVnKSBtc3RiLW1zdGItc3N0IC0+IHNyYy1tc3Ri
LW1zdGItc3N0Cj4gKHBsdWcgaW4gYWdhaW4pCj4gCj4gT25jZSB1bnBsdWcgYSBEUCBNU1QgY2Fw
YWJsZSBkZXZpY2UsIGRyaXZlciB3aWxsIGNhbGwKPiBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9z
ZXRfbXN0KCkgdG8gZGlzYWJsZSBNU1QuIEluIHRoaXMgZnVuY3Rpb24sCj4gaXQgY2xlYW5zIGRh
dGEgb2YgdG9wb2xvZ3kgbWFuYWdlciB3aGlsZSBkaXNhYmxpbmcgbXN0X3N0YXRlLiBIb3dldmVy
LAo+IGl0IGRvZXNuJ3QgY2xlYW4gdXAgdGhlIHByb3Bvc2VkX3ZjcGlzIG9mIHRvcG9sb2d5IG1h
bmFnZXIuCj4gSWYgcHJvcG9zZWRfdmNwaSBpcyBub3QgcmVzZXQsIG9uY2UgcGx1ZyBpbiBNU1Qg
ZGFpc3kgY2hhaW4gbW9uaXRvcnMKPiBsYXRlciwgY29kZSB3aWxsIGZhaWwgYXQgY2hlY2tpbmcg
cG9ydCB2YWxpZGF0aW9uIHdoaWxlIHRyeWluZyB0bwo+IGFsbG9jYXRlIHBheWxvYWRzLgo+IAo+
IFdoZW4gTVNUIGNhcGFibGUgZGV2aWNlIGlzIHBsdWdnZWQgaW4gYWdhaW4gYW5kIHRyeSB0byBh
bGxvY2F0ZQo+IHBheWxvYWRzIGJ5IGNhbGxpbmcgZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQx
KCksIHRoaXMKPiBmdW5jdGlvbiB3aWxsIGl0ZXJhdGUgb3ZlciBhbGwgcHJvcG9zZWQgdmlydHVh
bCBjaGFubmVscyB0byBzZWUgaWYKPiBhbnkgcHJvcG9zZWQgVkNQSSdzIG51bV9zbG90cyBpcyBn
cmVhdGVyIHRoYW4gMC4gSWYgYW55IHByb3Bvc2VkCj4gVkNQSSdzIG51bV9zbG90cyBpcyBncmVh
dGVyIHRoYW4gMCBhbmQgdGhlIHBvcnQgd2hpY2ggdGhlCj4gc3BlY2lmaWMgdmlydHVhbCBjaGFu
bmVsIGRpcmVjdGVkIHRvIGlzIG5vdCBpbiB0aGUgdG9wb2xvZ3ksIGNvZGUgdGhlbgo+IGZhaWxz
IGF0IHRoZSBwb3J0IHZhbGlkYXRpb24uIFNpbmNlIHRoZXJlIGFyZSBzdGFsZSBWQ1BJIGFsbG9j
YXRpb25zCj4gZnJvbSB0aGUgcHJldmlvdXMgdG9wb2xvZ3kgZW5hYmxlbWVudCBpbiBwcm9wb3Nl
ZF92Y3BpW10sIGNvZGUgd2lsbCBmYWlsCj4gYXQgcG9ydCB2YWxpZGF0aW9uIGFuZCByZXVybiBF
SU5WQUwuCj4gCj4gW0hvd10KPiAKPiBDbGVhbiB1cCB0aGUgZGF0YSBvZiBzdGFsZSBwcm9wb3Nl
ZF92Y3BpW10gYW5kIHJlc2V0IG1nci0+cHJvcG9zZWRfdmNwaXMKPiB0byBOVUxMIHdoaWxlIGRp
c2FibGluZyBtc3QgaW4gZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdCgpLgo+IAo+IENo
YW5nZXMgc2luY2UgdjE6Cj4gKkFkZCBvbiBtb3JlIGRldGFpbHMgaW4gY29tbWl0IG1lc3NhZ2Ug
dG8gZGVzY3JpYmUgdGhlIGlzc3VlIHdoaWNoIHRoZSAKPiBwYXRjaCBpcyB0cnlpbmcgdG8gZml4
Cj4gCj4gU2lnbmVkLW9mZi1ieTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDEyICsrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXggYWU1ODA5YTFmMTlhLi5iZjRmNzQ1YTRlZGIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAtMzM4Niw2ICsz
Mzg2LDcgQEAgc3RhdGljIGludCBkcm1fZHBfZ2V0X3ZjX3BheWxvYWRfYncodTggZHBfbGlua19i
dywKPiB1OCAgZHBfbGlua19jb3VudCkKPiAgaW50IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Nl
dF9tc3Qoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gYm9vbCBtc3Rfc3Rh
dGUpCj4gIHsKPiAgCWludCByZXQgPSAwOwo+ICsJaW50IGkgPSAwOwo+ICAJc3RydWN0IGRybV9k
cF9tc3RfYnJhbmNoICptc3RiID0gTlVMTDsKPiAgCj4gIAltdXRleF9sb2NrKCZtZ3ItPmxvY2sp
Owo+IEBAIC0zNDQ2LDEwICszNDQ3LDIxIEBAIGludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9z
ZXRfbXN0KHN0cnVjdAo+IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsIGJvb2wgbXMKPiAg
CQkvKiB0aGlzIGNhbiBmYWlsIGlmIHRoZSBkZXZpY2UgaXMgZ29uZSAqLwo+ICAJCWRybV9kcF9k
cGNkX3dyaXRlYihtZ3ItPmF1eCwgRFBfTVNUTV9DVFJMLCAwKTsKPiAgCQlyZXQgPSAwOwo+ICsJ
CW11dGV4X2xvY2soJm1nci0+cGF5bG9hZF9sb2NrKTsKPiAgCQltZW1zZXQobWdyLT5wYXlsb2Fk
cywgMCwgbWdyLT5tYXhfcGF5bG9hZHMgKiBzaXplb2Yoc3RydWN0Cj4gZHJtX2RwX3BheWxvYWQp
KTsKPiAgCQltZ3ItPnBheWxvYWRfbWFzayA9IDA7Cj4gIAkJc2V0X2JpdCgwLCAmbWdyLT5wYXls
b2FkX21hc2spOwo+ICsJCWZvciAoaSA9IDA7IGkgPCBtZ3ItPm1heF9wYXlsb2FkczsgaSsrKSB7
Cj4gKwkJCXN0cnVjdCBkcm1fZHBfdmNwaSAqdmNwaSA9IG1nci0+cHJvcG9zZWRfdmNwaXNbaV07
Cj4gKwo+ICsJCQlpZiAodmNwaSkgewo+ICsJCQkJdmNwaS0+dmNwaSA9IDA7Cj4gKwkJCQl2Y3Bp
LT5udW1fc2xvdHMgPSAwOwo+ICsJCQl9Cj4gKwkJCW1nci0+cHJvcG9zZWRfdmNwaXNbaV0gPSBO
VUxMOwo+ICsJCX0KPiAgCQltZ3ItPnZjcGlfbWFzayA9IDA7Cj4gKwkJbXV0ZXhfdW5sb2NrKCZt
Z3ItPnBheWxvYWRfbG9jayk7Cj4gIAl9Cj4gIAo+ICBvdXRfdW5sb2NrOgotLSAKQ2hlZXJzLAoJ
THl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
