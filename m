Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA11A93FD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247D06E856;
	Wed, 15 Apr 2020 07:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61526E591
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 21:18:26 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q22so1451167ljg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 14:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g8YK8Lbyd3hvMNISbiGFEPKMhHRXs5WoA60P149Mcrg=;
 b=cErN2yOHH5SBoupwFvHZogLHDfIKyyYE4LjQNM7u+2LIgcwcJxP4PSNVBXTTZKN+Wr
 XALSVvkRqv6okm2cNEKWANnEGAd04xTBZxxzTHHzNLYwKXttjUEQtuGmfn+6OtiikQQn
 uu28iqF6RwrfbJFMMdD9jR4/MNlbmpk6TNAcFEWDBi0iWHvhb7Gr6bYc2dmd/C0zufCA
 eAjfslZNIN0Pnlx6ZDmDQ8rYjhmNuP8R6YnnWeld9LeXjN4COFVRIi6xDh5iKIORhBb1
 K3/ipwo9jcqCRpqTfoVhMVdA5TehmCIIfh5DcxstBFT9XUzJtYi43aG1F0jaI/CpwLTc
 kQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g8YK8Lbyd3hvMNISbiGFEPKMhHRXs5WoA60P149Mcrg=;
 b=MiE8skOFrEpCvc5Fw+e42OD4yjRYR4OCs+FDPqBpiun2vKNrauf+dS+UNH9YFXqP1w
 B04jTJGjB56tDmMOQLOwYg6Zy6keMt3bOIBGu0wyxeLVFX46ngsvcWV5OVhnrpdK7NtT
 /ur6yaCHM9x1uXvw94tdKQz1QROaBx07sEMfUBM27Hdx0Idt7jPxVy7dUK1Yq9m65RZm
 SanKiUxQwR7YQ6TKRBNBVBpONTVM58EnhzmcjqDfnrHhros7r4umBbArVeJzTfGV465F
 ohwARgrm4TA4qdU/cq6Y+vEzqusctbQBTKeIsvnlLvae/bhpxGi+nAvSlU2a3sgdoiJA
 cbPg==
X-Gm-Message-State: AGi0PubaIYmLKo6TjYF48sUSYSga198pXnsgHuSKJmVTfeIBwKkArH2S
 OO0MiaBT94++NymVNKCmTJI=
X-Google-Smtp-Source: APiQypIKJXbnoz9FpvP6EK0YwaiUXODte4gWCNlr6uzGHBOxnFXozla9YJ9UIMYj5jKlBwyZTkT7eA==
X-Received: by 2002:a2e:85da:: with SMTP id h26mr1211049ljj.260.1586899104864; 
 Tue, 14 Apr 2020 14:18:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id n9sm9686106ljo.89.2020.04.14.14.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 14:18:24 -0700 (PDT)
Subject: Re: [PATCH v10 0/2] Panel rotation patches
To: "dbasehore ." <dbasehore@chromium.org>
References: <20200306002112.255361-1-dbasehore@chromium.org>
 <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com>
 <CAGAzgsqpjZxh7PEL_Dy7HrFeFGm7+=F6cL3QG9KmK9CHvDWZ9g@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6dc9ef16-9671-6ce8-27e6-aa1f4c009ee2@gmail.com>
