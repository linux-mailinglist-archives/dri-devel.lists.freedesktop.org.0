Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917B0295262
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 20:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44346E07F;
	Wed, 21 Oct 2020 18:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B814883A9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 18:44:29 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id c3so2665691ybl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FbkOR2hlaC8m5125LamdcgUCS3n/WytxNcl+E9+Q8gs=;
 b=GDmJf/EcaKtR4O0m2ukBBdj2gfBLLG7aO2NXYw0H0/na94AkM1HmEr/TuVUDjXLOjR
 Z0kJAdrMUF70ukRLPIUi1RBwtEocmf/SG/1up1xVvpth3NYGojyGYi4DWDv8cH2iVGz5
 sOIFbDn8xW1813VdtBAXCRJi+lKgd5ZJjA3iutFb29csnDYu3TFsVMIjZaCn3nQ+Kh7G
 bnDcOmq03XgfCQfrP3CbfTWk/7IW2PCBD1o43MaXW3eKLOOprPeuLIMCq+tf2UPVzA1D
 pdYLAzEeBmDKot2dXYvCUe/urct5xOAjGBsTcHKcdRg/j5p002LJe5t0pScv4zUvRFeq
 mlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FbkOR2hlaC8m5125LamdcgUCS3n/WytxNcl+E9+Q8gs=;
 b=tVMfx5i3ubRWF7YwtuG1Trh8KLX2geVviGaDwinSGHqC/epnpxB8vV65AJWI8+hN+l
 8ghJqfFy5PmGyMhc/48zaC0rHG/1RKo7YcaSvecNgCJR/D9JUW7T5Lvgr2G7eTd9+fzM
 8Zm3vzkROIKKrotZ85vgpRtpS0qRdMOiLMp2mTOYgZ2Y/WHqqhd/K29v17RO+ioVk4mG
 N7yHSHsdHy/yiBPPuEuZ3l88s0XcSN2pwjIyzEwCg4JYrx4wPUbDY5suroPn3P0boPar
 TDhlXqej+JK23oOb0wOAJ3abJpr/J54XTx0Jzh89chGsr+JZaE2RET/XpBT+2QpeDIFi
 YJjg==
X-Gm-Message-State: AOAM531NtA5587kNLtcd/+4Sl3GMLGBGWoGKMIaeUqm8o8n1eUQ7NUUA
 pITle9dJZPnp6E2bLDh+C67mkqSa3yXskupEu94FuD+j
X-Google-Smtp-Source: ABdhPJz7uR6YvUjwzKvOKWf71DPh78opjNAKkEt3+Di28no71b0L5nzdxfFlsmghjQX1Zl7nnt1MakNSUkql49cVbMA=
X-Received: by 2002:a05:6902:4ed:: with SMTP id
 w13mr6957954ybs.157.1603305868169; 
 Wed, 21 Oct 2020 11:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <-II5uGU2OLUvxeRHxuPIMmnyrFPVyg6pkc2UM16KaQ5f6_kbDJN0se2tfgIf15RJLLKrWZg0niAIgXxr-0V7qBQGR9mPq306qamxuQq9q7M=@pm.me>
 <CADnq5_M+qgk7p92daoUMNN-OaoXKeTWULUQiivGe=V_J4e1oqA@mail.gmail.com>
 <rfi6blr6iZOO9U7GHVXPZVcbAxN21dh52TEK19odIK5sxSI3JiOSKEowBQqN97pJcTkgV8nFzG_d70g9-x1swBX-7kQ-ZqTme73yCbXgIm4=@pm.me>
