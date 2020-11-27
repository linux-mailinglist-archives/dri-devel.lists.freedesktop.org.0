Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED02C7C3B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709026E406;
	Mon, 30 Nov 2020 01:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D665A6EE38
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 15:39:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 10so5479287wml.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 07:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FsnGhbDOsrgIOmzFSfYV4vVHq+3Bz4YqegpXixc4Azw=;
 b=G3b/6fcLZgJUdfZPIy+tu6n5FXd68wlnr1GtXmOX4YwGFUgy16fXD3h7Tx4IUfXl6G
 wCOyB7jCs71psHAgATJyUfSLL9o5f2RD5FBpvo08vBMUmR06luiQuQ4IWnh/XMELwa63
 CuRg6rki++TZk8C6RtnztTZPIAfpV2kn7KgC5jccWZtv/lblugAyRz6mmoTTnSHt9A+z
 BSZKAAtO7K1BJuoGGbuhQSDPJfG866Jy58oyUFRCl7RXfQ8kUfhtJlL8wkuRx1DNdswp
 T2vMVTedZouVhAVBwQ3gLDRunsFYKvVgVX4ExiJkzrYoQYB8UfF5bpMAlxBzx3ECMo3V
 XnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FsnGhbDOsrgIOmzFSfYV4vVHq+3Bz4YqegpXixc4Azw=;
 b=pwcn0lm+uzQwPX1YOvaIJlq+0RIJ8VrUxLajSMY24XmUXYkpMldgUSp66ZtKHr/wgp
 3DzxBerZyWHNf8Yz9UD/42u67QIcGMGd33bHdVY1bfaJE/KkcefJYcyDShkl3WJUL/9S
 PDiGu3BsnXse5Zd3jbVRTca6GrodSiylqAJZ8jzuVmP3ugtRu+ckEzm+NsKgEl0Y08wa
 j8N0zq1oVS1pKKl/v00AXtUZTwLUN03BtuyPBsDDYy9YJIJNI6jNr+lnhAx9/DkjNa/b
 ZjRUuVYMyiMS8Ut1pAPMQdI1Qcd90QNqvG0iMckYmybEbJFBnZkjwX3CDYSlGVkhwn+D
 aFfA==
X-Gm-Message-State: AOAM532o1M9EiFAUnKMcwhnXltdVor3iOLaItGnWw9ei5Gkh5V83i4uX
 08ujmRRdRNoL8g5IP9YmvYQ=
X-Google-Smtp-Source: ABdhPJw6b18Uhcgp0Lz3ZlNQ6q1kkB25AbegoY+whNhYRovhNlwtJsjZtiW8KFvgiqa/PACEVy95UA==
X-Received: by 2002:a1c:a706:: with SMTP id q6mr9879379wme.2.1606491547631;
 Fri, 27 Nov 2020 07:39:07 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id w5sm9993017wrm.29.2020.11.27.07.39.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Nov 2020 07:39:07 -0800 (PST)
Subject: Re: [REGRESSION] omapdrm/N900 display broken
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
 <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
 <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
 <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
 <8010e452-745a-ac12-bc02-5537305c70ed@gmail.com>
