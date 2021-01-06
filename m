Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777932EB8C4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 05:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989BA89DC0;
	Wed,  6 Jan 2021 04:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6867A89D30
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 04:01:07 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id v19so1307164pgj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 20:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=CDgibIGXx39qkCOF0q2QH8v6fPooZvCUIVM2zf27fD8=;
 b=qeoLhCDdXACcug+hWouvb2ciMc3eHVILMGrnA8aGNRjXEUVpnkgmmf29b+rpyCOfOI
 SWbz0/sxc2jXJXQLnWmOu+eUV1c6fI5JQRd9a71uhe3WIvGndWIk7LBSDrQ2nADW6w0i
 7saucOgvrLgJKeXXVWrROvjw6iXlL0XZyB8pXvcZWZHomh5BblelDvmuD2wvnSK/Fuks
 4C62SCiZB42VmW+Z7D8+QuvZtsefOk+ViBd9wOljAw0oHc6BZtluOunbBEQpe0A1u0BO
 DIDB7WPtklVmYgAyyh4wIEnrbFkJKUcYpzjCLy/X1HhST27fO8CDQIRRIYxjZMWOM1D7
 eewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=CDgibIGXx39qkCOF0q2QH8v6fPooZvCUIVM2zf27fD8=;
 b=LfCE3lYmi6lh3y+ZbNMOt7MbNc9KTjw5XJBgiADsUFvHyU/YGknIV5YTejoLTtl12d
 d6oNyWUFftMCS67BVPmT/4utQsAnurFcDRCIeH4yXFwj6rpHZlPN9rJwajWcawUOGQaN
 qJp7lzPgi7gX8jgt4ToZ7gdsFLZmk/weww/WkySG19wemjnlswWCp08TyXdMg6Cd4xv4
 st8+sfLQ06Uzg4f6iV82G/L/RzyvKEkqhC9QSAAvf8kzO45BklIsBKuUdWxn24f+ov0+
 tGqd1lIbKqlDZoiNyQvMyTSWeeJ57U19FmUIH3fYTdAoVuKPQyJyJeN4PHWpayrztb8b
 6cnQ==
X-Gm-Message-State: AOAM533PcvhwrHbOH38Ht8EiDlsl5ykCa0WHLfoi8lJpRY773zQ9UaaT
 BlJrmIbK3+fFO+znHCUkV5M=
X-Google-Smtp-Source: ABdhPJxqgLRO5Mr15qaTpgdAQYSSIU2N9VASQCQTOX7qOcwJOzPyXYrSiSyhVR4YnH18RM9+k7pxLg==
X-Received: by 2002:aa7:9afb:0:b029:19e:45d8:b102 with SMTP id
 y27-20020aa79afb0000b029019e45d8b102mr1977624pfp.48.1609905666975; 
 Tue, 05 Jan 2021 20:01:06 -0800 (PST)
Received: from [192.168.1.8] (50-47-106-83.evrt.wa.frontiernet.net.
 [50.47.106.83])
 by smtp.gmail.com with ESMTPSA id 17sm647234pgy.53.2021.01.05.20.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 20:01:05 -0800 (PST)
