Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5B59D702
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 21:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12656E2EA;
	Mon, 26 Aug 2019 19:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC8A6E2EA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 19:51:07 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m24so16206026ljg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 12:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ixHd7SLnV7nKoHhpSh/7rpFZlsIyh84NJ1ZYjI0pwLQ=;
 b=CLGajUc/UosJXHIJ1dPfmSKqtw1Z8J4uQ6grwkChrz/ydQdvvsJDhVpWG48n3NcC2i
 trL0kbQfcVnTORZ+zBABAzup4AC0HP9n3m5WV1f3KtNJn+x8040hG78MbaHAvmF9joJ2
 XVCWqDn36O/Z3kvmD2sllvdOFR3cfzqZzusRiySjI3/F08tTKwnzN5oadhvEQ/7EveC7
 DaRILCWEqaV2YwEl+lW4mYcMXQ0DP2Mv3kTaQ3H9CC40uNO8PeiA2NEOOy3UNPZRN0r1
 Uqa2qSLF+sraHRd2sS1opHyPn/cH9VXE4tFHO9oD8pbDkWvMHMyEuGt5GRTalUE0w914
 m+VA==
X-Gm-Message-State: APjAAAUR2ahZPOUw7RmSzYo5emTBkXkb5J+v9UNcjwKjwroAZX9FptVa
 JRQS7ZnAWL/FWwDFT1JI5vS3fy69CEjWsmTmDmg=
X-Google-Smtp-Source: APXvYqzjkBOadActQUdZ679IDtMCwl9DhrwOSQgFV/JAKzYLAu6xVf9+JwVHgjIZkgnrDJ6y/ebRw1bfTzXBA86Pgno=
X-Received: by 2002:a2e:8658:: with SMTP id i24mr11455652ljj.188.1566849065810; 
 Mon, 26 Aug 2019 12:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190822135741.12923-1-David.Francis@amd.com>
 <f9d4069b4ff7818db49177527820ebcb5e8b8dc1.camel@redhat.com>
 <BN8PR12MB3217665BEE3614FD2396520BEFA40@BN8PR12MB3217.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3217665BEE3614FD2396520BEFA40@BN8PR12MB3217.namprd12.prod.outlook.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 27 Aug 2019 05:50:54 +1000
