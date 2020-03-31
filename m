Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA2F199C87
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 19:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAB76E868;
	Tue, 31 Mar 2020 17:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9664E6E868
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585674445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxFaTH11ND2U7MLOb7QSCYS7CLb/StWfTZPOnAn0Qkc=;
 b=KQ91GO3YdpC510Mx99Mzbk2N2LKjt56st2vIeC/rh0MYbrRdn34VVm5jH3rxr+73RNrs75
 ElAv2sMZta6QkgPUd5ETgdwRRxlqmOWOOAjL/V6MfF9K/g2zZvgyhnL3XV8YrABw4L8lbf
 T2c6rZ2JZKi5yPrkljFExBv4WO+Shrs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-ckwk4fXEMbKa82VNJk4sWA-1; Tue, 31 Mar 2020 13:07:23 -0400
X-MC-Unique: ckwk4fXEMbKa82VNJk4sWA-1
Received: by mail-wr1-f69.google.com with SMTP id f8so13265076wrp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 10:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xk6zn5KDebHBECMW2EaO+50vYFX2XKGIZ1NNbJ9r8vg=;
 b=SGn8nctFNfybBhVuScevGBQRDFrGdtU93wVp3XrOrHkV6i1yfOyU6i6T/aOW8O0mJ7
 1f/E+fvLDDNi1lGBX93sHu+tkIg/YCkaiaFray5O2osLKroN5rFVd5akXwrx7rpObtMV
 0VtZjW8itlqebqFqz5N9gv6fyr/nzvgS/RBKH/4fGJWrdpT71L05e4ee0I4mBu7M/3a5
 zqqPkcV5RZlyUeeYeFY70ZESoHBS/Mbpn5E6XcbkxBloIdFJ37vF/4y0juaU4LlSy8Bq
 JkTnGhbCCHpw8PwdeYN9dehUL+1t8n37bw1LUdrot0kpJHjVTJKgInzf77rwrjKClv9Q
 7IOg==
X-Gm-Message-State: ANhLgQ0sFw3m0E6NQULmqtWRZ/mQ5/31jOQnbU0TW28qmzXWl7oDR5MY
 tKAwicfAnbUn5oNmP4avbAUIUkFeblAfJ0bE8tjghUekeXhF7gMu+l+lEw9t/2e3mYC67za6reY
 eS6VoxmKCFRkgC1NIjsf28PPORrA2
X-Received: by 2002:adf:8341:: with SMTP id 59mr21282865wrd.314.1585674441750; 
 Tue, 31 Mar 2020 10:07:21 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs+wdpG+G2+yS+PkTBW0RDvHP4Vwo2xPwB6bR82gswe4U31aL+AQGWAIoPP6UUFReG5KjzUPw==
X-Received: by 2002:adf:8341:: with SMTP id 59mr21282850wrd.314.1585674441509; 
 Tue, 31 Mar 2020 10:07:21 -0700 (PDT)
Received: from x1-7.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id t126sm4737499wmb.27.2020.03.31.10.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 10:07:20 -0700 (PDT)
Subject: Re: [PATCH] drm: panel-orientation-quirks: 320 FHD and D330 HD
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?Q?David_Santamar=c3=ada_Rogado?= <howl.nsp@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
References: <20190730194911.28453-1-howl.nsp@gmail.com>
 <CAD4j4=AdUtyoiwenzT5moAdHcR_maM91kJfDQM0AuT2bnM=D9Q@mail.gmail.com>
 <87lfngfp8q.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6df6072e-d0dd-c5f3-57b0-1992bba78541@redhat.com>