Message-ID: <84e09e65b831ba6d3017a6ca9be039005b24e793.camel@gmail.com>
Subject: Re: [PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 05 Jan 2021 20:01:04 -0800
In-Reply-To: <8ff4bd88-6e98-3db5-232d-98ce2c370cd1@suse.de>
References: <20210102060336.832866-1-drawat.floss@gmail.com>
 <2b49fcd2-38f7-dae5-2992-721a8bd142a2@suse.de>
 <4f7818f99734c0912325e1f3b6b80cb2a04df3ef.camel@gmail.com>
 <ec340e8e-6386-d582-c93b-0a35c60f9dca@suse.de>
 <20210105110438.zhy22zzqfgbnonos@sirius.home.kraxel.org>
 <8ff4bd88-6e98-3db5-232d-98ce2c370cd1@suse.de>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
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
Cc: linux-hyperv@vger.kernel.org, Wei Hu <weh@microsoft.com>,
 Tang Shaofeng <shaofeng.tang@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIxLTAxLTA1IGF0IDEyOjMwICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToKPiBIaQo+IAo+IEFtIDA1LjAxLjIxIHVtIDEyOjA0IHNjaHJpZWIgR2VyZCBIb2ZmbWFubjoK
PiA+IMKgwqAgSGksCj4gPiAKPiA+ID4gPiBJdCdzIG5vdCBwb3NzaWJsZSB0byBkbyBwYWdlIGZs
aXAgd2l0aCB0aGlzIHZpcnR1YWwgZGV2aWNlLiBUaGUKPiA+ID4gPiBjYWxsIHRvCj4gPiA+ID4g
U1lOVEhWSURfVlJBTV9MT0NBVElPTiBpcyBvbmx5IGhvbm91cmVkIG9uY2UuIFNvIHVuZm9ydHVu
YXRlbHkKPiA+ID4gPiBuZWVkIHRvCj4gPiA+ID4gdXNlIFNITUVNIGhlbHBlcnMuCj4gPiA+IAo+
ID4gPiBJIHdhcyB0aGlua2luZyBhYm91dCB1c2luZyBzdHJ1Y3QKPiA+ID4gdmlkZW9fb3V0cHV0
X3NpdHVhdGlvbi52cmFtX29mZnNldDsgaW4KPiA+ID4gY2FzZSB5b3Ugd2FudCB0byB0aW5rZXIg
d2l0aCB0aGF0LiBUaGVyZSdzIGEgY29tbWVudCBpbiB0aGUgcGF0Y2gKPiA+ID4gdGhhdAo+ID4g
PiB2cmFtX29mZnNldCBzaG91bGQgYWx3YXlzIGJlIDAuIEJ1dCB0aGlzIGNvbW1lbnQgc2VlbXMg
aW5jb3JyZWN0Cj4gPiA+IGZvciBkZXZpY2VzCj4gPiA+IHdpdGggbW9yZSB0aGFuIG9uZSBvdXRw
dXQuCj4gPiAKPiA+IFdoZXJlIGRvZXMgdGhlIGNvbW1lbnQgY29tZSBmcm9tP8KgIGZiZGV2IGRy
aXZlcnMgc3VwcG9ydCBhIHNpbmdsZQo+ID4gZnJhbWVidWZmZXIgb25seSBzbyBmb3IgYSBmYmRl
diBkcml2ZXIgaXQgbWFrZXMgc2Vuc2UgdG8gc2V0IHRoZQo+ID4gb2Zmc2V0Cj4gPiB0byAwIHVu
Y29uZGl0aW9uYWxseS7CoCBXaXRoIGRybSB5b3UgcHJvYmFibHkgY2FuIGhhbmRsZSB0aGluZ3MK
PiA+IGRpZmZlcmVudGx5IC4uLgo+IAo+IEkgY2Fubm90IGZpbmQgaXQgaW4gaHlwZXJ2X2ZiLmM7
IGl0IG11c3QgaGF2ZSBnb3R0ZW4gaW50cm9kdWNlZCBoZXJlLgo+IAo+IE9ubHkgb25lIGRpc3Bs
YXkgaXMgc3VwcG9ydGVkIGJ5IHRoaXMgRFJNIGRyaXZlciwgc28gdGhlIGNvbW1lbnQgaXMgCj4g
Y29ycmVjdC4gSW4gdGhlIGZ1dHVyZSwgaGF2aW5nIHN1cHBvcnQgZm9yIG11bHRpcGxlIGRpc3Bs
YXlzIG1pZ2h0IGJlCj4gYW4gCj4gb3B0aW9uLgo+IAo+IAoKQmVzaWRlIHRoYXQgb2Zmc2V0IHNo
b3VsZCBiZSAwLCBhbm90aGVyIHByb2JsZW0gaXMgdGhhdApTWU5USFZJRF9TSVRVQVRJT05fVVBE
QVRFIHdpbGwgY2F1c2UgdGhlIHdob2xlIHNjcmVlbiB0byBmbGlja2VyIChJCnN1cHBvc2UgdGhp
cyBjYWxsIGlzIG1vcmUgZm9yIGNoYW5naW5nIHJlc29sdXRpb24pLCBzbyBjYW4ndCByZWFsbHkg
dXNlCnRoaXMgZm9yIHBhZ2UtZmxpcC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
