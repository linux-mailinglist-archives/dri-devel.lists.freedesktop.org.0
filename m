Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC5D2F66A7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBC76E111;
	Thu, 14 Jan 2021 17:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE5E6E111;
 Thu, 14 Jan 2021 17:06:59 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id b24so5852284otj.0;
 Thu, 14 Jan 2021 09:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qh27w4Qu6OhsphukRi2VdyAK1mOAim2h716oUAliA58=;
 b=HHEJA648X5qusc4i+aD87hdFQH45LsBeTjJRRQel8OpeXFcsPqj63FFLti3Wt/cfoS
 SG9cViNZc9/XAFMRVqvOV9x2n9FikFlY3jugjFlgu0bkuy0KWWgatg7H3F64u3bI4Val
 bYK0Cem7CmuJeOCH8OLaH1l/jNd1QxZwUIxNNKbcUgkiwhqZJ2BJVDX8Ml+AR0JsELE6
 Ik1i4fIpKmFaD0ZI9bxeKJrkEI2TsLTpa78YUD8DyA2+jHbwsey8RS78jOFGL8Eq1gck
 it7SoEQJX7tc3XLybD5gcudk88BmZIS7mtKBRCINcD1QypnNQ0NgP47AwEo2PXhzcKsx
 kj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qh27w4Qu6OhsphukRi2VdyAK1mOAim2h716oUAliA58=;
 b=ASfvE+GaThwJDBG8SIXZ+JUpH5CbNj309vlJkl9JUltA1sYr/VwvHrvWQzHmFLVLd4
 1Xu4IvRC0p+4jRMsO0IDiZOY/3AXFstMfdR55vzNafrjnPAZQw+xrqDdI4TTeuOqsMUr
 Xpa1+X2ApsT7DJfUj6foUf2F6w2F53vlZ+kd6PviolJJEtT8sv4et7C1th0huGTAZgJU
 3HyWJE0jCsbHLyLUdBbWodfD6GYr5rO8KyIdoEwVVrvsUOzkmVoUxyhdbYqIcmAtwxhd
 sygUO6jxcLkJbaK5aV9QAp/XrKAiTC9CrISCfHu4jlis3dvEmDCWZZ1ukwlJxMlnNGJm
 viPA==
X-Gm-Message-State: AOAM530L76yRubC1iXfraUoq6Bw951nJjlgYbGUbx9VNYbbew3ip08j3
 GOsHL+DwTvVXoZfcMT+PabqvtGzr+m3k7N41t48=
X-Google-Smtp-Source: ABdhPJwfwGMzERsPUfhKr73XbkTkP6/KnfFYpoFUS487anDPL56vBHJfWjFCM/j4aRke1Jsr1NrW+DT7LLtEbXALi9w=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr5260854otl.311.1610644019008; 
 Thu, 14 Jan 2021 09:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-6-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-6-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:06:47 -0500
Message-ID: <CADnq5_NQ5dnb5B6_4TooYWrL6FU1ML_AiF6+h42=FM4atv=tZg@mail.gmail.com>
Subject: Re: [PATCH 05/30] drm/amd/display/modules/info_packet/info_packet:
 Correct kernel-doc formatting
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvbW9k
dWxlcy9pbmZvX3BhY2tldC9pbmZvX3BhY2tldC5jOjQxMjogd2FybmluZzogQ2Fubm90IHVuZGVy
c3RhbmQgICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqCj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5
LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENj
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgLi4uL2FtZC9kaXNw
bGF5L21vZHVsZXMvaW5mb19wYWNrZXQvaW5mb19wYWNrZXQuYyAgIHwgMTMgKysrKy0tLS0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2luZm9fcGFj
a2V0L2luZm9fcGFja2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9p
bmZvX3BhY2tldC9pbmZvX3BhY2tldC5jCj4gaW5kZXggMGZkZjdhM2U5NmRlYS4uNTdmMTk4ZGU1
ZTJjYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9p
bmZvX3BhY2tldC9pbmZvX3BhY2tldC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L21vZHVsZXMvaW5mb19wYWNrZXQvaW5mb19wYWNrZXQuYwo+IEBAIC00MDksMTYgKzQwOSwx
MSBAQCB2b2lkIG1vZF9idWlsZF92c2NfaW5mb3BhY2tldChjb25zdCBzdHJ1Y3QgZGNfc3RyZWFt
X3N0YXRlICpzdHJlYW0sCj4gIH0KPgo+ICAvKioKPiAtICoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4g
LSAqICBGdW5jdGlvbjogbW9kX2J1aWxkX2hmX3ZzaWZfaW5mb3BhY2tldAo+ICsgKiAgbW9kX2J1
aWxkX2hmX3ZzaWZfaW5mb3BhY2tldCAtIFByZXBhcmUgSERNSSBWZW5kb3IgU3BlY2lmaWMgaW5m
byBmcmFtZS4KPiArICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGb2xsb3dzIEhE
TUkgU3BlYyB0byBidWlsZCB1cCBWZW5kb3IgU3BlY2lmaWMgaW5mbyBmcmFtZQo+ICAgKgo+IC0g
KiAgQGJyaWVmCj4gLSAqICAgICBQcmVwYXJlIEhETUkgVmVuZG9yIFNwZWNpZmljIGluZm8gZnJh
bWUuCj4gLSAqICAgICBGb2xsb3dzIEhETUkgU3BlYyB0byBidWlsZCB1cCBWZW5kb3IgU3BlY2lm
aWMgaW5mbyBmcmFtZQo+IC0gKgo+IC0gKiAgQHBhcmFtIFtpbl0gc3RyZWFtOiBjb250YWlucyBk
YXRhIHdlIG1heSBuZWVkIHRvIGNvbnN0cnVjdCBWU0lGIChpLmUuIHRpbWluZ18zZF9mb3JtYXQs
IGV0Yy4pCj4gLSAqICBAcGFyYW0gW291dF0gaW5mb19wYWNrZXQ6ICAgb3V0cHV0IHN0cnVjdHVy
ZSB3aGVyZSB0byBzdG9yZSBWU0lGCj4gLSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICsgKiAgQHN0
cmVhbTogICAgICBjb250YWlucyBkYXRhIHdlIG1heSBuZWVkIHRvIGNvbnN0cnVjdCBWU0lGIChp
LmUuIHRpbWluZ18zZF9mb3JtYXQsIGV0Yy4pCj4gKyAqICBAaW5mb19wYWNrZXQ6IG91dHB1dCBz
dHJ1Y3R1cmUgd2hlcmUgdG8gc3RvcmUgVlNJRgo+ICAgKi8KPiAgdm9pZCBtb2RfYnVpbGRfaGZf
dnNpZl9pbmZvcGFja2V0KGNvbnN0IHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSwKPiAg
ICAgICAgICAgICAgICAgc3RydWN0IGRjX2luZm9fcGFja2V0ICppbmZvX3BhY2tldCkKPiAtLQo+
IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
