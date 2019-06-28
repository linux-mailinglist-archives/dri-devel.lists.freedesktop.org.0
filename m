Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBB45A55F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 21:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5EC6E8C1;
	Fri, 28 Jun 2019 19:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB5F6E8B8;
 Fri, 28 Jun 2019 19:49:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h19so10026443wme.0;
 Fri, 28 Jun 2019 12:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FrbVagGlg8oUssb+kQNdeSDxFyuguP7EOINDPPuAb+I=;
 b=gUNkdoIINAutry7vJExUj4/Dp7C45Fkq9cn0XnFqdmshN+b98So1iCdj7QWk7k8UqB
 QYNE14DQE7NIBU/Dqbpf7IhEyV578zhREmjDbyCRVG4PGL+hHeg0DN80Fz2SC7TDNBn0
 e4QNFqkdAgGFHUcyzsOvw+0B8QwbDL17Nxki38RKiZ/p+57fmkhrJSwQ0wyiYywYZTjk
 iAU0u8gpN6EjVrahnTz3q+TLyAwV699MdNouRR/mhI2F0djZmalC9DugXDIYqHX55cRK
 GIbKos9qy7gXS3OP8U4zUHa/itnCEQA3uMdEZCKbIaBJQ/ZeLJTP01oOBbN/a0cGzaSd
 rC7w==
X-Gm-Message-State: APjAAAWz57UuX3oYh15nJBMYY3eApXWwuSB4jlhvFJZ0ene8Rti4LaOY
 8xjz5igDL1QVi3Mq8rtaDcD4q+GXAPex+JKQoy8=
X-Google-Smtp-Source: APXvYqyxRzzo6sBqiICI5blkxMaQl1iJgTMzM9bp7mrstrzmBN1suLiqih3vEqThbjkRkcsLx6n+38EOPWbwUG0wqyU=
X-Received: by 2002:a1c:9c8a:: with SMTP id f132mr8222737wme.29.1561751379642; 
 Fri, 28 Jun 2019 12:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-10-Kenny.Ho@amd.com>
 <20190626162554.GU12905@phenom.ffwll.local>
 <CAOWid-dO5QH4wLyN_ztMaoZtLM9yzw-FEMgk3ufbh1ahHJ2vVg@mail.gmail.com>
 <20190627061153.GD12905@phenom.ffwll.local>
In-Reply-To: <20190627061153.GD12905@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Fri, 28 Jun 2019 15:49:28 -0400
Message-ID: <CAOWid-dCkevUiN27pkwfPketdqS8O+ZGYu8vRMPY2GhXGaVARA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 09/11] drm,
 cgroup: Add per cgroup bw measure and control
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FrbVagGlg8oUssb+kQNdeSDxFyuguP7EOINDPPuAb+I=;
 b=sI2Qes/i2KTyBMY6GWvETa2Q/O4iYBd8jNgfNuZGEhkFzJRKnLSBQ4KGMvmHIqyAre
 MvY0ArWhc9cjWps6hougPyE+3rrT57O+QIRUX1mMPWUEot3dWE2SJc6U2UuwwbtGqQSE
 6VVBrIa64vbAtHS2nATlj5WCESfcHbhbmw2mTzvTcCz6kTVwSV2j/l43PpgmDvtCIcGQ
 HtuFrRo7kgNfb9cjY8jeT3cVRkqVyEWh2yhahD8j2TBjXKb/f7/EYKjflO/QEs0LBt/o
 U88Yhz90hGx+wpWdKHD5+l/mOtk9KnQfDrfv1Fd/d04TW0Q7xVfiLuNS9FsW2UDTpw1w
 Vbtw==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, joseph.greathouse@amd.com,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMjoxMSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+IEkgZmVlbCBsaWtlIGEgYmV0dGVyIGFwcHJvYWNoIHdvdWxkIGJ5IHRv
