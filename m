Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BBF1A327
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 20:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771A489C16;
	Fri, 10 May 2019 18:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6833895D7;
 Fri, 10 May 2019 18:50:51 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id v17so6445313otp.13;
 Fri, 10 May 2019 11:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Foxz7qrv4t3w/FL4IJaClc6QijaTM6xy9xLnPK+xt20=;
 b=RKW2iB37ZsqV08FQg1cQ01mDSffOApuUdV4DaCx1PQgd5e7gFxiof+UpK2frirvHBP
 eppeX+1+Mfh1bpaX0NhphWiXiZ3Yjk7C8xLk1+mEzOzQ6p2k9eAhevpBP3CUDDbELsQo
 J4Edl7fPDuOZbt3Z3yLDRwCLof+Dk/q0SltdWiFJJ2gAAsu+fmr/rKTuB2s2LckOvzUp
 wUlAiDtIAX2NXRYrt9asp4/3zzXhyqE+nBV3PzIR9r5SaUvawC78zWFmjyHLqngRwcJg
 Tu0GJoliYII8s0HbqyRcYvEt+hhYZZ14vV3ruqNtupVcHHrQTHbQxT1x8CcJiGz9IcrM
 0+BA==
X-Gm-Message-State: APjAAAUaI+HL4BQqlOxcu/VhePwLDCkXXEj/egUnI2JGjSA8VxtB67CH
 FQs2IV2p3fGWEOTRmsplljgGmVFa6pQTrJO1AIk=
X-Google-Smtp-Source: APXvYqwhqclELIcCu2uKuIKLR2wBYJ06SIsw5N9E6Iha0pq8+aotYPyhX4o7xg9jPNhninKWSCO+5ztOBUzJGQUV22A=
X-Received: by 2002:a9d:2208:: with SMTP id o8mr8012675ota.236.1557514250742; 
 Fri, 10 May 2019 11:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <f63c8d6b-92a4-2977-d062-7e0b7036834e@gmail.com>
 <CAOWid-fpHqvq35C+gfHmLnuHM9Lj+iiHFXE=3RPrkAiFL2=wvQ@mail.gmail.com>
 <1ca1363e-b39c-c299-1d24-098b1059f7ff@amd.com>
 <CAOWid-eVz4w-hN=4tPZ1AOu54xMH_2ztDDZaMEKRCAeBgt9Dyw@mail.gmail.com>
 <64d12227-a0b9-acee-518c-8c97c5da4136@amd.com>
In-Reply-To: <64d12227-a0b9-acee-518c-8c97c5da4136@amd.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Fri, 10 May 2019 14:50:39 -0400
Message-ID: <CAOWid-es+C_iStQUkM52mO3TeP8eS9MX+emZDQNH2PyZCf=RHQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm,
 cgroup: Add total GEM buffer allocation limit
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Foxz7qrv4t3w/FL4IJaClc6QijaTM6xy9xLnPK+xt20=;
 b=OyZfn7M14VP4zvADwLc+u5sRTLBG2hYOREY/eeTqyV/6AAd6AuyhSOB3xuts9Fuz1u
 JYEW87c5W1jwSZ/Zn6bLrw9xbCYgNCQ6kcg5yod8xhv5CLW2YffnL7P62rQs1kWDnpY6
 OKKWt2UdSQsMo/qdeQtCg9J2hEY4XgRkmMkv2efcIoU62clqeRCIU5DiRRLFQEUPIrDK
 HcW/y0lAjZ/LhCykagSFNP61xuUhA3n1vuU80Pk8QyjYl8LR3kgTvyMHwQOFJwwIg2r/
 /TOIl3fgBvsFJHvLbrz2Di1GySr47fl9hjoeWSZjDTYMrWySF70Q1hjPv3K/KY+WCcZm
 KWKA==
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
Cc: "sunnanyong@huawei.com" <sunnanyong@huawei.com>, "Ho,
 Kenny" <Kenny.Ho@amd.com>, Brian Welty <brian.welty@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMTo0OCBQTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiBXZWxsIGFub3RoZXIgcXVlc3Rpb24gaXMgd2h5