Date: Wed, 15 Apr 2020 00:18:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAGAzgsqpjZxh7PEL_Dy7HrFeFGm7+=F6cL3QG9KmK9CHvDWZ9g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTQuMDQuMjAyMCAyMjozMiwgZGJhc2Vob3JlIC4g0L/QuNGI0LXRgjoKPiBIaSBEbWl0cnksIHNv
cnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KPiAKPiBPbiBTdW4sIE1hciA4LCAyMDIwIGF0IDEyOjI1
IFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IDA2LjAz
LjIwMjAgMDM6MjEsIERlcmVrIEJhc2Vob3JlINC/0LjRiNC10YI6Cj4+PiBUaGlzIGFkZHMgdGhl
IHBsdW1iaW5nIGZvciByZWFkaW5nIHBhbmVsIHJvdGF0aW9uIGZyb20gdGhlIGRldmljZXRyZWUK
Pj4+IGFuZCBzZXRzIHVwIGFkZGluZyBhIHBhbmVsIHByb3BlcnR5IGZvciB0aGUgcGFuZWwgb3Jp
ZW50YXRpb24gb24KPj4+IE1lZGlhdGVrIFNvQ3Mgd2hlbiBhIHJvdGF0aW9uIGlzIHByZXNlbnQu
Cj4+Cj4+IEhlbGxvIERlcmVrIGFuZCBldmVyeW9uZSwKPj4KPj4gSSdtIGxvb2tpbmcgYXQgYWRk
aW5nIGRpc3BsYXkgcm90YXRpb24gc3VwcG9ydCB0byBOVklESUEgVGVncmEgRFJNCj4+IGRyaXZl
ciBiZWNhdXNlIHNvbWUgZGV2aWNlcyBoYXZlIGRpc3BsYXkgcGFuZWwgcGh5c2ljYWxseSBtb3Vu
dGVkCj4+IHVwc2lkZS1kb3duLCBhbmQgdGh1cywgZGlzcGxheSBjb250cm9sbGVyJ3Mgc2Nhbi1v
dXQgbmVlZHMgdG8gYmUgcm90YXRlZAo+PiBieSAxODDCsCBpbiB0aGlzIGNhc2UuCj4+Cj4+IERl
cmVrLCB5b3VycyBwYW5lbC1yb3RhdGlvbiBwYXRjaGVzIGFkZCBzdXBwb3J0IGZvciBhc3NpZ25p
bmcgcGFuZWwncwo+PiBvcmllbnRhdGlvbiB0byB0aGUgY29ubmVjdG9yLCBidXQgdGhlbiBvbmx5
IHByaW1hcnkgZGlzcGxheSBwbGFuZQo+PiByZWNlaXZlcyByb3RhdGlvbiB2YWx1ZSBpbiBbMV0s
IHdoaWxlIHJvdGF0aW9uIG5lZWRzIHRvIGJlIGFwcGxpZWQgdG8KPj4gYWxsIGF2YWlsYWJsZSBv
dmVybGF5L2N1cnNvciBwbGFuZXMgYW5kIHRoaXMgc2hvdWxkIGhhcHBlbiBpbiBvdGhlcgo+PiBw
bGFjZXMgdGhhbiBbMV0gYXMgd2VsbC4KPiAKPiBUaGlzIGlzIGludGVuZGVkLiBXZSBkb24ndCBj
b3JyZWN0IHRoZSBvdXRwdXQgaW4gdGhlIGtlcm5lbC4gV2UKPiBpbnN0ZWFkIHJlbHkgb24gbm90
aWZ5aW5nIHVzZXJzcGFjZSB0aGF0IHRoZSBwYW5lbCBpcyByb3RhdGVkLCB0aGVuIHdlCj4gaGFu
ZGxlIGl0IHRoZXJlLgo+IAo+Pgo+PiBbMV0gZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9t
aWMoKQo+Pgo+PiBQbGVhc2UgYWxzbyBub3RlIHRoYXQgaW4gYSBjYXNlIG9mIHRoZSBzY2FuLW91
dCByb3RhdGlvbiwgcGxhbmUncwo+PiBjb29yZGluYXRlcyBuZWVkIHRvIGJlIGNoYW5nZWQgaW4g
YWNjb3JkYW5jZSB0byB0aGUgZGlzcGxheSdzIHJvdGF0aW9uLgo+Pgo+PiBJIGxvb2tlZCBicmll
Zmx5IHRocm91Z2ggdGhlIERSTSBjb2RlIGFuZCBteSB1bmRlcnN0YW5kaW5nIHRoYXQgdGhlIERS
TQo+PiBjb3JlIGN1cnJlbnRseSBkb2Vzbid0IHN1cHBvcnQgdXNlLWNhc2Ugd2hlcmUgc2Nhbi1v
dXQgbmVlZHMgdG8gcm90YXRlZAo+PiBiYXNlZCBvbiBhIHBhbmVsJ3Mgb3JpZW50YXRpb24sIGNv
cnJlY3Q/IElzIGl0IHRoZSB1c2UtY2FzZSB5b3UncmUKPj4gd29ya2luZyBvbiBmb3IgdGhlIE1l
ZGlhdGVrIGRyaXZlcj8KPiAKPiBZZXMsIHdlIHJlbHkgb24gdXNlcnNwYWNlIHRvIHJvdGF0ZSB0
aGUgb3V0cHV0LiBUaGUgbWFqb3IgcmVhc29uIGZvcgo+IHRoaXMgaXMgYmVjYXVzZSB0aGVyZSBt
YXkgbm90IGJlIGEgImZyZWUiIGhhcmR3YXJlIHJvdGF0aW9uIHRoYXQgY2FuCj4gYmUgYXBwbGll
ZCB0byB0aGUgb3ZlcmxheS4gU2VhbiBQYXVsIGFuZCBvdGhlcnMgYWxzbyBwcmVmZXJyZWQgdGhh
dAo+IHVzZXJzcGFjZSBjb250cm9sIHdoYXQgaXMgb3V0cHV0IHRvIHRoZSBzY3JlZW4gaW5zdGVh
ZCBvZiB0aGUga2VybmVsCj4gdGFraW5nIGNhcmUgb2YgaXQuIFRoaXMgY29kZSBqdXN0IGFkZHMg
dGhlIGRybSBwcm9wZXJ0eSB0byB0aGUgcGFuZWwuCj4gCgpDb3VsZCB5b3UgcGxlYXNlIGV4cGxh
aW4gd2hhdCB0aGF0IHVzZXJzcGFjZSBpcz8KCkFGQUlLLCB0aGluZ3MgbGlrZSBYb3JnIG1vZGVz
ZXR0aW5nIGRvbid0IHN1cHBvcnQgdGhhdCBvcmllbnRhdGlvbiBwcm9wZXJ0eS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
