Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73E18609
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5E389B83;
	Thu,  9 May 2019 07:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A8A89991
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 00:43:40 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 10so330419pfo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 17:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1+Jfl9iXviaxHbmbhnDjk1eQnpFz6l/2Nut9ww82zvo=;
 b=FBQ5614IHX3mJ3e2x2JyN7uN2ZLceNGkg92mlzOnzgZJwy/D1YK+Wgm6JFw5EeMSak
 TKFPzC8Ytu+oD1/pBD0jvRaegA4Asmn5vfRPhDlENS2nBj12bkLlpB5DWu9FfEnuf3yT
 o4DPQhp7ZpJC2o4yQdy68K/ZnQ/5HrC83im0DDZTgLlSP2vBffljdGbfefqj9vDD5mjd
 fEy5JHGGfQIqvdGlgzZX4cV9YpghEk7y6W2dM/4kJAzuGFvDjWB/k53nqaxs4p+jj5BB
 px/+Qczw/uQiTqXc8KOpAmgXhGm56BZ+uf8DOizPIroRVKuAGNBWAuRTkcIaGRro8C6o
 C2/A==
X-Gm-Message-State: APjAAAVad+I1QpdLv/H6Xy/a3GQm/4r59cugehaSYzSDoO6IMrnRhmG5
 xTUTALJyWBH3qZAwu8zshH3wXAMB
