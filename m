Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EEE373E14
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 17:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DE089017;
	Wed,  5 May 2021 15:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D5688B2B;
 Wed,  5 May 2021 15:02:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id 359681F42BC2
Subject: Re: Enabling sample_c optimization for Broadwell GPUs
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <e99599bf-f503-3227-8361-afcd3d2a098f@collabora.com>
 <YJJwlXt4n936yz68@intel.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <353c05f8-07b1-af27-ede0-6f4f5a250f6b@collabora.com>
Date: Wed, 5 May 2021 12:02:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJJwlXt4n936yz68@intel.com>
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>, kernel@collabora.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9kcmlnbywKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHByb3ZpZGluZyB0aGF0IGluZm9y
bWF0aW9uIGluIGEgcHJlY2lzZSBtYW5uZXIuCgrDgHMgMDc6MTYgZGUgMDUvMDUvMjEsIFJvZHJp
Z28gVml2aSBlc2NyZXZldToKPiBIaSBBbmRyZSwKPiAKPiBJJ20gbm90IGZhbWlsaWFyIHdpdGgg
dGhlIHNhbXBsZSBjIG1lc3NhZ2Ugb3B0aW1pemF0aW9uLgo+IFByb2JhYmx5IEtlbiBjYW4gY29t
bWVudC4KPiAKPiBIb3dldmVyIEkgY291bGQgY2hlY2sgdGhlIGludGVybmFsIHNwZWMgaGVyZSBh
bmQgSSBzYXcgdGhpcyBiaXQKPiBvbmx5IGV4aXN0cyB3aXRoIHRoaXMgbWVhbmluZyBpbiBIYXN3
ZWxsLgo+IAo+IEZvciBhbGwgdGhlIG90aGVyIHBsYXRmb3JtcywgaW5jbHVkaW5nIEJyb2Fkd2Vs
bCBpdCBnb3QgcmUtcHVycG9zZWQgd2l0aAo+IGEgZGlmZmVyZW50IG1lYW5pbmcgYW5kIGEgcHJv
Z3JhbW1pbmcgbm90ZToKPiAiVGhpcyBiaXQgc2hvdWxkIGJlIHByb2dyYW1tZWQgdG8gemVybyAo
MGgpIGF0IGFsbCB0aW1lcy4iCj4gCj4gQWxzbywgSSBjb3VsZCBub3QgZmluZCBhbnkgd29ya2Fy
b3VuZCBkb2N1bWVudGVkIGFueXdoZXJlIHJlY29tbWVuZGluZwo+IHRoaXMgYml0IHRvIGJlIHNl
dC4KPiAKPiBTbywgSSB3b3VsZCBub3QgcmVjb21tZW5kIHRvIHVzZSBpdCBpbiBhbnkgcHJvZHVj
dCwgZXZlbiBkb3duc3RyZWFtLgo+IFJlZ2FyZGxlc3MgdGhlIHN0YXRlIG9mIHNhbXBsZSBjIG1l
c3NhZ2Ugb3B0aW1pemF0aW9uIGluIGxhdGVyIHBsYXRmb3Jtcy4KPiAKPiBUaGFua3MsCj4gUm9k
cmlnby4KPiAKPiBPbiBUdWUsIE1heSAwNCwgMjAyMSBhdCAwODowNzoxNFBNIC0wMzAwLCBBbmRy
w6kgQWxtZWlkYSB3cm90ZToKPj4gSGkgdGhlcmUsCj4+Cj4+IFdoaWxlIGJyb3dzaW5nIGFuIG9s
ZCBkb3duc3RyZWFtIGtlcm5lbCwgSSBmb3VuZCBhIHBhdGNoWzBdIHRoYXQgZW5hYmxlcwo+PiBz
YW1wbGVfYyBvcHRpbWl6YXRpb25zIGF0IEJyb2Fkd2VsbCBHUFVzLiBUaGUgbWVzc2FnZSBmcm9t
IHRoZSB1cHN0cmVhbQo+PiBjb21taXQgdGhhdCBlbmFibGVzIGl0IGZvciBIYXN3ZWxsWzFdIChh
bmQgcHJlc3VtYWJseSB3aGVyZSB0aGUgY29kZSBhdFswXQo+PiB3YXMgY29waWVkIGZyb20pIHN0
YXRlcyB0aGF0ICJbLi5dIGxhdGVyIHBsYXRmb3JtcyByZW1vdmUgdGhpcyBiaXQsIGFuZAo+PiBh
cHBhcmVudGx5IGFsd2F5cyBlbmFibGUgdGhlIG9wdGltaXphdGlvbiIuCj4+Cj4+IENvdWxkIHlv
dSBjb25maXJtIHRoYXQgQnJvYWR3ZWxsIGFuZCBmb2xsb3dpbmcgYXJjaGl0ZWN0dXJlcyBlbmFi
bGUgdGhpcwo+PiBvcHRpbWl6YXRpb24gYnkgZGVmYXVsdCAoYW5kIHRodXMsIHBhdGNoWzBdIGlz
IGEgbm8tb3ApLCBvciBzaG91bGQgSQo+PiB1cHN0cmVhbSBpdD8KPj4KPj4gVGhhbmtzLAo+PiAJ
QW5kcsOpCj4+Cj4+IFswXSBodHRwczovL2dpdGh1Yi5jb20vVmFsdmVTb2Z0d2FyZS9zdGVhbW9z
X2tlcm5lbC9jb21taXQvMTk4OTkwZjEzZTFkOTQyOTg2NGMxNzdkOTQ0MWE2NTU5NzcxYzVlMgo+
Pgo+PiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9OTQ0MTE1OTM0NDM2YjFmZjZjZjc3M2E5ZTkx
MjM4NThlYTllZjNkYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