In-Reply-To: <rfi6blr6iZOO9U7GHVXPZVcbAxN21dh52TEK19odIK5sxSI3JiOSKEowBQqN97pJcTkgV8nFzG_d70g9-x1swBX-7kQ-ZqTme73yCbXgIm4=@pm.me>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Oct 2020 14:44:15 -0400
Message-ID: <CADnq5_PZXmSVardcOL8=-CTeSkT3+eTrKXSHNLWbWzz0q7i0yQ@mail.gmail.com>
Subject: Re: amdgpu: Manual Card Configuration Change
To: Josh Fuhs <Joshua.Fuhs@pm.me>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTksIDIwMjAgYXQgODo1MyBQTSBKb3NoIEZ1aHMgPEpvc2h1YS5GdWhzQHBt
Lm1lPiB3cm90ZToKPgo+IFRoYW5rcy4gSSB0cmllZCA1LjkuMSBhbmQgSSB0aGluayB0aGVyZSdz
IHN0aWxsIGEgcHJvYmxlbSwgb3IgYXQgbGVhc3Qgc29tZXRoaW5nIGRpZmZlcmVudC4KPgo+IFVz
aW5nIHRoZSBzYW1lIGNvbmZpZ3VyYXRpb24gc2NyaXB0LCBJIG5vdGljZWQgdGhhdCBteSBjYXJk
cyBhcmUgcnVubmluZyBhIGxvdCBob3R0ZXIuIEZvciBleGFtcGxlLCBoZXJlJ3MgdG90YWwgcG93
ZXIgY29uc3VtcHRpb24gb2YgYSB0d28tY2FyZCBzeXN0ZW0gd2l0aCB0d28gZGlmZmVyZW50IGtl
cm5lbHM6Cj4KPiAgICAgNS44LjE0OiA0NjBXCj4gICAgIDUuOS4xOiAgNTYwK1cKPgo+IE1lbW9y
eSBhbmQgc3lzdGVtIGNsb2NrcyBhcmUgaW5pdGlhbGx5IHNldCB0aGUgc2FtZSBvbiBhbGwgY2Fy
ZHMgaW4gYWxsIGNhc2VzLgoKQ2FuIHlvdSBiaXNlY3Q/CgpBbGV4CgoKPgo+IEpvc2gKPgo+Cj4g
4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQIE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ
4oCQCj4gT24gTW9uZGF5LCBPY3RvYmVyIDE5LCAyMDIwIDI6MjIgUE0sIEFsZXggRGV1Y2hlciA8
YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gT24gU3VuLCBPY3QgMTgsIDIwMjAg
YXQgNDozMiBQTSBKb3NoIEZ1aHMgSm9zaHVhLkZ1aHNAcG0ubWUgd3JvdGU6Cj4gPgo+ID4gPiBI
ZWxsbyBhbGwsCj4gPiA+IFJlZ2FyZGluZyBhbWRncHUsIEkndmUgYmVlbiB1c2luZyBzb21lIFJh
ZGVvbiA1NzAwWFRzIGZvciBjb21wdXRlIHdvcmsgd2l0aCBrZXJuZWxzIHRocm91Z2ggNS44LjE0
LiBJIHJlY2VudGx5IHRyaWVkIGtlcm5lbCA1LjkuMCwgYW5kIGZvdW5kIHRoYXQgdGhlIGZvbGxv
d2luZyBpcyBubyBsb25nZXIgYWxsb3dlZDoKPiA+ID4gZWNobyAibSAxIDIwMCIgfCBzdWRvIHRl
ZSAvc3lzL2NsYXNzL2RybS9jYXJkMC9kZXZpY2UvcHBfb2RfY2xrX3ZvbHRhZ2UKPiA+ID4gSXMg
dGhpcyBhbiBleHBlY3RlZCBjaGFuZ2U/IElmIHNvLCB3aGVyZSBzaG91bGQgSSBsb29rIGZvciBk
b2N1bWVudGF0aW9uIHJlZ2FyZGluZyBob3cgdG8gbWFudWFsbHkgY29uZmlndXJlIHRoZXNlIGNh
cmRzIHdpdGggdGhpcyBrZXJuZWwuIE5vdGUsIEkndmUgaGFkIHRoaXMgd29ya2luZyB3aXRoIDUu
OCBrZXJuZWxzIGZvciBtb250aHMuCj4gPgo+ID4gSXQgd2FzIGEgYnVnLiBGaXhlZCBpbiA1Ljku
MS4KPiA+Cj4gPiBBbGV4Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