Message-ID: <4948a40d-c887-5617-f5bc-1e0aff824ad7@gmail.com>
Date: Fri, 27 Nov 2020 17:37:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8010e452-745a-ac12-bc02-5537305c70ed@gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyNy4xMS4yMCDQsy4gMTU6MTAg0YcuLCBJdmF5bG8gRGltaXRyb3Ygd3JvdGU6Cj4g
Cj4gCj4gT24gMjcuMTEuMjAg0LMuIDEzOjQ1INGHLiwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+
IE9uIDI3LzExLzIwMjAgMDE6MTcsIEl2YXlsbyBEaW1pdHJvdiB3cm90ZToKPj4+IEhpIFRvbWks
Cj4+Pgo+Pj4gT24gMjYuMTEuMjAg0LMuIDE2OjExINGHLiwgVG9taSBWYWxrZWluZW4gd3JvdGU6
Cj4+Pj4gSGkgQWFybywgSXZheWxvLAo+Pj4+Cj4+Pj4gT24gMjQvMTEvMjAyMCAyMzowMywgSXZh
eWxvIERpbWl0cm92IHdyb3RlOgo+Pj4+Cj4+Pj4+IElzIHRoZXJlIGFueSBwcm9ncmVzcyBvbiB0
aGUgaXNzdWU/IEkgdHJpZWQgNS45LjEgYW5kIHN0aWxsIG5vdGhpbmcgCj4+Pj4+IGRpc3BsYXll
ZC4KPj4+Pgo+Pj4+IENhbiB5b3UgdGVzdCB0aGUgYXR0YWNoZWQgcGF0Y2g/Cj4+Pj4KPj4+Cj4+
PiBXaXRoIHRoaXMgcGF0Y2ggSSBkb24ndCBzZWUgb29wcyB0aGF0IEFhcm8gcmVwb3J0ZWQsIHNv
Ogo+Pj4KPj4+IFRlc3RlZC1ieTogSXZheWxvIERpbWl0cm92IDxpdm8uZy5kaW1pdHJvdi43NUBn
bWFpbC5jb20+Cj4+Pgo+Pj4gU2VlbXMgdG8gZml4IHRoZSBwYXJ0aWN1bGFyIGlzc3VlLCBob3dl
dmVyLCBub3cgd2UgZ2V0IGFub3RoZXIgb29wcy4gCj4+PiBBcyB0aGlzIGlzIG5vdCB1cHN0cmVh
bSBrZXJuZWwKPj4+IGJ1dCBvbmUgd2l0aCBQVlIgcmVsYXRlZCBwYXRjaGVzLCBJIHdpbGwgdHJ5
IGFnYWluIHdpdGggdmFuaWxsYSA1LjkuCj4+Pgo+Pj4gSnVzdCBpbiBjYXNlIG9vcHMgcmluZ3Mg
YW55IGJlbGxzICh0aGUgbGluZSBpbiBxdWVzdGlvbiBpcwo+Pj4gaHR0cHM6Ly9naXRodWIuY29t
L21hZW1vLWxlc3RlL2Ryb2lkNC1saW51eC9ibG9iL21hZW1vLTUuOS9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9vbWFwX2dlbS5jI0w4MDEpIAo+Pj4KPj4KPj4gRG8gdGhlIFBWUiBwYXRjaGVzIHRv
dWNoIG9tYXBkcm0/IFRoZSBjYWxsIHN0YWNrIGxvb2tzIGxpa2Ugbm9ybWFsIAo+PiBib290IHRp
bWUgcHJvYmluZyBzdHVmZiwgbm90Cj4+IHNvbWV0aGluZyBoYXBwZW5pbmcgbGF0ZXIgKHBvc3Np
Ymx5IGZyb20gUFZSKS4KPj4KPiAKPiBwdnIgZHJpdmVyIGlzIG5vdCBldmVuIGVuYWJsZWQgaW4g
dGhhdCBwYXJ0aWN1bGFyIGNvbmZpZywgaG93ZXZlciwgSSBzZWUgCj4gIkhBQ0s6IGRybS9vbWFw
OiBBZGQgb21hcGRybSBwbHVnaW4gQVBJIiBwYXRjaCBpbiB0aGUgdHJlZSB0aGF0IHRvdWNoZXMg
Cj4gb21hcC1nZW0uYywgSSBkb24ndCByZWFsbHkgd2FudCB0byBqdXN0IGNyZWF0ZSBzb21lIG5v
aXNlIGZvciBwcm9ibGVtcyAKPiB0aGF0IGFyZSBjcmVhdGVkIGJ5IG91dC1vZi10cmVlIHBhdGNo
ZXMuIEFuZCB5ZWFoLCBpdCBsb29rcyBsaWtlIGEgCj4gbm9ybWFsIGJvb3QgdGltZSBwcm9iaW5n
IHN0dWZmLiBBcyBzb29uIGFzIEkgaGF2ZSBzb21lIHNwYXJlIHRpbWUgCj4gKGhvcGVmdWxseSBs
YXRlciB0b2RheSkgSSB3aWxsIHRyeSB2YW5pbGxhIDUuOS54IHdpdGggCj4gb21hcDJwbHVzX2Rl
ZmNvbmZpZyBhbmQgd2lsbCByZXBvcnQuCj4gCgpXaXRoIDUuOS4xMSBhbmQgdGhlIHBhdGNoIG9u
IHRvcCwgbjkwMCBib290cyBmaW5lLCBhbGJlaXQgZGlzcGxheSAKcmVtYWlucyBibGFuaywgY291
bGQgYmUgcmVsYXRlZCB0byBicmlnaHRuZXNzLCB3ZSdyZSBzdGlsbCBpbnZlc3RpZ2F0aW5nLgoK
VGhhbmtzIGFuZCByZWdhcmRzLApJdm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