Message-ID: <CAPM=9tw8501utfWGV6m+kFGTuO4AsKmxZ5bfHi9A_vXmf9_ogg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] MST DSC support in drm-mst
To: "Francis, David" <David.Francis@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ixHd7SLnV7nKoHhpSh/7rpFZlsIyh84NJ1ZYjI0pwLQ=;
 b=LBEvsReFj/VU53VM4TKtvXT5tWXdL/sNVBjBWZ3MgpL+cW3/YEgNexXzUT5rb/AdV4
 cL3x/2KwQwEpfX5nOHpduoTNQpyoHQuffAdotQ2Adm9ZOOEwuZ/C7XVUEHDoGbKY1x7N
 HEZ7iZzzerQSSU091nLclHDTOfJOa9lyw6t4MtE0v5QQSYUsasUKGk7aAzCs8QQ9AMD5
 h/0PEbX55B9kidCPwO/TWWO18emP64mgfYVnKU7yXXRa0u3+DwI6n+phKD+mAMoCvuAn
 D0lOGpkiwvMmeoYYj/DP6ZCCwXq9L5aHrUyldlrWyEzeRUJ3q9W1EsHpSqOBCRxL30vd
 xF9Q==
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyNCBBdWcgMjAxOSBhdCAwNjoyNCwgRnJhbmNpcywgRGF2aWQgPERhdmlkLkZyYW5j
aXNAYW1kLmNvbT4gd3JvdGU6Cj4KPiBBZGRpbmcgRFNDIGZ1bmN0aW9uYWxpdHkgdG8gZHJtX2Rw
X21zdF9hdG9taWNfY2hlY2soKSBpcyBhIGdvb2QgaWRlYS4KPiBIb3dldmVyLCB1bnRpbCBhbWRn
cHUgc3dpdGNoZXMgb3ZlciB0byB0aGF0IHN5c3RlbSwgSSB3b3VsZG4ndCBiZSBhYmxlCj4gdG8g
dGVzdCB0aG9zZSBjaGFuZ2VzLiBNYWtpbmcgdGhhdCBzd2l0Y2ggaXMgb24gb3VyIFRPRE8gbGlz
dCwgYW5kIGl0IHdvdWxkCj4gZml4IGEgbnVtYmVyIG9mIHByb2JsZW1zIHdpdGggb3VyIGN1cnJl
bnQgTVNUIGltcGxlbWVudGF0aW9uLCBidXQKPiBpdCdzIGdvaW5nIHRvIGJlIGEgbWFqb3IgcmV3
cml0ZS4KPgo+IE1TVCBEU0MgaGFyZHdhcmUgaXMgYWxyZWFkeSBvbiB0aGUgbWFya2V0LiBJdCB3
b3VsZCBiZSBleHBlZGllbnQgdG8KPiBtZXJnZSB0aGUgcGF0Y2hlcyB3ZSBuZWVkIGZvciBOYXZp
IHN1cHBvcnQgc29vbmVyIGFuZCB1cGRhdGUKPiBkcm1fZHBfbXN0X2F0b21pY19jaGVjayB3aGVu
IHdlJ3JlIGFibGUgdG8gdGVzdCBpdC4KCklzIHRoZXJlIGFueSBjb21taXRtZW50IHRvIHJld3Jp
dGluZyBpdCwgYSB0aW1lbGluZSBvciBhbnl0aGluZz8KClRoZSBwcm9ibGVtIHdpdGggdGhpcyBz
aXR1YXRpb24gaXMgdGhlcmUgaXMgYWx3YXlzIG5ldyBoYXJkd2FyZSBjb21pbmcKb250byB0aGUg
bWFya2V0LCBhbmQgdGhlcmUgaXMgYWx3YXlzIHByZXNzdXJlIHRvIHN1cHBvcnQgYWxsIHRoZQpm
ZWF0dXJlcyBvZiB0aGF0IG5ldyBoYXJkd2FyZSwgYW5kIHRoZSBwcmVzc3VyZSBhbHdheXMgY29t
ZXMgbGlrZSB0aGlzCmFuZCBiZWluZyBleHBlZGllbnQuIEhvd2V2ZXIgSSd2ZSBmb3VuZCB0aGF0
IGEgbG90IG9mIHRoZSB0aW1lIHRoZQpyZXF1aXJlZCByZWZhY3RvciBvciB3b3JrIGlzIG5ldmVy
IGRvbmUsIGJlY2F1c2UgdGhlIHRpbWUgaXMgYmVpbmcKYWxsb2NhdGVkIG5vdyB0byB0aGUgbmV4
dCBHUFUgdGhhdCBpcyBjb21pbmcgb24gdGhlIG1hcmtldCwgYW5kIG5vYm9keQpldmVyIGNhcmVz
IGVub3VnaCB0byBjbGVhbiB1cCB0aGVpciB0ZWNobmljYWwgZGVidC4KCkhvdyBjb21lIHRoZSBu
ZWVkcyBmb3IgTVNUIERTQyBzdXBwb3J0IHdhc24ndCBpZGVudGlmaWVkIGVhcmxpZXIsCmJsb2Nr
ZWQgb24gcmVmYWN0b3Jpbmcgb2YgdGhlIGNvZGUgdG8gdXNlIGNvbW1vbiBjb2RlLCBhbmQgdGhl
biB0aGF0CnRhc2sgbWFkZSBhIGhpZ2hlciBwcmlvcml0eT8KCkknbSBzb3J0YSBpbmNsaW5lZCB0
byBzYXkgbm8gd2Ugc2hvdWxkbid0IGJlIG1lcmdpbmcgYW55IGRyaXZlcgpzcGVjaWZpYyBjb2Rl
IGhlcmUsIGJlY2F1c2UgdGhpcyBpcyB0aGUgb25seSBwb2ludCB3ZSBjYW4gcHVzaApwcmVzc3Vy
ZSBvbiB0byByZWZhY3RvciB0aGUgTVNUIGltcGxlbWVudGF0aW9uLCB3aGljaCBJIGd1ZXNzCm90
aGVyd2lzZSB3ZSdsbCBqdXN0IGtlZXAgYXZvaWRpbmcgdW50aWwgTHl1ZGUgZW5kcyB1cCBkb2lu
ZyBpdCBmb3IKeW91LgoKRGF2ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
