Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA53F615B8
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 19:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E9B8997E;
	Sun,  7 Jul 2019 17:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BB08997E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 17:42:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so5436185wrr.4
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jul 2019 10:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1cd14pJ9WX7TppKl4+INuA7iMlMPB+cKXvK/QGRdcWY=;
 b=UV0Pt2C9uB0IaEE2O4k+UqCPS0OuWfLfAWolT03oxSD2SJMjhqxdiGJuiP4ESDJu9c
 I0U0jdAM/DPSTqOODWmRWCY+rr6QMLqb2j1/N640MzgVuR8ximKU8ROBOYrG2dVDBf5t
 IfuOXIHr2UgFt4PNmqQZ8goJdzpcGPYumVQLndiZtJ/EZo2VQWBynT9/5x9i6XSjMQS3
 Da0I4SEVcXwSQGcSVv41zeJxFLoprV+RWsOBbfO+UKJwBYf+1lqxZkCf3mYNmtolXHjv
 N4VWQznxG+wHzZtaflM3CgtYqOlijfIEWRYdGWU9uLpAkWu/zHgfXLxUpA0KztFlJmmu
 v4PA==
X-Gm-Message-State: APjAAAVbAvO6gVR5o9Bwa8ZxIAz56kEN8xEuxpYVxpmmL8GdmSKnkeaB
 6dVjkCTBTfPP262db51Khs2paZQlRnA=
X-Google-Smtp-Source: APXvYqwFtRc+G8l/iHCFxkWPnQQZPZ+pGAkY0MI7ypX28dCnxaxsC56gO7dGgBzhlJitd76eGJ4ZwQ==
X-Received: by 2002:adf:e2c6:: with SMTP id d6mr5000943wrj.326.1562521331399; 
 Sun, 07 Jul 2019 10:42:11 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id x16sm12695958wmj.4.2019.07.07.10.42.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 10:42:10 -0700 (PDT)
Date: Sun, 7 Jul 2019 17:41:26 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Message-ID: <20190707174126.GA1262@freedom>
References: <bug-109955-502@http.bugs.freedesktop.org/>
 <bug-109955-502-l5hhO8mdfb@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-109955-502-l5hhO8mdfb@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1cd14pJ9WX7TppKl4+INuA7iMlMPB+cKXvK/QGRdcWY=;
 b=CmCdD8MYqTBdnToGK0wOGDwpL3Sx5vvFSS+6/LT/bj4/OjcerMqSVhNBp2l/Yx85N2
 YjLCtgzSTTJW1jJX8VOkgXFZglM0Ngz59np78ANxSx09uURhmbYZ88nBYqriPb4+CoGs
 gWIynAI8Ym5liIkh4Bcgbl0mEvOk7Zp5RfiPb0j+AfxYNpzTD5mkiIncNO2KGtM0drQf
 b9HLN6GPUW9NeHad9BiRW40X1YmHkIKgfgTb2mE5GK+ZKGYa8Hr/ac8Ax9KmMVAJ8lTB
 2mE00DTcfxanXveQU6fcSO3L3ozIdxZa5jup21VL8UhY3IAurtT/vGJ8g4K+hTaNb565
 Ve/Q==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgMDcsIDIwMTkgYXQgMDU6MzE6MzRBTSArMDAwMCwgYnVnemlsbGEtZGFlbW9u
QGZyZWVkZXNrdG9wLm9yZyB3cm90ZToKPiAyLiBWYWx2ZSBzcG9uc29yZWQgYW4gaW50ZXJlc3Rp
bmcgcHJvamVjdCB0aGF0IHJlbW92ZXMgZGVwZW5kZW5jeSBvZiBBTUQgTWVzYQo+IGZyb20gTExW
TS4gQW5kIGluc3RlYWQgdXNlcyBBQ08uIFZhbHZlIG1hZGUgdGhpcyBhdmFpbGFibGUgZm9yIEFy
Y2ggYmFzZWQKPiBzeXN0ZW1zIHZpYSBBVVIsIGFuZCBVYnVudHUgYmFzZWQgc3lzdGVtIHZpYSBQ
UEEuIElmIHlvdSB3YW50IHRvIHRlc3QgaXQsIHlvdQo+IGNhbiBjaGVjayB0aGUgcG9zdHMgYmVs
b3cuIEkgYW0gZ29pbmcgdG8gdGVzdCB0aGlzIG15c2VsZiBvbiBib3RoIEFyY2ggYW5kCj4gVWJ1
bnR1LiAKPiBodHRwczovL3N0ZWFtY29tbXVuaXR5LmNvbS9nYW1lcy8yMjE0MTAvYW5ub3VuY2Vt
ZW50cy9kZXRhaWwvMTYwMjYzNDYwOTYzNjg5NDIwMAo+IGh0dHBzOi8vc3RlYW1jb21tdW5pdHku
Y29tL2FwcC8yMjE0MTAvZGlzY3Vzc2lvbnMvMC8xNjQwOTE1MjA2NDc0MDcwNjY5LwoKSHVobyEK
CkNvbnM6CiAgICAtIGl0J3MgYysrCiAgICAtIG9ubHkgR0ZYOCBhbmQgR0ZYOSAoSSBoYXZlIEdG
WDYgOiggKQogICAgLSBzb21lIG5hc3R5IHB5dGhvbiBzY3JpcHRzICh0aGVyZSBhcmUgdG9ucyBp
biBtZXNhKQoKUHJvczoKICAgIC0gaXQncyBzZXZlcmFsIG9yZGVycyBvZiBtYWduaXR1ZGUgbGVz
cyBicmFpbiBmKmNrZWQgdGhhbiBsbHZtLgogICAgLSBpdCBpcyBhY3R1YWwgd29ya2luZyBjb2Rl
IHdoaWNoIGRvZXMgZGlzam9pbnQgbWVzYSBmcm9tIGxsdm0uCgpjb25jbHVzaW9uOgogICAgLSBm
b3IgR0ZYOCBhbmQgR0ZYOSwgaXQncyBsZXNzIHdvcnNlIHRoYW4gbGx2bS4KICAgIC0gSSB3YXMg
YXNraW5nIGZvciBhIGNsZWFuIEdDTiBBQkkgZGVmaW5pdGlvbiBkb2N1bWVudCBmcm9tIHNoYWRl
cnMKICAgICAgcGVyc3BlY3RpdmUsIG1heWJlIHRoaXMgY29kZSB3aWxsIGhlbHAgdG8gd3JpdGUg
b25lIChvciBpdCBpcyBhbiBBTUQKICAgICAgY29uZmlkZW50aWFsIGRvY3VtZW50Pz8pLgoKLS0g
ClN5bHZhaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
