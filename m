Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696501FC72C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028476E264;
	Wed, 17 Jun 2020 07:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEAD6E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 11:40:50 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x18so23068162lji.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 04:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A8sjUOHgL9nLLR2sMURME3uc++A65bxuMDnX6JVkBQo=;
 b=AC6wJsM+iB4GQj4KCesjm8UoDUwmJGWwcWIaFm8rPrhjZB/QLj1wp9F1tgaLbicawK
 c9ix8MvGQQRFB3jMBO6+socsLuDysCg10/yq/URwjqAfhXTaV4I+XSt4rqh+6Giikd7y
 gY7wJei8glemZPecS7e+LG3qc1tx8qQDtky2HVaDRdymekFnXc/UAvXJtqvyPPBmXEvp
 /n91eNJ7k6ODnr0WmCbg6CSY0N+nfsUOTRpt1gtH1btJBliFDO3A3bhJSOX7Z2bH/QTF
 tcnJtdsYdEoG1bZV/TGf/drmaxh2iMY+kN0y9IPSfMmi857L8LNE0rYmNaMxdZ+vvOe1
 o5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A8sjUOHgL9nLLR2sMURME3uc++A65bxuMDnX6JVkBQo=;
 b=eN8QX3RA7jeN8tJMWddRDWJYtQS7QwpspZaBJyaZq6SU0VTcf8d7DxVnTz18P/yTsB
 lgWMo58UmolTSbhN0GxyxRFlVUhWNJ1QvRLcjdhFQVcUuC9ZX7y7vKH9k0JUTSjAE+NE
 vj/6E4n/yAyAcSm8XmIRdsTWT6Vic3jnKSBNFeGTv/fhJ6DC0fF2e4P8epZA+GEMAo9i
 S9nteENiHXRwJcZMwlvhvra5ZeMSQQ5HU0wUSrOA8L3UYNCBOqzUi74wdM23YYeo8Vmk
 BvN7F+s9++uo3vFljzcjrbpJP6emLurfk2pAqHGuO6flz7qPR5dkoxbk+r26X43nq6vD
 PqFA==
X-Gm-Message-State: AOAM530N4u4TNC3/FK/5+tFLB6sjl9Qp8zOmRiL8OHwtWaVVOB3Uo6/4
 7bKwh6yCFXnHqV82vyiVkHxp2iB4
X-Google-Smtp-Source: ABdhPJx+OvaBSKVFf8zGIZ/Op1IKf6bq1CbM9Y9hFU9yCnNt8l/j+gfKpD/5jCtPNYqKn/rVUV/Oqw==
X-Received: by 2002:a2e:9a59:: with SMTP id k25mr1343434ljj.114.1592307648668; 
 Tue, 16 Jun 2020 04:40:48 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id r9sm4343500ljj.127.2020.06.16.04.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 04:40:48 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com>
 <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8f789ef5-bebf-c869-784d-afda70fc1fb8@gmail.com>
