Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C12B2AF3C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 09:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB8F89893;
	Mon, 27 May 2019 07:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A1789875
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 07:11:30 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id l25so25197305eda.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 00:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=wA1JuhUgVmAMcVow8fyZg95eHwvIww+RlmWs6LbIHEw=;
 b=kuNaDvIm1k5tJ3mIjD9z6VTVUFN5eUaZ1VPcp6r3q7uJyV/PSTiQWC6p7dFJ0XwRwW
 ZomI0hfg2Nd6OpzT41FcDnXVYfyElkN6Qhar7fOnPtjI2LIJRdy5xkTO3gW3WmGIyHxE
 VLnOygGtwByuB0PmMwzfhVDL3Uu+F1bwhZ++/fcyzzbEM3zSa9jpqFtbl0iOEvdO46Mr
 iM2uXBAagR3zmZApHSc8nolwygd+0TVvbEzz6WONVPhy8UdzzlKNIV4b45khrYadWWTV
 HbFIzXiehEoP8Y06pL5OjA32KWwFHzf+w8Yg/Mrx9xIZoT0yxUJaHRXAQaN1tzcOmn00
 FUtA==
X-Gm-Message-State: APjAAAUGOdxcgUv4vbg3MBsa24SLLjxvptbF/D1LROc0DJ2DWVHMPsWR
 Js8mzMcLmU0BkTS7le6/zJ+iyA==
X-Google-Smtp-Source: APXvYqzQpmBvFwoEJCPko6O9rivTi+mlWfwidR3MWcOARh7DAtnArIQGclbOBWliqvv6nqMfC0ymbg==
X-Received: by 2002:a50:ba1a:: with SMTP id g26mr120202668edc.90.1558941089378; 
 Mon, 27 May 2019 00:11:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x22sm3057778edd.59.2019.05.27.00.11.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 May 2019 00:11:28 -0700 (PDT)
