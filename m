Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65753A71EB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 19:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD4389701;
	Tue,  3 Sep 2019 17:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B028970E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 17:48:48 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k2so416651wmj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 10:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WxydxVU2CFhWd0QEZ7Dd4XKp/p4c1U4sKS90L0qSlNM=;
 b=AszEUdlvZreXXGakkg29034ZhwjX7ecauqx9cIg/abjhbdJ+BiKU0zbrJfgRHTgaA8
 KR2SKwZVxO9HxNfch0JRRhQxaRXJGDw/edQ5OhwN64ILBI+UDlxG+euY5eo3diA+0dhr
 mo7eMFJTz6S5c5/bP+XK8U0qKYnuNQ/clCeg9ClhxLyfv20/3viXFeN35XuJ8VpGlzOl
 owNK/qxV7I16JOTQfoagtyNTuRUtTuUVHRHeYczDiobn4U+tNRHSWPGALSf25fhkz4yI
 15BpwVjInE46mBvZ4G57DAmy9cz3tWV8tUYxnUXWZsC9PKZ6miF5xR8R3MwjrUGRL2lk
 wsAg==
X-Gm-Message-State: APjAAAX7GtxYWgE4OoWGBJmN5dlqJpCdcfPHGZ8n680A895v/zSleUcO
 1nixLBFJKBuQO5OfO1GK2g==
X-Google-Smtp-Source: APXvYqwKKZxGa3P7rOKwJCnEa107FksH8qZoSDy9XKQWNeIR+1mSDDCxud+EJcVbOMGJguXrzvC05Q==
X-Received: by 2002:a1c:1d8d:: with SMTP id d135mr635821wmd.7.1567532926783;
 Tue, 03 Sep 2019 10:48:46 -0700 (PDT)
Received: from localhost ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id n12sm162415wmc.24.2019.09.03.10.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 10:48:46 -0700 (PDT)
Date: Tue, 3 Sep 2019 18:48:44 +0100
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add binding for IT6505.
Message-ID: <20190903174844.GA4044@bogus>
References: <1567507915-9844-1-git-send-email-allen.chen@ite.com.tw>
 <1567507915-9844-2-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567507915-9844-2-git-send-email-allen.chen@ite.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Eddie Huang <eddie.huang@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDY6NTE6NTNQTSArMDgwMCwgYWxsZW4gd3JvdGU6Cj4g
RnJvbTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3Pgo+IAo+IEFkZCBhIERUIGJp
bmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgSVQ2NTA1Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsbGVu
IENoZW4gPGFsbGVuLmNoZW5AaXRlLmNvbS50dz4KPiAKPiAtLS0KPiBDb21tZW50cyBpbiB2MSB3
b3VsZCBiZSBhZGRyZXNzZWQgbGF0ZXIgaW4gdjMuCj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9pdGUsaXQ2NTA1LnR4dCAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysr
KysrKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMudHh0ICAgICAg
ICB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvaXRlLGl0NjUwNS50eHQKClRoaXMgd29uJ3QgYXBwbHkuIEJhc2UgeW91ciBwYXRjaGVzIG9u
IGN1cnJlbnQgKGxhdGVzdCAtcmMpIGtlcm5lbHMuCgpXZSd2ZSBtb3ZlZCB0byBhIERUIHNjaGVt
YSBmb3JtYXQuIE1pbmltYWxseSB2ZW5kb3ItcHJlZml4ZXMudHh0IHdpbGwgCmhhdmUgdG8gY2hh
bmdlLiBJdCdzIGFsc28gcHJlZmVycmVkIGZvciBkaXNwbGF5IGJyaWRnZXMuCgo+IAo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
aXRlLGl0NjUwNS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvaXRlLGl0NjUwNS50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAuLmMzNTA2YWMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUudHh0Cj4gQEAgLTAsMCAr
MSwzMCBAQAo+ICtpVEUgaXQ2NTA1IERQIGJyaWRnZSBiaW5kaW5ncwo+ICsKPiArUmVxdWlyZWQg
cHJvcGVydGllczoKPiArICAgICAgICAtIGNvbXBhdGlibGU6ICJpdGUsaXQ2NTA1Igo+ICsgICAg
ICAgIC0gcmVnOiBpMmMgYWRkcmVzcyBvZiB0aGUgYnJpZGdlCj4gKyAgICAgICAgLSBvdmRkLXN1
cHBseTogSS9PIHZvbHRhZ2UKPiArICAgICAgICAtIHB3cjE4LXN1cHBseTogQ29yZSB2b2x0YWdl
Cj4gKyAgICAgICAgLSBpbnRlcnJ1cHRzOiBpbnRlcnJ1cHQgc3BlY2lmaWVyIG9mIElOVCBwaW4K
PiArICAgICAgICAtIHJlc2V0LWdwaW9zOiBncGlvIHNwZWNpZmllciBvZiBSRVNFVCBwaW4KPiAr
Cj4gK0V4YW1wbGU6Cj4gKwlpdDY1MDVkcHR4OiBpdDY1MDVkcHR4QDVjIHsKCmRwLWJyaWRnZUA1
YwoKPiArICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiaXRlLGl0NjUwNSI7Cj4gKyAgICAg
ICAgICAgICAgICBzdGF0dXMgPSAib2theSI7CgpEb24ndCBzaG93IHN0YXR1cyBpbiBleGFtcGxl
cy4KCj4gKyAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwaW8+OwoKQW5kIGlu
dGVycnVwdC1wYXJlbnQuCgo+ICsgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwxNTIgSVJR
X1RZUEVfRURHRV9SSVNJTkcgMTUyIDA+Owo+ICsgICAgICAgICAgICAgICAgcmVnID0gPDB4NWM+
Owo+ICsgICAgICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiArICAgICAg
ICAgICAgICAgIHBpbmN0cmwtMCA9IDwmaXQ2NTA1X3BpbnM+Owo+ICsgICAgICAgICAgICAgICAg
b3ZkZC1zdXBwbHkgPSA8Jm10NjM1OF92c2ltMV9yZWc+Owo+ICsgICAgICAgICAgICAgICAgcHdy
MTgtc3VwcGx5ID0gPCZpdDY1MDVfcHAxOF9yZWc+Owo+ICsgICAgICAgICAgICAgICAgcmVzZXQt
Z3Bpb3MgPSA8JnBpbyAxNzkgMT47Cj4gKyAgICAgICAgICAgICAgICBocGQtZ3Bpb3MgPSA8JnBp
byA5IDA+OwoKVGhpcyBnb2VzIGluIGEgY29ubmVjdG9yIG5vZGUuCgo+ICsgICAgICAgICAgICAg
ICAgZXh0Y29uID0gPCZ1c2JjX2V4dGNvbj47CgpleHRjb24gaXMgZGVwcmVjYXRlZC4gRHJvcCBv
ciB1c2UgdGhlIHVzYi1jb25uZWN0b3IgYmluZGluZy4KClBsdXMgdGhpcyBpcyBub3QgZG9jdW1l
bnRlZCBhYm92ZS4KCj4gKyAgICAgICAgICAgICAgICBwb3J0IHsKCk5lZWQgdG8gbGlzdCB3aGF0
IGVhY2ggcG9ydCBpcy4gWW91J3JlIGdvaW5nIHRvIG5lZWQgYW4gb3V0cHV0IHBvcnQgdG9vIApm
b3IgYSBkcC1jb25uZWN0b3Igb3IgdXNiLWMgY29ubmVjdG9yLgoKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgaXQ2NTA1X2luOiBlbmRwb2ludCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkcGlfb3V0PjsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgfTsKPiArICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgfTsKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4
dAo+IGluZGV4IDJjM2ZjNTEuLmMwODg2NDYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy50eHQKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dAo+IEBAIC0xODQsNiAr
MTg0LDcgQEAgaW9tCUlvbWVnYSBDb3Jwb3JhdGlvbgo+ICBpc2VlCUlTRUUgMjAwNyBTLkwuCj4g
IGlzaWwJSW50ZXJzaWwKPiAgaXNzaQlJbnRlZ3JhdGVkIFNpbGljb24gU29sdXRpb25zIEluYy4K
PiAraXRlCWlURSBUZWNoLiBJbmMuCj4gIGl0ZWFkCUlURUFEIEludGVsbGlnZW50IFN5c3RlbXMg
Q28uTHRkCj4gIGl3YXZlICBpV2F2ZSBTeXN0ZW1zIFRlY2hub2xvZ2llcyBQdnQuIEx0ZC4KPiAg
amRpCUphcGFuIERpc3BsYXkgSW5jLgo+IC0tIAo+IDEuOS4xCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