Date: Tue, 16 Jun 2020 14:40:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Derek Basehore <dbasehore@chromium.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAwMToyNiwgRW1pbCBWZWxpa292INC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5LAo+
IAo+IE9uIE1vbiwgMTUgSnVuIDIwMjAgYXQgMDg6MjgsIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4
QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IEhlbGxvIQo+Pgo+PiBUaGlzIHNlcmllcyBhZGRzIDE4
MMKwIGRpc3BsYXkgcGxhbmUgcm90YXRpb24gc3VwcG9ydCB0byB0aGUgTlZJRElBIFRlZ3JhCj4+
IERSTSBkcml2ZXIgd2hpY2ggaXMgbmVlZGVkIGZvciBkZXZpY2VzIHRoYXQgaGF2ZSBkaXNwbGF5
IHBhbmVsIHBoeXNpY2FsbHkKPj4gbW91bnRlZCB1cHNpZGUtZG93biwgbGlrZSBOZXh1cyA3IHRh
YmxldCBkZXZpY2UgZm9yIGV4YW1wbGUgWzFdLiBTaW5jZQo+PiBEUk0gcGFuZWwgcm90YXRpb24g
aXMgYSBuZXcgdGhpbmcgZm9yIGEgdXNlcnNwYWNlLCBjdXJyZW50bHkgb25seQo+PiBPcGVudGVn
cmEgWG9yZyBkcml2ZXIgaGFuZGxlcyB0aGUgcm90YXRlZCBkaXNwbGF5IHBhbmVsIFsyXSwgYnV0
IHRoaXMKPj4gaXMgZ29vZCBlbm91Z2ggZm9yIHRoZSBzdGFydC4KPj4KPj4gTm90ZSB0aGF0IGxh
dGVyIG9uIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBpbXBsZW1lbnQgYSB0cmFuc3BhcmVudCAx
ODDCsAo+PiBkaXNwbGF5IHJvdGF0aW9uIGZvciBUZWdyYSBEUk0gZHJpdmVyIHdoaWNoIHdpbGwg
cmVtb3ZlIHRoZSBuZWVkIHRvIGhhdmUKPj4gYSBibGVlZGluZyBlZGdlIHVzZXJzcGFjZSB0aGF0
IGtub3dzIGhvdyB0byByb3RhdGUgZGlzcGxheSBwbGFuZXMgYW5kIEknbQo+PiBzbG93bHkgd29y
a2luZyBvbiBpdC4gRm9yIHRoZSBzdGFydGVyIHdlIGNhbiBnbyB3aXRoIHRoZSBtaW5pbWFsIHJv
dGF0aW9uCj4+IHN1cHBvcnQsIHNvIGl0J3Mgbm90IGEgYmxvY2tlci4KPj4KPj4gVGhpcyBzZXJp
ZXMgaXMgYmFzZWQgb24gdGhlIHdvcmsgdGhhdCB3YXMgbWFkZSBieSBEZXJlayBCYXNlaG9yZSBm
b3IgdGhlCj4+IE1lZGlhdGVrIGRyaXZlciBbM10sIGhpcyBwYXRjaCBpcyBpbmNsdWRlZCBpbnRv
IHRoaXMgcGF0Y2hzZXQuIEkgYWRkZWQKPj4gbXkgdGVzdGVkLWJ5IHRhZyB0byB0aGUgRGVyZWsn
cyBwYXRjaC4KPj4KPj4gUGxlYXNlIHJldmlldyBhbmQgYXBwbHksIHRoYW5rcyBpbiBhZHZhbmNl
IQo+Pgo+PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LXRl
Z3JhL3BhdGNoLzIwMjAwNjA3MTU0MzI3LjE4NTg5LTMtZGlnZXR4QGdtYWlsLmNvbS8KPj4gWzJd
IGh0dHBzOi8vZ2l0aHViLmNvbS9ncmF0ZS1kcml2ZXIveGY4Ni12aWRlby1vcGVudGVncmEvY29t
bWl0LzI4ZWIyMGEzOTU5YmJlNWJjM2EzYjY3ZTU1OTc3MDkzZmQ1MTE0Y2EKPj4gWzNdIGh0dHBz
Oi8vbGttbC5vcmcvbGttbC8yMDIwLzMvNS8xMTE5Cj4+Cj4+IENoYW5nZWxvZzoKPj4KPj4gdjI6
IC0gRHJvcHBlZCAiZHJtL3BhbmVsOiBTZXQgZGlzcGxheSBpbmZvIGluIHBhbmVsIGF0dGFjaCIg
cGF0Y2gsIHdoaWNoCj4+ICAgICAgIHR1cm5lZCBvdXQgdG8gYmUgb2Jzb2xldGUgbm93Lgo+Pgo+
PiAgICAgLSBSZW5hbWVkIHRoZSBjb3Zlci1sYXR0ZXIsIGhvcGVmdWxseSB0aGlzIHdpbGwgZml4
IHRoZSBib3VuY2luZyBlbWFpbHMuCj4+Cj4+IERlcmVrIEJhc2Vob3JlICgxKToKPj4gICBkcm0v
cGFuZWw6IEFkZCBoZWxwZXIgZm9yIHJlYWRpbmcgRFQgcm90YXRpb24KPj4KPj4gRG1pdHJ5IE9z
aXBlbmtvICg0KToKPj4gICBkcm0vcGFuZWw6IGx2ZHM6IFNldCB1cCBwYW5lbCBvcmllbnRhdGlv
bgo+IAo+IElNSE8gaXQncyBwZXJmZWN0bHkgcmVhc29uYWJsZSB0byByZXBvcnQgdGhlIHBhbmVs
IG9yaWVudGF0aW9uIHRvCj4gdXNlcnNwYWNlLCB3aGljaCBjYW4gYXBwbHkgcGxhbmUgcm90YXRp
b24gYXMgbmVlZGVkLgo+IAo+IEFsdGhvdWdoIEkgc2VlIHRoYXQgdGhpcyBzZXJpZXMsIGFsaWtl
IERlcmVrJ3MsIGhhcyBhIGNvdXBsZSBvZiBpc3N1ZXM6Cj4gIC0gb25seSBhIHNpbmdsZSBwYW5l
bCBkcml2ZXIgaXMgdXBkYXRlZAo+ICAtIHJvdGF0aW9uIGlzIF9ub3RfIGxpc3RlZCBhcyBzdXBw
b3J0ZWQgcHJvcGVydHksIGluIHNhaWQgcGFuZWwKPiBkcml2ZXIgZGV2aWNlLXRyZWUgYmluZGlu
Z3MKPiAKPiBNeSBwZXJzb25hbCBpbmNsaW5hdGlvbiBpcyB0aGF0IHdlIHNob3VsZCBhaW0gZm9y
IGEgY29tcHJlaGVuc2l2ZSBzb2x1dGlvbjoKPiAgLSB3aXJlIGFsbCBwYW5lbCBkcml2ZXJzLCBh
cyBjdXJyZW50bHkgZG9jdW1lbnRlZCAocXVpY2sgZ3JlcCBsaXN0IGJlbG93KQo+ICAtIGRvY3Vt
ZW50IGFuZCB3aXJlLXVwIHRoZSBsdmRzIGFuZCBib2UgcGFuZWxzIC0gYXMgcHJvcG9zZWQgYnkg
eW91Cj4gYW5kIERlcmVrIHJlc3BlY3RpdmVseQo+IAo+IEhUSAo+IEVtaWwKPiAKPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9oaW1heCxoeDgzNTdkLnR4dDoyCj4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaWxpdGVrLGlsaTkyMjUu
dHh0OjIKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbGl0ZWss
aWxpOTM0MS50eHQ6Mgo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2lsaXRlayxpbGk5NDg2LnlhbWw6Mgo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L211bHRpLWlubm8sbWkwMjgzcXQudHh0OjIKPiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1jb21tb24ueWFtbDoyCj4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc2l0cm9uaXgsc3Q3NTg2LnR4dDox
Cj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc2l0cm9uaXgsc3Q3
NzM1ci55YW1sOjIKClJvdGF0aW9uIGlzIGEgY29tbW9uIERUIHBhbmVsIHByb3BlcnR5IHRoYXQg
aXMgZGVzY3JpYmVkIGluIHRoZQpwYW5lbC1jb21tb24ueWFtbC4gVGhpcyBwcm9wZXJ0eSBpcyBz
dXBwb3J0ZWQgYnkgYWxsIHBhbmVsIGJpbmRpbmdzCmJlY2F1c2UgdGhlc2UgYmluZGluZ3MgaW5o
ZXJlbnQgdGhlIGNvbW1vbiBwcm9wZXJ0aWVzIGZyb20gdGhlCnBhbmVsLWNvbW1vbi55YW1sLgoK
SSBkb24ndCB0aGluayB0aGF0IGl0IG1ha2VzIHNlbnNlIHRvIHdpcmUgdXAgcm90YXRpb24gcHJv
cGVydHkgdG8gYWxsCnBhbmVsIGRyaXZlcnMgYXQgb25jZSBiZWNhdXNlIHRob3NlIGRyaXZlcnMg
d2lsbCBiZSB1bnRlc3RlZCwgYXQgbGVhc3QgSQpkb24ndCBrbm93IGFueXRoaW5nIGFib3V0IHRo
b3NlIG90aGVyIHBhbmVscyBhbmQgY2FuJ3QgdGVzdCB0aGVtLiBJdAp3aWxsIGJlIG11Y2ggYmV0
dGVyIHRvIHN1cHBvcnQgdGhlIHJvdGF0aW9uIG9uIGJ5IGFzLW5lZWRlZCBiYXNpcyBmb3IKZWFj
aCBwYW5lbCBkcml2ZXIgaW5kaXZpZHVhbGx5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
