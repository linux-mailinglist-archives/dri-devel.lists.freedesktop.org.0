Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030D51D6D49
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 23:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15E16E03A;
	Sun, 17 May 2020 21:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC876E03A
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 21:02:09 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id z12so662609uap.6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 14:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yPSBAPpeLeIGmtNXSUpA1NEKiPjKNISM7fkWGp9Fn7A=;
 b=FMDlgSFS3jqpLsKMsNfMWU0w14EHVjkH1QPQxb/82GCrJ++zQ6VND2qErMU53hS/XA
 QaH6Pdc1kujl/YnV+MCEktVvtMUT+DaPKe9E9+J1/0Zmuub/3NaZT5d1aNiGAjJefXKc
 u0j+UeYLEdjIiwMLcbHyD4pjEe2HOy5qp5VlHgf7NvQ1lHJ+r3AOSliUZkY9t3WkrG2R
 tDFBQaeyKU+ICotlCxkus7NeVp3ZGbcQY2uunxhQgSQ/lMwfQ5+cjMv0bo96xu3XGeR6
 YWLKtP/6UN200ZUY2n+spjzVPLmSncBWdVMkKtAN27x2Z7JYd1dsHy0vFAZbDQkIFJrI
 c7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yPSBAPpeLeIGmtNXSUpA1NEKiPjKNISM7fkWGp9Fn7A=;
 b=lKHv3V0/S3Xicf4irYTn8S8gINwX4OpqOUPvnRkv+nDzoGEdevSOIs24XjWJwNBy0z
 vqpw9UXOA934qf/AvJCV6WMe1oHm1RCPn+1TtE47e9q0Q3kHqtdp+LSeD2PsF3bmQDMg
 WhXpWJYOSgmkS3wCsPUEO03yPDEQQX3aAEwRpVJNM49pEtiayG2JXuEMpL4u5H+PmqXp
 4VIbJbGui48IjFh24CecEh1BaruDNLMfnES5SQOfDv6Cdt5n/OdAizScVkePXzV6TZPB
 n6EH4Vl69AbiojGgw6zOuJtpGwhsZl5YiT1PEzqCdVM5KGnoIRnfZgvXg1cF97xSGIG/
 AxIA==
X-Gm-Message-State: AOAM532Z/UDdxGBubstALfnKDSpy0yFqy7bqfYUr6RVAWPv/BszM/l+8
 SjBM/tV3+PUeD+FHJJ2+vhHiFXubhmkoG+0DjGk=
X-Google-Smtp-Source: ABdhPJz9O5eViAWyo9bXTrOydMcV99wZMRPir+WQmO9zW/MydwB1SOr4TnLGwUt64YD+fk/L9WZUlhW58c4w5hCvNDM=
X-Received: by 2002:ab0:4e0d:: with SMTP id g13mr1595057uah.64.1589749328921; 
 Sun, 17 May 2020 14:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200221173313.510235-1-hdegoede@redhat.com>
 <20200221173313.510235-2-hdegoede@redhat.com>
 <CACvgo51i8_Xyp4=RVfcft9FsasMh4G9ze1jrc0Mg8ObOZCHn5g@mail.gmail.com>
 <20200430145250.GX6112@intel.com>
 <a596b05a-a434-56c7-b3c6-ab070df2f00f@redhat.com>
 <CACvgo504dhBMO4fq9MEO8Et5AH0-+Hj00t92mjPEex6o8WRuwg@mail.gmail.com>
 <951ca845-8f0c-41f4-b5f0-afca40123940@redhat.com>
