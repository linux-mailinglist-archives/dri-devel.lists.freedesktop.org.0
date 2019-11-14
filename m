Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E90FD79D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662C06E12C;
	Fri, 15 Nov 2019 08:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E446E2A5;
 Thu, 14 Nov 2019 17:56:31 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id j20so7766600ioo.11;
 Thu, 14 Nov 2019 09:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UgW4SMrfbhKMi9qgc5xZl0sjORDDULnrm3lI/5KuzN0=;
 b=hyb6VFNHYnd1tCltikN1lyb3OiFx3EVODEO8TnkSAFnLKMuhPXrSVYTJJh2uVLkPQZ
 G5LfmGel5tG7PP6xBwdfmhIBEayxsrK2H5LEPdrPoah/hwD4abA1vVc9tTn3UbMSQStK
 VHnMQeGP+SQYjzOp5sbcYuW7ATCVPlUMq13r5RQff10UARwO5JgxRMy2TwJrSFM90Yax
 /1uqLqdAghKRu2PLMLlflWUZduHRqsQt6wFy49Urv74/PJw0mzFyuHwl+XHST3hFU+0Y
 gpvm6lv7DFWzJGLqBNGoKdJIy/HtR5dS4y+EM7XCcbBoDPc8zkUQ1WME/T0AVqiyRQah
 VIhg==
X-Gm-Message-State: APjAAAVb7QpsdKyJ0bnQlqHUryptrY6DU4WrW9rYQprtCjkgGea5Sett
 yt64JbUEGuwvtTCE29Rbi6MLT2K+OXnqMrjamXF9YQ==
X-Google-Smtp-Source: APXvYqw/g3NqxOMX1Y/5RG0gnLKeBCaPRdyjqw6TZ9tiex96r00vefgQDZsKLpLgHA+e/Cm+l6/QF1d2um7ELXwke5s=
X-Received: by 2002:a5e:8a04:: with SMTP id d4mr7856754iok.42.1573754190499;
 Thu, 14 Nov 2019 09:56:30 -0800 (PST)
MIME-Version: 1.0
References: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
 <1573726588-18897-3-git-send-email-harigovi@codeaurora.org>
 <CAF6AEGurmTxwhBeWf1Q2U7_jSwmofBq49G5dsZN0qRmAFfvDNQ@mail.gmail.com>
In-Reply-To: <CAF6AEGurmTxwhBeWf1Q2U7_jSwmofBq49G5dsZN0qRmAFfvDNQ@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 14 Nov 2019 10:56:19 -0700
Message-ID: <CAOCk7Nrap3y_NS8RMuqeLr+E5CP94xyqEBZfHBCtvocaTM1VVA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v1 2/2] drm/msm: add DSI config changes to
 support DSI version
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Fri, 15 Nov 2019 08:05:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UgW4SMrfbhKMi9qgc5xZl0sjORDDULnrm3lI/5KuzN0=;
 b=BczWzv8BWuFkYr/ez120JhoXDON9V4jr1e7a7X3bdDZVaKAdeRUisMvpsO6UOKUThy
 WHcapILnkRuitE6uypIu0Rpz28ncsMLnRbIZMasKEHHY6UkhRcIaLLRFjZy3SxbVw9KO
 T5gkCjFGNPFk6GWgEiaR8f73EdzS3XnZ5u/mpYT9X/f5woxNI7V1v8yhKe9pIlhiVWL5
 7ftq3UhAgKkwCw8Hs0QSb7O97cFczFYDLGna7JMT3/cvPry3KXrx0bLnm8sCnun1SuyK
 FfbkaO7tj8Ig26mqxTqwYWUWr3V54VYodL/2keCogdeQtii18b5eerO78TBX8ZyQaH0+
 LvpA==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMTA6NDcgQU0gUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDE0LCAyMDE5IGF0IDI6MTYgQU0gSGFyaWdv
