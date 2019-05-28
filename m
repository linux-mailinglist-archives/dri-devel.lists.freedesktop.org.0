Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0894F2C580
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 13:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502A26E20C;
	Tue, 28 May 2019 11:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0E16E202;
 Tue, 28 May 2019 11:35:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 04:35:49 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.252.33.94]) ([10.252.33.94])
 by orsmga005.jf.intel.com with ESMTP; 28 May 2019 04:35:46 -0700
Subject: Re: [v11 00/12] Add HDR Metadata Parsing and handling in DRM layer
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>
References: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
 <20190522204522.GC6464@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <c83b4fc7-ea7e-66e6-9d7e-379eeec6d199@linux.intel.com>
Date: Tue, 28 May 2019 13:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190522204522.GC6464@intel.com>
Content-Language: en-US
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjItMDUtMjAxOSBvbSAyMjo0NSBzY2hyZWVmIFZpbGxlIFN5cmrDpGzDpDoKPiBPbiBUaHUs
IE1heSAxNiwgMjAxOSBhdCAwNzo0MDowNVBNICswNTMwLCBVbWEgU2hhbmthciB3cm90ZToKPj4g
VGhpcyBwYXRjaCBzZXJpZXMgZW5hYmxlcyBIRFIgc3VwcG9ydCBpbiBkcm0uIEl0IGJhc2ljYWxs
eSBkZWZpbmVzCj4+IEhEUiBtZXRhZGF0YSBzdHJ1Y3R1cmVzLCBwcm9wZXJ0eSB0byBwYXNzIGNv
bnRlbnQgKGFmdGVyIGJsZW5kaW5nKQo+PiBtZXRhZGF0YSBmcm9tIHVzZXIgc3BhY2UgY29tcG9z
aXRvcnMgdG8gZHJpdmVyLgo+Pgo+PiBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJpbmcgaW5mb2Zy
YW1lIGNyZWF0aW9uIGFuZCBzZW5kaW5nLgo+Pgo+PiBUb0RvOgo+PiAxLiBXZSBuZWVkIHRvIGdl
dCB0aGUgY29sb3IgZnJhbWV3b3JrIGluIHBsYWNlIGZvciBhbGwgcGxhbmVzCj4+ICAgIHdoaWNo
IHN1cHBvcnQgSERSIGNvbnRlbnQgaW4gaGFyZHdhcmUuIFRoaXMgaXMgYWxyZWFkeSBpbiBwcm9n
cmVzCj4+ICAgIGFuZCBwYXRjaGVzIGFyZSBvdXQgZm9yIHJldmlldyBpbiBtYWlsaW5nIGxpc3Qu
Cj4+IDIuIFVzZXJTcGFjZS9Db21wb3NpdG9yczogQmxlbmRpbmcgcG9saWNpZXMgYW5kIG1ldGFk
YXRhIGJsb2IKPj4gICAgY3JlYXRpb24gYW5kIHBhc3NpbmcgdG8gZHJpdmVyLiBXb3JrIGlzIGFs
cmVhZHkgaW4gcHJvZ3Jlc3MKPj4gICAgYnkgSW50ZWwncyBtaWRkbGV3YXJlIHRlYW1zIG9uIHdh
eWxhbmQgYW5kIHRoZSBwYXRjaGVzIGZvcgo+PiAgICB0aGUgc2FtZSBhcmUgaW4gcmV2aWV3Lgo+
Pgo+PiBBIFBPQyBoYXMgYWxyZWFkeSBiZWVuIGRldmVsb3BlZCBieSBWaWxsZSBiYXNlZCBvbiB3
YXlsYW5kLiBQbGVhc2UgcmVmZXIKPj4gYmVsb3cgbGluayB0byBzZWUgdGhlIGNvbXBvbmVudCBp
bnRlcmFjdGlvbnMgYW5kIHVzYWdlOgo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9h
cmNoaXZlcy93YXlsYW5kLWRldmVsLzIwMTctRGVjZW1iZXIvMDM2NDAzLmh0bWwKPj4KPj4gdjI6
IFVwZGF0ZWQgVmlsbGUncyBQT0MgY2hhbmdlcyB0byB0aGUgcGF0Y2ggc2VyaWVzLkluY29ycG9y
YXRlZCBjbGVhbnVwcwo+PiBhbmQgZml4ZXMgZnJvbSBWaWxsZS4gUmViYXNlIG9uIGxhdGVzdCBk
cm0tdGlwLgo+Pgo+PiB2MzogRml4ZWQgYSB3YXJuaW5nIGNhdXNpbmcgYnVpbGRzIHRvIGJyZWFr
IG9uIENJLiBObyBtYWpvciBjaGFuZ2UuCj4+Cj4+IHY0OiBBZGRyZXNzZWQgU2hhc2hhbmsncyBy
ZXZpZXcgY29tbWVudHMuCj4+Cj4+IHY1OiBSZWJhc2Ugb24gdG9wIG9mIFZpbGxlJ3MgaW5mb2Zy
YW1lIHJlZmFjdG9yaW5nIGNoYW5nZXMuIEZpeGVkIG5vbiBtb2Rlc2V0Cj4+IGNhc2UgZm9yIEhE
UiBtZXRhZGF0YSB1cGRhdGUuIERyb3BwZWQgYSByZWR1bmRhbnQgcGF0Y2guCj4+Cj4+IHY2OiBB
ZGRyZXNzZWQgU2hhc2hhbmsncyByZXZpZXcgY29tbWVudHMgYW5kIGFkZGVkIFJCJ3MgcmVjZWl2
ZWQuCj4+Cj4+IHY3OiBTcXVhc2hlZCAyIHBhdGNoZXMsIGRyb3BwZWQgMSBjaGFuZ2UgYW5kIGFk
ZHJlc3NlZCBCcmlhbiBTdGFya2V5J3MgYW5kCj4+IFNoYXNoYW5rJ3MgcmV2aWV3IGNvbW1lbnRz
Lgo+Pgo+PiB2ODogQWRkcmVzc2VkIEpvbmFzIEthcmxtYW4gcmV2aWV3IGNvbW1lbnRzLiBBZGRl
ZCBTaGFzaGFuaydzIFJCIHRvIHRoZSBzZXJpZXMsCj4+IGZpeGVkIGEgV0FSTl9PTiBvbiBCWVQv
Q0hULgo+Pgo+PiB2OTogQWRkcmVzc2VkIFZpbGxlIGFuZCBKb25hcyBLYXJsbWFuJ3MgcmV2aWV3
IGNvbW1lbnRzLiBBZGRlZCB0aGUgaW5mb2ZyYW1lCj4+IHN0YXRlIHJlYWRvdXQgYW5kIG1ldGFk
YXRhIHJlZmVyZW5jZSBjb3VudC4KPj4KPj4gdjEwOiBBZGRyZXNzZWQgcmV2aWV3IGNvbW1lbnRz
IGZyb20gSm9uYXMgYW5kIFZpbGxlLiBEcm9wcGVkIG9uZSBwYXRjaCByZWxhdGVkCj4+IHRvIGk5
MTUgZmFzdHNldCBoYW5kbGluZyBhcyBwZXIgVmlsbGUncyBmZWVkYmFjay4KPj4KPj4gdjExOiBB
ZGRyZXNzZWQgVmlsbGUncyByZXZpZXcgY29tbWVudHMuCj4+Cj4+IE5vdGU6IHY5IHZlcnNpb24g
aXMgYWxyZWFkeSB0ZXN0ZWQgd2l0aCBLb2RpIGFuZCBhIGNvbmZpcm1hdGlvbiBmcm9tIHRlYW0g
a29kaSBoYXMgYmVlbgo+PiByZWNlaXZlZC4gQnJhbmNoIGRldGFpbHMgZm9yIHRoZSBzYW1lIGFz
IGJlbG93Ogo+PiBodHRwczovL2dpdGh1Yi5jb20veGJtYy94Ym1jL3RyZWUvZmVhdHVyZV9kcm1w
cmltZS12YWFwaQo+Pgo+PiB2OSBvZiB0aGlzIHNlcmllcyBpczoKPj4gVGVzdGVkLWJ5OiBKb25h
cyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cj4+Cj4+IEpvbmFzIEthcmxtYW4gKDEpOgo+PiAg
IGRybTogQWRkIHJlZmVyZW5jZSBjb3VudGluZyBvbiBIRFIgbWV0YWRhdGEgYmxvYgo+Pgo+PiBV
bWEgU2hhbmthciAoOSk6Cj4+ICAgZHJtOiBBZGQgSERSIHNvdXJjZSBtZXRhZGF0YSBwcm9wZXJ0
eQo+PiAgIGRybTogUGFyc2UgSERSIG1ldGFkYXRhIGluZm8gZnJvbSBFRElECj4+ICAgZHJtOiBF
bmFibGUgSERSIGluZm9mcmFtZSBzdXBwb3J0Cj4+ICAgZHJtL2k5MTU6IEF0dGFjaCBIRFIgbWV0
YWRhdGEgcHJvcGVydHkgdG8gY29ubmVjdG9yCj4+ICAgZHJtL2k5MTU6IFdyaXRlIEhEUiBpbmZv
ZnJhbWUgYW5kIHNlbmQgdG8gcGFuZWwKPj4gICBkcm0vaTkxNTpFbmFibGVkIE1vZGVzZXQgd2hl
biBIRFIgSW5mb2ZyYW1lIGNoYW5nZXMKPj4gICBkcm0vaTkxNTogQWRkZWQgRFJNIEluZm9mcmFt
ZSBoYW5kbGluZyBmb3IgQllUL0NIVAo+PiAgIHZpZGVvL2hkbWk6IEFkZCBVbnBhY2sgZnVuY3Rp
b24gZm9yIERSTSBpbmZvZnJhbWUKPj4gICBkcm0vaTkxNTogQWRkIHN0YXRlIHJlYWRvdXQgZm9y
IERSTSBpbmZvZnJhbWUKPj4KPj4gVmlsbGUgU3lyasOkbMOkICgyKToKPj4gICBkcm06IEFkZCBI
TEcgRU9URgo+PiAgIGRybS9pOTE1OiBFbmFibGUgaW5mb2ZyYW1lcyBvbiBHTEsrIGZvciBIRFIK
PiBQdXNoZWQgdGhlIGNvcmUvZXRjLiBiaXRzIHRvIGRybS1taXNjLW5leHQgc28gdGhhdCBvdGhl
ciBkcml2ZXJzCj4gY2FuIGJhc2UgdGhlaXIgd29yayBvbiB0aGF0LiBXZSdsbCBuZWVkIGEgYmFj
a21lcmdlIHRvIGdldCB0aGUKPiBpOTE1IHN0dWZmIGluIHZpYSBkaW5xLgo+ClJlc3QgcHVzaGVk
IGFzIHdlbGwuIEkgcmVvcmRlcmVkIHRoZSBzZXJpZXMgdG8gYmUgc2xpZ2h0bHkgbW9yZSBsb2dp
Y2FsLCBmcm9tIGh3IGVuYWJsaW5nIGJpdHMgdG8gc3cgZW5hYmxpbmcgYml0cy4gOikKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