In-Reply-To: <951ca845-8f0c-41f4-b5f0-afca40123940@redhat.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 17 May 2020 21:59:19 +0100
Message-ID: <CACvgo51kY5TsoK_1szXg72wwgEoDRerpL+4vun1H=bN6Whx=SA@mail.gmail.com>
Subject: Re: [PATCH resend] drm: Add DRM_MODE_TYPE_USERDEF flag to probed
 modes matching a video= argument
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNCBNYXkgMjAyMCBhdCAxNTozNSwgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDUvMTQvMjAgMTE6NTMgQU0sIEVtaWwgVmVs
aWtvdiB3cm90ZToKPiA+IEhpIEhhbnMsCj4gPgo+ID4gT24gVGh1LCAzMCBBcHIgMjAyMCBhdCAx
NTo1NSwgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPj4KPiA+
PiBIaSwKPiA+Pgo+ID4+IE9uIDQvMzAvMjAgNDo1MiBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3Rl
Ogo+ID4+PiBPbiBUaHUsIEFwciAzMCwgMjAyMCBhdCAwMjo0NzowMFBNICswMTAwLCBFbWlsIFZl
bGlrb3Ygd3JvdGU6Cj4gPj4+PiBIaSBIYW5zLAo+ID4+Pj4KPiA+Pj4+IE9uIEZyaSwgMjEgRmVi
IDIwMjAgYXQgMTc6MzMsIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+IHdyb3Rl
Ogo+ID4+Pj4+Cj4gPj4+Pj4gZHJtX2hlbHBlcl9wcm9iZV9hZGRfY21kbGluZV9tb2RlKCkgcHJl
ZmVycyB1c2luZyBhIHByb2JlZCBtb2RlIG1hdGNoaW5nCj4gPj4+Pj4gYSB2aWRlbz0gYXJndW1l
bnQgb3ZlciBjYWxjdWxhdGluZyBvdXIgb3duIHRpbWluZ3MgZm9yIHRoZSB1c2VyIHNwZWNpZmll
ZAo+ID4+Pj4+IG1vZGUgdXNpbmcgQ1ZUIG9yIEdURi4KPiA+Pj4+Pgo+ID4+Pj4+IEJ1dCB1c2Vy
c3BhY2UgY29kZSB3aGljaCBpcyBhdXRvLWNvbmZpZ3VyaW5nIHRoZSBtb2RlIG1heSB3YW50IHRv
IGtub3cgdGhhdAo+ID4+Pj4+IHRoZSB1c2VyIGhhcyBzcGVjaWZpZWQgdGhhdCBtb2RlIG9uIHRo
ZSBrZXJuZWwgY29tbWFuZGxpbmUgc28gdGhhdCBpdCBjYW4KPiA+Pj4+PiBwaWNrIHRoYXQgbW9k
ZSBvdmVyIHRoZSBtb2RlIHdoaWNoIGlzIG1hcmtlZCBhcyBEUk1fTU9ERV9UWVBFX1BSRUZFUlJF
RC4KPiA+Pj4+Pgo+ID4+Pj4+IFRoaXMgY29tbWl0IHNldHMgdGhlIERSTV9NT0RFX1RZUEVfVVNF
UkRFRiBmbGFnIG9uIHRoZSBtYXRjaGluZyBtb2RlLCBqdXN0Cj4gPj4+Pj4gYXMgd2Ugd291bGQg
ZG8gb24gdGhlIHVzZXItc3BlY2lmaWVkIG1vZGUgd2hlbiBubyBtYXRjaGluZyBwcm9iZWQgbW9k
ZSBpcwo+ID4+Pj4+IGZvdW5kLgo+ID4+Pj4+Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogSGFucyBk
ZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPiA+Pj4+Cj4gPj4+PiBJIHdhcyBza2ltbWlu
ZyBhcm91bmQgd3J0IFZpbGxlJ3MgY29tcGFjdCBkcm1fZGlzcGxheV9tb2RlIHNlcmllcyBhbmQK
PiA+Pj4+IG5vdGljZWQgdGhhdCB0aGlzIG5ldmVyIGxhbmRlZC4KPiA+Pj4+Cj4gPj4+PiBUaGUg
Y29tbWl0IGJyaW5ncyBleHRyYSBjb25zaXN0ZW5jeSB3aGVuIGRlYWxpbmcgd2l0aCB1c2VyIGRl
ZmluZWQKPiA+Pj4+IG1vZGVzLCBhbmQgaXM6Cj4gPj4+PiBSZXZpZXdlZC1ieTogRW1pbCBWZWxp
a292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+Pj4+Cj4gPj4+PiBWaWxsZSB0aGlz
IG1heSB0cml2aWFsbHkgY29uZmxpY3Qgd2l0aCB5b3VyIHdvcmsuIEkgc3VzcGVjdCB5b3UgY2Fu
IGRvCj4gPj4+PiB0aGUgaG9ub3VycywgYW5kIGFwcGx5IG9uIHRvcCBvZiB5b3VyIHNlcmllcz8K
PiA+Pj4+IFRoYXQgaXMgaWYgeW91IGFncmVlIHdpdGggdGhlIHBhdGNoLgo+ID4+Pgo+ID4+PiBR
dWljayBnbGFuY2UgYXQgdGhlIG9yaWdpbmFsIHRocmVhZCBzYXlzIG1heWJlIHRoZXJlIHdlcmUg
c3RpbGwgc29tZQo+ID4+PiB1c2Vyc3BhY2UgaXNzdWVzIHVucmVzb2x2ZWQ/IE5vdCBzdXJlLgo+
ID4+Cj4gPj4gSUlSQyB0aGUgdGhyZWFkIGVuZGVkIHdpdGggRGFuaWVsIGFncmVlaW5nIG9uIHRo
ZSB1c2Vyc3BhY2UgaW50ZXJmYWNlLAo+ID4+IGJ1dCBhc2tpbmcgZm9yIHNvbWUgZG9jcyBhbmQg
bWUgcG9pbnRpbmcgb3V0IHRoYXQgdGhlIHBhdGNoIGFscmVhZHkKPiA+PiB1cGRhdGVkL2NsYXJp
ZmllZCB0aGUgZXhpc3RpbmcgZG9jcy4gQWZ0ZXIgdGhhdCB0aGluZ3MgZ290IHF1aWV0Lgo+ID4+
Cj4gPj4gU28gSSBiZWxpZXZlIHRoYXQgdGhpcyBpcyAoc3RpbGwpIHJlYWR5IHRvIGdvIHVwc3Ry
ZWFtLgo+ID4+Cj4gPiBIYXZpbmcgcmVhZCB0aHJvdWdoIHRoZSBmdWxsIGRpc2N1c3Npb24sIGNv
dXBsZSBvZiB0aW1lcywgSSBiZWxpZXZlCj4gPiB5b3UncmUgc3BvdCBvbi4KPiA+Cj4gPiBEYW5p
ZWwgcmVxdWVzdGVkIGRvY3VtZW50YXRpb24sIHdoaWNoIHRoZSBwYXRjaCBwcm92aWRlcy4gSSdk
IHNheQo+ID4gbGV0J3MgcG9rZSBoaW0gb24gSVJDIGEgZmV3IHRpbWVzLCBpZiBoZSBkb2Vzbid0
IG9iamVjdCBsZXQncyBwdXNoIGl0Pwo+Cj4gU291bmRzIGdvb2QgdG8gbWUsIEknbSB1c3VhbGx5
IG5vdCBvbiBJUkMgKHRvbyBkaXN0cmFjdGluZyBmb3IgbWUpLCBjYW55b3UKPiBwaW5nIERhbmll
bCBhYm91dCB0aGlzIG9uIElSQz8KPgpJIGRpZCBhIGZldyBtaW51dGVzIGFmdGVyIHBvc3Rpbmcg
bXkgcmVwbHkgLSAxMTo0NS4gRmV3IG1pbnV0ZXMgbGF0ZXIKKDEyOjA5KSBoZSBzZWVtZWQgT0sg
d2l0aCBpdCBbMV0uCk1lcmdlZCB0byBkcm0tbWlzYy1uZXh0LgoKVGhhbmtzCkVtaWwKWzFdIGh0
dHBzOi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+Y2JyaWxsL2RyaS1sb2cvP2NoYW5uZWw9ZHJp
LWRldmVsJmRhdGU9MjAyMC0wNS0xNApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
