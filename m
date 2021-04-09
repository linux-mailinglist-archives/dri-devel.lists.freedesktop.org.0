Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE43598AA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 11:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D426EBA7;
	Fri,  9 Apr 2021 09:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6E66EBA6;
 Fri,  9 Apr 2021 09:07:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id f8so5673207edd.11;
 Fri, 09 Apr 2021 02:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=x+5TJ46FKbh/Ms0co+sL0G4l3RCAAuT8nzcqqF27m6o=;
 b=JnN1fwi6aD8eQ7ECrL8WJxT3G4qy51M17iOuYFCA3j0kjuF3kxGDzNK/vTSIRyy6E5
 cJTB0bS4Zv6KawO3hFMgOkvNyzmumh7L8GevkyxqjwCjfRwcJawtqkhhR303G9O+5Aby
 +xElqWGXOZsrN/huA/e2dK2jzyOXe+eOcNrvYR70LHlXp42B/lXZ3NuisFY7rpw73ASG
 XB3fJ5TiK3y6kZ95awaYwHUviOuk9UlfDUx41BMpNYyBu3NlQBiGOzlQNUsW52qFjJ7R
 3iP1quDSuSYYZlaRexY8LDmR3mzOKuwYubc42OxWJOJiisXnCcbmUdQX/LJ+3F39lngn
 Bbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=x+5TJ46FKbh/Ms0co+sL0G4l3RCAAuT8nzcqqF27m6o=;
 b=dgrWx54yUTyt2GgHY2XZ5zadICtXN+unJAKVLB9Qeq6niQZPSPa9QH1lJjcpdLBUwB
 REoiedz0bSjXhTCo0YB+bPFcykduCOlduMDVC/DnhRvrtbxZxYOAkyyyw6UbF63wZsUV
 4gPNC4RxeS5AW3XqFopTFV9HtpP9O70I1tsaavMk7XJ6u7KV/qW9CUiBJYZjNZOOR5EX
 WXCa3oq9oGzdREm5orLvF0tIHmQALPTlL/OGeXzyjtvulsAy/5KC40rYS/fXUxm3mCpJ
 j5zirnx45OQm1Ewp5RCOf1GUQsTEMMLrVZNYI95qeckBXGPPOiJMYZ5mKccsKlKsIVqn
 APCQ==
X-Gm-Message-State: AOAM53346Vku1UGo6rB07i4JxWtdzT3KZei0L2mhS/qsytY4tqTxdh0u
 jz/eYM5P1HuxHL1rzMNIQGw4fB3Ji88=
X-Google-Smtp-Source: ABdhPJxao0mPX19QDUqAjvgAv6iBGoMceLOKZxQ3mmSe5pFS/4vnu0zbFpB0/zMb/gBfXIvfQU01og==
X-Received: by 2002:a05:6402:1115:: with SMTP id
 u21mr16413614edv.383.1617959244134; 
 Fri, 09 Apr 2021 02:07:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:2f79:f442:c4cd:830e?
 ([2a02:908:1252:fb60:2f79:f442:c4cd:830e])
 by smtp.gmail.com with ESMTPSA id s11sm1066851edt.27.2021.04.09.02.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 02:07:23 -0700 (PDT)
Subject: Re: [pull] amdgpu, radeon, ttm, sched drm-next-5.13
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210401222931.3823-1-alexander.deucher@amd.com>
 <0fa472a5-08b4-87cd-c295-7502bd30c2c0@gmail.com>
 <CADnq5_NXz-B3BjQdP1x7P3tPC160EO906_TZObJhx85CHt6b2A@mail.gmail.com>
 <CAPM=9twymi8Emi+GpDW0Gz_OQ63BGwwzKwF_Jxq8=i_VC9U=3w@mail.gmail.com>
 <CADnq5_Ored1NxmDP5=_-5BXstsTdUPB31upM2AVFLXM1EXKQzQ@mail.gmail.com>
 <d5cf9d27-471c-f89d-375a-be4a76a5debc@gmail.com>
 <18a67a9f-4199-ba39-d2a7-419d7993aac4@gmail.com>
 <CADnq5_OLhO_En84yEeRsBDtMhJ4OY+7XJtgrjqUDrs-8_x7x0g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3ef9c2ab-a6e1-592c-19af-ab634ec17c45@gmail.com>