IGFkZCBhIGNncm91cCBmb3IgdGhlIHZhcmlvdXMKPiBlbmdpbmVzIG9uIHRoZSBncHUsIGFuZCB0
aGVuIGFsc28gYWNjb3VudCBhbGwgdGhlIHNkbWEgKG9yIHdoYXRldmVyIHRoZQo+IG5hbWUgb2Yg
dGhlIGFtZCBjb3B5IGVuZ2luZXMgaXMgYWdhaW4pIHVzYWdlIGJ5IHR0bV9ibyBtb3ZlcyB0byB0
aGUgcmlnaHQKPiBjZ3JvdXAuICBJIHRoaW5rIHRoYXQncyBhIG1vcmUgbWVhbmluZ2Z1bCBsaW1p
dGF0aW9uLiBGb3IgZGlyZWN0IHRocmFzaGluZwo+IGNvbnRyb2wgSSB0aGluayB0aGVyZSdzIGJv
dGggbm90IGVub3VnaCBpbmZvcm1hdGlvbiBhdmFpbGFibGUgaW4gdGhlCj4ga2VybmVsICh5b3Un
ZCBuZWVkIHNvbWUgcGVyZm9ybWFuY2UgY291bnRlcnMgdG8gd2F0Y2ggaG93IG11Y2ggYmFuZHdp
ZHRoCj4gdXNlcnNwYWNlIGJhdGNoZXMvQ1MgYXJlIHdhc3RpbmcpLCBhbmQgSSBkb24ndCB0aGlu
ayB0aGUgdHRtIGV2aWN0aW9uCj4gbG9naWMgaXMgcmVhZHkgdG8gc3RlcCBvdmVyIGFsbCB0aGUg
cHJpb3JpdHkgaW52ZXJzaW9uIGlzc3VlcyB0aGlzIHdpbGwKPiBicmluZyB1cC4gTWFuYWdpbmcg
c2RtYSB1c2FnZSBvdG9oIHdpbGwgYmUgYSBsb3QgbW9yZSBzdHJhaWdodGZvcndhcmQgKGJ1dAo+
IHN0aWxsIGhhcyBhbGwgdGhlIHByaW9yaXR5IGludmVyc2lvbiBwcm9ibGVtcywgYnV0IGluIHRo
ZSBzY2hlZHVsZXIgdGhhdAo+IG1pZ2h0IGJlIGVhc2llciB0byBmaXggcGVyaGFwcyB3aXRoIHRo
ZSBleHBsaWNpdCBkZXBlbmRlbmN5IGdyYXBoIC0gaW4gdGhlCj4gaTkxNSBzY2hlZHVsZXIgd2Ug
YWxyZWFkeSBoYXZlIHByaW9yaXR5IGJvb3N0aW5nIGFmYWl1aSkuCk15IGNvbmNlcm4gd2l0aCBo
b29raW5nIGludG8gdGhlIGVuZ2luZS8gbG93ZXIgbGV2ZWwgaXMgdGhhdCB0aGUKZW5naW5lIG1h
eSBub3QgYmUgcHJvY2Vzcy9jZ3JvdXAgYXdhcmUuICBTbyB0aGUgYmFuZHdpZHRoIHRyYWNraW5n
IGlzCnBlciBkZXZpY2UuICBJIGFtIGFsc28gd29uZGVyaW5nIGlmIHRoaXMgaXMgYWxzbyBwb3Rl
bnRpYWxseSBiZSBhIGNhc2UKb2YgcGVyZmVjdCBnZXR0aW5nIGluIHRoZSB3YXkgb2YgZ29vZC4g
IFdoaWxlIHR0bV9ib19oYW5kbGVfbW92ZV9tZW0KbWF5IG5vdCB0cmFjayBldmVyeXRoaW5nLCBp
dCBpcyBzdGlsbCBhIGtleSBmdW5jdGlvbiBmb3IgYSBsb3Qgb2YgdGhlCm1lbW9yeSBvcGVyYXRp
b24uICBBbHNvLCBpZiB0aGUgcHJvZ3JhbW1pbmcgbW9kZWwgaXMgZGVzaWduZWQgdG8KYnlwYXNz
IHRoZSBrZXJuZWwgdGhlbiBJIGFtIG5vdCBzdXJlIGlmIHRoZXJlIGFyZSBhbnl0aGluZyB0aGUg
a2VybmVsCmNhbiBkby4gIChUaGluZ3MgbGlrZSBrZXJuZWwtYnlwYXNzIG5ldHdvcmsgc3RhY2sg
Y29tZXMgdG8gbWluZC4pICBBbGwKdGhhdCBzYWlkLCBJIHdpbGwgY2VydGFpbmx5IGRpZyBkZWVw
ZXIgaW50byB0aGUgdG9waWMuCgpSZWdhcmRzLApLZW5ueQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