Date: Mon, 27 May 2019 09:11:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 32/33] staging/olpc_dcon: Add drm conversion to TODO
Message-ID: <20190527071126.GL21222@phenom.ffwll.local>
Mail-Followup-To: LKML <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jens Frederich <jfrederich@gmail.com>,
 Daniel Drake <dsd@laptop.org>,
 Jon Nettleton <jon.nettleton@gmail.com>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
 <20190524085354.27411-33-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524085354.27411-33-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=wA1JuhUgVmAMcVow8fyZg95eHwvIww+RlmWs6LbIHEw=;
 b=M++fSJWIrvusFTZQ6drpas8GACMqPkJmizwitxjxCh2T5tic14cebDSsGUjQ5C3oKe
 VvT54XZ4qbUx63jthl0C7W3mIHhORCyHmX8zG8ZFWKfrev0OvL1WfpFwNZix0KpRtkSA
 dVwTfIRQixKE2cr5XCKMidd0wP6GhEiDcKelQ=
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
Cc: Daniel Drake <dsd@laptop.org>, Jens Frederich <jfrederich@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTA6NTM6NTNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiB0aGlzIGRyaXZlciBpcyBwcmV0dHkgaG9ycmlibGUgZnJvbSBhIGRlc2lnbiBwb3Ys
IGFuZCBuZWVkcyBhIGNvbXBsZXRlCj4gb3ZlcmhhdWwuIENvbmNyZXRlIHRoaW5nIHRoYXQgYW5u
b3lzIG1lIGlzIHRoYXQgaXQgbG9va3MgYXQKPiByZWdpc3RlcmVkX2ZiLCB3aGljaCBpcyBhbiBp
bnRlcm5hbCB0aGluZyB0byBmYm1lbS5jIGFuZCBmYmNvbi5jLiBBbmQKPiBvZmMgaXQgZ2V0cyB0
aGUgbGlmZXRpbWUgcnVsZXMgYWxsIHdyb25nIChpdCBzaG91bGQgYXQgbGVhc3QgdXNlCj4gZ2V0
L3B1dF9mYl9pbmZvKS4KPiAKPiBMb29raW5nIGF0IHRoZSBoaXN0b3J5LCB0aGVyZSdzIGJlZW4g
YW4gYXR0ZW1wdCBhdCBkcm9wcGluZyB0aGlzIGZyb20KPiBzdGFnaW5nIGluIDIwMTYsIGJ1dCB0
aGF0IGhhZCB0byBiZSByZXZlcnRlZC4gU2luY2UgdGhlbiBub3QgcmVhbAo+IGVmZm9ydCBleGNl
cHQgdGhlIHVzdWFsIHN0cmVhbSBvZiB0cml2aWFsIHBhdGNoZXMsIGFuZCBmYmRldiBoYXMgYmVl
bgo+IGZvcm1hbGx5IGNsb3NlZCBmb3IgYW55IG5ldyBodyBzdXBwb3J0LiBUaW1lIHRvIHRyeSBh
Z2FpbiBhbmQgZHJvcAo+IHRoaXM/Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEplbnMgRnJlZGVyaWNoIDxqZnJlZGVyaWNo
QGdtYWlsLmNvbT4KPiBDYzogRGFuaWVsIERyYWtlIDxkc2RAbGFwdG9wLm9yZz4KPiBDYzogSm9u
IE5ldHRsZXRvbiA8am9uLm5ldHRsZXRvbkBnbWFpbC5jb20+CgpIaSBHcmVnCgpBZ2FpbiBnZXRf
bWFpbmF0aW5lcnMgZGlkbid0IHBpY2sgeW91IHVwIG9uIHRoaXMgc29tZWhvdyAoSSBtYW51YWxs
eSBhZGRlZAp5b3Ugbm93IGZvciB0aGUgbmV4dCByb3VuZCkuIERvIHlvdSB3YW50IHRvIHBpY2sg
dGhpcyB1cCB0byBzdGFnaW5nLCBvcgphY2sgZm9yIG1lcmdpbmcgdGhyb3VnaCBkcm0vZmJkZXYg
YXMgcGFydCBvZiB0aGUgbGFyZ2VyIGZiZGV2L2ZiY29uCnJld29yaz8KCkFsc28sIEkgdGhpbmsg
dGltZSB0byByZXRyeSBhbmQgYXR0ZW1wdCBhdCBkcm9wcGluZyB0aGlzIGltbyAuLi4KClRoYW5r
cywgRGFuaWVsCgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL1RPRE8gfCA3ICsr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL1RPRE8gYi9kcml2ZXJzL3N0YWdpbmcvb2xwY19k
Y29uL1RPRE8KPiBpbmRleCA2NjVhMGIwNjE3MTkuLmZlMDllZmJjN2Y3NyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL1RPRE8KPiArKysgYi9kcml2ZXJzL3N0YWdpbmcv
b2xwY19kY29uL1RPRE8KPiBAQCAtMSw0ICsxLDExIEBACj4gIFRPRE86Cj4gKwktIGNvbXBsZXRl
IHJld3JpdGU6Cj4gKwkgIDEuIFRoZSB1bmRlcmx5aW5nIGZiZGV2IGRyaXZlcnMgbmVlZCB0byBi
ZSBjb252ZXJ0ZWQgaW50byBkcm0ga2VybmVsCj4gKwkgICAgIG1vZGVzZXR0aW5nIGRyaXZlcnMu
Cj4gKwkgIDIuIFRoZSBkY29uIGxvdy1wb3dlciBkaXNwbGF5IG1vZGUgY2FuIHRoZW4gYmUgaW50
ZWdyYXRlZCB1c2luZyB0aGUKPiArCSAgICAgZHJtIGRhbWFnZSB0cmFja2luZyBhbmQgc2VsZi1y
ZWZyZXNoIGhlbHBlcnMuCj4gKwkgIFRoaXMgYm9sdGVkLW9uIHNlbGYtcmVmcmVzaCBzdXBwb3J0
IHRoYXQgZGlncyBhcm91bmQgaW4gZmJkZXYKPiArCSAgaW50ZXJuYWxzLCBidXQgaXNuJ3QgcHJv
cGVybHkgaW50ZWdyYXRlZCwgaXMgbm90IHRoZSBjb3JyZWN0IHNvbHV0aW9uLgo+ICAJLSBzZWUg
aWYgdng4NTUgZ3BpbyBBUEkgY2FuIGJlIG1hZGUgc2ltaWxhciBlbm91Z2ggdG8gY3M1NTM1IHNv
IHdlIGNhbgo+ICAJICBzaGFyZSBtb3JlIGNvZGUKPiAgCS0gY29udmVydCBhbGwgdXNlcyBvZiB0
aGUgb2xkIEdQSU8gQVBJIGZyb20gPGxpbnV4L2dwaW8uaD4gdG8gdGhlCj4gLS0gCj4gMi4yMC4x
Cj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