IGRvIHdlIHdhbnQgdG8gcHJldmVudCB0aGF0IGluIHRoZSBmaXJzdCBwbGFjZT8KPgo+IEkgbWVh
biB0aGUgd29yc3QgdGhpbmcgdGhhdCBjYW4gaGFwcGVuIGlzIHRoYXQgd2UgYWNjb3VudCBhIEJP
IG11bHRpcGxlCj4gdGltZXMuClRoYXQncyBvbmUgb2YgdGhlIHByb2JsZW1zLiAgVGhlIG90aGVy
IG9uZSBpcyB0aGUgQk8gb3V0bGl2aW5nIHRoZQpsaWZldGltZSBvZiBhIGNncm91cCBhbmQgdGhl
cmUncyBubyBnb29kIHdheSB0byB1bi1jaGFyZ2UgdGhlIHVzYWdlCndoZW4gdGhlIEJPIGlzIGZy
ZWUgc28gdGhlIGNvdW50IHdvbid0IGJlIGFjY3VyYXRlLgoKSSBoYXZlIGxvb2tlZCBpbnRvIHR3
byBwb3NzaWJsZSBzb2x1dGlvbnMuICBPbmUgaXMgdG8gcHJldmVudCBjZ3JvdXAKZnJvbSBiZWlu
ZyByZW1vdmVkIHdoZW4gdGhlcmUgYXJlIEJPcyBvd25lZCBieSB0aGUgY2dyb3VwIHN0aWxsIGFs
aXZlCihzaW1pbGFyIHRvIGhvdyBjZ3JvdXAgcmVtb3ZhbCB3aWxsIGZhaWwgaWYgaXQgc3RpbGwg
aGFzIHByb2Nlc3NlcwphdHRhY2hlZCB0byBpdC4pICBNeSBjb25jZXJuIGhlcmUgaXMgdGhlIHBv
c3NpYmlsaXR5IG9mIG5vdCBhYmxlIHRvCnJlbW92ZSBhIGNncm91cCBmb3JldmVyIGR1ZSB0byB0
aGUgbGlmZXRpbWUgb2YgYSBCTyAoY29udGludW91c2x5CmJlaW5nIHNoYXJlZCBhbmQgcmV1c2Ug
YW5kIG5ldmVyIGRpZS4pICBQZXJoYXBzIHlvdSBjYW4gc2hlZCBzb21lCmxpZ2h0IG9uIHRoaXMg
cG9zc2liaWxpdHkuCgpUaGUgb3RoZXIgb25lIGlzIHRvIGtlZXAgdHJhY2sgb2YgYWxsIHRoZSBi
dWZmZXJzIGFuZCBtaWdyYXRlIHRoZW0gdG8KdGhlIHBhcmVudCBpZiBhIGNncm91cCBpcyBjbG9z
ZWQuICBNeSBjb25jZXJuIGhlcmUgaXMgdGhlIHBlcmZvcm1hbmNlCm92ZXJoZWFkIG9uIHRyYWNr
aW5nIGFsbCB0aGUgYnVmZmVycy4KCj4gQW5kIGdvaW5nIGludG8gdGhlIHNhbWUgZGlyZWN0aW9u
IHdoZXJlIGlzIHRoZSBjb2RlIHRvIGhhbmRsZSBhbiBvcGVuCj4gZGV2aWNlIGZpbGUgZGVzY3Jp
cHRvciB3aGljaCBpcyBzZW5kIGZyb20gb25lIGNncm91cCB0byBhbm90aGVyPwpJIGxvb2tlZCBp
bnRvIHRoaXMgYmVmb3JlIGJ1dCBJIGZvcmdvdCB3aGF0IEkgZm91bmQuICBQZXJoYXBzIGZvbGtz
CmZhbWlsaWFyIHdpdGggZGV2aWNlIGNncm91cCBjYW4gY2hpbWUgaW4uCgpBY3R1YWxseSwganVz
dCBkaWQgYW5vdGhlciBxdWljayBzZWFyY2ggcmlnaHQgbm93LiAgTG9va3MgbGlrZSB0aGUKYWNj
ZXNzIGlzIGVuZm9yY2VkIGF0IHRoZSBpbm9kZSBsZXZlbCAoX19kZXZjZ3JvdXBfY2hlY2tfcGVy
bWlzc2lvbikKc28gdGhlIGZkIHNlbnQgdG8gYW5vdGhlciBjZ3JvdXAgdGhhdCBkb2VzIG5vdCBo
YXZlIGFjY2VzcyB0byB0aGUKZGV2aWNlIHNob3VsZCBzdGlsbCBub3QgaGF2ZSBhY2Nlc3MuCgpS
ZWdhcmRzLApLZW5ueQoKCj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KPiA+Cj4gPiBSZWdhcmRz
LAo+ID4gS2VubnkKPiA+Cj4gPj4+IE9uIHRoZSBvdGhlciBoYW5kLCBpZiB0aGVyZSBhcmUgZXhw
ZWN0YXRpb25zIGZvciByZXNvdXJjZSBtYW5hZ2VtZW50Cj4gPj4+IGJldHdlZW4gY29udGFpbmVy
cywgSSB3b3VsZCBsaWtlIHRvIGtub3cgd2hvIGlzIHRoZSBleHBlY3RlZCBtYW5hZ2VyCj4gPj4+
IGFuZCBob3cgZG9lcyBpdCBmaXQgaW50byB0aGUgY29uY2VwdCBvZiBjb250YWluZXIgKHdoaWNo
IGVuZm9yY2Ugc29tZQo+ID4+PiBsZXZlbCBvZiBpc29sYXRpb24uKSAgT25lIHBvc3NpYmxlIG1h
bmFnZXIgbWF5IGJlIHRoZSBkaXNwbGF5IHNlcnZlci4KPiA+Pj4gQnV0IGFzIGxvbmcgYXMgdGhl
IGRpc3BsYXkgc2VydmVyIGlzIGluIGEgcGFyZW50IGNncm91cCBvZiB0aGUgYXBwcycKPiA+Pj4g
Y2dyb3VwLCB0aGUgYXBwcyBjYW4gc3RpbGwgaW1wb3J0IGhhbmRsZXMgZnJvbSB0aGUgZGlzcGxh
eSBzZXJ2ZXIKPiA+Pj4gdW5kZXIgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24uICBNeSB1bmRl
cnN0YW5kaW5nIGlzIHRoYXQgdGhpcyBpcwo+ID4+PiBtb3N0IGxpa2VseSB0aGUgY2FzZSwgd2l0
aCB0aGUgZGlzcGxheSBzZXJ2ZXIgc2ltcGx5IHNpdHRpbmcgYXQgdGhlCj4gPj4+IGRlZmF1bHQv
cm9vdCBjZ3JvdXAuICBCdXQgSSBjZXJ0YWlubHkgd2FudCB0byBoZWFyIG1vcmUgYWJvdXQgb3Ro
ZXIKPiA+Pj4gdXNlIGNhc2VzIChmb3IgZXhhbXBsZSwgaXMgcnVubmluZyBtdWx0aXBsZSBkaXNw
bGF5IHNlcnZlcnMgb24gYQo+ID4+PiBzaW5nbGUgaG9zdCBhIHJlYWxpc3RpYyBwb3NzaWJpbGl0
eT8gIEFyZSB0aGVyZSBwZW9wbGUgcnVubmluZwo+ID4+PiBtdWx0aXBsZSBkaXNwbGF5IHNlcnZl
cnMgaW5zaWRlIHBlZXIgY29udGFpbmVycz8gIElmIHNvLCBob3cgZG8gdGhleQo+ID4+PiBjb29y
ZGluYXRlIHJlc291cmNlcz8pCj4gPj4gV2UgZGVmaW5pdGVseSBoYXZlIHNpdHVhdGlvbnMgd2l0
aCBtdWx0aXBsZSBkaXNwbGF5IHNlcnZlcnMgcnVubmluZwo+ID4+IChqdXN0IHRoaW5rIG9mIFZS
KS4KPiA+Pgo+ID4+IEkganVzdCBjYW4ndCBzYXkgaWYgdGhleSBjdXJyZW50bHkgdXNlIGNncm91
cHMgaW4gYW55IHdheS4KPiA+Pgo+ID4+IFRoYW5rcywKPiA+PiBDaHJpc3RpYW4uCj4gPj4KPiA+
Pj4gSSBzaG91bGQgcHJvYmFibHkgc3VtbWFyaXplIHNvbWUgb2YgdGhlc2UgaW50byB0aGUgY29t
bWl0IG1lc3NhZ2UuCj4gPj4+Cj4gPj4+IFJlZ2FyZHMsCj4gPj4+IEtlbm55Cj4gPj4+Cj4gPj4+
Cj4gPj4+Cj4gPj4+PiBDaHJpc3RpYW4uCj4gPj4+Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