X-Google-Smtp-Source: APXvYqzW2wEIzqNsRgYl9IE5EX5P/24Mi1edBj4NYy1YPo+96Z3/rjpt+DtwN4pC4yu/pBUKvsKvyA==
X-Received: by 2002:a65:628b:: with SMTP id f11mr1432751pgv.95.1557362619650; 
 Wed, 08 May 2019 17:43:39 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net.
 [24.6.192.50])
 by smtp.gmail.com with ESMTPSA id 63sm543120pfu.95.2019.05.08.17.43.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 17:43:38 -0700 (PDT)
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
Date: Wed, 8 May 2019 17:43:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507080119.GB28121@kroah.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1+Jfl9iXviaxHbmbhnDjk1eQnpFz6l/2Nut9ww82zvo=;
 b=a3KgZzLZ0y84UNUIY8RS+nYDRzFkAivRDtTwVjhJ1vYp+v2Z6HVSzmnnRowbVUedfI
 93zPM5T0iF4iJCU1PddnaPwpC/nrCINNvHKs9PmQ0ayrLgURqYfh7EH67znRVZxTURN5
 VsMO/ROT48Ly/mYey3OTt/dpawpdAk7DUuJetc8MAAQuinmU4P2PjwyMam4VRQGyIo8C
 F5An8gjuExmDUN5kMRWiGJsQOqa4gz/Zgv9YpcjdE85z0otG8d1GXhf4e05Hdx2o8s1c
 hn9kGYBDYT3L0e4JtQg2AhBurTKMtE9VNzBNe+yPm2LTyV/rg3Wp/BZ+nH8mhD2rC6M3
 7+6g==
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS83LzE5IDE6MDEgQU0sIEdyZWcgS0ggd3JvdGU6Cj4gT24gTW9uLCBNYXkgMDYsIDIwMTkg
YXQgMDg6MTQ6MTJQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdyb3RlOgo+PiBPbiA1LzEvMTkgNDow
MSBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+Pj4gIyMgVExEUgo+Pj4KPj4+IEkgcmViYXNl
ZCB0aGUgbGFzdCBwYXRjaHNldCBvbiA1LjEtcmM3IGluIGhvcGVzIHRoYXQgd2UgY2FuIGdldCB0
aGlzIGluCj4+PiA1LjIuCj4+Pgo+Pj4gU2h1YWgsIEkgdGhpbmsgeW91LCBHcmVnIEtILCBhbmQg
bXlzZWxmIHRhbGtlZCBvZmYgdGhyZWFkLCBhbmQgd2UgYWdyZWVkCj4+PiB3ZSB3b3VsZCBtZXJn
ZSB0aHJvdWdoIHlvdXIgdHJlZSB3aGVuIHRoZSB0aW1lIGNhbWU/IEFtIEkgcmVtZW1iZXJpbmcK
Pj4+IGNvcnJlY3RseT8KPj4+Cj4+PiAjIyBCYWNrZ3JvdW5kCj4+Pgo+Pj4gVGhpcyBwYXRjaCBz
ZXQgcHJvcG9zZXMgS1VuaXQsIGEgbGlnaHR3ZWlnaHQgdW5pdCB0ZXN0aW5nIGFuZCBtb2NraW5n
Cj4+PiBmcmFtZXdvcmsgZm9yIHRoZSBMaW51eCBrZXJuZWwuCj4+Pgo+Pj4gVW5saWtlIEF1dG90
ZXN0IGFuZCBrc2VsZnRlc3QsIEtVbml0IGlzIGEgdHJ1ZSB1bml0IHRlc3RpbmcgZnJhbWV3b3Jr
Owo+Pj4gaXQgZG9lcyBub3QgcmVxdWlyZSBpbnN0YWxsaW5nIHRoZSBrZXJuZWwgb24gYSB0ZXN0
IG1hY2hpbmUgb3IgaW4gYSBWTQo+Pj4gYW5kIGRvZXMgbm90IHJlcXVpcmUgdGVzdHMgdG8gYmUg
d3JpdHRlbiBpbiB1c2Vyc3BhY2UgcnVubmluZyBvbiBhIGhvc3QKPj4+IGtlcm5lbC4gQWRkaXRp
b25hbGx5LCBLVW5pdCBpcyBmYXN0OiBGcm9tIGludm9jYXRpb24gdG8gY29tcGxldGlvbiBLVW5p
dAo+Pj4gY2FuIHJ1biBzZXZlcmFsIGRvemVuIHRlc3RzIGluIHVuZGVyIGEgc2Vjb25kLiBDdXJy
ZW50bHksIHRoZSBlbnRpcmUKPj4+IEtVbml0IHRlc3Qgc3VpdGUgZm9yIEtVbml0IHJ1bnMgaW4g
dW5kZXIgYSBzZWNvbmQgZnJvbSB0aGUgaW5pdGlhbAo+Pj4gaW52b2NhdGlvbiAoYnVpbGQgdGlt
ZSBleGNsdWRlZCkuCj4+Pgo+Pj4gS1VuaXQgaXMgaGVhdmlseSBpbnNwaXJlZCBieSBKVW5pdCwg
UHl0aG9uJ3MgdW5pdHRlc3QubW9jaywgYW5kCj4+PiBHb29nbGV0ZXN0L0dvb2dsZW1vY2sgZm9y
IEMrKy4gS1VuaXQgcHJvdmlkZXMgZmFjaWxpdGllcyBmb3IgZGVmaW5pbmcKPj4+IHVuaXQgdGVz
dCBjYXNlcywgZ3JvdXBpbmcgcmVsYXRlZCB0ZXN0IGNhc2VzIGludG8gdGVzdCBzdWl0ZXMsIHBy
b3ZpZGluZwo+Pj4gY29tbW9uIGluZnJhc3RydWN0dXJlIGZvciBydW5uaW5nIHRlc3RzLCBtb2Nr
aW5nLCBzcHlpbmcsIGFuZCBtdWNoIG1vcmUuCj4+Cj4+IEFzIGEgcmVzdWx0IG9mIHRoZSBlbWFp
bHMgcmVwbHlpbmcgdG8gdGhpcyBwYXRjaCB0aHJlYWQsIEkgYW0gbm93Cj4+IHN0YXJ0aW5nIHRv
IGxvb2sgYXQga3NlbGZ0ZXN0LiAgTXkgbGV2ZWwgb2YgdW5kZXJzdGFuZGluZyBpcyBiYXNlZAo+
PiBvbiBzb21lIHNsaWRlIHByZXNlbnRhdGlvbnMsIGFuIExXTiBhcnRpY2xlLCBodHRwczovL2tz
ZWxmdGVzdC53aWtpLmtlcm5lbC5vcmcvCj4+IGFuZCBhIF90aW55XyBiaXQgb2YgbG9va2luZyBh
dCBrc2VsZnRlc3QgY29kZS4KPj4KPj4gdGw7ZHI7IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQg
a3NlbGZ0ZXN0IHlldC4KPj4KPj4KPj4gKDEpIHdoeSBLVW5pdCBleGlzdHMKPj4KPj4+ICMjIFdo
YXQncyBzbyBzcGVjaWFsIGFib3V0IHVuaXQgdGVzdGluZz8KPj4+Cj4+PiBBIHVuaXQgdGVzdCBp
cyBzdXBwb3NlZCB0byB0ZXN0IGEgc2luZ2xlIHVuaXQgb2YgY29kZSBpbiBpc29sYXRpb24sCj4+
PiBoZW5jZSB0aGUgbmFtZS4gVGhlcmUgc2hvdWxkIGJlIG5vIGRlcGVuZGVuY2llcyBvdXRzaWRl
IHRoZSBjb250cm9sIG9mCj4+PiB0aGUgdGVzdDsgdGhpcyBtZWFucyBubyBleHRlcm5hbCBkZXBl
bmRlbmNpZXMsIHdoaWNoIG1ha2VzIHRlc3RzIG9yZGVycwo+Pj4gb2YgbWFnbml0dWRlcyBmYXN0
ZXIuIExpa2V3aXNlLCBzaW5jZSB0aGVyZSBhcmUgbm8gZXh0ZXJuYWwgZGVwZW5kZW5jaWVzLAo+
Pj4gdGhlcmUgYXJlIG5vIGhvb3BzIHRvIGp1bXAgdGhyb3VnaCB0byBydW4gdGhlIHRlc3RzLiBB
ZGRpdGlvbmFsbHksIHRoaXMKPj4+IG1ha2VzIHVuaXQgdGVzdHMgZGV0ZXJtaW5pc3RpYzogYSBm
YWlsaW5nIHVuaXQgdGVzdCBhbHdheXMgaW5kaWNhdGVzIGEKPj4+IHByb2JsZW0uIEZpbmFsbHks
IGJlY2F1c2UgdW5pdCB0ZXN0cyBuZWNlc3NhcmlseSBoYXZlIGZpbmVyIGdyYW51bGFyaXR5LAo+
Pj4gdGhleSBhcmUgYWJsZSB0byB0ZXN0IGFsbCBjb2RlIHBhdGhzIGVhc2lseSBzb2x2aW5nIHRo
ZSBjbGFzc2ljIHByb2JsZW0KPj4+IG9mIGRpZmZpY3VsdHkgaW4gZXhlcmNpc2luZyBlcnJvciBo
YW5kbGluZyBjb2RlLgo+Pgo+PiAoMikgS1VuaXQgaXMgbm90IG1lYW50IHRvIHJlcGxhY2Uga3Nl
bGZ0ZXN0Cj4+Cj4+PiAjIyBJcyBLVW5pdCB0cnlpbmcgdG8gcmVwbGFjZSBvdGhlciB0ZXN0aW5n
IGZyYW1ld29ya3MgZm9yIHRoZSBrZXJuZWw/Cj4+Pgo+Pj4gTm8uIE1vc3QgZXhpc3RpbmcgdGVz
dHMgZm9yIHRoZSBMaW51eCBrZXJuZWwgYXJlIGVuZC10by1lbmQgdGVzdHMsIHdoaWNoCj4+PiBo
YXZlIHRoZWlyIHBsYWNlLiBBIHdlbGwgdGVzdGVkIHN5c3RlbSBoYXMgbG90cyBvZiB1bml0IHRl
c3RzLCBhCj4+PiByZWFzb25hYmxlIG51bWJlciBvZiBpbnRlZ3JhdGlvbiB0ZXN0cywgYW5kIHNv
bWUgZW5kLXRvLWVuZCB0ZXN0cy4gS1VuaXQKPj4+IGlzIGp1c3QgdHJ5aW5nIHRvIGFkZHJlc3Mg
dGhlIHVuaXQgdGVzdCBzcGFjZSB3aGljaCBpcyBjdXJyZW50bHkgbm90Cj4+PiBiZWluZyBhZGRy
ZXNzZWQuCj4+Cj4+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgaW50ZW50IG9mIEtVbml0
IGlzIHRvIGF2b2lkIGJvb3RpbmcgYSBrZXJuZWwgb24KPj4gcmVhbCBoYXJkd2FyZSBvciBpbiBh
IHZpcnR1YWwgbWFjaGluZS4gIFRoYXQgc2VlbXMgdG8gYmUgYSBtYXR0ZXIgb2Ygc2VtYW50aWNz
Cj4+IHRvIG1lIGJlY2F1c2UgaXNuJ3QgaW52b2tpbmcgYSBVTUwgTGludXgganVzdCBydW5uaW5n
IHRoZSBMaW51eCBrZXJuZWwgaW4KPj4gYSBkaWZmZXJlbnQgZm9ybSBvZiB2aXJ0dWFsaXphdGlv
bj8KPj4KPj4gU28gSSBkbyBub3QgdW5kZXJzdGFuZCB3aHkgS1VuaXQgaXMgYW4gaW1wcm92ZW1l
bnQgb3ZlciBrc2VsZnRlc3QuCj4+Cj4+IEl0IHNlZW1zIHRvIG1lIHRoYXQgS1VuaXQgaXMganVz
dCBhbm90aGVyIHBpZWNlIG9mIGluZnJhc3RydWN0dXJlIHRoYXQgSQo+PiBhbSBnb2luZyB0byBo
YXZlIHRvIGJlIGZhbWlsaWFyIHdpdGggYXMgYSBrZXJuZWwgZGV2ZWxvcGVyLiAgTW9yZSBvdmVy
aGVhZCwKPj4gbW9yZSBpbmZvcm1hdGlvbiB0byBzdHVmZiBpbnRvIG15IHRpbnkgbGl0dGxlIGJy
YWluLgo+Pgo+PiBJIHdvdWxkIGd1ZXNzIHRoYXQgc29tZSBkZXZlbG9wZXJzIHdpbGwgZm9jdXMg
b24ganVzdCBvbmUgb2YgdGhlIHR3byB0ZXN0Cj4+IGVudmlyb25tZW50cyAoYW5kIHNvbWUgd2ls
bCBmb2N1cyBvbiBib3RoKSwgc3BsaXR0aW5nIHRoZSBkZXZlbG9wbWVudAo+PiByZXNvdXJjZXMg
aW5zdGVhZCBvZiBwb29saW5nIHRoZW0gb24gYSBjb21tb24gaW5mcmFzdHJ1Y3R1cmUuCj4+Cj4+
IFdoYXQgYW0gSSBtaXNzaW5nPwo+IAo+IGtzZWxmdGVzdCBwcm92aWRlcyBubyBpbi1rZXJuZWwg
ZnJhbWV3b3JrIGZvciB0ZXN0aW5nIGtlcm5lbCBjb2RlCj4gc3BlY2lmaWNhbGx5LiAgVGhhdCBz
aG91bGQgYmUgd2hhdCBrdW5pdCBwcm92aWRlcywgYW4gImVhc3kiIHdheSB0bwo+IHdyaXRlIGlu
LWtlcm5lbCB0ZXN0cyBmb3IgdGhpbmdzLgoKa3NlbGZ0ZXN0IHByb3ZpZGVzIGEgbWVjaGFuaXNt
IGZvciBpbi1rZXJuZWwgdGVzdHMgdmlhIG1vZHVsZXMuICBGb3IKZXhhbXBsZSwgc2VlOgoKICB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cyBpbnZva2VzOgogICAgdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvdm0vdGVzdF92bWFsbG9jLnNoCiAgICAgIGxvYWRzIG1vZHVsZToK
ICAgICAgICB0ZXN0X3ZtYWxsb2MKICAgICAgICAod2hpY2ggaXMgYnVpbHQgZnJvbSBsaWIvdGVz
dF92bWFsbG9jLmMgaWYgQ09ORklHX1RFU1RfVk1BTExPQykKCkEgdmVyeSBxdWljayBhbmQgZGly
dHkgc2VhcmNoIChsaWtlbHkgdG8gbWlzcyBzb21lIHRlc3RzKSBmaW5kcyBtb2R1bGVzOgoKICB0
ZXN0X2JpdG1hcAogIHRlc3RfYnBmCiAgdGVzdF9maXJtd2FyZQogIHRlc3RfcHJpbnRmCiAgdGVz
dF9zdGF0aWNfa2V5X2Jhc2UKICB0ZXN0X3N0YXRpY19rZXlzCiAgdGVzdF91c2VyX2NvcHkKICB0
ZXN0X3ZtYWxsb2MKCi1GcmFuawoKPiAKPiBCcmVuZGFuLCBkaWQgSSBnZXQgaXQgcmlnaHQ/Cj4g
Cj4gdGhhbmtzLAo+IAo+IGdyZWcgay1oCj4gLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