dmluZGFuIFAgPGhhcmlnb3ZpQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPiA+Cj4gPiBBZGQgRFNJ
IGNvbmZpZyBjaGFuZ2VzIHRvIHN1cHBvcnQgRFNJIHZlcnNpb24uCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSGFyaWdvdmluZGFuIFAgPGhhcmlnb3ZpQGNvZGVhdXJvcmEub3JnPgo+Cj4gUmV2aWV3
ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KCkNhbiB3ZSBmaXggdGhlIHN1
YmplY3QvY29tbWl0IHRleHQgZm9yIHRoaXMgdG8gaW5kaWNhdGUgd2hhdCBEU0kKdmVyc2lvbiBh
bmQvb3IgU29DIHRoaXMgaXMgZm9yPyAgVGhpcyBpcyBhIFNvQyBlbmFibGVtZW50IHBhdGNoLCBi
dXQKYXQgZmlyc3QgSSB0aG91Z2h0IHRoaXMgd2FzIHNvbWUgYnVnIGZpeCBvciBzb21ldGhpbmcu
Cgo+Cj4gRm9yIHBhdGNoIDEvMiB3aXRoIHRoZSBwYW5lbCBkcml2ZXIsIHByb2JhYmx5IGJlc3Qg
dG8gc3BsaXQgdGhhdCBvdXQKPiBpbnRvIGEgZGlmZmVyZW50IHBhdGNoKHNldCksIHNpbmNlIHBh
bmVsIGRyaXZlcnMgYXJlIG1lcmdlZCBpbnRvCj4gZHJtLW5leHQgdmlhIGEgZGlmZmVyZW50IHRy
ZWUKPgo+IEJSLAo+IC1SCj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2Rz
aV9jZmcuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9t
c20vZHNpL2RzaV9jZmcuaCB8ICAxICsKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2Nm
Zy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCj4gPiBpbmRleCBiN2I3YzFh
Li5kMmM0NTkyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2Nm
Zy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmMKPiA+IEBAIC0x
MzMsNiArMTMzLDEwIEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZHNpX3NkbTg0NV9idXNf
Y2xrX25hbWVzW10gPSB7Cj4gPiAgICAgICAgICJpZmFjZSIsICJidXMiLAo+ID4gIH07Cj4gPgo+
ID4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZHNpX3NjNzE4MF9idXNfY2xrX25hbWVzW10g
PSB7Cj4gPiArICAgICAgICAiaWZhY2UiLCAiYnVzIiwKPiA+ICt9Owo+ID4gKwo+ID4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9jb25maWcgc2RtODQ1X2RzaV9jZmcgPSB7Cj4gPiAgICAg
ICAgIC5pb19vZmZzZXQgPSBEU0lfNkdfUkVHX1NISUZULAo+ID4gICAgICAgICAucmVnX2NmZyA9
IHsKPiA+IEBAIC0xNDcsNiArMTUxLDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9j
b25maWcgc2RtODQ1X2RzaV9jZmcgPSB7Cj4gPiAgICAgICAgIC5udW1fZHNpID0gMiwKPiA+ICB9
Owo+ID4KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9kc2lfY29uZmlnIHNjNzE4MF9kc2lf
Y2ZnID0gewo+ID4gKyAgICAgICAuaW9fb2Zmc2V0ID0gRFNJXzZHX1JFR19TSElGVCwKPiA+ICsg
ICAgICAgLnJlZ19jZmcgPSB7Cj4gPiArICAgICAgICAgICAgICAgLm51bSA9IDEsCj4gPiArICAg
ICAgICAgICAgICAgLnJlZ3MgPSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB7InZkZGEi
LCAyMTgwMCwgNCB9LCAgICAvKiAxLjIgViAqLwo+ID4gKyAgICAgICAgICAgICAgIH0sCj4gPiAr
ICAgICAgIH0sCj4gPiArICAgICAgIC5idXNfY2xrX25hbWVzID0gZHNpX3NjNzE4MF9idXNfY2xr
X25hbWVzLAo+ID4gKyAgICAgICAubnVtX2J1c19jbGtzID0gQVJSQVlfU0laRShkc2lfc2M3MTgw
X2J1c19jbGtfbmFtZXMpLAo+ID4gKyAgICAgICAuaW9fc3RhcnQgPSB7IDB4YWU5NDAwMCB9LAo+
ID4gKyAgICAgICAubnVtX2RzaSA9IDEsCj4gPiArfTsKPiA+ICsKPiA+ICBjb25zdCBzdGF0aWMg
c3RydWN0IG1zbV9kc2lfaG9zdF9jZmdfb3BzIG1zbV9kc2lfdjJfaG9zdF9vcHMgPSB7Cj4gPiAg
ICAgICAgIC5saW5rX2Nsa19lbmFibGUgPSBkc2lfbGlua19jbGtfZW5hYmxlX3YyLAo+ID4gICAg
ICAgICAubGlua19jbGtfZGlzYWJsZSA9IGRzaV9saW5rX2Nsa19kaXNhYmxlX3YyLAo+ID4gQEAg
LTIwMSw2ICsyMTksOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9kc2lfY2ZnX2hhbmRsZXIg
ZHNpX2NmZ19oYW5kbGVyc1tdID0gewo+ID4gICAgICAgICAgICAgICAgICZtc204OTk4X2RzaV9j
ZmcsICZtc21fZHNpXzZnX3YyX2hvc3Rfb3BzfSwKPiA+ICAgICAgICAge01TTV9EU0lfVkVSX01B
Sk9SXzZHLCBNU01fRFNJXzZHX1ZFUl9NSU5PUl9WMl8yXzEsCj4gPiAgICAgICAgICAgICAgICAg
JnNkbTg0NV9kc2lfY2ZnLCAmbXNtX2RzaV82Z192Ml9ob3N0X29wc30sCj4gPiArICAgICAgIHtN
U01fRFNJX1ZFUl9NQUpPUl82RywgTVNNX0RTSV82R19WRVJfTUlOT1JfVjJfNF8xLAo+ID4gKyAg
ICAgICAgICAgICAgICZzYzcxODBfZHNpX2NmZywgJm1zbV9kc2lfNmdfdjJfaG9zdF9vcHN9LAo+
ID4gKwo+ID4gIH07Cj4gPgo+ID4gIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NmZ19oYW5kbGVyICpt
c21fZHNpX2NmZ19nZXQodTMyIG1ham9yLCB1MzIgbWlub3IpCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
ZHNpX2NmZy5oCj4gPiBpbmRleCBlMmI3YTdkLi45OTE5NTM2IDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9kc2lfY2ZnLmgKPiA+IEBAIC0xOSw2ICsxOSw3IEBACj4gPiAgI2RlZmluZSBNU01f
RFNJXzZHX1ZFUl9NSU5PUl9WMV80XzEgICAgMHgxMDA0MDAwMQo+ID4gICNkZWZpbmUgTVNNX0RT
SV82R19WRVJfTUlOT1JfVjJfMl8wICAgIDB4MjAwMDAwMDAKPiA+ICAjZGVmaW5lIE1TTV9EU0lf
NkdfVkVSX01JTk9SX1YyXzJfMSAgICAweDIwMDIwMDAxCj4gPiArI2RlZmluZSBNU01fRFNJXzZH
X1ZFUl9NSU5PUl9WMl80XzEgICAgMHgyMDA0MDAwMQo+ID4KPiA+ICAjZGVmaW5lIE1TTV9EU0lf
VjJfVkVSX01JTk9SXzgwNjQgICAgICAweDAKPiA+Cj4gPiAtLQo+ID4gMi43LjQKPiA+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBGcmVlZHJlbm8g
bWFpbGluZyBsaXN0Cj4gRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