Date: Tue, 31 Mar 2020 19:07:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87lfngfp8q.fsf@intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzLzMxLzIwIDY6NDQgUE0sIEphbmkgTmlrdWxhIHdyb3RlOgo+IE9uIEZyaSwgMjcg
TWFyIDIwMjAsIERhdmlkIFNhbnRhbWFyw61hIFJvZ2FkbyA8aG93bC5uc3BAZ21haWwuY29tPiB3
cm90ZToKPj4gVGhpcyBwYXRjaCBpcyBzdGlsbCB2YWxpZCBhcyBubyBjaGFuZ2VzIHRvIHBhbmVs
IG9yaWVudGF0aW9uIHF1aXJrcwo+PiBoYXZlIGJlZW4gZG9uZS4gU29tZW9uZSBjYW4gcmV2aWV3
IHRoaXMgdG8gbWVyZ2U/Cj4gCj4gQ2M6IEhhbnMuCgpMb29rcyBnb29kIHRvIG1lOgoKUmV2aWV3
ZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CgpSZWdhcmRzLAoKSGFu
cwoKCgoKPj4gRWwgbWFyLiwgMzAganVsLiAyMDE5IGEgbGFzIDIxOjQ5LCBEYXZpZCBTYW50YW1h
csOtYSBSb2dhZG8KPj4gKDxob3dsLm5zcEBnbWFpbC5jb20+KSBlc2NyaWJpw7M6Cj4+Pgo+Pj4g
VGhpcyBhZGRzIHRoZSBIRCB2ZXJzaW9uIG9mIExlbm92byBJZGVhcGFkIEQzMzAKPj4+IGFuZCBG
SEQgdmVyc2lvbiBvZiBMZW5vdm8gSWRlYXBhZCBNaWl4IDMyMC4KPj4+Cj4+PiBUaGlzIHNob3Vs
ZCB3b3JrIGRlc3BpdGUgdGhlIGRtaSBkYXRhIGlzIHRoZSBzYW1lIGJlY2F1c2UKPj4+IHRoZSBy
ZXNvbHV0aW9uIGNoZWNrcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBTYW50YW1hcsOt
YSBSb2dhZG8gPGhvd2wubnNwQGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJzL2dwdS9k
cm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jIHwgMTggKysrKysrKysrKysrKysrKy0t
Cj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9u
X3F1aXJrcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3Mu
Ywo+Pj4gaW5kZXggZmZkOTViZmVhYTk0Li44OTZjNzgzY2UxMzUgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jCj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jCj4+PiBAQCAtMTkx
LDE0ICsxOTEsMjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIG9yaWVudGF0
aW9uX2RhdGFbXSA9IHsKPj4+ICAgICAgICAgICAgICAgICAgICBETUlfRVhBQ1RfTUFUQ0goRE1J
X1BST0RVQ1RfVkVSU0lPTiwgIk1JSVggMzEwLTEwSUNSIiksCj4+PiAgICAgICAgICAgICAgICAg
IH0sCj4+PiAgICAgICAgICAgICAgICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmxjZDgwMHgx
MjgwX3JpZ2h0c2lkZV91cCwKPj4+IC0gICAgICAgfSwgeyAgICAvKiBMZW5vdm8gSWRlYXBhZCBN
aWl4IDMyMCAqLwo+Pj4gKyAgICAgICB9LCB7ICAgIC8qIExlbm92byBJZGVhcGFkIE1paXggMzIw
IChIRCkgKi8KPj4+ICAgICAgICAgICAgICAgICAgLm1hdGNoZXMgPSB7Cj4+PiAgICAgICAgICAg
ICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCj4+PiAg
ICAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX05BTUUsICI4MFhG
IiksCj4+PiAgICAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX1ZF
UlNJT04sICJMZW5vdm8gTUlJWCAzMjAtMTBJQ1IiKSwKPj4+ICAgICAgICAgICAgICAgICAgfSwK
Pj4+ICAgICAgICAgICAgICAgICAgLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmbGNkODAweDEyODBf
cmlnaHRzaWRlX3VwLAo+Pj4gLSAgICAgICB9LCB7ICAgIC8qIExlbm92byBJZGVhcGFkIEQzMzAg
Ki8KPj4+ICsgICAgICAgfSwgeyAgICAvKiBMZW5vdm8gSWRlYXBhZCBNaWl4IDMyMCAoRkhEKSAq
Lwo+Pj4gKyAgICAgICAgICAgICAgIC5tYXRjaGVzID0gewo+Pj4gKyAgICAgICAgICAgICAgICAg
RE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCj4+PiArICAgICAgICAg
ICAgICAgICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIjgwWEYiKSwKPj4+ICsg
ICAgICAgICAgICAgICAgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAiTGVu
b3ZvIE1JSVggMzIwLTEwSUNSIiksCj4+PiArICAgICAgICAgICAgICAgfSwKPj4+ICsgICAgICAg
ICAgICAgICAuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZsY2QxMjAweDE5MjBfcmlnaHRzaWRlX3Vw
LAo+Pj4gKyAgICAgICB9LCB7ICAgIC8qIExlbm92byBJZGVhcGFkIEQzMzAgKEhEKSAqLwo+Pj4g
KyAgICAgICAgICAgICAgIC5tYXRjaGVzID0gewo+Pj4gKyAgICAgICAgICAgICAgICAgRE1JX0VY
QUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCj4+PiArICAgICAgICAgICAgICAg
ICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIjgxSDMiKSwKPj4+ICsgICAgICAg
ICAgICAgICAgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAiTGVub3ZvIGlk
ZWFwYWQgRDMzMC0xMElHTSIpLAo+Pj4gKyAgICAgICAgICAgICAgIH0sCj4+PiArICAgICAgICAg
ICAgICAgLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmbGNkODAweDEyODBfcmlnaHRzaWRlX3VwLAo+
Pj4gKyAgICAgICB9LCB7ICAgIC8qIExlbm92byBJZGVhcGFkIEQzMzAgKEZIRCkgKi8KPj4+ICAg
ICAgICAgICAgICAgICAgLm1hdGNoZXMgPSB7Cj4+PiAgICAgICAgICAgICAgICAgICAgRE1JX0VY
QUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCj4+PiAgICAgICAgICAgICAgICAg
ICAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX05BTUUsICI4MUgzIiksCj4+PiAtLQo+Pj4g
Mi4yMS4wCj4+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