Date: Fri, 9 Apr 2021 11:07:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_OLhO_En84yEeRsBDtMhJ4OY+7XJtgrjqUDrs-8_x7x0g@mail.gmail.com>
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
Cc: "Zhang, Jack \(Jian\)" <Jack.Zhang1@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDQuMjEgdW0gMTU6MDMgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gVGh1LCBBcHIg
OCwgMjAyMSBhdCA2OjI4IEFNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1l
cmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+PiBBbSAwOC4wNC4yMSB1bSAwOToxMyBzY2hyaWViIENo
cmlzdGlhbiBLw7ZuaWc6Cj4+PiBBbSAwNy4wNC4yMSB1bSAyMTowNCBzY2hyaWViIEFsZXggRGV1
Y2hlcjoKPj4+PiBPbiBXZWQsIEFwciA3LCAyMDIxIGF0IDM6MjMgQU0gRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAZ21haWwuY29tPiB3cm90ZToKPj4+Pj4gT24gV2VkLCA3IEFwciAyMDIxIGF0IDA2OjU0
LCBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4KPj4+Pj4gd3JvdGU6Cj4+Pj4+
PiBPbiBGcmksIEFwciAyLCAyMDIxIGF0IDEyOjIyIFBNIENocmlzdGlhbiBLw7ZuaWcKPj4+Pj4+
IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4gSGV5IEFs
ZXgsCj4+Pj4+Pj4KPj4+Pj4+PiB0aGUgVFRNIGFuZCBzY2hlZHVsZXIgY2hhbmdlcyBzaG91bGQg
YWxyZWFkeSBiZSBpbiB0aGUgZHJtLW1pc2MtbmV4dAo+Pj4+Pj4+IGJyYW5jaCAobm90IDEwMCUg
c3VyZSBhYm91dCB0aGUgVFRNIHBhdGNoLCBuZWVkIHRvIGRvdWJsZSBjaGVjawo+Pj4+Pj4+IG5l
eHQgd2VlaykuCj4+Pj4+Pj4KPj4+Pj4+IFRoZSBUVE0gY2hhbmdlIGlzIG5vdCBpbiBkcm0tbWlz
YyB5ZXQuCj4+Pj4+Pgo+Pj4+Pj4+IENvdWxkIHRoYXQgY2F1c2UgcHJvYmxlbXMgd2hlbiBib3Ro
IGFyZSBtZXJnZWQgaW50byBkcm0tbmV4dD8KPj4+Pj4+IERhdmUsIERhbmllbCwgaG93IGRvIHlv
dSB3YW50IHRvIGhhbmRsZSB0aGlzPyAgVGhlIGR1cGxpY2F0ZWQgcGF0Y2gKPj4+Pj4+IGlzIHRo
aXMgb25lOgo+Pj4+Pj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2Mv
Y29tbWl0Lz9pZD1hYzRlYjgzYWIyNTVkZTljMzExODRkZjUxZmQxNTM0YmEzNmZkMjEyCj4+Pj4+
Pgo+Pj4+Pj4gYW1kZ3B1IGhhcyBjaGFuZ2VzIHdoaWNoIGRlcGVuZCBvbiBpdC4gIFRoZSBzYW1l
IHBhdGNoIGlzIGluY2x1ZGVkCj4+Pj4+PiBpbiB0aGlzIFBSLgo+Pj4+PiBPdWNoIG5vdCBzdXJl
IGhvdyBiZXN0IHRvIHN5bmMgdXAgaGVyZSwgbWF5YmUgZ2V0IG1pc2MtbmV4dCBpbnRvIG15Cj4+
Pj4+IHRyZWUgdGhlbiByZWJhc2UgeW91ciB0cmVlIG9uIHRvcCBvZiBpdD8KPj4+PiBJIGNhbiBk
byB0aGF0Lgo+Pj4gUGxlYXNlIGxldCBtZSBkb3VibGUgY2hlY2sgbGF0ZXIgdG9kYXkgdGhhdCB3
ZSBoYXZlIGV2ZXJ5dGhpbmcgd2UgbmVlZAo+Pj4gaW4gZHJtLW1pc2MtbmV4dC4KPj4gVGhlcmUg
d2hlcmUgdHdvIHBhdGNoIGZvciBUVE0gKG9uZSBmcm9tIEZlbGl4IGFuZCBvbmUgZnJvbSBPYWsp
IHdoaWNoCj4+IHN0aWxsIG5lZWRlZCB0byBiZSBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4gSSd2
ZSBkb25lIHRoYXQganVzdCBhIG1pbnV0ZQo+PiBhZ28uCj4+Cj4gVGhleSB3ZXJlIGluY2x1ZGVk
IGluIHRoaXMgUFIuCj4KPj4gVGhlbiB3ZSBoYXZlIHRoaXMgcGF0Y2ggd2hpY2ggZml4ZXMgYSBi
dWcgaW4gY29kZSByZW1vdmVkIG9uCj4+IGRybS1taXNjLW5leHQuIEkgdGhpbmsgaXQgc2hvdWxk
IGJlIGRyb3BwZWQgd2hlbiBhbWQtc3RhZ2luZy1kcm0tbmV4dCBpcwo+PiBiYXNlZCBvbiBkcm0t
bmV4dC9kcm0tbWlzYy1uZXh0Lgo+Pgo+PiBBdXRob3I6IHhpbmh1aSBwYW4gPHhpbmh1aS5wYW5A
YW1kLmNvbT4KPj4gRGF0ZTogICBXZWQgRmViIDI0IDExOjI4OjA4IDIwMjEgKzA4MDAKPj4KPj4g
ICAgICAgZHJtL3R0bTogRG8gbm90IGFkZCBub24tc3lzdGVtIGRvbWFpbiBCTyBpbnRvIHN3YXAg
bGlzdAo+Pgo+IE9rLgo+Cj4+IEkndmUgYWxzbyBmb3VuZCB0aGUgZm9sbG93aW5nIHBhdGNoIHdo
aWNoIGlzIHByb2JsZW1hdGljIGFzIHdlbGw6Cj4+Cj4+IGNvbW1pdCBjOGE5MjFkNDk0NDMwMjVl
MTA3OTQzNDJkNDQzM2IzZjI5NjE2NDA5Cj4+IEF1dGhvcjogSmFjayBaaGFuZyA8SmFjay5aaGFu
ZzFAYW1kLmNvbT4KPj4gRGF0ZTogICBNb24gTWFyIDggMTI6NDE6MjcgMjAyMSArMDgwMAo+Pgo+
PiAgICAgICBkcm0vYW1kL2FtZGdwdSBpbXBsZW1lbnQgdGRyIGFkdmFuY2VkIG1vZGUKPj4KPj4g
ICAgICAgW1doeV0KPj4gICAgICAgUHJldmlvdXMgdGRyIGRlc2lnbiB0cmVhdHMgdGhlIGZpcnN0
IGpvYiBpbiBqb2JfdGltZW91dCBhcyB0aGUgYmFkIGpvYi4KPj4gICAgICAgQnV0IHNvbWV0aW1l
cyBhIGxhdGVyIGJhZCBjb21wdXRlIGpvYiBjYW4gYmxvY2sgYSBnb29kIGdmeCBqb2IgYW5kCj4+
ICAgICAgIGNhdXNlIGFuIHVuZXhwZWN0ZWQgZ2Z4IGpvYiB0aW1lb3V0IGJlY2F1c2UgZ2Z4IGFu
ZCBjb21wdXRlIHJpbmcgc2hhcmUKPj4gICAgICAgaW50ZXJuYWwgR0MgSFcgbXV0dWFsbHkuCj4+
Cj4+ICAgICAgIFtIb3ddCj4+ICAgICAgIFRoaXMgcGF0Y2ggaW1wbGVtZW50cyBhbiBhZHZhbmNl
ZCB0ZHIgbW9kZS5JdCBpbnZvbHZlcyBhbiBhZGRpdGluYWwKPj4gICAgICAgc3luY2hyb25vdXMg
cHJlLXJlc3VibWl0IHN0ZXAoU3RlcDAgUmVzdWJtaXQpIGJlZm9yZSBub3JtYWwgcmVzdWJtaXQK
Pj4gICAgICAgc3RlcCBpbiBvcmRlciB0byBmaW5kIHRoZSByZWFsIGJhZCBqb2IuCj4+Cj4+ICAg
ICAgIDEuIEF0IFN0ZXAwIFJlc3VibWl0IHN0YWdlLCBpdCBzeW5jaHJvbm91c2x5IHN1Ym1pdHMg
YW5kIHBlbmRzIGZvciB0aGUKPj4gICAgICAgZmlyc3Qgam9iIGJlaW5nIHNpZ25hbGVkLiBJZiBp
dCBnZXRzIHRpbWVvdXQsIHdlIGlkZW50aWZ5IGl0IGFzIGd1aWx0eQo+PiAgICAgICBhbmQgZG8g
aHcgcmVzZXQuIEFmdGVyIHRoYXQsIHdlIHdvdWxkIGRvIHRoZSBub3JtYWwgcmVzdWJtaXQgc3Rl
cCB0bwo+PiAgICAgICByZXN1Ym1pdCBsZWZ0IGpvYnMuCj4+Cj4+ICAgICAgIDIuIEZvciB3aG9s
ZSBncHUgcmVzZXQodnJhbSBsb3N0KSwgZG8gcmVzdWJtaXQgYXMgdGhlIG9sZCB3YXkuCj4+Cj4+
ICAgICAgIFNpZ25lZC1vZmYtYnk6IEphY2sgWmhhbmcgPEphY2suWmhhbmcxQGFtZC5jb20+Cj4+
ICAgICAgIFJldmlld2VkLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lA
YW1kLmNvbT4KPj4KPj4gVGhhdCBvbmUgaXMgbW9kaWZ5aW5nIGJvdGggYW1kZ3B1IGFzIHdlbGwg
YXMgdGhlIHNjaGVkdWxlciBjb2RlLiBJSVJDIEkKPj4gYWN0dWFsbHkgcmVxdWVzdGVkIHRoYXQg
dGhlIHBhdGNoIGlzIHNwbGl0IGludG8gdHdvLCBidXQgdGhhdCB3YXMKPj4gc29tZWhvdyBub3Qg
ZG9uZS4KPj4KPj4gSG93IHNob3VsZCB3ZSBwcm9jZWVkIGhlcmU/IFNob3VsZCBJIHNlcGFyYXRl
IHRoZSBwYXRjaCwgcHVzaCB0aGUKPj4gY2hhbmdlcyB0byBkcm0tbWlzYy1uZXh0IGFuZCB0aGVu
IHdlIG1lcmdlIHdpdGggZHJtLW5leHQgYW5kIHJlYmFzZQo+PiBhbWQtc3RhZ2luZy1kcm0tbmV4
dCBvbiB0b3Agb2YgdGhhdD8KPj4KPj4gVGhhdCdzIG1vc3QgbGlrZWx5IHRoZSBjbGVhbmVzdCBv
cHRpb24gYXBwcm9hY2ggYXMgZmFyIGFzIEkgY2FuIHNlZS4KPiBUaGF0J3MgZmluZSB3aXRoIG1l
LiAgV2UgY291bGQgaGF2ZSBpbmNsdWRlZCB0aGVtIGluIG15IFBSLiAgTm93IHdlCj4gaGF2ZSB3
YWl0IGZvciBkcm0tbWlzYy1uZXh0IHRvIGJlIG1lcmdlZCBhZ2FpbiBiZWZvcmUgd2UgY2FuIG1l
cmdlIHRoZQo+IGFtZGdwdSBjb2RlLgoKV2VsbCBJJ20gbm90IHN1cmUsIGJ1dCB0aGUgcGF0Y2hl
cyBhcmUgaWRlbnRpY2FsIG9uIGJvdGggYnJhbmNoZXMuCgpBcyBmYXIgYXMgSSBjYW4gc2VlIGdp
dCB0aGVuIGp1c3QgaWdub3JlcyB0aGF0IGl0IGdldHMgdGhlIHBhdGNoZXMgZnJvbSAKYm90aCBz
aWRlcyBvZiB0aGUgbWVyZ2UuCgpCdXQgSSdtIG5vdCBhbiBleHBlcnQgaWYgdGhhdCBkb2Vzbid0
IGhhcyBzb21lIGJhZCBjb25zZXF1ZW5jZXMgCnNvbWV3aGVyZSBlbHNlLgoKT24gdGhlIG90aGVy
IGhhbmQgSSd2ZSBkZWNpZGVkIHRvIGtlZXAgdGhlIFREUiBwYXRjaCBhcyBpdCBpcyBmb3Igbm93
LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPiBJcyBhbnlvbmUgcGxhbm5pbmcgdG8gZG8gYW5vdGhl
ciBkcm0tbWlzYyBtZXJnZSBhdCB0aGlzCj4gcG9pbnQ/Cj4KPiBBbGV4Cj4KPj4gVGhhbmtzLAo+
PiBDaHJpc3RpYW4uCj4+Cj4+PiBSZWdhcmRzLAo+Pj4gQ2hyaXN0aWFuLgo+Pj4KPj4+PiBBbGV4
Cj4+Pj4KPj4+Pgo+Pj4+PiBEYXZlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
